Return-Path: <linux-arm-msm+bounces-83756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC1FC91CF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E2BA343571
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E2830F7F1;
	Fri, 28 Nov 2025 11:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDy5aqLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlmZtjuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D772FFF89
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329934; cv=none; b=TXZFUe1udsA+MgIw/MRvTAiBhv8Nr+c/7Vlf8U5QS4OiEWJlH/ExrjQN8ZVmskB7K4qYgXPoVmFv++hB6809Gu5XzsY1TsBd3UYjoT2IFpZycpAqyUTrL5JBHt+tDYBqZnyOZjHxJKc1hhBUC8NLjuLlZp/F5SNWpYpTjkKa1uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329934; c=relaxed/simple;
	bh=P+1AfN5DqeR+EpIra8enoM3WHW4B26d8GcRcbWUuTZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fu6+dNP+XWHgnunZcRJaORavaQZixWKcl+SfnP0qL2yuauORZ6VywSfe5NEYvXrAlLZ8RkG088EkGaHluC01HE28GTe5LikMlSEq7+KunWgNo0hhfV9BydbT7dT1OGlYUcjJJT7OkugnattDFvYearUle1T1PLTQ9V5W8RpSO5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDy5aqLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlmZtjuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8rf083989598
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvLEIquG+R91vUFM2QSbUtYc/Izhyl0C/lp2PfxZJr0=; b=fDy5aqLWbiprRbQr
	kyO2u3TnTw23TFckDUPvlCMDh17aEuSDAmYkVVq5UzfInqXvrnQZGmjTSPXc9Leo
	Dd7xyRDEw+8WCRXB/cFVe49mfhYogn+2ol+X9DT99XV1HpkgFnVzYSLYpQEXlWrt
	diDRcGhpnfi+ddADjMm4NpRiLy1XlriOAV2Yk6pYLH/MMeNFDp2HOspd3FB6Eaoi
	ffA3samvOzYkyuehEy9UjUtaz431wdaixXAGV7C7ZflTHkksGQm2VykAsv07H2b7
	WRJqyeNiHr+xfIj9IlUD7nGtlFEJmQ6A5H2SyQCqgY3TrCaRI7Dv9g4gx6URvb7Y
	gHApYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq8mm8f50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:38:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so59804885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764329931; x=1764934731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvLEIquG+R91vUFM2QSbUtYc/Izhyl0C/lp2PfxZJr0=;
        b=XlmZtjuM1S+6Q+PNtKHE/r4b2SK9XNwc8rQGd+t85xQ17mzHGBNpJPtF5f9UsvhM1O
         CQBp/V2Ac4T/49oxm2l+skNiDwxYGN5jE2p9uXVSlfzAj7Bp+sluq+IuDevSHWcOiPMq
         BYi4jYsDEL2HO6NSsRodtoC6t42tNmugmTSY9659S3b4Oz7ItHvBUVTTkhjp7kqoOpmO
         jLMf8TNxC/crFjRyqmgcbbq2jbhs61MNrkrC7kEP6ZSG99kOefKyHwhSy2L4cwwwhETX
         u/fqi5N/dbwtZQ0LgDq1ZkmoUY1krncJIZpfrN6yanAEC3StyEEhrg4aEHUy1V11/GEK
         Ieww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764329931; x=1764934731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvLEIquG+R91vUFM2QSbUtYc/Izhyl0C/lp2PfxZJr0=;
        b=wplzSSJLgs0g1MqFnYeO/sWq5GLyjoAnAhOuCkr2JT12kOAlzzuN/D5Wcx0AyIHZuK
         +/y3ElWwS9Xzp5Fc8Ca+seOHMfAcJAHb97LxLQBsdC+CZvDQCurQ0BnD6cCzDBwa7e4W
         +LLxoeYFeQMHUEHBjdvy/XqSgG6knn3vSGnySeIN3txlf46LAih0Y7j623WqeHPdL/Fi
         80TulRruss8GZ04JKwcMVc0nMfDsTv7Dtvyqd7Cf0D5r7SW2Vzn273Dq1ow6FQYz9siU
         ZgwnT9whAtqp87j1HMNE+CbVN0dJYg8kfVa3XAavvLxAyC5fRiPNL6VjrN3Rsar1MFNY
         djvQ==
