Return-Path: <linux-arm-msm+bounces-83983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D806EC97B94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5AB2A342A85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90DF30FC2D;
	Mon,  1 Dec 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjO7OiZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuCu8a/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646422EBDC8
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597139; cv=none; b=GOrrdOt35v3IFfWqtoSdGaNzALxD7MQK+VfU1ncI+jEjbUeoUYaUktGeNTCG/9Nx14lSkrhICkDRg6aUMfvwhY8gkZ7uGBMXjc7ROauxNAXrCMq3uNxRcWR+VMAGeAou+Tag7YJCziPkphTjqfp4mj4kCPk7rOtCwZRrU4FgQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597139; c=relaxed/simple;
	bh=EdBa2yLMarweBQz0sJUl4dwDNu01XZVe4Vj8ey7u1kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djfv0H8cbiWt2vjLx1gd60iLMIvJMrZ1GjdE3Vp9RxeltOrPtWkqzZaylEvd8oYvYt0AoTgBjOVsALdkSMTf48uIwady8j/P0MLZWH1YScej8qz6u2aXb1LfgxG2uoVcMn9y+9VHEnQzVzDjd8PvzorOM7Ea9LdUvWIf1k1F2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjO7OiZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuCu8a/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18bxNv2428913
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSWsLfGRcOlbhK/JblDVcW8zBtmlwoasmX/RtgoQmXY=; b=jjO7OiZ/j5MNFp1j
	V74DHcTyhZsMbvTLGWpQP2Lfe5jDt34cr+RW0RsXCCoL0XFVnJEDx/bvx3t+Nif0
	DBGiIoHAO7NbVJaREes5NVZzuVykNBVGstf3ZR53bNWP7usSfqSUkcVlaGC+MHKs
	3qUwuXG/kpI/T7wsOiA2apE4fggu0pnuWaEl26IHKF+2c5x3zTfD9R4/Cl6cfuKW
	XMk7Esa0mhJ47qzrkeve0fLEEoWOLLVF07j8lHepgpPiXMXe0yecVb5+L11b+n8l
	omN6b/2aKj2T1kVxMfgNbFQB2BUmksX3+pk8vH2lWr/45UdAcFrPQEtICRhJVmBx
	SmTgCQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvt5h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:52:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso9881871cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764597130; x=1765201930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSWsLfGRcOlbhK/JblDVcW8zBtmlwoasmX/RtgoQmXY=;
        b=LuCu8a/KwxFatxOUIFyTmqe0MIKTlFQgZG4gpjutc7Gn67LYyAPWKXdVvo5kvnmi/X
         ZJSv8f40YTg9UWCvVeGbGI7ZZFJLtOvaog3MKJZiCYfltp+JUusa05wwBQAnfGpPgqLs
         oEZ/UK2AhPTLUteoEAo3Qkm5cL5vRQ3raDK355BnE36bY5YsibmbGUbZMrny0R5Dl+/I
         Prjg00e2xiNSp7C2Vo7CuvAXdtv5UfHOAS3y2dKZmINFpl1FbWRI8K3cUJkjFdFezJKy
         lpQmqrRUj+0UBb0W7SMhc11h1Zzez0zEx3pWP8K5FInBptUNrfxqxmTiA3eYEhDrLsQD
         +8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597130; x=1765201930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSWsLfGRcOlbhK/JblDVcW8zBtmlwoasmX/RtgoQmXY=;
        b=KrZ/ES9Q8tnaFYjvgaQYSu6Ca0wd9txpahC42LIQ9GzAYafnOGdOc0u6hFI//2Fx0Q
         Lp9jrRmF5kiZHhA4eNMFTemB1yIG4KPB8F4Dlr/A0CcDzor9JWJkirkmHw6AULlEs6Lm
         bV2fOsw+Tc6ilpB8ga9sP4oElKajDlzWK1d1KLDBze9BCO3tB3NfHFo8mvWVdkMBHKGY
         Lr1NFZ66i0ZjgIUz+1HBDSKbCbVf+F2Zpav2yDjXZw6IKWpiVLsWwnjtz2RbrB905vZ9
         1rCCK6cpqcSbXXNah0W4GG+/JM+0rt2V7kRk48DUXQ9qzjBpeJpGpcmjWh++59EULiBX
         ynbQ==
