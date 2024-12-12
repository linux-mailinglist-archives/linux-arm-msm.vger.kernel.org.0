Return-Path: <linux-arm-msm+bounces-41819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2779EFAD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CEC7188E234
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F11223E61;
	Thu, 12 Dec 2024 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0FIywXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D1223316
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734027594; cv=none; b=TyhQHgvi9nLI6m+6IgK1xibPTK/HvkoBLGQr297QcCju84D6lm9hT1rmxTGwUnYDMtHZUbigObOgpE7BWVNqM7NbTpqn3gNOewoDzcMCGBPZlEiW2j9c1zUk0jVdzy4V5hVZnzvzZrlztfeynpR/Xy6Pw32GlS/jbu/paC7JOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734027594; c=relaxed/simple;
	bh=BC/qpq76CEpIIrHWx2B9eZ+G4AtkyiRIqFqRdOh/W5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZG4d93AxLJ0aWnjpkaI9G5zkp86M7nZXUi9tbKTXpAXH21IKVsDFVPxJlkSQOAcLrLj8rsHXm0Y1rJ2mSyDb+MEV0RVK3IMSA7zCZMecomBR4IbLtVin7ByVlStbOiYGttIm+E5AIL6mDoCMOoO9Mcd4O14f1Rjkq/zaC6MbcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0FIywXR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHfH5Z032215
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GKtNCOtaL89pHw3G7/FzhB1Ks2fBiwK4pFoXlWgfkeI=; b=o0FIywXR9rpDaZOk
	gN/uFkjNFvMH/YtED0Junfo+qOBJaiHOnU+zjfx0r9K/Nm/AHg9hqGSlhE/07wZw
	b3UiDKFahAYRr4haz68xf9H7oKTD6fWrOZWimF4vLcvgmfDfunIMGKqj1OayLAB8
	AOSKsh1Dl0drIz8tWc2BIbri3DRleQIU5aJqHA5hQ3EeeYHuZUORjvzmKkaaJQV3
	xdIovlDrIpmYz/69pMs9GvuQ/KfUgomznnCEZdbJBQ/wMXaOr0DqV1FO+/R4Oa19
	EX6y/Uek4/YO4L6CDhi96GB1dno6TfP9gESfyp3k+98f8hSfeuN/d9IJzSbrziso
	w3uEZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfd4bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:19:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a39f07f8so108551cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734027591; x=1734632391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKtNCOtaL89pHw3G7/FzhB1Ks2fBiwK4pFoXlWgfkeI=;
        b=EKC8GaYRjGJNL6+n/V13LHi1ra/rncFtKrX0EE6Q+Mk3faEYXD179tp2/ua6BR3Cw+
         aresPxybOkCF6khR2qF2F3HJkSk2VuL74R6rvbrlYhOr2Eo8tUe1Z8792rLaXCklkSu1
         XvnVEbZ9+P+aPFHyRb+A3xW6MFb2tu5txN2y/r97A8x1/4WJ6oCS3Q3HKtEjyPW7h1qV
         YOax1tNgEr8PJRw6brppak0yyyjPmvWtU/RShty31cDi73Y9m1Ho3RHJt+u8j7Eoq7ie
         e+k8y+4SPqkKpPBV2mC+wfBfkOlbB9PduSZaJdcxE1G6wN0jvqDovDh9c99xYU5gtAXu
         8Tlw==
X-Forwarded-Encrypted: i=1; AJvYcCWLHZ6wSjAxaFfyhA+nAWZvErdosSqB/UNgIUk3KB16AQVYF1ojMb+0Rt54ucPBRrEm4XS+Z7iy+rNphMkS@vger.kernel.org
X-Gm-Message-State: AOJu0YwpZWx2Xqz46zbM6+t0qOrgV+CCa1FvYRn4JDuKEOc3eZYdp2it
	EkvIEO8+eanz3Q28tfWnErsdi3EYk4JVJYneZTbTYCCzytiOVltOBi9gJEZCYAVvsvk6bIUCgFU
	c3wv6xHDklgLLF2ws18rv/ZzHFbxLElolXJxbdO4ndz01pJIpbnDs098pHT6UQANL
X-Gm-Gg: ASbGncsgR+N5C1ZozjQoy5XD5FdUoIiz9yK/pajWGClTE0kTBJYBAa4wQRBdxKgesrL
	I+o7W93piM6JVs/4QEt2+XyKzeV5M2ZnxxVnNfkO+V0YDvMRBpm2zLged6maeGh4Tq0bxij1cTu
	9aUfEiIAqAmKBe5YajS7F7ZOPkn46E0OeN2IrAx0GNKPCwBJpO9mc9+NXwKQqQVGl/jICNhjH90
	Mo7BmJHKiQEwpf2wavEXTIezeNEbFQ7Gv2OkXU9onA35bPgbN3eVhA9qSo0Ti/lwdtu/tBUujV7
	ulRn77egZOIJGQ6Jekpc5dPZE/QrCeFcxp5Ukw==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id d75a77b69052e-467a14cf99fmr7175701cf.2.1734027591077;
        Thu, 12 Dec 2024 10:19:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC6KrQasDLA2/zeHAKapqCU8kql+Ub/Gc2FmOF51LQmMz74nDoscHAYcpWpck4WHEyFhI9xg==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id d75a77b69052e-467a14cf99fmr7175361cf.2.1734027590585;
        Thu, 12 Dec 2024 10:19:50 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67f26cff7sm672205966b.57.2024.12.12.10.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:19:50 -0800 (PST)
Message-ID: <8c60e0dc-531a-47d6-9c40-ea157a24da1b@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
To: Jie Gan <quic_jiegan@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 19e2egyJQtZDrEUhlSjzinrLJfjzOgpU
X-Proofpoint-ORIG-GUID: 19e2egyJQtZDrEUhlSjzinrLJfjzOgpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120132

On 10.12.2024 4:15 AM, Jie Gan wrote:
> Add binding file to specify how to define a Coresight TMC
> Control Unit device in device tree.
> 
> It is responsible for controlling the data filter function
> based on the source device's Trace ID for TMC ETR device.
> The trace data with that Trace id can get into ETR's buffer
> while other trace data gets ignored.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

[...]

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sa8775p-ctcu

I don't think anyone asked that question.. Is the TMCCU something unique
to Qualcomm platforms?

Konrad

