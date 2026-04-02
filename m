Return-Path: <linux-arm-msm+bounces-101436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGx9AeULzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:25:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE1C38471A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 925DA3062234
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08FB37CD2F;
	Thu,  2 Apr 2026 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oj0E8lqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAUEkf6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF023803D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111015; cv=none; b=pp1vprX17Yp+juVb8E+Oaii6l0rWLC/Ca+w7wd8iOSenrfddDBPHqowRzHVqR++76B9RX/hyCDw8pPxvgOknR5VX/B6Gok2KCw0w0g4ZYiVMz7YqFrdxdTPg4JhteYwI2nP4EWtDmkOpQ4f7KKU0DTirNFUFurfBCgw63pmGUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111015; c=relaxed/simple;
	bh=D3aPBt49l6gIFaw/fDGIGCeyPym3FOmV2xWEb736hos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfUK8Pb5i1kPByPr/F2+ojuuoCiZoxZInlLwC3cnK/ZRNVMLUfYhDJMl55sS1S3ZD/IB3g+WygNBS7T/O/a0Jilv4UExGdg6irdvFJrHcJXkJzSdAfTtjUkYKt0onI+MwLwXt1TOo3XlmNgK5gDh4e44vYSsOBI/PIGSbmyPSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oj0E8lqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAUEkf6h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4tnI549482
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 06:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOIp8NE0qOhUlChl5x7MNpi2LiiMlPjZ1ManOljSZPE=; b=oj0E8lqopYiA8QTG
	jtoiLOTWx3tUqzJGSNXX1ijxKUcAWpQYxqKY4UR8VJrTRpMNiZFNeTqklh2rhWyl
	5w3dYk128x7Mam9l2h41U5XVENgUOKDBdhO8w7Uf94a7UN766zDwEyVRlcxsM0Sp
	TbZijP6i+37yJb7tu8jmRrk2EV+6bf08MYGVXDXuzjO3xXfAAAltsysBLqpBWsLx
	3EcIcVzW3N9f3ATWC5RCkDEy1ucPHqd4rX4lsxejfaE9SWmqNN3dEdppn7FdboJw
	fXh7kn/EAYgrVtllfNUHuvC53FaZUMUocPHZXT6BAs1O/zk10k5+W2MbGgQ13pE5
	OLJueA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvk8m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 06:23:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1107da15so544536a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 23:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775111012; x=1775715812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOIp8NE0qOhUlChl5x7MNpi2LiiMlPjZ1ManOljSZPE=;
        b=HAUEkf6hU2uUpm2Jh/30ufc9Cd0gyGvmbryPXHZkFvbU2xWhOHEGbxAl52ALHsW8YY
         hjXBbyGhi/6d97VW5i5BCKLV4LanrlQs63lPfObW11VnPL78Swt0LqW40DP58IYyfiN5
         NEutKDZnyQSijr5bCYsaYy7cEirAPExVmThZ9Ig6+c9lb44YkB0LjDqQRObUFLPgeGg0
         X7oaHkIU3qoCj7d03ULvDLkyEA5QvK8UXQcrxJYwbnXlB9S4LyrP5eSde/VuNVK4yJjh
         ll3cUd9vLhmVSDPFMcm0UjLoxuJ4drxfP7ZbPqE6rRxZ3r/FK+sa+ryUJVfLeX+aaJrS
         V9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111012; x=1775715812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOIp8NE0qOhUlChl5x7MNpi2LiiMlPjZ1ManOljSZPE=;
        b=VQRvHUszGxsONRHJG+TE12fpTZ+5ZyZI6r1ydfZqLvVJhZRCttM+qUNQHkI53SeuVu
         JBuxAleVoEP6W7W4b+SMxbWeLgYUjc7H5qJYG7I3HhBTkfOic9Lc1wJryPIvcrqUIRRQ
         aUSUCD/bS1ei99k5miczZ/h40AUM2Z3d0SD88C/Qq47LcC28IT6+IlorvwryvCnBHpLC
         F6CU9bMJDSoVTcANP4bC24yYqYTNUQ3RSLZtZXDKH7FfgPN/nWw6RnIWsuBGfhAYMd4+
         u6l0yM+vkkN4NQsRPqoVgqmdTRLT3c8/3f8we8lqp7thDunZg9rPHwtrcog21xFqUY+q
         bqsg==
X-Gm-Message-State: AOJu0Yxi/12AH8SgvDIJ2GrbLrcuZ0s2n1jrRZkUL1d+97qN/MQfnKgu
	w3PZSlt0QMsUKxZoH5ND/7vZ9z9t8fN/uS8DoLAG9RGT6OED2vIswg4wLJlJuIQ+8qe5FcECF4s
	nUTwa5UsHeGdKBjUAO5JjM01zBXnlNLzjr81GrqtC7CUCLSSO+z+DW6kEBw/PabxMWDu5
