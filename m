Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2631138F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 01:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfLEAqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 19:46:06 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34936 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfLEAqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 19:46:05 -0500
Received: by mail-pg1-f193.google.com with SMTP id l24so718938pgk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2019 16:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g7Dc3L6ucRDBTOgi1WYw/gKWAHJ0BhR7GlJLT2KOwWU=;
        b=hlIfJxJ4UQcwyezs5GWGUzTpgBpkXycqViF5s7J9Lbgv7LX5Loh/lFJW26EARxlJS7
         jQGy+dln8gbBR9ETp7bawc/SUPJ4DGK5qfw9eApXM2bPC8K/wSJANcY+yKbhAg+bDQHx
         Jb81KyFdr/uon9IeHq8w2COMsphIkRmGm5YYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g7Dc3L6ucRDBTOgi1WYw/gKWAHJ0BhR7GlJLT2KOwWU=;
        b=N2VMbmhXJMHXad6g5PeeH+1PJENiwNmrkMQyKwwLsAbN/aLYE90uZnI6OllIMIpi7n
         qHZ5BaRmPPM3q9sig5NgU7JmNrErxw8Q+PA3pbWm0+0uNTs5WiiOfl1/q6xCz7LvG4Sa
         S3uBlPuutaPpW5p2ORo9a+BvbQ0pc28vZ9iBWYBnfdH6GB2HkJjUCwlUD7BumvqJ351+
         l90mVM1WdRFWTMGTh1XaDQHV6kTst7140GxH3r+/WZP/a1+QxydfMLjReM1iyyhOqVbu
         3Wt1Gcx3WN1R4CPDNlNPAGl7a90W09gbZcyUgdOMrVlDRIsuhoTdkzZFFz1GZkm/iRQi
         RW8Q==
X-Gm-Message-State: APjAAAXCB8EAmmIdEWamum2QwCcIldufVkvTm2EyzlWq/92+XdjLnV7Y
        /e5Wi8CF6P0HD4IcQ1lsVSpsBw==
X-Google-Smtp-Source: APXvYqx2X3SI/+sIaJkgoq1wNauTweF2w9MvCcNu9sKGmwlik3upNJqHpW1nTOdh3mFbvDDMr0XIvg==
X-Received: by 2002:a65:4809:: with SMTP id h9mr6325753pgs.265.1575506765134;
        Wed, 04 Dec 2019 16:46:05 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id hi2sm7325684pjb.22.2019.12.04.16.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 16:46:04 -0800 (PST)
Date:   Wed, 4 Dec 2019 16:46:03 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v1] arm64: dts: sc7180: Add cpufreq HW node for cpu
 scaling
Message-ID: <20191205004603.GK228856@google.com>
References: <0101016ed02b6356-5165eaaa-6c54-47ff-a008-821c91831e56-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016ed02b6356-5165eaaa-6c54-47ff-a008-821c91831e56-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 04, 2019 at 09:08:54AM +0000, Taniya Das wrote:
> cpufreq hw node required to scale CPU frequency on sc7180.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index c0ac0a1..7629995 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -40,6 +40,7 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_0: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -55,6 +56,7 @@
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_100>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_100: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -67,6 +69,7 @@
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_200>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_200: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -79,6 +82,7 @@
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_300>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_300: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -91,6 +95,7 @@
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_400>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_400: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -103,6 +108,7 @@
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_500>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_500: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -115,6 +121,7 @@
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_600>;
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			L2_600: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -127,6 +134,7 @@
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_700>;
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			L2_700: l2-cache {
>  				compatible = "cache";
>  				next-level-cache = <&L3_0>;
> @@ -286,6 +294,17 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		cpufreq_hw: cpufreq@18323000 {
> +			compatible = "qcom,cpufreq-hw";
> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
> +			reg-names = "freq-domain0", "freq-domain1";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
> +		};
>  	};
> 
>  	timer {

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
