Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090C5364E8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 01:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhDSXXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 19:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhDSXXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 19:23:15 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC6AC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 16:22:44 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id p16so14665543plf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 16:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/fdThcIRrgscrujltUhnPe8L2i3scdC7Fzwjbgg461M=;
        b=jwSp/gqHOdqZnEbozWAZEAN6sUBPw3p0kdBD4kEFPJ2qPbPIo0w5a1ro5wjXpOfv0c
         dX5KAVPxGJQQchm/i53s/eCyaoX73fE0+kP9fUMaw8N7zFSz6rTl/tq2ox+KgplCAI7t
         e+vNgJucfVRKqlMMFTZeHImcxrM+SCWphw5iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/fdThcIRrgscrujltUhnPe8L2i3scdC7Fzwjbgg461M=;
        b=kvyKyZJJWzAc6xr+c7wcaxRzSE07uYvuMiW3ijqQvS5QVKEaELvvJfnTVJQC3W9mVT
         oQf7XG9v0ldaFkLpRVpd6/7XGd/82tUBW9hMv135K57oI6NchGhCFOiHm9C5a/yvRAiP
         4YvRbT2DdgsLFQfpisfDSGMP+aCoWep2bO0NumSBGcqQZsmy20B//rwQb0JqmARkPC+f
         kwRoJd5wJiCQ0s//2FsekRv83E87fZBpj8rSX/xdM4wq1XD5LRFd/zKXqFw9zh0XouWd
         AqYlwtDnrfqkYm1bVTlit3OjNgVjM5tg33RfVsj1KbbqP+rcOMn2UPAvq+6pRkcmries
         2SOg==
X-Gm-Message-State: AOAM530SD40YTRfahu0k/6Mr/x6HmhK0VJy/wjOZRpmc3MGfQonVoNMR
        ltOa2qfXIbSzrL6gIBEcCk6L4Q==
X-Google-Smtp-Source: ABdhPJxQ5fQ5GWKmxooUG54M470t/m1Mqe6M7xJBCDcvAMUaaHiQkj5NrC5K1tpTVKOOVwnpqvEtLA==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id w15-20020a170902a70fb02900ead4a86a84mr26025712plq.42.1618874564051;
        Mon, 19 Apr 2021 16:22:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7401:678f:e510:6700])
        by smtp.gmail.com with UTF8SMTPSA id f2sm13623847pfe.177.2021.04.19.16.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 16:22:43 -0700 (PDT)
Date:   Mon, 19 Apr 2021 16:22:42 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 4/5] usb: dwc3: qcom: Configure wakeup interrupts
 during suspend
Message-ID: <YH4Qwjf0OH0+1BdB@google.com>
References: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
 <1618567313-25373-5-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618567313-25373-5-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 16, 2021 at 03:31:52PM +0530, Sandeep Maheswaram wrote:
> Configure interrupts based on hs_phy_mode to avoid triggering of
> interrupts during system suspend and suspend the device successfully.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 66183c6..b1e9061 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -316,22 +316,36 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
>  
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  
> -	dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
>  
> -	dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS)
> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS)
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	else {
> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}

nit: 'if' and 'else if' branches should also have curly braces since
'else' has them.

>  	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS)
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS)
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	else {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}

ditto

>  	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
>  }

Other than the nits:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
