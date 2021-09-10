Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857C04067F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 09:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhIJHse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 03:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhIJHsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 03:48:33 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763C6C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Sep 2021 00:47:22 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k23-20020a17090a591700b001976d2db364so882682pji.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Sep 2021 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SM4gxs9XjX0uBbpU8UEiIwwD+CDm0lpp+C8IphN8qTY=;
        b=XfXxMqnb/ez1gIo7dVeNiFQkM2ztbEv5x5lAO8RaoFR8VDlfPgFZymvDX4KsBTYOtO
         Tco5x/lVlygmW7mYCSihej026lHudEca0pCrCF8sb5o4ZckHWzc5l+65k8DynjxXXSaH
         Be7Hd7VFyPZjL1LiDL1zwmdvfgO0h31tSXAJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SM4gxs9XjX0uBbpU8UEiIwwD+CDm0lpp+C8IphN8qTY=;
        b=I6YmLhQUbvOz0UKs5r5bFGUCNFxLJUvi8C4LfL6AMsYXn9kHRP7BBfD4X4+01js9Jz
         +3Kiu5rGFV4uq0WR1mZ1KPWlHaNTTmXHnns6WiW9/bU+LwaCxAkd1FOiT9a1i9faNh7R
         gKx+U1uO+umpo5oKBf8uxeswcne6vzSGeqQc5bH3NOdaYRrV2NRr0qmTBkZfN9b/Lkjg
         f85r4XOrdHakCUHQAeyKdCBiqMb4TxyPhK6q7NyCwmfI5RPhkRSowPJP7GcWi2oS4M3B
         jyd9oL5xMEk+fZnNWqklq6Q9L22UHLYGd8d1y1Umru6u/Gc9H5MTheR41fFiRuenTrjb
         CAew==
X-Gm-Message-State: AOAM53234SNj8/005a9hSGsI8qLT5BoAdYaZibM+iAYJmDven+R84gIO
        /A5QzxrAdyw6ENyVbm/dnbE/xw==
X-Google-Smtp-Source: ABdhPJzzbFTvqEhkngPbSrojBBVkm7UY+A/nqb1uIBwa2bNJTfGdfsoUsy36m53Q2Qvuj1C6ETP2dQ==
X-Received: by 2002:a17:902:834b:b0:13a:347b:8a00 with SMTP id z11-20020a170902834b00b0013a347b8a00mr6444471pln.54.1631260041974;
        Fri, 10 Sep 2021 00:47:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c1fe:57b:eb6:58a5])
        by smtp.gmail.com with UTF8SMTPSA id bx2sm4110027pjb.35.2021.09.10.00.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 00:47:21 -0700 (PDT)
Date:   Fri, 10 Sep 2021 00:47:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Subject: Re: [PATCH v8] Bluetooth: btusb: Add support using different nvm for
 variant WCN6855 controller
Message-ID: <YTsNh+Y9eTD6id7e@google.com>
References: <1630641758-22281-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630641758-22281-1-git-send-email-zijuhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 03, 2021 at 12:02:38PM +0800, Zijun Hu wrote:
> From: Tim Jiang <tjiang@codeaurora.org>
> 
> the RF perfermance of wcn6855 soc chip from different foundries will be

as Marcel commented on a previous version: 'perfermence' => 'performance'

> difference, so we should use different nvm to configure them.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>

For the third time, you should also add your own 'Signed-off-by' tag, i.e.
'Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>'

If you have any doubts about comments you receive ask for clarification,
just ignoring them generally won't satisfy your reviewers.

> ---
>  drivers/bluetooth/btusb.c | 50 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 928cbfa4c42d..0f5d2222d624 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3161,6 +3161,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
>  #define QCA_DFU_TIMEOUT		3000
>  #define QCA_FLAG_MULTI_NVM      0x80
>  
> +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
> +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
> +
>  struct qca_version {
>  	__le32	rom_version;
>  	__le32	patch_version;
> @@ -3192,6 +3195,7 @@ static const struct qca_device_info qca_devices_table[] = {
>  	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
>  	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
>  	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
> +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
>  };
>  
>  static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
> @@ -3346,6 +3350,31 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>  	return err;
>  }
>  
> +static void btusb_generate_qca_nvm_name(char *fwname,
> +					size_t max_size,
> +					struct qca_version *ver,
> +					char *variant)

The variant parameter should probably be removed (see coment below), if it is
kept it should be 'const char *'.

> +{
> +	char *sep = (strlen(variant) == 0) ? "" : "_";
> +	u16 board_id = le16_to_cpu(ver->board_id);
> +	u32 rom_version = le32_to_cpu(ver->rom_version);
> +
> +	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> +		/* if boardid equal 0, use default nvm without suffix */

This comment isn't useful, please remove it.

Ok, it was already in btusb_setup_qca_load_nvm(), but still it's a
good opportunity to remove it.

> +		if (board_id == 0x0) {

Just use '0' instead of the single digit hex number.

> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s.bin",
> +				rom_version, sep, variant);
> +		} else {
> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s_%04x.bin",
> +				rom_version, sep, variant, board_id);
> +		}
> +	} else {
> +		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin",
> +			rom_version);
> +	}
> +

delete empty line

> +}
> +
>  static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
>  				    struct qca_version *ver,
>  				    const struct qca_device_info *info)
> @@ -3354,19 +3383,14 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
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
> +	switch (ver->ram_version) {
> +	case WCN6855_2_0_RAM_VERSION_GF:
> +	case WCN6855_2_1_RAM_VERSION_GF:
> +			btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "gf");
> +		break;
> +	default:
> +			btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "");
> +		break;

Actually it would make more sense to have the above switch statement in
btusb_generate_qca_nvm_name(), rather than passing the variant string.
