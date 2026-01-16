Return-Path: <linux-arm-msm+bounces-89362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 19142D2F109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F407300FBC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89DF1FBC8E;
	Fri, 16 Jan 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAfuvwPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4wF9Rjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4622173A
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557155; cv=none; b=UmugM8JviwthHwqqWCJidmj12zyQ22tMDOGmU23T6E/uLmPGQfLmhDhNWV+LJhRzcrCW5WF+r7xdgcNvOVT7dZ/Ta11+pdlsa4db8SXbGisWtTw9vRpCDx+4wJzzOqpW2wwKE84kg/dj9CYNTW59YuwzSDcQNXJNovsYuIX7NGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557155; c=relaxed/simple;
	bh=XFZavRyoo/GcZ+nYMEPWIrtkLwaggwm55zfwFeWAdxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dR/tSmpaKkCXKXdeSV/r9uGpMOrvZ/TQ37Q7Dz2uMAYwa6hWrg0nH5CMjgPDhXC0cZ9AdAfTTEq5//TkGfJec0F1IwicWWy685x1VIrIyJS7bm/mzk19wPKodiBIPh0wPEqUc/6XXh8xn2Svzqq2B/6r3hjzevSHemSGB/UyaRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAfuvwPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4wF9Rjz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7x4Bh4100987
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgzvyyUoS1nt6OXKkWlbx24PxE7R3inU1X13PpTUzkw=; b=AAfuvwPEJzTXI5rK
	PIzCyupyzO95egByORyS9dAprXtfsii2X+Up6a1+GRWvQIa9HAKuokSFsF3dYWLi
	5NvJUUwoEGGQbbaDY0iq/4QTeb4l+SzRc9J/wRRdQ9gR2zoahLPRgfF9FDWX/sDm
	seFDcOOZyo7D3m/kIWqgzJYHjrsNlNL+hKGKMVBqYoLOmLs1jDA+sJRLDjBJn+VM
	YpT2lwSLzcGXwlbzUVxUehyNThX3TGMKrmIC56N94P7xPwy37hjGYK1dcjgJa6x0
	8iy5QrX8kePbdiJtIHRJFIAyjXysNnMa2x+E6EhEoTP4IRgtRcJiacj6fys/6PKq
	EEsdsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9751p1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:52:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5265d479dso57863085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557151; x=1769161951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgzvyyUoS1nt6OXKkWlbx24PxE7R3inU1X13PpTUzkw=;
        b=H4wF9Rjz7fBxh5rGoT2hcTHsjd32DuK4aXUm7Yrp+uDiACKI4JU1rZO80ayyMoBneZ
         hAq9y2yPojVNIeknBEjkmFSK7bv6WH4dt/U53rqeofnVhY8CAp3qIZov1h/6BT7XOCU5
         SYjLMqqxlmGWFdT7fPri3HGko7orZjkLzmjM+u47HYbuT6jbsFyjzRldxdQ9R29Z4Z18
         uLaItDxX15aNInWlXrE6P6mVzQCHtRv6gJoLIVJhi6i0d/a/DjTZbl1Kblipyytetrsf
         jw6s0ZzBc+9IuOsct4VlvTSuaX15KFx9Kj0YhINXbgKzUH85FDtQLGP0gmE28mAFegzm
         9omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557151; x=1769161951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgzvyyUoS1nt6OXKkWlbx24PxE7R3inU1X13PpTUzkw=;
        b=Pwpgo04qSbT5G5ShkDv2/LrfhTZoIR/dx/TcfqBzK2HuTWxjTyfoAzWeLZc8ASPzz6
         wjIw4I9L8yVBFfD8uQRpENDpQ6oF17egYF075KHQ1nsYV155izsjCQEOwj+GFX5gdGl8
         wblZTo+9I1Dt2OLqkKs2sIaVUli7Xi/LKhj9DgXg/5rcNTE8XluSBPYTdfRM5AqXnysf
         gdOuBbjewJ2NMeFbGXAA11TE7iAVS6SZ+04XoSv+Azhc9U65PoYosZPJ8ZXZHSxedcZy
         TCpo6sGtdwlYOCdjPzx3eyOG0SuuwdIUMeFqckeCWPnqx5OeVt6XWbA12mq18jbfdHM8
         aM4g==
X-Gm-Message-State: AOJu0YzeFyMvI15M+l/1goUKfAkmPhZgFSNYdnThv6Rg1PqcJfDUnifH
	LRfOMAZJB7r3nxP551KZEuWmDg/LoiA0Cdc1Jio3FSOCn3tCyvvdH2H8BBEwT5pc9JRGIpacOR1
	IHzFES/rjV6IdQm/Na/BKkaen1kIZMf12qy7uB4TdsBnIeGzfKsQaSdGeCYDhYU68AHRT
