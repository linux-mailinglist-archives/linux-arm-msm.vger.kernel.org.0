Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22BE5206829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387614AbgFWXS0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387596AbgFWXSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:18:25 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB3BC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:18:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i12so173205pju.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pv5fYhHdfT+j+/8CDepP23KCELIyUAbwxjCT3/6Imj4=;
        b=xXkFFWodpLXbx+arhapQoMUcG+KyCVMEPfMO0gsEA10a36iFeBrkt7Hd5N4wOCpg0s
         DBuVfktF5Vfcttofp9SntDT//9mJpYU88z8uIzSQKEuqY76ZRI3/5hXn+KIzgQfjPZ8W
         v42VEM7Pfb9/kp6JcJiKYZxtt4EXwVspQTF6Turli+nebC8jKYhO0rdxuyBB2T6uLuAA
         AegLKmksvBpjeQl8RojFqM0bozIq3pSLixHzCgORwJYZE8Sv32qL2KyX5TZjNZda7pzI
         SV1h+55bVp5LD6ScjTBQmiI17aR5I2BgL9cp6HYaiXIQe3QFuXPr2RhYUSCAgvVqw6xO
         9Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pv5fYhHdfT+j+/8CDepP23KCELIyUAbwxjCT3/6Imj4=;
        b=G7knIOsapIIndUFkoici4rkkuhxRzaqVWTtJR5q3FlQ8PtovsipB9ECrC8glxwf7Iz
         ksNnVDcK6qEGdCEKBcH8R7BRBnlOIG6TGhbP1BfUp2FZZP8k6iQAIX8z45UlFpLt37Ow
         WMO6h24MGgYetenlaVSGD5tFHYpJPfHj4nBVGSMyyCF0aIfBSwc1YfZRAWfkBJQ7kyqA
         EhV9j1OaLHTRW4Irtyqb+6HHMnpzCaf51ZMdnlZYfLJd+Etu3xZ4Asu0UWy0Kx2sjlMm
         Lr1wnIMPfaK6b025NRPzAj4FMS1NRO83IVyXHZpyNEBb2zpdou/f2R9kt7iJYvxeI5jL
         tdPw==
X-Gm-Message-State: AOAM530bpysQ+O6B7JJP2bg1I/EeJxyjJhecGT2KsffWbPd0QPD+ggPv
        d4SYWwOot91CvS4Jx5Yf08kdrQ==
X-Google-Smtp-Source: ABdhPJz8VfxvmKvH1Ueuv23hHzI1AbDHHVfZFV2n3sS4ypRhJ0TX26s+R3uh0PLCsh0BxAKq7sxYiw==
X-Received: by 2002:a17:90a:f0cb:: with SMTP id fa11mr25146440pjb.113.1592954304498;
        Tue, 23 Jun 2020 16:18:24 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b4sm18336847pfg.75.2020.06.23.16.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:18:23 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:15:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/12] arm64: dts: qcom: msm8994: Add support for SMD
 RPM
Message-ID: <20200623231541.GH128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-5-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-5-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:

