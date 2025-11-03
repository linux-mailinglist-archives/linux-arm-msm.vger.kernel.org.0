Return-Path: <linux-arm-msm+bounces-80098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47920C2B803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F2EF188370E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207453043BD;
	Mon,  3 Nov 2025 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpSmMOr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mlcc8Jiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F412DF133
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170573; cv=none; b=m+gumSKXxG1Kr8zcZX1OVsSwJHncNJ3iiJ6F9VJMu18zEO398pyvRy1j1maq2f64PFvNurJjf4Foq9ZCwPOlfTrhNiRFblhUTnn5PniEg1wybzNqWXqfIj2VqmZ2QbO7Eko6xMRXFV1DO4sw69ljrrsrB4VdgPBuuOsAtyxlnSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170573; c=relaxed/simple;
	bh=z6imvB2DV113EZpnJ6O9yrdIZvQTR5LA7M3rS0SBWfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toFuZJGW38UivKPuPm/4Aa8F2k516/skEFSfrShcftNrgJ9LCzisnwRQjlqHRpVM3k9XlvuBY2PIQb78ypPkI20ps7B0SeCDk+xgIm4RnK+eLmwnis7sHw2bwYutWZq5YtSTz9fROB0uM/IBc341F04N91r5ZW1OVj1tkDoNlQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpSmMOr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mlcc8Jiz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A385YxA939301
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkPTcU3mDcuoSLztjAvoj6OMoqsfRN22xx/qlMYINVI=; b=dpSmMOr22vJJno/q
	GYpFa4jPUNT1xaFy5mLtKri5DWvomcW15KuGMM4OuFk/PA7i17nnHcw1LUH7Srko
	mAev1N15ySGJmtfc6fVURpeWGKnPtf82VnqavtW34Ac2p4Lg43rFAvRKFBF8NbNn
	xgmHEZBSmhwYfo6La4El0LwnMhol7i1mb+uU//4oUkHR05+FspzQpLsJxBlyAar+
	xhfAl7SRen71++iriWaqvp5G5Fi3bXLRaEZGr0f7kkWS4IFv7GDjCi+I3ja/EcmH
	D7qviJVwKDAgWzUOPg71LdyHFL+pDpHY+1ZAyaJj6wh8aHoUtzm5VKXLo45PB6uY
	vcXRiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm4dqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:49:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8800460ca8dso17085146d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762170570; x=1762775370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkPTcU3mDcuoSLztjAvoj6OMoqsfRN22xx/qlMYINVI=;
        b=Mlcc8Jizd8UGulNDSgClDLhiwiHQH+XAT4/hyexAvl70R6zwcTfzdx2hxII7B4TUtP
         4irx9jw6hkdr2raFSeS4kBKpkB66rLoZspIzyi/kOx7EPXMi5ZejsG48+v0Pay8p28CB
         e5udP0rGh3tLH58P3/eiB2p6IV5Wd50fbDqyAtxmBxjTTEzDKp1y9RzVxcesRf775/uP
         plXyLnNfEFiDV9JknVLyzdzOuf9K5xSEwUZciB9s2biA13mROLszxF9/xzEEriD+ooh4
         ny87hYeKVANqDodpkNQ3d5TaLXvnajg7S4XJpPaW0n12BfRXptgDkVjphtQAfR+6Qm0g
         0+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762170570; x=1762775370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkPTcU3mDcuoSLztjAvoj6OMoqsfRN22xx/qlMYINVI=;
        b=MnCPpSet3Y/tM1ZFtTQjEHallzhy+sEy0hXAvd9IIgDtC28OlIFD53e8z+XoGEtDlj
         K50BOPfbfrXzpxX9xuKy+b87QUXYIw0wf0eGuW2ZXM/3s9H9l+L9lSbN1iMhSziMG7Dp
         rCn8R7RpNlLMmblKygmNblcsodpBlF2Age9e5/volPcGmrLNngHHdlts2S+0G+6Ujv67
         rSBxmVJk/ZiQBVj1te49efZB1rs9Dl2l3mm1qtDsOpwyfZkV1qZE37od5TGvfBH558DT
         5H8pctLHU6qhbkuiAT1n/2MB1H+N7tc+Wuo42F0aGFsUVXNutEjD65y9Ob2hB/9/2MJ+
         qtnA==
