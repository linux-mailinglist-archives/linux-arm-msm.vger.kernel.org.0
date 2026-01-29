Return-Path: <linux-arm-msm+bounces-91145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD40ARY3e2mGCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:31:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71491AEB84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC3A7302C325
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EDF3815FA;
	Thu, 29 Jan 2026 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4DcuxQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za8IGDbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4B37FF4F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682668; cv=none; b=GxGAvQxQm7x/zbTgdtg1Z0+magNhhO7f4meZwoCrFhh/zXQC3mhAWZ6jNhREO/Xv97sdmffqS1d/YmYj6C6nJqcviGczuZr6YWDKavYyfl2gh+JnWIn3Uxk0VHwCwZSE/eSEMNEsScnZQnc9plZSuTKX+m/eQxtsYsMkIyF6pFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682668; c=relaxed/simple;
	bh=XkREXN18oYpcEHCt3UYHXi8QLSEZBLLJvHaDRfL1S2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWJf5Q/IFU04hJlRR3pFCc6qubFmTZd/FPRvZfQIAt88V2lFeaC8jA11PjzTu+/KG2zcqpsniCZhuup1mteWFRsaTh8QYm8aTh6kOmbrxPOjkZBli6Hmzm1jLPeG9MRJZ4duP+shwSHXauWW6c08v9zb1aC6276GHldOq5s8iSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4DcuxQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za8IGDbC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAP6fJ3901035
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9svd/EiEWpgkXOKBXMg/GzEjc1VjYUs4bcAHK7tngA=; b=e4DcuxQ9fwvYErgQ
	Oyq9ho/xM9onB9RNJzzPBcqMHQwZ4MxOUxHbKKs5vXX4t7aVtHgwv7Z3EjCdsTz5
	fRrM62MqcqsMXzifu26tKi8qKpxXW8830Zk5tM7Q2GrW9YPp8Z3pYSiV8Yeu//lG
	GQv4BwyOI1S88eXp5twUSdJAtfka0dPY/MR3lnY4R/tyzTll5aZ4x8vRIpsT0uA4
	2Au04hZTLcKO7Sp2aMR2edRN73oRMMTpfU7E5x+8oMOs7QGN4858S8lAj9ufZZ/r
	O9FQeZFNqCMaJ7QqhpKfhTuUnmcYcKwKsHI0SYRuFH+j9AVaLpvVL62HW7G5+JS4
	3xD12Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05se80ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:31:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e518fb75so20431085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769682665; x=1770287465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9svd/EiEWpgkXOKBXMg/GzEjc1VjYUs4bcAHK7tngA=;
        b=Za8IGDbC8XtEM3C81GbfjwtOoyZ+Tj/+Hi17T2T8BUSQPEUuwsTfspodvpCBWDJXt1
         p26HulH999RcBp04hiiWy5IgviOzaDWwiql7Oqs3EEAGshRWj8shGnlWQuuBv2mKmdZz
         aSCcsnsW1UI7t3SzjEBGyaMtkl/zBPmjaIN20AWTXgQ2+j+ju1dZB9Ba7dERIfQrhiv8
         Gj/ou/u3Fj/tAc3/UKDTOGQWF5uebI+lqk45kSjv+/4fVAOGWilBHWJvxaNLUXInYne9
         l43IMmF51OrBg5wz6Nlh3V5dA46VtXrDjtp5LCM+9F8H5RxGn5S8PHIA/oX7GG8Qca6J
         nMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682665; x=1770287465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9svd/EiEWpgkXOKBXMg/GzEjc1VjYUs4bcAHK7tngA=;
        b=cbk5c/NdONGBL7QnAXiRzXOqCuyi4m3LYszeDIXrlbNRJHdN/nTYN630eyeKoY7tXu
         VbbiCi2EXnAXx93gds5PB/lgivlpDRb/vDhacHZSa6qa4TmxwDpwGhTs7b78sazKyGFt
         W0Iu426tj/OqflIPs/iRFNx3iu3I1F1EsVMbC6aA8ARlPS4CCTYXifmsHh40bTl/Vbw3
         q+x5no70gbZjK1a5rjwnzv4tC/GvCkKQ26pj9Ne72h6qe/2Q086KPA0nNcG2Ku9aguR0
         Gd+l9Gv6U1Yn8WHQr38Slph/wYgWX5ELCAuzrngP/JzR2KNyPW4LFbq/kPV9FPyktAx4
         4Mkg==
