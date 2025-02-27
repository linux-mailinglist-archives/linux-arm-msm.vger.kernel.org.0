Return-Path: <linux-arm-msm+bounces-49744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1FA48702
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 18:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B147418848F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D11E1EA7E2;
	Thu, 27 Feb 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRVAjDua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D21E51F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740678638; cv=none; b=BBHhxcbuASZjUNAXHIwGmvnW3Cs8viC+0aVQkXmEdueSxUCiPpvWS8cD7Hs4vi2nmO+/kBRYl28YcdtLLIS9uAnlCgngeD2Lp4OKeN/zmw/1lmtfMaTflbIwRk3ub9D+JprR5+ZVorkre1nu2NPSpZvaSOQ1mFXIr84GV8Xdnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740678638; c=relaxed/simple;
	bh=33MWytW6HIuaaxDjPHCFlFyhNbDd0yneGwZlJ9C9rvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrK0pKbwL7mEKtzMcu5Plx/YStqitLdUUnBga0ZBNLqLnOlODb20xxf6qT+ALx/kxQDDRv6nwYWNFfW6Qc2+DiYbCeY8oT3L6aX83gYbopnSz4BlB8CGpCf9MTk6yvPpGwnVwvAnaauXlTHiTnS2//AzylUUeSPWqLv5LZ0kh+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRVAjDua; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9LmYq005900
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 17:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MltxrynpbJecGwXtsRyAlCXYQDFnB0d7y62GzHgM7Pc=; b=pRVAjDuaTzAwU0Gj
	ruhzZUdjtAsC7t77hQQTxYgOeUWEnXj0uXaqsm477/UfAcYcny3rnlb8oA6Z0KWw
	Yu3veUSEyYp+pA0+uH4eAy9ZcsJYFNCR3tI1E4102L8Enp1Gv5zWTCUACKwMJTu4
	oLArfejnmtmKt0jgdgh3JDnIK7GRXWVHBbhyvBQitODF4yHj8yM7ds40MSbGG+MF
	OKzZTVwMZQf/P1vGeoWh9W4q0Dmg+rY0Loiq5muWA7058LxAG70PXuyZ7bcGpmGN
	s8RDxGY17yCPYDiY2QoMsRf+HCDDvkfRIzX6KlYsjfs/J3famtH9KJi/fmbCXINC
	xzUZcg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6k5fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 17:50:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e89b0adca1so1606656d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678635; x=1741283435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MltxrynpbJecGwXtsRyAlCXYQDFnB0d7y62GzHgM7Pc=;
        b=k4xL3wJpd2S6DQEkHrPzHXL9ZRGYuMhbqAhiARqPCp2GIUG/FFZUGPpAOQv6SA+cZd
         Z/Do0msXQV9qAzcUBIX7T/TEwb2D7UvtHiuG0Qz5D6Nt3aWR0uDbtQCv83nA8rB+1ri0
         6zd6vyDKq+ZiZ8pe6upT00eb23GQ8WFrHgTh6JlEF/xQ8J7q33d9f+ZAvKieko+OSyVE
         ZYaJqVIxLwjZtLZtV9fSx5ddp8s4TmXFQtW1Pr4dkBpaQRelZLjzHnYRzv1+77pB5kcR
         eBVCM+Tg4kR7BklaYVGzEqtHJfHwcQiJm8G8QRGqZh+zigdfVt3Tjq52XW7lvPzY4oXm
         pCxw==
X-Gm-Message-State: AOJu0Ywk26OCKqML0MIVdA85ER6+N3bv2YWRlC2rfbrMp9OGbo0Q+ph3
	2CU8UUZyoGXrcBsHAnLhhiRRv2nWuiZFt3d2yykXsXAGNoaRVIIEnAULvVn8EWNqa3J4tSKKjnV
	OepQqBvLhdwjpXZaM1G7QhiKv9RZ2n7QWWLwb/D7oI2VNa6p80Qnty363u0eEnq2N
X-Gm-Gg: ASbGncsu+4xdBqJ+29o0Q9DBzbcfFFos99hkjG+CSJLkUsSYizmLlRCmNWST9+N0GFD
	isopbx2vA1nh90CxsrbfIx0nun8TjQmi9fkrTGWQBuWwT9jrkfq6npw/kJEDBtsbK4afFaUAM+f
	cfcgsQBqFWUYlvKvJ8Ly/MlV9ockpBAP/BQIkdKco2lHneDiZoqmpI6NxxOqR/gDrJ1/7i0uDVW
	gOTk4tIQ1KU4+yWiLDpUTQdttl+lyMwB8sEqMb65SaluvrmiFdm8k3TV2kgODO7Xk5B01Z4pDK3
	EF4LZ8WJlO57k9Fw2FZAGfpdesYkfKfwaJ3wHsdahShz66e+DZUPaDGV++gBMxWFayptWQ==
X-Received: by 2002:a05:6214:5006:b0:6e8:9ac9:55b8 with SMTP id 6a1803df08f44-6e8a0c7d646mr2019416d6.2.1740678634703;
        Thu, 27 Feb 2025 09:50:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR9yh+nwQNmYMZCa7oAW+LC0hXOHsrkYIwVv+j52xps6QPpXEAgXwfuzweMxFIW+GPJv7wLA==
X-Received: by 2002:a05:6214:5006:b0:6e8:9ac9:55b8 with SMTP id 6a1803df08f44-6e8a0c7d646mr2019246d6.2.1740678634375;
        Thu, 27 Feb 2025 09:50:34 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9990sm156046966b.35.2025.02.27.09.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 09:50:33 -0800 (PST)
Message-ID: <7535057b-b6fc-4831-ac5b-b68903083747@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 18:50:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sm8650: fix PMU interrupt flag
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org>
 <20250227-topic-sm8650-pmu-ppi-partition-v3-1-0f6feeefe50f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-topic-sm8650-pmu-ppi-partition-v3-1-0f6feeefe50f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2br3OH3nS5-ePbhG0CZibS9BltMbV0di
X-Proofpoint-ORIG-GUID: 2br3OH3nS5-ePbhG0CZibS9BltMbV0di
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=819 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270133

On 27.02.2025 5:04 PM, Neil Armstrong wrote:
> The ARM PMU interrupt is sometimes defined as IRQ_TYPE_LEVEL_LOW,
> or IRQ_TYPE_LEVEL_HIGH, but downstream and recent platforms used the
> IRQ_TYPE_LEVEL_HIGH flag so align the SM8650 definition to have a
> functional PMU working.
> 
> Fixes: c8a346e408cb ("arm64: dts: qcom: Split PMU nodes for heterogeneous CPUs")
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

I couldn't find anything to back this up, not inside, not on Arm's
website, but downstream agrees, so..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

