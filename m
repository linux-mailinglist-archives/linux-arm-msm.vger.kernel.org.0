Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F031C3F5A89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 11:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbhHXJMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 05:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235473AbhHXJMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 05:12:46 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDBAC061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 02:12:02 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so1625417pje.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Er4YNjBc1rFmFqd3Av/AcvBAykcXzU4G4ouPUnYIVpc=;
        b=JfjPAfP7F0EP0oEH7hj6QbWGVgpzdohE3/ff5qvHH9r2ZxsrHiHzfexuU7hQTkzAY/
         UKUy/W/GGgjBnnwxZsTvALApXd7HF78F1GJa0Jt6b0goljcH7bwgqi0JoGgk6ADHkxP/
         eoqwfSHvsCJOicF2ceG4qJ2GjEq91gKAd3EWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Er4YNjBc1rFmFqd3Av/AcvBAykcXzU4G4ouPUnYIVpc=;
        b=ifJ7ynMeralq+VUIguDfj75DTI0362kAXtpgIFZlyeNtPg6E5cgewAnvHeT2FJDzI/
         rF/TSe7ee6sFEyEmAK773lQf3/5NfSCG9pOV6UmX3IOFvN+IiMr2rW1TJj+9TIf1qOe1
         XLqbF029fMeH4iQFzkyQg7WQ7LBBZWDHa9PQ+46RREJt62dH8jPwlY2IwGNQ3y7cuQru
         6uJl5yvMsxt1IqgUCuRNOvGN2DNOyGxKjbQ1SVUl+KgBY0r4UNE/6yBX/i9/8gAX4yeN
         jXejrvHdGq1llCl1Mkm+yyer6FLl1IMKtOF7+LqYsIAP6nbwY6gNCeqNYjWHtLXX600C
         lHsA==
X-Gm-Message-State: AOAM5321F+xwdpjCsyQVk6EQAEjq10Gt0mLnxVowJfEZsvXZK9J4lxwk
        OF5hbeB0YfV/WR/gPKjpe7g07w==
X-Google-Smtp-Source: ABdhPJyv6E42dsA3S9P3VWEIZmzmRItriSmwgYIihLdl3Ik3hB6giDYWmWqJZSaGbOe5kp/YpBw4JQ==
X-Received: by 2002:a17:90a:9285:: with SMTP id n5mr3290670pjo.29.1629796322219;
        Tue, 24 Aug 2021 02:12:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6b46:820f:610b:67c7])
        by smtp.gmail.com with UTF8SMTPSA id gl12sm1794005pjb.40.2021.08.24.02.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 02:12:01 -0700 (PDT)
Date:   Tue, 24 Aug 2021 02:12:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Subject: Re: [PATCH v5] Bluetooth: btusb: Add support using different nvm for
 variant WCN6855 controller
Message-ID: <YSS34JcZcoZwWg5D@google.com>
References: <1629793683-28770-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629793683-28770-1-git-send-email-zijuhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 24, 2021 at 04:28:03PM +0800, Zijun Hu wrote:
> From: Tim Jiang <tjiang@codeaurora.org>
> 
> we have variant wcn6855 soc chip from different foundries, so we should
> use different nvm file with suffix to distinguish them.

Similar question as on v4: why is it necessary to know where a chip was
manufactured? Is the hardware different? Should the FW behave differently
for some reason (e.g. regulatory differences)?

> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
>  drivers/bluetooth/btusb.c | 57 +++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 45 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 60d2fce59a71..ad7734f8917c 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3141,6 +3141,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
>  #define QCA_DFU_TIMEOUT		3000
>  #define QCA_FLAG_MULTI_NVM      0x80
>  
> +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
> +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
> +
>  struct qca_version {
>  	__le32	rom_version;
>  	__le32	patch_version;
> @@ -3172,6 +3175,7 @@ static const struct qca_device_info qca_devices_table[] = {
>  	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
>  	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
>  	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
> +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
>  };
>  
>  static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
> @@ -3326,27 +3330,56 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>  	return err;
>  }
>  
> -static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> -				    struct qca_version *ver,
> -				    const struct qca_device_info *info)
> +static void btusb_generate_qca_nvm_name(char **fwname,
> +					int max_size,
> +					struct qca_version *ver,
> +					char *foundry)
>  {
> -	const struct firmware *fw;
> -	char fwname[64];
> -	int err;
> +	char *separator;
> +	u16 board_id;
> +	u32 rom_version;
> +
> +	separator = (foundry == NULL) ? "" : "_";
> +	board_id = le16_to_cpu(ver->board_id);
> +	rom_version = le32_to_cpu(ver->rom_version);

Make the above assignments in the declaration.

>  
>  	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
>  		/* if boardid equal 0, use default nvm without surfix */
>  		if (le16_to_cpu(ver->board_id) == 0x0) {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> -				 le32_to_cpu(ver->rom_version));
> +			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x%s%s.bin",
> +				 rom_version,
> +				 separator,
> +				 foundry);

the last three parameters could be in a single line.

>  		} else {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> -				le32_to_cpu(ver->rom_version),
> -				le16_to_cpu(ver->board_id));
> +			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x%s%s%04x.bin",
> +				rom_version,
> +				separator,
> +				foundry,
> +				board_id);

the last four parameters could be in a single line.

Besides the minor comments above this looks good to me in terms of code, but
I'd like to have a better understanding of why the origin of the chip is
important.
