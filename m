Return-Path: <linux-arm-msm+bounces-89368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64499D2F484
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F061F3062B20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7E04C97;
	Fri, 16 Jan 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5BoFwLH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kej30HhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5819B35BDDB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558071; cv=none; b=NaFnjGKjMAGU3psTzHnA8WjG2P8MPiQhYl+BS101+aihlTVgnM6OFTKDKvF4BGKG2FbtnobHuxJ+9AxMB1AMuoPxJowqpSHTLzYupTOunI5mLEMVnNVya85LxNN94NBj510Ou7lT1VEscNJ1PqwEfh+n4Fx8uOGrdVqSfes30Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558071; c=relaxed/simple;
	bh=vDpPl041f/I1iMmWEjgFBtF1sfEIsnwo6gBpwRcH/RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZTa27b4U/T/MtI10njvY90s5O46vodqXSyo2XW1ioRht/VzviXpbeNUCMb2+K6WQ7iAAU0XPdMHRI1/DWXRf+YyMa3ugG/5MMWn3ty+erD3JPuIMRfxWGPMf+T5s3NLjplKiwCwGtwipK+qH4G6YtGqf32uTDPrgrkZIDntiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5BoFwLH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kej30HhF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8KWlS3715045
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=; b=m5BoFwLHbwluIwbt
	ZJVAz7qbrmQSCyPOYNS79oJpdAp90QJSj1EUas0fdv5P/mk2nOJf5X6hzpAxx1Xa
	0suPQEXrZNAZyv4G/OcQP22fzdw982ay3r1PV/fbnNoP5EIkWvxPJ9WHJT0LTDSm
	OIQFzqMGP9q1NzgXqgERRpTT6Ixe7LET5gBVeBdn1uSfKQYI+CpAgcjcfAzvdd41
	PdI/dD+JWu1LTWRuwGcyfABsMUiDonKam+FL571wc9y656mTALv8bWES/XS01le8
	933vsSJ7MmamMqA+Yv7+yNilGDnbH8NwcvlPxyBfpBL96EO3Gt72rh/lv5oFNmlt
	b9Nuyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96p9r1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:07:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c69fd0a87bso93975285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768558068; x=1769162868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=;
        b=kej30HhFPAOAxcr8DQcCYy6AnigoPnNPQdJqPNr3dR83jyH3YS4nMBu9uN/Sjtdd1T
         tU4r5ZbkT9ZTPGa0E+f1QfVsqukNTPy3OyNdDwm3OqeSlYFWK1UUMKKbimlndNiCKYq1
         QANniXdXj2Jb7FCJ9S2iuHudPMBYYTT1+NcFFmXECOlQEvetKQME8rRWAimxHMnpaOlW
         APx0Smvpmz+C7SxJiKaHlzdxa2CVSIFy8S35WqmbTvcVr5Ef1RAgmByeyAy/J4FUc+yH
         1WsbQNo5XkE/h/wfmmqci+ZZB0De1ieBdYMJyJsd0tPQw1gyHKy2vqNO1hPW8qm/aUMC
         +RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558068; x=1769162868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=;
        b=sCk4m3dz+QhWiOfODXvNGDmiu15+WwhmON4AiHHcvCJ1Vh/hMdPORpar5FQyQHTPvX
         LCoeS/5hl14YUNxdZMoh2tRaAHZZ5O49TDcgO9agHjvGIdBGYUsV+zjmlTSu6n+r3Pzs
         nPC+hsIkqRDvkiDIO/BcyguR28XkRK0Ejx3jKyq8Ywb2NM1DZIPbfWwd04KWHh5HZhxi
         6kE8taU51pWiRbhuRtsLBxaMKoqzBkNRA8OTMis6j5fYtwe7Md4ILnktHJ1lAWMYuAMw
         FNNrxkZNcBM/wvis/JWvVtJjWPft38r7tSf3XgDphWr9sgT4kqOOsNI629kcJGtzExxc
         mN8g==
