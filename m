Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E61365E98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 19:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhDTRaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 13:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbhDTRaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 13:30:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488B8C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 10:29:52 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so22754555pjh.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oHhObtzZUMwUL0LGBYnUP2PdgBkn1gCTVPbp4qMchG4=;
        b=YScpteqoqCLz2Eu+NTR3fLnysuCLD0EMwVENM3M1OUKcSsSnzqJcHaNC4pfaNry8tw
         RPWH7MrHzN59I3/0KGYanyTHJAzmj2yiQtwZwDgHuRJfBEpZNi3im67N4vuRuH2YMwAh
         wSkveHOydiGEs4NcfcUJdwx69c4CsvCe+uqI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oHhObtzZUMwUL0LGBYnUP2PdgBkn1gCTVPbp4qMchG4=;
        b=SzTgBPTfqlqZ+eo6aVdjkHtCQ6k1ON5xKSFEXFnwQEDGMwi82gZ7f5pY8/JyBwjs9K
         2oayJO7molyOiLWTpmAEfgsma5FVFke6XxoImrQlkZjOe1/1PwRx3dSe6tsPc5TR8qCG
         IGUkIdSjuG2LYo912T+NCEeAZCUtBysoTcEM3MWY47IvGaaqMpfFh8nAUUyEpisPSO6m
         r/yOqJt7Iqyhltmlr36jz1sWIcHoh5R3NejqI/uAyoEn7z6RaoVoBkZy38D4gqpf/8Zc
         64lJR5ODNU7Iw4gGre9MBHtfgIAe9nvP7+dm3HyKrc4oo7atA7bHNYbNPLPPysE71sLm
         XzzQ==
X-Gm-Message-State: AOAM532oDQ7tesKIQ9CfvdZcIDkqfZy3eYo8h+kGd8joY3GRhAyYZfsj
        YUUck7q+dTv3HUzTrhlhb0VXiQ==
X-Google-Smtp-Source: ABdhPJxEe1OhULxbGxmNL1UjWRteTSkCWq9GXRDRscjlFfY5QPkDI7MHsA7OpxA3teahomRVWUToQg==
X-Received: by 2002:a17:90a:7897:: with SMTP id x23mr6106182pjk.133.1618939791774;
        Tue, 20 Apr 2021 10:29:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7a9:7e56:e9c3:13e8])
        by smtp.gmail.com with UTF8SMTPSA id q3sm3025116pja.37.2021.04.20.10.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 10:29:51 -0700 (PDT)
Date:   Tue, 20 Apr 2021 10:29:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V3 4/5] arm64: dts: qcom: pmk8350: Add PMIC
 peripherals for pmk8350
Message-ID: <YH8PjqhZtiNhNv8h@google.com>
References: <1618398783-7834-1-git-send-email-skakit@codeaurora.org>
 <1618398783-7834-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618398783-7834-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 14, 2021 at 04:43:00PM +0530, satya priya wrote:

> Subject: arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350

nit: why 'PMIC peripherals', are these peripherals somehow specific
to PMICs?

> Add PON, RTC and other PMIC infra modules support for PMK8350.

nit: it seems somewhat arbitrary to specifically mention PON and RTC,
and then treat the ADC and the thermal monitor as 'others'. You could
just spell them out too.

> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 55 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> index 1530b8f..bbd9fa7 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> @@ -3,6 +3,12 @@
>   * Copyright (c) 2021, Linaro Limited
>   */
>  
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>

the includes of the constants for the other PMICs seems to be an
remainder from older vesions, which included nodes for the on die
temperatures of these PMICs.
