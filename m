Return-Path: <linux-arm-msm+bounces-100729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Bx5CDxJymkQ7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:58:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D592358B66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEA0130A691D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128E53B47CF;
	Mon, 30 Mar 2026 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX9mBO2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu9VyPmh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7E38644E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864301; cv=none; b=ANhNeeloyPyzxsCEYOY2TsSPfwBLityMo8PhcXmVb2lFa8ZRLQBmUQkxy/ZjgMlD+7gD6/3qC3CVMKgYOc3AJvsbpE5zX35w3pR7fJKqRj737wdAGi6vErhXu0l7jSzTtERhj6G2ad6iOOIOgQb0UjurYXpkOyi9yEaFdosGx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864301; c=relaxed/simple;
	bh=w/joOL/hDFpmR137gtu+NZP9+ywPtTp4/A7lTYDiWlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bi7YM6ymREej8Vb31chVU6bUKzIvJlm0k4HGAozaT1Jjlikqp791Ig1t/QV2jvZAe6Vg4xQz3QAranjmOOAiDAGEyGVOKGj268M5m0FC2zvrwmLt2gltvxSkANyl3BF/aCktZ16UM6AW+6xDKa/cc2hJ8ih/EmxT2rndu31Pwr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX9mBO2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu9VyPmh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4KOZ33865822
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URsAExhDIShWcT8dpQmL0WFmSilAGE61mff4TzQ2EpU=; b=GX9mBO2YfhTlaO8I
	QQoL+gfHGgKwk0FHr3DCsT8m/jYNc2VPXrFc1J4YJagemL+1MZfXiBmgKj6BRZ2W
	BZCnA4kT5vtBdZnnM03+NwBnrGFhl8IJZzJOh2+UdzN2t+P2B2atJoK/jXXqes4i
	F3bfsap+q4xDSFK7tFIL3Tm9rUiFRkjOqjBMtae9XYSD0FdaPnONqG0gxb49hZyy
	FhRnG0R+doTPxaAxTee3w9Ec5TXWvYkbmVZyJL25QbWl6R6bgg+tFq/Um5TWX4HV
	f87sNZUmvelWQlAIp3nXhqy4jLKa+NFeBbJ3mMEXX3a6WEDqTuIlh6R51AVQxeKO
	6mydTQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm60nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:51:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso15247136d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864297; x=1775469097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URsAExhDIShWcT8dpQmL0WFmSilAGE61mff4TzQ2EpU=;
        b=Gu9VyPmhtToWqpW4/CexhbjP9gcfz0nNXR44N1XIWIiyztV3HAeeQaa7+ZuoRII4Yd
         DjE6/tj5p2Z0EaGjCmxkdFUnlXrhe2KzHDz2Nup17bDRUOE5saYLAPJBFowvZuBfvdZt
         MGccwRvQj0HaqVEGejhuuJ6FUHwLOdaBnVNTSU7QgcHd1Jiy+NlAMDEJwTqOQ39F7Xcs
         Y6ZIjgd4uCoMkHeWiN4Y/yWSBg4y18y8ds9A1oh2CluvVCh5+uRDNHmD0m3ftuEGkytT
         2T3naFX9AjAcE3K3KSkTI9mva5BBhkMyW80Gz0bye7R93N+nuOdEcsPM3KdaqPVXxGwB
         sguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864297; x=1775469097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URsAExhDIShWcT8dpQmL0WFmSilAGE61mff4TzQ2EpU=;
        b=FLv/5t5lGbyzsO7t+5qN7uYXBLySRckRaXFInyjvMbsEgF44CHkrQkKPU0a3bW+j1e
         pyXiGwyDMY/yRX93HZeFvZAdjPwSAqiwjK/R0K+sF1vxTnzFZvd3s1YTW+kKLaDZKwxS
         QJmRkN1iU4VKD/Qwzznqsa6tOSoWyMk+5RA4mWSloe/3KOQ+7XFX3dclRR26zU8pXTOE
         0B8wXCAeVwDpXIW3NcCxJ7ZPHHm9M7swgsv8lfNyfIZNA9XiMnT+3xdZkZC8De33gTQ5
         S2TCL2lmlq2K6dUKVc8G2Hm7QVxMI68JgGyB7sd/K9zKa6VDtK4kaFnCN6wi+oO6WSCD
         +aKA==
