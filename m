Return-Path: <linux-arm-msm+bounces-101231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KrzAKa0zGlWVwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:01:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 904FF375043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F4A53030B2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 05:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0454132BF44;
	Wed,  1 Apr 2026 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJTV/9nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAlLELjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F3329E5D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023167; cv=none; b=BWfSjJKAMFsWiFG/xdMfMe2FWXCWNuTsCKRkgSM+DdQWQnSNzgQ4zctZIQxgAXhHJh9zhntmJgaHPnx9/rIs81lOBEZQfaf/4tCK8oCgVkRHtnkWLapqq1A13Rkne++qrqzyUAkzeJcT1impNjrfwdSUTrLk6xJRlRuHpybQXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023167; c=relaxed/simple;
	bh=uAqnF5HZQNEEqlvHRtnLYcg05TKZBEbRd3bohfMDkzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRUkzfPHwma1SDH9aP+jJYdG56gtSYW0Yiu5zw+icHbPPQ3dIP3/TnbM1UoUkAdCfSK6Gxe42Gow+42/wjBnQ/a9vS7VpbedyLdUYOepOrM0Y01VfxyI8pvW9Dg8r9tovY13bjf8Ep2x4g212hhkw9u0tWR5nW6Tem/J9naRrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJTV/9nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAlLELjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63123msb1578311
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 05:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnn7XJnQB0ivTfZAs8ljRtbn7a+5VqmBZ2dne9oqXJY=; b=RJTV/9nkO5kYnt2w
	oHF89fgkY7m1W0OA4Ae9IXDvMqpTrPc72uGlS4XxCwdrBDxc93XeuEpvBwDt5/bn
	aC1vSOvjzSnZDjrRV1I0IB3m3hcbeB0guSGei2fSyN3YrV3Pn8o9mDybxpcgKtQN
	39SQZDe7W6l9kEshVT0dfWd4xZ1ANnSEkd3cZ3EEb23eW1PS/5WH+xDt05sfv2Ht
	jeeKVGXB2CJseGZMcSA7PuyqJj6XX03NCWh3MXVHgKISNCQmbHuz+JSLcAR+Z57w
	l8EigIKxxM9P/wrdKz3WjFDDA75VBSYU5ydblgUXLF4DyRRjN44/rG0Nbf2QFGI5
	rchvJw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kthjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:59:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so5280785ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775023164; x=1775627964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnn7XJnQB0ivTfZAs8ljRtbn7a+5VqmBZ2dne9oqXJY=;
        b=DAlLELjnFraXYWQ+RTC82u+CSrId6TCV+ABAL/PX9xSvFsoWhrzuZOOpX/ZhvSOusl
         0OVjUWG4NqvSjUynwJwLypP1kuHgqC1i3TpuWhSzQ2yTNoQR2z4XGFGVYWANA+FlBleC
         aPa+x3o/ULXSPLkLfn4Sm3iFU1Avq5FiYVfnJ80c+8Db8cIgqxWG1F3PK6KQughNzKYz
         Bt3OxGZQmEgSOy0eYu6Gjg9/Yyip/z0YUyE1EhZIP76cJVYI96G+QSW15oLn9r3jLmjH
         BLLUvFfsiKIZ0YqCX8kWtjqQ/egongdiGKQ8otku++85HK+l3K1E9bPdPDp1dHYDxIVS
         fxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023164; x=1775627964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnn7XJnQB0ivTfZAs8ljRtbn7a+5VqmBZ2dne9oqXJY=;
        b=VDrsWJEr0MLDa6k64PbfZJBr+AkgK0KjVGNLQiPz2gCcIZDAzT2SABkXmtPY201ZNF
         NqB+hE86mSfLUzeoJd7Yma5pTgPRrlPbcob5ZKTDVb2SBev92dhTbJLXxCFcBk9lZncl
         MX8KnzeWKBuDJ03GLu2J4PyEMv/MQ100D1prTiZTprIKRgcDQmyIwU8pJNuVKZH9Htr0
         7Ts9Tg6vcro3DYh1g5QC3YnH1uIJ0kOFidsbbAIWy2C71Ma/k7DvK2Ea8pBbsC4RPA9o
         lG5iAi/behCzowNsJu5w9YNsBxytOaCfWFon3o1DPkVFHFL8tbJ9CNFeA9ezm1iIz+rT
         8qqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOObEgBZCGyTgvaYYGCqpHfmKLo97rgazqnxnM7ziuubJDH1DxiGwaHDWyZrxOO5EWlZxamkeelN5Y/SGz@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtEaTZoO8l1fe0Qae3YNmFKwDP1x89JgvukAwxt63d9FbiMDL
	Yr29excTKiwnJt34F25xM5s2NSmk26fDe/Gl9fG05U2Ub+dD9EkAdpT0Njup8W5ezv9N7Nfoa6o
	aIl2zl/THKIceuMBkyAIU40B3bc+FwC/pTOQhceEBB9RRceMOs1qQEBCiQouUrWpGKalH
