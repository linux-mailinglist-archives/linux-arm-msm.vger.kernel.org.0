Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E2B41FE73
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 00:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbhJBW0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Oct 2021 18:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbhJBW0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Oct 2021 18:26:55 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B765FC061714
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Oct 2021 15:25:08 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id c6-20020a9d2786000000b005471981d559so16376794otb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Oct 2021 15:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kwLCMDXG5tAutueUhhnC0ulekbfLXbc2/QpfBcJC3Gc=;
        b=CkzgWwYsO1rSY3eTTWbbReNUToQcUrXoV84rcZmMa1U/c92fjnIMLQtF5Bpd1p2bph
         2fCGkp7WOivVcgol091VH/53AwvG9KqaL4wjUiMRSdGQQxTS1dkYtt7AdlnywaB35vy5
         6axVGYOBvZEVfZUse1/JBnuDQvUucr4GZfSyXMwExBPYXAuj29Q9s55XV6ut3iXBFqLO
         Kt9VjlcXmI2LDRuUdfr5R93iFlnc0yPiS/olVIf1cDTT0EZ/Q9+1ncDsizTuVrNpxUz0
         350Ux8d/wjAtvh/8v9NsenQtHGY9ZWgoti3qacnUcC7EUaeIvutihvy7PVqYURMOKVpN
         /EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kwLCMDXG5tAutueUhhnC0ulekbfLXbc2/QpfBcJC3Gc=;
        b=EsV5CqOQyHuXKsV0A6BRVouieiaMEns01aT+IhTPTrOSIObHUc8iYt9J/WUbvPFz0k
         gbMStNPlG7Hrwn3X8nkw80CfKXqrG9dUBKf5MhB0aLZSED789/zoeVPw0aD+7SH7Scy0
         9N6MK6Frr6+P9abT+FzVIXjerYcgXywN2rGoLCP5klTzxTRqnKgaTgz78C0flwPVrEmp
         jjlIva9Hz8aCNURLgEVpTtl1rrg5eKmRtl3z3MExUHfwcv8d3mWPhHOJRGoeTzermSoG
         DlymN8r3fd7HMKNVE55s4T9OMy0b6XisWHAuVb8DIJeN24NOCGHM3ESDE9hLD2mPAEHP
         wXgA==
X-Gm-Message-State: AOAM531yOim/WXpis7VdzQpbj+YODTaK1areB6Z6v5PV2N/6r4Ulcmes
        hqLqW4yReMETkPwgjEprFO9dDQ==
X-Google-Smtp-Source: ABdhPJz/k9T2u/nP84ZQY8F3jRkfJcpbw3hwNCZNaDcXk4TDyHyTla1Or+E+xjTwPwQOHaVFyHb8xg==
X-Received: by 2002:a9d:750f:: with SMTP id r15mr4158632otk.24.1633213507901;
        Sat, 02 Oct 2021 15:25:07 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id i12sm1862271oik.50.2021.10.02.15.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 15:25:07 -0700 (PDT)
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm845: Disable Adreno, modem and
 Venus by default
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211002001358.45920-1-konrad.dybcio@somainline.org>
 <20211002001358.45920-3-konrad.dybcio@somainline.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <67e12e31-2eb3-fea6-822e-56836aabc0d2@kali.org>
