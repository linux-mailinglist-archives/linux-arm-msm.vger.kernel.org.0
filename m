Return-Path: <linux-arm-msm+bounces-66275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D9B0F130
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A177AE166
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13832D94B9;
	Wed, 23 Jul 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJZDle89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044924EF6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270245; cv=none; b=TsI+/VQ1HhEWmmrWoSUeQ0MVO/wb6dsQT1E9DferFIbweeuGzLR1MbfJgn53E/jIMZe2t1lAYn3nTW/02S/T5tFS3IO6Z1ddZLc2AmJNL8vrubK/RfAfvsJNRzZlErHeXcRlMmKUQHBycXLocVHcpM56m1ZXnMcUK/aJP3HgJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270245; c=relaxed/simple;
	bh=EWatrMv7fWUYR3nk40Qt126jSA2DEWg1MgTS3LGto4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5EARDDikr2tvvvMRHcs3UvuO7pXCtxcrleT5NDOuxhx33l4QfAiP9wsnxgAcWvdwapzzrClIueKmcq2I8tKS2OHvSz7M2pzS0z8hS/t/m3cYuvsgo3SgZ8R+zY/HlKs76BnBHDmEZJ9ZcEmdkbrP5LnX4t6bZs4pV8IuSHGFlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJZDle89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N91R1u031583
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DAtScC9U2/LEXJjXO/aUFYiP
	mdGuZpX7tUt+7DQMPkA=; b=aJZDle89SyGyj19CclERgKtzLsiFbZdgHYAJoaec
	bfu1r57PbRZYjogk88Q6ZMC+yJUYYSSYy5CrOU0MuyG0bCUSwrF5oiMVNvLtFC/a
	3yhCoPl2snU9lPmnXSb8PG2yZxYWygTHhl92w2RaFoU6GSldFon1qMpIQLVrp+6W
	Tpg6AcPEPW03UonC99APNZQbLOorlyRDIUt9Z0EfdEQO2ftmMHsqS0pjTdSWFu4w
	M7QWAQMWAg0/9zvsHVZHdZ4RW5W0c0+8WC0Q0D31MNcmPBForsYLjeVL+uujs6a3
	PzlAlbP9yYU6cHZZSXkArgUudwt7ZrlBnCYhPY4jiU+ssg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s4yqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:30:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e333fae758so1380655285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270241; x=1753875041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAtScC9U2/LEXJjXO/aUFYiPmdGuZpX7tUt+7DQMPkA=;
        b=QLcmbrgGv0C2YR/i/vseOxYL9JnV1BJfLUEu4MJZdFgSyo04LpFGxUg2MW4WizJ1ce
         V/fQcp/VG9QoMVTM8e5xMN4ognuGwZ6IfRaHzagkRU42fSuDbWUjhcBviRCTLzFSwwmR
         ltixV9fx5ul61ZU101HZIfQYaiIjpumuZcr4SmozKmjyT68VJQ9yqahh8A/tBBE5gO/l
         JYPy9YnoVRRVThGml8LcsBKz2vPHJxLPQYTDkWqWKR2ciDY1rc94vSqxFZ5SyhIrmWVl
         TZM0KnqPyvOGNvuWKLFc04yX/epKsytr7ujLKWx8+nI56elw0KEM5funyacWum1Vc3T1
         sGIw==
X-Forwarded-Encrypted: i=1; AJvYcCUopSQkb67JYyAAwpM+Bg2X03c+3wKhe9V016CdpJEHiU+c9t5yya4Dtz+cCeGBA7xGojb4tG2wWXT2mYAt@vger.kernel.org
X-Gm-Message-State: AOJu0YyeGlu5xCq8kwNv+Ifs+1+Nq0t3A/w8T7avjNtat6J0rbBvc8d4
	Kh/a7p6V4NSXWikuFzaiEQvA0SaGS/yaMByZbZA9Kh2X91/q8LIm63TAKFWSRJ9aKMtNy9urV1u
	uk7iM3JD7wa7+ctw95fHWp6e2ry6TBA0PFZ/T3riwTvhB6tsX9kwHKQCp2O75K6meX32w
X-Gm-Gg: ASbGnctz8sRl5pbVMflTh0TGuBm44wJWmrEeaT0gOvvxroUxh496B7DJwKWkuXTUnA0
	fyAfQ8DYXu0OchFicqY2SuCjYHybroMF5SE7jO1q9rkFJdDylMvybmDiu4ATfVJeaoF5d+/vsqZ
	mL+aZ6SJdSyz59784VFC/3xbPQG1gZjVR7Vu3TIdlhrvyhssDwjiVd8Vb89+r//1DxXMMgRfuiJ
	pDLHRysmabO1U9mWSE44Zx/36MUpskift7L8TaqB3My2mZ5syEVW42AANhMEh+NRHvHFmNT5eDZ
	8/PPqai6amlvzJeMIvuw+AdCu+y0NtWgRY/ulWT4bqVeABJ65CrSGoEsYQyv6wgYhbr8gXvzxNg
	D9tip0P2z41AxtuPtiE4POiPBv+YOc4mdpfKTqLxBKdaPxEWd+EdW
