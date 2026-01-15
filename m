Return-Path: <linux-arm-msm+bounces-89248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1988D27BE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1CFE308FEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAC33BFE47;
	Thu, 15 Jan 2026 18:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNUg6MHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkF8em0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FDC3BC4C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502403; cv=none; b=V0tPTgbdl+ZBmudEsEfhC1GsqOXUqs9sPsMWPFRbvD4YVBm9VNyx7c5hLh+rYjCSOeDvMFOA3jYfFD2qL7y5BelFI8lvK2m2U9MnD9PSlwsE5g6W9rsYSvgy9mWP5H5kj+iUiQWzhHfVsSm0/7/tMUrInFZZhWUY+K9xLAJ+3AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502403; c=relaxed/simple;
	bh=9LUH4vCX52+HIYvsmnzqwpRnhrg3xV0upShwD1tmkl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2Uk+drHSrVy6M1gKTY5Huq4YLTwxYF9CXGIE3Z5AV0ecyLu1DwksTqDUnjiOcK5JaMP8CqnVb/ksLVR09OzH2dvDIEUdvfMtKacNYYowF7s7SZBE3FaUHSFLclY9R5keype8wQ/wGn4609YtXNr1fuJqzjpR9xfkcUgUQA75Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNUg6MHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkF8em0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGH33113503
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/SmxuSr0tJjKxsAyiBswzTYoWPNytou4lCScWUKR0kQ=; b=MNUg6MHKc4cCYd6A
	vqqIRo7/JyKgs1XUWk8NV2LTCJZogP0JXOgbOHIoSrsVd+8d5BscKziPEzQHZBIN
	lWYv7a/09Ms460ZQeO/UsWHOgzTm9jSeAzleJ5n0Tu2I0u9l7JbY+BaQk6OT7N9X
	j3iwI1YqqdYZZycbq9XwdiDs146LVIzVYTBGQv0sVmhhvY/LHZ+WOw9OkYQaUJeU
	G0169Xax/8eUVP8dhSm3QZaTScyqf9m4a8by3CM41IiGQO5/bY2rx1xu2J2EmJAq
	sgXq0sA9ABXk90aCrmbXaHavAMERsVeC/4c78IL7vzfVX8uhi7+/A9XoSwGTYrNp
	x7uXGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm0n3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:40:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso394508185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502401; x=1769107201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/SmxuSr0tJjKxsAyiBswzTYoWPNytou4lCScWUKR0kQ=;
        b=XkF8em0LX1d/wtyktYA4T+RXZQWaq4QIFse/9wbNv37bfiT0hI9D+w29NMY43OajQ7
         GJd3sFcOM4+v28QQ4sT4myJ/fk666hDMBHHMwK1qUSdyktUd1su83IEI9qtSolHjztwY
         zIn7VIZf2J02WfexosY/CzBmltQGipnZyhLEKpOkNiX0s8ulob+GHWNyJwrYKKLp06J4
         gpfYgYhG2bWKN1G/X8h4GkxekeyCD3jlQcg525N+k4g+Co1YagnvKya8gVRGIUFQjHOG
         Lnuyz3r+PXXhXoZvftQO4oLa/eo1gWsFGDSqK6dfBfzsgH6kRFfzWriwr99G/Q0sLwmH
         0NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502401; x=1769107201;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SmxuSr0tJjKxsAyiBswzTYoWPNytou4lCScWUKR0kQ=;
        b=NyYYML1vJ0W5vMfptlQIJWNNJ/kiaf2FXZyLtUPgZP5ASMtLkaXf9JOpFPsQi4KX9V
         2q9ePl5Hz/7mDXLFWhzGMy1E5SWUMGhBwDMqet7NlPv6BF2X6TapJLGFD4gnAQGM3ABO
         nD5BY+dBqMLrs3DiojdLLZRk7n27FrWWuloxVsGBtGBdMT0zFhsTma8bSTbrX18n6wub
         +weLafT7O0l06cEEZyOBv+QJ3ooHXHOxmnW3Pgw4T2M2LLZFuqyv+E+mwMYchg9bdu/Y
         YIltikCxDoHMIKgywbpLwHwZ+rkIpfw4hzzvb2L5k+kb8Ef14wrj6Otd1NMr14PNU5P8
         TWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa6eOT/p0fmt1guTk43iIizecSfhTs4WdyKjTDjgoLiTcCjSEaKVUBVwhcQqvlP1EcakPgwEvwqpvz2DYo@vger.kernel.org
