Return-Path: <linux-arm-msm+bounces-107736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIlcDMTcBmp4ogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999754B9DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 483D130EF877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589E93FCB09;
	Fri, 15 May 2026 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIdPpKcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhP7bcW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1563932EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833955; cv=none; b=ZmzWOxRnV0gGeFeYPWJ0bY/uN5KjUXcekX0KWMD6spdFdZFFQ/yRHlos3rZsB4Y8dJ+Qo2mKnMwQB5XdNiSFZfLamQrlUsVluDGtH7od+TrxtngquUbP3r0U66Fhs7KybwnjtjE7zRPygpxHfPxwVrrEipfZ8BR/VoiaVxasSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833955; c=relaxed/simple;
	bh=2KlkGNOF7+OvLv0cTbiSK1wSmJp3z+rBZspm5oF/ITE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqUPSTIQGnmD7o28UXPLXOZhm22fN9lqIHHKQz9FC/1DoLjqdTz11ZynZXffHwosYSRplOH81Oux8qBr/ITLlH2rylohz/xvIdBv3x5Mlpu33IFzPtu1LmwWiVAA2Rgpqgyka2/TvJJn+HCln/97i7LX0JuP0ncOaZ0dkQplCqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIdPpKcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhP7bcW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5LptR656082
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ypc5cw+aeh2+Tg52m6j1/NuUMBslXu/qMIh12tt5Eiw=; b=DIdPpKcYHKUcSHCH
	HDORyNMxjlg9kkFh3FyJ42jpvMjAXeN57c2rE6lk6xD2GwgsgFK75UwbLARwJ7F2
	lPw6D88hRbpn0ChQNQXYr9aTTEC5+w1Lw30V8fw5vIXlbGeW3YnulCisIEO/b7Wn
	LxxhIbbQ6aKdgUFL83Ef7PTdTQXp6FzS9rlm4k4yykEIfPX/kbWqBVY20EqtNk7X
	b1xDOTTdKo4qRdHTmdGJL7A7MzyTTwfR1tM4YUbfwL0CfOrBCS+I7cTNZjx/JDIp
	wgL2IhfXAEzpH1oVMWVtgQu0iU9VPVZZvLdVJ2Ty4I0kr5ChzUYEzH4Zfyl0jRWA
	CQRm8w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptf4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:32:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so5995660a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778833952; x=1779438752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ypc5cw+aeh2+Tg52m6j1/NuUMBslXu/qMIh12tt5Eiw=;
        b=QhP7bcW+zwwLND5tsK0SjtwQtSnGHx41Fp+45MFJCuzKY0ax0YBEacDZ8vZTqSH8xi
         8kGE8+LKYLhvC0GrmcThjaXYeQl+AmuwalOYUhcG/E9q4qco+HGtvh1hR2be4gDQLnW4
         /xt6J31YV/26A1nSSlPtXL7M+QxCTL9NdyR8Cmg63GG/bt3CgCMMPI8zV6BectUeLdxD
         E5sTtgm4nulfENb1a7C40+3RRlobH3antoP58oT7gRs83BsNOIQorb+97ADopXiuFEiK
         +fvk6Vj2VTz09jYdAbdoKJ42+ZtO39RjJyhfs1wJXgLRDwAe9h7cak9fSxrQF8Mh2j7h
         P14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833952; x=1779438752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ypc5cw+aeh2+Tg52m6j1/NuUMBslXu/qMIh12tt5Eiw=;
        b=nzDhrE/rsPxp3/qPijAkOdZCtoQt7AEWBzoFnvHBreLKpSLwiEPxqnWgBUpFlERv+r
         8mTrC9dAEoSnrtgoENXsvnAr5lnAC3NlxGeAdcgVLNgvHXxRz2hnEBTq7ZsXSBXmh4b9
         +pJopjyb6BOi8R/QLcX7Bs3vq6E0EjottBzWUldIswSWAxuH2xHCrku1lhn/za7/Wuvu
         vEevyLxhrHrUPIfckUWcpzf4Jshxx49vYH3EtNZITRqOzmX8m0FhlLVjIM+yIsW7z4Ip
         H7plYRV2Lq5mXWTpWhHlagKhrB2fTXQFJyrHcPGMDnLyKdtt7Z3/53e1ntmhHeViQ/tq
         1XOA==
