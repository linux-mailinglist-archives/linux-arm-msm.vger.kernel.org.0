Return-Path: <linux-arm-msm+bounces-74288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F025BB8CC1E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 17:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A421F3A6687
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 15:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E981FFC7B;
	Sat, 20 Sep 2025 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UND/fUoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49041A9F97
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758383342; cv=none; b=UDHXOASE9D2cVvQ4s2W5RQWTTz43EPH6+fxcCvK7VLSjNonpnHdc+AIduKn7PBRnmgYurNDXPbEX46DaPKyL5EhTPMID94st5WCirO73N81CS+cEXhL+i52rg/kZuDe5fkWJciWJOTnQJvqjp3klygLPFI8xO2kh4GgzpAknrko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758383342; c=relaxed/simple;
	bh=ZyE4mGWb15umyi4zIydBniDbx4FWRjpAL0RjtXLTMHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwa+YdryKU2g+wT8W2f2AzRkDAItVBQOgUcvQ248Zb99ydeJPf5Ad1zE7yp0vMsqDxgyy2W5IjGZ1ElXeEOwAXvFlFB6GnSYEwEqgrecKsoh9fMAdcPiCXHtwKCYJfvy4ozuDILK5fBmrFmk9Zr2sRl2qFRXNSLrsxg8uFb38YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UND/fUoi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3lbSS007185
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alz/xs6eGNudGKSO31RWGHO+Uy7zhunwoya7dHkt3g0=; b=UND/fUoieh/mvkCJ
	TLheMeRmUeLS1x7m1aPLhOVtaWXjlXizO8EgAIwzgsPkNI2U0A92BuK0fp9Pt+24
	oPkJckUXGeYup3alnJM6GgkcihL+5jMopwWDTKuW9HVgiVXE2OhpMYOsFuHczN2L
	htVjQlzcrSzfnCt5/zItAfNAOOQBkZF/ucD1dS1A8Sh+aCZrhqe0rqzmYaOBAN4C
	sXxhS8gFlLcjcleJ9iA7ZtEsuXI/Dto3m/MJTlfUYuD2CKXQrG2hbrf1ZkrZwdwy
	NxQFLuDwwZlu5lAVP/c3qpata++ulEt58FLz526uvFcB/WSCtFkBaDatJ8zwqRiJ
	2Q0L6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn78w9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:48:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b60d5eca3aso75176331cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 08:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758383339; x=1758988139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alz/xs6eGNudGKSO31RWGHO+Uy7zhunwoya7dHkt3g0=;
        b=rvt86yx6FOcPnurkBPopMf0sFSzL1KGEWTDcd83+IBT5rp1qY8vKIljV2l5CXY1aG5
         Ixk695JiOshV99gJFZEQ6OUA6DGUmmTx5RI0K8XuohTwV0bgv5bPxSTdkqbD1OZJSumr
         r1ZHCGMCPitYJWNJs6q97BZfX0D5/T9+cvoPVb8Kuxs4XR8Riq6JkaG3APGzBg1DOlaB
         m3xXFtpDE90aoLYGzuRZBJ/ym+J2j/uTW0GrwjZByLeIbT6jGCGzjN4E8YEvyQBhEdyQ
         vjZ0YLNH5rIpItMFCbSd62x4U53QR8uI3LuRZMpT/tb9WhBYr2abYQOYJ8oZu7gN7+vt
         A/zw==
X-Forwarded-Encrypted: i=1; AJvYcCU11VftUqXIuTtjzTA9oPsdL6Vr5MqNFXuhQys5lrSQY17rUOZq6HUwopkY5PmEc2npuMItWkKv3Cjms/df@vger.kernel.org
X-Gm-Message-State: AOJu0YylYJPZxyYe4R1pLkQ1Efpa9y92u/wrYsK+1HdQmvgK4KGT2H3c
	inrNEHDpcxqjZwJSHmqtnYSgiLGGbHkl8NEcv0qsUp4DdjmMR2j8S1pL+AmO3pHVIJvO7cPhSHN
	dN9mkmV7ku7QaDh4G4FyhDoYHMz0ac98+PjInsfMYl4ZViSnGo+yr3Oxt5T5WGNyPebpJ
