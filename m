Return-Path: <linux-arm-msm+bounces-84739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E528CAF1B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 113EA300C34E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB43B2741BC;
	Tue,  9 Dec 2025 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfRH63WK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMpqHIr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C66061FFE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765264635; cv=none; b=SzZfCq2/9j1DpDj3G/V/nOwoRajEEKHpUGgtUj6fexYgAPCr9C/18Rl8+8pPAUcPh1/HaS+VvA2xQ9RwElt/LtNmyNfRAlk9mcZf8MHiimEWUFhzcx9Px1itrOnwN7KBi2y2VmX52qgpK3iHb1D2PcDi7R4fG3nqXqMHWMqYcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765264635; c=relaxed/simple;
	bh=bjELtHmfSNIy0x2joXj96xI8PvyOjzt4ptEl3YVQKWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=peXf9dar09BnzIDlZuHClpWVZAu6C0quWxVddvPbvbJjAF//VUUaFeGf+ZlCbP7q50kOvUHNZrrwL2u+tNV94X6hmdbUwIJbsl0Ycx74KS8F4OPdojIbQcoDJ8KkOtg/NPNOkw+zcEuP44jqyO1A8lX4utduyt7wquX6ZWUqSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfRH63WK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMpqHIr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXIEl2716206
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 07:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEapj8J7AREFYugvt1uhhlqSNWIfIJsqy5a3HC+AHpI=; b=FfRH63WKsneui5M5
	9FiBeiq5nKvxvvvm4shhEbIj/3tXlwmth3HIBcdui8p7witMW0CzWHZilF8CaW5D
	ud97GhDtbUOuqGUtEQYs9hGA2yPZA+GopD3YqOQv5Pm2NcXSUEWFodVBx6GSprhG
	P5X16I4/vhu6Nrxzs0GPVBVNz8aCbX3K5NP8cIERRCdVm5z+Ah6QEwkZXvEZLzzI
	1amqq8bP9hoSlcjWNXknQoNzsuxqNvCqSu5xZi3N2Y/jZD3vD22U53DJBrsXyDhd
	1b+pQEAPY6ikN+oqcxRg2Vynzp7kVLeq53Yy/kc/f2s3aNpSLGx3eVmSUEyrQu77
	Bvn5nw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfrb5u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:17:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b609c0f6522so9226224a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765264632; x=1765869432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEapj8J7AREFYugvt1uhhlqSNWIfIJsqy5a3HC+AHpI=;
        b=RMpqHIr7EXwl3h6JZhuvW3R0W4rgTksXqJYQ7yVMTpX2KmimxYRAElQYQcLUEr5mdd
         aDpr1L84Qo+NUneTOBJJNepFgpnarbLcoluFcgTWzarVj2yAobiJ//1fbFsJVeI2zUrI
         r9rEO/VbVYb0uWE4F/WMpdPwAqbnQLCrgpwLWN7QDukJvWAqr0rz0ROdbqbhVVmBXtwb
         gPNmJCMeeGWGIIOtp6BjnUVFZexphGHa3GxzPFWwiJhKPTvve/m94d8xa/brh3E8AteR
         3tkHpD7Of2tKgMs2/GlP5Z9Mv8fB7nPS2mJuR4JgmIU6imVGGZbS0D74UnOycE5ajbY0
         JQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765264632; x=1765869432;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEapj8J7AREFYugvt1uhhlqSNWIfIJsqy5a3HC+AHpI=;
        b=h4DyS6zH0OKW3NTaOfgvzx1lzLpuLHt7ZrzYqwHVnzuSOShjkBjAnfGYWNy9d5V2l9
         eDwElfy10wZNR+6+sfXBaKkB7PY133xdab7Ng833ifmSUhv4CbYpIyDI85vyGkyH+6d9
         dQfDeNyQS7/h4MjQHZM7B4/oBwLrkgZRDkrc4E+tOzgE0uvusQE3SZuYvM+Hj828wcrO
         7Z9eWRppj9a25JgZ5dq8u1m/Il4mCw3brf1ULueRZMktZNI74wzl2o9O+Q9zFCk/5WY0
         Jznz+1jR81PTTa91j+wNYw9oc1yzaaxgTiYhbucWJCUq22KyHMiPxsQfsIugqXahVYmU
         FCHw==
X-Gm-Message-State: AOJu0YxeuQopb1yuMfco8eryz/yeEJL4paCXahBxDVzDCDmUsL78ubxh
	+hPp3TPbMcKxmA3PA+/CqTOFIRCB2qYfgRGSxZA+v2DLJi564zUUXUzXao8b+KS8l6tjiGZvjsc
	bsGoOeGdL+V8NPuBl8hhm4IVDjmWknU9+Ojt3xnFqkchctQp9+RgMXIop1M4cDMjJHc7x
