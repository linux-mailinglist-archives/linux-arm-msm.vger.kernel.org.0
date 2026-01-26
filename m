Return-Path: <linux-arm-msm+bounces-90494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oESsD9k1d2nhdAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:37:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DAF8618F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E3433001FF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A40B329385;
	Mon, 26 Jan 2026 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLlZTVeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1Ks9XfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7270314B65
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420247; cv=none; b=i4MJDyxshTlPuJ0VhvX96egdz03WdFzjj/KnmfvHhEQrHqeF4uUOBdC6kN/OzPLm2PNCCPMKBKixh+ZPk9fNr91XQnI5D6c8sNjICLr9xVgCPLR0UQq6MpXSMJjnKps01C3joiKVr8nCwW5eYPfuKB4Dppj/08Ejx/mwrCW0HBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420247; c=relaxed/simple;
	bh=NJZVeQnPritQ9oAgGk5dikPDTgOryU2d4aZrgv4Z4oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnH8vJokzLQQQXZfSC9yGzPaAEbTfm4IUaGoA5bfvD503prWNn7J2Df4cV+OxNqVj7h0q5zRzYlYlQ8CbHMM4vL1RzzMZPBKRld1BJ7amJm78rOjGVTovdhLvHsR9Pd+ABuYZgFHsxybr3vFI7RGUeCrFwoRCxVGuBocKWi7ncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLlZTVeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1Ks9XfD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q3Koat3596623
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KsPFZY4rHg8H76Rfdt7O2iLy2z7r1HBFt9GRtgjQUQ=; b=WLlZTVeJlKNrJwp+
	BdzfkxAAiMJGC/ikPFwlhVrAMDmdkGSRwm1GcLSbEPszItnPZm0oViLWPGRitALs
	DG3H6HhkvKwinj79EbEzR2egK3Vo+mOPQP/Jd+h5hCi1Jhv8Wh56Hl93Flex1OkB
	5SEzomx01sTlIdQ7XEp9DKjqAGCfUBCZk28GxNTPMUKieHJCWdpaNAK8Z4d4g+tJ
	xs4ihT6KjFUGX1hhAaY4MCd40IqbSbB5VQcHz8A6g1Wp9+cRQUfLI56VNq7MgKEU
	do57Zbfubtzc5v1ftvy0RibcXgUDKjN4L4iJ0jjDpYUcSLAPzQecP0Rum5nQZQUc
	2UJ5Lg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hc2tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:37:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so77576285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769420244; x=1770025044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KsPFZY4rHg8H76Rfdt7O2iLy2z7r1HBFt9GRtgjQUQ=;
        b=G1Ks9XfD6sjTlsBBu6YbGkp8eOyycsPSCcy+4YFI9lGz+Jr4O/TXf7s3/wiFeGib3a
         M/1IO3FnkaoProYTqzxfYk+m6Ymo2nMe1XFaqcnt/xXSempaA1nfJyBCK40KTj2y7LW0
         FBc/XsgZUbiCwCmBZX9AU62S2mOsP5Gsu3tmlcbuQlr8Me0culNX4PR7ORgKEoNSvyK4
         nkNIqJvK/G1s5UaBVIYII466v/QOw0uoGXV0rSp9dpq+bn9ifQCKAg80z0uZfs/1KP9u
         +PUfRZ1LJpIA2e6XAJ40IAN6ffjXuwMmnlvakseuLpG7tMtjEU5d/LPEkjTxYyAs6SUi
         A7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420244; x=1770025044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KsPFZY4rHg8H76Rfdt7O2iLy2z7r1HBFt9GRtgjQUQ=;
        b=BDWV9nPxLs825iuZHBBKVh/PVuLJxwYzIOKKO9TaVj37Jt7f/tBw3Bll366trxj8yr
         Mgo2NswBFVqlU2nUuoTpfUWRdVki6Bee+NZ2cKi8hCUsDs+HZbYe5FR8TDdizhSP6Mp5
         kCtSrOiA80fCo+9hATbaQNAs5fzwzSGde/a2y7J7p4yh6pDEcwsvHUC+ufe9QVqEd4he
         TY4Ml9q6oGSAcbIT1rwbD7FGaojDWnkyAnmrPc/KykLJVafqOV16VNjv06RYeYinF7Ym
         cMPRMhAoJEfXcat/tHjhMCW54mogeUOHe1LqKoFdX8OvU9g9jZOcLUzFATzgfFxgy28Y
         njTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyRI3WFPaVLhJj0DwOZcYLBo4E18hN7TlMgKhX8Nj+AMV7W9wfTwdM+H2kgrqrITeFmqSEtF5jQ5PYKtCw@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTAS/PUYKWp0dLCFii6JHi7ru6lk1jgj8lRggkAKgf1apjyIv
	FlRLgHv6Mxy231UqLO4RmmDZkl0S8kJfFiwUg05gHHyGeBMjLb6esoqlCMvGZmPusqLQ/EKJmIv
	fBibYZDNoZ0JeCEQbeo/yhaxCyheE+svAuQ4PAWp946mEc5OLfPU1fuoaW6v8DLmMM83F
