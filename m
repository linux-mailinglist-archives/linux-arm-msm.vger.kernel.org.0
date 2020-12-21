Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6EC2DF864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 05:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgLUEuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 23:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbgLUEuZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 23:50:25 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6ECC061282
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 20:49:44 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id 73so2933722uac.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 20:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tXhZpl/nrjd5elY+cgPhkIk6TXDo0n8ptV1A9qL9ff4=;
        b=A1/lUel56LIWTo/i7+chJCk2/uQ81um5EdPufdOCiJ9eRyzpLP8OVfU5XLJvQgiNBh
         JNnEmOz12XHIuMj7pmFJyQ4C77d1KfouYOjDhYZzNEp2bkIrZMopAnZZY9+rTdm+GGaG
         CdNT0xdbTAaNtDYj7gTf8yPvAOZE+c1SxZBsvi3UEbPrJFKB+y2pM27j7SqvDIXyDMhp
         Umbq+guH5u1aqeq5LriItgR9wcmvmttI9Q1UQtxiwnVbudPYughy+3024QFZYmc+1qWT
         6tZEvodNagg30SRg9mySvV7MAeLGuYb0YN+twixwQDUX1QvEbtOgUaAWhxSJ7gzw3XXq
         bPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tXhZpl/nrjd5elY+cgPhkIk6TXDo0n8ptV1A9qL9ff4=;
        b=eGex8fjiGZ1hsveWXpb3MgI44bKmXGDv4uh2N8VuJxtJ1YXyhUsawOOWoOKpj40FuL
         079LlSMUUHu5CqFKoWfyTGipVfTB0qF+mX6tIhR0Xvor2/H7snPDJllbOh+tvtN31eDd
         Ll7krnhgxD3k6oaddRj99vXj6hwh1M1oXTr8kLfPEV5A7tBwSqYEBmr2JotkwehGwHSo
         MzLmy6jfvSg5G0sWI8O66uU+HyCexO1/D3p1FtkCkqKjngV6tJV0UWPtuDB0k0BkYTgY
         SIUxg2smJCHh7/zMEgHa8b+QjhlMnbfnsygBegjIyx/BQVbGV+dzAI1lEzzUivLzv0ul
         yp9g==
X-Gm-Message-State: AOAM530RJOTadET4FONfAljcwcFhFjtVN6A0oDA8C5+0V5dARp9aCm2O
        EoH1PdXkgOjZ2iW36u0cml822pClgC2mKA==
X-Google-Smtp-Source: ABdhPJyIG0HDMlf+ODXFvv1pdnphzNcS6Dy5rYs9HhKZGRPMueRRmgAUTiJNwGkSDibU6TwDNnwVhg==
X-Received: by 2002:a9d:2287:: with SMTP id y7mr10350287ota.137.1608522490944;
        Sun, 20 Dec 2020 19:48:10 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h93sm3595016otb.29.2020.12.20.19.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 19:48:10 -0800 (PST)
Date:   Sun, 20 Dec 2020 19:48:54 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: Add PSCI idle states
Message-ID: <X+AbJvE7OGs3cRCw@ripper>
References: <20201221002907.2870059-1-danny@kdrag0n.dev>
 <20201221002907.2870059-3-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221002907.2870059-3-danny@kdrag0n.dev>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 20 Dec 16:29 PST 2020, Danny Lin wrote:

> Like other Qualcomm SoCs, sm8150 exposes CPU and cluster idle states
> through PSCI. Define the idle states to save power when the CPU is not
> in active use.
> 
> These idle states, latency, and residency values match the downstream
> 4.14 kernel from Qualcomm as of LA.UM.8.1.r1-15600-sm8150.0.
> 
> It's worth noting that the CPU has an additional C3 power collapse idle
> state between WFI and rail power collapse (with PSCI mode 0x40000003),
> but it is not officially used in downstream kernels due to "thermal
> throttling issues."
> 

Thanks Danny for this series, very happy to see this kind of additions.
Just one small question about the cluster param below.

> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 50 ++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 75ed38ee5d88..edc1fe6d7f1b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -50,6 +50,8 @@ CPU0: cpu@0 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
> @@ -67,6 +69,8 @@ CPU1: cpu@100 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_100>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
> @@ -82,6 +86,8 @@ CPU2: cpu@200 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_200>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
> @@ -96,6 +102,8 @@ CPU3: cpu@300 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_300>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  			#cooling-cells = <2>;
> @@ -110,6 +118,8 @@ CPU4: cpu@400 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_400>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
> @@ -124,6 +134,8 @@ CPU5: cpu@500 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_500>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
> @@ -138,6 +150,8 @@ CPU6: cpu@600 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_600>;
>  			qcom,freq-domain = <&cpufreq_hw 1>;
>  			#cooling-cells = <2>;
> @@ -152,6 +166,8 @@ CPU7: cpu@700 {
>  			compatible = "qcom,kryo485";
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> +					   &CLUSTER_SLEEP_0>;
>  			next-level-cache = <&L2_700>;
>  			qcom,freq-domain = <&cpufreq_hw 2>;
>  			#cooling-cells = <2>;
> @@ -196,6 +212,40 @@ core7 {
>  				};
>  			};
>  		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "little-rail-power-collapse";
> +				arm,psci-suspend-param = <0x40000004>;
> +				entry-latency-us = <355>;
> +				exit-latency-us = <909>;
> +				min-residency-us = <3934>;
> +				local-timer-stop;
> +			};
> +
> +			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "big-rail-power-collapse";
> +				arm,psci-suspend-param = <0x40000004>;
> +				entry-latency-us = <241>;
> +				exit-latency-us = <1461>;
> +				min-residency-us = <4488>;
> +				local-timer-stop;
> +			};
> +
> +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "cluster-power-collapse";
> +				arm,psci-suspend-param = <0x400000F4>;

How come this is 0xf4?

Isn't downstream saying that this should be either 0x1 << 4 or 0xc24 <<
4, depending on how deep we want to go? Could we at least mention why
this is 0xf4?

Regards,
Bjorn

> +				entry-latency-us = <3263>;
> +				exit-latency-us = <6562>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +		};
>  	};
>  
>  	firmware {
> -- 
> 2.29.2
> 