X-Gm-Gg: ASbGnctMGY4v0xPzuAIsdTRkNGPraJ9iW5+tzWj8EwYCS4aZv9F8kwzb3QYS6xKXWOl
	lnNyJpAdFT5ERX5pka9GrQykeN/z4hxX+s8C4Z379VkWi8V/NIGVb3Mf/uzenAIlCIB9AGkpAGf
	ArmkGSn7O3w+AzwbEbzINZ69gpKKzqdVHT9L8mqkCXMiLmteXE9r1n/9uvT/1P1qjgukY7IF3x+
	yzPlgZrTSCchTsFD8kHPoji0rR8wrAnbYVa1R1x8J2F5s2gkJb/KKka1jD/LpB0/mSQrq1D00bR
	4xFTrd/gS4eMtwjJYgTdxe0T9hlHLYV/8SYkT/fmyA2ellEfPBbc6u+fyAIWqmkOWqnosdOOPNB
	DFLpLU0REdjan7+o+3UZHE6C3A/54bVYwYDsFc1BtzOXnqCc/A4oDt576aSW2uBZWlkYotk9zm/
	R+V3FDig==
X-Received: by 2002:a05:6a00:1a93:b0:7a9:b9e0:551c with SMTP id d2e1a72fcca58-7e8c109cb96mr8494547b3a.21.1765264632021;
        Mon, 08 Dec 2025 23:17:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWEk/NwKQ9vMWvZDOhJosVCjMmbbmvNLWHBFdtyeUbdYnTqALMerU8mN699V2h5NxkJGyWDw==
X-Received: by 2002:a05:6a00:1a93:b0:7a9:b9e0:551c with SMTP id d2e1a72fcca58-7e8c109cb96mr8494523b3a.21.1765264631492;
        Mon, 08 Dec 2025 23:17:11 -0800 (PST)
Received: from [10.133.33.218] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2aef9f649sm15193378b3a.55.2025.12.08.23.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 23:17:11 -0800 (PST)
Message-ID: <9a8a4774-1a04-405d-8022-73ef3e28bb71@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 15:17:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add TRNG node for x1e80100 SoC
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1MyBTYWx0ZWRfX5+rAfuLIFvZ7
 /H4Uc/9+NQQJwMDVFdhw7FDeQO/kYjglsBeJ0F9Z8vGvduucdnuciS0rvGAgNEr7yLxc3xlmTH4
 7QnYRJmzZAeH15ph7FJ5LzrhKlxkQCqRSmVMkKEvXK7ofr8or4m9lC/B+7/hG/bdl2V85e7guvl
 uuCiJNm2w9/4CSZseyHb2+bIx5s2Kx/4YKDNhSV/6m9JJrP7kDQIIxAoFzZSFhBLz36y3O22jWu
 J/5aKc1/RplBMoT/n108VQr/JnBaOK4i9ca6VAmD6fOQGoVOnGB4/p3wX3aY79/38QiF4em0Hgf
 U6B9D/c+7034xEzB5MzBCdwr6QEoz8gHtZntKXmkjs7BL73eIt5gupk2lsUhfjCizKubktuuFbc
 A2LT92Agm9wC5ioBcLV0SBoCFyloXg==
X-Proofpoint-ORIG-GUID: YmZYtKKs-Y0SJDHD9j6e68FiIMb9AKkV
X-Proofpoint-GUID: YmZYtKKs-Y0SJDHD9j6e68FiIMb9AKkV
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6937ccf8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TjbBIv4-FJWQbs9x9KIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090053


On 11/25/2025 1:08 AM, Harshal Dev wrote:
> Add device-tree nodes to enable TRNG for x1e80100 SoC
>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
> Harshal Dev (2):
>        dt-bindings: crypto: qcom,prng: document x1e80100
>        arm64: dts: qcom: x1e80100: add TRNG node
>
>   Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi                  | 5 +++++
>   2 files changed, 6 insertions(+)
> ---
> base-commit: d13f3ac64efb868d09cb2726b1e84929afe90235
> change-id: 20251124-trng_dt_binding_x1e80100-94ec1f83142b
>
> Best regards,

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> # on x1e80100

root@ubuntu:/usr/Testools# cat /sys/class/misc/hw_random/rng_available
smccc_trng qcom_hwrng
root@ubuntu:/usr/Testools# cat /sys/class/misc/hw_random/rng_current
smccc_trng
root@ubuntu:/usr/Testools# echo qcom_hwrng > /sys/class/misc/hw_random/rng_current
root@ubuntu:/usr/Testools# cat /sys/class/misc/hw_random/rng_current
qcom_hwrng
root@ubuntu:/usr/Testools# cat /dev/random | rngtest -c 1000
rngtest 6.15
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

rngtest: starting FIPS tests...
rngtest: bits received from input: 20000032
rngtest: FIPS 140-2 successes: 1000
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=2.328; avg=12.908; max=9.313)Gibits/s
rngtest: FIPS tests speed: (min=123.854; avg=204.373; max=254.313)Mibits/s
rngtest: Program run time: 94908 microseconds

Regards,
Wenjia


