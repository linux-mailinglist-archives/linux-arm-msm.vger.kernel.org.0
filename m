Return-Path: <linux-arm-msm+bounces-83471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 63215C8A670
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DCE5D358C56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F3E305048;
	Wed, 26 Nov 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoJo1jP4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dhs0kBPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8DB303A18
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168074; cv=none; b=j0JG7iY8FDudYlzs9DRtf4vatb4okU1/xZRU2L5IFiIlVCrNT9r2ZaHe5M8P1LPn+WdunFrbxKGzuV94aMv39eloSagNS+QD7GI4jY4VrQrau8YO+aA1jkR5OD/KjaZYnoKli3sc8TzW2sRsUAgT1H3Ku5MrWMT4G6qYJX1QNy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168074; c=relaxed/simple;
	bh=87LI033NT5UA/aHo/k2TVWC1u+ciYMrS3ifcPr90bDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTakgh6mzOLovIqu1QC6Bal10eT3KgcvkvtEVYbXs7Jw//hahS6WKNyNxduWe4Lz7/GqmujkPqflUv2lcY8RvDgDCCPvhNKT8xcIIeVrnthLKEnd5JVeYUS4+hVEKKKocOrEzOaTsHJaMl8Wu3IDUs+EkIndLK02YwEf1iJaJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoJo1jP4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dhs0kBPZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEVcap2355325
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cb+6zVcvLje9cJpf9SPSxDPZ
	KN/HYxpTTZM5TG9Osy8=; b=RoJo1jP4o2jwMEPwz3TpMOTwYEj0deCyjOgtMC+O
	6liji/2EnGfYcmou+KU5l2XgNj5jwVHAlwEeMqozy/W/ALEdZih7LBcWF8xqJUdJ
	LmkVRebk52gpp8wJ78w6tJpj1uhpgxnOT6AhAveYlmuh7LMDXa1PzwcwrHN+LKAK
	sgf5Wfql5p2iFJq6zhRcGyp23TIFBN9pMFA6CebO4LGK+A0sKTVMuuKzuaNyfynM
	UjxN7yjj2oxHEF+3pFtOg+rsynOSW/PFUPQHylcWF16rwc3QJXTugyvoTRYKYOq4
	RgWvh0D8tlt813m1xQZZwppUoNIN2yLbpV+hYkehCQuFdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1g16w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:41:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b26bc4984bso2539749585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764168071; x=1764772871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb+6zVcvLje9cJpf9SPSxDPZKN/HYxpTTZM5TG9Osy8=;
        b=Dhs0kBPZKt1/TMUaowg3h6d59HL3G9YLNk7nAWwmWiFW9A+w+qz1VSTBDyVWJssotR
         oNax5JKySAA2PI3YV9HcdoFKP2VFXR20ieri12ghEUMH7xb4PjnMO/kN3NaL/ZhTvjvT
         7UElzf5R+fFs5EqBQTt9Gzn3/QIikAoFSU/ATcma2Zyije1W6KUlo43ikkFRkiFMKxoh
         AboufNkDz8X+KitaZ8/rNSsQz38OHo2ov/qHB4MOy6y0PuJla1pgT6+dGCaN2eFkTwdM
         rAUH8Xsh1skh8q48MpIW9dtFJ1SDmfHRP/zixXtW/SCU7SG98xkPNVzvQ7+Z5qVgSbGg
         7v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168071; x=1764772871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cb+6zVcvLje9cJpf9SPSxDPZKN/HYxpTTZM5TG9Osy8=;
        b=TFHBXnAOxr3bF7XsfW6+YP/y/tpDhyq4fEFGZvowL5FuxMEL3UXukKp/vmY7gn9gys
         yt3Z7v9y5e/a++Wo9KNc7E9A0K7HIlmnoXuCnvZtDfyRXOwid37+e1koZ2HDR8e2hce/
         BMAdwBRjEI3MCKEfHwk9okz83GGsAIa4zIPjfoVAAlU3zo7ZnEyrEGz6pYdrFzpSH+Uz
         WhoN0zdI4IsdQphlKx2zdByfbylP8IbtMiNFJZi8vsZtV8v3qpgqfa7BtNOE6WDMR7tK
         4qlVYRN1zE7TPhyR7kOq2zAyYwWaLEF+vwjf04uvlUGGnXc4bGjPhGNVhiTsoktCh1Cb
         pqiw==
