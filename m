Return-Path: <linux-arm-msm+bounces-85914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283DCD061D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F09E8302629C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFAD339875;
	Fri, 19 Dec 2025 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flCd99Wd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9LJuiYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC8322B63
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155636; cv=none; b=cjzSbtlgM6jOe51D9IxfZyBjufODL7mr30zRQy1IUgRApp2AIrEMXZVx5U6XEPVD5Js0tA+JeZ88FxvHPPswlnm9G1qYk7zsQFm2tf+cVRONog98yA+XUdFAahAbPuiFVsr4SRYcmSp+dmpBlEnk2QQpFJWlhDZqb+UOgwGp4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155636; c=relaxed/simple;
	bh=5XjcOwMBg2ujPqV40PeKRngJIvkzbjW5EfjSJIsg1AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmNY8Tuzo50je09DCcSV+73SxsZXO0BaOBFFZhN7x7yOjCkX8nPi3LbbTYUsyXkWFn4gIxx3rSiy9Pz36hM6uEDpqd0cZxhNEpFrrpWbBelY614BYvLQcfslbucSrZ7leuVqZLKXFmS1LvJhAcUo82Wak5mthFciaH4+qUUfJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flCd99Wd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9LJuiYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB1ETa4154540
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=; b=flCd99WdIB49zGTc
	An1q1Hdk9XGhbN7baTxHWBodnU9IW1OuTO4Ri0dNVIe8iKl7+QAxfGOpvzuCuLEy
	xutFuVjEyrqw13VgdUvVFv/TcsBADcZ40zRSGu56JCSh58KPtaX2B8Zqa5wSJ3dT
	4QNz3wM7Ej+VVrSQg244rwJ0Vw048cNys4KRXIQjG6w5u1PeVzz6WSn8qLflojB1
	JlEIWc3hcVgEKy2lZwJ6hWJouHkUytIFY5KwMWr+GVd1+YiAaXWBg3lHj/+Ak8Zq
	+mBm1TjcUcEm0SnXRB7dSKGsjp+mO3B4MpXuM+moWgwrG0kO++3MO2VScncdD5Jh
	1Fgk+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cu0yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so68203585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155631; x=1766760431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=;
        b=d9LJuiYgR3xSBOAgK/d4NJtsCYJRsup3y8S5kO03rlLASrmoJTkNojhRBskBb941CA
         7WvpWkGgwf9FpQH5Ci6LVuWymSQ6Bz6HFaDJhzcCWx3uYHhVqDoGIvh9qQxWnmFkz+Vk
         fblHyzvRJOQ0DXC3otv/BaHBL/lCq1jEz9akND+MFGPmFLbIdCZHMJVPB583+2HRM3J/
         IDJXidhkFpij25Q3w1p1ayvU91oY8LaUsRyqt1nF2zotN6x2MNCuc44rgxDFVjqRYjbE
         kO1szhTd/dYR2JfiIrBpU6VJ0Vv3RrLFO9Eo5GXvl9F/c0IPZeJJ7Ltgsn3zASzqpD8/
         5b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155631; x=1766760431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=;
        b=ZNzy3jgwLzJSeeQCWGsDe+KSBcDewHbUSn41dT517PN1Xr17C7ff9UUIXq4jbodW3u
         3lzmUrBxnrgH/8kLeq7diBzkCgB1rExv+yfVcBqyWwxyf6xQf5mQfySzKPredf4uNtLb
         EM4a03ZuluoaATO/TYioBlhov2VHT6YJiKN5Wydi2UGE2hdtPpVLplEQ222+dm96vwSD
         rR5yCN8pI31rQxCcDp3pYm4xdnT7XNl+OTckSxaCk72/BVs5gJ7dIHu+vvmZ7cLlpKmi
         iIpTBoSbPL7I2o0AwDD3Jj+gqM92hm9uTDmi9mCG2B4tTAiR7plshb2i62MxTt3UOWfO
         WY9g==
