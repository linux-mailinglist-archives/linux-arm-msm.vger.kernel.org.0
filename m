Return-Path: <linux-arm-msm+bounces-104058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA5pLh2X6GnVNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:38:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F344413A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFC873026B19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784843C3C02;
	Wed, 22 Apr 2026 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztb7zrM9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFDFfZ8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D22E62A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850711; cv=none; b=oD3hwwchcVrxwuU9e/VISdJYiIdXwWT70L4ucv3MsPK3oPrnsphjQeb1voRZVMV9f7611O4cRgvfpZOOvtRf2nNXrPmVHGGadr/NNYVh+J+abT58/V7KLCwzEERCnqecouYUwjraer21hB5pS0hTedafIaqDQrVKEik3w/cBhcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850711; c=relaxed/simple;
	bh=OoH9c8E/wn5FrrTOM9zb/djBmlVgHz76+CzvecM34X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1YhXw52x752r93W/aEwBF9xmbI5BjSEDCH1vxwkThU1ar/czo5Sf7nnoqgbVch06mLU/zG/h6EUzRUjOoqwlsazQ6Kc1oui9q6jozLQAIgHWTafeOfs/zkP2/Cy0FfNuis6614/5iEUcK1QP5QBO7uCoodCn6+aaB5O2HW/bkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ztb7zrM9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFDFfZ8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M586S52123575
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1V6KAOfun+E8wCUnyXxLRGpcFdc9Hel4k7ATRwu+OA4=; b=Ztb7zrM9Mw2hinAD
	42YBcdCcOi594hJSUcMrQk4d0luQV2HEyT/bniRA2KdKI0G5EWrN/zv7zXRWrg06
	UxO4hsvaZHi2qj1MNdWhka4KaUyQu++RS3exQoVfrF3MLS13lP2CmaPVaDt8nCqd
	xnMjXsA43VwP18FMqerAeDQmP61Tz90rzPiduRSeoitE98QgQaftW+52cIFKNE8Y
	mgES3zORsB4tgldDVX+wIo2+CB9DjkOpzDUOFb0+Hxz9tCFE2Irsfir1hFKPHsV6
	v31+vfcfG6cjIai6N93MqUGDIF4mXNBgbLSDVtn+J5WX36rlyfAa/on+w7cMmXJ+
	L5Ic5w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfts7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:38:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2340949b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850709; x=1777455509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1V6KAOfun+E8wCUnyXxLRGpcFdc9Hel4k7ATRwu+OA4=;
        b=JFDFfZ8I3tHxtpjqjQ/oHzc9pmFSOB0/5tfhp2XWCc58FWCfKnfTEGSn3bETw6LvT7
         xivQnSataDT/+WR/4n1u3NDvB/DWsNTPZiT/WHGrjGD70fixn2X2jf163EaAVJ4hnWCu
         TncZ6o6ZLtSvtvIYTimjQ+axE15F54NJYQrY3VdUFc/+ab1LweFkSSR4e0f28TskKvTb
         +b1GvhbGpgoGBz3C1nrCjb2OOocWWOxwkXX2ILfO1yqu0RrPqb3UbhgFimmyeQxEuSwc
         05/pbmh2h+hEsDvPVmF6QAa4CLi6QJElRvBLj85mV0kdIf9IfiEo0lzrb8ajxD1viM70
         5vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850709; x=1777455509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1V6KAOfun+E8wCUnyXxLRGpcFdc9Hel4k7ATRwu+OA4=;
        b=TYDCQLPRMkyThRblLRiFH46eXShd8guNXB3I5hXKUvcaSNa2+I2HMPrjwtXSy5EV2d
         GCPfUrrBsniYuIINa+UhMVN+29WKe7ADmMp9KtYvZhj1SlFGoMmnAWnjvmUC+rH7KFkb
         q/P49pWUGxy2L77/h0T2EllmIJz+sQA8ObkV4zFINP2E6VV0H1QUaaJ1UAYmCLTON0JR
         b+a6UUa8DAOw76ZtDCWrPCyASyJrCxGyH7jyvkyh0umjbw59hYJJsJmlzJ9iGNyu3LOa
         vDJP+zziG/SPtDk+2qSigX1+b9vANchdwKLnEVfMvMco6X5D99M1gPqdj+XcQf9OTHBC
         tXTw==
X-Gm-Message-State: AOJu0Yyad0s8Plo4T8uVs0qIPjQQYLr7Oz7S1lL4dUA7UUnMsAUZlAbk
	SbJsj/BNk7feFinr1CeTiqIk9fSvGJJ+ese/w2BljjRVQ5+dHjfvsuOhaMqIW+6m4oqpD8D3t3m
	rWY6fkRk3FjZk4BWNUZtJVAzGOXdQoOK/ll9LN4Bgzz2unIgZf/f+sFdiZdSxZ6TUdWYw
X-Gm-Gg: AeBDiethYjOLfDTFv/G/6ERt99wt0yprRNzB7Qo4YF2SYrGlMoWjlDJGYI5Hsu9IoSA
	YbeDRn1yrQOHw9onv1b5BOxrmPaHDjECH3qyRj9h0zGpB4R7RXGftqyOzZC1lqbaEz5TuwmQNbE
	4UJ+4oTT7rUu8Rz6vgAcn+cdwWKjVizuX+EeQmufoCdBuG7Z7jwGNKWvMw22+R7jNsyNS2LThaN
	aYz+EO4QmOQTELF3sfuq3vOnpWNuucBRMeoDNIy2O1x8MrELwchuuf49q8N10COiyQtWjSH0UY2
	ph65KcCd2txQvpEHv3B1pJlsAI6QShzQo8oF1vrYeQz2b0A+CMCsNgudE2IqXy4sf6K4VT+GQ7l
	myiGPnvVv+nEz/06jRsnYrUDkw4TBlP8RPi4OH4uChIIR5fCoA2dEpIK3kyNy
