Return-Path: <linux-arm-msm+bounces-85634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E6CCA848
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 07:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B40B53008890
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 06:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B9A23278D;
	Thu, 18 Dec 2025 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcc4NSt2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBgWGNjK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D0B19F135
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040312; cv=none; b=YFn7mzCDMnj8L1hJifHbF3oUiggmpNt1+ZP/qdub5rsq78Y26UolIXvLX3/HRvQ0n8rXKIekwLiyxfOKzksLr+fHKTDbblI0d5j9LGNbH5hJ41030aYsSyib6mFa6KaVDuPZmMGks5N/n46bsUukES5P5c9WrXYbLHqWIQfJbXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040312; c=relaxed/simple;
	bh=suKRnQNYdeGyoyC6DB1zHcHoG6qbFac0M6Ir4L2W/H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEtvNORHs99Fq3m4rhJ6wjb29ojxqM/7J3e5oGU5qXWXk64DHxwbPTc6J/yTycdjOHQQ58L9eSWEH3NTW1xldff7Gz4QAwKoUDVDdtfXoh4QFeqRS5Gap32n9Pdzy31K7eBdSjxj+c85CtxfuOXDTVG7uyPdjlDcsyTKXfoJVac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcc4NSt2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBgWGNjK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YZhi174300
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSDdbiYtEUpS7mUY7BVDsO0Jhdm2qeXYKfIAM1+6o0U=; b=fcc4NSt2hVERp7uk
	6TTxEUjYKN6oU9QOstmVp9tba+5UkfqsSlAle3F2hWQAQwKHPiXStn5kWvmf90DC
	siRewTqJoLDdeuJtIV9dtXrYYzAAUsxtlw2Suhp4KSpnIwVw4qrSbsPzLQIyvWhM
	fz+BB0Sqm5nTSPuL/VQ/U0uftsUWv7H/1OaW55NgFwtyOelhE/9oZKFy7gjPVN47
	W2kaXULznj4GnLe1kVnOvoGJH6UtY2u9YvkdyudU3BIG9kiSjZTMP063ovc2EYzI
	qooYh8Op4H7BQGwIcE0mLvuBsBbHnftGuGcEEXAAY8qJpoC41V9037kMxMA9M4cE
	UEh6lQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmsf5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:45:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso360392a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 22:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766040309; x=1766645109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSDdbiYtEUpS7mUY7BVDsO0Jhdm2qeXYKfIAM1+6o0U=;
        b=EBgWGNjK0uyxO3aQ2kBvaqPBIe5HwTFp7ngyzS/1o5AnkU8qW6gOc3uNDq9fxKpGcV
         LwAQTND16QL1Kh0BRqkkVw/q7ZCls8l1T5RDh2Yxh1yAD+NKWq6XIe3R7VYKD2tfFDjN
         DS7o76RObU65x+0jZVPFgry8Ply1Pceqju2Cv1iE8HVWAAX1IVZwKQhRlffIDrsha2S/
         iya7Gm8giVWCfV19jwZ7DdUuNSxlYDTg5AZMCUUKDKzoIhtvy//nowq9yd8XsodzhA5d
         pjfGMtzzZIj4UdwQA2tHDvKiOYv5ohWHg5hub1A8F9m6Y4RvQJ3EOmvElKj+nXhlff9e
         r9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766040309; x=1766645109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSDdbiYtEUpS7mUY7BVDsO0Jhdm2qeXYKfIAM1+6o0U=;
        b=IUVgf5sVUTqwcngZThzx/9gx0dbjKAMJRWSmfztSOERpfLiWe2mHUB9Gai3jBsW9Nm
         aaM8/AKeD8sizqD2AROQMwDDa7vpoy4/EpLxqave28WajGVO5DH/ei8UZ+NnOlaw5+lS
         SrvoCWWfvGRzplBHj5gs+QeO3xOF51V3izSwpo06SVGLsGI8eq91+PRWLV63YWFofrIK
         718KsekyXlQFN06O4vKZB6WtGfSdCH6AHnrM8b556pl94i+GuGph2/o2t8x8L3hWAQ5R
         gvd2yBbRdMzXl4GHxSOQJk9o+ZMf2QN6IfKlqVYbpNU6y28V+Dp739XIV4oyRZz42VNQ
         jNBA==
X-Gm-Message-State: AOJu0Yx8myg6rODwRgNstvazDAJaNjzLWs5g/8nh9Qnq6F9X/tONgH+S
	1oECjNtQSUiE0FLhurlIN3FVq1iwiZJEsX0rfwM2bjMHONaqfqbYY2PaNo9cBjgqeyI0YnFZRuS
	9PXowcILOhUUlL0TpeVxL+B5ILxN6keN0n7KsKnfBKkTEtptViuk56DzX+9YWeEaKcdwP
