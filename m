Return-Path: <linux-arm-msm+bounces-77706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B91BE713D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4D12035BAD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7492B2701C3;
	Fri, 17 Oct 2025 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mkvkb1I3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067E82641FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688921; cv=none; b=F/04tx8p4FjgI9E8U4B/ZyN9QbpeXfajTTuFMYIya3kL5pW+v79kCAAfGyGRgKmjfOX5B+B6PaH4sKMZVWv+AHLRFJhUKn9OoFkrXINYUayMTUOClji8LO1o81mGsygiVmAXzFquMbn7d41i4Q1iQ3Qm5VhCB4tW3ITTPnxzIiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688921; c=relaxed/simple;
	bh=355ZQYXr0SrpXqcff5ZGYy2ocVo3QN1cz60xyMzgrNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7s+OxKzHfvn2rrueTxbP9TezCLjtV/GeB5PlRtvSlpMZV6H9YB6R7UpPZP8qAHvs9KXPcsm8m5MmBlr5GQWn3KBlEBg1j3lOM95cVpVrQBQaqcmgxz2dDZSShp0bmeBtvXvXhMa0471OtjjQi3PxD3qXjvTyISLNinEQKDwCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mkvkb1I3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8CqJV009575
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YH9LQ4opbrfuJGfdLV9HqMypIACkhbjKtURAqLKFt/4=; b=Mkvkb1I3MlwPJEBQ
	66u9AJqRdeR0TJJZTusSOV1YG0xjxHB4yJynHCeVrX13u5Jm+wc3jNUgPKHhNql0
	hEN5cci28Sm0oilDpagXP/GHWfFag4ocpucieEkYggw3KcLas7FovdyDy8GiQA3J
	rusFchAchzJPSt3qvBSvxpeAgwl+CuW2PMHhbkY6jW746quObgtTOpEJ3C036VzF
	ggIKD+zLw4kKsBW/xizl+XEjHd+5dOOqOOt/BIl1qYlI+sE0J62C1NoOtUtahxw2
	L9H7MHOilMzOsE97oKL5v0UlIhm0L1P1jVKl6YCag79XCXLc30EySXaAaP+NBdhE
	Lsj7jA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cbafj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:15:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88e452b04d5so52906085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760688918; x=1761293718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YH9LQ4opbrfuJGfdLV9HqMypIACkhbjKtURAqLKFt/4=;
        b=lf1Bj4eMV0dASTuQRmwVXljh5yS/bcQh/ElrqPwa0uCMWkwsnFvdbvK9lkNKzrld4L
         M5LBBdv5tvZvM+EkU1/w3wDJSGnwndRy+R2Clmpony7LT4Le7VpdjDluGQJN82+FADeP
         1kbLDayhc3Lef2hIMnRYf1LKvO3KWT7urShUrZW73JGpg5C9XrkJ26ghUHBiSGW585AQ
         0uw4QKnUToGvN441wzxEoaWGMeuYcfYfbrgcLhheX+5vsujLpz48FvoK4rmVG3bAlgHC
         lEYyIAUFdEB0DNHmnh6NANTGyOKugaxUhWP8g2U9eGel9aS9X3oN9hOktenEb2Cc7MfU
         y4dA==
X-Forwarded-Encrypted: i=1; AJvYcCWAsa/fb8zJ6QMBEWJ67WdLBzE8psqYKCOgz9vyjHDtJvGrpnoMcR5IWqpDObHWaX+9rTcDybgNG0Q3a9T+@vger.kernel.org
X-Gm-Message-State: AOJu0YySkNAvtyPYNv4Gg0Lr52PZPK28PMwQIuAAK4Qlk8xn4GmhHb8Z
	po92pBpRsEO+rGul5JBuijSvBAWWb91ZF2JYB0MLjVVk7QB0qdr69qiOBNMa7ZF45n+s2xqWvs3
	u+BXn83hytxVJ83RQVHD2WZ//uy8swc4+EtA/vRGtdaOqbmXzZ8zmTPrF+HdnxReGmUpi
