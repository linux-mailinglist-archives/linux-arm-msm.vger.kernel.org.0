Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C3A1337BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 00:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgAGXz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 18:55:59 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41975 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgAGXz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 18:55:59 -0500
Received: by mail-pl1-f193.google.com with SMTP id bd4so340187plb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 15:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eVfCAjHr8+dbJmNmn+dKRjiRB0Sq6Fwoxhpw2Aept5o=;
        b=Mb0cv1J8JjINvofbY5sOmDuRVsdaZp42MUUTQDTOfrlTTqBCsSuu2p/unvyw5LJsYQ
         rL5rcyfloTvxfDl0VhLbu04SaLxsX2X0XET9oxb9v37T6nTn2c8rjGloaVLx47jxocCO
         CU2YAjBNS7FfolPUc2uubug1u5+LrYfN5NAbpytOAjTd2X0E0TSKH5AHcyZm9gvb+TsN
         Lv/Y1kWOt7N11kMzoGtsjBBnHRWy4IIKwmx8bnvqXqctFTwxZ/w3QoZjAeXqBvG+UJVw
         ptxDbj5VIbm9flhpxwRVcEpjs5szS9geBE76EK9j+XiLeKl4ZmbdcvKfmyBgnFVJZyQA
         AOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eVfCAjHr8+dbJmNmn+dKRjiRB0Sq6Fwoxhpw2Aept5o=;
        b=csmL0qUR8LpsHup58LLX3ymA1sX7Ye9Wy1+G/tVBFwcGayzZfMKk+WQvQaqk88AOlX
         dC8ZsB4poZW6h5v+bACO285OpA4yKRcPGAJRH5ToccasjRwaIM9s7CfUObqN8V2UKP2v
         L8XMevFL3wvGjrulCKSKsXnu5GkCMY0kucOheswYHLbdq0ulKi/GevcFFK8KJRCIWkUx
         HAACHxKGgXXSzsuEWh0sUem4iNINT8K7TCVnjW2EFFkU4e5tc3Mf5cnx+LunsLEdT4ef
         rJfeqDYygCgCceOmVWo2vTFXo5IHJwjMdwCoN/i5tfKEEP++OWlaiVAiuN7ApB8yIMxz
         2q7A==
X-Gm-Message-State: APjAAAUrmH4jIeVhc1urHoaJBEwYxxLSGXYBCDtrufinPrnZEDE6I7k2
        9wiMSTZqvnx/JCMj5A7XjZ5ECQ==
X-Google-Smtp-Source: APXvYqwiSbVYQudH/NDZIfbddzhJE1/7RlRr4QfgtcuV6b3AJfbkTXHqdmYNsuFzmdT4Wh8shx9/lg==
X-Received: by 2002:a17:90a:c588:: with SMTP id l8mr1165900pjt.69.1578441358461;
        Tue, 07 Jan 2020 15:55:58 -0800 (PST)
Received: from yoga ([2607:fb90:2847:68b5:4ce0:3dff:fe1c:88ba])
        by smtp.gmail.com with ESMTPSA id z29sm903994pge.21.2020.01.07.15.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 15:55:57 -0800 (PST)
Date:   Tue, 7 Jan 2020 15:55:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: apq8096-db820c: Fix VDD core voltage
Message-ID: <20200107235553.GC738324@yoga>
References: <1578401755-26211-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578401755-26211-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Jan 04:55 PST 2020, Loic Poulain wrote:

> APQ8096 has its VDD APC (Power for quad Kryo applications
> microprocessors) powered by PM8996 PMIC S9, S10, S11 tri-phase
> regulators (gang). The bootloader may have configured these
> regulators with non sustainable default values, leading to sporadic
> hangs under CPU stress tests (cpufreq-bench). Ideally we should enable
> voltage scaling along with frequency scaling, but for now just set the
> regulator gang value to a sane voltage, capable of supporting highest
> frequencies (turbo).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Thanks for the update Loic, this looks good, so I've picked it up for
5.6

Regards,
Bjorn

> ---
>  v2: Move pm8994_spmi_regulators node to pm8994 dtsi
>      Move syscon to msm8996 dtsi
>      lower case for addresses
> 
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi        |  5 +++++
>  arch/arm64/boot/dts/qcom/pm8994.dtsi         |  4 ++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index dba3488..89c7b19 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -669,6 +669,22 @@
>  	};
>  };
>  
> +&pm8994_spmi_regulators {
> +	qcom,saw-reg = <&saw3>;
> +	s9 {
> +		qcom,saw-slave;
> +	};
> +	s10 {
> +		qcom,saw-slave;
> +	};
> +	s11 {
> +		qcom,saw-leader;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1230000>;
> +		regulator-max-microvolt = <1230000>;
> +	};
> +};
> +
>  &spmi_bus {
>  	pmic@0 {
>  		pon@800 {
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4ca2e7b..715f26e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -611,6 +611,11 @@
>  			reg = <0x7a0000 0x18000>;
>  		};
>  
> +		saw3: syscon@9a10000 {
> +			compatible = "syscon";
> +			reg = <0x09a10000 0x1000>;
> +		};
> +
>  		intc: interrupt-controller@9bc0000 {
>  			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>  			#interrupt-cells = <3>;
> diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
> index 76b5a3e..7e4f777 100644
> --- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
> @@ -85,5 +85,9 @@
>  		reg = <0x1 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		pm8994_spmi_regulators: regulators {
> +			compatible = "qcom,pm8994-regulators";
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
