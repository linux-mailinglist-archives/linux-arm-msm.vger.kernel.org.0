Return-Path: <linux-arm-msm+bounces-73260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3ABB545C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 863304E0350
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B3C2AE77;
	Fri, 12 Sep 2025 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MlN9jErh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F8173
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666728; cv=none; b=CvUcodwZco77oIgzx7oSYWKGyZ5hjnVPCJSiKHkjdto65Xfi/pFcPmNRbtp53bCttHCJlgv8hGYl+r10rB535yKVocLxJ3Cxatq4bo3fMNFH8f5D4jKhFxDuMma+W7GyIS9Aw4He0rm4UBcVFa9hSUNL8ZYjak9h5NYdKiroU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666728; c=relaxed/simple;
	bh=y6SqD4opMLTBzB+vMKKrLNxDUqf3Md3exUO7Rz6xZAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1UFWcMDAhoZQodZi3u3xh5EDt4l8O1mpaYICPP7OHR9r17CUKMJxhpIlwh/SShpy5snV8CpDBPobcrQY1Ol0y4pcPDG/jex+AE5m6ZCbRoPUf6n2XBHOPDKwtlIEhHAZy0mu/zOozQV8mUwCtP9ge9aNbvrdZvbIERpD3GBV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MlN9jErh; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so3270276a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757666725; x=1758271525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4dmbNrsxYZOP/9r26krcI+hvxuOb8ZjJdTUVMQTp5Hk=;
        b=MlN9jErhtKqXP8y1RQOWjytADR0plhK54cdsS0aDXpIy/t5nwW8r7Df9CshQ5EqPeI
         huq5EykfNUT7SgPXa7kWE3MPNeheQkyj2sJ+eqD7C4KAdPU1bJ2P7E3jFEanOIF/yQnN
         /+2o4jaLg9u3iJrN5M8yaA8PBpo//Cgeniwmu/QMzuDjXcxgORUs+nfgL8dDnSW4mUyS
         oP6o35+ToEANDu41wDjimk4ruVBLbz8C59C8O8k5N2mbbB4kE8qg0zVLG7JMVZqy7NQJ
         cp98jAcu34cFkm0f0XFQPDbm0Kj8fhAYjXAnsa+xhbValh0SaM1Io6mk2K9XXd3YkjUN
         6RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757666725; x=1758271525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dmbNrsxYZOP/9r26krcI+hvxuOb8ZjJdTUVMQTp5Hk=;
        b=mxvSuxhxGCn+M5NFsrqpWlkgRHZJJah74DzwVMnXyni67RDIq5wRDCUYBgZWT0U5zS
         OiQKYgb0izyU+gWU1lgyAwzIVP8q0As3CKlvcn5hrf4oblyp9gzCyVOmzNbpSU14GG4G
         i6coDE4SvGtuDrXKjoCOXTvK9YqJTrVLbcJXPxrQ2r/ScHZvJU1mvePNsokJn8k+Fntf
         n50f/rLFwwSM4KwZ13EjROJBP5E5bVTRcic6HCiSVzKx3oLa5mjd/2LT+VaxhOlBgXSn
         U519uBLmOr0wC6mFsHxw5WFRlDF44d6B7w94drISY7ZqMkk1DfjwQlF/AzFX4C1pugng
         buFA==
X-Forwarded-Encrypted: i=1; AJvYcCWP1SbXi32e0RF7Df8YSFkxLLwMUCkdLt0HHq3RGhaT1HrcUH64bJJEiUuFx9KkgE6VSUpYL3ZXvvZ8T5ZS@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPu3WFs0exr7FHIBqxxGSPXnusozRoMwIen73i9+G60wk7HOQ
	FFeCNhDHzSu94rSUT80/+lBf+VvVZQVPx6LPvTnAqWArXAX5EghrQG/wBZcG9Q03Pp2iAQknwL5
	NQzmCrcX9zQ==
X-Gm-Gg: ASbGnct6jQx4aHgSBEx7Dt7/us4Y525ySUraypH4NSeyEI0mdHr1kONgjHF7G5NwAID
	ugfQLLK7+XU1KISa1WEVMGC+QquXby+5T1AuGtG1QzdBeB25F2zyxMyNzHbTA930R2fw4WWba9f
	JB7GYzrlhBqwyx5HBkSkrTyskzSz+PaLIqXuCINWwoI8TZ/G7GM2tbT2PHbF+2s1zdpkEXqscH2
	6t9zfVzzEHr3AH+mxYB6P08/DrnFaAxtROPosZGSLKx9/tfec/k9KOK8qArjLPwqd2oDXlUaD13
	qmzsBrqYKeVIYzIda8CVBoRMOo4+LSBTyDrxX/RqXqE3LVZDjI4VRzJtC9U8fmBeRgXB2dRClLG
	9QLbX6POCq4jn38jalKKcWNuQTg82/GWM
X-Google-Smtp-Source: AGHT+IH20RVCEo08tPDuflYf2M9BAiW07weceBSUqJQU9A4maSux1wFhb3cdo/qMf7Gm3yN0wAdi4Q==
X-Received: by 2002:a17:907:a07:b0:b04:2ee1:8e2 with SMTP id a640c23a62f3a-b07c37fd0e7mr168381766b.36.1757666725361;
        Fri, 12 Sep 2025 01:45:25 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:5fc2:ee41:2050:2d49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32ef574sm330539566b.73.2025.09.12.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:45:25 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:45:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wangao Wang <quic_wangaow@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/4] arm64: dts: qcom: x1e80100: add video node
Message-ID: <aMPdoa6wVEW9q9Sn@linaro.org>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-2-38ed7f2015f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-hamoa_initial-v11-2-38ed7f2015f7@oss.qualcomm.com>

On Wed, Sep 10, 2025 at 05:02:10PM +0800, YijieYang wrote:
> From: Wangao Wang <quic_wangaow@quicinc.com>
> 
> Add the IRIS video-codec node on X1E80100 platform to support video
> functionality.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 82 ++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 737c5dbd1c80..4a450738b695 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5186,6 +5186,88 @@ usb_1_ss1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
> +
> +			reg = <0x0 0x0aa00000 0x0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx";
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1947 0x0>;
> +			dma-coherent;
> +
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-192000000 {
> +					opp-hz = /bits/ 64 <192000000>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;

You need &rpmhpd_opp_svs here for one of the OPPs, because this
describes not just the requirements for the derived clocks but also the
requirements for the PLL itself. sm8550.dtsi has the same.

I didn't realize that you sent a DT patch for qcom,x1e80100-iris, so
I sent my own patch yesterday [1] that was just waiting for the
dt-bindings to land in linux-next.

Have you talked to your colleagues in the video team before submitting
this patch? I'm pretty sure they could have pointed that out during
internal review. They also have access to my patch (which has been
shared in a public branch for over a year now) and knew I was going to
send it as soon as the binding lands in linux-next. I just wish we could
have coordinated this better to avoid the duplicate work. :/

I suggest that you add a dependency on my patch series or postpone
enabling IRIS support for a follow up patch, it's better to have it
separate from a new board addition.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org/

