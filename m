Return-Path: <linux-arm-msm+bounces-92943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPd3DYQMk2nw1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:24:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A411C143516
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 877FD3015D03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F67230DEC4;
	Mon, 16 Feb 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5qSSm4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuFoBNkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3030E0C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244669; cv=none; b=UDdN0I+s0vM0p3d1C7bb+S/BKkPQsOk8+9FOHdWDQ1GpRz8lNGZLegQ1HTszf5bSgrH4GRzfr/iYZ6Wio7QyZkLNyL8ihOk1QRkm8S4Xyfyd6BDnLZEM6Tfn9JlMB01ZKdyqjS9c0SRWde8m0i+Kj6cj3wKCm5hHfPzf/DCDHlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244669; c=relaxed/simple;
	bh=KPiCy2NMdtZkVs1iHXfjBjOwvUQrwOpK7sBZjjDmqUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0yEOOdhhI/k+QBz9pR8VYUiSgnVs4O0rNa+RbFSImVymTrs7FE3J1PxW/pIHP2Ndl2k8ykb2rKeayYHkTIU8um6FOsl5zBBE0G3PZsHunYtHGYLDQXyqIMDAXdBQlzyGBrKvzHHupg116AB/D8to4gsyAm0A/THEVAKg1BYeTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5qSSm4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuFoBNkL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBXo0v3701304
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3ig7xqkO8kaNdWQ0mZyM47kSYpxrxBFJkB++3m9leU=; b=N5qSSm4a3IGgW4VG
	wsTajSmtamAId0WLDApdLvLV9IDN0TUQBrKTEB6V62N/2mwqZrB/gRvcDFXshs99
	f3y5AU2HHARh3Md4/spsSiABhjbBC5dVLMscys+3fAUIgU7pv7Syjc6SJfvbY55A
	43evbpnW9MyGFOi++BsFFMJvMcSvl9Em3ZusxFnuEEiGAjtk/s7HsjKbsGnynURE
	h+xHr2tV6qLRl9aazt3YL2cieSgSQAmfFTtDaocE+4lmNeiabMZx7MBE4/fvEHC7
	v/Q9Wd2DAt1NmP4mSTRPvo8dHEwNmthiz5Altshal+mpscDmd91Zo4215+ODwbdq
	1Cb09w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24chqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:24:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aae146bab0so40968015ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771244666; x=1771849466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3ig7xqkO8kaNdWQ0mZyM47kSYpxrxBFJkB++3m9leU=;
        b=MuFoBNkL3fZdzNKp4LRqIP/wbNhTDB7bKo7CcX66LTYNk1JW/JSjj1/s3Ad1hUu4q3
         AmNe4TPpdgi5w6BRMtFsuAs0797qFA26gwl5ogEoY5dzxYLM4nlzDLLYsxXZXx6tuuiR
         3udGufK9Ym6healfDjF+hm80ZfbvdePNGjsEsQw5HC2kxX2elUzkVIDPIXiJX1P6uro/
         m5uJ9SmKGpuRxdoXmBXgUt2LKbRKdTRcth2g3twqvHgFHm+KxOb5da9tMNHv/hfdN6pS
         W4t//Eq4fsefcl3kMhWzZmYevsuFvEh/R5vJGI+vPQCAwn2wV9P7iAFXVdekepCKfjgQ
         IDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771244666; x=1771849466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3ig7xqkO8kaNdWQ0mZyM47kSYpxrxBFJkB++3m9leU=;
        b=gwPBvMmCugFKHF32k5p0UkeBSt9hShO1N8LD2rYl4hprCoAKHFmkz7uRuaHyyvYGuP
         ONTnu4YL7cSz18qj/nmG+BTQ4pscpjX+hDeLFYyINqe9IyQ6YXTJJlBh/KSVubA+qmtz
         KB5/FJBESARtJo6oi9eUGu+lWO5plOGugNyraRgYrS3BLWB3MmfI5SSY/mEblyaHiz4N
         iPInd0/vAq7wSmbAeB0D8BKApLpz/7ZEXWFhEnL6nOVaD7glPxSS0KWTz1EwrRAPdicc
         29o8QT+IgSfjYo5h5EiSXAD7tkyXToahNRBUHYovzJmjjZ7Hi0E9AYd7ItUWhiS3Kq0Q
         ntFg==
