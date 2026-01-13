Return-Path: <linux-arm-msm+bounces-88706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E121D1772F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D070300A92C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891D63815DC;
	Tue, 13 Jan 2026 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWVpAVnm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G59eD3mv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6D3815DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294931; cv=none; b=OiUS0mBWh4gSFN0YvKaVSqMBMkCa5xIm9sG4wbeFWl230sA+tS4vDem3ZP+xcmwsaHQIXoT5fbrKxlVnbE6bP5Y/tTvTfAiZWMhKFiMOo73u740Ht04HoxQXi4txcskObd67OBoL3evCeLX9P8+gC91L5qY18kx34YpajEayfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294931; c=relaxed/simple;
	bh=E/rHAaELYlivdofu5n6KJxhOc3XRDcBNMHgQOTIvEb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQqt6NlwQSbcrBrYtrkKpPKHuCUk6wxYNvGjRzbfH23mnYMqjQU4a2PihBfvWn3UjqubrfCZJebfNmLTIf5YMD84r371rGf/2Or4DpbmXnOom6Sd8svIO34uJVk7Bdcc6w/Fwi6tfnNaswi1OT/qVUt8jrry9YgaZbIpezHKhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWVpAVnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G59eD3mv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7ZFKb3301643
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPT96PTGUv2d3VCwf4G28uAn4AI03K7pwV8OBWcEcrc=; b=nWVpAVnmbiBS5McH
	6KWxNlk8DbudJmoh7D3MH6Ixd0uJBZAUaawZIkcaqNVwAy2aTDM/QZdAgUBG2fHJ
	YYB7OedkXlsNPpjgv6g0WG2fBbnlyLDTkkxRpcw7IC1LGV3cyRdkZVM9Vj2vzqXo
	5hXqOo/2zexGOF2DXPuIg66qjKOw47UZadbVgfMrsRnz5ZE8LEOC5WgE5bukb9Ki
	BiEOlL6i7FlR0tSK/vK6CnhS1W3w86tPrfTLIyp57nstXf1tven3CJuX6znKSvjw
	MBvBWdpU02Kvbk697MA7DyTTNIHTQXSncu3Q8Ma/oSijFwYVV13BYvHDlKSBaU88
	TmI2Jw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma3jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:02:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8888ae5976aso26556506d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294923; x=1768899723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPT96PTGUv2d3VCwf4G28uAn4AI03K7pwV8OBWcEcrc=;
        b=G59eD3mvPyOkG2avGdcn/RTrI3VrcWWOpiwkj0kxorxUbC7Dmzyy417eUuxlxjYATX
         +3xPFBjgx7O/uCWk50kdCY4I1fsY7NyyucXdmUViHajydIOOZEioJhHBPrUdH4gvfpKj
         2+sPqnFh5F0tpP9CFn2YWT+ti3yHG6/H7np9vRUxaWtRnKg3dGZnTxYUPeSvb2VuFRrD
         mwY8ECdMuuAkCcYFZ1ewrbFIaucafxgGigdfIAMCHCo6w9T7GpD71kZ+uGnTB9vUhtxr
         tPfHAFIYUmBbwRZjgGYT/o2p9pc/KEIUDxdSXVdZMnXt9VKmYtbYfk9JyFSmi+dOos7y
         SH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294923; x=1768899723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPT96PTGUv2d3VCwf4G28uAn4AI03K7pwV8OBWcEcrc=;
        b=FqyBwAFyu0xA9WVpRURGpKLynmDqw8YzdoQQpVuONldKi/XYPYv4+GkMQE2YnzIf7D
         LmGxIi9mUiuTJPSHxMCjC/Y5LoZolvo/oaXWis/A1yj783FmcZJnIhyHzPEN4RSkmM93
         7GGlyDVPyb+0lQZQE2qrlXU6jKZ01fept6yM4IND2USHGzZ0ByQBpCVZscawtxpP9Jzk
         0RKHqLsCM5Za08O/Y0DrXUM/f9nJr/HP7DQxERiEYts0bS+qbDLZ5zwCWKjolFbfW5AX
         hgVw51kztcGoZKV/OvSmELJQSIsOLWnPEsylY6IGR+odUS/C5KgrE9ma2lQkp8VOm7P8
         vKvw==
