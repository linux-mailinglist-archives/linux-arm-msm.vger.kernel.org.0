Return-Path: <linux-arm-msm+bounces-88910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B96FD1C9AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00E7D30D0BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 05:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52DE36BCDB;
	Wed, 14 Jan 2026 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/o+CV+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/6DRws8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ECB350D4B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768369386; cv=none; b=cy/xUYyX4YPWHDTHpn+VIAV7AVe6c5xPslWj8ciSBKGJoTOV5vYNOPzw6/8fOIXQACZQdY/trhuy9DTFCULh9v+P5+CLIpBKRqGleaVKwytFhfZGbmcX8eskuegVMOkXxWbnVvp4kIeU3jXvf35PdZGsNPR8GercK5Bfvu8O7mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768369386; c=relaxed/simple;
	bh=JJTMFk75Gutd2cMz2WE3Y+uKgBt/r2fjdYpl1po23nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuzBynEUz6LPc4uqy/SpPuoyjUJ7La/Ucqiuz9aoMuDkYq8HW6S9RbGGBpUdFLDAzVObY8fcHIxD1T8xHVDG4E/7xWgi8w+v3/i+sI/dDpz7hZi2ZCPXg3C4uNknlhl4jS18MRN3Vfd+kKAQXF4fP87W+SOUNS7QQrP6YdeZS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/o+CV+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/6DRws8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E5EdMR2266318
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxdvyYzIZyOHUwmxqd8hJRQXBpXJoAEPCSYU7mtFibg=; b=P/o+CV+Su1NYNCVk
	rrJMjpCGKB97iInfMqhn816TuCnId5jDZQFcrxYKsiKFxXw03Ez6b//ucOJOBacS
	Hrqq85OyN6prLm1FF2bRcqizP7rMPV1bPzy1i00pX3n3XMZI0grqOJa9R8fbkqPQ
	daTqxfG7E+NDbJB07sqxT5b7AfcOSy8zcdJJ2VhFJ57fKp5tgmBt/Or65vec9KrE
	Mvw3x7Hx0yEJWgLPKKQW1tqsZ1EJlMYcRvPHLL7AdeYcg+GShI1PjUzXHFKcykxh
	SW0ape/gZbSZkdIvXdfOnCpG9cHM2SnVJRPd14fsGfZEsOyVSidvAmX3zohKyCxr
	J5gTsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnymss2a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:42:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c904a1168so9019788a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768369372; x=1768974172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxdvyYzIZyOHUwmxqd8hJRQXBpXJoAEPCSYU7mtFibg=;
        b=J/6DRws8eWNKJkF0SttomNs8FM7m77MyqPeFJa4nPu7cxfYyjDAR2ZvnWjRZQXi88s
         gYrVMIVV8XvyLChEd+exRu+CJaRhC63sjqxDuVqgYyEjZLAImcU6A6Eet21+9MiWEuAO
         C+QaGYJqZSvQvNnmsWx+DoBg7wxOL13gkL2OurCl+0EtTmRsdTykCWqxizb13XPEMSnW
         kg0jxjJQ82xSqRtSqO/gELBuO2nKLBzRBfoffTXDln/EkWPu30Tl1O2l0DLrEhdt2H5b
         VJPK/ipqzNsIxmshljJSuKoeuW1C5VIGJBLDCpKUvIlZ0cGRU2sFxW2R9+R8R+Ec7jHv
         syXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768369372; x=1768974172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxdvyYzIZyOHUwmxqd8hJRQXBpXJoAEPCSYU7mtFibg=;
        b=UiwViZeGJJkeNzjjR7YBFgpxtaDaPQu1SPvWmASUxLJw62PsWEffQKaUIircOIfqWs
         7SLNZbODZM/V2vVdMVznup2bn7+JSLbIOUmb7+3gzrnyfjQPgFafWvldDw47oUjnofnD
         3wrquqBIxJHx035sXbtpg50b3VxtMsTbKNtCRvvOGWYJ5tuQBXB4NBbyfLJZYxMKu76u
         q4+nVIVGRV3wal0UzJHtkWP5yJ0WX2Qy6flaqbktDK7S+09E9+wt4Wf6pzYGx+vn1TKF
         pC/ZIQeInbn5khYSKgxP3mm6I/9X/UIShuBh4AM4jl6hhAliX8Q1AWaYuIMzHNkhf+Ac
         1UsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWwmMukLuPVpHIiSWRGG+LmphQi7fKGeAf1iEfH9QF9AHd5QhdiPIjwbLEmWVTNnUDNH8FmIzRzHhll6ZL@vger.kernel.org
X-Gm-Message-State: AOJu0YysXc73mc+cNm3I10LwohTQ9mvIGJiPLnMMrw4O2TXXEbpS47oO
	+i2Df4Hz13YOVxAFbswt8I/OVu0uoIxaf5eqYSksZC2+XZ5O6NRgpY6lR2/6poZgumthMGhkhhO
	XoAYbtyMwWaxVEIJTf0KBkxPfBbKGG/Oy3MQiFITkzITIuOLGnvO8q4L14qUIAtd1VcPs
