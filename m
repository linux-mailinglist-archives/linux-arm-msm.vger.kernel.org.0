Return-Path: <linux-arm-msm+bounces-77983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55844BF0C44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CF074F27FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2D725229C;
	Mon, 20 Oct 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0PMpr0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D037F2F83AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958744; cv=none; b=LHm+dUZrqzPM2gK00oV3hsOBaqRcfCKN/EtT8X0XGEiD3U+RyFVk0GFOPphtmMQsHJ5au4cq0Pnp0iuTI7oXOv8oyBAFyV1S0UNj/PcAgUhrjvfjTPR3azNxdMEi7ztTWWmp+wMGpHL7Srsb9D+TxjaVaXLz7Ix5LO6vLvV52gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958744; c=relaxed/simple;
	bh=XD47O9TRxnWUCcBap4YFeLUUHeVW6Hw0uiOjDC7QDf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkyIwFPwXJKAr5tRohZjWY+BjXIWHQsHYZe0HD4r75yslPgp4fWOoH+quRQXXoTb+BJPUtPgEkMJSqWy8n+Zon45UEeo+D9pYzPPr/cdcl1Wea9YWN5tYUl0FFy94NRMatePkabSRptdeo3j2MRDas/IiUYaBfD2ksOniPOf3Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0PMpr0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JNNGvj010042
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BwZA/OA1ZRMqrTJrXUO28pcOEUZxmfCKbigqTbLybU=; b=E0PMpr0gLIIeh0CZ
	B4q4Qm8CUYNqdxQVLzNi+7F+Fmd0XaBLkUWsJdMTgq7oR3n7WcIYV49I/s3eJzPS
	M6ytRZ/5Gb48pV0qbcHFwxzN6bQ7iWi+iPkD877hoKMW4VUsx/TEHSUb8/yaDRrN
	PV3aeVtkQwfUEAj8P7qQsbj6h2O+TYWsl3UqkOJMzLJ212m8IqsQh344wDUFyLaF
	xS4TDquX4potZ59p7KhUY76j72ylI9uywRZ7Yg33dfBdMQTJyu4vwEo9sMc9snwp
	bkYMu3E93J4tlZpZAam+dnMhhomTC8rxPpS/Fx6ul3GSUeyhd+eX0Jd9YA793/kV
	TaAS1g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv4gb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:12:21 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7c2831b149aso4798050a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 04:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958740; x=1761563540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BwZA/OA1ZRMqrTJrXUO28pcOEUZxmfCKbigqTbLybU=;
        b=JutUZSJy5/vFNRDFgyEqgowH0zuTUr0GtGuS7Tnq8pOx5MzE5CaeQBxKPMt0l/RGWN
         F6H9r/0AxwjpBz7eBQQdrOvSzSjyZPPUbefe+8Olni5VtycMWdI/8/0nzI+5Jt8feMcw
         1q4fRlj41eO5rO4l2fGH1+E7E1qAhzm3Tm+jx1ZQy/os5ZMqciJHccskpYwGO+dgdMZt
         QI1M1LnC8JtQbIGYVvY/WdKoZsmOFA7Z6U2Q+26BwqXOgdV5bmbR3Em0Hj6/pp0Z2DiR
         BKeeMX+GxuYsxX5sjxrx5DcWxhni0JdWIs4cDTuVowAvvKQGUhLCcFEkDYzMF7fEUswD
         jZnA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Jhgjm3V3K0X2u2DPCPowIYJlQea7BURpRQpZydlv7TLwug4U/wKiXfOOlco/TenGMUzBo85+02rkYwAJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6UJAh9k3C6Y0URsID+xcJtsipZDLFhGsM809EHOezdGrksV6
	Hh5cpq/nWx4GjkdjXejQGnU6vKAl9GFcIsjtsd1nIraZsCgAb/R/ijF1DJ79NJ4LDHe4fSE9Sy9
	PkSona0gFBqU2roXJ9CeH7HQQc19A9e8+Q8Bp1XrNEq5loC/zZP6eu/YyuZ9f1f1qjKtO7DaTwK
	M4
