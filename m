Return-Path: <linux-arm-msm+bounces-48976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC5A3FEFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 087B13BE6BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EF52512C3;
	Fri, 21 Feb 2025 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oginvDNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B63250BE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740163366; cv=none; b=jSiMgModsFiJ6qiJiuHyCv7H3s6N5ex6sXzWDRmB6Jliq+IDCItywZmuujfmu1gTU1kqXKTOVvOKzg+5Iv2sXSjrWGlZUGdSjaPCHt48x5CUyNtkwwJJV0CeBlI7hdVUznti0RHghwNCmcFM9269RC6I4pOas7Hp0YC2SJdqUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740163366; c=relaxed/simple;
	bh=jCTASy+FJp6zTUp8ZNj4ORjvLqlgaxRDC1k4+KLhKtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McVkIiHH+uFvjlYb5A7coBjP6rtKISoQEKZ+BrZatdOI6VhWzHb+OxuciuJyTMj0gGgWq3ueIfaJ6Jj50Tb/VAJQTwHpYUuwTD0L2Ax8Unt/DsjJ3iInki4EwDF4IT7dI2UTJRa90YQJP8khezfX33H8xegQYhUR52+owcHl1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oginvDNz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LF94CW020446
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8s8TG6f8PYCdNRO/k/pBQmK7AYr/yxFckrYhr81vi4=; b=oginvDNzfVdFmSF9
	aZepPb9iOLa2k+fetto+ZYdXFeySiSxGcDmf36sGtM5WkAuv2hDuj6KAm8knGNZg
	wvSZQqq6f0i/UpUfUFI5koOJFDfWE0Rz0V0HVLJz4jQW6ZmXjy+FPJGp8WHyactF
	gHiJYUMZv56XA68K2/QLrI5YukDjJOnLyr17enkRUFcG8/h6LgJAIQBN5r7R6hgF
	o/Om//uabYgAvbWq355cCBn8eP+5y3LXcxRcwJzowUpFkLDOgvCk6zbfYx5OIisG
	kiv21cOBi1S02aFvMowb5PxzQIRfgwEDLKG1SHZox1TFh1LC3hABmklpStzCvzK3
	ZCetWw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t5kvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e66b3359f7so2815216d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 10:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740163363; x=1740768163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8s8TG6f8PYCdNRO/k/pBQmK7AYr/yxFckrYhr81vi4=;
        b=OTdXUNfe+YfAMLF5O+u7s3Do22Lnftq9Yw6Jk04dYy9RPAOdQwaFk/Y3ouzbSSNUXY
         62h7Ix6qJIzV/YxlVuWCMRPAOcUGA+KNCHq5SiQhy7WwvdhGRZrD6a/kBeIHm9uyrPRE
         uunT0zrKBhu+32s6vKaEnKq75BLrXecn5HwRVBuEn6U6qsZO/qm+t7BClmsg1QjmLyO0
         nLdKAdZOdxhEyIfXfOkxUyILvvtuhVY0qC6hebBBca0HuzFeqgXFbOA+La6cSPSgn1Mh
         NqP2cot++kIJId8cAJb4rpiBdGh0HCV5fBOq2+anSptBOt1Ord7DslEsrwcoZoVdG+8v
         HJgA==
X-Gm-Message-State: AOJu0YxlQOWPjzM1XYqd70R3jsEyIFi3xEUQQWhAjO6yy8+WC8IYhO5j
	eFiC6H+wVnJSft4R4vpWS7Cj3W04pZaltU9Pybmw06/BkKLJSv7IPoL9BYVIIcBbJwRWzQu9o84
	lJdq4RMxlv489XL5JuOMbS0MHTZNVVAwxUVrhOSF6HYLWqXMGXyJkRTqnDasb+oNK
X-Gm-Gg: ASbGnctQbyqf7jWF6FpgQUCvSbN1kPiaXs4tUK0zTSQmffkjmFi5P1+kJHtHn/kmZ/k
	VL0GTt1sfwBOERas74QY1d1SaNCSZf1wuWGN1YSvB6YdDaxAETcQx0Vv2zx9HxZKxBJ2fieQotM
	1SR4qRm4kgfHOZgMEqD6VOjsFO12R1tDzRWHJBYmqELzB4AdibKvgLBNDDSZMOndCTUwqv+eQhR
	vDmbsHnTRewY9RWniIV/btYlz6RAZIAFC2GEsWb87K01P+R3NgfxKiRUeIEsOtjeWhD0YrCa4ia
	IJieISrR37/9WuLOH8ajlsv0QUGMnj8a9ADnjlxP6FBGMpO8IUIhSMTmaTDMDKZjJEfPcw==
X-Received: by 2002:a05:6214:f27:b0:6d8:aa37:fe17 with SMTP id 6a1803df08f44-6e6ae82469cmr20927516d6.5.1740163362655;
        Fri, 21 Feb 2025 10:42:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTjUhOg4rL/3o4rvJi0r05P7QCrVkmHocIAnPserGG+U9PAvwDArPlWUEPfHJ5ND6VKVGR/A==
X-Received: by 2002:a05:6214:f27:b0:6d8:aa37:fe17 with SMTP id 6a1803df08f44-6e6ae82469cmr20927346d6.5.1740163362269;
        Fri, 21 Feb 2025 10:42:42 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc9ff4fcdsm645841266b.87.2025.02.21.10.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:42:41 -0800 (PST)
Message-ID: <33d0c83e-2858-4308-b224-1c15080b438c@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 19:42:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: sm8750-mtp: Enable modem
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
 <20250221-b4-sm8750-modem-v3-2-462dae7303c7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221-b4-sm8750-modem-v3-2-462dae7303c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: chduwgJ6_nMzI5-71gSYQhWqqfjuItxv
X-Proofpoint-GUID: chduwgJ6_nMzI5-71gSYQhWqqfjuItxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=660 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210129

On 21.02.2025 5:33 PM, Krzysztof Kozlowski wrote:
> Enable the modem (MPSS) on MPT8750 board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

