Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69455186E20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731877AbgCPPEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:04:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:62818 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731857AbgCPPEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:04:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584371059; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hazSkGYEo9mkfjzHb1zJmqtPYkhQiaXjENU6wk6AD+0=;
 b=wamObbgockkgnFyxvF+XVBFaJwNCLjeGySEOxm1Db4uTNEpHMLS4719/EkSmKGFGYJss+x5x
 /+qwl4lBobQrJYNAHtmW3pwhErmGV1nnelX0/dVBigo1utKjCC2a8ZuQ0gpK7S72W8/HCDfB
 GALw6Y5P2Ji9VMowwbYpUfsxp9o=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6f9567.7fd9ce58d810-smtp-out-n01;
 Mon, 16 Mar 2020 15:04:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3D9EC43637; Mon, 16 Mar 2020 15:04:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8BBBC433D2;
        Mon, 16 Mar 2020 15:04:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Mar 2020 20:34:05 +0530
From:   bgodavar@codeaurora.org
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, c-hbandi@codeaurora.org,
        hemantg@codeaurora.org, mka@chromium.org
Subject: Re: [PATCH v1 1/2] Bluetooth: hci_qca: Add support for Qualcomm
 Bluetooth SoC QCA6390
In-Reply-To: <20200314094328.3331-1-rjliao@codeaurora.org>
References: <20200314094328.3331-1-rjliao@codeaurora.org>
Message-ID: <77f651b52dbaae4d30aabfa361915eda@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-14 15:13, Rocky Liao wrote:
> This patch adds support for QCA6390, including the devicetree and acpi
> compatible hwid matching, and patch/nvm downloading.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c   | 44 +++++++++++++++++++++++++++++++----
>  drivers/bluetooth/btqca.h   |  8 +++++++
>  drivers/bluetooth/hci_qca.c | 46 +++++++++++++++++++++++++++++++------
>  3 files changed, 86 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index a16845c0751d..ca126e499c58 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -14,6 +14,9 @@
> 
>  #define VERSION "0.1"
> 
> +#define QCA_IS_3991_6390(soc_type)    \
> +	(soc_type == QCA_WCN3991 || soc_type == QCA_QCA6390)
> +

[Bala]: Why don't we do >= QCA_WCN3991 (mostly both the devices support 
same features)