X-Gm-Message-State: AOJu0YytEyYIzSIyVLIrytvo/CR/bI1COvBW7Saw9bYobxYZrHsMiHMp
	VnBBPVyPfw2T0qncBJqaRuPfgvEwmVNql64/F1SAhrL6UBsNR/cBD49MkWjGSfTmFqrS4uE1sVY
	NbqiQwoWU4iIn0nLE4BXWbpde4X+gGRFtEQekwBySaeUsm+KO09AZkHYa7WZKGC9h3dZv
X-Gm-Gg: AY/fxX6h/Lu8Yzu6m1A7k89sFGDRlxEA2d39IJmevEoNu5PA2YiaiEfYpucaHDjP+NV
	gtFQ0wpFgnlM7WE6wMccymo03GJw87HvRx0rFVaDRdp7OhIrbEj/jJwjSp34oSvfOQb3h5hE/UH
	nr6y2GKALOxSfAg+1QI+KwGmuyM/rn6NAKUBUsuA+NXdo/rV7XGw/ciinFAUeBo21rHsEnbHE8O
	VgiEYUaD7Gjkzhu9ci7qpAGPpRz0FrCTjkLLlAoj9xS+4m3Z8/KK0FkAulzJHvwZn8uw+qJgfQn
	oyQ3ovfE4NM02/WcqPvN1KRfl1sENp0t934guiJPPHM8k4ocj/8TY9Mxy4Z0Q+ivFWbmS1gAZaY
	F2qqdQkR5pCTnT5NL4id0mXXjyPpjWTRaWojTrQ==
X-Received: by 2002:a05:620a:29c1:b0:8b2:eb83:b94 with SMTP id af79cd13be357-8c6a670524fmr60910385a.25.1768502400734;
        Thu, 15 Jan 2026 10:40:00 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:8b2:eb83:b94 with SMTP id af79cd13be357-8c6a670524fmr60906485a.25.1768502400259;
        Thu, 15 Jan 2026 10:40:00 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm462182f8f.35.2026.01.15.10.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 10:39:59 -0800 (PST)
Message-ID: <7374943a-6a81-4eaf-9b80-2f23e1815ce4@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 19:39:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: cpus: Deprecate Qualcomm generic
 compatibles
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20260115083503.43796-2-krzysztof.kozlowski@oss.qualcomm.com>
 <59ae6b16-7866-413a-a1d2-4a735024c108@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <59ae6b16-7866-413a-a1d2-4a735024c108@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HcEqfc9B08x5JiMZ02R5pYu38agBH6Ga
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=69693481 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lVL4rLVSVjvjiJu9p_kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HcEqfc9B08x5JiMZ02R5pYu38agBH6Ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX4CqPvVl0VFcV
 c8gFwLlMy1OyK3gOCqSIyVlX/GdfMk408JNvEJq02ffNkgFHvIUeihmne41RkJTdFRbYbO8kkFg
 G9vc8s26F3kz2koAWc6vpj5ghj2BqyARESMoEqXQ6Rvb4yiD0SxTvhs6rDqheNx839zlhtX7Grf
 pRvF023kKNoEuFelMNTGQpHCeQfxgX8ufRrGJyZJPY++iHDUafb5AhjCZLA8CZzppO5IPkvvPHc
 bn/zaquOrsSMLK/sxCX4dTQVAK9YzcVSzYIjmRPIH9lnUfqXBZKc2bWCm1wpHSwy7qK+LOkyLnc
 mCb8GkqNovh2s1Oza2cGOp+IOe8su4B1jN9DaStLIvs6eSqOG8B5DFc31OCCsaR1jdhh+L480dq
 yyvdm+lWiiqiq9I+6eGIUBqIdNkPkZ1KfTrFyixiPC3OGcl1uSDTAaGnHM1e3SJkGvrFhYHrI05
 24cDZUzYm++KS+l02yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

On 15/01/2026 11:19, Konrad Dybcio wrote:
> These seem to be spawned with a specific virtualized Cortex type
> 
> arch/arm64/boot/dts/nvidia/tegra264.dtsi
> 

That's a bit off-topic, but anyway I will fix it.

Best regards,
Krzysztof

