Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDFD3E1686
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 16:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241526AbhHEOKP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Thu, 5 Aug 2021 10:10:15 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59748 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237597AbhHEOKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 10:10:15 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6D03BCECF1;
        Thu,  5 Aug 2021 16:09:59 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v2] Bluetooth: btusb: Add support different nvm to
 distinguish different factory for WCN6855 controller
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1628152661-5669-1-git-send-email-zijuhu@codeaurora.org>
Date:   Thu, 5 Aug 2021 16:09:58 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>, tjiang@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <39D59603-402F-4B5E-869E-F4852D06EB62@holtmann.org>
References: <1628152661-5669-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> we have different factory to produce wcn6855 soc chip, so we should
> use different nvm file with suffix to distinguish them.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 60 +++++++++++++++++++++++++++++++++++++----------
> 1 file changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index b1a05bb9f4bf..18b1ef2497ec 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4013,6 +4013,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
> #define QCA_DFU_TIMEOUT		3000
> #define QCA_FLAG_MULTI_NVM      0x80
> 
> +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
> +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
> +
> struct qca_version {
> 	__le32	rom_version;
> 	__le32	patch_version;
> @@ -4044,6 +4047,7 @@ static const struct qca_device_info qca_devices_table[] = {
> 	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
> 	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
> 	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
> +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
> };
> 
> static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
> @@ -4198,6 +4202,42 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
> 	return err;
> }
> 
> +static int btusb_setup_qca_form_nvm_name(char **fwname,
> +					int max_size,
> +					struct qca_version *ver,
> +					char *factory)
> +{
> +	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> +		/* if boardid equal 0, use default nvm without suffix */
> +		if (le16_to_cpu(ver->board_id) == 0x0) {
> +			/* we add suffix factory to distinguish with different factory. */
> +			if (factory != NULL) {

the coding style is if (!factory) btw.

> +				snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%s.bin",
> +					 le32_to_cpu(ver->rom_version),
> +					 factory);
> +			} else {
> +				snprintf(*fwname, max_size, "qca/nvm_usb_%08x.bin",
> +					 le32_to_cpu(ver->rom_version));
> +			}
> +		} else {
> +			if (factory != NULL) {
> +				snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%s_%04x.bin",
> +					le32_to_cpu(ver->rom_version),
> +					factory,
> +					le16_to_cpu(ver->board_id));
> +			} else {
> +				snprintf(*fwname, max_size, "qca/nvm_usb_%08x_%04x.bin",
> +					le32_to_cpu(ver->rom_version),
> +					le16_to_cpu(ver->board_id));
> +			}
> +		}
> +	} else {
> +		snprintf(*fwname, max_size, "qca/nvm_usb_%08x.bin",
> +			 le32_to_cpu(ver->rom_version));
> +	}
> +
> +}
> +

I still don’t like the nested ifs here. Can you not just figure out something simpler. Something like a table as I mentioned in my previous review.

> static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> 				    struct qca_version *ver,
> 				    const struct qca_device_info *info)
> @@ -4206,19 +4246,13 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
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
> +		btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, "gf");
> +		break;
> +	default:
> +		btusb_setup_qca_form_nvm_name(&fwname, sizeof(fwname), ver, NULL);

This is missing a break.

> 	}
> 
> 	err = request_firmware(&fw, fwname, &hdev->dev);

Regards

Marcel

