Return-Path: <linux-arm-msm+bounces-83593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1487C8E845
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F2013B112A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E05B29A1;
	Thu, 27 Nov 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mH4A9i0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyWnuGfx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC12798E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250835; cv=none; b=SqlwYfj8vcGeNI7Urw4BGGt1PksYI8I0fLeqRLetebHmp6/NNK0yKTWut3ZGCPram8dOn14VTlfpIkvPfpPLEEjPFg16hne8UJwycZnQlgCyY2oNjQYwpV/ZKT7XUH0ATD13u7evu3ZyaegJfrYlJUD+AZW9xf/BTGy2CCH6jeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250835; c=relaxed/simple;
	bh=rZSFoP6TqVN433OPM8wAyM+6qkgS8IgNLZJqO5ScsRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKCusAZ6b/sVC9pJyDHpyVCh17dAFXUkJ0XrT1txpK2zVQEGn9WWEzf4ziVfhoZwQOtHbEnPLJeGCltuFmmFHMoli0vKygmau/uVAz0WBvFVGKgCk0JKfNg0Y2qrA+u8/giJmW2kVYwFHJyNAnWJ8yp6kNcDIxQ5XKURvhWkSsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mH4A9i0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyWnuGfx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3bwN848568
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXfpJVkVCHqHBa7iIDVHdwlwEIE6IcmpTr2GdXkqTMU=; b=mH4A9i0Ykx5MoI1j
	igI9B+dzxlOKWMC88kgltcL0jywGprPP21j2POQRaS6BOGSq0bJPzansmaeYIzlM
	/nQzRGVsMnOiX2+iwWWwG0PYlTsGIWsYAQRXEU9sJyLNPVcPTXL0RdslYThhQ4e+
	djjOC/YWCj/M+BEmVHd26o8s/Yn2FAAnEnHzaqBKK/hkKTjZEIlstpb9+V9mV9pe
	uWl37qoAO+ph0mh69Xj1Xp8VSMbF3yNMg+o27nv3kuPzeMOD9n/D2sLYGi6PliJb
	dipCTDf/pqmsquGt/0W2UaZI5D29l/ueRAA6Z3anoJbTUa6Wo+XUn+8KA2SZ0yVj
	W2ELDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd8hfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:40:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edace8bc76so1283061cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 05:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764250832; x=1764855632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EXfpJVkVCHqHBa7iIDVHdwlwEIE6IcmpTr2GdXkqTMU=;
        b=VyWnuGfxNx0E9U9eMpyIAEM0z9amLBAvUatBBzGu1k2MINXrSvnPqmGBJaqtVIpNEV
         ethuqn/IykkPes59Zp2BQq3CDi0WuHI6+Zrkbp/AtxXw7nCc+wqvHaAl9oFY8Wk9MvEb
         Z5llorA/sm9D3UEbpQEn+eCJJUEkV/qAOThSEDm2cSa2/LGsD5kmVuX6guNkEFF6GOqu
         84J7OuzEUGAduQROkvPRBYxHGdJ8F+1IXoi4iv00V1np2wtOIqi8Tu3SBB/Mjr1mgtZ3
         zlCM/gOClWeyQ1U869zdgak2vLMw1g62XGV4YaVvhSRrcdH/ppBBvA8TOOudS9ykRe3R
         IUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764250832; x=1764855632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXfpJVkVCHqHBa7iIDVHdwlwEIE6IcmpTr2GdXkqTMU=;
        b=wCHLGoZL9IHjiLnhJkiDtfnSWHObnHv2JmhRAaazhgFbHr4oZuhPhtstCbtSrxpmGg
         CeG7Zk8NRW2Kj4Cuhh4a21nzHNCl/OxGacmdEcdQ8XBfxTu4T6fO9v4VDW9KodudyTZP
         N31xP7XNkXt1jYDvb3snkImlhfl+sH2ka9htT6KF0vGKkYuzlsiucLvgeOmM3k0X68ir
         6qTUYI0hki/c4J4pVDwULzTJR4DIqWWHWAKYZL0IhHRpLM1htXlfj9+glIsDRoZI75nJ
         oQNxBFMj2IiNvsqtPmzayIjWOWvzqTNL4Mum03/Oa+X0bxOYoKFmEPuPgWTHl6CEemkp
         m5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYxRcjWUrwKD5ILrN6hKKjX4ViqcAyYAAaFZ+ue7YhpVmfQ9hOxKZbN5DeufYjGQ1w2LwY1ECAbOjKhN3a@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu7oF2sCwS+Kf99sNlqB0j/wofq6J/N5r58V1vLPvZRGgVuRFS
	sHbkik/g3USOeN3rTqPjO9rHnlZtRD2Ad09OKCuAuEKW223SGN5zvJPCYSdT59GidKlFqSm9gzZ
	zNOa0hgzG2m+i4uiExnBwijYuN2HIe/6sn4hf7wKUE/XOSnS2wjc30vIX3Vzcuvbe+Mr4xDdgh3
	hF
