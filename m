Return-Path: <linux-arm-msm+bounces-78700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BAAC052F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32D8E581920
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7343081BA;
	Fri, 24 Oct 2025 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZqMlZqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CF308F0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295161; cv=none; b=KkUaMyQb1NW5UHY3oEE33kOFSyY95NFhjCcs7kqBUOIj3hhNkCnIImPhX60eOnd7BuJSx9HzsfIoounwHI6NaQk1iotOYL2hlvTL/86VTnO6DrJtsCx66+b/+xi8grXWcTTwYNSGl5fba6qwGCqlnPbBaNVTgq0kRuSOXyRVL6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295161; c=relaxed/simple;
	bh=uopKghKQJQC+vDU7zK18VSdaclR1gXuEayi1yBzX8Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMS/bz0BKpJodLGqG2hNzUxUfzVOMXouix1lLG0DO3oNZ5VE26riAp75iuDPQsSV92PKuKJgDlh6ArTC4YzwISDxK5DuE92GxWl/wxMixZjCa4ng9h0TQQILUweRVmnszcrQwnloHBvYCcvu+ygtyMYXgD8srXy3nTm0pRpxbRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZqMlZqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MUCX022380
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mP156TZe01h9/msLZKaMsMU3teKXdisSYTct+iW2lOg=; b=LZqMlZqgyZDjhJTD
	5xG5l6Eubl9O4gA0EBsxv37EcBa6ly+orSWj/pIRgF6N6WLc786JImiQ1a9vA66I
	2MRQT4GDMsKyI9yA+pJMVYE7O90Uo4GoTbbnNDOSOKxxdTsqy608SAiHOB4fgVa8
	mO7J799Fb+uIBu5h9hJ9EMIq7t4QRYcDeKsmTjsXmC88X04IG3Pjujw1FLoIbsUa
	32m9VQDfk1xgm1XNW4qNP1odHhQjIZqCwBZgPmv51u0KYMu+uvp6iwsm4XYN/1EK
	hS3UYoiBqUK1X40P35wUJLLoCmiL8/1goP4Y/XYWM5XrfqPxcuKGxD6Fe8TlN3lP
	1y+fzQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8njka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:39:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c0e043c87so4606536d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295157; x=1761899957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mP156TZe01h9/msLZKaMsMU3teKXdisSYTct+iW2lOg=;
        b=HONGThh3zVvZq7AwUo75+JUVuQDS7qLZOny7rUl1RULXpWhv6VPWXPhCCBunRvIQQr
         reQs4wRPPO1YBXciNUkfHXmiRwJ1JQCdQDLxg2H/0VhbGVHcj/5rFr2OFjA5SYOymQ2J
         as4/jmuf/6+76NQU8P4NiMCEmLECsUiU/FJ3zV7djkZzc+f3tvX5MRz2bo2Vz8t2Nvwa
         7dNiLGB8LGh4K19VFR+w3fAoZhgaO0Ph3OQ3yTBZCk65lRBLkwIdDksPkaFntiR2kkvy
         lfJZTbvw67/0vuZi/XJCY3ptAn1HDXdWhzezgkpJXMRIT9EAyiMUdyK2/FJJjKrmlEke
         UmrA==
X-Gm-Message-State: AOJu0Yy2dLj4/0cG6OOOJhJtp52hHdhMKcg9kfmVbRY9hbNuBxpBz9i9
	iOLCrSiI60uY5hFD6RT88lNSOHc3M33rRJoSn/fix7JtZDFpd79ZxtQTsjTFXlq4hG5IZZpFrp7
	yJYm+71T88sAz++OjWXeKjBUPtKqSYrZxWm0vNBFVLjTofT9OYfRSN3YeGwKoMc5KidYoY+lrYj
	9u
