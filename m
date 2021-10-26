Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD8843ABE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 07:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235108AbhJZF4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 01:56:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57173 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhJZF4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 01:56:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635227618; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7oRZBa8uvbKECbg21UMpUF9P2BubMa4PGmCQdveSgGc=;
 b=YblKeCgUg0la/147bMRHoiKO6P3wfUHUg6dJ/6i7z7plgMObjts8BqnDF2IYUounUE3f3rN5
 BeluDjhhdiJSdpqRFYw4XAjA3K1OF7+PN9yLzJZIGlitenDcIqJaBXAacGdBusIJ4th3Mx6K
 mTmCQmwu4ffJFyxCXRMwru1FhvQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 617797d267f107c61143394c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 05:53:22
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 013E3C4360C; Tue, 26 Oct 2021 05:53:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31240C4338F;
        Tue, 26 Oct 2021 05:53:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 26 Oct 2021 13:53:21 +0800
From:   tjiang@codeaurora.org
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: Re: [PATCH v3] Bluetooth: btusb: Add support for variant WCN6855 by
 using different nvm
In-Reply-To: <1d19afff955cdc8d47582297a26246d9@codeaurora.org>
References: <1d19afff955cdc8d47582297a26246d9@codeaurora.org>
Message-ID: <37ff4532d711face325be2f95d47f960@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Marcel:
   could you help review this patch as I resolved all comments from 
Matthias , thank you for the help.

regards.
tim


On 2021-10-22 13:35, tjiang@codeaurora.org wrote:
> the RF performance of wcn6855 soc chip from different foundries will be
> difference, so we should use different nvm to configure them.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
>  drivers/bluetooth/btusb.c | 55 
> +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 41 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 87b71740fad8..a5fe57e7cd7e 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3195,6 +3195,9 @@ static int btusb_set_bdaddr_wcn6855(struct 
> hci_dev *hdev,
>  #define QCA_DFU_TIMEOUT		3000
>  #define QCA_FLAG_MULTI_NVM      0x80
> 
> +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
> +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
> +
>  struct qca_version {
>  	__le32	rom_version;
>  	__le32	patch_version;
> @@ -3226,6 +3229,7 @@ static const struct qca_device_info
> qca_devices_table[] = {
>  	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
>  	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
>  	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
> +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
>  };
> 
>  static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 
> request,
> @@ -3380,6 +3384,42 @@ static int btusb_setup_qca_load_rampatch(struct
> hci_dev *hdev,
>  	return err;
>  }
> 
> +static void btusb_generate_qca_nvm_name(char *fwname,
> +					size_t max_size,
> +					const struct qca_version *ver)
> +{
> +	u32 rom_version = le32_to_cpu(ver->rom_version);
> +	u16 flag = le16_to_cpu(ver->flag);
> +
> +	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> +		u16 board_id = le16_to_cpu(ver->board_id);
> +		u32 ram_version = le32_to_cpu(ver->ram_version);
> +		const char *variant = NULL;
> +
> +		switch (ram_version) {
> +		case WCN6855_2_0_RAM_VERSION_GF:
> +		case WCN6855_2_1_RAM_VERSION_GF:
> +			variant = "_gf";
> +			break;
> +		default:
> +			variant = "";
> +			break;
> +		}
> +
> +		if (board_id == 0) {
> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s.bin",
> +				rom_version, variant);
> +		} else {
> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s_%04x.bin",
> +				rom_version, variant, board_id);
> +		}
> +	} else {
> +		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin",
> +			rom_version);
> +	}
> +
> +}
> +
>  static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
>  				    struct qca_version *ver,
>  				    const struct qca_device_info *info)
> @@ -3388,20 +3428,7 @@ static int btusb_setup_qca_load_nvm(struct 
> hci_dev *hdev,
>  	char fwname[64];
>  	int err;
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
> -	}
> +	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
> 
>  	err = request_firmware(&fw, fwname, &hdev->dev);
>  	if (err) {