X-Forwarded-Encrypted: i=1; AJvYcCUNAlfsrr/u/ILJhnkNemYKv2SRd1ijgrb5lK84kAjOjcMCd/j0sT3aYBwCQVefzMz0+wCxZav5Qfo9Y9YL@vger.kernel.org
X-Gm-Message-State: AOJu0YxfoFjMG4DcQWoBZxXr9cJhsbOl/Vo7D+GbgZtMFJ9ns0fYUjiI
	aRBR32iC+9zCQtjr4BBmg14Cxhv7xXVyA+45xJ2LqxSxJurfvYXhIeRUK/ncvrVVHcwT1ygdThw
	l41Lko47ksJLiN4PPJReJdf/oU0Xs4unV8XOx2t1RjgUXPwqyeYWbOT/ZZq8IWC2gGKpx
X-Gm-Gg: ASbGncsePJn2sQyM4V144vag3sjtEahbh5c8p11rxFirzpc+b8Qm5TV/equZD1CrpoA
	/zFeamh77/9uddh8rCN68jAvoX5e+JfTvf5LwAS4e3ZJ2BlZW+ZyGh/76iz1c5oAnTLqAGxxB84
	qrkigHuuCAVQXWjJsQuzR7FYgYZiCwi4oGrmznC+I2+C7QR61v5b0ACvF67X+N4JAWonZj2+zQ1
	xqH3oX3/42TBG+OSsKbDp0a94ygNy+64kUsUzeUmReINYzwmZkzl0EdqIdGMdy6XCUn9NOmgTJj
	0xRiaiEsmnAD3/dmCcl52aZKVrH4ALc7n3ZkX1o4o6WBJJSG0eAj8WYE0oMxOaJfwtGS8h3GiEw
	nob9ALd6CEDXriRjQsRBx0LEqnzdMmhb2LM7FfTXk1CURoECuID5Hkc2e
X-Received: by 2002:ad4:5de3:0:b0:880:4bab:466f with SMTP id 6a1803df08f44-8804bab486emr55344896d6.0.1762170569874;
        Mon, 03 Nov 2025 03:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvQ7U98yLv28zxti/3uxODPFzxqcKCyA6e3QUrxMfllY1U3qCcZkVdtnh6u/I2Br4lrHf7UQ==
X-Received: by 2002:ad4:5de3:0:b0:880:4bab:466f with SMTP id 6a1803df08f44-8804bab486emr55344676d6.0.1762170569129;
        Mon, 03 Nov 2025 03:49:29 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c3add2sm999166166b.37.2025.11.03.03.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:49:28 -0800 (PST)
Message-ID: <21430004-b186-4f28-be59-bcb3851237b8@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:49:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650-hdk: Add support for the
 Rear Camera Card overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
 <20251023025913.2421822-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023025913.2421822-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNyBTYWx0ZWRfX7ekLkLQ5W5AY
 GVMqRXrFA+C1cdyNnRfzlgTsrXaFCJFGsWOe/3Q8t6INYmPMcnh8FFdLSmPrNHeIgYELj+pJc1S
 H7r1gd4n/T11ObGMQz/hcKeDl1xka2TZuPwrpSjZW1ZgbZLLa5+cA6ZKnjc2T42t05vdr53znDy
 4XIwpr1hBmRpDsVoJjhReRSDWsGUEz+bHFPh9WEvcIqeThN6fWZeDu3cDJ+2lWNlZdyoqjXG55x
 uXcpDTpZSGQX2M6outj9JQiwbbVFYLE3qNc8FwbaT6LwUYKvid6sIpavef27NJrMuqV9iq/hMf+
 1pdCFPCYx4sczdEX/liuOv4EhrvOsTkKthC7Acw+FjfS0m7Ks2wzNR4WjrPlXpyzupPrZP17ZMG
 n/3INH/EBtepiY5p5Abt/vj4H9rfBg==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=690896ca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=ALpaD-JCGMKI6II3ft0A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pqVwDksQzyVokL6SxICciWMyoaUY4HpA
X-Proofpoint-ORIG-GUID: pqVwDksQzyVokL6SxICciWMyoaUY4HpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030107

On 10/23/25 4:59 AM, Vladimir Zapolskiy wrote:
> To provide access to camera sensors a Rear Camera Card can be connected
> to SM8650-HDK board, the camera sensors are:
> * Samsung S5K33D ToF camera sensor, connected to CSI0 over MIPI D-PHY,
> * Sony IMX766 Wide camera sensor, connected to CSI1 over MIPI C-PHY,
> * Omnivision OV64B Ultrawide camera sensor, connected to CSI2 over MIPI C-PHY,
> * Samsung S5KJN1 Tele camera sensor, connected to CSI3 over MIPI D-PHY).
> 
> Get the initial support of Samsung S5KJN1 camera sensor and two flash leds
> on the Rear Camera Card board by adding a board overlay.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

This and the sister patch look good, please just move status to be
the last property

Konrad

