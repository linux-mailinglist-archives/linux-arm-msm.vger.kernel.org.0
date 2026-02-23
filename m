Return-Path: <linux-arm-msm+bounces-93681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAFsH1pNnGnYDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:51:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B1B17675D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09832306F7BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB8C35B649;
	Mon, 23 Feb 2026 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJ9lYaTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx+ULGgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9B36073E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771850905; cv=none; b=q4rH9dg2YakHsatBuw1dweYKwvS3wLtNo1CTVYH5ekzIEjdINbcJk9KhyAhjjb0GaeD3e1DIlZHFrPtqVKMli2RTtyRUilfloW7jD+xRwieJp9J5qvBBa5qnC8fByGV3w7mhHYLCfkIXfVkgsD1Qnl+Og5kdnfZzVFkaps/SAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771850905; c=relaxed/simple;
	bh=hK6Aw7ZRr6uBxrpXVG7d8+8oNyEqk1WzjafAOU1QXV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsMRy047ZivCawWhW7zcp40bnZ3DuqoWdVIgH2fslfpMGFDoAtWtq/TZR6Kj9TcHABS/rt98Zfc8tWzIlhVF/SgNRns5MFWetZ5ncXz8wV+zvv59nSlE6F6ooSQ0T6n7mgVMxvPatjtTF+g1J6ByoM0eh9O4zvy3zTRXfixDBqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJ9lYaTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx+ULGgd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9tDid3486255
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2TsKLmSkhy61Ki7QLK+97jHQkSpbabykc3HbTiayOo=; b=YJ9lYaTwvN5swWWF
	TZ6luti8nCFNNTkmRMjP451H4B1VuTHGmv/viBBvesVqN9hjdTB4G32wSG67ini9
	iJJgh8rXt8O6U/x4Tczz+p+ANuqIJVpdU77B6ODVQbqUOAxp7cZmU+dL3I42nZF0
	dyJvPUxLf89XOdj79imL7It9cPfOxCPaUHDsAx+VkCK3Un0iNa04nWZE/a68twVx
	obURt+RTplVQI2jDQz7YjeqfXwItADp5oaztbu7wW66VSrU2HV89JyOp9JckCXyV
	bR4P4E9Q87u/muJrXeflNFn1wWRh2nQT2/9B6KbUe/trc7JYaahKrr1PfZ6NQn2G
	9v3v/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8mpf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:48:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so456710085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771850903; x=1772455703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2TsKLmSkhy61Ki7QLK+97jHQkSpbabykc3HbTiayOo=;
        b=Bx+ULGgdf75CNoNsOH0YYj4uTqww50XEf83jzluo8Zq7ANhO5WixmTrZzDo+nQ/16U
         OyHi688mocD0vy+I56KP9irB1tsRWk6TEtEv4qmTW5XChSnwiJ1qVNsT+jbDwZdt5hD1
         zv9Q2RPTcIlTcpCdb5bz0/MhYn0hrAnvyzgthsFzIuZeUeWXK+nSa1F6QiJoCvjemobF
         lzZ/3pxkHFeZBdCyc35ZH3l9Pwl5d6TCe7Tou/qsrMPA+Aijz+Xm0JZKzf8FBCTesCAr
         H+V4HLlGZajfJceSGIYQpttmyvNSAGN/WxbqATEf+i4rf/zAtA6wLFrKkwjYj2fPBZ/o
         LQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771850903; x=1772455703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2TsKLmSkhy61Ki7QLK+97jHQkSpbabykc3HbTiayOo=;
        b=M3V5jjrR/+clgahMzpwG3wpOiUaYND4crN8bhH62Bl8+X7ulUYQhjBFc0EtQyzRbn1
         UyPrw5MOn1Mn4zXaTRS1jOIGhLgGn9Cq4rCRz9tvWyoPco0KtKSOSvMlAF9A0Nwrxafa
         N5WyA0sesICd6lsgIfydVtc1v3pSG42+R0YQCu1zawb02EOrWpf3VDrfqnLh36VOAfOl
         beRDIs/gLi775esNKBiDxcZLKRtP8u0NLsDU6cYlZ9zEX/iJha8PqN5STbr89K5xt806
         xi+dO6z/2PZtMrjphDzZHBb7FtKDlUrEFwo0qJct4HCaJR4oV/GiGaHhnMcCWJXBbx1q
         LDaA==
X-Forwarded-Encrypted: i=1; AJvYcCVicYd2EvsivtwETrp+d31gK2r1Wdlc1IwE9xoLqoRcdOiYk4DEe7I9WIWMHCnWssH8g1N61L8SRvybv2V8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cGoSzoh9CTYfPJvvoW1L/qzMUI5na99LJiv1Ay9YG1TsLVjS
	agy1Mrodg4794Jk18jxdG9gN5+XA/KS7u+ZvT8+xdzt5UHkF2OK/prEh8XFBlGnSnvSBYou2LCC
	2y5KO0BODq9U5OU4pRsXcImO92NG61xwZWDddVyap9gnWSqX2Df362XjnawkYxige7ZHP
