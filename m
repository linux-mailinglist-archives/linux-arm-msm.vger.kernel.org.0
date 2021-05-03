Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED6B371F07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 19:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbhECR5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 13:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbhECR5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 13:57:04 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07B8C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 10:56:10 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id v191so4687035pfc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 10:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bPGNoffuv19YjjXYP1WFdfb1qoKP5Lg1nHaK0QpjVVw=;
        b=eyW8g2e77jYlYs5whvg43H5Ssak7Pr+zzh9QLq6e12BTjGDwXEpALVoYYYlIytZbaI
         EvBD9PTRKMXoNbS3g5vg+yttyvz5cvL4b8DJlGruJbr5Eg1I4G+Ak5plqIYK+0IIpdBR
         pRU6GW5kqk4DspHWi8juBxW6bABk7gODouTpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bPGNoffuv19YjjXYP1WFdfb1qoKP5Lg1nHaK0QpjVVw=;
        b=nSKhYfSxuH1SHPzm8QekfqRpdIgyZqvjP84uAYeEsSLiu/6PIhqpRKCPS2SOb1K/T3
         +y3HkpysDZcGao7FH+Ujh1EskIIhJj57C+sLiqhvs8X/PPpAnboqQBFaMW+mo8GUAlxw
         YQjqwgVIFtp3AC0JXDrivUpBRe0tsK3ySlDOgBmnLwuNA9tPfek/h57hAplqA2KjdW4s
         FqGUpxv19jOx1k4WL9jUlqDGscvMj8Brjoij/rMSZsAc5CpgWA6LdjkYsIeZRqQcJf/O
         U9JT1ehYjMJcf22s6U+/Y+bvJczm1imEm1rHaKcTfS3kJoBtdYBvUGgPeqocwcG/bnT0
         ovrw==
X-Gm-Message-State: AOAM53037sl4rzrakVeGwIzGy6OiyiiMH165DRHSyjglke99Mwbv6sDJ
        fygc06k8R4MHMXCymsG2vNEiTQ==
X-Google-Smtp-Source: ABdhPJzeuUMnOHQFQXipHo229NVknh0suN/NWgkQfOVNZtfwuJ4AH5TVUs80cJ6BaBLtaFRBf/hnkA==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr19048190pgm.444.1620064570539;
        Mon, 03 May 2021 10:56:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8584:3fd:2adf:a655])
        by smtp.gmail.com with UTF8SMTPSA id 76sm9557600pfw.58.2021.05.03.10.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 10:56:10 -0700 (PDT)
Date:   Mon, 3 May 2021 10:56:09 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, manafm@codeaurora.org
Subject: Re: [PATCH V3 3/3] arm64: dts: qcom: SC7280: Add thermal zone support
Message-ID: <YJA5ORG5eR5f5nXc@google.com>
References: <1619778592-8112-1-git-send-email-rkambl@codeaurora.org>
 <1619778592-8112-4-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1619778592-8112-4-git-send-email-rkambl@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 30, 2021 at 03:59:52PM +0530, Rajeshwari wrote:
> Adding thermal zone, cooling maps support and changing hysteresis value for critical trip point in SC7280.
> Hysteresis is not needed for critical trip point, when it reaches critical threshold system
> will go for shutdown.

This patch doesn't change any hysteresis values, it adds them. As
commented on v2, the sentence about the hysteresis doesn't add any
value IMO, just remove it, or at least explain in a reply why you
think it is valuable.

> 
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---

patches with v > 1 should include a changelog

>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 852 +++++++++++++++++++++++++++++++++++
>  1 file changed, 852 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 275113c..d722081 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>
> ...
>
> +	thermal_zones: thermal-zones {
> +		cpu0-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens0 1>;
> +
> +			trips {
> +				cpu0_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu0_alert1: trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu0_crit: cpu_crit {

The node name should use dashes as separator, not underscores, i.e. it
should be 'cpu-crit'. Applicable to all critical trip points.
