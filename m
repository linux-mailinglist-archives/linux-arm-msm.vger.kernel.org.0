Return-Path: <linux-arm-msm+bounces-36959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4869BB834
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 15:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 608651C22159
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 14:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF7E1BBBD7;
	Mon,  4 Nov 2024 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnUrk4ps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC570839
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731570; cv=none; b=pA7eKJNyBeJG0/devngRGvQGpzn/guqqIkSZm6Drvnc/9E6JNNFWfnAcBk+tcEkpgkGZ/g+Yhie2UG5DMLKjSdZP3xN0n7EOglaZSPC/HAnXB58Sk2O9Y6uj1GpRMWG0VHfotgkklx4yUMrgajHULGwimBstNKntqlTuxT8fQ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731570; c=relaxed/simple;
	bh=ri5gKANv6TvUTPl9+9xRfhB8LDqHtD0yB8YlHumIS9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h2P0rvdECkCMd9QH47FITj4L6Wj6AE7UaWHmD2tlmzD46pMqKqoRdvzheJNBrv1Anb5P6ubKyC50cKmikojdGYTq99rHq3PX4w/ddcMXjXvPG8L93Fdq7InDJEnv13jdL1OEZ3lxiEAsZLqkG84im68/Q3Lqp2bRxSp+/+7xAro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnUrk4ps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjXjx005057
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 14:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEq/Fez3KiO14L7XUIPT1fn4g59MvDWGnwPCbPiCdc8=; b=dnUrk4psxz61ql1d
	XTAu50K15rdAPnpWd0A9Whx7RVc9UH+Mog/DM6oiw4kFxB5A4tgQugcPW4hr5erg
	1ICb6mCY68H1TP9y+GLQPnf5K2Rzx528BCfaegzZWkXRhDZNYBelfjr9C1ZEZLaz
	FpRvlTe0OPOMsT1zGwpO1W6a4/2E4TuGk0AZrPM3ZFIoOEbAcnSaODX9TrStjGKD
	+Do0voXrDhMTadRVzNq8wNFrcEvcK6sU0sFUr3NGfb94WXKW6td6ahHPfV0XdyRK
	9nWKXdmtUiYiMW1bHYdvOfDNWO6YxhrEcLEjGcFZRcBcxoC9PlPIBzH2kvzr66QG
	SXNkHg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd284kas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 14:46:06 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3e6069ec8fbso49832b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 06:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730731565; x=1731336365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEq/Fez3KiO14L7XUIPT1fn4g59MvDWGnwPCbPiCdc8=;
        b=WyIwh8PQO27RadCEVgwghSNMPSuq/BTJIrMFFQ+e0vNhPfcRNiiE1XJxwscW0SpH7b
         +zV4umyGUaa3UsQHnE/ocv+5G+8XOdiQBBjbxAn9v1reojvh4xR7mkh/kRkA4QHsHaBK
         HEx1EYScNdbJqDXhOPP4awf34SVZZvyWP9u56FeaQW/sQkC72BCzHHO3rOqnkXMI+LFO
         R1dSIfD9LqkEzdhbwxzu5lhuAWvNT+x++g+/8wMpZi1Hqy6rueBMOwDijy0IzViopjWa
         D7EZT6HGMXFajXeTzCiSC44xO4C92gXjRZRcfXPyELOKZDZNjEokNgA20dci971xVfur
         CHag==
X-Forwarded-Encrypted: i=1; AJvYcCVwkmfWXfPz71dbHCwm3CCYCtaCIAaTGpDd5Az5/Ij8yy/ctuhTgPATHtx6bX0dml912TNZq3X3MHgYwcOt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw65+yD0Hl7Lg1pa9eIUZ+Bl16eT8zPyl562LWFv4wLVgU/vhND
	WnhaMVs8WNjRXmMr2kGSA3PPtnObxxdOhKn0hX5h30ChVBlt+r5cHWJ3szn8D+Ll5Au/Onrb18P
	PVLIO8GOhH8FBjRKBJNz0z28MtpGdJBuphma+q57sig/YP+3A7qNvYv2roaXPv4vv
X-Received: by 2002:a54:4713:0:b0:3e4:d640:7449 with SMTP id 5614622812f47-3e638443fcamr7064337b6e.4.1730731565118;
        Mon, 04 Nov 2024 06:46:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjt7yLH7obj2yJY5lX8bMi7SMYsNafpSge3M0yoLdMOlcEwQ3eZbty9K7EcZfKV6+orGjU0w==
X-Received: by 2002:a54:4713:0:b0:3e4:d640:7449 with SMTP id 5614622812f47-3e638443fcamr7064299b6e.4.1730731563300;
        Mon, 04 Nov 2024 06:46:03 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566797a7sm561800866b.190.2024.11.04.06.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:46:02 -0800 (PST)
Message-ID: <f0863c6a-44cc-4709-aaab-a089fb6620e6@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:45:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Fix CDSP context banks unit
 addresses
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241104144204.114279-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241104144204.114279-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TaO5NVZfC8rlZKpSB3JLn368rBVpwHq9
X-Proofpoint-GUID: TaO5NVZfC8rlZKpSB3JLn368rBVpwHq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040128

On 4.11.2024 3:42 PM, Krzysztof Kozlowski wrote:
> There is a mismatch between 'reg' property and unit address for last
> there CDSP compute context banks.  Current values were taken as-is from
> downstream source.  Considering that 'reg' is used by Linux driver as
> SID of context bank and that least significant bytes of IOMMU value
> match the 'reg', assume the unit-address is wrong and needs fixing.
> This also won't have any practical impact, except adhering to Devicetree
> spec.
> 
> Fixes: dae8cdb0a9e1 ("arm64: dts: qcom: sm8650: Add three missing fastrpc-compute-cb nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

