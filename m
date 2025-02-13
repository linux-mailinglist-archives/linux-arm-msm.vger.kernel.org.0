Return-Path: <linux-arm-msm+bounces-47947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED1DA34F9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 21:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F8553A89C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 20:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25ABD266B4D;
	Thu, 13 Feb 2025 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkewnj6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A32661A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 20:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479412; cv=none; b=DRirlNWEeXFlAHFsDeUmqHaFruBw/VZaelwPuSgdTKCgIGbxRSBIZZF0NXKEtPfEkakJSj2BTfKvFlNoAmUxlHyybEZsAltI2+QrQStcTowSA/3PPismcYKyThczxtuVO0Izf2kaexoKHBynR0JIJlYM/lsLWgmXs9iCyfrzbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479412; c=relaxed/simple;
	bh=KPqeKb7qxXVQvHeLPKJNyFw3t5Osul2JY6aETGmPnqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGT0sYL5muPrtGbpmNlskUwv4x64nGLt2HJIxoblrmk7RQa0bDmUQgsqJO1IyTLCfYPdVD+NGyJdvA5C+7LQKQH1seIiAxEUZx/+ZrLKrNjRWao2VI8W/+ovrhopvSxAdvvhTAufqqFbzjnFwjCPtIP05rCFrsarbbN7PeUQAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkewnj6f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA73Cs000335
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 20:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg5FrKktS73xbC19hkpapwjR69r1aE/kmuxGyVnzOJE=; b=kkewnj6fUupujmzy
	wCMYx3IsHo88XP856vU5xBgsOrjdT4OhEuCzddQRDaHYPkI/KFU9GV8ediY+Zc4p
	zBKWyN5mcR0EA0IFJrrE4xxbyzYNra835luYUbyYU/9MIHFcbMNIz9Za8/d+osTE
	rk1S3Zlx540kJEEPe6OwMzfCEOBLo0y9846RcCbM/m1q+kzf9MqEUpNskZVcKD22
	sXQnn2j1fhYHnChyFkNcfHNH8bnGoEAVakaqUD+aQWFCnYs4HtdWvQAveS1fEC/9
	94783k1BzsbB5ff71pHMGDmerfauQBHDCCmb5qPmb1nQa1xXfZbHILrvdCgNon57
	kYCbEA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq01j6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 20:43:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e4546f8c47so4090046d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 12:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739479408; x=1740084208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dg5FrKktS73xbC19hkpapwjR69r1aE/kmuxGyVnzOJE=;
        b=UBtQOER03nTlTfewr88Qeb0xFaROBfHv0z2eszvCg+3w6ebwylxq8mvqCnslw2A188
         OfIL30rwZw1suR2kvRRIL6kBEcpjiHfLCnEAjod/grHVyYzwY2S6L64MssJPmB70fbuD
         ZOOlLR68f8I+U3gMaexLcCOzpg23w5SbrZcWW2o99p9rJDcO4cLZJETTcnwN9uIHtUl/
         ac83AvJrVIjMuOpTAU4UXRPWje7NEPuvz91ZoTUtLLtghnBAYPjxcUh0FEHvXgXqGT0F
         WODQMKoc0UuYhJ26mylQ2qXVecWqUNfvgfIXhpj0U28BaBK7zdK0QQ1derKhh24NdR2Q
         a3HA==
X-Gm-Message-State: AOJu0YzztB0yBM+lN2mzSUXU+r70A3o86hRIyo08fR+urEHN0eZKGT+7
	6RKIUC3CC9HSDPi1Oamb8RzUT0gzD15I6sUMHC1loOAD+NWf5JEApYFM5PPRYBTty3dlsctEQfp
	0HhN878ErC4BLJLGKca5lDFxpBINeAs0i+zXN7KwD5zOwGrVAIOiUNB0bBUHw0nx1ES3eB+mr
X-Gm-Gg: ASbGncsd7hcP7FRFUZr9vZ/a1w5PAGh7CV8Ips8CPh9O4Yxq0AKdyZidniQu6VqXRt+
	QQFijqrRfUvZHA5SPoTkFFeRxR+xRaIbyKpXXRAtVRzkDWWyhbl3psudhKblWitGmY/UuKuqktn
	t9p+ZpvUIscDQnOwXVPi60NytqyBDO3zJdiL1cTg9VGcIouE8DgdYz7GMnm7cYHgMa19H7rU1Kz
	HgKmsFNhdiv+RDWaYn/BUGhY8LaAxm4FwiZ3uqr0LmdRYjrN2bGFPQ7669D6WasQU3aCotTWr1a
	evwEa6NhJqP6Le+O7jRI1CJVdVhfhhu1JQ0UKqiyieVJH2438Su//cB75rM=
X-Received: by 2002:ad4:5487:0:b0:6e6:62fb:3504 with SMTP id 6a1803df08f44-6e662fb3617mr9188766d6.8.1739479408485;
        Thu, 13 Feb 2025 12:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxHGRR8DxtnIu1R+97/QgPuFG9tFngCfkEID7ATh5FWvv/MdLvRjxbxVs/jM4V/egIV1OXlQ==
X-Received: by 2002:ad4:5487:0:b0:6e6:62fb:3504 with SMTP id 6a1803df08f44-6e662fb3617mr9188516d6.8.1739479408060;
        Thu, 13 Feb 2025 12:43:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5325973fsm198943066b.69.2025.02.13.12.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 12:43:27 -0800 (PST)
Message-ID: <a5bcc6bc-e1d5-4293-b671-79116f911b6c@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 21:43:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add display
 backlight
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
 <20250213-pm8937-pwm-v2-3-49ea59801a33@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-pm8937-pwm-v2-3-49ea59801a33@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wVuAFxPXf0My1cyEfQqk2jyAo74AK1Pw
X-Proofpoint-ORIG-GUID: wVuAFxPXf0My1cyEfQqk2jyAo74AK1Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=780 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130145

On 13.02.2025 8:54 PM, Barnabás Czémán wrote:
> Redmi 5A display uses pwm backlight, add support for it.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