X-Gm-Message-State: AOJu0YzGtAPKKOPpKVrRv/JYp/GjUHjnxPIPuK5M7N6mF1OaUyNDg7BT
	9AXTUJK/3rYDfhz1nwYeeLssHGeagtQP0dogcEe7CLDz9/WxKj0LEtVBSy+Cs1r7o9x+5bzGLeU
	pSMg76PjojrrpwIKtf2vAh/zmbJKRYvVXW6+BokBFB3L1K8tNJly74bPsXPJfkvO4Qn2KZIsMIx
	co
X-Gm-Gg: AZuq6aLNEKRTC9LF+27wnI4N33pGJp0k4j0gDbAmcNmbgwCie0nuxuPsjVLJEPgyVMI
	U+q0sH0qgNjkE5i0mkHU8jMT+Juq4ya8p4vXSYhS9B1f0w/J+ojiXzSdbJki/Mp1nUoyosS3qQ0
	5sNGUBj/5p8S5yFMiosf1q5e7zpO2STWf8gNln670ohmkz0HjjzjD78EookT/2vg8MhUaCke/Av
	T2uYmh/4MtD1frlVLFU7H6JdteB6LEIxCMJmNiJZJAHI/3cKQUIfLAby8/P1h1j8/nPLZB6YPMc
	+Eo1T+1FXViAScU5+ogTxwQYmmkxbfxw7dIIwbH1NiYybcd3QuXMiYcmx85zOUBdGVia2IYyAKP
	fPjUNKh/HOntaSHjnWWoaOFSNd0U2f91dWdK5q8UTyGh4J8E3Ughwf49zldy8UOq9ho0=
X-Received: by 2002:a05:620a:700b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c71acaac8emr323737185a.2.1769682664908;
        Thu, 29 Jan 2026 02:31:04 -0800 (PST)
X-Received: by 2002:a05:620a:700b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c71acaac8emr323734585a.2.1769682664418;
        Thu, 29 Jan 2026 02:31:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm246010566b.67.2026.01.29.02.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:31:03 -0800 (PST)
Message-ID: <052f8def-8c6b-4644-a3a8-f7706189d76e@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:31:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt Add PWM vibrator
To: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251211-expressatt-vibrator-v1-1-41bdc47217b2@gmail.com>
 <821a7dc3-7b00-40d1-9332-ef57ad22f9ca@oss.qualcomm.com>
 <d2e3face-8d66-4136-a40c-635a1d055b2c@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d2e3face-8d66-4136-a40c-635a1d055b2c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4XjYy-SY-kxPwoM83WvLu7zEMWS-PXl0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2OSBTYWx0ZWRfX0aJ3K44eqRdw
 8RGDXI4tOeV7x1dXopr0ImA8oVXRvBKS2FKqSA0DSo4Q70iAZmeyojBDddP8hx78KKH1vXqXvDu
 DdlMI3E+GgcQoUaxyUQTOo7k0QZWyvPyi7IifcWKIOGa+g8CEnbqIGvY+oXx1xtpYtHWKLGTA89
 lxRLyw8x7gabFIkxDIT1syBD022LnzNX5Ly4dp936dElbJPj4Ga/7xUjueQQ33EIpGJQ6pT6HbN
 E3kvzkDtVSE2BtLxl5YXO+xmSTwkaNx6W+4Gy+gVbvntUixkvp+MGtYIKgUu1Yc1aDcNdgbc8Wz
 4k3V39KXsJG1E/rDfovY6xuUfdHrEoSLntByzdLC+iMAP6ud3GmMHW4f4v0KsSDKiEdSIf5n0/8
 dL4cE+JWSRuOlbWOOhOGVoXDixBYUQtIHNqv/EefWXgKTPAJEFwQr/fIQFrHgcrIMTorRWxPHNd
 Y+Lo9FeXUFXuMg0plBw==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697b36ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OQN141zOAAAA:20 a=SXzkmgPmAAAA:8 a=pGLkceISAAAA:8
 a=vxeA4uQXmPMP3zgDk90A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=EWLf6cg6Bh5aS0AxDgDu:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 4XjYy-SY-kxPwoM83WvLu7zEMWS-PXl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91145-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71491AEB84