X-Gm-Gg: AY/fxX6/5qDci8pUBnonPF79uHO1ClcVOl+HBNROZkMygxXGVFDt4YUu11TY7SArB6M
	fSh8O80WLiyz1keSS7otnSVYznTyKes6z+Q210963PRtFT11CZ1z6OzL95g9RJShC9Hin0tbNKA
	IQo60xXDgkdT1ki4FVtEYjFk++5kyPgiiqsVr0WhMH8ixIMJOpJ79FxcofqSJGBgmi+L1//O/xX
	kHi8sL1J3+1oaChaG2c/KnKCxMPoBsxndzIgQydWdx9E/w3hJKvb0PGfE7T7HA9sEHNFxuNKG9U
	VxYQraTbfeK1Wp/CmqpiTsNF/RFoYfwz98XNVBBaQ9vDHOyYrpy4TNKz+9fF0+K+ntcbPDBeHfF
	DyDpG5AsgZWqyUwhRB+4ZclurB5sQd3HNR2YVl3cxzYBM36aY
X-Received: by 2002:a17:90b:3806:b0:34c:75d1:6f90 with SMTP id 98e67ed59e1d1-35109129c2bmr1728000a91.17.1768369372423;
        Tue, 13 Jan 2026 21:42:52 -0800 (PST)
X-Received: by 2002:a17:90b:3806:b0:34c:75d1:6f90 with SMTP id 98e67ed59e1d1-35109129c2bmr1727981a91.17.1768369371938;
        Tue, 13 Jan 2026 21:42:51 -0800 (PST)
Received: from [10.151.36.141] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c78f20sm784491a91.13.2026.01.13.21.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 21:42:51 -0800 (PST)
Message-ID: <cfa31127-2208-4c65-b8ef-3b5d534e050b@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:12:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org, krzk+dt@kernel.org,
        mturquette@baylibre.com, linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <4814455.tdWV9SEqCh@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0MSBTYWx0ZWRfX6gyyw5xA5TlF
 AJTVg5Hj75LGt3wQA6g0WGH+vKUYXTIj/YYl+IhKRfsjYStqs3oD5Tu1zZUlA4cGBcxHWHYkLjV
 qzbKaDKcAEtSY67Jvyj1V0Qjx+c3ZhjEmnTAVEFKPkgQXofLMoDyHYCzpwcr5Lr9JUUvkIfID+D
 EONb75TthesUFlWdX0j/NlystREOtYv2UWKQthLgyhBdwP1GfqBDC0myMcWxL/C3gTcnaUqNINK
 tA07sxki3ek+XAGj3fXdNSEKnHm+ey10SMhgXS08acLx+OJRTBn6+p1PK/0J6eg8GbcIccr0QV6
 Yi5C1zzPZMf4o3/f9YcIDN+2iWlIZMUC+euIVXCzr289Y9u2rGDJ9rfvakL/bnU39MeQCzhHpI9
 wapjjHIjbu5vGYjGnMfWukv4ZG9RwTriWXzW57E6eaTD6FKC8yLr5ecyZNRsM3UoDi7021bymMp
 5nS9aPHSgJE0irb0lbQ==
X-Proofpoint-GUID: zwj_CATEZsgbe-skg7gr-6qwjopC_WUw
X-Proofpoint-ORIG-GUID: zwj_CATEZsgbe-skg7gr-6qwjopC_WUw
X-Authority-Analysis: v=2.4 cv=RuDI7SmK c=1 sm=1 tr=0 ts=69672cdd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MOnJJczUH92I72-_oswA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140041



On 1/14/2026 9:24 AM, Alex G. wrote:
> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
>>> driver. This firmware is usually used to run ath11k firmware and enable
>>> wifi with chips such as QCN5024.
>>>
>>> When submitting v1, I learned that the firmware can also be loaded by
>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
>>> makes sense to have the option of a native init sequence, as not all
>>> devices come with the latest TZ firmware.
>>>
>>> Qualcomm tries to assure us that the TZ firmware will always do the
>>> right thing (TM), but I am not fully convinced
>>
>> Why else do you think it's there in the firmware? :(
> 
> A more relevant question is, why do some contributors sincerely believe that 
> the TZ initialization of Q6 firmware is not a good idea for their use case?
> 
> To answer your question, I think the TZ initialization is an afterthought of 
> the SoC design. I think it was only after ther the design stage that it was 
> brought up that a remoteproc on AHB has out-of-band access to system memory, 
> which poses security concerns to some customers. I think authentication was 
> implemented in TZ to address that. I also think that in order to prevent clock 
> glitching from bypassing such verification, they had to move the initialization 
> sequence in TZ as well.

Exactly, the TZ interface is present to address the security concerns.
Also, as I mentioned in [1], on some platforms, TZ might access protect the clocks
and registers which might prevent the remoteproc bringup and throw an access
violation.

We can keep this support added for IPQ9574, as it is good to have, but can we
keep the default compatible in ipq9574 DTSI to use the TZ interface, which has
already picked up an R-b in this series [2].


[1] https://lore.kernel.org/linux-remoteproc/21468f66-56df-43ea-99c2-7257d8d6bb7c@oss.qualcomm.com/T/#m688033ab79c63a8953e38f5575d1c0ff6b37b13a
[2] https://lore.kernel.org/linux-remoteproc/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/T/#t

> 
> Alex
> 
> 
> 
> 
> 
> 


