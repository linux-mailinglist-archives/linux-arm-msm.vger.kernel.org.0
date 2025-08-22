Return-Path: <linux-arm-msm+bounces-70378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5BB31609
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48C277AA9AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAB32E5406;
	Fri, 22 Aug 2025 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M13f2elA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B09E284669
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860500; cv=none; b=sUgZp8CEEdLe3fS1TZEfABFCbGT4UCkrrVZWeHSCmjl0D14PI84BdmZvXoUj1jdKvF2Xw9LR5CSJgTwBCjtV8p5bCA8aLs4Kox+oaIrlpydpDI0YnmZqh1fKrnYB1+DnA+YUwUkFF7OxaoRopVUo+Da5UwW5tXWnyFLPbfL6aeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860500; c=relaxed/simple;
	bh=1oIR3f6sQ1sG0GTI8Pw2PJtuQjPMw/nkuc5LlZXFwTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEe+pUfn85vBnnREGYMIPYaoUg/5HEwr9RHTd8vYQ+p+xM1S9+XeiLOJSNxbBFCxjK7v30tKjrYHKxhwro2gymAANx/XZbMPEoUcAcKDzzTAO9IgLV9+g0A2P0TapF2sSYa1X4qWlhA0F4pPAbLp7/n5/xiSYM3NAO7XMcTS2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M13f2elA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIdr003566
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpyG7EvRpdOl447CLef2b+TR
	MD4CwJUfVvwhnQyhNYo=; b=M13f2elAZwJeBzFTRWQHhrh8/YiTCcU3LZMX6Q+b
	YJgJ+Zj/y3EQZSu2nA1ab2Z5lh7Q2TXzK33X7Y/FmG2ifkpjWrPkZoUKwkCvynRz
	HpDeiwYLkySl8NDF9qTWo4yS/M1wSH1as+5heu3/tNWoCbUwYcvwU+aYbBxY0/Vv
	ak9BoBlYJmZUo+RktuZvgV9whYe7O2YzGQLYTAcH2mIBKZoV7wnaJ0WgXEF7tnH1
	3r0IZhNsDxJY6C3HNbUIx5yb4iG+ykPn+FQ4+KY80d3Bzy6PEvVErS8QuAK1lI9Q
	2l7C1lK5cHeTWswpIs1v7EWb+LV9LfXPAjYWuVsokH0aNg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298wht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:01:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-89018ea59e0so3334726241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755860497; x=1756465297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpyG7EvRpdOl447CLef2b+TRMD4CwJUfVvwhnQyhNYo=;
        b=ba0Q8x6ncfV373znL8wEi8cUbcOl59Ywx2WiTVfGBB+u959HbxAcuLfpy1L6RcwdEf
         lRuBKYgaxjFkdIEVz7BJBn4P5Q+egtV86Vqj00AXhASpQp4IiK6t3H5RhwEHeo/9lTNi
         DXxoBMX1aCa4sC3bXupbNsoFtUVkoyVjD8IT6/3xWgPmZgGxi/yEz/Bo7ccA2CLx2Gyt
         S834Q9RD1svrlgWAfJ5/zJjVAsjHxES3y12kYWNvKjHsKsrJEgmSs795pI86bwwI50iL
         8jvCYRyrTssI564eddN2HbOClADIouo3Lndoa9hJFNhkKKDXY46mTKpRfL4gk3h7E+St
         MPdg==
X-Forwarded-Encrypted: i=1; AJvYcCWoAhcCQyG8BVbGNcgjEnMEfsvUnzxt9j0NQmVsUFda04RR2H5LffsRZ9XEMxbJlj1TRU+EfFdjuax36OT/@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5j4Q6RxWEnOJrmzbGrCmW7Ye5+5v6SajrQCDQUyHUFBDdKuN
	SmOrHmYquXjhAck07CEBP51jIjmC1OPyzQu1MaLBXp3nm3ECNUTZTBl73DXG6FZ+sd42xd9baRh
	UA4WcXCGIWtcSe6T3TiSNkF81i+C34AhmmUh3aOOesyIKGfyyKni2bwdmwnaLkyHiYFwd
X-Gm-Gg: ASbGnctpS9DGb4f+g33nZxNPmwdva4GWe9My2qgnJer71/bTckgCzXlb8V4ps1/Ty7t
	eiXdwiak8v1w2ttPfOMfUPKqaPxEKQKebo/GqufaKNHoMxWekrxpj+Lm6cauHGpJ8Iyh4/t91y8
	07mWjfVob5uEytBF1a+OJnVVkvtQcpLc8CphjpY7KJRqNesq7Ktme5TmUXW/b6mdEFLbjRCItdl
	IiRC0Q7eTYy02TbpSOEL0idr+JgqgM0dMTRUfeqMFpKnyVum1FDa5fb43lSoND+T4AuObwTFNtK
	mELYGzPd0Uivqsth74L8BX6JQGO6q8V4d/kOX64LSvcycxQqtbW5QwCxRaXW6bzWnNSDpRgNZWC
	H9x6PlPagdIFifBbAtdplmsRrpg9W8FQOBMdlkoG6WF2bIYSHComv