X-Gm-Gg: AY/fxX4A5G391hG75WYyyTbMlXJbPosI1t4AWiO3GERd2YOYk3BCeoqKMieV0uOty4H
	+c0toWETCj2j8puWwVQj4zU6q5LwwMJP/SpdV2z5tNJ47Njz1++Po6K3e5B6MOlTV8Rv2I9UN1R
	81Qri2qnSjufbnCGP98hK9xU4GztzuEMkju9MlR0q5Z/4Pt34BgXM7zwwH8HrmV4muPNP0WueVR
	pZ+OfpgTT7wFKO6WXxx2WgBtER9LXR5tj+dWh/p1RI+cD2bibtvHm3GWBROy++jsyPVW/Yr89oW
	egqdG0zFiv1eyBFnDL5Hy+fEzMjkEmc316Eyndct9uP+D3YD1szX5zAUJtAgH/zp6RELfM8zxvy
	9IqLqwds98HRGbR4SaZkBzj110Y0c30+EWVVF8TM=
X-Received: by 2002:a17:90b:1dc4:b0:343:87b3:6fbb with SMTP id 98e67ed59e1d1-34e71d81803mr1643342a91.8.1766040308977;
        Wed, 17 Dec 2025 22:45:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3KIb3Ayq9x2p9J0OGdRh2YIBARvX6DEihdejzksIxAf7/eHmiMnzzR9jmtUPDmSTozKKysg==
X-Received: by 2002:a17:90b:1dc4:b0:343:87b3:6fbb with SMTP id 98e67ed59e1d1-34e71d81803mr1643326a91.8.1766040308460;
        Wed, 17 Dec 2025 22:45:08 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e745301d7sm1290111a91.2.2025.12.17.22.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 22:45:08 -0800 (PST)
Message-ID: <cd8946c5-3cee-4d43-9e49-f765dc965ece@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 12:15:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: qcom: x1e80100: Add crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251211-crypto_dt_node_x1e80100-v6-1-03830ed53352@oss.qualcomm.com>
 <15276b31-8189-43e7-b619-76b2f85380dd@kernel.org>
 <62930036-f817-4051-9657-46c1786287c5@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <62930036-f817-4051-9657-46c1786287c5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PgpoB8CvIt1Ej-g6lVRrUIGjMU_XZrXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1MyBTYWx0ZWRfX3PnUrqidxX0s
 RLP96TzypfqXvMn1vPW6akwvMyC7m9i1g+xwLph14em+j5HSwK6BJJAYeBZD19/wrGla1bkqSXm
 QrtmpL5Nk2jD8RBycSVdhvCIgiQshukzKkUKGiugLdDC3EJcxNscy0fL5iDdQDJ5cA9Fi2ygbxv
 TD/1AO+kgI+yoOxzY3vGWQCChK8UQlEB30Y8dFrYjt2842sm798jzXi3/uHelbenixp70DD+5/4
 ctFRlVmHgqB5qGvnV3rpWauax60u/Lujj2ANcKNpO416RS4rTOSxhrAdtDzN7giGcBdCVwIJjYi
 RIZ7z7bPMoFWiLP045IJEHlDV4SmSuR+WqgLAXjHS2Dgzl5Tb0pzlfkI8jbcqytf860W7ch5xzK
 mzNybo2x55tkg9TiYIWbAQTUNTgrug==
X-Proofpoint-ORIG-GUID: PgpoB8CvIt1Ej-g6lVRrUIGjMU_XZrXB
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=6943a2f5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MvjmYbydH5IcS7raEd0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180053



On 12/17/2025 7:23 PM, Krzysztof Kozlowski wrote:
> On 17/12/2025 14:53, Krzysztof Kozlowski wrote:
>> On 11/12/2025 09:49, Harshal Dev wrote:
>>> On X Elite, there is a crypto engine IP block similar to ones found on
>>> SM8x50 platforms.
>>>
>>> Describe the crypto engine and its BAM.
>>>
>>> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>> The dt-binding schema update for the x1e80100 compatible is here
>>> (already merged):
>>>     
>>> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
>>> ---
>>> Changes in v6:
>>> - Added Reviewed-by tag from Abel.
>>> - Link to v5: https://lore.kernel.org/r/20251210-crypto_dt_node_x1e80100-v5-1-5ad22a869a56@oss.qualcomm.com
>>
>> You just sent it 7 days ago! Why new version? Please relax, and help out
> 
> s/7/1 day ago/
> 
>> by reviewing other patches on the mailing lists in order to relieve the
>> burden of maintainers and move your patches higher up the list.
>>

Apologies for this Krzysztof, I will take Konrad's advice here to not
unnecessary collect tags and resend the patch. Will also try to look into some
reviews and see where I can be of help. :)

Thanks,
Harshal

>>
>> Best regards,
>> Krzysztof
> 
> 
> Best regards,
> Krzysztof