X-Gm-Gg: ATEYQzzZ8SW0oV+Uz2SM+JHRJhTEcA33lJvUheqnIk9Yps/IR4Cf/DBsEv789ch8shv
	SQskk/tezDYQRDQ2Wi96AGkoD6CohbWPGFiN3VRfS+/3mAVn9lWHABtqpto9xmxv3Rh4EiP3L5R
	l6ehKd+Q3BykRMRd62havtciGx2FYvYbka85vIYNxX7qQEvN3SgDjTjglWSiGua+sQK6j89fLxu
	J7QpwzcVss3sCiqfCWp2PU8DA9oYxdLJH2YZqXYpe38USleAw6u+4Ck1Rz60i2ffKRxRldAmw0g
	2OeBU5blAqFrBIfDCahpgMfVPl/FIQU52pWODqPyd+/KS/hBFeAmYkGJxsPWluSued+HcWadesT
	1xkxcXQKPh+xaE5t2o/0qahVhI/IIE9HZSyZtLfp3+ACqb/ToVXw=
X-Received: by 2002:a17:903:1acd:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b25eeb97b8mr58989575ad.13.1775023164372;
        Tue, 31 Mar 2026 22:59:24 -0700 (PDT)
X-Received: by 2002:a17:903:1acd:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b25eeb97b8mr58989265ad.13.1775023163872;
        Tue, 31 Mar 2026 22:59:23 -0700 (PDT)
Received: from [10.204.78.131] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm136283885ad.60.2026.03.31.22.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:59:23 -0700 (PDT)
Message-ID: <b9ba144d-cf68-4aa8-947f-560b241a1b7a@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:29:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
 <acoCFMdKRviiMZRp@sumit-xelite>
 <3447efbf-2720-4c9f-9a74-ca9baafa96ad@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3447efbf-2720-4c9f-9a74-ca9baafa96ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69ccb43d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=3eSu6wPcG68MjonYX6EA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA0OSBTYWx0ZWRfX3gR3v0hf04bN
 bzTeQGTtH5/1fhm4qlNx/fG4zrm9ULkw2aUDRSdBu/K5A4sx51Yj00e7KqD9esFHALueg7jQa7z
 Ty3DuOj0+rWFXeuL44MFc3au3mVx9ZxzAG+DcnoOwTLLVIxahF9FKCzp+uz0V/OLLg37oGrULdt
 /Y44Hj85zHD5QJnFXZAd3NAfPuiXgcKzv7gc+RzhOERcZXCi1ZzypDLpyqJIlei9bCRNsDF6TEc
 9abmLiMJhgOn4F9450IENWPSlTxF6TmIBGsFTwJIy5R6igUE65wE4/Ane+eslv47a+li0YuOngy
 hV8qh28tFidUoQg4jmFgQoKxvXwR0wlz24UZn5gD9lXMnxR7HCbOYUyI1MHsgScngT8ySwABTaX
 Z6DjGFZwuFQpAEs7J/H6j+Wm4r+lEvwk7wyZEYIccTMX6zN1OcWWYgk5Cq30iOcZ7NAfha627HF
 N4dNOnn4WDETIhRG24w==
X-Proofpoint-GUID: UDayGFBf4zUqBD1vLP6D5VBf-AyvtKwR
X-Proofpoint-ORIG-GUID: UDayGFBf4zUqBD1vLP6D5VBf-AyvtKwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.4:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101231-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 904FF375043
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 4:07 PM, Konrad Dybcio wrote:
> On 3/30/26 6:54 AM, Sumit Garg wrote:
>> On Tue, Jan 13, 2026 at 06:41:59PM +0200, Dmitry Baryshkov wrote:
>>> On Agatti platform the ADSP provides FastRPC support. Add corresponding
>>> device node, in order to be able to utilize the DSP offload from the
>>> Linux side.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Add more FastRPC context banks (6, 7)
>>> - Link to v1: https://lore.kernel.org/r/20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com
>>> ---
>>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 41 insertions(+)
>>>
>> This patch causes a critical boot regression on RB1 as per the CI test
>> report here [1]. I see this change already landed in this merge window.
>> So, either this commit has to be reverted for v7.0 release or an
>> appropriate fix is required.
>>
>> [1] https://github.com/qualcomm-linux/kernel/issues/359
> Why has that issue been opened 2 weeks ago with no action since?
>
> FWIW, copying the broader log from the LAVA job:
>
>
> [[0;32m  OK  [0m] Reached target [0;1;39mBasic System[0m.
>          Starting [0;1;39maDSP RPC daemon[0m...
>          Starting [0;1;39maudiopd aDSP RPC daemon[0m...
>          Starting [0;1;39mAndroid Debug Bridge[0m...
>          Starting [0;1;39mAvahi mDNS/DNS-SD Stack[0m...
>          Starting [0;1;39mBluetooth service[0m...
>          Starting [0;1;39mD-Bus System Message Bus[0m...
> [   17.318840] qcom,fastrpc-cb ab00000.remoteproc:glink-edge:fastrpc:compute-cb@4: mem mmap error, fd 11, vaddr ffffae380000, size 262144
> [   17.327877] qcom_q6v5_pas ab00000.remoteproc: fatal error received: SFR Init: wdog or kernel error suspected.
> [   17.343248] remoteproc remoteproc1: crash detected in adsp: type fatal error
> [   17.350567] qcom_q6v5_pas ab00000.remoteproc: Handover signaled, but it already happened
> [   17.358869] remoteproc remoteproc1: handling crash #1 in adsp
> [   17.364730] remoteproc remoteproc1: recovering adsp
>
> Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> <ded>
>
> It seems like this only ends up being a problem once the userland
> daemon starting poking at the channel - +Ekansh, have you seen this
> before?
Looks like daemon attaching to PD is causing some DSP privileged PD crash. Checking this crash
now, will update here if I have any findings.
>
> Konrad
>
>


