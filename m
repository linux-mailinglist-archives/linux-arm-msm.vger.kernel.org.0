Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AEC43B717
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 18:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbhJZQ1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 12:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237471AbhJZQ1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 12:27:00 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4F7C061234
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 09:24:34 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id o133so14802841pfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Oct 2021 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q7Maw+sMF3Q6N+ptoNDxzqCK96vnCGLnGzCFF2robfg=;
        b=GrlvUUDsDZCc4Noh/EpeKHDMxftQ31Xq7/gSooGwllD3Sl0nKzM5Otw5mVQyM3dqDR
         6h2SAjkMi0yojVE0Z9F0/IpE5nu5RnWJt33MQ1XpOj/Y8KkCLObUYsJjnJjX/SCSnvEb
         j0OBM7vNTetfxokbGlBbCwLr//JdztO7pwWMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q7Maw+sMF3Q6N+ptoNDxzqCK96vnCGLnGzCFF2robfg=;
        b=5M0h7DhUXZyqEDcKL+b6CsYwAre0Gfly42pKaY271FxCA2dor4OBZUv5Xio6Yl9Jl+
         51dSbwz8Uw+CxGtbduzpda1waKcvQ9ircpWe6pJ8dPyuErgsi1BBWYOJE4pCrhTbNO9t
         QHUCbW110k1La5vkV56AQxlBu/DCa0qtQpfxhxn/4GwfJU2yHTBRZMif4aIGFF3Ux+yc
         meQEETN373IhRy1sf84ocR1eaY2tcrhSt7CkaX0RTwNaOscgliiS4TxC49wvCYrvzyoX
         Glr4pLIGDZQUWjs2y4hEo1N01FC38QPphkEnSkrbAKZFnQ4Bv/mWtyeanFiK0uvneC51
         BjDA==
X-Gm-Message-State: AOAM533JjjlRHxI67gFrTs6udKvLWAnEmgHa4kwv4zXVQnzVnZ4yhrUe
        NFnRygV5R2bZ1tOhDoeDwK/KJA==
X-Google-Smtp-Source: ABdhPJyCY1M7KA9vxuG5wk3czomxfeK9zodk1ezqbTLfWzkoa0cpMyKyH69tTww+DJIHrT6KxsicOQ==
X-Received: by 2002:a63:8c4f:: with SMTP id q15mr15040959pgn.225.1635265473926;
        Tue, 26 Oct 2021 09:24:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8854:dee7:f36d:b5da])
        by smtp.gmail.com with UTF8SMTPSA id q6sm19344307pgc.1.2021.10.26.09.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 09:24:33 -0700 (PDT)
Date:   Tue, 26 Oct 2021 09:24:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     tjiang@codeaurora.org
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: Re: [PATCH v3] Bluetooth: btusb: Add support for variant WCN6855 by
 using different nvm
Message-ID: <YXgrwKUZwUWuWfG4@google.com>
References: <1d19afff955cdc8d47582297a26246d9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d19afff955cdc8d47582297a26246d9@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 22, 2021 at 01:35:38PM +0800, tjiang@codeaurora.org wrote:
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
> @@ -3195,6 +3195,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev
> *hdev,
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
>  static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
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

This assignement was introduced in v3, it isn't really useful since the
variable is always assigned to a value in the switch statement below.

btw, why did you reset the patch version numbers, earlier they went up
to v11? This is confusing, e.g. when someone mentions v3 of this patch,
are they referring to this version or to
https://patchwork.kernel.org/project/bluetooth/patch/1628758216-3201-1-git-send-email-zijuhu@codeaurora.org/?

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
> @@ -3388,20 +3428,7 @@ static int btusb_setup_qca_load_nvm(struct hci_dev
> *hdev,
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
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a
> Linux Foundation Collaborative Project