X-Received: by 2002:a05:6a00:1307:b0:82a:6b97:34ae with SMTP id d2e1a72fcca58-82f8c8fb893mr21864619b3a.32.1776850708581;
        Wed, 22 Apr 2026 02:38:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1307:b0:82a:6b97:34ae with SMTP id d2e1a72fcca58-82f8c8fb893mr21864572b3a.32.1776850708023;
        Wed, 22 Apr 2026 02:38:28 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0307esm16782410b3a.53.2026.04.22.02.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:38:27 -0700 (PDT)
Message-ID: <fde2d8f5-e512-4a47-935a-9cccb5ea79f2@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:08:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        quic_chennak@quicinc.com, quic_bkumar@quicinc.com
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
 <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
 <a32fda72-6bf8-479b-bae3-2e551671945a@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a32fda72-6bf8-479b-bae3-2e551671945a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e89715 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=awelrzymAIGObDfGqe0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: n2P_icqqS6qe0o0b6E05F6j5fVy2LrsL
X-Proofpoint-GUID: n2P_icqqS6qe0o0b6E05F6j5fVy2LrsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MSBTYWx0ZWRfX9fqugsvFGcdU
 2qnvVuGifM4Ieb7MHr4TfqN8xDIqvHxZSvJRTYlP0F/PcWK8v5lsGdDUaZ2uKCjbfK7fVRWE5Gh
 G238yoixqXpNhfwRRJzv3PrRCKV/+J41KqSimVpP+3/iQ9v2Paw5VLsff6lZWsjoN4+WjiscxeW
 xWI0prmKXG3V72iVNIQXn9KUA8mnIM8MDMh3JIEGivatpL4vgHTKPR/xp8QLqWFP7YzeDt7z7d/
 eSP/606/a88AnOm1Cxm1UFY6hCLz0tElQ6hMA3NC0uS5GBBMyMU3xcMkjGPOarchUNUFAQYqCRw
 CukynsIwpKhpQ3Sw7llzyCqxkB+X1eRmIqlINVR3T8+vyPzBz0Qzuxo+YPdpg2FpjjizWVUEAw+
 Y6Vm0SmttCsTU+YVAolLis1xM37JTgN7T+KiPcShW4rTyDyvC0z6TQRdy9WIaCeIJL40c2ip7jO
 nJ26cA8D5B1vhd5laEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104058-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,mainlining.org:email,f6000000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 587F344413A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21-04-2026 14:02, Nickolay Goppen wrote:
> 
> 21.04.2026 11:29, Ekansh Gupta wrote:
>> On 17-04-2026 20:45, Ekansh Gupta wrote:
>>> On 15-04-2026 15:22, Konrad Dybcio wrote:
>>>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>>>> Downstream [1] this region is marked as shared and reusable so
>>>>> describe it that way.
>>>>>
>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>>>
>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>> ---
>>>> +Ekansh some insight, please?
>>>>
>>>> We're giving away that memory via qcom_scm_assign_mem() anyway
>>>> and I would assume that making it not-"no-map" could introduce issues
>>>> when the OS tries to access that region
>>>>
>>> With the current version and the upcoming planned enhancements, I don't
>>> see any major benefits of making this as not-"no-map".
>>>
>>> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
>>> entire memory-region to lpass VMIDs. and un-assign it only during
>>> fastrpc_rpmsg_remove(). There have been implementation in downstream
>>> where this memory is dumped in case of SSR or audio PDR using minidump,
>>> so marking it `reusable` might make sense there, but that dump logic is
>>> not added upstream.
>>>
>>> Upon checking the DT, I see a bigger problem here, this memory-region
>>> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
>>> Please correct me if I am wrong about this point.
>>>
>>> [1]
>>> https://lore.kernel.org/all/20260409062617.1182-1-
>>> jianping.li@oss.qualcomm.com/
>>> [2]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
>>> tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
>> Just had a new finding on this. There is one more reason why it is not
>> added as no-map in downstream. This audio PD carve-out region is not
>> defined for most of the platform's memory-map.
>>
>> With a change to qcom_scm the memory during boot-up, issue was observed
>> on RB3Gen2[1], where EFI firmware was loaded in the memory region which
>> was causing boot-up issues.
>>
>> So defining it as no-map might not be correct and it might need be
>> changed for all DT files.
> So It needs to be set as not-"no-map"?
Yes, that's correct, but I think the static address setting should also
be removed. As it is not present in memory-maps, I don't think assigning
some static address would be correct in this case.

Konrad, till now I have checked this for multiple platforms and I see
carveout defined only for lemans, monaco and hamoa. I believe, for other
platforms, we should move to `shared-dma-pool` with `alloc-ranges`.

>> I don't have a history of why it was added as a "no-map" region on
>> upstream but looks like same has been followed for almost all the
>> platforms. This needs to be modified based on the memory-maps and the
>> region needs to allocate memory in a dynamic manner.
>>
>> [1] https://github.com/qualcomm-linux/kernel/pull/487
>>
>> //Ekansh
>>> //Ekansh
>>>> Konrad
>>>>
>>>>
>>>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/
>>>>> boot/dts/qcom/sdm630.dtsi
>>>>> index 4b47efdb57b2..13094b5e9339 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>>>>           };
>>>>>             adsp_mem: adsp-region@f6000000 {
>>>>> +            compatible = "shared-dma-pool";
>>>>>               reg = <0x0 0xf6000000 0x0 0x800000>;
>>>>> -            no-map;
>>>>> +            reusable;
>>>>>           };
>>>>>             qseecom_mem: qseecom-region@f6800000 {
>>>>>


