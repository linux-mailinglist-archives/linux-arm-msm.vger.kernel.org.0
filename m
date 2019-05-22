Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A1425C2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 05:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbfEVDbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 23:31:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37645 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbfEVDbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 23:31:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id a23so551926pff.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 20:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gfoGdNWW2ocUNwiuJR6mN4ls2pTX6E29vDD/iBCFmnA=;
        b=dz/SM4yGZbsy+d21VXsmCc8UmXrM/7m/EQRJt+1FGyr19HVRZyhgWlA9ZagjqH0VWF
         V7RuF65VKzlmTBQY651yIlGTgsJNhSEiDWh/o2k17wggQobkNC8eSTseX3zymifWyeYY
         7ifUJ/WKW0ATqnuRKfMSgtynohCP5x7x3AKDC41+3sErEeG41rlzULcygW71LRg0nQJX
         fLfDmB5q1sAdvWCYs3ekBhEkEfVIcdflQePu/GRVfhWd5H2DF/khg0sZNF8T1s28QpGX
         zzF9g70RtPrCb6qtdxvZVCIzxVenFRolEPB73toqn2KI487J83uoh9IzNNJ/CkAeTKLV
         OQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gfoGdNWW2ocUNwiuJR6mN4ls2pTX6E29vDD/iBCFmnA=;
        b=L0E2XZ+mB0Z5bacaxMej1giPdmHkGwZFUpTu2lNcYSSh9UL1Laq/0csCDoUeEqF4G6
         zwsoKK85f+IyMdfg22nUGMcaeZuYzZpfBtpgSyuy7wMH9DABK+ivkWbIph9WEvQlqYgb
         gZKi9uLelovpUlV6KaxqC6ttym6AbUXphX28kP0TU0jyDl5oWHPQSSsGV03O/X91V056
         CbTAUcKIwGE6is6eJfKncXfZ3OH5HldHu7v8mKGiWdkzgt6iRnBLVK7M2yJHwg3kJYX7
         H7pPfzO29ycYLtnS0qlywIXSyag8l/b+T0mcEMd2sFbIRLH14Bcay6WPAgV6NV17cOwH
         qY8A==
X-Gm-Message-State: APjAAAUGx0DTMuXfq+k5/sVcGCpQQLW76HzVCLIDqEwu7B3E7aM1VH71
        TmVbpAAs3+mzv80t/e6I/ft1Hg==
X-Google-Smtp-Source: APXvYqxrOErAc2fVubSWSkGxRYNpmdc3/2QyP7ht94r6Wtz8VSrlh+h1VlcOROH+r1JznyHwVKYf/A==
X-Received: by 2002:a63:5166:: with SMTP id r38mr15800379pgl.429.1558495861334;
        Tue, 21 May 2019 20:31:01 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a37sm12254194pga.67.2019.05.21.20.31.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 20:31:00 -0700 (PDT)
Date:   Tue, 21 May 2019 20:30:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, niklas.cassel@linaro.org,
        marc.w.gonzalez@free.fr, sibis@codeaurora.org,
        daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/9] arm64: dts: qcom: msm8916: Use more generic idle
 state names
Message-ID: <20190522033058.GK3137@builder>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <606afcaab57021faacdb47220b9d9d0f5a27f7b8.1558430617.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <606afcaab57021faacdb47220b9d9d0f5a27f7b8.1558430617.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 May 02:35 PDT 2019, Amit Kucheria wrote:

> Instead of using Qualcomm-specific terminology, use generic node names
> for the idle states that are easier to understand. Move the description
> into the "idle-state-name" property.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Picked up

Regards,
Bjorn

>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 82ea5b8b37a2..3a8c6c4fcf15 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -110,7 +110,7 @@
>  			reg = <0x0>;
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
> -			cpu-idle-states = <&CPU_SPC>;
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
> @@ -122,7 +122,7 @@
>  			reg = <0x1>;
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
> -			cpu-idle-states = <&CPU_SPC>;
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
> @@ -134,7 +134,7 @@
>  			reg = <0x2>;
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
> -			cpu-idle-states = <&CPU_SPC>;
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
> @@ -146,7 +146,7 @@
>  			reg = <0x3>;
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
> -			cpu-idle-states = <&CPU_SPC>;
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
> @@ -160,8 +160,9 @@
>  		idle-states {
>  			entry-method = "psci";
>  
> -			CPU_SPC: spc {
> +			CPU_SLEEP_0: cpu-sleep-0 {
>  				compatible = "arm,idle-state";
> +				idle-state-name = "standalone-power-collapse";
>  				arm,psci-suspend-param = <0x40000002>;
>  				entry-latency-us = <130>;
>  				exit-latency-us = <150>;
> -- 
> 2.17.1
> 