X-Gm-Message-State: AOJu0YytkoKsYikPC7ffu60biD6+I6aV8aPEdxqh1Aie/Pj8zYt+L27b
	oKvsviAg2F4E5KeiH2F9syvWqh5WpP9yOGq+AXO8uIsrFbR3CrvlQPO3MQvvbDcvcLgTSyWN9KB
	3kNREA4U+ug9VQuahSr1oX0Z82jSwRI9dAX8yVvY0meW9hi66JoW9jQCK2SVevvoYgI4M
X-Gm-Gg: ASbGncs2CYL7XM8ZPAam/o9ObTpchCjV2YO59G+u3jyh7k94762GR+Dx8O+cuuzkxOA
	19RaTbiNhgc+yOWtygOhjlHj8zNW9YChiVwzOjtLdpvwFYx0uHjRDJOONDDP53INXc81DBqpfcX
	jY95HE+aHKODiLJC1977A8gOatKzLQK9LD95VSeXdQTJXHhWCzTPmtLIoUdmKPKKTm0lwYOmcV6
	3lQfDeRl4EQoiSvRPRbBxxRjya884Q7DbItFhou0wxBneJhO80NtcxCItDsmsB5msWNSmC4PkwQ
	z3xDlK5D405UQLjpNfCzgtxXSyfrZ1ne3KFiAOBITnacxDRHdhaxasB2YJ7UYD5yzMahIQnrUuD
	p6kDkulmOZ/mGOwVAF1SSJX49LySk/y42YFvK4gaRsQBhMyOAAlE6rOrOcy5KuDAJod4=
X-Received: by 2002:a05:620a:370f:b0:89f:63e7:b085 with SMTP id af79cd13be357-8b341d50dd1mr2641058985a.10.1764329931055;
        Fri, 28 Nov 2025 03:38:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrqdAmLRsM6lL4fCg98iG57U4IEsWhBTf0YdtW12v6s9emKaE0W/wAYg9OozB+Dhu5sP6GoQ==
X-Received: by 2002:a05:620a:370f:b0:89f:63e7:b085 with SMTP id af79cd13be357-8b341d50dd1mr2641055485a.10.1764329930530;
        Fri, 28 Nov 2025 03:38:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm441919266b.7.2025.11.28.03.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:38:49 -0800 (PST)
Message-ID: <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:38:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rExQfcJER79h3nvfTdjHPXq7MTaD5yli
X-Proofpoint-GUID: rExQfcJER79h3nvfTdjHPXq7MTaD5yli
X-Authority-Analysis: v=2.4 cv=Cvqys34D c=1 sm=1 tr=0 ts=692989cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3bdS15YPOoxvJoD-rdwA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4NCBTYWx0ZWRfX02igBfD3jt/S
 LfY4oQR+d9HqrJRbM6LN9MHJ6vItJpJitwIswqMXv7QtytG1pbDYzR6AtKEp4QoKvXywQxFPlD3
 Fa8GT//nw8+FqfmQEAlxnAyj3QOuNY1PrE7OIg/CjW0bVdbR9yCImLispLTlcyypzlbbNF7Kz42
 1y3z0c+lDhr+6bSc9wWu3TeCFrCCiuBUW3aO8szgqAg2sDw/cs3WGgtJb34+q664G4s9eEW8y2h
 D4OMFcsGW5f/2WEdEsd0fnOeX80zzcDDi49zF23KHWRhsJ/M+7ebwqX22SbxwP33R9Xi2anS6cN
 FZtxvhemrCaNJEFV9cdwjMDzHn9y64G8UHUwHL8eAna+FOfQI4HJCMaPm0eSIBk7lKZZRwIFja5
 jQPsxAY11rdNBtFZPQe+4mKt5K8wDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280084

On 11/28/25 9:40 AM, Luo Jie wrote:
> The clk_cmn_pll_recalc_rate() function must account for the reference clock
> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
> with a reference divider other than 1 calculate incorrect CMN PLL rates.
> For example, on IPQ5332 where the reference divider is 2, the computed rate
> becomes twice the actual output.
> 
> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
> rate = (parent_rate / ref_div) * 2 * factor.
> 
> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
> IPQ5424, IPQ5018) that use ref_div = 1.

I'm not sure how to interpret this. Is the value fixed on these platforms
you mentioned, and always shows up as 0?

Konrad