Date:   Sat, 2 Oct 2021 17:25:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211002001358.45920-3-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/1/21 7:13 PM, Konrad Dybcio wrote:
> Components that rely on proprietary (not to mention signed!) firmware should
> not be enabled by default, as lack of the aforementioned firmware could cause
> various issues, from random errors to straight-up failing to boot.
>
> Re-enable these remote processors on boards that didn't previously explicitly
> disable them.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                 |  8 ++++++++
>  5 files changed, 50 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index dfd1b42c07fd..1f8a26f36f2e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -616,6 +616,14 @@ touchscreen@10 {
>  	};
>  };
>  
> +&gmu {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
>  &ipa {
>  	status = "okay";
>  	modem-init;
> @@ -643,6 +651,8 @@ &adreno_smmu {
>  };
>  
>  &mss_pil {
> +	status = "okay";
> +
>  	iommus = <&apps_smmu 0x781 0x0>,
>  		 <&apps_smmu 0x724 0x3>;
>  };
> @@ -1317,6 +1327,8 @@ config {
>  };
>  
>  &venus {
> +	status = "okay";
> +
>  	video-firmware {
>  		iommus = <&apps_smmu 0x10b2 0x0>;
>  	};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 52dd7a858231..bccc90a469ab 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -439,7 +439,13 @@ &gcc {
>  			   <GCC_LPASS_SWAY_CLK>;
>  };
>  
> +&gmu {
> +	status = "okay";
> +};
> +
>  &gpu {
> +	status = "okay";
> +
>  	zap-shader {
>  		memory-region = <&gpu_mem>;
>  		firmware-name = "qcom/sdm845/a630_zap.mbn";
> @@ -566,6 +572,10 @@ &usb_2_qmpphy {
>  	vdda-pll-supply = <&vdda_usb2_ss_core>;
>  };
>  
> +&venus {
> +	status = "okay";
> +};
> +
>  &wifi {
>  	status = "okay";
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index d4355522374a..2f8942542788 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -362,7 +362,13 @@ &gcc {
>  				<GCC_LPASS_SWAY_CLK>;
>  };
>  
> +&gmu {
> +	status = "okay";
> +};
> +
>  &gpu {
> +	status = "okay";
> +
>  	zap-shader {
>  		memory-region = <&gpu_mem>;
>  		firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
> @@ -641,6 +647,10 @@ mux {
>  	};
>  };
>  
> +&venus {
> +	status = "okay";
> +};
> +
>  &wifi {
>  	status = "okay";
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index c60c8c640e17..51cfe6f31bec 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> @@ -256,7 +256,13 @@ &gcc {
>  			   <GCC_LPASS_SWAY_CLK>;
>  };
>  
> +&gmu {
> +	status = "okay";
> +};
> +
>  &gpu {
> +	status = "okay";
> +
>  	zap-shader {
>  		memory-region = <&gpu_mem>;
>  		firmware-name = "qcom/sdm845/a630_zap.mbn";
> @@ -513,6 +519,10 @@ &usb_1_qmpphy {
>  	vdda-pll-supply = <&vreg_l1a_0p875>;
>  };
>  
> +&venus {
> +	status = "okay";
> +};
> +
>  &wcd9340{
>  	pinctrl-0 = <&wcd_intr_default>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index edfff955ca02..970e92188503 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3004,6 +3004,8 @@ mss_pil: remoteproc@4080000 {
>  					<&rpmhpd SDM845_MSS>;
>  			power-domain-names = "cx", "mx", "mss";
>  
> +			status = "disabled";
> +
>  			mba {
>  				memory-region = <&mba_region>;
>  			};
> @@ -3898,6 +3900,8 @@ venus: video-codec@aa00000 {
>  					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
>  			interconnect-names = "video-mem", "cpu-cfg";
>  
> +			status = "disabled";
> +
>  			video-core0 {
>  				compatible = "venus-decoder";
>  			};
> @@ -4432,6 +4436,8 @@ gpu: gpu@5000000 {
>  			interconnects = <&mem_noc MASTER_GFX3D 0 &mem_noc SLAVE_EBI1 0>;
>  			interconnect-names = "gfx-mem";
>  
> +			status = "disabled";
> +
>  			gpu_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> @@ -4527,6 +4533,8 @@ gmu: gmu@506a000 {
>  
>  			operating-points-v2 = <&gmu_opp_table>;
>  
> +			status = "disabled";
> +
>  			gmu_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
This missed the Lenovo Yoga C630 inherits from sdm845 and breaks it.
