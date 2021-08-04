Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464E23E039F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 16:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237625AbhHDOqF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 4 Aug 2021 10:46:05 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60335 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237576AbhHDOqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 10:46:05 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id 25D74CECD5;
        Wed,  4 Aug 2021 16:45:51 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v1] Bluetooth: btusb: Add support different nvm to
 distinguish different factory for WCN6855 controller
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1628071467-27190-1-git-send-email-zijuhu@codeaurora.org>
Date:   Wed, 4 Aug 2021 16:45:50 +0200
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
Message-Id: <E0AC7312-A8BD-4950-9589-E5E2A1B45A8E@holtmann.org>
References: <1628071467-27190-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> we have different factory to produce wcn6855 soc chip, so we should use
> different nvm file with surfix to distinguish them.

I think you mean suffix and not surfix.

> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 30 +++++++++++++++++++++++++-----
> 1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index b1a05bb9f4bf..cc9618575ab4 100644
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
> @@ -4209,12 +4213,28 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> 	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> 		/* if boardid equal 0, use default nvm without surfix */
> 		if (le16_to_cpu(ver->board_id) == 0x0) {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> -				 le32_to_cpu(ver->rom_version));
> +			/* if ram version is for gf factory, we should add surfix gf to
> +			 * distinguish with default one .
> +			 */
> +			if (ver->ram_version == WCN6855_2_0_RAM_VERSION_GF ||
> +					ver->ram_version == WCN6855_2_1_RAM_VERSION_GF) {

You need fix the coding style for multi-line if-clauses.

> +				snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_gf.bin",
> +					 le32_to_cpu(ver->rom_version));
> +			} else {
> +				snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> +					 le32_to_cpu(ver->rom_version));
> +			}
> 		} else {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> -				le32_to_cpu(ver->rom_version),
> -				le16_to_cpu(ver->board_id));
> +			if (ver->ram_version == WCN6855_2_0_RAM_VERSION_GF ||
> +					ver->ram_version == WCN6855_2_1_RAM_VERSION_GF) {
> +				snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_gf_%04x.bin",
> +					le32_to_cpu(ver->rom_version),
> +					le16_to_cpu(ver->board_id));
> +			} else {
> +				snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> +					le32_to_cpu(ver->rom_version),
> +					le16_to_cpu(ver->board_id));
> +			}
> 		}

That said, can you just sit down and re-think this code. I am pretty sure there will be another factory at some point and then this code becomes too complex. Check if you could use a table for this.

Regards

Marcel

