Return-Path: <linux-arm-msm+bounces-46599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 470EDA23E08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 13:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28397169191
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 12:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1511DFF0;
	Fri, 31 Jan 2025 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgN5Y0x9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D311C4A02
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328181; cv=none; b=G2KPOHp1ImjUBFmkiRbPBpASU2v/ZBgfOf+dde2HLdb+DOtFs3g6qBpu3IF4soyfVu/BL8YbGlz8nT4/8kpga/tqMpBWKVQJwZXdtqHjrh7tE+5T3k6/x48+n+oq14kvlg5E6JTLIclfz3I+99beydh3PUtJtnDDTubAn/t//a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328181; c=relaxed/simple;
	bh=UsFe8VlEZCmQ0sbihU2b0JFZi9Ej2TKBlU/qdva3I+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgcTmGOXUMlgWhbDd8LMQ+D0KExGjQ9jvAggR2So2CUXEPUUU9kqtKA4nvgV241y3AmWCWG6BEROoZ31oZqx0M4ovNfuwXXc1dhz/T4DQu947xjsgo9EAbX6UllD2AEixtPsa7ICMrLUg1rEqdyf9XcNnOZ3JPsP790+AjKEtkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgN5Y0x9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V9bXZw016199
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 12:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=; b=jgN5Y0x96Go1UduD
	qPTkezkZNl4TjSCDabOLqPG5SZpYJING4ZSY53LpGiqCD/dhk9v1GP59UPmwgzNg
	+bXi/QmM5eFMpVyQIzOnRDDEFF5U4dQHmTgDPFRpZ2Vp2U8HGDZGWoFCL2Urw4az
	p4lNBIpcgnxP17yQXy1fqHgJ62AuhkgMjI73j+9z157Q5D0gqPuecRaUixIg+IgL
	tT1YM/zKcW7hYfzJWOHsUqd5VEcQN21F35FpUGyXHLRK8hisiJe0mxdFHarc1WP2
	uWAICI+NeTRDsDgFmpPfDCyd07xNij4TExRPYphccjqkMmxeZSIvNfRAWXppEIJ8
	iOk2Tw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gv24gepe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 12:56:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e20cb2ce4bso5246866d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 04:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328177; x=1738932977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=;
        b=aGkossgv6jqFN4PrYESTzmkuCtePKvUkkHq56hunEZIMCmH+mBn0E/CnJwSjK3v7uI
         p1kB0ADXIWm702nWVPBJfKDJA0Bve1+U2/gq3gIZbgaMBHomFN710RVG++ViU75F0kFW
         ZJ5JVbfz0tC/YRNk7aMdPCDXAneZNH2VbcLpNfHTm9ZcS7AXlFtfze6lJWkpkMTD4OUp
         hT3Y64XdvmwQ0v1vAlZoratQJpMwDxSUBMqq1gapNVVJ/EAZ6t3XjX9Lzl3RUN0+L4pt
         M4MiF/gX9wdSoY5GaqfhS0r5HDzjL38MsoKHJkSgucgxczqDR0jn3/EiEk4gg60B3B1V
         2z5g==
X-Forwarded-Encrypted: i=1; AJvYcCVnNDoYLq6ToSwuvJ1iOf80fhMBEjHvQ4iIBaZQ4Z8ZzmZV7Mwn+sRhKd69xIdCzgh8rZ5ikCPJPfhMpkbj@vger.kernel.org
X-Gm-Message-State: AOJu0YxtE0qjL1o82XLfLUDfmbQ4a/j+2JNJ5pCGr/kAIGbdZTKn04o0
	O6JQ3DteSs2uNZcqb/OfC/klKEBb2bX3egHlhR9yGwQYZoTfzPU3c6t4RHjWqRcG9PlBlB0j9hi
	L3m8o6wVkL4guFOQn5g/VGxD4qE9U0vlCyMcmB0dzWOPurSpzLXr4UWrNusLwqb1k1mkQifYs
X-Gm-Gg: ASbGncut326C3l4YBEUXVviDEh5pCBcoYpWxiHsPEd6dakKfgnNRmioTaQuLDG6YB8Q
	MLPSD25mLP6Qgz+egKCIx4LzyB6wJmr08kQ1gSRLDVWUpLMeKDllNHQZNf9wDqtMgSJcOr7HfOU
	mSVoMtujNdDHTo93eG9J/cRiOFqGZvJbiQa86x/iWlYyszlcBwW/e3/V10LZF9lvgHahn7iREtX
	HayCU+FJe1m0LWVU5LPAL+QUfL2I1jF8lHeK6HJpTL5OslZ6/DdWWVb/3LwAQyjRcSpiU4yAsYh
	8G7Jz/ews0FqBoBqQxbBKefgwa1fFYKMdC6sGucwPLQ5w24kDgMM0ChIEgI=
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397853785a.9.1738328177123;
        Fri, 31 Jan 2025 04:56:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGm9+/5z7jb7xy21B+AJ8JUsYwxTcI6SmhkN7nHUwGclLh3z290C8ViPSJPsRA1U3ApIjkHg==
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397852185a.9.1738328176714;
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31531sm291583566b.141.2025.01.31.04.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Message-ID: <e9fb5ee4-9ded-44e7-bbfb-cb2f897015b5@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sdm660: Add missing SDCC block
 resets
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Craig Tatlor <ctatlor97@gmail.com>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Pic7NasRlmz2Dm_ZhGbKRGMsFJjFAYP
X-Proofpoint-GUID: -Pic7NasRlmz2Dm_ZhGbKRGMsFJjFAYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=830 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2501310099

On 29.01.2025 10:23 PM, Alexey Minnekhanov wrote:
> This will allow linux to properly reset eMMC/SD blocks.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

