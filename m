Return-Path: <linux-arm-msm+bounces-84157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4CDC9E218
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D33064E0517
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A0529D281;
	Wed,  3 Dec 2025 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUqhnmyx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA5/qa8+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEDF29B775
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749158; cv=none; b=HSBdQID952Fcqykz5JcYBODEK8X3BJ7nZymH9/LiAMzSGMlBwiAeQhc1YBzBlZXWu2Yfdv2WZrsSfHJ4Wc4J8qewV18a+tqZkwzlMsEbrjXHFOIb+owARd5oEC8rw7o4YCxeT0TG7CoSljoX8UtCHU2G0mp8ki6y7rc9vRXAAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749158; c=relaxed/simple;
	bh=qKOHYaKwLUDGxFHeXGtoOcoynzoovlrmBD4kPIK67Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNV6oP/tN5wlVp0N6ZtKHzovSZ6LEOfxKkb/eBLdfI9ArlivzNxHVjtohk1W1fBpEQjf5uFGjHODXhj8Juc7ZQmIPTrcrT/OIddnZyfz9sLIOTzxm0fboq18iKpiGWDT7Mm1zfflSxquwSzGlGt6OkYym0z5EohXG9KqNTo6Rak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUqhnmyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA5/qa8+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34s7jw4130364
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR2PtFiBnsDE4OVZMvj0FVZQn3Hpdm+btOLq7X47cl4=; b=ZUqhnmyxQmHjSCiF
	mdcbYOvdUDyDstbvAvYjJeY+VB5qdg3Xlb7hpX0gsd6Kp9S3eFoGqsCm9pZGgEyt
	qDU5G98+TV4Q7gAFPyWaU2CpX2+6CzLjqjlheJts2EyR9aE724jh0A0yrr6WwdIT
	SBI8GpF9YEsCiAokhfiZDDF+rFEjq22iVKeso/QjqHSNrmeERj1ruINWLPhz92Mb
	4zZcBENg2YKlkygAOMpi7E9vF+GjcKboaQCNIpFMVUUU3nmWcMErm8YZWO5iY7Ht
	/IsJViPLR3j9raFryW3Hjprcy8B+EoCyX/SpQhsE9tHztHYbLnVyM/o/DuV9jbsI
	2vt0yA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5e7a3dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:05:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e4b78e35so1238862485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764749155; x=1765353955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tR2PtFiBnsDE4OVZMvj0FVZQn3Hpdm+btOLq7X47cl4=;
        b=PA5/qa8+WBI6p9Loh3IpXguge1J1We8AAguhJWJmhU5IGAfoPvO/r9cKyb+HHbcwrc
         Mojh0NGjybIRHeTPcKd3JhVD8uA/HRRnKPAafCpZkZz90y79Vny079FHDv5/jlkosAE+
         pEw2GbsB/lRia5POz9bzWGtpBReom6AMn1CHrwKPiHVKUArcWrf6OrXrXG2zKYC2uxNd
         6FL+FqYdcyJKPkAMBzlh0/roOw9tOeQmaW+9uSXLGBlIcGJKhM4KSoWH8eSJubcDr4xD
         Udun11BLmKyYBaphDQhyg6Qxs47Pjtk89II/nm2PQm3far+pY67Oppqqnb8I2Wd3rKbR
         b1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764749155; x=1765353955;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR2PtFiBnsDE4OVZMvj0FVZQn3Hpdm+btOLq7X47cl4=;
        b=W1CtdezL9JaUSO4liSQWytvMEVYB1WhgDlmUfSlb6l40vBBN8ZUFa74DLCogMVCb+h
         6DxZKV8MuHRAUaqaImtbryO/psVdn1c1CIcs5CH+yU0BFL5IfHUW9Rwno0fh5bdekT1A
         N5RnDm59FA6yJmYgwBkb7uJWc7LEXTAy5IK/X5nH/JyI1vofYG+1nVCOqFPt/dE9CnOh
         SEQ+znsATN/cmWc2zrv4rsDwxHYWhHBpU8C6LpX9Zgzqx4QkwJNm0bnSI7gG6e3wecwX
         hXPkQbf9rzkuNYfZx0GiCZLqBaQ/Cz/Bjegtmr/C/PErBjyX7KkLUImuNaiVZ/6BlUQK
         BBVA==
