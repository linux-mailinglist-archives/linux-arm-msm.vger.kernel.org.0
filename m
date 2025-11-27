Return-Path: <linux-arm-msm+bounces-83599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D6C8E9D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B4644E7B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9634B286D7E;
	Thu, 27 Nov 2025 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVvlTcwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StNt87Xo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22665270565
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250983; cv=none; b=LRszEaEYnqkDT04tY+p7QgeALde6KyJRwC0WJnbhXnzv+D2LRZHWMcSVSVNC9IoQhLqqVD9PkcCIog2nwLm9pLpgJnBrniLNXooP8TpLkDSg9SWEYrrNyKSrC+XKYxOikSYwP7vONfqC62IfJ3Oao90nK19vD/woCqd9kUOHMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250983; c=relaxed/simple;
	bh=G3/ueoFpy6tEWTPmqc5WyzbcDlILQSMXOfzz19bi5Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or0bFbUEqbHscuVgXt9waQmXsR3mbIKZlQ3as1j5wU3xFED707Y+6yk8ZUBIUZS9d2zI7ldnOa19yK+MhLlQY/etb9B0/QRa5im5E5UNHKOm0qU4Q9KdxN+c7YxCnxFxAEgEqhorg99B3h4D9IJyNSL78aVEE8AVAsfgYw1DJo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVvlTcwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StNt87Xo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARBVZ4J722037
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/GmevaQW/u7X64IiztPTzkryhZT8iuRB+4VKN+xiQU=; b=QVvlTcwNu8AB7Be8
	q5HOPbavqN7bVgJLglOH/yIk2aOKms9r7KrO1hvFbhxGVS/U1mUbv1SnyXBUclcU
	y8ddctT6qTVmYYwycS2P1lkZLwGurShwbTAwXlTQJ7FJsDiWz3suBUqlHiDla/ib
	lHCNTEF3rym4xUyiAQlOPGvEL7IUOBhdBbkUxfg974CUwZFKseiDF+7pgsyCOKSV
	x0YN9Gf22NOqoQt/te7ICJVAJwq30vd4mVNHoQnayU7L0OVyEYcn7xnSEEucDFo9
	HFct6yH0d+dvC8BeQUOtv26Xhhgkt3VqFRfD+1ccDShd0+AWgmpRy4THd5/PZiiD
	HUeq0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnud899x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:43:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so2452761cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764250980; x=1764855780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/GmevaQW/u7X64IiztPTzkryhZT8iuRB+4VKN+xiQU=;
        b=StNt87Xo3w/SqpPFpgzRiu35+NE9tHX09O4CpmISiA224xoJBAgOcLAGmef3gHqgI9
         M/Hf/wdLWtiIgIRQyfMQbVpb1yQ0b6yVSQEjdg4DQwdpk836E5YWVTmfHElLYbdUatwP
         6wmxeqH/wfLmmedU2paHS7FSr7ggBdE6DuacWx5XbPd0SkcAj5JcYjSyb4zlQ6gP1rnu
         8pJOjcJC6qZO3eYvI/7sdtTP8CH5eskkEeTF91DaGERWgyDcBPuFe1azib29KYKn8BWu
         cCOnQUuV22aWTO9UUNsyKPTI1KhEMR953ont37EB1oT11vhhKdibaO008LqqzKpzJdLZ
         ApjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764250980; x=1764855780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/GmevaQW/u7X64IiztPTzkryhZT8iuRB+4VKN+xiQU=;
        b=rflXuvSk74HtIGSZPpDL+QO0TyuhhXuM+sUSiZV30xD3KM2B8AXDB2ocRy9V8TR8YX
         kym3U4TlExj33/4TsG9zFyGuO8EjCHWQBUceKDkn/jOG+IpHi/zBNxmt3RKUA5SKfjdK
         8m+Lfo/Hz74CZ4BDKv1aT+c4QA1wPiYgh5QBCwfZxwnyvKfC63gzemtqUKt9NIeZq0gZ
         FVVrZF0tC9hSxBCicQ6+XPWfvMQP7o/9e6fv4pk0a/2BnTZxivggwSJvuU44aoc6sHx1
         k9sRI3z826Zn64RJBfgZbUdi7KqUQa+Bg/bLrIh55mXcsZpluTnxPhLNuOp+RW+fs/Jn
         +HsA==
X-Forwarded-Encrypted: i=1; AJvYcCUkE9GlgULbVtUL+zPeZ++0gO7OnIO3TrcB9KvheDZCJd8SCDqqmSy0ks/bcsB29M8eqDXSUjs71XyJ4TI8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/dp/bSIncZdJ1KhjvGWoiPA/H1ybaH5XtT9meZV5YnrTg5xdg
	Zi1ROpyqilRMLawdvzAu6iGBbl+LSK/K/uP6D5a2tD5GFix5UDgYzjtswS/EUBPahiKvuPYEiEP
	XseH8JYIxPYNVHouaaCVZqTDM7Ow2pE+IausVShgQl+0WgwLZdwxXHN1u3BXvsFtiH07G+yJZXF
	pG