X-Forwarded-Encrypted: i=1; AFNElJ9JVPtuhBWWbOr0Y0lbMEX43jfX8WaKMp7Xx/52G27sxS9uDyKcJsyWnr8CkoxQO3g1tro7/ZHupLK0GS/Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0yX1XLvnZsyJeH5dYMv2DqHi25qr8vi7XPRCQ1lnmjfZ8o2T
	yt9AkVxl41Fw9/4JL7ixtot3CFgaKUpLHmd2Uexnlzgv1IBfTAcuBBoOqfbMQxUU1ojPk19RLBl
	Nz3DAGWrQ6UrogUH+Bi2CflfmIr+Kr+ez2jKe1TsP7XTz51lEU1P1ikyBHhNYE9/Rk4zD
X-Gm-Gg: Acq92OGq1aeEKM0RCpgSBIXwx70J/2r4BZJcYE8+V9sNuMdZrJEHJya4CLnGT87iPWQ
	tLd0F2OJekHx6DPrS3LBFs6ebg396VZASF7T6RIZRCWuZgP1pR1KqkDJ+094UC/TjpR7GZOrhSK
	tjUxo8CTdI2uKOrBI+JlafHqpQ6uE8qunLkpAcK41X3CB8kGgSSnduT4RuWOr+p30Z7OaSvhrG1
	CQ5cY+k4+Q1Z4bKCf+1BeCUVNWeEe4CjPItmOdvHm0aN2oysnf190umMubNDgi6RIW6OMaYCaPp
	Pm6Nq8THOUvk4RHN9kPqEjAtRmQN/dDuTFHfCe4bECCzCBZgx1JFLW9cyUYYj8sDvg5I9SyHkll
	F8IiSXYjuHncBEHx26OXb2S6SNohxCtC+w42266vOPaBUbbpMr0f0TpWje1SE
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr3166923a91.2.1778833952379;
        Fri, 15 May 2026 01:32:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr3166888a91.2.1778833951854;
        Fri, 15 May 2026 01:32:31 -0700 (PDT)
Received: from [10.92.212.183] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155b2c4sm2001418a91.3.2026.05.15.01.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:32:31 -0700 (PDT)
Message-ID: <5ad97e7b-f39e-44cd-b4be-86711a090d01@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:02:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-1-c78b95f53b91@oss.qualcomm.com>
 <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
 <8101e2c8-0593-4325-a701-84f776dd4b0a@oss.qualcomm.com>
 <eebae734-3b03-4848-a728-a29d8a210e57@kernel.org>
 <dfc3039b-c45c-44d3-85c0-0d131bb5e55a@oss.qualcomm.com>
 <27cc44d7-b3d1-4610-8257-4aad4115cd36@kernel.org>
 <e5552777-a449-4640-993f-5cf9bacbda56@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <e5552777-a449-4640-993f-5cf9bacbda56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ypv_l0PW4zeUa74LJDetRVhY9VO0tYFr
X-Proofpoint-ORIG-GUID: Ypv_l0PW4zeUa74LJDetRVhY9VO0tYFr
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06da21 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=nIfeAKEMkRZjI2vJ8KMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4NCBTYWx0ZWRfX4qrMNqhn/ZcD
 cfoukZfsEjGInBEWLs9IfgBDQDDw9CjqFS2I2jbJir6tBiGKnxqCa1XIzMbduh5GA2tdaUYRBi9
 c8tSXH+bTiuvyzlyGlZ1rPClur4if17Ord7ZHGzM3QWj7/v+42YDgffldkZ5dkcPJPxDsjoNkjr
 F/5O54/Zk2XpoIdiKHeNRRa6i7nYALtt6QAkbVws5C94x6DWi2tb+TSMoJjZgEELAD07tqH80VM
 l4YZyIWOSj538TY2GBp4sA014/dpXYk2Vpjin1Czj5ihfPTzvaxexTOHSn47bD2VXMbTL1hu3wO
 jusBQM0vTI1cNsK+JKlsF/MVm2bzEA197O5iyUMqJ6TQ4XMsMbsFGPgaB/Mo65UIXH33CwQNmVn
 QcfpwW4pWIHyaDYZluAhSxXXgFgBLo3SZ9yq85Id+J23hAuAqChn84Sfrry/+ucSErGNaOGi+A6
 3LN+JJtGpO1RrH3i+Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150084
