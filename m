Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB98417018
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 12:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245610AbhIXKMc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 06:12:32 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57515 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245570AbhIXKMQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 06:12:16 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 88517CECF2;
        Fri, 24 Sep 2021 12:10:41 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v10] Bluetooth: btusb: Add support using different nvm for
 variant WCN6855 controller
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1631614096-24613-1-git-send-email-zijuhu@codeaurora.org>
Date:   Fri, 24 Sep 2021 12:10:41 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <C7D16218-F9EF-4CF3-AFE1-C8589A8810D5@holtmann.org>
References: <1631614096-24613-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> the RF performance of wcn6855 soc chip from different foundries will be
> difference, so we should use different nvm to configure them.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 50 +++++++++++++++++++++++++++++++++++------------
> 1 file changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 928cbfa4c42d..6dc645698e30 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3161,6 +3161,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
> #define QCA_DFU_TIMEOUT		3000
> #define QCA_FLAG_MULTI_NVM      0x80
> 
> +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
> +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
> +
> struct qca_version {
> 	__le32	rom_version;
> 	__le32	patch_version;
> @@ -3192,6 +3195,7 @@ static const struct qca_device_info qca_devices_table[] = {
> 	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
> 	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
> 	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
> +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
> };
> 
> static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
> @@ -3346,6 +3350,31 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
> 	return err;
> }
> 
> +static void btusb_generate_qca_nvm_name(char *fwname,
> +					size_t max_size,
> +					struct qca_version *ver,
> +					char *variant)
> +{

you are really not listening to review feedback. Use “const char *variant”.

> +	char *sep = (strlen(variant) == 0) ? "" : "_";

This is crazy.

> +	u16 board_id = le16_to_cpu(ver->board_id);
> +	u32 rom_version = le32_to_cpu(ver->rom_version);
> +
> +	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> +		/* if boardid equal 0, use default nvm without suffix */
> +		if (board_id == 0x0) {
> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s.bin",
> +				rom_version, sep, variant);

			“qca/nvm_usb_%08x%s.bin”

> +		} else {
> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s_%04x.bin",
> +				rom_version, sep, variant, board_id);

			""qca/nvm_usb_%08x%s_%04x.bin"
			
> +		}
> +	} else {
> +		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin",
> +			rom_version);
> +	}
> +
> +}
> +
> static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> 				    struct qca_version *ver,
> 				    const struct qca_device_info *info)
> @@ -3354,19 +3383,14 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> 	char fwname[64];
> 	int err;
> 
> -	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		/* if boardid equal 0, use default nvm without surfix */
> -		if (le16_to_cpu(ver->board_id) == 0x0) {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> -				 le32_to_cpu(ver->rom_version));
> -		} else {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> -				le32_to_cpu(ver->rom_version),
> -				le16_to_cpu(ver->board_id));
> -		}
> -	} else {
> -		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> -			 le32_to_cpu(ver->rom_version));
> +	switch (ver->ram_version) {
> +	case WCN6855_2_0_RAM_VERSION_GF:
> +	case WCN6855_2_1_RAM_VERSION_GF:
> +		btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "gf");

			“_gf”

> +		break;
> +	default:
> +		btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "");

			“”

> +		break;
> 	}
> 
> 	err = request_firmware(&fw, fwname, &hdev->dev);

Regards

Marcel