X-Gm-Gg: AY/fxX4ntL9b272cJS2LqHAfqZP5GxMh2HW9ldW0R4osae17iv/14vpTLxW1ilgS9Xg
	b9Rls9J11baeiJ6SGL1ejE3NtkqwbgW3m3OUK7QuG30BW9mjwrZxHaPt5ZYYL10gGLWKVHt5mwX
	0CkYK5RvJTBWVBcK8LV/kDKTkb+WiwbfLC8MwAwAYt/c9GVGhwWozwqum4LzWWqnUqr+k2yPyA+
	qi7SeJhS6XRUx5yGe0VnAcJJey44L0ZIM6FZEvD95MiTKsgdxFHmsBzR+ZTRkRhJMYNiNwv6h8Y
	kYboWKQreX2DrYxpYtg+oT46gR/ls3wxB8c3XMc4KqMsdCWJTF20VwMChFI+lbHHMyd82QKS5e+
	OrXUOn0/46c4WZ5sRjRzAy7fjtm12TU5A1dabcuZg/VRag2rASdLKpeCMOMe8mLdbpU8=
X-Received: by 2002:ac8:5e47:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-502a1633ca4mr24349831cf.6.1768557151469;
        Fri, 16 Jan 2026 01:52:31 -0800 (PST)
X-Received: by 2002:ac8:5e47:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-502a1633ca4mr24349641cf.6.1768557151060;
        Fri, 16 Jan 2026 01:52:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm188219166b.60.2026.01.16.01.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:52:30 -0800 (PST)
Message-ID: <e0f33ac2-331f-4ab4-a960-6bd8bcac7306@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:52:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: David Heidelberg <david@ixit.cz>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
 <723357fc-a785-45d6-8d49-4c00dd4f340c@ixit.cz>
 <ff4d697c-2007-4b2a-b66b-dc86053a20a6@oss.qualcomm.com>
 <0da3c96e-4f20-4bd0-836e-73d20581954f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0da3c96e-4f20-4bd0-836e-73d20581954f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfX6t/OFe6NUGtH
 AcfLoKp63xay0XkmhW8PXM8M0Ahb5Vyk1EZYRpezWmOeZga60nJMfU3wxpm9R2Waswh66QcEI9G
 UzGxv7kcD7vjvBJzRCEOfFuXTMqgXArYWhEAX5VlY1q7u+IL8ZSv4WEiChBVq+ZtqpM6FY5Co7d
 S4nWpFqfbs+ddujo2IF/29OOCRFAQADnXmTqOnCSKqydjNlYtkDCqXHhWGh7TLmdrQBupgeX0rJ
 8249LAVCesi9mVr2Rv0UDT70ekna1ZiGnGXjw8fLzI4Bc1bWHctbXDGw5TYDC+kmkkQj6kgsOvp
 8JbG4Od1GT4FobvaNVRK+ANxbYnX1j/pWaGbC/dSVMVbu2gqh+WG3V1is/rTRRHfKsIHddAPG6a
 s2/CLR452g8jx+JiZ6SYGznYEgSclPZTVJbwSyPzAp+OpSXMSbs4/G/8pim1BQDflpBwbIZ/lKH
 O9w9NgJ1Awem9cdCJXw==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696a0a60 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=4BfmCM-U_7t85Gwu0wQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: lGfylr0vM4wHpZ4Ryx1pj_b7VQDxxCRZ
X-Proofpoint-ORIG-GUID: lGfylr0vM4wHpZ4Ryx1pj_b7VQDxxCRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073

On 1/14/26 10:55 PM, David Heidelberg wrote:
> On 14/01/2026 11:28, Konrad Dybcio wrote:
>> On 1/14/26 11:15 AM, David Heidelberg wrote:
>>> On 12/01/2026 21:13, BarnabÃ¡s CzÃ©mÃ¡n wrote:
>>>> The device was crashing on high memory load because the reserved memory
>>>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>>>> Change the ramoops memory range to match with the values from the recovery
>>>> to be able to get the results from the device.
>>>>
>>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
>>
>> [...]
>>
>>> Hello!
>>>
>>> I suggest one more nice to have improvement:
>>>
>>> you could label framebuffer cont_splash_mem since you already touching the node and testing the series.
>>>
>>> Then in additional commit, you can replace manually defined `reg` in chosen > framebuffer node with
>>>
>>> memory-region = <&cont_splash_mem>;
>>>
>>> For example you can look at sdm845-oneplus-common.dtsi
>>>
>>> Tell me what u think
>>
>> If you wanna do that, please call it framebuffer_mem, "cont_splash" is a
>> Qualcomm-specific name for (roughly) flicker-free bootup
> 
> I have feeling someone recommended me to stick with cont_splash_mem.
> 
> I think, since we'll be doing the mdss reset anyway in sdm845 (which I used as an example), I can do the rename in our sdm845 too then without any harm? (no it's not flicker-free takeover :D )

It's not flicker-free because the OS must cooperate in that process,
whereas we currently reset and re-initialize the entire display subsystem

Konrad