X-Gm-Gg: ASbGncs7b//iyqNI8za397mHXaxOlUhgJ1BACqqMCwqCr5JMq+Wv0wgafKjEOdI9WD8
	bmFX9ZifQ0j6fKFLbds4JEMDunE+GDbTx3dXUzGjFSyNns4ZyQumimyBRhBlJWUcmCByoWmv0ei
	ALAz8rZVtlGdpsvsJcC05ijYTEWOPgELR7i77C4+4v5Gl5ZihBlZZlx2isEKMr7Dz4ZKCPOPEHj
	OjbMrO83LilEnLyktSUVROhJe0r97IGFNET1rFcr4RjhdLv4qe25Z0jyiYxfoeAJWLl4TgyhvaE
	sZkJ796//y9H5Wettb8cxbUfV1UA0f+6DxoFKgfVpbqySmLVkn6wvz1Hg4J4VIrrlaGTwxL85eN
	w78RsZ17qBzfivR0CzcSNbSN2tQpcb+V4Bggo56MIE1pGlJSGqbSatoQW/T/pDn6aKwNbMHanrd
	zvi6Sosn4NBR4=
X-Received: by 2002:a05:6808:6d82:b0:441:c8af:291d with SMTP id 5614622812f47-443a30953d3mr4937005b6e.42.1760958740627;
        Mon, 20 Oct 2025 04:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqN48xKzVO8tsbOssT4BHqejlmeJeQVsIvc+vCF7ac+0u79yDBwEFK00zcEyTRO+XdmrgoVw==
X-Received: by 2002:ac8:7e94:0:b0:4e7:20d3:ca6a with SMTP id d75a77b69052e-4e89d1fe501mr164423621cf.1.1760958373998;
        Mon, 20 Oct 2025 04:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deec0b68sm2422752e87.42.2025.10.20.04.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:06:13 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:06:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: Move address and
 size cells upwards
Message-ID: <i6uiemrttnnjfcc35xw3ux27g2wih5u4kvn3ore5a76ust6l4n@x7sfe34penlm>
References: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
X-Proofpoint-ORIG-GUID: 6wk4T63FIthXyq6RpmkdkOiSXfvI4L8w
X-Proofpoint-GUID: 6wk4T63FIthXyq6RpmkdkOiSXfvI4L8w
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f61915 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ze386MxoAAAA:8
 a=_PUjjehnJBWPTTrYcrMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX91lRpprSL86H
 EAiJEoKoADStjMYR6O8qjLBM5Lp6yL7xvHPeEn7ePFB0PyTEuoKRrRstPe40L0FxfjuBADLWKAf
 qGFluS6zmlhowP4+g/ooZEX5+DnHE7LVra9vyEJCBhAbDj5pz3GkOAosUy3WB8dVHY4tcJJiWW8
 ILL5C9oWrkDAwWvf3gxa7/m+1e/SKH4nZHD6J0lGfvJhoweq7JpA7Hq1niu5rEa2qWwECHWhH2e
 iML0NAnkXlmMdY+XrMLY3g4WQrWjIQ6qhLPLw/HNY85PT8hN9LrKz8sNdX0zogVpECyIibUMAjZ
 VlYmqPbkpZoppiQhexlQ8INd3XkOX0KkEwDDf2oVLUDSMi28o0IKJUi6coFPPfBC3ViShlsawIa
 J9fBnDqKdHDxS1XScA/ksI9aSoGfbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023

On Mon, Oct 20, 2025 at 09:55:13AM +0200, Guido Günther wrote:
> They're used in the parent to describe the panel's reg property.
> 
> Fixes the
> 
> linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> warning.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 89260fce6513..44e7b5015d26 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -472,6 +472,9 @@ &mdss_dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>  
> +	#address-cells = <1>;
> +	#size-cells = <0>;

They are already a part of the device node.

> +
>  	panel@0 {
>  		compatible = "visionox,rm69299-shift";
>  		status = "okay";
> @@ -479,9 +482,6 @@ panel@0 {
>  		vdda-supply = <&vreg_l14a_1p88>;
>  		vdd3p3-supply = <&vreg_l28a_3p0>;
>  
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
>  
>  		pinctrl-names = "default", "sleep";
> 
> ---
> base-commit: f406055cb18c6e299c4a783fc1effeb16be41803
> change-id: 20251019-shift6mq-dt-e4b9e7dc7169
> 
> Best regards,
> -- 
> Guido Günther <agx@sigxcpu.org>
> 

-- 
With best wishes
Dmitry

