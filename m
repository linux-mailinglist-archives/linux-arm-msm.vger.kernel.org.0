Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B66346E3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 01:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhCXA2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 20:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234411AbhCXA17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 20:27:59 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B71C061763
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 17:27:59 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id l3so16084410pfc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 17:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ArpAGDPO5Zy1J8ZuYbtiaQIyLb1VNF1C+x2MhSZdMr4=;
        b=NSWaX3i9OKqQTUJpTPB+E9DCf9hW1pebAdgYQy3jt9zPaKJaPWFASPZofTINEVIvYW
         6pyE9MQMHhc8oLRLUGIoj5ST15nG2oUDt1UCgrZ7p9yMGzEoKYVSGY2ZZyjTOXusFBeJ
         OwCr61rXmKgl3CNqEngUZw+73q5ADUmlulo3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ArpAGDPO5Zy1J8ZuYbtiaQIyLb1VNF1C+x2MhSZdMr4=;
        b=TSGRwJfmyZnmXRXQTVA8GSFTXg2ky6L5F3QEwYPnWDbYddqmlxz+Oebh8PLN84hPPj
         X5C/d28gXpqHS7Qb4XJTJepvstjakOM/FOp2wCR19T6ALp14BnSg6GSlvjy032Q7OgAd
         bgTOc5qTXMGytg3eBklVW6Rea/dyPbuIvV+TwRFexWskI89rN9D2wbCC480OZG2v3jTy
         wadQKJ1qz+ksJHF9TN6P+ssNN7Q3FmNbArMP5gr72toTtSc64BZYOcSVmQw4bUAVTjQP
         qcL2vpUMBfHvMNfw/BFhXhs9kJ/utUEkIlqDffz9WlqRq7q2RddHr06WePXYTJkHmk5i
         4MWw==
X-Gm-Message-State: AOAM5338spe3dRL5RVLD2Mb4wEoSPZ3Oe/tMHx8N7AmylYPkuGBvGNge
        dMVNPmDSp7LvLEyEgdo23YTM25zII40vIA==
X-Google-Smtp-Source: ABdhPJxjsgxfWM1AN6PzKOVTywe9JPoDDNk0S5uHejboMITv1/9Wv/diAYCV0W0vMKldqz6Y0Res/g==
X-Received: by 2002:a63:2349:: with SMTP id u9mr661932pgm.361.1616545678567;
        Tue, 23 Mar 2021 17:27:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:40a3:9725:46c3:85f6])
        by smtp.gmail.com with UTF8SMTPSA id q66sm295428pja.27.2021.03.23.17.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 17:27:57 -0700 (PDT)
Date:   Tue, 23 Mar 2021 17:27:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 1/4] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YFqHi91eIcVx2ak1@google.com>
References: <1616434280-32635-1-git-send-email-sanm@codeaurora.org>
 <1616434280-32635-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1616434280-32635-2-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 22, 2021 at 11:01:17PM +0530, Sandeep Maheswaram wrote:
> Avoiding phy powerdown when wakeup capable devices are connected.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 94fdbe5..9ecd7ac 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1702,7 +1702,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> +		if (!PMSG_IS_AUTO(msg) && dwc->phy_power_off) {

This is the first patch of the series, but the 'phy_power_off' flag is
only added by '[2/4] usb: dwc3: host: Add suspend_quirk for dwc3 host'.
Patches should not rely on later patches in the series in order to build
error/warning free. It seems you need to swap the order of patch 1 and 2.

>  			dwc3_core_exit(dwc);
>  			break;
>  		}
> @@ -1763,13 +1763,15 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		spin_unlock_irqrestore(&dwc->lock, flags);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> +		if (!PMSG_IS_AUTO(msg) && dwc->phy_power_off) {
>  			ret = dwc3_core_init_for_resume(dwc);
>  			if (ret)
>  				return ret;
>  			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
>  			break;
> -		}
> +		} else
> +			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> +

nit: use curly braces since the 'if' block has them.