X-Gm-Gg: ASbGncviJHgpUcLqSeRz5DP0qKSq7bpi30u6e+ghWC8k7bf2A2mBuxSqrF3opdlUy74
	uVx2yYAlkSQHl74iGe3J2ovxGHWTsYG85+vqCZT2+lgaA5CsoWK1gweG4i6zHM8c8LWrjp+OIi/
	bWmzOSEt11SuVBhJuJ43QOpWN9lsZc96/m0lkA2jocSmMFq/aRRrJ/VDQQHILrb/eqw89zwwxe2
	kkG9fp4rH52unvVWWyJngbIt211Q1d4xRTP8p0Yjdy9q3b3IUsTWv23AtOQmojHym7SxTMfMQDt
	MbksjRfi3DI3gfJOp+9Uc+PqBV9xJajKDS7WoA+TJtK0nx6/LqOXc/zgD/m3LpVlHGrrIQI34uP
	0OUQHdAMHuzU5lMrrr2oHr8FKvS1A4G6/5VDSIsienPFh8Y249pRSm61w
X-Received: by 2002:a05:6214:f05:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87c206aa6f8mr219047626d6.8.1761295156972;
        Fri, 24 Oct 2025 01:39:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOrOr8mjjpJmal/kAMyGTYRQL+8CiGnozYYDyOe6Y1EwTvskD2SQQMA7irtDBZeKIs5gIx/A==
X-Received: by 2002:a05:6214:f05:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87c206aa6f8mr219047526d6.8.1761295156545;
        Fri, 24 Oct 2025 01:39:16 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb3848sm4107106a12.1.2025.10.24.01.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:39:16 -0700 (PDT)
Message-ID: <fbab492a-e279-4ab1-91ad-2b4000f7229a@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:39:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-1-6286bbda3c8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-1-6286bbda3c8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QYmUEkfTFQM0Mjq13tYCOUra33-rF3oh
X-Proofpoint-GUID: QYmUEkfTFQM0Mjq13tYCOUra33-rF3oh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX9uKw/Lks7ide
 glvUuhwbEP0F8ICxkp/DSxlKTD2nX8qLBePnDDzkDcUq3tADXa0mfYFky32NlMt0J6zwyZ1w+kE
 kgibqEA0+LU/9i3//IV6Dpgj1o/0/5alkpLGj723NDvf7VtX8vZY64vNKRTR9HJu1sRJm+HaFzw
 Qz9jq+1uTMmvhqT24CntZCxMSWXQTtPG8/aNzEOo/3beHZTudSZ+LCo7yxef1dT6BQmEZVETgju
 itv3P8k7+q/VD1Q9LgqfCB120exbDFNWJ4jy5YWpr0F7d5kqWjP7M6WL9n9Q3rV/gfRogw/HO1R
 bHA5ap1YzhFq24rkq+zbkDQT70g3KEdgN1+PhsvfqEwrLYyTwN2VW6QgvqGef5Xnnq5Xdj68Ecj
 4X/5gXwVYkvEutUsnYJBSozGC/PHKA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fb3b35 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Uv4cyzw5Fqc3vRoc6LAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

On 10/24/25 6:24 AM, Taniya Das wrote:
> Some clock branches require inverted logic for memory gating, where
> disabling the memory involves setting a bit and enabling it involves
> clearing the same bit. This behavior differs from the standard approach
> memory branch clocks ops where enabling typically sets the bit.
> 
> Introducing the mem_enable_invert to allow conditional handling of
> these sequences of the inverted control logic for memory operations
> required on those memory clock branches.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-branch.c | 10 ++++++----
>  drivers/clk/qcom/clk-branch.h |  4 ++++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..4094ffc53d0c91dfa9e4263134c3a996100ad078 100644
> --- a/drivers/clk/qcom/clk-branch.c
> +++ b/drivers/clk/qcom/clk-branch.c
> @@ -141,9 +141,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>  	struct clk_branch branch = mem_br->branch;
>  	u32 val;
>  	int ret;
> +	bool en_val = (mem_br->mem_enable_invert ? false : true);

" = !mem_br->mem_enable_invert"
>  
> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
> +	regmap_assign_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> +						mem_br->mem_enable_mask, en_val);
>  
>  	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
>  				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
> @@ -158,9 +159,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>  static void clk_branch2_mem_disable(struct clk_hw *hw)
>  {
>  	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
> +	bool en_val = (mem_br->mem_enable_invert ? true : false);

This value is a boolean already, you can inline it below

Konrad