X-Rspamd-Action: no action

On 1/29/26 8:55 AM, Rudraksha Gupta wrote:
> Hello Konrad,
> 
> 
> On 12/16/25 06:22, Konrad Dybcio wrote:
>> On 12/11/25 11:23 AM, Rudraksha Gupta via B4 Relay wrote:
>>> From: Rudraksha Gupta <guptarud@gmail.com>
>>>
>>> Add a pwm-vibrator to expressatt. Currently this vibrates only at 100%
>>>
>>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>>> ---
>>> Add a pwm-vibrator to expressatt. Currently this vibrates only at 100%
>>>
>>> Link:
>>> - https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-express.c#L1767
>>> - https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/motor/Makefile#L5
>>>
>>> Test:
>>> =====================
>>> samsung-expressatt:~$ dmesg | grep vibra
>>> [   79.892226] input: pwm-vibrator as /devices/platform/vibrator/input/input4
>>> samsung-expressatt:~$ fftest /dev/input/event4
>>> Force feedback test program.
>>> HOLD FIRMLY YOUR WHEEL OR JOYSTICK TO PREVENT DAMAGES
>>>
>>> Device /dev/input/event4 opened
>>> Features:
>>>    * Absolute axes:
>>>      [00 00 00 00 00 00 00 00 ]
>>>    * Relative axes:
>>>      [00 00 ]
>>>    * Force feedback effects types: Periodic, Rumble, Gain,
>>>      Force feedback periodic effects: Square, Triangle, Sine,
>>>      [00 00 00 00 00 00 00 00 00 00 03 07 01 00 00 00 ]
>>>    * Number of simultaneous effects: 16
>>>
>>> Setting master gain to 75% ... OK
>>> Uploading effect #0 (Periodic sinusoidal) ... OK (id 0)
>>> Uploading effect #1 (Constant) ... Error: Invalid argument
>>> Uploading effect #2 (Spring) ... Error: Invalid argument
>>> Uploading effect #3 (Damper) ... Error: Invalid argument
>> Looks like this is because GP1_CLK does not implement .set_duty_cycle..
>>
>> The downstream driver you linked to does so in a terribly hacky way
>> (from the vibrator driver and not the clock driver):
>>
>> https://github.com/LineageOS/android_kernel_samsung_d2/blob/cm-14.1/drivers/motor/immvibespi.c#L53
>>
>> Upstream, we have an implementation for clk_rcg*2*_ops, whereas 8960
>> uses clk_rcg_ops.
>>
>> They look very similar though, perhaps you can hack it up..
>>
>> One thing to note is that you're passing GP1_CLK to the clk-pwm (as
>> you should), but we need to do clk_set_duty_cycle on its parent,
>> GP1_CLK*_SRC*. The framework will take care of this:
>>
>> ```
>> --- drivers/clk/clk.c
>>     if (!core->ops->get_duty_cycle)
>>         return clk_core_update_duty_cycle_parent_nolock(core);
>> ```
>>
>> so long as you add CLK_DUTY_CYCLE_PARENT to the child
>>
>> [...]
> 
> 
> Sorry for the delay, but I'm struggling to get this implemented. I have my in progress work here:
> 
> https://codeberg.org/LogicalErzor/linux/commit/4e7f94d9fdd1e4e1d688b2eb518494d710f157fb

The changes to drivers/clk/clk-pwm.c are unnecessary, you're using
clk-pwm (PWM implemented using a clock reference) and not pwm-clock
(clock implemented using a PWM reference)

> I was able to get rid of the -16 error that was getting spammed when using fftest, but it is still showing
> 
> Uploading effect #1 (Constant) ... Error: Invalid argument
> Uploading effect #2 (Spring) ... Error: Invalid argument
> Uploading effect #3 (Damper) ... Error: Invalid argument


Is there a chance you can pr_err the entire call stack from
pwm_vibrator_start() downwards and see where it fails?

As a guess, I'd check if you're not hitting the EINVAL return path in
clk_core_update_duty_cycle_nolock()


Konrad

