Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1132C6E8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 03:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728995AbgK1C4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 21:56:00 -0500
Received: from z5.mailgun.us ([104.130.96.5]:59102 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731037AbgK1Cbt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 21:31:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606530701; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DF8EgM8VlBkVaTO2iXksxvBj4FJ6qJwTrbBIDix1VFA=;
 b=FNuIEohMqvMOI7PKxbPZMHtTw9zKRU94aLTwXC0oTSZaqD7RnHk6e/865+vdS4SxXejtCZ4s
 HoFI2YIJwC/luUMQJN3oZ4XzSLJbokqEQOMIlsB/cFF2NkxU4jLRuegDDN88cHlBFHducvvZ
 nhh07PPtC5YO75ulb+H732SfUYA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fc1b685a5c560669c338b5a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 28 Nov 2020 02:31:33
 GMT
Sender: mgautam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66874C43460; Sat, 28 Nov 2020 02:31:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9534BC433C6;
        Sat, 28 Nov 2020 02:31:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 28 Nov 2020 08:01:31 +0530
From:   mgautam@codeaurora.org
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] usb: dwc3: core: Host wake up support from system
 suspend
In-Reply-To: <1603831083-2025-2-git-send-email-sanm@codeaurora.org>
References: <1603831083-2025-1-git-send-email-sanm@codeaurora.org>
 <1603831083-2025-2-git-send-email-sanm@codeaurora.org>
Message-ID: <bca7bd32710a118d3583dd4e740ef3e0@codeaurora.org>
X-Sender: mgautam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On 2020-10-28 02:07, Sandeep Maheswaram wrote:
> Avoiding phy powerdown in host mode so that it can be woken up by 
> devices.
> Added hs_phy_mode flag to check connection status and set phy mode
> and configure interrupts.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c | 14 +++-----------
>  drivers/usb/dwc3/core.h |  2 ++
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index bdf0925..0e4bc1e 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1672,10 +1672,6 @@ static int dwc3_suspend_common(struct dwc3
> *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> -			dwc3_core_exit(dwc);
> -			break;
> -		}


This could be a problem for platforms that don't support runtime_suspend
and rely on dwc3_core_exit to power-down PHY.
IMO you can continue to do dwc3_core_exit() if runtime_pm isn't enabled
for the device.

> 
>  		/* Let controller to suspend HSPHY before PHY driver suspends */
>  		if (dwc->dis_u2_susphy_quirk ||
> @@ -1733,13 +1729,9 @@ static int dwc3_resume_common(struct dwc3 *dwc,
> pm_message_t msg)
>  		spin_unlock_irqrestore(&dwc->lock, flags);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> -			ret = dwc3_core_init_for_resume(dwc);
> -			if (ret)
> -				return ret;
> -			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> -			break;
> -		}
> +
> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> +
>  		/* Restore GUSB2PHYCFG bits that were modified in suspend */
>  		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
>  		if (dwc->dis_u2_susphy_quirk)
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 74323b1..da63d4a3 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1101,6 +1101,8 @@ struct dwc3 {
> 
>  	bool			phys_ready;
> 
> +	unsigned int            hs_phy_mode;
> +

This change should instead be part of the other patch ?
"usb: dwc3: host: Add suspend_quirk for dwc3 host"


>  	struct ulpi		*ulpi;
>  	bool			ulpi_ready;