>  int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>  			 enum qca_btsoc_type soc_type)
>  {
> @@ -32,7 +35,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32
> *soc_version,
>  	 * VSE event. WCN3991 sends version command response as a payload to
>  	 * command complete event.
>  	 */
> -	if (soc_type == QCA_WCN3991) {
> +	if (QCA_IS_3991_6390(soc_type)) {
>  		event_type = 0;
>  		rlen += 1;
>  		rtype = EDL_PATCH_VER_REQ_CMD;
> @@ -69,7 +72,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32
> *soc_version,
>  		goto out;
>  	}
> 
> -	if (soc_type == QCA_WCN3991)
> +	if (QCA_IS_3991_6390(soc_type))
>  		memmove(&edl->data, &edl->data[1], sizeof(*ver));
> 
>  	ver = (struct qca_btsoc_version *)(edl->data);
> @@ -138,6 +141,29 @@ int qca_send_pre_shutdown_cmd(struct hci_dev 
> *hdev)
>  }
>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
> 
> +int qca_send_enhancelog_enable_cmd(struct hci_dev *hdev)
> +{
> +	struct sk_buff *skb;
> +	int err;
> +	const u8 param[2] = {0x14, 0x01};

[Bala]: advisable to use MACRO's

> +
> +	bt_dev_dbg(hdev, "QCA enhanced log enable cmd");
> +
> +	skb = __hci_cmd_sync_ev(hdev, QCA_ENHANCED_LOG_ENABLE_CMD, 2,
> +				param, HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
> +
> +	if (IS_ERR(skb)) {
> +		err = PTR_ERR(skb);
> +		bt_dev_err(hdev, "Enhanced log enable cmd failed (%d)", err);
> +		return err;
> +	}
> +
> +	kfree_skb(skb);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qca_send_enhancelog_enable_cmd);
> +
>  static void qca_tlv_check_data(struct qca_fw_config *config,
>  		const struct firmware *fw, enum qca_btsoc_type soc_type)
>  {
> @@ -217,7 +243,7 @@ static void qca_tlv_check_data(struct qca_fw_config 
> *config,
>  				tlv_nvm->data[0] |= 0x80;
> 
>  				/* UART Baud Rate */
> -				if (soc_type == QCA_WCN3991)
> +				if (QCA_IS_3991_6390(soc_type))
>  					tlv_nvm->data[1] = nvm_baud_rate;
>  				else
>  					tlv_nvm->data[2] = nvm_baud_rate;
> @@ -268,7 +294,7 @@ static int qca_tlv_send_segment(struct hci_dev
> *hdev, int seg_size,
>  	 * VSE event. WCN3991 sends version command response as a payload to
>  	 * command complete event.
>  	 */
> -	if (soc_type == QCA_WCN3991) {
> +	if (QCA_IS_3991_6390(soc_type)) {
>  		event_type = 0;
>  		rlen = sizeof(*edl);
>  		rtype = EDL_PATCH_TLV_REQ_CMD;
> @@ -301,7 +327,7 @@ static int qca_tlv_send_segment(struct hci_dev
> *hdev, int seg_size,
>  		err = -EIO;
>  	}
> 
> -	if (soc_type == QCA_WCN3991)
> +	if (QCA_IS_3991_6390(soc_type))
>  		goto out;
> 
>  	tlv_resp = (struct tlv_seg_resp *)(edl->data);
> @@ -442,6 +468,11 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t 
> baudrate,
>  			    (soc_ver & 0x0000000f);
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/crbtfw%02x.tlv", rom_ver);
> +	} else if (soc_type == QCA_QCA6390) {
> +		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
> +			    (soc_ver & 0x0000000f);
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/htbtfw%02x.tlv", rom_ver);

[Bala]: This part we need to rethink to having to optimize.

ROME use: rampatch<>.tlv
WCN399x: uses cr<>.tlv
QCA6390: uses ht
tomorrow if some new chipset comes, it uses different name again a we 
need to handle this part.
i would suggest add this prefix to  "qca_bluetooth_of_match"
which can be passed as argument

>  	} else {
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/rampatch_%08x.bin", soc_ver);
> @@ -464,6 +495,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t 
> baudrate,
>  	else if (qca_is_wcn399x(soc_type))
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/crnv%02x.bin", rom_ver);
> +	else if (soc_type == QCA_QCA6390)
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/htnv%02x.bin", rom_ver);
>  	else
>  		snprintf(config.fwname, sizeof(config.fwname),
>  			 "qca/nvm_%08x.bin", soc_ver);
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index e16a4d650597..bc703817c3d7 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -14,6 +14,7 @@
>  #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
>  #define MAX_SIZE_PER_TLV_SEGMENT	(243)
>  #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
> +#define QCA_ENHANCED_LOG_ENABLE_CMD     (0xFC17)
> 
>  #define EDL_CMD_REQ_RES_EVT		(0x00)
>  #define EDL_PATCH_VER_RES_EVT		(0x19)
> @@ -127,6 +128,7 @@ enum qca_btsoc_type {
>  	QCA_WCN3990,
>  	QCA_WCN3991,
>  	QCA_WCN3998,
> +	QCA_QCA6390,
>  };
> 
>  #if IS_ENABLED(CONFIG_BT_QCA)
> @@ -139,6 +141,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32
> *soc_version,
>  			 enum qca_btsoc_type);
>  int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
>  int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
> +int qca_send_enhancelog_enable_cmd(struct hci_dev *hdev);
>  static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
>  {
>  	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3991 ||
> @@ -178,4 +181,9 @@ static inline int qca_send_pre_shutdown_cmd(struct
> hci_dev *hdev)
>  {
>  	return -EOPNOTSUPP;
>  }
> +
> +static inline int qca_send_enhancelog_enable_cmd(struct hci_dev *hdev)
> +{
> +	return -EOPNOTSUPP;
> +}
>  #endif
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 439392b1c043..0176264b0828 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -26,6 +26,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/acpi.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/serdev.h>
> @@ -1596,7 +1597,7 @@ static int qca_setup(struct hci_uart *hu)
>  	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
> 
>  	bt_dev_info(hdev, "setting up %s",
> -		qca_is_wcn399x(soc_type) ? "wcn399x" : "ROME");
> +		qca_is_wcn399x(soc_type) ? "wcn399x" : "ROME/QCA6390");
> 
>  retry:
>  	ret = qca_power_on(hdev);
> @@ -1639,6 +1640,12 @@ static int qca_setup(struct hci_uart *hu)
>  		qca_debugfs_init(hdev);
>  		hu->hdev->hw_error = qca_hw_error;
>  		hu->hdev->cmd_timeout = qca_cmd_timeout;
> +
> +		/* QCA6390 FW doesn't enable enhanced log by default
> +		 * need to send VSC to enable it
> +		 */
> +		if (soc_type == QCA_QCA6390)
> +			qca_send_enhancelog_enable_cmd(hdev);
>  	} else if (ret == -ENOENT) {
>  		/* No patch/nvm-config found, run with original fw/config */
>  		ret = 0;
> @@ -1665,10 +1672,10 @@ static int qca_setup(struct hci_uart *hu)
>  	}
> 
>  	/* Setup bdaddr */
> -	if (qca_is_wcn399x(soc_type))
> -		hu->hdev->set_bdaddr = qca_set_bdaddr;
> -	else
> +	if (soc_type == QCA_ROME)
>  		hu->hdev->set_bdaddr = qca_set_bdaddr_rome;
> +	else
> +		hu->hdev->set_bdaddr = qca_set_bdaddr;
> 
>  	return ret;
>  }
> @@ -1721,6 +1728,11 @@ static const struct qca_vreg_data
> qca_soc_data_wcn3998 = {
>  	.num_vregs = 4,
>  };
> 
> +static const struct qca_vreg_data qca_soc_data_qca6390 = {
> +	.soc_type = QCA_QCA6390,
> +	.num_vregs = 0,
> +};
> +
>  static void qca_power_shutdown(struct hci_uart *hu)
>  {
>  	struct qca_serdev *qcadev;
> @@ -1764,7 +1776,7 @@ static int qca_power_off(struct hci_dev *hdev)
>  	enum qca_btsoc_type soc_type = qca_soc_type(hu);
> 
>  	/* Stop sending shutdown command if soc crashes. */
> -	if (qca_is_wcn399x(soc_type)
> +	if (soc_type != QCA_ROME
>  		&& qca->memdump_state == QCA_MEMDUMP_IDLE) {
>  		qca_send_pre_shutdown_cmd(hdev);
>  		usleep_range(8000, 10000);
> @@ -1900,7 +1912,11 @@ static int qca_serdev_probe(struct serdev_device 
> *serdev)
>  			return err;
>  		}
>  	} else {
> -		qcadev->btsoc_type = QCA_ROME;
> +		if (data)
> +			qcadev->btsoc_type = data->soc_type;
> +		else
> +			qcadev->btsoc_type = QCA_ROME;
> +
>  		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
>  					       GPIOD_OUT_LOW);
>  		if (!qcadev->bt_en) {
> @@ -2044,21 +2060,37 @@ static int __maybe_unused qca_resume(struct 
> device *dev)
> 
>  static SIMPLE_DEV_PM_OPS(qca_pm_ops, qca_suspend, qca_resume);
> 
> +#ifdef CONFIG_OF
>  static const struct of_device_id qca_bluetooth_of_match[] = {
>  	{ .compatible = "qcom,qca6174-bt" },
> +	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
>  	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
>  	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id qca_bluetooth_acpi_match[] = {
> +	{ "QCOM6390", (kernel_ulong_t)&qca_soc_data_qca6390 },
> +	{ "DLA16390", (kernel_ulong_t)&qca_soc_data_qca6390 },
> +	{ "DLB16390", (kernel_ulong_t)&qca_soc_data_qca6390 },
> +	{ "DLB26390", (kernel_ulong_t)&qca_soc_data_qca6390 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, qca_bluetooth_acpi_match);
> +#endif
> +
> 
>  static struct serdev_device_driver qca_serdev_driver = {
>  	.probe = qca_serdev_probe,
>  	.remove = qca_serdev_remove,
>  	.driver = {
>  		.name = "hci_uart_qca",
> -		.of_match_table = qca_bluetooth_of_match,
> +		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
> +		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
>  		.pm = &qca_pm_ops,
>  	},
>  };
