Return-Path: <linux-arm-msm+bounces-58076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E1DAB8AE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB2F174194
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989EA21C9ED;
	Thu, 15 May 2025 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKyYfYrA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC84219A95
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323316; cv=none; b=ceQBcpjKQCI5HfwrsKcshNFT/wC6n64jp7y3qg4/d/ZaC+qwjh7DuD6u1CrG6wN07CHYTG3sz4kyBuuHFW89XS0pns1NIquOnoOzY9Nl+cA1aLf8f5WuUm/eJCL+9JyGcqBgPLJiTd93OTiUO5Y5l2Yfasp4qZz9JPapuj70Cs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323316; c=relaxed/simple;
	bh=kfGaaBcF/LpH0NxWWC3HOK/nOecylao8k87Fg+vGGyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cs6QorwbZLQ0BgXUQkxcRAc1gRvcwptgzv6LypSxCL889vTKMZ5aHButdRMq4u4FFHI3Yu7q2axA8hs55atbvjLt/X6sQoR/ATjDIl+b7iZ2PJx2Op9J7SCMjaUqMGw/uxx++1u/DsbfkoCpxuunp/3r5DGivqbHNeXFh4bakuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKyYfYrA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBZv026131
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rkzw4ciboicJeZhZaEWOlIlR5gsZ0yhn2FRwPUQB6/Q=; b=iKyYfYrAhhVKhXlH
	0ie2Jwxsfttl0cU9duToLuEyfa4fsQ5utrlIZoOY7O6D7SSpd/rAT6tHip/pVmE1
	1/w4a9C/3ySPrRb/ylT9A8t+CjY92JJAxlxKYGkSNn7IcBadH32lVNr6q0csilhi
	SAPhGUBEgdA6pzyQFz27CdyAlNcZa7Epa6i+U6NR7Q8ukKKtWuil4YuKrei97AM2
	9Plu95Ab+1XJ6TOjuQVcKjHaHGu0yRyYm3kBQqotFiQUtoXVdeRVL/xmzFIGBXQM
	JpAdcy8vvq8Jr8Egc9Hx2+01w2q6dttz/DKrr99C9QxnTp5OiYQbkBYaDC4L4nML
	TA8dTw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyptc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:35:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f89a2df0deso3276606d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323313; x=1747928113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkzw4ciboicJeZhZaEWOlIlR5gsZ0yhn2FRwPUQB6/Q=;
        b=foEq1/zPvc4XEqdddKbErzltLa9hMZsySJUy46Cz6VUXt65bzrTJuPIuxmDcNKUaHb
         DowrYRY6hpdiTq6mZpAev1fImF7TsN5eKwVOcYeYu5ES6ykPXjkLQeF2wt/BezWVqQRc
         t6PTpPmDXfwaiP7Efbqdb7vWZi3I31b3HFG9ZLAivGkUrrmSkmmXVi0X+OHuIqja/qTZ
         KvwgqHt+mO4d8vH5VnohbcvU+CTk36OTXvMFMOLYW1Wd3/hyEk131zYoAbnnqgn9spEj
         iXrMO+6uNEw3/PSIuNxGqwq87xsc4dk29n7mAcB89GmJU4Llznw1Z0bv0ftdr37/qy7q
         e5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEZB1yaUml/Kr9/RvHmfW/nqXl/eDEes19SDvmkhamrNbMK24cfcRjOOTHUpDQWaK9qcZ+8s0yIfd6Qe2z@vger.kernel.org
X-Gm-Message-State: AOJu0YxunnU5gr9RVDb9PFl2hVbWMZnfn1qANbiO6HwYlmImiIGDRl4I
	theV/B98PJ0/18PNqu7/xp/JwvxBn1FuZ6yIDR0J2JnQ+U2U7X2iGinFfifAK78QhKccaTKQQTB
	OxcWOLcANnYmDgpRdOva7r/jemhuuIBe8/gU0J8z9ueFjls637h9sQ+bcpR3b6w9h
X-Gm-Gg: ASbGnctMZ7yR0R7jCGgIxeQUeUxbgzVaYMDmjcT2i6SdHoSUgLhDRmGS2Z/ZglMTIam
	4SY7sRScB7uGSPhMFs8ugDwFiT/WJLuI5CV9mKYXtYsbzDPSaJegcmOqd30qp2ghsP31WcI0Hlu
	3gNXPBP2Sh+XjQzO+93fovfeH5TSMS5AOaqp7KHp0tOFpRypbVRGIR+dExsG6o8zQJZxcM80y8N
	lU0AXN/RUBe1gASBxNcaolmNWE+5asy0RNCAZuyVX9DIJEjs+Ezk59hHhUGVKeiGhJBOxzu+Y+K
	0id40u+VMsYFYS7m8uohb+aEq/M/JuF1tJO6/uLusV3FtI8LHVTYJTeRVjnp1JC0Eg==
X-Received: by 2002:a05:620a:260c:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd287e57c4mr484443385a.6.1747323312980;
        Thu, 15 May 2025 08:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO0nTwZv8sYoSfNAmuJqERfG93omVD06XD7BfB9gDj2RWpLvTBvCuoS4cTPigbW+p4ywQfCA==
X-Received: by 2002:a05:620a:260c:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd287e57c4mr484439985a.6.1747323312255;
        Thu, 15 May 2025 08:35:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm6880a12.43.2025.05.15.08.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:35:11 -0700 (PDT)
Message-ID: <d98231be-3805-41ab-bcbc-5f6b6cfdac5b@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in camcc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rmBY0A1EmSzcLCFqSplvBHtEelQG-qSa
X-Proofpoint-ORIG-GUID: rmBY0A1EmSzcLCFqSplvBHtEelQG-qSa
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682609b2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9_CkSsT5FSWxdIVEpLUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX6W3Y9hqpzIxr
 W6RmGx2RUdWy1Zq7d8Q/z54su9X6rQ8OUy16N7U8+FuS4tN6eT0u1+7YCufcexNE6o2W9SF/sSQ
 h7fABj3d3/a7HXkqciilG7lGMRknhVSBNSTpxXoJbut6B7dUzKeSLoVFdZMouT7mLaJWi4zVZZ4
 PQ/tYUE4KeOiWyRCA4NdhX1Qymm+1NtNs4TCq8Za5QgR+CY33lR1pzORObGBSUR8fIIHR1z9o06
 rm65SYFxsrs99YjSgev3UJeO102mTnC6/ZpUOe9sODjgLacaZ/S9ecStcd92dHyBO+QIeziDTQb
 5C694whXqwsIsMYRx/0RlL1GgqGK/gzMmGFKHvQmNrGAQrSblg2XkzIbRgaYUpeNeJNWQpB91/X
 PzaEw9qfK/stCxijk8zJhGiICINhiE/MCRQNJXZ3/BH2KMeaNH3wPaYPPfkOGEdjPOluIXs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=658 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8450 platform. Hence add MXC power domain to
> camcc node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

