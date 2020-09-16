Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B7326C714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 20:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgIPSRM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 14:17:12 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36034 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbgIPSRK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 14:17:10 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6372ECED04;
        Wed, 16 Sep 2020 16:34:38 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v1] Bluetooth: Use NVM files based on SoC ID for WCN3991
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1600184605-31611-1-git-send-email-gubbaven@codeaurora.org>
Date:   Wed, 16 Sep 2020 16:27:41 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <A07A6C72-55B6-4DE6-BA4A-987ED4DB88E0@holtmann.org>
References: <1600184605-31611-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> This change will allow to use different NVM file based
> on WCN3991 BT SoC ID.Need to use different NVM file based on
> fab location for WCN3991 BT SoC.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/btqca.c   | 41 +++++++++++++++++++++++++----------------
> drivers/bluetooth/btqca.h   | 13 ++++++++-----
> drivers/bluetooth/hci_qca.c | 11 +++++------
> 3 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index ce9dcff..a7e72f1 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -14,12 +14,11 @@
> 
> #define VERSION "0.1"
> 
> -int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
> +int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
> 			 enum qca_btsoc_type soc_type)
> {
> 	struct sk_buff *skb;
> 	struct edl_event_hdr *edl;
> -	struct qca_btsoc_version *ver;
> 	char cmd;
> 	int err = 0;
> 	u8 event_type = HCI_EV_VENDOR;
> @@ -70,9 +69,9 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
> 	}
> 
> 	if (soc_type >= QCA_WCN3991)
> -		memmove(&edl->data, &edl->data[1], sizeof(*ver));
> -
> -	ver = (struct qca_btsoc_version *)(edl->data);
> +		memcpy(ver, &edl->data[1], sizeof(*ver));

any reason to use &edl->data[1] and not just edl->data + 1?

> +	else
> +		memcpy(ver, &edl->data, sizeof(*ver));
> 
> 	bt_dev_info(hdev, "QCA Product ID   :0x%08x",
> 		    le32_to_cpu(ver->product_id));
> @@ -83,13 +82,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
> 	bt_dev_info(hdev, "QCA Patch Version:0x%08x",
> 		    le16_to_cpu(ver->patch_ver));
> 
> -	/* QCA chipset version can be decided by patch and SoC
> -	 * version, combination with upper 2 bytes from SoC
> -	 * and lower 2 bytes from patch will be used.
> -	 */
> -	*soc_version = (le32_to_cpu(ver->soc_id) << 16) |
> -		       (le16_to_cpu(ver->rom_ver) & 0x0000ffff);
> -	if (*soc_version == 0)
> +	if (le32_to_cpu(ver->soc_id) == 0 || le16_to_cpu(ver->rom_ver) == 0)
> 		err = -EILSEQ;
> 
> out:
> @@ -446,15 +439,25 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
> EXPORT_SYMBOL_GPL(qca_set_bdaddr_rome);
> 
> int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> -		   enum qca_btsoc_type soc_type, u32 soc_ver,
> +		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> 		   const char *firmware_name)
> {
> 	struct qca_fw_config config;
> 	int err;
> 	u8 rom_ver = 0;
> +	u32 soc_ver;
> 
> 	bt_dev_dbg(hdev, "QCA setup on UART");
> 
> +	/* QCA chipset version can be decided by patch and SoC
> +	 * version, combination with upper 2 bytes from SoC
> +	 * and lower 2 bytes from patch will be used.
> +	 */
> +	soc_ver = (le32_to_cpu(ver.soc_id) << 16) |
> +		       (le16_to_cpu(ver.rom_ver) & 0x0000ffff);

Please indent this properly.

I am also confused about the 0x0000ffff since it is just 16-bit value in the first place. Also where do you want to shift the 32-bit value to.

Frankly, I find all this version magic kinda questionable.

> +
> +	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
> +
> 	config.user_baud_rate = baudrate;
> 
> 	/* Download rampatch file */
> @@ -491,9 +494,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> 	if (firmware_name)
> 		snprintf(config.fwname, sizeof(config.fwname),
> 			 "qca/%s", firmware_name);
> -	else if (qca_is_wcn399x(soc_type))
> -		snprintf(config.fwname, sizeof(config.fwname),
> -			 "qca/crnv%02x.bin", rom_ver);
> +	else if (qca_is_wcn399x(soc_type)) {
> +		if (ver.soc_id == QCA_WCN3991_SOC_ID) {
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/crnv%02xu.bin", rom_ver);
> +		} else {
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/crnv%02x.bin", rom_ver);
> +		}
> +	}
> 	else if (soc_type == QCA_QCA6390)
> 		snprintf(config.fwname, sizeof(config.fwname),
> 			 "qca/htnv%02x.bin", rom_ver);
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index d81b74c..d01a9f5 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -34,6 +34,8 @@
> #define QCA_HCI_CC_OPCODE		0xFC00
> #define QCA_HCI_CC_SUCCESS		0x00
> 
> +#define QCA_WCN3991_SOC_ID		(0x40014320)
> +
> enum qca_baudrate {
> 	QCA_BAUDRATE_115200 	= 0,
> 	QCA_BAUDRATE_57600,
> @@ -136,9 +138,9 @@ enum qca_btsoc_type {
> 
> int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
> int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> -		   enum qca_btsoc_type soc_type, u32 soc_ver,
> +		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> 		   const char *firmware_name);
> -int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
> +int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
> 			 enum qca_btsoc_type);
> int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
> int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
> @@ -155,13 +157,14 @@ static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdad
> }
> 
> static inline int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> -				 enum qca_btsoc_type soc_type, u32 soc_ver,
> -				 const char *firmware_name)
> +		enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> +				const char *firmware_name)

Please use proper indentation.

> {
> 	return -EOPNOTSUPP;
> }
> 
> -static inline int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
> +static inline int qca_read_soc_version(struct hci_dev *hdev,
> +				       struct qca_btsoc_version *ver,
> 				       enum qca_btsoc_type)
> {
> 	return -EOPNOTSUPP;
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 244b8fe..4c32c60 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1649,7 +1649,7 @@ static int qca_setup(struct hci_uart *hu)
> 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
> 	const char *firmware_name = qca_get_firmware_name(hu);
> 	int ret;
> -	int soc_ver = 0;
> +	struct qca_btsoc_version ver;
> 
> 	ret = qca_check_speeds(hu);
> 	if (ret)
> @@ -1678,7 +1678,7 @@ static int qca_setup(struct hci_uart *hu)
> 	if (qca_is_wcn399x(soc_type)) {
> 		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
> 
> -		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
> +		ret = qca_read_soc_version(hdev, &ver, soc_type);
> 		if (ret)
> 			return ret;
> 	} else {
> @@ -1697,15 +1697,14 @@ static int qca_setup(struct hci_uart *hu)
> 
> 	if (!qca_is_wcn399x(soc_type)) {
> 		/* Get QCA version information */
> -		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
> +		ret = qca_read_soc_version(hdev, &ver, soc_type);
> 		if (ret)
> 			return ret;
> 	}
> 
> -	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
> 	/* Setup patch / NVM configurations */
> -	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, soc_ver,
> -			firmware_name);
> +	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
> +			     firmware_name);
> 	if (!ret) {
> 		set_bit(QCA_IBS_ENABLED, &qca->flags);
> 		qca_debugfs_init(hdev);

Regards

Marcel