X-Gm-Gg: AZuq6aIZiMuVdzboEVylrX4OeAGugpxzcxcdovxGnxgzu4AfnTlDgh4yV6nrgmAB0Wd
	3KQJPWMMULeVD6tixvaVcNA7IFZyMCk1twn5uwUcBT5F+jD8ABdzQc+jKokgc5ZPa7MPsTsVlBH
	yysoxlYZMY7rbGpQBiiax1cx1UnIs3l1M2efJ2kKZcS4nb8a19Cz8H3iJTnCBsw/CxXQyVX9oNS
	0wob6H7w5r4LKty9+S7MAQwDNET5PLFQ5rxvM3/60yHmyjs9BekTPOnw7Lp+3vud8N/JmljXtW+
	GFze69l3xxCb2NvvxjJROR8YWqoaPSNgAPyWSushwOI9n8ExELwp5kSXsP8C7MB9Oo8TMA9ghd5
	jw8ZDx9GXshcLm2mM7WJMjYC1H0mIT/nNcWHBQHS/qUKaud3NbS/nJ5CcBO9+O2HAZ0vzSxo8El
	EKafs=
X-Received: by 2002:a05:620a:468b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb8ca7bcbbmr732253085a.6.1771850902529;
        Mon, 23 Feb 2026 04:48:22 -0800 (PST)
X-Received: by 2002:a05:620a:468b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb8ca7bcbbmr732250885a.6.1771850901989;
        Mon, 23 Feb 2026 04:48:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm314211566b.67.2026.02.23.04.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 04:48:21 -0800 (PST)
Message-ID: <43c62c23-e75d-425c-b788-050101719d70@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 13:48:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <at7j3kbdixd7aveiol37pwgudl2hcogtdrvdgcvgbbm3t5irfc@4nvv5ptoezyk>
 <4ae0dd46-5f5f-403b-bbc6-1094159be302@oss.qualcomm.com>
 <01593963-2bff-4a8c-a6f9-c62bcf21ccaf@oss.qualcomm.com>
 <6d9b9e85-5a54-461d-8f34-daf0c042b2b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6d9b9e85-5a54-461d-8f34-daf0c042b2b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EBlzp9ugF9yovDBPgUodOxt0wS16yPsO
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c4c97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=1ZEf2EBqRol6lEqRf6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EBlzp9ugF9yovDBPgUodOxt0wS16yPsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwOCBTYWx0ZWRfXy8kVqAI8d1qA
 n33Lur7gaqoYgCZB7PwQEDRiBWNQSo27ZCcEV7GGTAvp0zsyIrjBORQiE2nzqCvXMXuIUOwvNgC
 UJTRr8ykYXmV/qxm8WYZtq7J0FMNQjzbkpS3K+w4RygfzIDXR1ExEdnFZHBBAFUcApgHhDWeWaM
 BDhXoN2/ZGtsuEZvb4i6L4F3UcPw50Ly6bncm8EG3NYdJzAF17/kxnH1bg1lTz1Gt0ao2XzxoTF
 d6Sll9RsOroeiGNp8Wd+sVITub0q7+tGwi+H8ZRRfBDgKoOmNrVXr5+ylO6PjPSDHY5CIxxqlE4
 waEdw4IklqsNobwW7tflOdg8On1gmdylqeVmV6kBsiGSSDfKl7UeImxFgIwdScW7scYccTkk+DS
 CKFMLwWBZjI11t3tNlDejqPd0SgPParDhu/tmy+DESwJ2FxBAz9dNapBID1IsafBIGQdpZkdHDq
 PkkfK5EvlelqBysU1ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93681-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: D2B1B17675D
X-Rspamd-Action: no action

On 2/23/26 11:36 AM, Umang Chheda wrote:
> 
> On 2/23/2026 3:29 PM, Konrad Dybcio wrote:
>> On 2/23/26 10:47 AM, Umang Chheda wrote:
>>> Hello Dmitry,
>>>
>>> On 2/22/2026 11:57 PM, Dmitry Baryshkov wrote:
>>>> On Sun, Feb 22, 2026 at 11:05:45PM +0530, Umang Chheda wrote:
>>>>> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
>>>>> board designed to be stacked on top of Monaco EVK.
>>>>>
>>>>> It has following peripherals :
>>>>>
>>>>> - 4x Type A USB ports in host mode.
>>>>> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>>>>>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>>>> Nit: routed to? Is that M.2 only suitable for WLANs? What is "WLAN
>>>> endpoints"?
>>>> routed to?
>>> If I understand correctly - you mean change string "connects M.2 E-Key connector" to 
>>> "routed to M.2 E-Key connector" ?
>>>  
>>>
>>>> Is that M.2 only suitable for WLANs?
>>> Yes, this is suitable only for the WLAN module.
>> If I remove that WLAN module and insert an SSD through an adapter, will
>> the board spontaneously explode?
>>
>> "intended for" is less ominous..
> 
> 
> Hmm Yes I agree -- will re-phrase the above statement to something like below :
> 
> "The first downstream port (DSP) is routed to an M.2 E‑Key connector, intended for WLAN modules.”

Sounds good, thanks!

Konrad