> Add support for SMD RPM, including pm8994 and pmi8994
> regulators.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 111 ++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index e7f4b06eb12c..a4edc3be7024 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -159,9 +159,100 @@ smem_mem: smem_region@6a00000 {
>  		};
>  	};
>  
> +	smd {
> +		compatible = "qcom,smd";
> +		rpm {
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +			qcom,ipc = <&apcs 8 0>;

Can you please extend qcom-apcs-ipc-mailbox and its binding to add
MSM8994 and use mboxes = <&apcs 0>; here instead?

I do see that while I added this support a few years ago I migrated some
of the remoteproc edges, but never any of the RPM ones. But it should
work...

> +			qcom,smd-edge = <15>;
> +			qcom,local-pid = <0>;
> +			qcom,remote-pid = <6>;
> +
> +			rpm-requests {
> +				compatible = "qcom,rpm-msm8994";
> +				qcom,smd-channels = "rpm_requests";
> +
> +				rpmcc: rpmcc {
> +					compatible = "qcom,rpmcc-msm8994";
> +					#clock-cells = <1>;
> +				};
> +
> +				pm8994_regulators: pm8994-regulators {

We've learned from experience that PMICs, naming of regulators and their
routing are board specific (or at least OEM specific).

So please give rpm-requests a label and add pm8994-regulators and
pmi8994-regulators to it in the board (your case platform) dts(i).

Regards,
Bjorn

> +					compatible = "qcom,rpm-pm8994-regulators";
> +					vdd_l1-supply = <&pm8994_s1>;
> +					vdd_l2_26_28-supply = <&pm8994_s3>;
> +					vdd_l3_11-supply = <&pm8994_s3>;
> +					vdd_l4_27_31-supply = <&pm8994_s3>;
> +					vdd_l5_7-supply = <&pm8994_s3>;
> +					vdd_l6_12_32-supply = <&pm8994_s5>;
> +					vdd_l8_16_30-supply = <&vreg_vph_pwr>;
> +					vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
> +					vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
> +					vdd_l14_15-supply = <&pm8994_s5>;
> +					vdd_l17_29-supply = <&vreg_vph_pwr>;
> +					vdd_l20_21-supply = <&vreg_vph_pwr>;
> +					vdd_l25-supply = <&pm8994_s5>;
> +					vdd_lvs1_2 = <&pm8994_s4>;
> +
> +					pm8994_s1: s1 {};
> +					pm8994_s2: s2 {};
> +					pm8994_s3: s3 {};
> +					pm8994_s4: s4 {};
> +					pm8994_s5: s5 {};
> +					pm8994_s6: s6 {};
> +					pm8994_s7: s7 {};
> +
> +					pm8994_l1: l1 {};
> +					pm8994_l2: l2 {};
> +					pm8994_l3: l3 {};
> +					pm8994_l4: l4 {};
> +					pm8994_l6: l6 {};
> +					pm8994_l8: l8 {};
> +					pm8994_l9: l9 {};
> +					pm8994_l10: l10 {};
> +					pm8994_l11: l11 {};
> +					pm8994_l12: l12 {};
> +					pm8994_l13: l13 {};
> +					pm8994_l14: l14 {};
> +					pm8994_l15: l15 {};
> +					pm8994_l16: l16 {};
> +					pm8994_l17: l17 {};
> +					pm8994_l18: l18 {};
> +					pm8994_l19: l19 {};
> +					pm8994_l20: l20 {};
> +					pm8994_l21: l21 {};
> +					pm8994_l22: l22 {};
> +					pm8994_l23: l23 {};
> +					pm8994_l24: l24 {};
> +					pm8994_l25: l25 {};
> +					pm8994_l26: l26 {};
> +					pm8994_l27: l27 {};
> +					pm8994_l28: l28 {};
> +					pm8994_l29: l29 {};
> +					pm8994_l30: l30 {};
> +					pm8994_l31: l31 {};
> +					pm8994_l32: l32 {};
> +
> +					pm8994_lvs1: lvs1 {};
> +					pm8994_lvs2: lvs2 {};
> +				};
> +
> +				pmi8994_regulators: pmi8994-regulators {
> +					compatible = "qcom,rpm-pmi8994-regulators";
> +
> +					pmi8994_s1: s1 {};
> +					pmi8994_s2: s2 {};
> +					pmi8994_s3: s3 {};
> +					pmi8994_bby: boost-bypass {};
> +				};
> +			};
> +		};
> +	};
> +
>  	smem {
>  		compatible = "qcom,smem";
>  		memory-region = <&smem_mem>;
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
>  		hwlocks = <&tcsr_mutex 3>;
>  	};
>  
> @@ -180,6 +271,11 @@ intc: interrupt-controller@f9000000 {
>  				  <0xf9002000 0x1000>;
>  		};
>  
> +		apcs: syscon@f900d000 {
> +			compatible = "syscon";
> +			reg = <0xf900d000 0x2000>;
> +		};
> +
>  		timer@f9020000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -256,6 +352,11 @@ gcc: clock-controller@fc400000 {
>  			reg = <0xfc400000 0x2000>;
>  		};
>  
> +		rpm_msg_ram: memory@fc428000 {
> +			compatible = "qcom,rpm-msg-ram";
> +			reg = <0xfc428000 0x4000>;
> +		};
> +
>  		restart@fc4ab000 {
>  			compatible = "qcom,pshold";
>  			reg = <0xfc4ab000 0x4>;
> @@ -473,5 +574,15 @@ timer {
>  					<1 4 0xff08>,
>  					<1 1 0xff08>;
>  	};
> +
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };
>  
> -- 
> 2.27.0
> 
