Return-Path: <linux-arm-msm+bounces-78587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D9C01088
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 283131A61120
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD872D7818;
	Thu, 23 Oct 2025 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UtItQApN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF7272E41
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221690; cv=none; b=K19ka1kyO+wUVKVn39+yQySPyuDTCT0xjE3UMmk1KQlkpq3xxghFJULEDcpzg/oIT8RnjB9ixzvYRJsGE8Hpb5ZDAPP230HiNZMGswjDYCCO8lCec9S74vEhZt1ZFggAMudHm7p5To+UWNDsVxB7XL5G5DRr+qx6+PvdR94D1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221690; c=relaxed/simple;
	bh=ZhystKoo43Dti+bpSBJIod4fu4Bu+YnvXyc3sQZGb9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unP1GcgqP6XP//S9l0A/rdYA9M1RaAfSuCn3s3Sx9KbsldaX97MpFR8QJ77XRvFP/alryGvkngFFFcnOxpHzBYwEnUGPvAGToNZoVnrv1UTTE/0QPr6ckQobdYEqVajp9CkgANSoLIccLuww8+Nq0DbBXZ3FOLnDPbH8xqs9BnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UtItQApN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so6063825e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761221681; x=1761826481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vzSn/ofpSQ3cyLuuE3gy3xtWs7k4M2brzlRD1/+xzHg=;
        b=UtItQApNiPpb0l5qHWINiHPshhfGZXyPSdjAKSDTSS9SYTz5HDXXsVZu0EJoSONd/3
         HB8ztJ1Q1bn/plet/jmyWQgxt82UgGgE4OQOTIgTeotL64fgTmx3s/jSezhWCmjb0d+O
         tm81s38wbNbrxGIwiALsPAX4Mka9SiJtX/qI7Hm5uvk/aFeF/04Vm7bH1MTbGCboDDpw
         29wxQbspixRaFpUqiIDnUtokhQm3CfAADksbXzbklqmCIkORsn5HUclfWXVVRgk27tMF
         qMKpJA+0mAlx13XzDXZTwgELI4ZxIE/gUow1GugBNdzoGcW1JXY+CrzYEuTmq7N6xUjx
         dwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221681; x=1761826481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzSn/ofpSQ3cyLuuE3gy3xtWs7k4M2brzlRD1/+xzHg=;
        b=VOG8GuthQuAQc2RHwHDxuRr5SyIyvLDNDFuC13vNNXwVoYbNWwOyuDMHitAcwYjM62
         EJpXQYL9f6QTyAKDFZP64kjJiIh1WvVmq/ZiowARj01rNjgCJBzcIDLM8Rh/s9NCiMcB
         Atd1UCLpgiVfOT7HfQHeUXmhQKQDxji49AGGJXdwqrtpORYjFdrOXHpYCZDhWdLdHk8C
         4byRSjIM0/txFXl9+qzYq8v9PiP+zSEmnpDXTf9SM1kr9SJpvUzbqPP0BT9fhzKZp+S+
         dZWLJ0MVZaYQ9jGoGGoIg/W+HoJp49ZIrQGGkVVilPGMLFnjaIqwBlibUDwhXa0JyueN
         dJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4VBXapP/vYOgw9nGKzkajbP4smKUeeZ/kOzsfrloA3fGAsHHoMQEevAdiN3WQ4UWvFLvP0PixYjOT3zA@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSmVmv/kDHcUv1WCjFzDogDQgGT7pdXn9U02DsqPqD++/p1yN
	/n3WASpSni2VMeYio+akdNcNsGzdSip5UDyUk8Lqf8cIVYIeUMaRrGOh2wNvkdUyPnE=
X-Gm-Gg: ASbGncsZuzowd3jraB8Go4qk+gmy12aHb/SMzj/NhjcVxRcUx8yAea34rNOKhrt/6YT
	d9uYxoTnHi5tEXntqlCpu7C1SuiFw/UtNUjVOk71cxi2I3v9GlgmgZQMq+XTtfiLVeFo5iXe7G7
	dhLrxWSpgPMtO/AcgtqdxT5K3SAefc7j6I54EddpiY5e4pNoC3mqATJiAGcHBccKzI37NwF6Q+1
	0pSM6L59ygoWbPgDE85YQkE7q9034i45JKgCt+czlWF5zvzKk7aCvs4f6z1jIRA0V8hz1inGH/7
	iNfZQgTyxIsu2Q29qHAQmVphrcHslpLwUtrzqLei00bVNhFzdbmLD4rjOoK/g27MqaOJTVorbdc
	z9+XmzORPSdj6jQXEAxcgx5wk6Fg83OB8/STsRKPnX6ahRZdTam7k4WVD+hHmVfiYYfZqtH1HBH
	DLaDXSiJZYJkakPzdggg==
X-Google-Smtp-Source: AGHT+IGa6YZVedfz0mGpkJYgXn+quvhlbpzP0Y7djJyWwUQrWVTgUOvmVrts9NVOpQ28SystD6Xtkg==
X-Received: by 2002:a05:600c:34c7:b0:46f:b42e:e360 with SMTP id 5b1f17b1804b1-47117931edcmr178691255e9.40.1761221680862;
        Thu, 23 Oct 2025 05:14:40 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccd88sm4402444f8f.36.2025.10.23.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:14:39 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:14:37 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V2 2/4] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
Message-ID: <kbbebw2kr3hu6q3sb4z3i7yy7vv432rjx2ylp254cbifpcxe33@bhyldim36fff>
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
 <20251023112924.1073811-3-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023112924.1073811-3-sarthak.garg@oss.qualcomm.com>

On 25-10-23 16:59:22, Sarthak Garg wrote:
> Add SD Card host controller for sm8750 soc.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index a82d9867c7cb..1070dc5ea196 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2060,6 +2060,60 @@ ice: crypto@1d88000 {
>  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>  		};
>  
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +
> +			qcom,dll-config = <0x0007442c>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			iommus = <&apps_smmu 0x540 0x0>;
> +			dma-coherent;
> +
> +			bus-width = <4>;
> +			max-sd-hs-hz = <37500000>;
> +
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +
> +			status = "disabled";
> +
> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-202000000 {
> +					opp-hz = /bits/ 64 <202000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +			};
> +		};
> +
>  		cryptobam: dma-controller@1dc4000 {
>  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>  			reg = <0x0 0x01dc4000 0x0 0x28000>;
> @@ -3121,6 +3175,13 @@ data-pins {
>  					drive-strength = <2>;
>  					bias-pull-up;
>  				};
> +
> +				card-detect-pins {
> +					pins = "gpio55";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};

These are board specific, so move them to the board dts.

>  			};
>  
>  			sdc2_default: sdc2-default-state {
> @@ -3141,6 +3202,13 @@ data-pins {
>  					drive-strength = <10>;
>  					bias-pull-up;
>  				};
> +
> +				card-detect-pins {
> +					pins = "gpio55";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};

Ditto.

>  			};
>  		};
>  
> -- 
> 2.34.1
> 