X-Forwarded-Encrypted: i=1; AJvYcCXpVeDSZtIqXvNDfvywI/rLoe7ZSfHt6cneN907qWsEyWQ2xPh71jCv/VXm0hrLY2tqG7mqUWjSWwqIYhy3@vger.kernel.org
X-Gm-Message-State: AOJu0YyCa+MYPFRi9cqONwX0/RnVXmLEsAau01xzIxFEF6xfglanREmc
	6Syz8U+06cXQkDS4Z5RCSf9kH6mKPWJOs5Wsdzw4BjBiZdtsOuwDsj79BMf/Wj3kx9OGmUtgZ8d
	4Ylpm6aV8iVSOmlg45YgjFQdQvFNHjbRB99iMmE4JAy1rBalnQZ0nF6KcIAEevAqJLwSW
X-Gm-Gg: ATEYQzza7POkB8uwc80J9LNwlYFOR+FJ85nXmLhrKXXBp5+kRkrZVtTI9jblZ5St3FM
	r5zQE/qpcfuG3VI+cmfBv0Emk54MmX0hJ+ANpEJOEnM9R0mCGXPWT75qmf4vzB34uoAV/V5VgCT
	uGcbZN5KQr839083PKS8nUt6OQIdEFLseXBJs764KSykTca2ZkiuDjoAQYJFvokl/PHn3Np6Z9u
	okC3bli9zO4E9kvB5iXwMJf9fHubzMLMP9hIlOS8+dZ42f6ZwcfZyCiY+cvdjqNPJWIx71gLTz6
	BQIwZfyLkyB9Mlzzda2riTPuHHXCE+elA+6fhO5gbZUdGEvBnIh/PqXA1sMvdO9t2xTc/KBm/TY
	KF6kz/I47f6aul/DDTo5alzavGGa+dRR++skOzJdIvSpVMHxFPpMkTu8zfeJ383yxI+P76lH/lA
	Q9MzI=
X-Received: by 2002:a05:622a:1982:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50ba3994ea3mr121803921cf.8.1774864296826;
        Mon, 30 Mar 2026 02:51:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1982:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50ba3994ea3mr121803691cf.8.1774864296293;
        Mon, 30 Mar 2026 02:51:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66baa0dfaf6sm1997945a12.28.2026.03.30.02.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:51:34 -0700 (PDT)
Message-ID: <e5372711-094d-47dc-8339-b4df1fafe308@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:51:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
 <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
 <05719918-074e-417a-8209-cbce9d49d94e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <05719918-074e-417a-8209-cbce9d49d94e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: phsz4CKOMauf2gKMtMVj2DvAZte7PTCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX2PYh2/7essCi
 MfrBNYOIL8klHa8fN5OPstrheyJxA07KTGyrOavUR/wnm/BfkI/XunS5LmzC8IHXKcRKWA5VPN3
 6uPaQcoSrICDGf+ytrKA3HdnrTxF72SSEXr2qrGCCE1ThDma+X6Mfk/ob3nRnqndpQ50M78E4DM
 y/w6pTFVYh9bSjiL2WLaUEHLjeZ8j4DQ/+s/4OpDyHZFFqHhIYYoUxIJ3GUn9IN7DhONTcu7t+2
 rxb+ak+yIqu4oax1NCZ2YZ+1ypqve5ktL0OGPbKJWJ6+mlaI4CQGEzn5sccJwNOxfzWgQc9zZ8U
 lI3KAIPzmLyJFvw+bujuRYMwCJwsH0mqNN4ckR3DMgXwg2j3BjmDDK00xVsxXUaXqjswtEOhPk9
 VssWaeNxLGtZBQA/M2sHjavCegCtAgPcyrkVKon0AwySXbzBbkyjl++AACaGgqq6tUwsPMiVOjc
 HfyabrCPg243SyZot3w==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca47a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d_tKQ6W3Izun0czx798A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: phsz4CKOMauf2gKMtMVj2DvAZte7PTCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100729-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 6D592358B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 5:19 AM, Jingyi Wang wrote:
> 
> 
> On 3/27/2026 5:53 PM, Konrad Dybcio wrote:
>> On 3/27/26 4:20 AM, Jingyi Wang wrote:
>>> Add SoCCP node on Kaanapali QRD board.
>>
>> This is really more of an "add firmware path"
>>
> 
> will update the commit msg in next version.
> 
>>>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>>> index da0e8f9091c3..6a7eb7f4050a 100644
>>> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>>> @@ -781,6 +781,11 @@ &remoteproc_cdsp {
>>>       status = "okay";
>>>   };
>>>   +&remoteproc_soccp {
>>> +    firmware-name = "qcom/kaanapali/soccp.mbn",
>>> +            "qcom/kaanapali/soccp_dtb.mbn";
>>
>> Given that this contains battmgr now, can MTP and QRD use the same
>> firmware?
>>
> 
> Offline checked with the POC for SoCCP firmware, MTP and QRD board
> share the same soccp firmware.

Thanks for confirming that

Konrad

