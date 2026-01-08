Return-Path: <linux-arm-msm+bounces-88043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B60DFD04585
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270B033C2437
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30154352EA;
	Thu,  8 Jan 2026 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zr/0udCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8z2iyyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95269433BF0
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864164; cv=none; b=f3X9P3U+QacLtcIt8DWLXB+Jft/aPR3utBqv9D6Xx939xpLleGT09LDNZL+d+e0DnzVG4MyylJe3liv4lh21/gACPwn0ZobLWN9zd8/ZkIRD4ABtOZLxyNLBKYyqW8aYuihkK5OIXgcNRgL07W5hEimf1uiQ3xhLhOYvheUKzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864164; c=relaxed/simple;
	bh=7vG6OaMdoY88+gn1n5QHVM4pj2RKJcsBaH9fAfIpfg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdfguFFFhvpXlvUkrWteWuNoBViplThMFyjtCrLq68rwdT6gv4G7moWsnLzYhyo52us6lh8T1vvK8Vf73J3aDmhP4UK51hcpI6Zysvv1uBTUDwpE7SYzkJ21xDe0rz1a6UVgY6L4k9Fc7N3BIOG+MUiLNgARaWJPeiEzedTq3ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zr/0udCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8z2iyyb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087kAlP2239468
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=; b=Zr/0udCuTdVjdeaN
	aqzIN+PgSWqcWrssxYyKhYJvB2EuS5UAlwenZHEQxPknppA+07BnnDLms1YbvGor
	+gKF4wRx1lFqRyIQNXJD1rzRWN9cs+UQHNKshFjiERedss0waCsRClHStbnN5uKR
	1QngrrNvX9yy3seieG5fQ8EBu/EARmQ6jkVenbm3vXygOlYGA0KCIkEnQ4tR7akF
	1w4a1+nQOwWtHGchdrGWLj/w/Ix+1+GIR/7dEx0riPYxjb0WrGFzmu7jl6mgTdk/
	JINBnDt4l9/4BEfFMoplvE/JIT5LwEZymbnPXrV+3bKoy1+HuqxWD6G1EhpwfcmT
	2N6RSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg3dff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:22:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso8647791cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864157; x=1768468957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=;
        b=D8z2iyybUghcejjTEAOamYuv5ZDVj85ymjC2gMIlKxIPkLwBV/Jj/X/LoiK+m8Pyqh
         fskYmNAuvryGntPXf4mY0GWXKBpBkgVjyWegiikahWh2syCasbRxM/ihBXkSXjFTKQi7
         gktPJVq9sDlT9Zxumm6fxLgrVacYUwb1ES46oDLBLJTmQphXKuPYxLDrXr8aTyMPuXwq
         U2jqNve0yX3fO6MnIqA9XbY0FUgp6YFwam/k9panIap/KVPX1DwsKdF+99oxEU/IGhpQ
         2R+9dm27+RZWbpYf145En/Klec34wMmz2a9gECGycftpD37ghiFUv+mYTnrh0Fo+hU2y
         N14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864157; x=1768468957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=;
        b=XdAymZ00bN2TgSMTPoAT+GMQHmEUzg6zJnRPnzEOPtsCbwI/CS85vxa3wBV2FcKvBF
         f+/POP2TRK4el7tGQst8vFh1ku2f+4gRjvd9yEZapP8OclcHlPIiG/+UhL5LRD7urDim
         scTzwNfjPHP+RDkOOK7n9l5ecypxmLjqhUI5gd0+mBFGneX4FzMSqsFUtO3/aj3Hf6H+
         R74ur/NDSazVvgftLnYMVGavGCT2xizIJunDP34OnK5SSVhAIlfo0fggfy1jR2cOSh1p
         nZHdw82iq6nUCO7qWExaMmjw+9qMMygGE/zFngD6luOZgJTOsH7H9z4BXvax7dAHPzgD
         biew==