X-Gm-Gg: ASbGncubTXJBbB6KPLQI1cAFJ5EHm8pkB5xF1ExX3MH56o2ckoQrHhGqLCk8eOUNphh
	QhUHl58qJ4vfKFX7PvcdswrFaAtEcNiPHjq0MLR7xqhiax9CuWGdf0hmEi/d011qi7/UuOuzB7W
	lyeKmpDXPe5j9kpnK+7KGG0cLZGZ055tTzUlQgnxQqDN/c2FqoL+eTsqulSgYmOnQ0UgRW82rHh
	cHa0fvrV+Ng7bIHVuDD3X/6woHoJDbdNdc2tm1KyCzLgy/nPNZDCKvglAlgVQqmjWgsu+z3QJBM
	m58OZ1pElHBjCTeBo9DapdEywAv/8VXL/fqpvhD2semhn4ZSu7n3aNEGdNzm3fwShbhsWWMXWV4
	xkeZxoiYXVJtACk4OwuBGtkD8e+wxy85BY++AlqfWeCkRTWlf2bMT
X-Received: by 2002:a05:622a:a1a:b0:4b5:edd3:ddea with SMTP id d75a77b69052e-4c0724877fdmr99595271cf.57.1758383338834;
        Sat, 20 Sep 2025 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzE2y6c2AM9QeF8k9R5IWx1jjK9YxbFuG4IXO5ub68DFjfd+rXNf2vcmaA/qLlVA1t1glmGA==
X-Received: by 2002:a05:622a:a1a:b0:4b5:edd3:ddea with SMTP id d75a77b69052e-4c0724877fdmr99594901cf.57.1758383338366;
        Sat, 20 Sep 2025 08:48:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a68e2b1asm1988566e87.57.2025.09.20.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:48:57 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:48:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
Message-ID: <uzofi67alw7kkzr5lom73ozghtytdquiigcwsucmut2mi3hvvk@26goz4knd7xk>
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-4-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250920014637.38175-4-ghatto404@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX8WUZNdVcYYyN
 xR2mQhc080g9PZy+HChKZKvqnKOTxfJDSQaflApq7dsS39L5Z82XjBOJqeVTrGE6P4zDKo3+o51
 nSuTZdc1L/8GLlO1+AR8yrDDkfWZFxQu5WM/t5kjGCTsjf1pk4DjjSjOP6v25xgK5H6/0ehuKaj
 QQmtxJcvTKtJhtMs2LqVP/NoCs6H4kD4kYSKKj9QO1yuxgDZRUVEyosnl4wFl+e9VF7EWdlY0P7
 pwmNqH3hT3dDQLne11FOLHMEG/tlm58wrAPgA9KPWvnkq8ipI9nnfG/FlCh8WGU8sC1APkg1YlR
 36MBdZmnBQWC+AXCETK96zvfUgqtsmkntj08NvqpCeZBPWzJC3aMDNsyd8aSoTyfn0mD+L2cbO/
 /8HL1puk
X-Proofpoint-GUID: IaTseb2hAXF7wTv-Da6GxrRMIaZosq74
X-Proofpoint-ORIG-GUID: IaTseb2hAXF7wTv-Da6GxrRMIaZosq74
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68cecceb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=1l138o4i5FWnMMHbShAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033

On Sat, Sep 20, 2025 at 01:46:35AM +0000, Eric Gonçalves wrote:
> The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and haptic
> PMIC, enable the fuelgauge and charger for now.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> index 7bf56564dfc6..c1b0b21c0ec5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> @@ -14,6 +14,16 @@ / {
>  	compatible = "samsung,r0q", "qcom,sm8450";
>  	chassis-type = "handset";
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		constant-charge-current-max-microamp = <2150000>;
> +		charge-full-design-microamp-hours = <3700000>;
> +		over-voltage-threshold-microvolt = <4500000>;
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4350000>;
> +	};
> +
>  	chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -186,6 +196,26 @@ vreg_l11c_3p0: ldo11 {
>  	};
>  };
>  
> +&i2c5 {
> +	status = "okay";

Could you please also add 'clock-frequency' for this bus?

LGTM otherwise.

> +
> +	max77705_charger: charger@69 {
> +	    compatible = "maxim,max77705-charger";
> +	    reg = <0x69>;
> +	    monitored-battery = <&battery>;
> +	    interrupt-parent = <&tlmm>;
> +	    interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	fuel-gauge@36 {
> +		reg = <0x36>;
> +		compatible = "maxim,max77705-battery";
> +		power-supplies = <&max77705_charger>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
>  &pm8350_gpios {
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio6";
> @@ -345,3 +375,7 @@ &usb_1_hsphy {
>  
>  	status = "okay";
>  };
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