X-Received: by 2002:a05:6102:5a8d:b0:517:1303:630f with SMTP id ada2fe7eead31-51d0cce4e4amr593654137.5.1755860495767;
        Fri, 22 Aug 2025 04:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGweYGL+U+B5slkwqq57ojJOnyc8XShcyRzoQeep4TEQavSriPWgyaDDgBU9fPmTMKCGI8tOw==
X-Received: by 2002:a05:6102:5a8d:b0:517:1303:630f with SMTP id ada2fe7eead31-51d0cce4e4amr593584137.5.1755860494355;
        Fri, 22 Aug 2025 04:01:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351685sm3539569e87.36.2025.08.22.04.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:01:32 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:01:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Message-ID: <as7pbmhfgsg3ht3s5lu25pfjjamaxyonuohkuohono3kr2mxii@posspuko4vwa>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a84e12 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=DvVwCw6QEd6eSbBiarEA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sPx7pIYO3IHaxPVeHDMymmnThH6vL3mL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX74L/KxXE1Jft
 IxHsAxUKhCgXmSI5WqpLJbscdI2zpgwQnlwru0tH+MxHFRbI1M72KOgm0tbMfbGr/FFVcuUUcbf
 fSnMXFb3rKq9fo+A74toc2CbE2qK2Hg4KixplLwZUAFFCmmGYodwoF80edTyog54MKR4UlrFn/E
 /9qVm6FCcWbuy+Q2I+hABWBTCCdBEkHs8+CTLpAjhJLruWvk07vTP51tgobX2HFxNKhGPqfoUeS
 AGlwynyRiUb1HYqg8NJOBOnoB/4MKGdfO9+tLv3csToaRkzklTlPZvI6b6LfYn8HsQQSWDs5bCr
 7fdnpP/sGD6e079mZwvC9DlRGIw1ktoGv4ZN5DjcO7zIrT8Rmv681HnWq1xQrad/dc69hGO28eb
 U9XIoNqbXsQELlz4mKQYF2IBWRBMBQ==
X-Proofpoint-GUID: sPx7pIYO3IHaxPVeHDMymmnThH6vL3mL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

On Thu, Aug 21, 2025 at 03:53:28PM +0200, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> Add all the data routing, disable mode switching and specify the
> QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
> the underlying DP phy.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -62,6 +62,20 @@ switch-lid {
>  		};
>  	};
>  
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +		pinctrl-0 = <&hdmi_hpd_default>;
> +		pinctrl-names = "default";

If this is a DP HPD signal, it should be a part of the DP device.

> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&usb_1_ss2_qmpphy_out>;

Please describe the transparent bridge too. It can be covered by the
simple-bridge.yaml / simple-bridge.c


> +			};
> +		};
> +	};
> +
>  	pmic-glink {
>  		compatible = "qcom,x1e80100-pmic-glink",
>  			     "qcom,sm8550-pmic-glink",
> @@ -1007,6 +1021,14 @@ &mdss_dp1_out {
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
>  
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +	data-lanes = <0 1 2 3>;
> +};
> +
>  &mdss_dp3 {
>  	/delete-property/ #sound-dai-cells;
>  
> @@ -1263,6 +1285,12 @@ &tlmm {
>  			       <72 2>, /* Secure EC I2C connection (?) */
>  			       <238 1>; /* UFS Reset */
>  
> +	hdmi_hpd_default: hdmi-hpd-default-state {
> +		pins = "gpio126";
> +		function = "usb2_dp";
> +		bias-disable;
> +	};
> +
>  	eusb3_reset_n: eusb3-reset-n-state {
>  		pins = "gpio6";
>  		function = "gpio";
> @@ -1486,6 +1514,22 @@ &usb_1_ss0_qmpphy_out {
>  	remote-endpoint = <&retimer_ss0_ss_in>;
>  };
>  
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	qcom,combo-initial-mode = "dp";
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_qmpphy_out {
> +	remote-endpoint = <&hdmi_con>;
> +};
> +
>  &usb_1_ss1_hsphy {
>  	vdd-supply = <&vreg_l3j_0p8>;
>  	vdda12-supply = <&vreg_l2j_1p2>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