X-Gm-Gg: ASbGncvVqyYzef4XZI8ewVa+QSmlRlERh5QIDAUNUCKy6jbMT09cOpz5E4rCich+ZvP
	cx9Esf/995Q2q/XiPnjXdbgKzvR1fH+qwXokX50YpSB6e0E2CVg9l11FpiaxLSe3KP/3gtmCyir
	f7/MRCDYSDt3IK7Qs38kIx7iBTgaRK79jCx89lxNkA2A8agOHXDOZDdwHW+E5htYrmhZFhgySdW
	ePPn30PNTLtgB9Li69qoLy6ZQ4Xk2IXf6PYhFCOui1SYjbj/H7vP0YYEze5VhE+EtidXOIQhnGc
	marbXRvuH9AKAvaQRJN+QrQyIulvA6lVVRuy9SI+9xEPUGkxb76g0ICbKpyAaD5NHmn5dtblJfj
	Eigs7XX4DJ1zg6bD1vffx6Lw2rDOMYKf/W16lKZImxn00GqR5Jv+e/adXIu4tHK23lps=
X-Received: by 2002:a05:622a:12:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4ee5b5ed98dmr220764431cf.3.1764250831655;
        Thu, 27 Nov 2025 05:40:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw7SzxsqboAxtq7qY8CfpYJdV21gdngQCglYQEwtkf3PXTyadkxvR0yyKVhro7DHUim4ydDw==
X-Received: by 2002:a05:622a:12:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4ee5b5ed98dmr220764121cf.3.1764250831108;
        Thu, 27 Nov 2025 05:40:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a7afb4sm163922466b.70.2025.11.27.05.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:40:30 -0800 (PST)
Message-ID: <b07b88ed-83a3-46d6-8b97-e8661e2cfaa3@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 14:40:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and
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
 <20251126012043.3764567-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126012043.3764567-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aX9NVDaolUtU6_JMLGMpDwkb5q3UA021
X-Proofpoint-ORIG-GUID: aX9NVDaolUtU6_JMLGMpDwkb5q3UA021
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=692854d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=DfSktKokjTjfYq3N_6AA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwMSBTYWx0ZWRfX77g9jxbYDGA9
 x2O8+IgO/1nyJIlHtqP03Ng3s3J2RZWaWajFYjkBRH2+khwg1p2QJ9cIqSBVcIUgMLpyE4DntVv
 TRbdIjPDirt3bpZeMt+o9oASFY8devIc//457aql3MJZ1SphMUTaoR5n5VUXsahf3z5MUcbjWlU
 sba7q/nY+HZWS8wmdoH/bFhqOHQmMmCVJQWy+2ahesSN8jeRIs+64Mxsrgz5J5Qx4eQ+fVMgIZb
 D7BxNzYeqcYGCI8uGYoSOCiki/oMP4IJM8DJJGVWugcUDFa1KHNk5sfm/Y3kNSYwxlbhc571sO4
 4LkvXrvmGhdRa93Osh440E29mNulq0CbnpJhfiuebguL7OUUTe2w7wh8SkXmKnhABM9tryE4o/L
 zucXxST7/7BozQXiPLYJWko3bXa8aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270101

On 11/26/25 2:20 AM, Vladimir Zapolskiy wrote:
> The restriction on UHS-I speed modes was added to all SM8550 platforms
> by copying it from SM8450 dtsi file, and due to the overclocking of SD
> cards it was an actually reproducible problem. Since the latter issue
> has been fixed, UHS-I speed modes are working fine on SM8550 boards,
> below is the test performed on SM8550-HDK:
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
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 23.5468 s, 45.6 MB/s
> 
> SDR104 speed mode:
> 
>     mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
>     mmcblk0: mmc0:59b4 USDU1 28.3 GiB
>      mmcblk0: p1
> 
>     % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>     1024+0 records in
>     1024+0 records out
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 11.9819 s, 89.6 MB/s
> 
> Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
> file, there is no indication that the SDHC controller is broken.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

8550 has additional limitations. One was addressed recently with
max-sd-hs-hz (HS mode can only run at 37.5 MHz), but when in SDR104,
the frequency must also be capped to 148 MHz. I don't know whether
the driver respects that today.

Konrad

