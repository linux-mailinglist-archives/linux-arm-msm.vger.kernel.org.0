Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F3F38E210
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 09:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbhEXIBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 04:01:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10078 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232099AbhEXIBR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 04:01:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621843189; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uogsG3A+h5LeNQ0cQUSHg5KaZ9zWz24HgreBoVB53Yo=;
 b=DGP+DBceLe4h1Tr369yEe4/kLeODDZTXrM3pav3tV6BAVMqLn/EkmeDjpZK4LZuynRDKA2li
 rLJzqeLKRZXHzIJlqC5OGxYY4fuEre2XsAqr0PRK3e2bdr6573eZWhRKg7JPkN1ePCw4CwQg
 l1oGYSe38eKzLwaSs1TUqRtOaQ4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60ab5ce467d156359afbd470 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 07:59:32
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F87BC43460; Mon, 24 May 2021 07:59:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE98EC433F1;
        Mon, 24 May 2021 07:59:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 15:59:31 +0800
From:   tjiang@codeaurora.org
To:     marcel@holtmann.org
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: btusb: use default nvm if boardID is 0 for
 wcn6855.
In-Reply-To: <1618996576-7743-1-git-send-email-zijuhu@codeaurora.org>
References: <1618996576-7743-1-git-send-email-zijuhu@codeaurora.org>
Message-ID: <404766ae900a70b0ae2d28e702508e21@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

marcel:
   could you help mainline this change ?

regards.
tjiang

On 2021-04-21 17:16, Zijun Hu wrote:
> From: Tim Jiang <tjiang@codeaurora.org>
> 
> if boardID is 0, will use the default nvm file without surfix.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
>  drivers/bluetooth/btusb.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6f25337..61afea9 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4138,9 +4138,14 @@ static int btusb_setup_qca_load_nvm(struct 
> hci_dev *hdev,
>  	int err;
> 
>  	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> -			 le32_to_cpu(ver->rom_version),
> -			 le16_to_cpu(ver->board_id));
> +		if (le16_to_cpu(ver->board_id) == 0x0) { //if boardid equal 0, use
> default nvm.
> +			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> +				 le32_to_cpu(ver->rom_version));
> +		} else {
> +			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> +				le32_to_cpu(ver->rom_version),
> +				le16_to_cpu(ver->board_id));
> +		}
>  	} else {
>  		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
>  			 le32_to_cpu(ver->rom_version));
