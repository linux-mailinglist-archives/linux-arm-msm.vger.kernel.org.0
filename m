Return-Path: <linux-arm-msm+bounces-92926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4llaIBL8kmkK0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:14:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D5142BF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 435923002747
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF002F12B3;
	Mon, 16 Feb 2026 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOYSMHMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HaFFNIQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B212D4816
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240462; cv=none; b=kt8pHh5Xq0sxEKi3p2bHl940vYC9rpwnq01Ba1nSt0O1nggc75HLkPfxvSwRYY62yWN86SC72Wo7bNLPZwmIVsck/qYODrF4YVmYFvJeOU4uIbi9PZLt2sIEPPAx5xQT/qOPhjqF5MM0aSjLPYlty68sT5wZjVwSyO7bNsWI/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240462; c=relaxed/simple;
	bh=HQNhcqlrDc558aDTXyXli7UfU6H3HWj7/3UJILT6O+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8TdBFceLkCcBO/8c2OjupnhBjxG2WwtSRg9N1ZqQlVhdMSq2FmeQkgzb98KUDMGHflKh7zRp3WvOtUiDw3s6VKP7SK0Y/a3txEn9Sc8r+TGaLDXq9ytqMAG6pp3lGlg7N1C7ets/MVLa+VWTaRC8KxOHU660hpHRr1pml2IqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOYSMHMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HaFFNIQ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G7rFUf1010495
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffr72mK28MAh/cNeSGxa4wAU8vOezCOqlspl+/ykhaE=; b=hOYSMHMJH4KSs9gJ
	38MTiBzWPUBLyQFnNMyTet9TjH3kvhPET/nRBKv17MMDIJ07ApEshY+s9o2EjXPk
	/+vRKiK6m/SZPk1I26OpAZkzN3i+aKOVvLR2xzbgYd9Qd/BnG97ZQ392IlVpcUvM
	NMxVHnbkuw9O4HUrF9yQj/zXVrzYYrX4Pj8kbtE0cx9VxCAq99Le/MwK4aEgiVjQ
	9XJ6e9YpI0/N0OG+ob43OHG0k0zakdSXn/Lv/Vz37pldi+m+ZwFRgMvXMwmypdcs
	o8X9L4CAtnbFdFgid2NskMtpcn9HjofPa3xP4tM6pTFnvmwFiB5UFRFdr2IV9hOh
	nNXBYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4ck8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:14:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8966be97747so20151866d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240460; x=1771845260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffr72mK28MAh/cNeSGxa4wAU8vOezCOqlspl+/ykhaE=;
        b=HaFFNIQ0sli3ReoYW4X+VDo0F1OtPxFw1eUW5nHu4muvIkKQHvlBUVPnK/JmX17P4Y
         wdu5rDMieozvm78vAstX8MlTgTI0hd7okPz8BvDIO9OUPchxoYsjwIELtRb0vEq3fu/0
         CLlVa3AYOffBofoEAFbbeROvW1QxZKmXlBd0GejJ5Cn4zZ8YWTDJZ5YRt2zlERY1uZ5A
         KFXMA6erpNJTeZNpXGIqpGy91wVgIh9TuNVF+hWbE2PJmTNTK7gjJSILoZeaV+qHIOGK
         ZuFU0NvkV4eXGHqRWRfZ/fAeIwo5ykAPqHsXGg1gnu4ASRfUHHwsc0k3RuAcM06VERqo
         CkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240460; x=1771845260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffr72mK28MAh/cNeSGxa4wAU8vOezCOqlspl+/ykhaE=;
        b=BjeauCqkuZkqqm7/HPW8F5YjRKYTdwJfAtC/nULkA4e86kAhQTGE47iOkAPg77Cfqb
         +GvwufB8FbhP0SXbU2fzVa5EKKmPCmIRqrUFbbX5UoBffNMc/AfaPr7HPVgio5R0zIHY
         KxSxkeUMhP+pLuDPeVNV9LnSljH9qMLy++fINfuuwJWHcMQHgDIQ2w/U2wHpKP4ET2F9
         HvGvAK1Hm0IjF1YVWAuHN3EG9JCS6/Px/dZYnPBCP8Zd6PDhsk5QfYn6jF1d6yYZiqjv
         Q7jlajvJdxExuYiysdSFNIFOEAeCWcckp2v1LDf8juCGcfvbMVFYcjnfBe0tOKIP2WsN
         RJNw==
X-Gm-Message-State: AOJu0YwmIByHeFBNUrpnDLwoe2d/lVBR9w7nNltpjCrXKeJVI10J64sr
	IoyCw8bGCVaANl4wRsvigAHZVPGU93Y5uFn4GeQfIHtQfDMpxwN1olut0KssNoEDNRqKmf7/TpV
	Fx77A+9wwFQQ40I70LHW6XJc645cC+0x/TKu+b0gCMnYcsjCAPMTZ0DEvhj2PJJceI6pn
