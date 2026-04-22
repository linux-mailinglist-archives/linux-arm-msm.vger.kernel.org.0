Return-Path: <linux-arm-msm+bounces-104066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB2mNWmi6GngOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:26:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 419EC444AE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 175B130053F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9610B32A3FD;
	Wed, 22 Apr 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1vWuR1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCVkTQnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474D313A244
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853494; cv=none; b=JyvSUhhwXS+cH/PRKh9BF75doA/4FkKdlw/NkMpVI3xz58GT0z3BT+if95vKyFmv0NYfzTaLw1rIvz5OaCvaA3F2YZlp4PCqaeTPHNY4IUy0UMQ62Zs8vOQd0JIEX98Zh2QSUUMvKMaIj5qIMDHEHdBBMJoHFn4Oi35DgwwM1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853494; c=relaxed/simple;
	bh=lF2SLdGVoo4gj7oWwkhvxlJk5+bPlhQ1nbeEsOnnIBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgrcQuhMD2zDjT7zE0RemNs1Uu78MRomb32JBzxWLMaaGxbz1GfMkPBmGqgnv+lBfa900pV6P2bJgiIH3pcSAYBxJObPXNIgADjsH4FrVLfs71nN4i4gj3HLQiqtz5zRNYDOYdY/cMwv7bhy7ovhNEXg90VU8CAiSgqZppw4i+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1vWuR1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCVkTQnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96FbS664127
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brbAVWEeeGvsrtkIZUZZywKmr80O+w4KSxCqy3rDJKo=; b=V1vWuR1nPv9QWCwY
	iviDvTDBBekJS0KXJS4Wqtc3LAgCP6EZNVY6PaIhLd/chxXqU3t0F9zdUsMOicsd
	TOwgG8n2MWQ3/2m7+6QvpIfMtIDfpP+YmI8ZmZoshkktD/dWXBYj8vfSSBpit8ag
	xtXcXFImEoCGeTYt1re6SeaDQYbFY0mw5nSPctXNWFVpCAgYbqfXU9wvyH+8JKbW
	g/t4bINZfUHzbc/qanMVOdKI5oHO9/1fA7tfyuNfnv/llZ/NQG6gxumKu64Wsfvu
	JMkbootJgQsK5fbaaGpytPduuLkqFI8G6x9Tsm4e4KIBAZIrWQmH8jvjXnzJIeLs
	N/H/1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgraep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:24:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d4c66096e5so59567285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853491; x=1777458291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brbAVWEeeGvsrtkIZUZZywKmr80O+w4KSxCqy3rDJKo=;
        b=iCVkTQnhALNZ+h+hqDM3ZupGQSjBlAilP4ML+VjzOg1VaIlpRulsaquWvDmoguN+SG
         uHbpkC6G7jr/AV983iMHl9tERaCr/79PC/731ulBz9jQEL1pO9r/FiAOaQ5fHY7FVXBI
         P6nDqZwOWMrWbeKFmcu47RlTHrJurcYTaxD3VtDbkaxSXk8gy8MJXX+XOjrbAo6NLMOj
         YnlIayVuLwmQBSlyjWV91F0z9zcDazEl2yDAWoYgDwR09XwMYaT35xTJLOXJb8zzjC1T
         zrVvXVgoYBfkzkj9lvvFiBeUnsDdYEHjVX4zLeLRwUQvKt54+woaJjIqbj6uV2k8HxW/
         Y53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853491; x=1777458291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brbAVWEeeGvsrtkIZUZZywKmr80O+w4KSxCqy3rDJKo=;
        b=tRq0EVmDbhjstvjN++7XMefUrN86EJ2SbJaXz+SbRjFZRmiX8VIAOLQNlcpbq5YrS0
         ulBDLgNDaqMb9c2leyqLvKtQCyRQBEimJCWhM/rmEeY7RoViz4LDdgRzNUsUMcH1EnWa
         xGA2+W6xb1UE7MrdAv1k3HufKfN36qyfBtiyg6FEZ0U08n8DrzIkxyUKUtRupdiLPNyn
         RwRe3gc/HoUd1FajoVSQl4cVq0MbC18JZZCI+7K5HfWUcG1dMcH2IyDWRZIAq7kWCh61
         Xgg8RKxg4+LMwbwyjXdlGuzAoicV21RTc+p1LT30nlyWgg7Wu5BrfAzY/+bvbV1vFM3B
         zfOQ==
X-Gm-Message-State: AOJu0YxvjUpKfdll+WRTEt7aiv9a1QQZ7t7AnhiIaWUxnttAgcIqApS+
	H7TIG0pMo6wYcDsaMhWaGMY/8zXnhKSYPgWep/foArDq/kUVBYcGn9f/UiFkcMd/oEo9avaGUAE
	f56BHtJpfSEqmyhzjAJtDdOyvAl0J+VoxSrnf1/LlxOrsBnGhobw768Lv8LU3j4a7XxMi
