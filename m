Return-Path: <linux-arm-msm+bounces-89609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB30D3A529
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D413130022EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED09329994B;
	Mon, 19 Jan 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="br9PmbAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eb50bHdC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B642D97B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818915; cv=none; b=o/Tph2cSfbfsB1Xwdeov3MAx54h9hclHV07t+j3o1L+smm5bkMKR4z0o0xO4N+BPxtuMJwiIP33o+bBUc+eOuS/6SkKMTorzvD4lF4XEeSX7XQZuNrH0KzmiUkEtkkGEfI66SZ4CjtYj2PPzISPZG2t9rRcfCeCj1Vj6eAbJcI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818915; c=relaxed/simple;
	bh=yFkqPxWakgJbInN0xaYmWVtAlThPqKhg4y/r53GyHc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrXM3Zn7lQIVM/JLlg0AXUxokfJGP3MPoqZmSaqWWyBob9eO1n+qhWzz6b7mtUzZNIiZ1bu/kkpTftGnwce7kXsMo8dLmso2zjjDNo/65p01MWmu7Gz9k6fEbn7mrse18V8N8OhUJ4EGCUu+F1g958pgbkzQbA5b2rAMTz9ujHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=br9PmbAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eb50bHdC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J910qF1044289
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvNSwLDhS+/QqYkM1c8An4s/qziHLEGC7UI+ryiM8Y8=; b=br9PmbADxuvUHtIc
	3y8PUjGv/ppWMky4GeCT3MAqbPgPW+C7E6byun5BWHUfUPFfm1Wma7E667D2u2Ho
	B/vocCZ/GhUcFTJkx37JcYBWxT3VYRt8yAGf/ACZDYg0uv7syZFCYtooK7pSO6Nw
	/VXq110A5/X0HBHJ9AeKVkGeI3HmWdkTaTHf5PugnHHU3HhylgvOq3/xIVNpaduK
	8rg5FJoxIItRrAdFJ6bmfZiSJRQif6NRr8I058cCE86VIDFvxL8QqBE5OYPSykAw
	0MN36fI4qiOEOjuREpWuzS1u6MkAVgi7AHlZoUrUWWB+tloDyi4wo6cQ8OvDmR24
	y5SojA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehs8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:35:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c69fd0a87bso270814385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768818913; x=1769423713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvNSwLDhS+/QqYkM1c8An4s/qziHLEGC7UI+ryiM8Y8=;
        b=eb50bHdCLh7G08yeXT02MpiaJd8/nKyVF6ZwPn3WGWHRdX0/Pg0VZFK35OHiw3ebS4
         OGT1tkGdMzrZf0Z0HP80sla9NhpQauSVbB14HthjuD55W2uZBG+okMpyAkviYBS0Lw+n
         dnemN/+dgHK1V4GLZ+JvoGn1ExRBadHTJqwViSuLDcW738Ee9mOrLRpAGFjfaNKj6+6L
         LlkqLoc8nm6vS33d2hNqdK619fgnuFkk4jo4KucLvINbxroezaGWQrC4YCMUxAAKmfwT
         EGBiGHidqnGwR55TWm173dCLzONwxmvLouCQtHWAEKRqG6D80kWyn6FAIg8E1PEMSO5g
         k5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818913; x=1769423713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvNSwLDhS+/QqYkM1c8An4s/qziHLEGC7UI+ryiM8Y8=;
        b=TEka7UjDeGcrD7Eggr5JHS2pUJXI08CBTXrg00GTsdqbCjvXXdOpPoJbxfOJKsHdK6
         g1LCY2LczQertexCAY/H+yQHxfyLQDv8hk0RgVb14M9DGlU9L+A9v31U2Y7wR/dOqowb
         5fqvsTKfl0eg/cdi7BFyFkPQLw9gy7MQMHnZUIB4O3hQ+LExlUGHnwh1Dg6l/utUOnIp
         ES2oScbs/jeO3gqiW8pd/ZTKW+pCpx7zbxRX7I+qZlMorDy2LjDQk50ga0wVcUzQymMD
         Wr/96tuEtYJOCc6bX2XCcI5pL1OjOvRRVx2WH8wdyeSX/sxOPsXXTqQ4R8UO7JC+JBog
         fGUA==
X-Forwarded-Encrypted: i=1; AJvYcCXlqQ5yrwFg5kcNAGz7G+xGfdb5SENrYsKiQb1NfwoWQ1YhLLJ0ARD59qnH6TVSjWMIwH+ScsPrRFXZykW+@vger.kernel.org
X-Gm-Message-State: AOJu0YxbycJCZQ++M5IIMKezKRmZzQzad8AJA+bWYVVA3mTgqICrZcc3
	xLT6ibxW4jqR/1CCLZMe29AM8cOM8QH1Y8FQ2xxU1rDBHiNYVtKhQXsoObxjBRJCTDfnbuy3y5w
	zQZj9oXVq/jG9WD6PwvkJEZn+wO0iPM1iiMZjueVAriPZCUvzEEmBfe3XFxI6j0MvVkKK
