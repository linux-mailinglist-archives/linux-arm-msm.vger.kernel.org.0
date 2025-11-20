Return-Path: <linux-arm-msm+bounces-82641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DC8C7316A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D3EC4E6D67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EAC2D7817;
	Thu, 20 Nov 2025 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpprCVs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqmMi0Ni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844CA2D0298
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630096; cv=none; b=isnecvEnpGxj1txszr3TgSr7NLcz3t/aap1UHGGOHhh6wKlaw9xt30g4Hea22lpODYOXv2yfbHL7/2vluHeysDg/27+H6z3SdyMh1w7K6l3HGUCBo69E2VIzGVUgeJ7hLzx484MO1DklzhWW3U10hIDr6chnQdAR99ux5bT990Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630096; c=relaxed/simple;
	bh=5ppimdb5TT3hxftrxvDJ9CAJd1wm0b8WzSU1i3zrMpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShB3xRxwxw2yz18dI0Mmnm1D/UJYpTY3Dgf8RSoMJvGbZf49aVyONeihFPtGJgePm7gcVyZTgzQmyDaWaYF5cPW09wLR6CGwM4efjm0evBUnjDHxW4N00mmm/GYQ8zauw8zDDJb1VCJDNn+HWkOWnfF6M0qzigJxKIeFBkiShs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpprCVs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqmMi0Ni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pSIN3543756
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmCuG1/aM6aP9YnH7agJ9PkxdglTEbFrCmpfrHHCe6Q=; b=QpprCVs+jMMBH0fM
	BX2OejpndaXENyL7ialRU3Qh3UAqWZzWyVYKiuy23xiDbL6vsnOvj97pO/DiQbgg
	F8LBr2pH6lKt1zNaEA89ytf++vgj+w1btwB6d7w5o8rqlYyVQkXQwbcPvcWRvXS5
	vZbnCUi4CMIU+G/sfZmoeZzbd70fSXRmf+uV0MctOoJo/M4pxf9UOK15ZUxFPSuB
	H6riY1gOeM8iwQsZHbGvm0JN0T+rYYjr9AeVsZcm+C9Mqe8J+pD+1RiOw8WVeBiG
	wXUQQmcibGr7WBRI3QvtQqJKDhxRsnLzpInrHPEY5QCnAzFt1rlHmPVW1u41j504
	G9s1fQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t2qje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:14:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so2157251cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763630092; x=1764234892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmCuG1/aM6aP9YnH7agJ9PkxdglTEbFrCmpfrHHCe6Q=;
        b=HqmMi0Ni6gFWuYjifIhgfbgvcoW757H2B4qnSiEAx0tkBLDVua32MenMhtp7oUgsJ5
         DKuzNo6hMK7W43dcQhJV9Rc5+kR2lvHDUIVMg7TyfVrx2gBpGrhluT6RXsCh19fW5g8j
         B0etOB1pDzrecPeYAwHngPmmRcwV1IsVPFPTOcvK8HaDweTR1VVlNN+cUQUuGFfJRHdu
         qlfrvv7tB+kyNbthMaC/Hrcf2dfZ1LlS/2AKxfeHQpeiCewSyHxrIdGt+IxQ0t2XvXIu
         1XmGBdTwDU+7vjlhn7FWWk4bciG5Xb2u2LzMPD+Y+AU8PwV5S/2isOnDeRhf49fLk+sc
         QPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630092; x=1764234892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmCuG1/aM6aP9YnH7agJ9PkxdglTEbFrCmpfrHHCe6Q=;
        b=vwbSzmGF9I8L46lXgTAkMAsgvb9D90uhnd09c5gxLUDJAUGcFPUnqB3EaeilsrTuUq
         f1Ajz9cMDI6L/gvIsRFxCqPCVtE1+bwgOS36AOxG51rJzZ38Bz6D809zt4TpXeJiyOor
         Bkt4lqavjQAh1XEmUCNE9TiD0X+pSBqo6oO3/Bgdysln6S9ATXfDjalVhsDJ+3j24HVq
         VQBeZZTfDLqg9tp2B7lJC2GgzTFKIJprb3Hk1DKe+tJEGG6Tc2f8k7h4r/4k0yoluhmv
         ZSNpfuG9PS4M1qFcfWGD3tQqxt5RhDticV+A9B4yvlr5zgycBsfhu3d3qQVYXohj/+F2
         kO8A==