X-Forwarded-Encrypted: i=1; AJvYcCXEAoM9zEm9qt+U7N1BJKnE1XDs0sZqC87lWPg/8c+pCDU5eZtzbY40mBvGbBzx/+nhFS4TK7Pp6KGEMkEm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv9AlSrmsHkYolGGSpPPsVRp/WlUU8n9tjUwcfzNj8xy7NVmot
	BoRm9Rojr7SA1C5haJ3rOil+3yNAizQjVRg1o3CcQPwM8NLmoY37AJeiGpRbTI70+g7TeltqAEy
	u+k+FMpvtiJzN3UgLeLxr8ajec5sW10iWMCTSws02SgUwsyyNOd8E76ff3jwtofzvnfuH
X-Gm-Gg: AZuq6aLjMsHcuh5J+/qkwMjaUpvhODcPEkUHG0lj3e7JB5brzZ0QNn2+I9MM311NPoX
	e0Ca2YCtO9rUPw9+nrTtI0ac4mqixCQ9xs3MCxoyB7u0j+hCmmiTUx7Z7uts/W8DGN5sn17byN6
	vig4s9uJGh5s30GRHTa/Fd6s7WQcZ4ti703IM/QELAcy3SOw9oN+HLgxJnfZBmMUBtUPoJAdJur
	BcDaD8AGxCuasfUjyvklF6ckUaEGHpwQ1n/o7xklQWyKuW0YWA8IQ+UAzhH0GaQpJUAtr3wevOU
	v/Pwgm36B3Jf3AXT9v3vyM7GJYXlycnGd5kXJa7ZGN7JZMVyn64YXe+ADGPjcAXDyXHDocy9vSo
	rFGtJmxUXtP67t0Pl8rt6KMWhtAjXCRid9zZKO/0KeZJKSBFo5EQS
X-Received: by 2002:a17:902:f54a:b0:2aa:e6fa:2f74 with SMTP id d9443c01a7336-2ab50521f02mr96446515ad.2.1771244665531;
        Mon, 16 Feb 2026 04:24:25 -0800 (PST)
X-Received: by 2002:a17:902:f54a:b0:2aa:e6fa:2f74 with SMTP id d9443c01a7336-2ab50521f02mr96446275ad.2.1771244664983;
        Mon, 16 Feb 2026 04:24:24 -0800 (PST)
