Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD09E19B911
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 01:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733008AbgDAXq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 19:46:28 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52126 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732881AbgDAXq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 19:46:28 -0400
Received: by mail-pj1-f66.google.com with SMTP id w9so778876pjh.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 16:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d8oAKXwkItGOcrPfT+tXH6JGRoW8kUhFEuMlXZtfyi4=;
        b=xM7S3weKJpuuAk67mz0KQDvlzWv/wgjPD3vlwq06bH2XnaPdSAz90wbpGsYKwlDdnp
         IOqDJ2ttpifcaTGJzpDwl+BRX5hlt4IiJSlOwm7m9XyaOHFw15VXvyFKJ32OBzwKQNM4
         1MyOg6u7jTEei6e834XKUcSjL2yVAiIUoS5QjiGj9TZO5ZZKtg7pK1O+vkSG3KQMIL4z
         kzuLDNagO2TBCXYPnAPR2NTfBKhqnoKcZYg8kxxf7htwmSHXGFb3jmphROLVRip8akHL
         qvmYx0t2VTnjbNUEtKlTd7+mk8ayNf8QQOL12X9467nkQG5QEy81TEMGwGaYf5Hk0Hnw
         ARAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d8oAKXwkItGOcrPfT+tXH6JGRoW8kUhFEuMlXZtfyi4=;
        b=mMWQdC3pn3mAfeJEpamiHtlu+vNagyxEWzllhwd+gZu1/0tGJl1yiKzjbkHB+sDNOp
         CUJ1ILZBuerbH9d/Jza4DxQvEdhu2puRWLtBPi1ADplpCxUYDBIxJC4uu6rQe9jeq5Zp
         kNgpJhEyRZ6vrk1EhkXV96yhSqVHsx8xslLMJVchzT1sTcqPJTQwZ2EB+jihZEYjp+Uv
         XiBymCG4wEiN37t/yyud9FXqd73bgAm3eCbqQPtNu4kU/iQ33meG4lS/FbqpR6SAZnKI
         URGRv2duUCGcQz1GMPhQknxb+TAHjVsoMn4F9WvGVDv3MCN3C2jDk6/I9tbpOsRAbfTK
         79/Q==
X-Gm-Message-State: AGi0PuafJF6SogiDacaj1DLndRbUwkVuBTohL8vbAjFX8izt9y92O+I8
        WZwasUf0F3MZi5CTpgtMOJimlw==
X-Google-Smtp-Source: APiQypIpKinI8QnrHoZsML8GoxiJ7GIdFGDJUapV4qi3zIwuSlQcylXEkWM8j9oThf+T24+F+STtcQ==
X-Received: by 2002:a17:90a:25c8:: with SMTP id k66mr606886pje.90.1585784786406;
        Wed, 01 Apr 2020 16:46:26 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o128sm2365103pfb.58.2020.04.01.16.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 16:46:25 -0700 (PDT)
Date:   Wed, 1 Apr 2020 16:46:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200401234623.GJ254911@minitux>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Apr 10:50 PDT 2020, Loic Poulain wrote:

> The highest cpu frequency opps have been dropped because CPR is not
> supported. However, we can simply specify operating voltage so that
> they match the max corner voltages for each freq. With that, we can
> support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> fine tune operating voltages and optimize power consumption.
> 
> This patch:
> - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> - Adds cpu-supply to apq8016-sbc.dtsi (board level info).
> - Adds pm8916 spmi regulator node to pm8916.dtsi.
> 
> Tested with a dragonboard-410c.
> 

Thanks Loic, happy to see you tying up these loose ends! Just one minor
nit below.

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm8916.dtsi      |  6 ++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 037e26b..f1c1216 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -560,6 +560,30 @@
>  	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
>  };
>  
> +&spm_regulators {
> +	vdd_cpu: s2 {
> +		regulator-always-on;
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1350000>;
> +	};
> +};
> +
> +&CPU0 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU1 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU2 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&CPU3 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
>  &smd_rpm_regulators {
>  	vdd_l1_l2_l3-supply = <&pm8916_s3>;
>  	vdd_l5-supply = <&pm8916_s3>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 9f31064..9805af0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -342,15 +342,39 @@
>  
>  		opp-200000000 {
>  			opp-hz = /bits/ 64 <200000000>;
> +			opp-microvolt = <1050000>;
>  		};
>  		opp-400000000 {
>  			opp-hz = /bits/ 64 <400000000>;
> +			opp-microvolt = <1050000>;
> +		};
> +		opp-533330000 {
> +			opp-hz = /bits/ 64 <533330000>;
> +			opp-microvolt = <1150000>;
>  		};
>  		opp-800000000 {
>  			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <1150000>;
>  		};
>  		opp-998400000 {
>  			opp-hz = /bits/ 64 <998400000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1094400000 {
> +			opp-hz = /bits/ 64 <1094400000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1152000000 {
> +			opp-hz = /bits/ 64 <1152000000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1209600000 {
> +			opp-hz = /bits/ 64 <1209600000>;
> +			opp-microvolt = <1350000>;
> +		};
> +		opp-1363200000 {
> +			opp-hz = /bits/ 64 <1363200000>;
> +			opp-microvolt = <1350000>;
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 0bcdf04..c9b9c4f 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -157,5 +157,11 @@
>  			vdd-micbias-supply = <&pm8916_l13>;
>  			#sound-dai-cells = <1>;
>  		};
> +
> +		spm_regulators: spm_regulators  {

There is the SPM regulator interface in the CPU subsystem, which is used
for hardware assisted entering and exiting of low power modes. And then
there's the direct PMIC control over SPMI. Except for the fact that the
SPM hardware uses SPMI for controlling the PMIC these are two different
things, and this is the SPMI one.

So the label, and node should be
		spmi_regulators: regulators {


Regards,
Bjorn

> +			compatible = "qcom,pm8916-regulators";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