X-Forwarded-Encrypted: i=1; AJvYcCUAAg8mVeFJ4shX0AF5PigVbaYlyO81hU/ayePGS+tgVhDz2j5eNK6HasphGlrfGrepWhG0pScITdLFBSsP@vger.kernel.org
X-Gm-Message-State: AOJu0YxobbQlcXRaJWIMYwZDPwJ9+/SsTWCnBWrCMB+kv8GVaGRWTH1n
	Ll4Dc045JgIhSJ+/dPXdVtC5LpU+EYKUOBGuAo253UIjH9vwTx0unXatzxsUgbEboJDMT2FINvJ
	bUmJro0eRfnWrZegT+fSbfub/B/2SZMvUZOoLlYPDquL3ZucZ6IRD53cbRr/G74m3y94nc/CIN7
	qF
X-Gm-Gg: ASbGncsAcBW0Uf7RwR3RQcQ4dbv1fw5kTuSTFYyjbFGetIoawmretBcVChovkwYyEwA
	h662ONGjTG7c9oGviPeRqfGlIMQq3I0THUUJRol4/loEOeC2ljjxdGe1lrc42ovvX4Bjw9hq5e/
	rzQTGN91pYlNwH47GQ+lhI27+k/9hgz0b5Ts7to91nBhq849SUM5j8wjXldZ5Z032Fjb5tcd3nU
	WO0MjGLNvZ0RDoKgyBTjmq7gM3T01bjHS5oet5LQNhV4tVOl1TeLZL1WdjVm/2DIog5V/sJ+dzR
	SL+4ineSmh9uE1Y8pTc7SosYiildHJg+t7a8pA58OYLKZe3J1FjlKaKH8xzjTBEna3eN54t6TXK
	bNtvjIKQTThWOzQXApXr55C25ZS5+TZxMcx/fHw==
X-Received: by 2002:a05:620a:31a5:b0:8b2:efe7:d818 with SMTP id af79cd13be357-8b5e554cb21mr184118485a.38.1764749155092;
        Wed, 03 Dec 2025 00:05:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa6UeYu1p7sCIMhHk1oHf9PsBCxbYX04jL2AfevDMHsta1Di1WwcLuQygYGe7Vp4WMicQyhQ==
X-Received: by 2002:a05:620a:31a5:b0:8b2:efe7:d818 with SMTP id af79cd13be357-8b5e554cb21mr184115385a.38.1764749154692;
        Wed, 03 Dec 2025 00:05:54 -0800 (PST)
Received: from [192.168.1.29] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a6fesm38586460f8f.20.2025.12.03.00.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 00:05:54 -0800 (PST)
Message-ID: <2ac6ccd1-9d35-49cf-aec6-771622e24876@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:05:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: qcom: audioreach: Drop unused
 audioreach_control_load_mix() arguments
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
 <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
 <f029c82f-444e-40c7-a50b-493ce8ae159f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f029c82f-444e-40c7-a50b-493ce8ae159f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2MyBTYWx0ZWRfXzYe4YBXZpkGv
 2FdjuchAIWKXEpMV86XPnF1V/FTESkk9mArntisj5d6ZvhKBZjAsGUFG8C9pPbvhsI2AzyBrmSY
 sqzWYgoayoUCkvYa4A6um45Q1q4KFtc0n7E5vU5KPYvDodyYRx244IYt6/bLrPoVp+31ovvoESM
 6lKNTcjlkWPJpQOVXGXXqAnaCuxA70pwWYeGb3nCXXG3Guayv9KH0ZR5MVnX9IVWqgOVeB2wj2h
 Jat73e7EvngC3gm63yE1Bb00hCYhtFYjaTXhzgDi1Dwnvu58ukVBARppEoLMuOgWTG8Rgu7FA8c
 dd+PclqX0asayjNm4B5ZLdbwNa9ghx6sN5YPp8IInprSgnKAjTc2BAe0uoE1vrzmHC9Yp+zexOr
 IE3qp0LIc+jeg1JDaMZoAMTZJqrowQ==
X-Authority-Analysis: v=2.4 cv=KcrfcAYD c=1 sm=1 tr=0 ts=692fef64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dALmsvAKmbTY9K6DVWkA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7TdHIwHA4wvEwJhRHAE9yQ_tWTC7i7YC
X-Proofpoint-ORIG-GUID: 7TdHIwHA4wvEwJhRHAE9yQ_tWTC7i7YC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030063

On 01/12/2025 16:21, Srinivas Kandagatla wrote:
> 
> 
> On 11/29/25 2:02 PM, Krzysztof Kozlowski wrote:
>> Simplify the audioreach_control_load_mix() function by removing its
>> unused arguments.
> 
> TBH, this is an unnecessary cleanup.
> 
> There are 1000+ of such instances in all over the kernel, if we audit this.
> 
> Functions will have more arguments than that gets used in the
> implementations for various reasons, consistency, future use etc..
> 
> I dont see any point in this type of cleanups.
> 


Sure, no problem. Just please confirm - you mean only this patch
dropping the arguments?

Best regards,
Krzysztof