X-Gm-Gg: AY/fxX45jjG1+o7Pjz2kOqseYXfAsdXGkdnc0sstLnweZIYJPH6boq+v1FqagLJts6p
	WIcvkxM5s1P2yHTb5G6xVG8/e9rBX8bdj305I9z5IPcfEbMSWEd4Eiz1n7M8QiqAwuXakqENdMy
	TmCFYPdMl3k8EiM5MaKPwhLQJ3L9FHMv66dTOKGckuP+hsFgXdmq+7EiB56lLCqAt4twSoG/Zm1
	/MzS5oKUEgU62J4aRvLiYW7uHxLdMQTrFOeQ8WAxWtnprJ1EMuZu18vXm0ZH8CAxpvIOCKkLdJz
	uZ/S9XX8qhojm3p7JC5w4SwPmY/nR0Zt7z5us/yYWYgeQl2IzNVabKgUZ7pvcD4ZiyulSj91vz4
	YjSKlL9bSPa0nW9ylgk85PeyrEbgbe0PvJ5+dKpGSmmBXNCfmPru1YgSbAOHyTzTsQPA=
X-Received: by 2002:a05:620a:6c0c:b0:8c6:afd9:e422 with SMTP id af79cd13be357-8c6afd9e501mr811682485a.9.1768818912811;
        Mon, 19 Jan 2026 02:35:12 -0800 (PST)
X-Received: by 2002:a05:620a:6c0c:b0:8c6:afd9:e422 with SMTP id af79cd13be357-8c6afd9e501mr811680785a.9.1768818912395;
        Mon, 19 Jan 2026 02:35:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c52afsm9951787a12.33.2026.01.19.02.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:35:11 -0800 (PST)
Message-ID: <f0f03077-5961-4b76-8148-fbef31f56613@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:35:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add 1443 MHz OPP to iris video
 codec
To: Alejandro Quintanar <alejandro@quihel.net>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260116190225.25320-1-alejandro@quihel.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116190225.25320-1-alejandro@quihel.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfXzSL4P5bjU2q3
 3U+bLGjvVT7onEZ0pq1avoVRbRAb+xwJ6juXX6GAC1v5vP6U/hKIjuOJcKzHb9O9TzQcDZ5J1FN
 AriWNfcW1YS918kjDlyuWdhRtDuAh4OagdWXvyg4T+oOfoifeFIY7yARN6SiBsx2fWDFScW73SO
 ucm2gwj5Sc1GKx1z0xKw1uXXIrbW4xepKT/K7Cl4kQsulFtm9C7mWEXXONar06bQ7rxn1HBRtAg
 M8VAUtuakP5phz4/f4VBaGPOcBAUTGOmcywYNplFTDYs9JrC8voVVu1Y3nvtb+JkQcWKOajX4WK
 ZEloC8Pdr2j55P6ADr+n7yV/CjnzWTRSPKuPF8fg3BXX/4XEgPMrQ1UoqrnYRQ/hOJ0ow2q/QrQ
 UoWmUbrRmvptk5U4b7qxAvTLm5MUenpyS12QE/azgc0hxc3Pq3nwojB6rmykO1luUH/yS7Eh9Mg
 yQP7uQXopdvTUpBHgdA==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e08e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CIKbnwSMAAAA:8 a=QjVBaI7zQlB2Y9sfAtgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=WAq3Gk0LTMTrdeoBeQ09:22
X-Proofpoint-ORIG-GUID: -7UsdYXDY3MMSkIqA9Z97Ohj0Tgrjt3V
X-Proofpoint-GUID: -7UsdYXDY3MMSkIqA9Z97Ohj0Tgrjt3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190086

On 1/16/26 8:02 PM, Alejandro Quintanar wrote:
> Add the missing 1443 MHz operating point to the iris video codec OPP
> table. The qcom-iris driver requests this frequency but fails with:
> 
>   qcom-iris aa00000.video-codec: dev_pm_opp_set_rate: failed to find OPP for freq 1443000000 (-34)
>   qcom-iris aa00000.video-codec: power on failed
>   qcom-iris aa00000.video-codec: core init failed
> 
> The iris driver uses the sm8550 compatible fallback and expects higher
> frequencies for turbo modes. Without this OPP, hardware video encoding
> and decoding fails on x1e80100-based devices.
> 
> Signed-off-by: Alejandro Quintanar <alejandro@quihel.net>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eac..e737ec907 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5397,6 +5397,12 @@ opp-481000000 {
>  					required-opps = <&rpmhpd_opp_turbo>,
>  							<&rpmhpd_opp_turbo>;
>  				};

The above opp-481000000 is the 1443 MHz setting.. the clock is div3

Is the kernel you're running patched against upstream, wrt iris?

Konrad

> +
> +				opp-1443000000 {
> +					opp-hz = /bits/ 64 <1443000000>;
> +					required-opps = <&rpmhpd_opp_turbo_l1>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
>  			};
>  		};
>  