X-Gm-Message-State: AOJu0Yxth+oJwjtnkIZlNUjqZyPO7mpNIsrbjMwAfiiHn3+9xLUsVc51
	kaiGBPVgefmLG1KxGCzyk720XQ0wK/FJII/M6U6PlK5TH8KK8gELcVW44R9LYhwJFHCfgdaC/Vu
	K2XnDKxnUSv+Y0xbc6ALSYNSpD1E1/wVPXDSI005TnKzlzbWcIeY4v8TlYLizbY5QgHTf
X-Gm-Gg: AY/fxX6OWp/MQWmxi22KUsqeIBGv6TNAPrsNQ+DtyQUGjdCEuwv4m+Yd6tR6k+Z/+J/
	dFYHivADKqZNqGi7M+92ncZl2A47seKylPs9PX+6tttIu5nsIGm12uJWU2Ry6tgD4fnB/vQ20an
	G3WclFVI2dtYY1nJCRFYTo9KH354O5julQ3pED8uVjbYmBt3NNZ7fBonaoXb8bRfoevEORa6WnS
	vRF7cMZylH0i6pHxhVSKDzWWANfIXS3XsD84YWKkTKI71/pF7GUpZcQqCOAJgREBqf/BYivvWlh
	iLQ2U/GO9DqN4ySXGlcucibil6sSUMsGxJK/akzDcttLM+UY12om3IDbk+J2VreA4tZWk9rwc4U
	5Oc+yrni2wIb6ANyWO0UtjvFn3e/zR8ncnSC2K+YmvSPa6UImh/fFWBrkwgle6sLS6FU=
X-Received: by 2002:a05:620a:4086:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8c3891d3180mr2156778585a.0.1768294923390;
        Tue, 13 Jan 2026 01:02:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFULj+4gsDIhecmRQEo0sCnejhnBMw9iTjvTptjSk6XDSfCyRFrWMa5xhAnDNPYWfQ/IFWnyQ==
X-Received: by 2002:a05:620a:4086:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8c3891d3180mr2156773685a.0.1768294922810;
        Tue, 13 Jan 2026 01:02:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870776b642sm748875566b.21.2026.01.13.01.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:02:02 -0800 (PST)
Message-ID: <11ee77c1-2ea6-4c7c-b955-22f10d879ad7@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:01:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved
 gpio ranges
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-4-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-4-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sSUwAGd7u6x9eLslnIBhi_7IZpzH24Fa
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69660a0c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=tUk71-pQmeoK5jN-DnkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: sSUwAGd7u6x9eLslnIBhi_7IZpzH24Fa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfXyJY/7jtX7VZ+
 EDPvqcpQv20/sVU2SDByEGZqCdtQJSpG+DCkL3bHzGOn/K5+u23bo92zglpGVrgbUPU4wi6Cagt
 3Ij41FaaBwJtUgcYqTKY+br2nxJlJdDPcFNklAvWsEqyftQKfwWYIG13VgDXGGut+mAXQJdxHd2
 zw1JhcZAzV919PKkNK/aNmz70QO+ypXB4jDWYtOan3nUriaEe74WoXUOV4ZAXMX9fw5t2NfW9Bu
 5elizE+2AjQk3if/jV0upWwNgNzNoosp3vHnlsDRsqEW1EbAJQg+XYk8mTjfxp6RPlvxHsze8VV
 9HDaowS7zDQfqPiUwjInA5eM8rJhyIfENjgZo82ZpMn1Fg9oKCTeLpJSQTHlTvj+TCIuqc3lEAU
 PWpmI3X+hSGcNx9scPpyxG+6ZA26o2Ax+BDGsz2F7Q49n6iqndNVTTzJMI+dQFCdL+Mfw0hbt7k
 Ke5fmkqb96JhJk6bw/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> The device was crashing on boot because the reserved gpio ranges
> was wrongly defined. Correct the ranges for avoid pinctrl crashing.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

That's odd.. were you able to confirm that these values are alright for
both the Note 8 and the 8T? 

>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> index 666daf4a9fdd..163ecdc7fd6c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> @@ -296,7 +296,7 @@ &sdhc_2 {
>  };
>  
>  &tlmm {
> -	gpio-reserved-ranges = <22 2>, <28 6>;
> +	gpio-reserved-ranges = <0 4>, <30 4>;

Any chance you know/could deduce what they're connected to and describe
it, like in x1-crd.dtsi?

Konrad