X-Received: by 2002:a05:6214:500d:b0:6fb:4e82:6e8 with SMTP id 6a1803df08f44-7070051b347mr30980326d6.14.1753270240594;
        Wed, 23 Jul 2025 04:30:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ+GLEEib9onDeXbPXYW5/AUdlXc10aPzgae7rtBYPCKLr2fEo8PRMQxKOYdVJN7ScBBPsKg==
X-Received: by 2002:a05:6214:500d:b0:6fb:4e82:6e8 with SMTP id 6a1803df08f44-7070051b347mr30979846d6.14.1753270239974;
        Wed, 23 Jul 2025 04:30:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91da0dbsm19146101fa.89.2025.07.23.04.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:30:39 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:30:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Message-ID: <kad3hqxufsdescelmjhwy45ggnukh435wmo5wbbl6pfz2gq5ge@ycfsgtuwdkcl>
References: <20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NyBTYWx0ZWRfX42KxATYkkNn9
 kExNR0iMcL/yOox8ZWakLJ3q9GrW5tMcFasVnBDaZR7JeuegWd4hcGda62qoUrICDMBTFFmBNAi
 IdEq7DkwOMhbCiKEtibcuFVMqT8TO2K1djjBZsRiqM7slxiVkpxCw3hr8GzcxxVHEyKz99ELYMF
 XuyOXz6eTeruCWD+dFrPIQK8aRA51IfzaUVrUcoFt+skxZSgvQTvGfja7GNzeKM2mlS1IY/Vwcz
 igSdUxZTscKZmv2i6Tn4mlTiqmBBk/EgHnot0bUwAkw/uLKPd4/N4teGGXmoNN1D7b5zt27GZts
 h2To2aHC1skvgnXUfIorsGDvKFwFziWqsi+YsB4TccjJgWTscCQLu69qlodqpaw/waJ9Jhv3GQX
 bsbD0KWxt5r2A3FFeCx8eFmkvferQzM7sazbVrw0QNU5b2gNNlsR1qWOLVkRB1CtZt+KjP6d
X-Proofpoint-ORIG-GUID: yEO3JPhY78w4BauubKUPVHc0jeYuynIr
X-Proofpoint-GUID: yEO3JPhY78w4BauubKUPVHc0jeYuynIr
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880c7e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tshmjInBByzUM6WNTOAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230097

On Mon, Jun 30, 2025 at 02:20:15PM +0530, Kathiravan Thirumoorthy wrote:
> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
> first SE, which supports a 4-wire UART configuration suitable for
> applications such as HS-UART.
> 
> Note that the required initialization for this SE is not handled by the
> bootloader. Therefore, add the SE node in the device tree but keep it
> disabled. Enable it once Linux gains support for configuring the SE,
> allowing to use in relevant RDPs.

What about documenting it as status = "reserved" + comment and then
enabling it once QUP patches land?

> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v3:
> - Add the pinctrl configuration for the SE (Konrad)
> - Link to v2:
>   https://lore.kernel.org/linux-arm-msm/20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com/
> Changes in v2:
> - Correct the interrupt number
> - Link to v1:
>   https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  9 +++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index 1f89530cb0353898e0ac83e67dfd32721ede88f8..8dee436464cb588fdde707b06bd93302b2499454 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -224,6 +224,13 @@ data-pins {
>  		};
>  	};
>  
> +	uart0_pins: uart0-default-state {
> +		pins = "gpio10", "gpio11", "gpio12", "gpio13";
> +		function = "uart0";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +
>  	pcie2_default_state: pcie2-default-state {
>  		pins = "gpio31";
>  		function = "gpio";
> @@ -239,6 +246,11 @@ pcie3_default_state: pcie3-default-state {
>  	};
>  };
>  
> +&uart0 {
> +	pinctrl-0 = <&uart0_pins>;
> +	pinctrl-names = "default";
> +};
> +
>  &uart1 {
>  	pinctrl-0 = <&uart1_pins>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 66bd2261eb25d79051adddef604c55f5b01e6e8b..2b8499422a8a9a2f63e1af9ae8c189bafe690514 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  
> +			uart0: serial@1a80000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x01a80000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>  			uart1: serial@1a84000 {
>  				compatible = "qcom,geni-debug-uart";
>  				reg = <0 0x01a84000 0 0x4000>;
> 
> ---
> base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
> change-id: 20250630-ipq5424_hsuart-0cf24b443abb
> 
> Best regards,
> -- 
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