X-Gm-Gg: ASbGncsr8qp6fIw0IuVsHOEnC5fYG/Z4XG8epCJ8/nT+dP9B4q5cvBDMQ7Cx37ZqxdE
	v/blIlEOHjzIPPD0aYsgANuCfgkzKl3I1wHbNLlrwQubuUxSXLRBWWUyoOqeMQSeFmJF/pLvVjf
	qnMYjyT28FzWlUvQwednSN8RaMlZ0j/Q/vaWLuJueE/SfBqp35NCAdp91jmy/NAjMWPqHOgj16o
	lEKtwV1v0zLV//ky5JagxjZK+lkcer1r4dM/3EIYOAKodotTMjWfIDN76YxJlhsMBfAhu2gzwfI
	DPELCiJai8Yyq7qXUjLjvp543rkHBb+wfeKDqGVFpFU7t1qIwXPY+WYs0FBgtqNb8peQwnhKUjn
	VL9oyw2QDtf99OIlIoRN2q7JltcviHUKGZJQM1JxH8TDUlKnKmBKhgQW+
X-Received: by 2002:ac8:5fc2:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4e8a0012877mr15378991cf.7.1760688917701;
        Fri, 17 Oct 2025 01:15:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW30Y4pQiOAyQMWLPe7O4NJYBXWqsckHtEv47TZ7+NBWOm/H3wXN4WXNlx4940VABaCGsNSg==
X-Received: by 2002:ac8:5fc2:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4e8a0012877mr15378691cf.7.1760688917157;
        Fri, 17 Oct 2025 01:15:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c2955aff9sm1041827a12.7.2025.10.17.01.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 01:15:16 -0700 (PDT)
Message-ID: <0a9874d4-29e4-477e-a675-c4534658f9d9@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:15:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>, Taniya Das
 <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
 <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E8blMuzilUriPZdFUkqeSUu1koq5lXpA
X-Proofpoint-ORIG-GUID: E8blMuzilUriPZdFUkqeSUu1koq5lXpA
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f1fb17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cKZz56y0KD5bUEMw3qMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX6+mv5iypHknn
 AD94jGthtd7HLADnDliHudYrztPsTTHk3IeZDJ0D7zZyAU50kMpf22APS0Apubh9WHsk8Qw2DgK
 MFrVTDcpEf3VnpeyqKLDXDOkYV61Gu8MJ2f4jou4Q7NLcpyPa0llAmlv9sR1mZcuG+FkxzdZwP9
 qDDYe94G4L5yyfjKhhGlXzrrk4zKQHmqKJQE5vwyhPO6QvJqNIFDKuJIGu0boV2KFHSxCEyzdg8
 //revEhW9GbvDK0U4uARc52UShVEO9AmZPnQTbrsUaIsRombFPQEUoqj4iVXP8xFT/OB8djBLCT
 UHIvGmvl+oyzjYOfY2/ypFLPXjRBuDAo/Mm+IMaW53F0AwlHSH5uiQq4vAOKMQa6KEVlpzHjfvJ
 NQ9BsoUdHzYCD7ysGfTYAml1byuuIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On 10/17/25 8:54 AM, Krzysztof Kozlowski wrote:
> On 17/10/2025 07:56, Krzysztof Kozlowski wrote:
>> On 17/10/2025 07:49, Taniya Das wrote:
>>>
>>>
>>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>>> On 17/10/2025 07:16, Taniya Das wrote:

[...]

>>> We have tried booting up recently and and that is what we observed. The
>>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>>> is picked from ufs partitions. I will add these fail & success log
>>> snippets in the commit text.
>>
>> That's not enough. You need to explain why UFS fails. After explaining
>> this, I guess bug in UFS would be exposed thus that one should be fixed.
>> You just provided band-aid without fixing the real problem.
>>
>> NAK
> 
> 
> ... and to prove your analysis is wrong (because your setup is likely
> having issues) I even tested now linux next with defconfig. Works all
> fine on next-20251013. You did not share which kernel even has this
> issue, maybe some downstream tree?

Is there a chance you have the TCSR module packed in initramfs and
Taniya doesn't?

Konrad