X-Forwarded-Encrypted: i=1; AJvYcCVckSuIxcELW8geXu+gAnchs07+FoBPJ15C/wG9x69Etbhe8GLpEfLnA1UsMBLYZ3eujxKOnqDnskr0C0mz@vger.kernel.org
X-Gm-Message-State: AOJu0YylLS6WdCFy+DGZLf+LnFM2ZzRmH0GmEdbVnMpTtvBDllIYOSE9
	GNzkyL4YbP1PPkoJoKiiCM9lGtfqsj2nu/E92PDF6joB6p+x6pSJVxpOKe7mRSJEQ8VKI8vdLE/
	doNLUtdLoi3cEG3XYXMFx+1nTq/aopA0bsdHxZ8FzL82DhRcEa9Jnzv4/T1fM/6yTEZWC
X-Gm-Gg: AY/fxX7NNClD2sjwS3+ZSCfTpp364JUF8wVJDOWF1prq0zo+2iKGtpa+MUBj2NqSmug
	VT/aZ7AGDG/cohTD1R7l8zo+fY3TaH2MiCD9YFvRPNmYvKWMNvvFbJph6I1VND+kUoogjzM69OG
	jrl4hNzXc0Ver1O9glZ0r/wqjF9inkeo9jKHcP1o5bo+CAJZvvSXAp9DrvezRk0V0N0LkIwSL04
	3cNVVis+5aUZsEdQ+tIYbBD6SWNJDCi+Jk/nKTLuIOkfh0/kWsz+oqWjtxUJ7Re3LoV7Kc7jycV
	Ovi0qTsglu1+a9PTqMjMfIkSqFjgZcEcg/S+O4eOCAiesTeFHjo895f9yjyNFGfKr/4JdepFZmm
	yt9NQKiHw8JsgJQSA3fjp6wQPP00R60rYSCYUUhLZEzi5100TiqFXodGhHg3Ate7ukbk=
X-Received: by 2002:ac8:5907:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4ffb4a256bamr58410731cf.7.1767864156970;
        Thu, 08 Jan 2026 01:22:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgk+SEzsp6wNWefdP+6JTGQNVInVd34cgE/aXxaCXZgCrNOJott53yL5pFKxHfuIwh/vLdMg==
X-Received: by 2002:ac8:5907:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4ffb4a256bamr58410441cf.7.1767864156534;
        Thu, 08 Jan 2026 01:22:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm751657566b.43.2026.01.08.01.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:35 -0800 (PST)
Message-ID: <e8c37f1d-53d5-43e4-9c8e-be44753aa1e1@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
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
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YQ8VF05j8mXJ27W_8_aBAuQKjMQ2FSlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX8p4a1Ilznveb
 jzHdnTNTFIu1L3uw7lTlV5uLHxboSH98w0OkUJMb9pq6EnhgupUzZMchB+6mue1IHtL0mPM3oA1
 WWuoOiJMd4bcDKmhHyn9TwHVvist5tu3JNxfFSSmpfExtWtb/aDW/uTGEXZ2CZH8TxyeOTpv3sa
 4xxlJzT9DQolT1YQN+hyt2L3N2fTCvu76yZV5h8V52VMFH0UoKWdRmwg7qpe+tbPlfwPoqg8j/O
 PWIRDIXJ4i3C+tdnaI0loVaXVHraA407LKScl0b877HjOXexgs4yfyEY0AzkGHarqygPyR/x270
 55FPaoSoFZDizyRB2rWfLm9RlkMaMdx4M6Ok16dtJTOg89li9MAKXd1/tRaMeuT+G1+mgao7Xc2
 udcoiO7fzcqgd0zkfg/Z3gCuRaD8Rb3r3UgNBrH3fuOQeUEWvx6qsYSexmkcVIjlSSaOclPlkZT
 xq2+ogIPcL2qhr9z+Pw==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695f775d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=H4St_WrzmzoQhtTZYGsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: YQ8VF05j8mXJ27W_8_aBAuQKjMQ2FSlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

On 1/8/26 9:55 AM, Konrad Dybcio wrote:
> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>> WLED4 found in PMI8994 supports different ovp values.
>>
>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> Likewise, I reviewed a version that said PMI8950 instead.

We can keep it because PMI8994 seems to fall under the same category
indeed

Konrad