X-Forwarded-Encrypted: i=1; AJvYcCW7P4HuKJQsdzDmxn/4KSyfT4grvHMWtMqwUJUsRCVeQFMmzWwTwUxRjdDyL8wf87XjtsXaDArGvjrp97WL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv0rTqWnoc7lA5f+8LTMGbKgrHJ/VQyud9GhtkOUgZf7eFtpiH
	IVxtpgPvh6+KsvHTmWCzzo2qfads/u7VPgT+5qggDDdeH1ur26Tb0tcRbz5IfMjKm1Lgp8u/eFY
	Py9f/Ldx4PxF2hw4JNSqd11kRf3WaOQFYf7YsawuTc2vyGkPLRo9QzBi7KbktPLiVTnDLiNpPaC
	1Y
X-Gm-Gg: AY/fxX6ctlkFlZXawg9Qt9O9eUNz70wf8ekD21qHpklT+7RG0uRWZHwd5zPfY8jx2PL
	xUGVt5D/ujdN7cxxmmA6fQZAEf9tqh2n5EDd5etKlh0XwPQY51ouHTF4cLWIdm/BPt6tcMBNh7L
	F0iY5Lw5zq6bkvLu+5DQxwv+6TYyvHQYh1aY3d9sRj6TLVZHPXL1cYanUW4EGzx71k5/PajPGfe
	5+lCCRW/r9tcqba1UILbBw0HStxBYV6hsGa7NtxRPcFb6U6szq1q0//1MF579mW9oOqOiG0xbIM
	Y5uYmGK/l+A5Y6O5Ukvv/rpm5WYe3LxYYClfH3u0zQbWgz5TMXvUhwD0Ej+VvF00IKdIE6Ih7IE
	A7eAcxxmRu+c5NzmMsDgXUv7lqi6V8jovurZjAF8zxONzbrv2LgrdACbs21I5Kf0vIl8=
X-Received: by 2002:ac8:7fc8:0:b0:501:4ba0:e06a with SMTP id d75a77b69052e-502a165ca89mr27196401cf.8.1768558068515;
        Fri, 16 Jan 2026 02:07:48 -0800 (PST)
X-Received: by 2002:ac8:7fc8:0:b0:501:4ba0:e06a with SMTP id d75a77b69052e-502a165ca89mr27196171cf.8.1768558068138;
        Fri, 16 Jan 2026 02:07:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm191564966b.69.2026.01.16.02.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:07:47 -0800 (PST)
Message-ID: <1fadb442-31da-4b48-8730-5f6cf5229600@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:07:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: msm8937-xiaomi-land: correct
 wled ovp value
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-6-e6c93de84079@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-pmi8950-wled-v3-6-e6c93de84079@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NSBTYWx0ZWRfX0t8wgU/aGkJk
 eS0e/PeoTgUN+FrR7aC42OgDZP6TIIfRH1701ozzUPUje0WQh9RjpYTSgPFVY+Wb/5M90g4P5we
 iPM99a3vPFoPucDE+av51cybRKf3r/grv0fUlkdqgudG1ovxW4CMTm1GO3RxuPwT3Ln9CymWh0z
 YAe7YkVZAz1oAhQBG+0CHpx0uGcc55I3CJfdl0Yruj9sshn6rnwvdRmmZSkva0liinxgD+WV9cc
 vom9DyR8O+H2NE+6Sl3qbwD/Chyx7qUe1bzChh/v2q1vLDbUtsI5De+5YeOkdDwsAi5t25dIkSC
 xw9ClRHqBCEaXhytPVBOWMxqhPBIqYg+74D8dCBSgoEfLrcOwVPTMSBVPsngho2MuwW6mOKv0Vu
 M58Aw5cRpnqJ1L9YL800H0zMQCkuIhXPg2pMSo/p3IDYtG4Ov4zsFqF+McvfdImtHT/y0NVcfCQ
 k/HYIApBjLVlHgDOIAQ==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=696a0df5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=ECzvPIt7qBxGGsi-YOkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: z6ric2iXiczS3oTdyhrn_VCwBemrZI7V
X-Proofpoint-ORIG-GUID: z6ric2iXiczS3oTdyhrn_VCwBemrZI7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160075

On 1/16/26 8:07 AM, Barnabás Czémán wrote:
> PMI8950 doesn't actually support setting an OVP threshold value of
> 29.6 V. The closest allowed value is 29.5 V. Set that instead.
> 
> Fixes: 2144f6d57d8e ("arm64: dts: qcom: Add Xiaomi Redmi 3S")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