X-Gm-Gg: ASbGncv498z1xYFFtFbu57Vi+aqRE+RJ1SdfwyWukTbaORhxpruXw86SB8rftRcmbg3
	XAeNNe+YB9wTRMAAOp34a/rd1Gecf0Dsy4UMRVxglkCsY+4nhSaSukdZdlEiFtqC3B/wBazXGX1
	HeW4MoFgpEkAodM2+46/IONQ7j8g4Laam1T9VFnMvLLCl+469TEmz6c+OwRY8mSue47lpip1dQ3
	x3DuJaKvxJ7/T5eNcya6ram5bJGJK5qqkjIzL9QT017elzr83/V3TMlrlFJgG+VC2fxpOWctHeN
	S4w71rFbIiSofJhmxIxDRh59A+lJo7VF3iGvsONNAudiGuRGOxMKOYa6ep6Uy61/SAbkZ5UZEB0
	a+kDbxT02tInv+e+eQuauZmux6Itvf38StgHJasjGEb/g1LCLH0kH2grqSaVrUETbyvM=
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr223990811cf.11.1764250980405;
        Thu, 27 Nov 2025 05:43:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/4FzF1qUKli1GHPu+PHgGnMvgm5v/gDvzDTdWbQLolUaVfcmwL64j4Op2P5zNYAraqDzckw==
X-Received: by 2002:a05:622a:211:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee5b7badc4mr223990531cf.11.1764250980007;
        Thu, 27 Nov 2025 05:43:00 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b757sm162424666b.66.2025.11.27.05.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:42:59 -0800 (PST)
Message-ID: <31210bda-c01c-473c-ba6d-e5e98e8c2030@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 14:42:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <20251126012043.3764567-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126012043.3764567-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bmq8hzAovxi1rkwAYwzQzAk1l7iwJPrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwMSBTYWx0ZWRfXxLpOZlwBdI6b
 rhWtmVnQkN30oPLhZc625sTgQrCKPEkkV8AWyjS7QbZA7laQ1iZL2WRrACfGhIfQ7UyvjiAgt2F
 2vwd9TVDGICjqdUj7kGfDssuUOP6z0kP0rgo7EnFFhAhX5NI0Az1SwSVpfgCWt3bNNU6JwFc8Hw
 3M6bwQ/WlpJ6uQI3l3U/U2MdrGp8osYLKCu22bXuhEGWGwxb3yImS3+EZaKYGX/FMtbwzKogL0+
 0lD4mkvVXu+PBRGBQ1sQJUVfkVr3Pz1HKeHSxRV7N5d3EJNaOqlIZjybKMtkndq2srbnITVb1ZY
 pPc9oFAe4CN6R2M518CdWEs9dMeVej5V36P+eXfCCowychczULfGUKqRnN0a5PqPRFPvhVJkety
 gCtIASoDOexyPKEJ8koiWCwA4cjIuQ==
X-Proofpoint-ORIG-GUID: bmq8hzAovxi1rkwAYwzQzAk1l7iwJPrK
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69285565 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gPOEjk8u3OyNFTPunpYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270101

On 11/26/25 2:20 AM, Vladimir Zapolskiy wrote:
> The restriction on UHS-I speed modes was added to all SM8650 platforms
> by copying it from SM8450 and SM8550 dtsi files, and it was an actually
> reproducible problem due to the overclocking of SD cards. Since the latter
> issue has been fixed in the SM8650 GCC driver, UHS-I speed modes are
> working fine on SM8650 boards, below is the test performed on SM8650-HDK:
> 
> SDR50 speed mode:
> 
>     mmc0: new UHS-I speed SDR50 SDHC card at address 0001
>     mmcblk0: mmc0:0001 00000 14.6 GiB
>      mmcblk0: p1
> 
>     % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>     1024+0 records in
>     1024+0 records out
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 24.8086 s, 43.3 MB/s
> 
>     SDR104 speed mode:
> 
>     mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
>     mmcblk0: mmc0:59b4 USDU1 28.3 GiB
>      mmcblk0: p1
> 
>     % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>     1024+0 records in
>     1024+0 records out
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.9448 s, 82.9 MB/s
> 
> Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
> file, there is no indication that the SDHC controller is broken.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index ebf1971b1bfb..1be709204cae 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4939,9 +4939,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			bus-width = <4>;
>  
> -			/* Forbid SDR104/SDR50 - broken hw! */

This comment wasn't even right.. it did forbid MMC_CAP_4_BIT_DATA
which seems to have knocked off UHS-I for good, but also MMC_CAP_MMC_HIGHSPEED
which isn't applicable to SD cards

in any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