Received: from [10.0.0.3] ([106.222.232.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadc7b7sm68453615ad.67.2026.02.16.04.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 04:24:24 -0800 (PST)
Message-ID: <8e7b16fa-409a-1980-c19a-b4e1cef4300f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 17:54:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <c3e8b907-06b9-26d0-50a4-e9b091050b1c@oss.qualcomm.com>
 <fw2zmrpijgzu62jnajqpykplhte2ff3cg333yg4mbb62pq7kem@v2mg7mrf7jjh>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <fw2zmrpijgzu62jnajqpykplhte2ff3cg333yg4mbb62pq7kem@v2mg7mrf7jjh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RykqwWEZE8qoSS9tGA9gZsXQfHYj1cz-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwNCBTYWx0ZWRfX9D3ZLhxho6tv
 h3qiwTPb/m6/K4+L6motpBp8Os1v3UuJPGOroOEh2XizqQJ0uYJt56PxGP1Hfqfx+y+QgI9sfvL
 fcb5/EP3b9mHBwrce8CuIBf/ETX8B/Z5k3OUGBFgX1HVM+KDe7ZhS0MC9AJrbXPkSnxYREpVBgW
 xkD2UIgoP8qWUtTgzFiomQY80hI4aM2/n+p0DaNMp9xXYbT7x17kfOAMY1bp6bG0qtUtbWdWJbX
 94NR17gWQsZ4f8ipfmDygSOcNz4WpdAr6JqvDCw/QKr1UWkIXLOj4qHhy/XR+VN7NVv5Ra37cyc
 3RGUZlGUpxXYiP5hb6ZtJLUDisBHxLJAPvhuB+08UzHZpAEN6wSJWN9eNN4Ap7+oqoabT08K73D
 nPOSsmsfbOti5izMRG6aKyCIJNVMvgheyId3cduXTJwGkeQNLruVFeHRzv+y0i5fM4epVCwNzJH
 d1Qun9LhaP3j02XhUSA==
X-Proofpoint-ORIG-GUID: RykqwWEZE8qoSS9tGA9gZsXQfHYj1cz-
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69930c7a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wLlKp180pkOCiHd7nYENcw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=7Qb4gqhGFODSOptRjt8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92943-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A411C143516
X-Rspamd-Action: no action



On 2/16/2026 5:33 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 16, 2026 at 01:53:28PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>>>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>
>>>>> The only SoC with such distinction today is kodiak. So we can simply check:
>>>>>
>>>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>>>>> 	hfi = gen2;
>>>>
>>>> Agree, this works for Kodiak. However, Dmitry was also referring to other
>>>> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
>>>> generic way to handle that check.
>>>>
>>>> Also, please note that the Kodiak Gen1 firmware uses the string
>>>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
>>>
>>> This is not quite true. Kodiak Gen2 uses:
>>>
>>> $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
>>> QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>>
>> This is not the correct firmware for gen2 to work with kodiak,
> 
> Then what is that firmware file?
> 
>     qcom: vpu: add video firmware binary for qcm6490
> 
>     Add Host Firmware Interface (HFI) gen2 based video firmware binary for
>     qcm6490.
> 
> I cannot interpret it in any way other than "Kodiak firmware
> implementing HFI Gen2". What does that commit message mean then?

I agree. The intention was to target Kodiak Gen2 only; however, the
firmware binary that was posted was incorrect and fails to load on Kodiak
hardware. I had submitted the correct firmware [1] to resolve this issue,
but it was not accepted.

[1]
https://lore.kernel.org/linux-firmware/f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com/

> 
>> the correct
>> firmware (not posted yet) would have VIDEO.VPU.3.4.*
> 
> I don't understand, why are you making your life harder than it is?
> All firmware for HFI Gen2 uses different version strings (as outlined
> below). Why all of sudden you want to change that for Kodiak?
> 

Sorry, let me correct myself. The correct kodiak gen2 firmware (not yet
posted) would have image string as video-firmware.3.4 or vfw‑3.4.

Thanks,
Dikshita
>>
>> Thanks,
>> Dikshita
>>>
>>> A collection of versions quickly captured from what I have here (for
>>> different chips, but for the overall picture):
>>>
>>> HFI Gen1:
>>>
>>> [skipping prehistorical / museum data]
>>> VIDEO.VE.5.2-00023-PROD-2
>>> VIDEO.VE.5.4-00059-PROD-1
>>> VIDEO.VE.6.0-00055-PROD-1
>>> VIDEO.IR.1.0-00005-PROD-4
>>> VIDEO.VPU.1.0-00119-PROD-2
>>> video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
>>> video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
>>> video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
>>> video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
>>>
>>>
>>> HFI Gen2:
>>> vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
>>> vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
>>> vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
>>> vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
>>> vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
>>> video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
>>> video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>>> video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
>>> video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
>>>
>>> It seems we can assume that Gen2 is:
>>> - vfw-0
>>> - vfw-N.M
>>> - video-firmware.N.M where N >= 2
>>>
>>> All other binaries are Gen1.
>>>
>>> Also, we don't even have to query the binary firmware blob.
>>> After the firmware is started, you can read the version string from
>>> smem, saving us from strstr over the firmware image.
>>>
>>>>
>>>>>
>>>>>
>>>>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
>>>>> solved for <=8450
>>>>>
>>>>
>>>> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
>>>>
>>>> Thanks,
>>>> Dikshita
>>>>
>>>>> Konrad
>>>
> 