X-Gm-Gg: AZuq6aJheEMzpxMK5LHJhiRB7X+jjJe0QahuaVOJq89r7O7oIbCnMi/4UgT7Wt+qyZg
	D2/fUTIHoVaCsmQ4xb2oR2JYSnuqihkdL9H2Eu20z1hwCCmYWubNDDKRkcj+s0+bO1JAj3sfqGy
	5pdUhH30mhzhdiT2LEl6gsQUkLy1fJMagk8xaaZ4fmKSJBZoujoUjuX9tbqRtEhW6fz9Iiab1b/
	DoxxCa0yC/AvOBGaLJLnPjSjldIb3ecknbDJVFCm/A/3R+gOytUrxJ+otvVlAldx79dJslYDYmi
	JZMkedPKZki3xQ3VvC+g7zNIydYoSL3oV2s+1QVtFwlmZBD/+Ja9oiRKcxMsZ6zkuk2vbG8An98
	0DboXMi9CYfIb3Owqw7fXwgPvHehd6xxaXkn38RgCqLaFezCFhzldjHFYC6672RKsljaLLgU8+2
	xdJ9E=
X-Received: by 2002:a05:6214:4704:b0:894:f706:a5f2 with SMTP id 6a1803df08f44-897347b0f60mr115627606d6.3.1771240460070;
        Mon, 16 Feb 2026 03:14:20 -0800 (PST)
X-Received: by 2002:a05:6214:4704:b0:894:f706:a5f2 with SMTP id 6a1803df08f44-897347b0f60mr115627426d6.3.1771240459634;
        Mon, 16 Feb 2026 03:14:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e872sm251996066b.10.2026.02.16.03.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:14:19 -0800 (PST)
Message-ID: <eec690df-5ab6-42b4-a9f1-ea8588f21713@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
 <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
 <af15dfbc-806e-4731-a7a3-6832a781154e@oss.qualcomm.com>
 <be4fc7dd-e7c4-4f2e-ab5c-543d8fedf7d6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <be4fc7dd-e7c4-4f2e-ab5c-543d8fedf7d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0j7jWIgK5Q8B7XXucSw37tQdHGgL_juR
X-Proofpoint-ORIG-GUID: 0j7jWIgK5Q8B7XXucSw37tQdHGgL_juR
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992fc0c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=QtLaxJc4UxdN8FgP6j4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NSBTYWx0ZWRfXz2fIHzqwpYBd
 88vPhxaJ1hvzFs+dDaVU4AFIpWC1SRvuhKVaMTaDqIasBYOzN/H7++nhAgBLCB47cjLKNKW8l8N
 ZkJkBVw2+snKAWKUfiNxxIeswUjOYpkuJlqtj35zvm1WIbccWfKadntG6qEEZYECQpOIWpLWegC
 roAbHFpqOnvQyELvQ7gihCC7TNnAPtfGkiUttQPeZ0nasP5tyy+POiF2dcd0xBfQKRSnSxJUThU
 dmeByEGHCcQEadJegj17+0R/gnB9GwzKZudnNOEmztmfJbD8gRjYnikzI57+bvC6LX1XXiHM0FY
 c0NKCEZQNSRNFqycGTW8c39U2GV+zM/m8U38Qq2Et9fRdMVNmo9RJRN/9anhPsHVgAX9m4xZ2X5
 nc5te11lLNZPzurTIxB0uSo94p++JaXO+lAiF89qpLUtoJQlxIBpCRRSfK+9kYHubW9LgPtO9Zp
 pFOuV/yAhQQ7PdzYcvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A7D5142BF0
X-Rspamd-Action: no action

On 2/16/26 9:04 AM, Umang Chheda wrote:
> 
> On 2/12/2026 9:59 PM, Konrad Dybcio wrote:
>> On 2/12/26 4:50 PM, Umang Chheda wrote:
>>> Hi Konrad,
>>>
>>> On 2/12/2026 7:10 PM, Konrad Dybcio wrote:
>>>> On 2/10/26 11:38 AM, Umang Chheda wrote:
>>>>> The Mezzanine is an hardware expansion add-on board designed
>>>> There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
>>>> is there a better name for it?
>>> Does, Interface Plus (IFP) Mezz sounds good ?
>> I don't know, does it stay Interface Plus on the silkscreen or similar?
> 
> 
> I checked the board - there is nothing written on the silkscreen. Internally we call this board Interface Plus (IFP) mezz.

Let's keep using that name then please

Konrad