X-Gm-Message-State: AOJu0YzlG298pXplJ2T9aK5QsOUmgWsYYEu/nAN4dofRLm0j/WySytCm
	mRmzn/NE48bqMGsT3r4s6sDjoTWfeV6W/TuzFc3u8dfP3f5+FLFfeBgoZN2DM4DuObyvN8q20aN
	UiVrje/f79kcBtrYh9k3FtdRhVZ3m8au00pxyQYU3VCHXYpFT/Bdu6MM76fp4t5Sq4hcyINQpLl
	Cz
X-Gm-Gg: ASbGncvW7lC0R6DD+ITuTlLwR+8EoslkGNJKo1nFk/sFjd0pXXR0xO+9PpUfZovQy+A
	idV0JWbXhPo3K5aNbimanX+gOwxRVV4OhYPAKY/PWoC+NOWAh3ZrDtsinuYSm4v3vSmYe8u5Kda
	LAE5h+Qwgl60gc5ru3z2qeI1T7t5I3ETULz2xlwyWqkQZ/3OCaj30DfOgXM39EWue3o+ZdJW1Ia
	e8szPn02VpIU7XJqBbXTf6FObC7m96RgJoF3ki9c9lx+t68JC2Zu02K9p5YRY7wEWgli233F+i8
	iXT8OKJgeGX0inWrDTcewvAy5cdKGpIQIgbOp/RnvpJhvViyafXIe4EzQLmb09hJ0Qzlplvj3L6
	P14TNMQWZgTtDpdPetwOrR6NzOrHg53ZBv3SV5ev60XwoMjeB4V3FaB52fdI4c9HxmJc=
X-Received: by 2002:a05:622a:1a94:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ee58850870mr387824011cf.3.1764597130599;
        Mon, 01 Dec 2025 05:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOcBof54FKlNxQypJiOwkIYUdhopho3zlmK8tqCpIc9TU8cOhP418zn9aWrVu9oDrWj4BKcw==
X-Received: by 2002:a05:622a:1a94:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ee58850870mr387823431cf.3.1764597130126;
        Mon, 01 Dec 2025 05:52:10 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d5dsm12489095a12.12.2025.12.01.05.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:52:08 -0800 (PST)
Message-ID: <6e12f446-7792-44da-9e06-99729c3b066d@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:52:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
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
 <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R7phaC5TGh0PAYMzGyHiXJ_DbwafhHpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMyBTYWx0ZWRfXyCUGAjSpZ0Wh
 GGtTsUPZjY3LjJ7IffE456jMsTB3SI/xBO54Voz8aMhWHPxFSlg9InA3zcTUKyMZoqmaqdQ/5+l
 zS/iyWYjTj4hU4e5z4rmhsKa/bDuIkNoOtJJU6mUAucyzfhA38zz8K0TbflvXCvQrNdpln9Zimc
 cflHwLOPtjKuKuTyOwOE0SFG8fZ+dhtQ9c/5ARcQauQ2lx+8w3EGKUp5/m/2oEmz7zLNM2dtxrX
 JpbE4DK1bozfJIQPrRSZb8xp/f9xXQOzTBbdd+2XBW4uxRRkY/L4fxz6GEozfiIDNYEl9E0yKJb
 YhDrGMPW8UC0PMDTgkFpUe2fS/O4vYo48qXy4aP8XlFfIqskxCYRcoDwK+b4w0nP8+PkJKfml0f
 5tt5PtjyZVkuRuPZ8C/dFiyzy0sYLw==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d9d8b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OpNYcKt94wLiKn9aZLwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: R7phaC5TGh0PAYMzGyHiXJ_DbwafhHpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010113

On 11/28/25 9:40 AM, Luo Jie wrote:
> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
> 
> Add IPQ5332-specific clock definitions and of_device_id entry.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

[...]

> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),

I can't really find the source for most of these, but I see that there's both
a 200 and a 300 MHz output to NSS

Konrad

