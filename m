Return-Path: <linux-arm-msm+bounces-46388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B832A20ACF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DBBE16391B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00241A2567;
	Tue, 28 Jan 2025 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPESAjBQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153E1A23BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069195; cv=none; b=QaN3Jy+b+RwpyRTaDOScDeElVnnQfq7uzCSOG2sPX5rgcz8AXDqJxS4VlM3/m6pXv09tpBaD2vICIy8qM1aFHvPMoSbeDKtQ0YrMCo4sUqRxLYGegzgVIw1L5GvGvosOTcR5YhhT3nXJN/tbfyuj8SU3VHWOgjdb80eUq53MGSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069195; c=relaxed/simple;
	bh=H7d+bq0SBwKU/hJ/udhJqU8mEnycT5m2pZlDsOy020c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fblRN+IaUXE36wrvf9tJ4DTO9kp14uinthHSm4qHq3sBNb42KbugXZBa1pOEBA2+ZpKIuMrtWPHBVhSK2t3BsIZI0hneRPLiejZa64t8uaYb/+JjXaSM5EyGZfU//k7Pb9btJuuXH/VvnH2d5j0UjU2/L1GdeQUzcJdXClOcKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPESAjBQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S8hJLp014889
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 12:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzUN/MdtH1R1qQd3fQSvUaDsuOumVt3Eia7AaCLc6P8=; b=TPESAjBQ9SDGYIcu
	8n417PxPCVkIZLM0e/Na+QN6PmQmU47Yg9NbzKAq12ynvb/8p+13FvwNFZidX7zp
	OT3wyCup1zWbtv0yRSRMTr+XWrguEgWZ+VgZXAgCKc7b5hcTek5W838mVq5ETkYc
	G8Rq1g84IDMGZHRgACzmZoJJcrX8lN8ROOP6LPSncZexCrWNMMwm2BKkCLh4Gl0Q
	EtAaYRJU0Wzd15cjGWz/BcwWdLvXw3ZA0x0gEn35k6uz9YfT8vx6Q4Hdkjlmuk+7
	G3C9gNSZz2VOuKy3WzWub21jz8RRufNJ1AsGPbskR8/ECWzjUSs85/lKbD8/ZLu8
	pP6bVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44euyq8j3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 12:59:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b704c982eeso134934885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 04:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069192; x=1738673992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzUN/MdtH1R1qQd3fQSvUaDsuOumVt3Eia7AaCLc6P8=;
        b=ivC9cpwBgBh6nmrCShqiqDaJh7Geb/q1Qh6nGxxcDRJgsXZC4zQuC/CcScp49xg7dx
         LMhrlOy4+6i4SO4ZzG/YGJLucCjloNapPWJpKprjewS9wx6BTv5uNu4I780Td0zvwvSC
         X1gCxYr+tjYA8LVAg6F8mzw7FYehL8Rfslfu/h/i9e1+0T7swARfIi0kzMWTNdji5Off
         Q7NyUQdRxeLUNXtuAZNwcDF6u2CwUxv7bTz1a5CGqML59H5Rig0Yev0yWxEi0D7NG+Q7
         G672YFhlO8zv019p7koHxKQdXSFI/SV/wpNTTdtShCldpUpgz/MlFkJSbREiwcPwFXQx
         +RrQ==
X-Gm-Message-State: AOJu0YwxAub3MTRhutokbxZSYngx1SDsM5/OADMxlQdF6V+jt/PvVSUx
	FX01JIXE0vtAMBZHce1eL2ZHauxPHL+oKVycMWh9xNdxQij9nX5E3ZYKxND5OuDK+wYRaKNaelv
	aukUvQ25ueh9L7XsSJj6LkOdR9ZRAh0xo5R5MWTWJkiloKBSLBTaODQHnWUJ8Xql0eENjs/5j
X-Gm-Gg: ASbGnctfLs/XTI3jbh1620cpbuELi3je5lIf1lCHWFNazHb8gSlfGrkyj42T4TBqc1X
	+kvNizQfGpHa87NwKzamOLVI4u1vZiwUYvN7L5668+oST3b2X9f/o8Dij4oJlnXnllvztAL/OI5
	G8lhOX4LBlsUadYQ+Ic6QQrD3hBapbqvnD3dNYsLMEUv78JD0rWji9UY3SuX0Hp/f7d+lP7WW+X
	vtzW+d24LqxJwjITm+gUIVAr2+cYdeDAxgwazi8EsXXnNr66a23G/fcTfePfReqh5KFM04Hsdwo
	UNzCg02BJpEMVgemBUDueTaMwiTzFQH3E50PQnri9c294klFfyqIfyRxLbo=
X-Received: by 2002:a05:620a:2552:b0:7b6:e196:2219 with SMTP id af79cd13be357-7be8b2ab39fmr1575612785a.2.1738069192349;
        Tue, 28 Jan 2025 04:59:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhtzEkgLE0xqMpsPd8XOALQn+dLARQuX/MKfA9Ha/k1TZC7hbXIFwzPasGyXjtDBuBFQ8qXg==
X-Received: by 2002:a05:620a:2552:b0:7b6:e196:2219 with SMTP id af79cd13be357-7be8b2ab39fmr1575612185a.2.1738069192027;
        Tue, 28 Jan 2025 04:59:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117437sm789728366b.179.2025.01.28.04.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 04:59:51 -0800 (PST)
Message-ID: <7bc8cae5-8013-4b86-827c-37084d093ac0@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 13:59:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] arm64: dts: qcom: sm8550: use ICC tag for all
 interconnect phandles
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
 <20250115-topic-sm8x50-upstream-dt-icc-update-v1-1-eaa8b10e2af7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-1-eaa8b10e2af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rxsQn2ewTgjJQTTyFbUljeESitCxp3D3
X-Proofpoint-GUID: rxsQn2ewTgjJQTTyFbUljeESitCxp3D3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=654
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280099

On 15.01.2025 2:43 PM, Neil Armstrong wrote:
> Use the proper QCOM_ICC_TAG_ define instead of passing 0 in all
> interconnect paths phandle third argument.
> 
> Use QCOM_ICC_TAG_ALWAYS which is the fallback mask if 0 is used
> as third phandle argument.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

