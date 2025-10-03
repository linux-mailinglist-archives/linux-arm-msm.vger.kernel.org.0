Return-Path: <linux-arm-msm+bounces-75915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA4BB7039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0FEE3A5809
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A47F2F0C4D;
	Fri,  3 Oct 2025 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k50yKbuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AB2EB872
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759498077; cv=none; b=DsENfDDdwD2VA+18p0p8uczTcqXrQIKRE2Cj4ic52z6VoM5gcoYZ2aGbMZQAFMbR5NeegHi6OTVloDYFUySRgtdqQQgPa31X6PGJN5SVUUZAnkReF5LyEMu51PMnEDe9yUA0UN4LoRU5Pe/wM38MSulsUqm/2h6CFW2JfPvIH8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759498077; c=relaxed/simple;
	bh=CPQt6G3cRcdkpJT2t7f4bgnXAnncd4uU++8a5gjFflo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKwhpuRFNxfxfV2gZ7eCaniE/2bdMrib9sNT8eRwewIzsCj6uyCjW/1kS1Qf+HOtGBpfFsrN283Wlo1mVhSSoc50v37NJXpG+qrPcv6bRWTF6eIPWpVOAa6JeyXT7kFzxTbrNuBv3lGurZjQzjxazXiLVkiA77DJE8p2GhDU+zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k50yKbuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CCx9v005505
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 13:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abZcAT0FJVtX6eklnxdubzS8SY/WAiVnDQQ4d4O2Svo=; b=k50yKbuQQ6Mlk6uA
	mURXusV6uH6zC1NcDgVbgW3xALDhecuEhyvJOGdNtjWUGXaCh64xBZaEr4DRu9hd
	vp2a1ZkhhctM+xxud8ufWMGKJcf5136IdMaM+9nj1G7mIFWCs1gAJBiLpI/e6EUD
	cg3/sU9pEo6HmfcSCgpZ7sP+HBPv5b7pHKbHmQxKqcUpHlvp/CnWcAyHQ11mqHaK
	+6KdDE/KZvRUPpH06roJ2HLmTdknje5N2ILFa5FxBeet9oBs8K9IS+VQgCHcnvgv
	m89NGh4567wgawBdn0MJeaBu8+t131msbQade8TUVcZpx+MF3A6v8zjmGMyfRYHS
	HlxgXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdtm6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 13:27:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dee3f74920so5318151cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 06:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498074; x=1760102874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abZcAT0FJVtX6eklnxdubzS8SY/WAiVnDQQ4d4O2Svo=;
        b=LUmV6ZstPFJ5+Ez5JCN3a13JilkXEXVJ/I2hGJ9EDYGqakkH0aL6jFdikD3cEYHfVN
         xEJlfEu+8oz8xlAF68fyuIosVZsxLBFCGEOTSQ190PRjpCAxOtyKJtuFZ6C69v42decZ
         kzScAkUa+sndqnpdxKOolDgue/TddWl1qzZ5IhC/VVClcCk2IH/C7lW8lQ3TJQ61xtLF
         0OJYDjGR0+1uOoZkKVCWwVhLAtbKe6994W+3zfxoUFtqGhWlsR2Lv8PO+vs4ZyDkhZzc
         kitgIlZWJFReKgv6kbdf3WYTSCSGS1ZwtNlRdUDVw85/rM21mmRKgy7GMolvVE0EJ7Qx
         /LVQ==
X-Gm-Message-State: AOJu0YxpaWY87uO4MV2MB7jBhLfhr6UK6znIb8KI35Xci+nwvXB7I7U7
	SUvznABTDDOKjXKUUVpzmFn+Sau8tSoHpCBG5cqKJwUBwv6jfnyrRit2u0VkxH39xC47myLuI+o
	qRqwMMHzOUNesPtqP1IMTncw7scOFtKXhKI/HjPH8n3eXl89TqGPHB5RR3esAdIvRrP5w
X-Gm-Gg: ASbGncup2r7woP6yOIRpBCRgXW0klCdi3R4H1TYGRA9AFlBMmXUL8dimfhs77yJW1mS
	tGOjOVTJvH5w7oewVUBbxmh8uskc/vppkGLOR8nRvWvchjp4stqSloQq8cqSHHeLwJXzhAobdIP
	Am+qDsqfhtwOVla4wd1ASkPkTIp/2kqoLuvVl4tNEJYC/egRIvtiSFV2xQ/VQiE5pKFASrkXYMI
	gnSSZWgIR/MKbXAnhsYzL4mAfHmN9p9iOwr0BvhFI64P9XV/c5ExEYX/2hWyWxJXEEgNAjx9jIg
	ciM17UvyLNRq/vs4ts+MRWMxFqCRRWLM3L+XRv+EXQ86/QaMfOz9I+k8QE1jC3jWmCqcLG/g7yF
	TWZN9njrDileamS00WdpVZiBNcDk=
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr26891431cf.7.1759498073250;
        Fri, 03 Oct 2025 06:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB/AZh196wclx2ASlNPW2OGy1r4BomVRsOSsm1WT3mqwyaw999VPI6Bpkg0sVz8dKYmtaE+Q==
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr26890791cf.7.1759498072381;
        Fri, 03 Oct 2025 06:27:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa035sm434817766b.15.2025.10.03.06.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 06:27:51 -0700 (PDT)
Message-ID: <ee0adfa3-f042-4d2a-adf0-2c5d84d79cd8@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 15:27:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add OTG support for primary
 USB controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M074JIbs_iyjCsGMEMlbo3-NKZzmoDAO
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dfcf5b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VtSu26V_DIzdLs-5mXgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: M074JIbs_iyjCsGMEMlbo3-NKZzmoDAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX+1efx00jD2vD
 lOgqz72sbOAUeDVdD1/rVJaMn/MS/wtd3jkokku34ag/Ml9ljTSLEKWwiAN0C2GYXk7s4nn77ub
 38dpuAJSXPEo+kuf8lSCYza8azqOEWO1gF/3SNOaXhWgmHaXav469KlFu2oBq2Oip9lD3pAAWqx
 Cm6owGAZRhWJLMB9CJ48+H82fhPo82MzqwoCXi+j8y6zEZdiaqOH5RANocSzM2df1mV9uDcEOoc
 97KnXHvHIbDtcwPZVKd0igR0c6qCyFSfZT/hzu/GVwxSnMHvsPvyInTiWnswKKuUxCNxboPtnhm
 W4Odrdxoxk3zWQZWEqpa7sZqc4hAci12yCoVrLNjsloihbLIy+c5XfYH/AkqoYt/MaFRECpu0qC
 8SX05QIxhzFLBxDNSaL0FjuiVzPQnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On 10/2/25 7:29 PM, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Link to driver and binding changes:
> https://lore.kernel.org/all/20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c7dc9b8f4457..0b6d8d2d19d6 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -37,6 +37,32 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	connector0 {
> +		compatible = "usb-c-connector";
> +		label = "USB0-Type-C";

Are there other, non-type-C ports labeled USB0 onboard?

> +		data-role = "dual";

power-role = "xxx"

[...]

> +	vbus_supply_regulator_0: vbus-supply-regulator-0 {

the suffix suggests there are going to be more - is that the case?

[...]

>  &usb_0 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";

otg is default, you can probably drop it

Konrad