X-Gm-Message-State: AOJu0YzqAOfa/OhR+OlULJqW+1XOvkpn3jA8Z6inlsYuVMd7g0ZdyKs1
	IS6rFxjEjuyTDMVyqIKnn7cguQgTRnpTydnmMYdphrj6aVbJRI/EC3ajyC6mBd66IqaYmLvaKJm
	Y7cjBZh57gORp2jNdCd8UIo70Ju2Dc9jw9HAJwUwFMSU52fA07DyhEBAOWuETQRcE+EuxvD5xQn
	di
X-Gm-Gg: ASbGncuG8Y4ChYcn4C094TLaeN6NOG0J6UkQs9lLijTLXTJyVhc2mCQ6JBA40BhSm8e
	YnBjZlCCk6l6LdxmZNcy/9uBx23jMt17W/jbqqa2TfufayHxyas04Bdxu+EYzkFfTtKaN8bZvg/
	GKSuKCWv5NMo01x0BvJM3T4qVNV/Ei2VIrNtX4OvKf4hpzLJDYtDaXJ61Qa4V3mOTZyCDRiLssx
	dUaIphlX/zDn9Up1YhSeojMv6yayT5g0qcGJDQ2q5XkmU8a7TSlvCY5j8a/hNyNLPEe2z1OvloP
	5usbxeUUu+Rr2hbR/FZmZ/iKZpGOnLq085YC95liu52sYWsqETH5RGJVnbHa+Up7s2zX8DvpuV4
	9VhXSRWr9jJLgrC8Xnv0pT7d5N+kqGOd5oz1v/txGk5uGhKaQpbns83I7PvCP+fNoZJc=
X-Received: by 2002:a05:622a:1b88:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee49310648mr22761821cf.0.1763630092397;
        Thu, 20 Nov 2025 01:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUtSeH6x55xuspR9zfkmBBiXO7u1fyOWg2xITcAziGaRPKG4f8wBvBYP7LftLETGMxls/QzQ==
X-Received: by 2002:a05:622a:1b88:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee49310648mr22761641cf.0.1763630091988;
        Thu, 20 Nov 2025 01:14:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5bfsm165967266b.9.2025.11.20.01.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:14:51 -0800 (PST)
Message-ID: <00cf5233-ff95-44d6-9d76-77178358263a@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:14:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8960: expressatt: Add NFC
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
 <20251119-expressatt_nfc_accel_magn_light-v1-2-636f16f05cf4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-expressatt_nfc_accel_magn_light-v1-2-636f16f05cf4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691edc0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=yTTn7_gLV5vl4xbOMHgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FL0EHTBsA3D3ZwBw2q7KvrZeQpek7_hb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NCBTYWx0ZWRfXxYcoDsaB2vyt
 PnEAKW/EClLGWdNX0NprF1Eus3WsfFlqivWmRaiFd7nZqVFb3g3TJrrxl7ejtc1rTtifl4RDAdU
 oNVGQ1IjBqg9fw4v7ymirijjP/373NSRngb/xQDam+g7MGqd7PWEh80P/hhtn0DZI7IbbbscIyU
 hZMC+ZJdX7QggBCAKr6yN9kXjCu6q3Tw0QswpVlrgom8TACe7+X+D+OVefd3vqd2RzRVHg1gPDi
 0GtFskFWV5kYQ5s5kehlvyb25ZeQP5lYPKtNL+/9LalI9b4fhvh8XedoRj+/dCFauQyCQ3V13u4
 gonKLMxJ63/mAnQnkWbYFD1d7i7pyILgL+Rjq1dVJSxwEAJBpaW6ThnK7CjK0gl3c1HLuBI9kSt
 wzOon0B5jUHq/XZHuhiVtvbJwz3n6Q==
X-Proofpoint-ORIG-GUID: FL0EHTBsA3D3ZwBw2q7KvrZeQpek7_hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200054

On 11/20/25 8:14 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add pn544 NFC chip
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index 1e331a046e7b..81806d7ca001 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -77,6 +77,27 @@ light-sensor@39 {
>  			pinctrl-0 = <&prox_sensor_int>;
>  		};
>  	};
> +
> +	i2c-gpio-nfc {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm 32 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 33 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <5>;

Same question, any chance this is GSBI7?

Konrad

