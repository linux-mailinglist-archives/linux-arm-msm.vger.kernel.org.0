Return-Path: <linux-arm-msm+bounces-41832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA09EFBAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F94189111F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583D21DCB09;
	Thu, 12 Dec 2024 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFS00Xd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917F1DB37C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029560; cv=none; b=SEsfrP02qLvlB7yKsKYOTvCUxrdShDjPxHjGVvBKZRRVsNB9zBLGafxPoBWG96R84jsmd/YLU7yjJQcBoXbmsLcD5CPlsn1DuxzYSH9knJCrTSCRNVzsQssDyT6acZpp3s+FwwL6gYzy/cahZTzrUUL+eKqeEOwKqEyH8G1GCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029560; c=relaxed/simple;
	bh=wpqYRHLY9Q3i1AL8BGhF97syV72LViqIEk0cqGJv8Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUEPuL9FDSPpAbO9lMUGJ3+igsOtTQQZCETCVkXHuxjEbjnoe67EhfBudQ8oEx8I4BizzZIg9C86jEEkAA8J+yKEq1Nvnk7z/R1GGO2AWPOsuLVrcZLOWYI0aI7ME5rtF01DVUtZulbSnX2jqVv3l8ezCsmkrjCnLuy/ftVvH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFS00Xd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCCE78E001145
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHVnPiu0fXT5G9r0E8kvgJAmJO6G4iQt+5iBGL0kKQg=; b=hFS00Xd9GkhgNGDz
	+G/Uod11VWTNUmooW2m6jnkz5AudeBjVKBSt9v+/si3KF26jJr1LegZX6UFhZN7U
	xLNfAR8aSCB4iDj4Qd5KmJbu2NlBIDAemaMqXkYokSJ93Eyc94WxzU+WNJapnI3R
	nOARjh331Y93l+cq4sDElqwMVyuySpJJ6jtaLexILjfSfZPSMi7TV5wPhVsJNUSL
	8fkh3eFR8MOHVmU+mCaGlbcvflvEC1aoy/8Kl4r70z2vJuOOIgGlqSknu9+WJ2B2
	bqdmHLg9Pwum/4Qy4efWkiOqnSntdbTvfQcv0JfxVtMWa8OliDmQiriqEo+u3138
	iXNDMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes2euq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:52:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-466a20c8e57so2024181cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029556; x=1734634356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHVnPiu0fXT5G9r0E8kvgJAmJO6G4iQt+5iBGL0kKQg=;
        b=UfAuZOZU5XIS8d4U/A+gHuCVCTOqkc662BrrQwY7dF6cFvTYMK6hdv1YqRIbHcjBqx
         ACUioGT9jrl9lm9OI4efq1G05psr8pBlmyezN0l422+tLAIPzIyEyj1EE8U9P8B3xr49
         bzs1W5OF9wHbZYdJwS3rmOq1hzBhrMjWR06E3LU/AxS39V7CbLkBldcBm2dVfKjbabtN
         STsp8qfGO3sPsNIbrCnajuIjPPxr9TwesFv/u/ONkSqCad2ZMsHWT6ZLlFivWsqfINTY
         et51jpn6q5MMYrdlL0Cq20eqrLLstchjQbBzXEmhzRdBy14taiWkWla05lYP/iNQlHfO
         GrOw==
X-Gm-Message-State: AOJu0YyYSmE3iFUUpnQIbTADN5FIvymzab0ORD3+Q4feQ2mLjLV8FOsC
	FKb7zWvd+cLb3fPC3t3PIn9Wt8AdoVpVXgNysmF/7Q0MKdOj3rEkktd6frxShhCABlJBnzw26/O
	Qty4JAJlEgmSGtbzzCFdFP26ULMhoG+ur/UtvapKNzelnT+o5/6CYqOywGM7BCpBW
X-Gm-Gg: ASbGnct1PBlaWpReYHJlJCUM2jNuLsIdOOlYjA2Z28HsGqA2m2zwW2ns9Q01s6V4MmU
	1b9JLh41WWri3rosTbOAZAEAy4icyQ/8Drrh3gxWj/i7mynOfmW3BsbX8BAZ0EXZ7f28Z+Ck0En
	YSTMd7gV/n21Ivq+vB1Xi2ve7442GKY921Srp54KEXTgRejK/Byfd9nxrr3d3ABWv8wxMNngI0+
	VBNimwblK0obGMsyfCvW/nj+ugJnKof22p5n5NqD5q3qqk2C8GqNefK9e8Qc2qF/bONJQVlnz6e
	W/EfTc0i7DAZhC1dly/izM6tIoVwmFfQuvaWSQ==
X-Received: by 2002:a05:622a:c9:b0:467:6379:8d2f with SMTP id d75a77b69052e-467a169186amr8478171cf.15.1734029556535;
        Thu, 12 Dec 2024 10:52:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7/MNbUv3xFdwlcuOQKfP0KGnVgHCuYubECnvOzq2ZduK7+n1HlMtVjJI0EFu2TjMW4OtvEA==
X-Received: by 2002:a05:622a:c9:b0:467:6379:8d2f with SMTP id d75a77b69052e-467a169186amr8477891cf.15.1734029556196;
        Thu, 12 Dec 2024 10:52:36 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3f1323f99sm6819723a12.34.2024.12.12.10.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:52:35 -0800 (PST)
Message-ID: <004a2231-992b-4657-8f5b-5edf96a1f5ab@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:52:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/19] arm64: dts: qcom: sm8550: Fix MPSS memory length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-9-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-9-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W_Sf6-oHz0q_MAYrrrwjbo375-1hjulY
X-Proofpoint-ORIG-GUID: W_Sf6-oHz0q_MAYrrrwjbo375-1hjulY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=892 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
> copied from older DTS, but it grew since then.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: d0c061e366ed ("arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

