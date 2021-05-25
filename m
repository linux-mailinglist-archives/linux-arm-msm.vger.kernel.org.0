Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A81C390AFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 23:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhEYVE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 17:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbhEYVE6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 17:04:58 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E3BC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 14:03:27 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id q25so6531563pfn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 14:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dLfxxFUBzQhlAYd+Asl7iO++YG0ogrjjhO2T1GNR2PM=;
        b=cAzmH9Re3mfQSmWSRz3XIA+qPy9YZwETGolgJ8PQkF2urazUTTwj4AYZIgOz8Gu62Q
         g9+ev9APGXsIFLoaROk7Kth0Xw39o9K/JFdaYE/Ie9UXb+30KThxYt1VEchykX1TQ7xA
         Fv7C9PzJSaiT7XqqUp6bkISkRFx8/dkI9NRfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dLfxxFUBzQhlAYd+Asl7iO++YG0ogrjjhO2T1GNR2PM=;
        b=mtcMEW1QxCCTTfCDH/X2Y0scW6JNebGlYgv11008IaiwD6GdmjMrUUlsrsjQZh/VPK
         ItCpum9izIsiDIX2J+eOhA+ftM3UcEhoX4OwYPdB84Q1P5kF2BvKJHP3xyT6a2hnfEOF
         YigdwMQiFANbpcCdyMb0bmFCCqxergZPUV9fFbnEhw0Go54PAL8RurSeJAKoxBDweIKX
         bXk1hnP+he3ZxSs2+ePqBU5l6s58xbGjZyb0lkyvJz4zAE8n35CsFnyQsflCLNExJG0G
         /roZur07VKhU5XOeWar52LUSbn3oyHudFskI8HElkp+5cbFkdgEGwWhFq/oMNRaQ7hEG
         w2iw==
X-Gm-Message-State: AOAM531yrFmZRAtZR2aiAMDGr0514NEO4ouZJkRVw9GyzIhty0dOE8m1
        3KJQPjn6fYnTE7t24oNLbWr5oA==
X-Google-Smtp-Source: ABdhPJwgTSDsv5vnr8/9rrZEg/FEV16LmDyeEugHroAZBadRPP4oOOmR1BbIH57s7+PbbhkfxEl65Q==
X-Received: by 2002:a63:801:: with SMTP id 1mr20754447pgi.146.1621976607500;
        Tue, 25 May 2021 14:03:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ab0:bbc9:a71:2916])
        by smtp.gmail.com with UTF8SMTPSA id c16sm14108134pfd.206.2021.05.25.14.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 14:03:27 -0700 (PDT)
Date:   Tue, 25 May 2021 14:03:25 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V5 09/11] arm64: dts: qcom: sc7280: Include PMIC DT files
 for sc7280-idp
Message-ID: <YK1mHbpw3Z1+cOJm@google.com>
References: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
 <1621937466-1502-10-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1621937466-1502-10-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 25, 2021 at 03:41:04PM +0530, satya priya wrote:
> The sc7280-idp has four PMICs, include their .dtsi files.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in RESEND V4:
>  - As per Matthias comments moved this patch before 'Add ADC channel nodes
>    for PMIC temperatures to sc7280-idp'
> 
> Changes in V5:
>  - No changes.
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 54d2cb3..f295580 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -8,6 +8,10 @@
>  /dts-v1/;
>  
>  #include "sc7280.dtsi"
> +#include "pm7325.dtsi"
> +#include "pmr735a.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. sc7280 IDP platform";

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