X-Forwarded-Encrypted: i=1; AJvYcCVSlNsa/jBAlIbl/xHubkqzBDj0dgpkWOyugCC6VVQp4wbO2KSO7Hx4GHcY4gU+OTYxMq015t9unPCNozj/@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiqYJ9L00z/mgok30PZ8Obytu8Y0/ntNp8wlItWQqzbWGDZqR
	06cOqjtRdHPp/1WO1T3QLvcV4fg3GWf3VIGwwfkWfkCX7eM+Os7TF9o9iWPBQyFUu/0gYcfx6UD
	+9h+/5HFenLCqJafM1XLQOqGJwiKQr1E2MOz2SEnVBR14SkDYOs8YA1EZhcJIPA8JDjOB
X-Gm-Gg: AY/fxX6oyc7aG1AqnT3S4bsq9F4us3vY3ySw1J73ximN9s3xzXuuIrtc+QmfuTvpXWW
	OAYBNCIThT/yPdkKma0HN9WdA4X+twkBzGUyCxFVtliw2pVx3XT2kiOHldD3UxpslccPv77aOmm
	q4vU7NP2kX7g0e9XrUkDbJi3nCjwgQylZaHdRXaG33yODaYaCJ33MDx7x2aFEFO31OxZtUQ5ki4
	07bPKO4GmF/UcAuS40qdAhuXcEcWoCbQ1ntdx6GWrHqr/JBDFXefNQn39gdJZFR1y8gZIVWtZGB
	D7R+DlzHWK0yB8PUtRqhuI66qOos1frzAVfca/zSqR3g+jua6GiJy5rLqMMWy5uWqpOEnzITm/t
	TX5FgGSMXm/c7GsjlHAp+difWkRcfdxnN9hDmQgfDb5RVCq5vhTJoOGwClcWVMKlGhA==
X-Received: by 2002:a05:620a:2911:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c08fbbc3damr339358085a.11.1766155631619;
        Fri, 19 Dec 2025 06:47:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEve108+vsMnz6uQvHSLsQBNpRTIRrSI8CXrS6ViEziIGCv/1+cO2DfuCTVgDsGgQRx9jhOg==
X-Received: by 2002:a05:620a:2911:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c08fbbc3damr339351385a.11.1766155630854;
        Fri, 19 Dec 2025 06:47:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105b31esm2309173a12.13.2025.12.19.06.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 06:47:10 -0800 (PST)
Message-ID: <528cf0f7-6025-45de-a061-2d4f6fcc5bce@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iio: adc: qcom-spmi-rradc: Simplify with
 dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
 <20251219-iio-dev-err-probe-v1-3-bd0fbc83c8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-3-bd0fbc83c8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sH8VwKCP3Wj7bEF-RMUZ9PcAcs05xmJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfXwXSM9rj6/eta
 wdPu7ZxMtr1f0iGd8S9k9w+imY4lTsjzqNfD0wyi9OEMKAbTRvgOmzWZlVGjn4JoL8+QnMJVeDk
 AWDv7uGN9SbDFSk51CcdSq8IfPm26QlM5RNu2SLlBwdVGIsPcb3Zrg9PmjhHwa2HNJvVTL0XqKz
 1NN2uokyyhFdrNq5RCqrdt7K7zTF4gUsE1q4eevG0duq8WwlKswWhiyKBwPqWSu8aOczopRRYAD
 qMH3VbriiHyxB7KowrB4OTzeLr4CJx3Ipc7c+zK6p5VbA8jj/U+jWS+3Msb4bTtHrxGEdRT5mhU
 AdQfyTIlGSQoZjeXV3EQYlcQqi8NrrVNLB1IFm+p1TRPlYxClWSf7LZ8h4L7KaBdFBYe0U6Q7FZ
 JgipVw4/OhYgNYanT57LAxuwQ+wzfVqAq3IUvxvl0Mz+5cAbAjpavRJZQbp6RfHNFvJ1SiOsou/
 ZcxNoZee+RpuXH+F+uA==
X-Proofpoint-ORIG-GUID: sH8VwKCP3Wj7bEF-RMUZ9PcAcs05xmJK
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69456570 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y9TzTQZwL3x8CsvTrzoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190124

On 12/19/25 3:31 PM, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

