Return-Path: <linux-arm-msm+bounces-102939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBYNMBLW3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:40:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7173EB670
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E8033012EBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B316E3C1978;
	Mon, 13 Apr 2026 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPsh2Mik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMbJOIEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED6A387358
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080320; cv=none; b=HsipmC6C1jaoPoEV2vGoj1O9WXdUm4yy6+qNU0tooafr5MBpEYyIQu+eDJV1Zu3lAtbg/73ZdiZ+w0G1mFKcmKq3CXcIdCbdgmXad3aBvnU0DsHkKXCPupqHrZBIOZFtc7hKEfRRWzWBEuzhrapSfkQFwKw6wmzQsLb42N+z7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080320; c=relaxed/simple;
	bh=7W6MSgWhGfD8fh2T7+UUk80DgPmihpwqFYTbo/YqoB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCaQWf4Hihf18qxLgmZNRnwm5TLPaPrHHNdKA2oBdxslRBjCgK45ukI9Or5qrdW1bHlkWCogh1Qbpco20Awqlroc9pNt+0IPybuld+cMXaFCCm3nVXZ3h5BqwutOOx6h3Db36y+4oNKMJ2Q3luSs5dZI73gvAQu5a+1QNxuPsas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPsh2Mik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMbJOIEB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6mC2R1058886
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=; b=hPsh2MikAnB728Nz
	1ldogOOgLuJaSLmLGUguMyn209PVBPXYIkB2HQK2WCMJuswDSCNEgw3+sc0ifdb+
	g/jzhZlqqvYLAMZRNFAi1tt9/SM8dDvCWp9dUipod3eppm9rFDLhgBVLkRaVUO5h
	u3I3YdUDf8SdY41uKNioEuVLMaIKlIPEitfw3i2ZL07rUFwpKlA262zZsdlV5BjJ
	j6qd9puv/C0zvXcdx2zK5vO4lAbgitxhw4ms4W8FtVwnp/bp7EvAHFvZ9HZB1OED
	4oZE7sMzky2eNPZCav7PMwxGvPUqUCiBZwNweRnTALMSNJlSYN4geeEidIUDjiG8
	uZKoKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtn4kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:38:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so7951591cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080317; x=1776685117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=;
        b=HMbJOIEBfurULvrPdliDhjGy/Z1oYkXKVzdaccH4dTt/ZNQTKzEfEpKdcPpA9zi8Fz
         Ni93Gc5BnTJ8NP/NP1gnJmOS8RRPyo900lXowQuC4T/S3vuDr3TXTn12MKf8Z23NYJHW
         IHvgkJ3ibv95dn616rT9E+wXS6NB2gihcrzKHojYsmDUJDEDoyToHE7bO+9JtJhBdlif
         NIWhYz4i+9exfjk6swtJ6J3fk0P4eBdM4xKeTE++uSGVUFvrYmfnwpbvy5F3EBJDCnvP
         t/RpJJBUIrxMsEVkUkLnERpUCS886VVFjteOK74YEnP+jg7ctQOUoeeRXQKd58I3yFJH
         cGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080317; x=1776685117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=;
        b=qectk3ml+h46B/9BB3zc9iOE1fd9PFOOepBcvYOgOHjHilCIof9ZhuDRzTQG3su7Cl
         ZhvtLQ2RJbRd/AZrna8w4XaWmt1OiKlcIxtrxcvg5V7p3YKtczarfyQfp7+MCfUp+hUV
         gpP3V4oCma7sK5yIlm7kEQoFjYplFCW9UY715BP5fRjzt5u8Mu3f1NlNrpVXaj6uII7D
         0FgZUSJxqYdZaqTD08YPAQkAfsUVVD3smMOS8AwL3LnMLqikyCizq61/Rs06WcIzarjk
         QLDXdpGAnPhBjwRjbFKwCxgn+TpZXKEGdaH38PLipOQBmVksljlk2shF+MpadBlmEFvo
         rGJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UM0qSy+5/h9+YQ5upLFtSCw3JSzOVgf6LgEmW37cERJ77jzDqwA6wZg+MCTeMR10ZScMLCvLiuo0NMbr7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz68v8KdSN7LIz0RldzexCtnu3PhbAxr/kN4cRXU7Qx5tjAb7M
	EERPcV/2NyrxzusqZbPFtDU2SUOhj5fZFbSaiEiv4SVLmLtTF4yJKTZhShzxBUFSLYGjnQ0TEIH
	mqslb3RsGaxOqTX6Grne2ylJUea0zsoqgH8Ww4a3LALpaSPuKc1WO0fXWahNWj9fjGera
X-Gm-Gg: AeBDieuh7oDThLML8/FzJPA/qJ1VYhaM9C1SpQsz++k89Ludy4k4VQnXnb8VeBESP+Z
	7P7yrQWI8jPAkgYKUW8hSnW0+t37JuVbppA9CR4olK39dMLGpkyrLdmeMJFSfgSB69vy685i2eV
	C6k3sQqxNRyLH9PIP0rEKoaOKB9tBUI1aghcYrHwp4CXziEYyICHc9DlnBLrKWq/g8i3IGbZkgI
	pvtFje7+1mbyJRCw0Ns5nDbM0Ve8srRLAlyYps4VM1XAF4jdEFDJkfoP/TqVZnHHnanLUS2zY/t
	I6hempvUx2DkzztrCGr+U7lpRmCrdik+T7mAacWOAHkd/Lkw+kOAq9pvf96tKfjrHOiihGSi7/j
	UVqPPVtn15jEiLevrqxpl7mPE9lZSsdB8B9sx4y/ZSFqXK1pB1jrge3Ulh8AqnFGFTRyV5p4ewb
	BZwBA=