X-Forwarded-Encrypted: i=1; AJvYcCUxLGXTzJCaE1Qdl2u/KJng1JrTSW4klQR3DHt4zlCQCKU8R8QE35cmm9drVvrf8myub+ML6QHSqMugJ6rV@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlI5HEV4oHonKyDyu7Gtr8YFu5DNHG6CsgaGl8rav8npvqSGi
	BBOExDNMqaQ1PaeUm+6AD2W0xNzr52rDoMZWrM3MnevSpRQwNXGUi5pHLhuhbyhot8OYZGi/WDD
	JyAtliGuLzcheWITcBC3bIy/bcmoN/PWlrL78Rh7aWa9zIppOt7iNfy6ha2f2KPUMBesg
X-Gm-Gg: ASbGncs69VYuI30b1ISr5m/jCUOsfKK5HNpR6Fle7wrrzAIkWdzjiigpnyp0e6tHcyG
	GzmrEyzIP0MTDy3VgiKIVGF0L3PDX68Xbkrr7FnpjjDAxGT9Ho7YwtxwTfNW0GpXrcmTgpEx5Wb
	1ZDoAaz8NT7Kibt4s31+4TcXeVG1Y7/bJ0n2U7OZZCULVzU6BGa6t7CL6cGmjNpM2KGVdlus5ad
	BnkdbW0U1qzaLowBAb6zAACAjOaHnMwasgP+fqA1EvGPsFX5veuC7GnbDhJMDveRlMWYvXmPtFL
	y8/ILJHqitYUF4dHUwtvwSwTJTedw30a5FtL53m+Bzy8yhQbReieFZsm10WcikGQVi/127h8zhY
	l9H8j0pH81Ej/86xHyOQzp9DsaVYZ22+e74sA3f8EBiPrXUgqDBqm8raokmeyHJ2YCICjRdMtae
	lD6LviOKRmXhOIFLwQqTp4u1k=
X-Received: by 2002:a05:620a:414b:b0:8b2:e402:20b4 with SMTP id af79cd13be357-8b33d203b00mr2712634785a.10.1764168071235;
        Wed, 26 Nov 2025 06:41:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbBzeWAYP3dp/c2YiLk/9UKY5m5lPSsHi8ZCvonpCdrI0jJZmrimeTWEN5tjYX+gDLVT9Aiw==
X-Received: by 2002:a05:620a:414b:b0:8b2:e402:20b4 with SMTP id af79cd13be357-8b33d203b00mr2712630285a.10.1764168070752;
        Wed, 26 Nov 2025 06:41:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6baf973sm39439571fa.24.2025.11.26.06.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:41:10 -0800 (PST)
Date: Wed, 26 Nov 2025 16:41:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: longnoserob@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Message-ID: <jxlq4fbtl5rkiyyaivoelynw5hjpb3xtg4klcyocyzbs6ncpqa@rhqcwbehisjv>
References: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
 <20251126-slpi-v1-1-c101d08beaf2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-slpi-v1-1-c101d08beaf2@gmail.com>
X-Proofpoint-GUID: FiRESsUcGHGGath9rD57yZO-3oi-h7u6
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=69271187 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=RWXG68yAir6K0NoWbU4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FiRESsUcGHGGath9rD57yZO-3oi-h7u6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEyMSBTYWx0ZWRfXz3ANZOS2XInl
 kgGo0k+8uzK6X1FFq5T2IunwMzctDrPLYEhFON4x8CpXpWNshp79gnuqzpbNrDcSn5ukq9ibk0i
 J1MxW9P9gQVPuI4WYqmpAuP+FTfzG3QfFFEQx24LQxih4Qr/f+Uc/9IMhGO1H5JJG1ICVhDNWKa
 byIsVFx23sJXVeFWdlusD0m9x3RpOQQ0Xi2rn1cAgQOFMLzJdylg6c6cRwG9IarreEo0qoUMKDz
 t7BrP4nbrvtybUSl8WWPfBp8nU/qE+a3tcDVoNNUdJ6oEn48sRNu3l2u1fGEzAlL0h5WklrSQWH
 CBZ769F9S6hxfp3CxsImFH4ytSNJFU1Q2hK/pwV4Q4o1aXb+mzmSJI/w10JuPranmz3qIhoTBd+
 Lw6l3nMuKdfvlaTigY8y8GPBgisf9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260121

On Wed, Nov 26, 2025 at 09:08:35PM +0900, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 785006a15e97..0fb1d7e724c4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -425,6 +425,12 @@ &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/beryllium/slpi.mbn";

qcom/sdm845/Xiaomi/beryllium/slpi.mbn

> +
> +	status = "okay";
> +};
> +
>  &sound {
>  	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
>  	pinctrl-0 = <&quat_mi2s_active
> @@ -637,3 +643,4 @@ &wifi {
>  	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>  	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
>  };
> +
> 
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry

