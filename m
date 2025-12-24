Return-Path: <linux-arm-msm+bounces-86461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED01CDB2D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BFFF302A97C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174392798EA;
	Wed, 24 Dec 2025 02:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiLCAyFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sa7BK+Nm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB23277007
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766543278; cv=none; b=l3SvZ8St9utCeokxCnPfuzqLWitj7/Vua0D4kDLd1dqx3pegZaDEtr6vE3eZRsMDZk2y2OqFP8YwYJZUdIreEk+D66rSjONoilb+V6PreyiJFY+gOMcVuwtKQLo5Ae0EPA8haiTdEwChd6lQe0t5wqBon226eYUvkp/yMey+lBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766543278; c=relaxed/simple;
	bh=ThvT76cjJvgLd+fzgxi+Zk3jr20IcMwPef8PZRoLSPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYoPpu/NUyEu955X2bxaWa8quz2SBact3m4VQSLRwQRB8yrX4mB9yXCejlB31Zn5R2pX2xSXI2L/CmBcT5Bw9oSWcR2cN8rWLQS40bO8hAS4ZiF20rtQMHUzyg49hEpBm55NRukueukSBJFWB2g9GOipluU9hsEBz8NcItBNR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JiLCAyFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sa7BK+Nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJD7201056769
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwuVY2Lab/HrxB4EgajBljldpOxAGJuGAxHmuMQ6J4k=; b=JiLCAyFU4Afh5Um+
	Ocxn98PVjJpmPi0h2x+3xwPxJAQoj5GdmtyHaZ6ZcQAK08Lq9frqH3l0HA1fy4Mj
	/7DzQvMYRUuxiqu0IX7Btp1pvw/NEK0dI7qlxoktPjpk7M/ln2IkMlpmKqWhJhfr
	0hqTur99qzebl7lht0FjkSxB05epSSW1yBZMmyyWSVoNCdGMUAk0b0ojPBLOyA5b
	Dp/ooTP9le4Jey0GT8TutyJ6eXLbxiocyQRPDmu01Z4+K6OS+TN+SRPSKiGy7YQK
	+wVk79NuqPMh71gtScUL65lAwCaYR2MULtzNRzXc2AOF7zbYySvM7zc/1UEEBDlB
	v62Lvg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v10qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:27:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso10389194b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 18:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766543275; x=1767148075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwuVY2Lab/HrxB4EgajBljldpOxAGJuGAxHmuMQ6J4k=;
        b=Sa7BK+NmbCe70R2Ta+odnjTgkxUnK3na+bcKCZHfZGt1wFdorbPHaomK0O4O5VEnPZ
         Qn5p9nWmSvE6P4MvdHZwDNnEo4g96zbMpGmgjv+n1awD0tZSpk29KmCdo0Oq3ewmXPxH
         lbJZYUzxeT7gSzbdorpsQNuXm6TsCndpNDbXVlGpVYOCPi8Tjv3Mv6QF1jSPBGH94GaL
         PBSuJqzHvl8W/YxRLQdwTQwWFByWE+Z+VscT7TJLoCGP6VSOc9amMARe7yTbhi5UWgNF
         +sClGvrJmiNeONX5DIHnPY1ZHUqSQd21fTniKoCUsqXKqcg0zJYMZalitfx7+JpkAomY
         Llpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766543275; x=1767148075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwuVY2Lab/HrxB4EgajBljldpOxAGJuGAxHmuMQ6J4k=;
        b=Lx4F7j1TXSgLKmkuS822V8EeJ06vycEFFUaEuwa6KKwocJtuE4axAZZt3TXZcxZCUZ
         EA9F/p68RrBMuyCqaazV7+lrJ/Zi8oRjdnYgpYLdoB1hJscwhhslPDMgaVDZFvKPT46F
         nURzv4idtv6Or+ZgKDDexCz4y2TPh0PZzgnopMp7vUxnMWyfjlgzTcxkR+d5prsLKq0J
         mFn4hLeVBiAD9Oc6PjrXP+RLXpqdYR52STFYg+zi3gJs7w/Fcx0iDewfJafidEgfFRGs
         6FAbf/JEaGLBYBqVy5vPwUdP91ts56uV5E4tfB7vy1kqBYurPa/ZH2RhxcDTQv4tNQ9B
         9X2g==
X-Forwarded-Encrypted: i=1; AJvYcCUaDnbJHfuFPwys+w6KOl+es+Tyegm1xAk/M+dDS7CLWia8vH3BB2PRMtreBLjvW16gosODjeKN+SDAgnjt@vger.kernel.org
X-Gm-Message-State: AOJu0YyV6gXeogoPc2QDiT1wEp1JttGTZ5DTQ0TQCFq8fRHBHzqqpVZj
	QxI6j17YzRtFzUbRdj8NXjiYD0lBqvn2yJag6wo/KRfuE1hU1/Na3EixnrOAM8nU6Vn48hjkU2T
	qG7vTEzAhDwxAv2OZmFGZY77TZeVpRCA6lw0Gx+t6Ppv++8S7OEKEHlwRXeBVSCd4d6zys5aP+3
	tASxE=
X-Gm-Gg: AY/fxX6AKLkSD5o15OsNrKFvopbL9PjCHK8oskzmRpBl0+TcZLBEZ3nOGK7vU2nFbxc
	83hG3f+OETvt1QAa6WIOAerT3bzEqG4zo30YpHoeaquZDCaJmDJ3K3JzSfWXwJBEZ7wg1MlqolO
	t0XY3DwCr2r2fND/aGPMhQ9uOthlhbJ9VlW04XWZnLdeWubzUc95rUXx2y9enEIGES9tY5FdBY4
	lpYrrusxWtMYOFjtwxFpMRtul3snqSvpt44VyrVi2NpRHZOHWDVeq0L6etULcG8d+TuFqBX4pa4
	MyHwHa5i+ZxYYDXDsDXLnNPJYi41DbYOjgp+OQXq8wU9Op46GkKgF7FKtpsoqwLsOKOPZ+iFkfk
	Dw8mW84u72DMd3mUYppG/Qpd0HWfkji+eXhn9oA6ke+GG+M0sg51D2WUNpMzZiW7lccZ1KSvTDE
	RUyQ==
X-Received: by 2002:a05:6a21:e097:b0:341:262f:6510 with SMTP id adf61e73a8af0-376aa1f81f2mr15457977637.41.1766543275076;
        Tue, 23 Dec 2025 18:27:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUdJFu5WTsVl4EbSp/XYtjut0VIK479Z5/BBVF2Ool/fb3XCzhkw8mnQYh17W1FdQCf/M7Xg==
X-Received: by 2002:a05:6a21:e097:b0:341:262f:6510 with SMTP id adf61e73a8af0-376aa1f81f2mr15457958637.41.1766543274583;
        Tue, 23 Dec 2025 18:27:54 -0800 (PST)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a2e3esm14804089b3a.37.2025.12.23.18.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 18:27:54 -0800 (PST)
Message-ID: <6211f39c-90a0-4460-a20a-5487c35de80c@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:27:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <862aa161-fd99-4938-98c5-73593b03d215@oss.qualcomm.com>
 <d105c29d-82fb-4127-bef2-11bc43472dd5@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <d105c29d-82fb-4127-bef2-11bc43472dd5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxOCBTYWx0ZWRfX2v3jQKVX/Umh
 ryh/SCq4nowV6uj47zN+DN1qLwX+JO4GPxoRK1dCMdrK7DH5jGuCruGBKsGPRiHRw5k2OVUlLCs
 V3KuYL+7kNUF+eOpamvbxk+qNj1tE3grmSCj5C2N1Hq1LfPwdbwN2dHRzaPpMZLYVYVdvihPi6T
 HObAIsLjHCmDqBFZxAAtkE5heA78kCWxWImlY/MCwd/xF8KcuvdEEzJbJxAwFir+Y/Sqh+RtKOn
 Scn8uK04xa+k6cOl50yBfsqaugU7ipdoBcyMAFZIr07kAvX8eN5FTasQafbYz6swUkGi8SclTDV
 +yUdIupxT2U/UTf18l728CvuzCD3C8RLSQfaOYfTzIWEyv9v0wNRJU7plht50j7kvWU3HihM0dk
 xDJ7ky3dd83UsIthwQyr16t30HahBXLpFqkRbSXaCT39ds4z4Qgo5vmHLWLFPFCeHfTGDiSWu8P
 b5NsgYgOvaUgUMEcnUw==
X-Proofpoint-ORIG-GUID: geFu-mpBUmKyabF6W5-obgT-sXjcJAmL
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b4fab cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=18nqzL3DF-mq9pMaMlAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: geFu-mpBUmKyabF6W5-obgT-sXjcJAmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240018



On 12/23/2025 9:42 PM, Krzysztof Kozlowski wrote:
> On 23/12/2025 03:00, Yijie Yang wrote:
>>
>>
>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>> the common components into separate files for better maintainability.
>>>
>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>> similar to you, but actually common parts.
>>
>> The two SOMs share the same hardware except for the SoC. What are your
>> suggestions for the file architecture?
> 
> Not likely. That's like saying SM8650 and SM8550 share the same
> hardware... Take the Som to your hand. Can you remove the soc? No? So
> you're done. Separate device.

Although the two SOMs differ, they share an almost identical hardware 
layout. In this scenario, would there be any issue with extracting the 
common DTS parts into a separate file?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