X-Received: by 2002:a05:622a:1393:b0:509:2b5a:808 with SMTP id d75a77b69052e-50dd5a9128bmr144385201cf.2.1776080317445;
        Mon, 13 Apr 2026 04:38:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1393:b0:509:2b5a:808 with SMTP id d75a77b69052e-50dd5a9128bmr144384911cf.2.1776080316816;
        Mon, 13 Apr 2026 04:38:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de9b414sm313460166b.6.2026.04.13.04.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:38:36 -0700 (PDT)
Message-ID: <3f084f3b-861f-4444-805c-ca8b431f6cca@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
 <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
 <cm7cowdic42qziuwpe22b2yuakg2k5lqcdnfs3mspvbvprnbto@6kxucxrbnsc6>
 <e321f7dc-4053-4a4d-a0e3-40c3a8fc0fd8@oss.qualcomm.com>
 <3498c03b-beb4-4235-91c1-c2867ad8c956@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3498c03b-beb4-4235-91c1-c2867ad8c956@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcd5be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=Ng2_SAvxuEZwIUAnxNUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: hHkbWsAVQM37xR61KDM70rL8yggFLJ8A
X-Proofpoint-ORIG-GUID: hHkbWsAVQM37xR61KDM70rL8yggFLJ8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNCBTYWx0ZWRfXzRyKReWlf2xG
 raFlPgJkR3TS0+OaktwLr17/gCgKGHU+z/5v8xQ0FNACMtP475yPR1B/deJjmBi3BFPjL+RtbcC
 tL+BsUYCLNNX7mchTIBCF88ztcKvbaCJ8PuIKu3kStjPzzgTFH6n+Gr9X/pk7BtLrNQu+vPo2NE
 KsucV9Le4Qavjb4z638ByZemBFE6UZYCSjQcDXJJ5R+zHpAg8yejbgzFP4vICOyIcTtiMZ/LQ2z
 SskKUIiNI5f0qm9uCwqnG7s31VwAjfobVz0Z6Avw2NpS5W5/1aMIhSiLPRu9L5yJ/uFl7WKw+OH
 bLvB0uSp/I/ByIcxi/GmVd7sTEePtCnnpUZe7VRRoVDEWUAe7bIL3pl8QCoe0DUv6yZgQcaeC3e
 iOii+1gMA/Ul3M/FzOCjhmAEqAHEYqVV8Puk/16k8wiK5pKRsuL1tvPCsK9Gm+Z9/DgyGukSUta
 42hbIgpJJk+5ZBkQcZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130114
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102939-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 1D7173EB670
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 12:50 PM, David Heidelberg wrote:
> On 13/04/2026 12:28, Konrad Dybcio wrote:
>> On 4/12/26 2:41 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 10:55:53AM +0200, Konrad Dybcio wrote:
>>>> On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
>>>>>> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>>>>>>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>>>>>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>>>>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>>>>>>>
>>>>>>>>>>>>> If the OS does not support recovering the state left by the
>>>>>>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>>>>>>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>>>>>>>>>
>>>>>>>>>>>> This is not the relevant reset
>>>>>>>>>>>>
>>>>>>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>>>>>>>>>
>>>>>>>>>>> Thanks, I prepared the fixes [1].
>>>>>>>>>>>
>>>>>>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>>>>>>>>>
>>>>>>>>>>> David
>>>>>>>>>>>
>>>>>>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>>>>>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>>>>>>>>>
>>>>>>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
>>>>>>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>>>>>>>>>> place
>>>>>>>>>
>>>>>>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
>>>>>>>>> change that to CORE behind the scene. I'd prefer David's approach.
>>>>>>>>
>>>>>>>> Back when I replied, David had a patch that removed the current RSCC
>>>>>>>> reset definition in dt-bindings (at index 0) and re-used that index
>>>>>>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
>>>>>>>> specific commits when making comments, note to self :P
>>>>>>>
>>>>>>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
>>>>>>> work.
>>>>>>
>>>>>> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
>>>>>>
>>>>>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>>>>>> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
>>>>>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
>>>>>> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
>>>>>
>>>>> [...]
>>>>>
>>>>>>
>>>>>> These (or very similar warnings) are around sdm845 definitely 6.19+ /
>>>>>> linux-next kernels for some time, but pretty harmless.
>>>>>>
>>>>>> LLM suggested multiple fixes, but when presenting possibility of
>>>>>> implementing mdss reset it found it as most preferable [1].
>>>>>>
>>>>>> Adding MDSS reset would most likely solve it. It's not critical, but not
>>>>>> nice to see many red lines in the dmesg.
>>>>>>
>>>>>> Is there something I could experiment with to get closer to have proper MDSS reset?
>>>>>
>>>>> I don't have a sensible solution at this point. We tried using the MDSS
>>>>> reset on several SDM845 devices, but they just reset. So... I don't have
>>>>> any possible solution.
>>>>
>>>> The older context talks about altering the existing dt-bindings values
>>>> and now we're at hardware (mis)behaving? What is the issue here?
>>>
>>> The HDK and DB845c reset if I try touching MDSS core reset.
>>
>> And David, does that also happen on your other boards?
> 
> yes, I recall OnePlus 6 or 6T going to crashdump and Pixel 3 crashing too.

I found some older version of the docs for 845.

It says that to pull the BCR, all clocks to MDSS must be off while
the reset is in progress. Maybe that could be a hint (or maybe it's
just broken on 845).

If either of you would be able to catch an actual crashdump and get the
data out of it (via qdl(rs) ramdump tools), we could see what the TZ
says the crash reason is

Konrad

