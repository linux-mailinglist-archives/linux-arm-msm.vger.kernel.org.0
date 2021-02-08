Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54277312EB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 11:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhBHKPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 05:15:38 -0500
Received: from so15.mailgun.net ([198.61.254.15]:19670 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232042AbhBHKOh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 05:14:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612779244; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uAwapH+3DR+8U2adWBEQpmzcm9L8gQHwJvHS+TvS18Q=;
 b=gwWN+p3iz80iNxjNvfW8Dg2bAzFHsdqa+B0BXLryre39qZuxX29TnIpeN5BenOSa/DzrgGH9
 CfKvKjiNjOeNqF7d1A/+0avQYFAUiNDfnOQlq5YMOAjc9P7xKty2d0riYOvgZ/AvaCQ28vOZ
 mT9vGCoFfQ4o6rXKkjtkW5LObE8=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60210ed034db06ef7933211c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Feb 2021 10:13:36
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98286C43461; Mon,  8 Feb 2021 10:13:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF147C433ED;
        Mon,  8 Feb 2021 10:13:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 08 Feb 2021 15:43:35 +0530
From:   bgodavar@codeaurora.org
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca:Fixed issue during suspend
In-Reply-To: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
References: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
Message-ID: <844435eeea74c6bdc9d1c64cf6ed86f9@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Kalle Valo for +1T

On 2021-02-05 21:07, Venkata Lakshmi Narayana Gubba wrote:
> If BT SoC is running with ROM FW then just return in
> qca_suspend function as ROM FW does not support
> in-band sleep.
> 
> Fixes: 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during 
> suspend")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index ff2fb68..de36af6 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -77,7 +77,8 @@ enum qca_flags {
>  	QCA_MEMDUMP_COLLECTION,
>  	QCA_HW_ERROR_EVENT,
>  	QCA_SSR_TRIGGERED,
> -	QCA_BT_OFF
> +	QCA_BT_OFF,
> +	QCA_ROM_FW
>  };
> 
>  enum qca_capabilities {
> @@ -1664,6 +1665,7 @@ static int qca_setup(struct hci_uart *hu)
>  	if (ret)
>  		return ret;
> 
> +	clear_bit(QCA_ROM_FW, &qca->flags);
>  	/* Patch downloading has to be done without IBS mode */
>  	set_bit(QCA_IBS_DISABLED, &qca->flags);
> 
> @@ -1721,12 +1723,14 @@ static int qca_setup(struct hci_uart *hu)
>  		hu->hdev->cmd_timeout = qca_cmd_timeout;
>  	} else if (ret == -ENOENT) {
>  		/* No patch/nvm-config found, run with original fw/config */
> +		set_bit(QCA_ROM_FW, &qca->flags);
>  		ret = 0;
>  	} else if (ret == -EAGAIN) {
>  		/*
>  		 * Userspace firmware loader will return -EAGAIN in case no
>  		 * patch/nvm-config is found, so run with original fw/config.
>  		 */
> +		set_bit(QCA_ROM_FW, &qca->flags);
>  		ret = 0;
>  	}
> 
> @@ -2103,6 +2107,12 @@ static int __maybe_unused qca_suspend(struct 
> device *dev)
> 
>  	set_bit(QCA_SUSPENDING, &qca->flags);
> 
> +	/* if BT SoC is running with default firmware then it does not
> +	 * support in-band sleep
> +	 */
> +	if (test_bit(QCA_ROM_FW, &qca->flags))
> +		return 0;
> +
>  	/* During SSR after memory dump collection, controller will be
>  	 * powered off and then powered on.If controller is powered off
>  	 * during SSR then we should wait until SSR is completed.