X-Gm-Gg: AZuq6aIvKcPJG7zz0D2N8xSteDB2VZ0OncqMkJTbZc31TbxOhzplmQCLPdvlOudt253
	Qh46uni+GjeAjDJ8/HB12jMSHyEsUxilw3ecV13EYgQo1Fipl1p5eEN79F6M6EFhmt0r0JFGg4B
	2X0TfYM3QF7L5jJhpsTiYNvLUAcUIDubbxYk/oVZL0pWkprdYjIkD+0KNOAzSY4YZjVuW4W9Ci9
	fGLBvZZd8HCuhdvTqhD3qst4zrI1HawOhmbwaWuLsdeeAt+PF9s7t2OsAuvNRtzmPPOuaRJfx2F
	i9JZ5or5kLQ7FLgXqrogXN2iTEROnKDy9VnIqL9Z9kKLadUwZYhZAYCwaAIfheQF7mGnROrPCip
	b6V8j/ljP4W4kWurW5WDOMe3NTACZHL2Llznxr28eFHEwvsPVm7PDQDKnABQ7nnWswrM=
X-Received: by 2002:a05:620a:44c1:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c6f9570786mr313133385a.2.1769420243959;
        Mon, 26 Jan 2026 01:37:23 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c6f9570786mr313131785a.2.1769420243465;
        Mon, 26 Jan 2026 01:37:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b419465sm613115966b.24.2026.01.26.01.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:37:22 -0800 (PST)
Message-ID: <179f8fea-85b6-489d-b710-e995319d9000@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 10:37:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: add ETR device
To: Jie Gan <jie.gan@oss.qualcomm.com>, Rob Herring <robh@kernel.org>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
 <176917840185.2044151.8624555547965761091.robh@kernel.org>
 <2a8ff39f-7a78-4902-85d6-1267c319d8a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2a8ff39f-7a78-4902-85d6-1267c319d8a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4MSBTYWx0ZWRfX8/QpUt00aIz9
 32p+EaWBBmFGc5wdy4HUcJt5UfHcKtVcc1FjtNlF7/5PT7+wP5i/4M0TkcfYAzc1uOck/dWT/DF
 YsW0sBxt7EU3wVPG7B8WpxW5FuNYycjwHRNTAoDSvCXNLWDexsAvv8ShR8SMtPpmBdJIoJ2v/HW
 vxs4p8ZWHt2LMPzek8CTQCDlzpH+R2m9Va3yyp9MjJAzVqYDBFaQ9FMkPX4gIBm9dJE5GzJbMJc
 +4kmpZbjZOxYQcHWcCGlBpIeDea8LZ9Ux6QxJOVQZWt3fA3uMWLIrbN6CIvTTVGeJoyVAiHuI8c
 ihYyT0Qo6AQhMa5KXFf0n7vC9MjJfCzrDDqXbouyYwqdisEXafSbaD63rotCsH9+DMdaz0zWbNR
 q6FXvI4F4/yL173r3wF/z4PvOXClc37pHPEZd8wHCClbP8UfVSUgFgzh+p66g7klW+nNT062W4S
 2bASehOyHJ6ibcxwjZw==
X-Proofpoint-ORIG-GUID: lttPNz9C909Wr0b3g3IipcsztzP9pYg1
X-Proofpoint-GUID: lttPNz9C909Wr0b3g3IipcsztzP9pYg1
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=697735d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=sw8pdb0iKe9N3J6hDAcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90494-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9DAF8618F
X-Rspamd-Action: no action

On 1/26/26 2:25 AM, Jie Gan wrote:
> 
> 
> On 1/23/2026 10:29 PM, Rob Herring wrote:
>>
>> On Fri, 23 Jan 2026 15:10:46 +0800, Jie Gan wrote:
>>> Add the TMC ETR device to store collected trace data in DDR memory.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/talos.dtsi | 27 +++++++++++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>    pip3 install dtschema --upgrade
>>
>>
>> This patch series was applied (using b4) to base:
>>   Base: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d (use --merge-base to override)
>>
>> If this is not the correct base, please add 'base-commit' tag
>> (or use b4 which does this automatically)
>>
>>
>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com:
>>
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
>>     from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml
> 
> Hi Rob,
> 
> This warning is not introduced by my patch. I think it's a false positive.

The bot checks for any warnings on the file, as ideally there would
be none. This one is indeed pre-existing.

Konrad