X-Gm-Gg: AeBDiesukZSdMCOOK8LOi8A0/wSJx5YG1vZEo1kaxcS1xPxM9Mjdb5XRi0cCqa3Ozz6
	/XIrTGZihvi9HVUFPHEkrs6AtWAMXVz369z6TbHhBY0WMtH799BdVsmC2T43sepxwFasTo4JtfE
	tWT4oEQmZ4uVTWqqMMfzytLbZexrQ0oJ2JLDvw7HVtHV0Q/aRvwMWmUB6Qdw4UX5PJO33G5BUP/
	7+is5Ze59BX4fGDoSC+podemRJjhqFAT/QRCy6hpLxqpxMboSpfTLMYXDTfk9CXXCHg4P5q05DF
	5V2HVpRcPDQbNCSHBFOTEnHrOaBgOxAKOs5MCVf1a/bSyFPSlj5jTQRNyWVBqukrDIvxih9bknO
	OIsJZTJ2/cSQehf8O7Ax4Kkp7hiuQl+6UesC7MKp9BQF1f/wwPZESMGnvCsiB062zXFVnznhViV
	aau01Gn10tpwpxSQ==
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr856596985a.7.1776853491548;
        Wed, 22 Apr 2026 03:24:51 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr856595085a.7.1776853491101;
        Wed, 22 Apr 2026 03:24:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5d8f9sm3162610a12.25.2026.04.22.03.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:24:49 -0700 (PDT)
Message-ID: <dbeece49-fe91-43ae-95d1-a855927e2de3@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:24:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
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
 <fde2d8f5-e512-4a47-935a-9cccb5ea79f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fde2d8f5-e512-4a47-935a-9cccb5ea79f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P-RJfJ4pbXjojSdKAy_VgopUXzwydjhN
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8a1f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=J7E-TG7-5iH-1ipYxysA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: P-RJfJ4pbXjojSdKAy_VgopUXzwydjhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OSBTYWx0ZWRfX4y/P6OhGDzGu
 8XFaQa7KVyVOHb0xryAzAAzv8EQz8FIrV0o3mCoilgOQQWbZX62azbjjgnkoVwOJmiEFBtozPqs
 I1nHAQ6HfU9TqSZDuzxKghoZXYGuvPBe1+AiOhuwGWKB9DAEh4sFFfc/Pb1osJ6lMCPkjN3c2qq
 Y5mDCDsQ2KLetTSVBTZnV4WRJIud4Wvs5u5EvX/URaXbLENVcrna1ZSVNMSLyryKlDXMgE9bcRB
 74ij9aKnlUOZcIknBIRRRQtOYBnPiQcCCZJLKEHpzXfEnhb3T5rCoFd09sjQRDu/4eyEdjzwHFM
 vpW2Sf6LeZsDZ2iWid/mM97mhP3LxMW8+ijIvMDsPqLC6DtOMwSDCj/qZppWHW0WHyj24dcJxg3
 1nENIAVX0kNKmZlX5SF63/FtsRlSBakt/CBbjV4YBPdOQiFHnIPs24GnrjP2Tz/YBi5QnDI8BAa
 m252qW1uQZkvJhmvWCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104066-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 419EC444AE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 11:38 AM, Ekansh Gupta wrote:
> On 21-04-2026 14:02, Nickolay Goppen wrote:
>>
>> 21.04.2026 11:29, Ekansh Gupta wrote:
>>> On 17-04-2026 20:45, Ekansh Gupta wrote:
>>>> On 15-04-2026 15:22, Konrad Dybcio wrote:
>>>>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>>>>> Downstream [1] this region is marked as shared and reusable so
>>>>>> describe it that way.
>>>>>>
>>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>>>>
>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>> ---
>>>>> +Ekansh some insight, please?
>>>>>
>>>>> We're giving away that memory via qcom_scm_assign_mem() anyway
>>>>> and I would assume that making it not-"no-map" could introduce issues
>>>>> when the OS tries to access that region
>>>>>
>>>> With the current version and the upcoming planned enhancements, I don't
>>>> see any major benefits of making this as not-"no-map".
>>>>
>>>> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
>>>> entire memory-region to lpass VMIDs. and un-assign it only during
>>>> fastrpc_rpmsg_remove(). There have been implementation in downstream
>>>> where this memory is dumped in case of SSR or audio PDR using minidump,
>>>> so marking it `reusable` might make sense there, but that dump logic is
>>>> not added upstream.
>>>>
>>>> Upon checking the DT, I see a bigger problem here, this memory-region
>>>> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
>>>> Please correct me if I am wrong about this point.
>>>>
>>>> [1]
>>>> https://lore.kernel.org/all/20260409062617.1182-1-
>>>> jianping.li@oss.qualcomm.com/
>>>> [2]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
>>>> tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
>>> Just had a new finding on this. There is one more reason why it is not
>>> added as no-map in downstream. This audio PD carve-out region is not
>>> defined for most of the platform's memory-map.
>>>
>>> With a change to qcom_scm the memory during boot-up, issue was observed
>>> on RB3Gen2[1], where EFI firmware was loaded in the memory region which
>>> was causing boot-up issues.
>>>
>>> So defining it as no-map might not be correct and it might need be
>>> changed for all DT files.
>> So It needs to be set as not-"no-map"?
> Yes, that's correct, but I think the static address setting should also
> be removed. As it is not present in memory-maps, I don't think assigning
> some static address would be correct in this case.
> 
> Konrad, till now I have checked this for multiple platforms and I see
> carveout defined only for lemans, monaco and hamoa. I believe, for other
> platforms, we should move to `shared-dma-pool` with `alloc-ranges`.

I think so too. The only exception would be if the UEFI had already
allocated a fixed region for that, since the memory could otherwise be
wasted (as it would need(?) to be reserved anyway)

Konrad