X-Gm-Gg: AeBDiesNlIqtgdRAlVe0NT2qXXAIVj64fKVPGlc3w7q9NWVl5hnRLER52jee8zIoRE3
	/u6gqiUnjDQyGAOGiDl6/ncYdZAVg7APFeYuTxbqxKEajxtZtQJMWAw+1d65Vztzx4+FT9Cgbd1
	6uIsMJHFvirxIKIzkAzkmytUXfr2TLqPnN1q7L+nlzR6J3yAbzedzXVzr54y02FzeNRRPgN8t8a
	B7sy7fl6UhT2Lc9GCs1PXcjwgE7fgkvSeLgCQqqcK0ecKBPn4fRyzkagWnydwuRZ+vDXJyrGjTj
	Q1ysH9iPtfeeCYASK4n4YjMM+IrO/OW3QMtqkGbH1PWqjamipGu4uLde2VB/fXNiYBq8Mzz7BS4
	TEuGluZ4hN5PxzuXVqZmEdUtRVxgrNFsbzwE3czpm77WNT2vgKzIX
X-Received: by 2002:a17:90b:3cc5:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35dd3e172c8mr2079225a91.6.1775111012237;
        Wed, 01 Apr 2026 23:23:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc5:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35dd3e172c8mr2079204a91.6.1775111011687;
        Wed, 01 Apr 2026 23:23:31 -0700 (PDT)
Received: from [192.168.1.14] ([110.225.167.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e3621sm1738507a91.4.2026.04.01.23.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:23:31 -0700 (PDT)
Message-ID: <3496027c-a479-44bd-abac-3382a4155632@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:53:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
 <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
 <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
 <d2fb3b02-d4d2-4bf2-82a0-3432c3c3404f@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d2fb3b02-d4d2-4bf2-82a0-3432c3c3404f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1NCBTYWx0ZWRfX5ZhLCB+Unp6p
 dxVr3Qohfqlb/dpCU0wlXVmBuW50KWn2w55msB7yFARwC6FlbFtnUqGjDGiYhxZ5x7v1BOyPVfA
 +QkAuzfQP+3hTz3A/+zEikvxclevNTHzJLaj0VlwKvXVJ2W+4pKTC2CyLwrVn+O7z8n5uhlsZP+
 27Z+vBJ1wmACM5Xl9iR+kvJy7sK65K0T8dJlzHdYTcw142gqHbxHSbvLzJ2eIdyDvbBme2GTzgU
 ehO2LMFxsXSuj51pPVgp2zyWNBe5rwzxEBCA5bHTzq0ZMDvPWU3JJK9tvZhq2FlHi//iSYsq/AY
 3gYEorCI6H6bZRg9haH5rGyeakaOurBTm9G8fnKc8AM3qE4DuSkEPpNb2pT2gbUICNiQ0xJuPAk
 THqXInkSOQtQ38vU3zdHsT4lUIhOsodnBKICBiKXKny21nQ2CQKKw6XHSmDxArmTeOQ3+2Ewv/p
 RDnFHgD5ZrMEclUHX3A==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce0b65 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=GstQyB7T1i92F5dDEt+vJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zxRFMbGF7xCxgMMR7R8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: i6OnMCNI1v4DAf61VzJoJzRXoXXWF_wp
X-Proofpoint-GUID: i6OnMCNI1v4DAf61VzJoJzRXoXXWF_wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.4:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.5:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101436-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EE1C38471A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 4:20 PM, Konrad Dybcio wrote:
> On 3/30/26 10:38 AM, Srinivas Kandagatla wrote:
>> On 3/27/26 1:10 PM, Konrad Dybcio wrote:
>>> On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
>>>> For some reason we ended up adding only 4 out of 11 compute cb's for
>>>> CDSP, add the missing compute cb. This will also improve the end
>>>> user-experience by enabling running multiple AI usecases in parallel.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>>>>  1 file changed, 49 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>>> index 10e799dd4a78..38fbd44c7d8f 100644
>>>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>>> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>>>>  							 <&apps_smmu 0x1964 0x0400>;
>>>>  						dma-coherent;
>>>>  					};
>>>> +
>>>> +					compute-cb@5 {
>>>> +						compatible = "qcom,fastrpc-compute-cb";
>>>> +						reg = <5>;
>>>> +						iommus = <&apps_smmu 0x19c5 0x0400>;
>>> I see that the other CBs have 2 iommu streams, the other one
>>> having "DMA" in the name - could you shed some light on that?
>> AFAIU, These DMA streams are relevant when NPU dma engine is in the
>> picture, examples can be data pipelines which involve transferring data
>> buffers(in/out) in-cordination with different IP blocks outside DSP. May
>> be something like camera/video streams directly to NPU without CPU
>> involving...
>>
>> Personally I have not tested such usecases, but for upstream fastrpc
>> clients AFAIK only application streams matter as clients will explicitly
>> allocate the data buffers, even for sharing across ip-blocks.
> This would be nice to confirm somewhere, perhaps even denote in bindings
>
> +Ekansh could you confirm/speak more about this?
> +Dmitry for awareness

Yes, upon checking about this the details are in lines with what Srini has
mentioned. These streams are mostly used for video processing type scenarios
which is not required for this platform(as per internal discussion).

//Ekansh

>
> Konrad