X-Rspamd-Queue-Id: 7999754B9DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-107736-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 14-05-2026 08:13 pm, Krzysztof Kozlowski wrote:
> On 14/05/2026 16:39, Krzysztof Kozlowski wrote:
>> On 08/05/2026 18:03, Imran Shaik wrote:
>>>
>>>
>>> On 05-05-2026 02:23 pm, Krzysztof Kozlowski wrote:
>>>> On 05/05/2026 10:50, Imran Shaik wrote:
>>>>>
>>>>>
>>>>> On 04-05-2026 03:53 pm, Krzysztof Kozlowski wrote:
>>>>>> On Fri, May 01, 2026 at 12:45:44PM +0530, Imran Shaik wrote:
>>>>>>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>>>>>>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>>>>>>> qcom,cpufreq-epss-lite to represent this constrained EPSS variant.
>>>>>>
>>>>>> The entire point of having a generic compatible is that it MUST match
>>>>>> all devices. If it does not, then it is pointless to push that generic
>>>>>> compatible.
>>>>>>
>>>>>> I am speaking about qcom,cpufreq-epss.
>>>>>>
>>>>>> That's nothing new, I was arguing about it already, but now you have
>>>>>> confirmation of the mess introduced by generic compatibles. Solution is
>>>>>> not to add more generic compatibles, because what will be next?
>>>>>> qcom,cpufreq-epss-lighter?
>>>>>> qcom,cpufreq-epss-more-lite?
>>>>>> qcom,cpufreq-epss-high?
>>>>>>
>>>>>> Same was here:
>>>>>> https://lore.kernel.org/all/20240828203721.2751904-17-quic_nkela@quicinc.com/
>>>>>>
>>>>>> So that's second time I object and do object for every new instance. No
>>>>>> to generic compatibles, they are proven to be wrong at least for
>>>>>> Qualcomm.
>>>>>>
>>>>>> Best regards,
>>>>>> Krzysztof
>>>>>>
>>>>>
>>>>> Hi Krzysztof,
>>>>>
>>>>> There is no functional change to the latest EPSS hardware
>>>>> (qcom,cpufreq-epss) in this case. The Shikra platform uses the CPU
>>>>> frequency scaling block, which is a predecessor of EPSS and is referred
>>>>> to as EPSS‑lite. The only difference between EPSS‑lite and EPSS is the
>>>>> maximum number of frequency look up table (LUT) entries.
>>>>>
>>>>> This constrained EPSS block is not specific to Shikra and can be reused
>>>>> by other SoCs that implement the same hardware. Hence, we have added a
>>>>> separate epss-lite compatible and reused the existing bindings, as all
>>>>> other aspects of the hardware behavior and interface remain identical.
>>>>
>>>> I don't understand how any of this is relevant to my comment. I know
>>>> what you did.
>>>>
>>>
>>> Hi Krzysztof,
>>>
>>> The intent behind proposing an epss-lite compatible was to describe a
>>> common hardware variant and avoid introducing SoC‑specific handling in
>>> the cpufreq driver.
>>
>> And I already objected. Look:
>>
>> "So that's second time I object and do object for every new instance. No
>> to generic compatibles"
>>
>> I provided arguments for that in the past.
>>
>> NAK
>>
>> Best regards,
> 
> I already provided the arguments here:
> 
> "The entire point of having a generic compatible is that it MUST match
> all devices. If it does not, then it is pointless to push that generic
> compatible."
> 
> so if you have generic compatible, IT MUST be used. You cannot keep
> adding more generic compatibles just because existing generic compatible
> is not generic enough!
> 

Hi Krzysztof,

Sure, I will drop the generic compatible approach and introduce a Shikra 
specific bindings file (shikra-cpufreq-qcom-hw.yaml), similar to the 
existing EPSS binding, using the compatible string qcom,shikra-cpufreq-epss.

Thanks,
Imran

> I gave you detailed reasoning and even example why this approach is
> getting ridiculous, but you just have to keep pushing your solution to
> maintainers and keep asking the same.
> 
> You were given the answer and the argument. Now you are just wasting
> maintainers time.
> 
> Best regards,
> Krzysztof


