Return-Path: <linux-arm-msm+bounces-117184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8eVGENS4TGrLogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:29:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CF67191A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:29:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hd6olM5O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GhE3vjZ+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2C863054AF1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C263290A6;
	Tue,  7 Jul 2026 08:27:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57BC2C027B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:27:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412861; cv=none; b=NGhqWgJjK3ceHl/Pw1aC6ndJKdkwrreyoN6gxK7gbUpYlz03ian94EwRvjiqDe3FaHFkaA4EI6JBKMTvZV0tnctKaHSa8pabEK2SumW/y9hERsLoUxSev6oj7uFkQQyJcxqKQL8pe+zcOetzPRj7dkt4h+obV4k6pcY8ktMj8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412861; c=relaxed/simple;
	bh=rVjNLV8fcin1IfLO3gAv3V8tbKv67Km9LTOAjwI0Df4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a94CjxgZThEUpo+J/3PMBMoNN4dQFxs+ZGBh9eA35cUmIzyyRlRMs7lUOsD89WPtahcA9/6RvvXaauTxDtnu2POSqKE5GaQDkamXlSR+lrchBmF9e34yKEPmvGGnZ7lUweSW5rpqgzcQHSv3w/VRAsXbIbBZlWdP+mht1+xY1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd6olM5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhE3vjZ+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E5Va3004604
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/ZgBEwLyfyIVk+OdidjeJ6wnAs8OCnD38pl/d4BiaE=; b=Hd6olM5OvIkTE1Cc
	3IHxUJsLzoapbKi5IvVWbpt9Di0LLrbGe1Q0+zR8pSMt8/JsGBPtVlxI54IxVk3h
	yLAmZdmnehhBSvVGyxpFnWL06iIUb5+9PdjBqQL70ngtwcTbfqNomy9/ay5UcBNr
	wxFkCc8J3pSwwd5Vhgsk2gk/PPuGh0MeJjTSQ9eG3SE/2Uf6LLs5bzSyTfTzV55y
	9zjTDo+doOmTRuezCNLmpJPRHxDpiAqyIj0ceSq3NVJw/2GuMK1sylikDMtJ/K9a
	FehGr8ut4LaZk+xXixOKeyLrThP1YFLkY9fSAXz24PiL7V9no6x8XRULiO/ANSU/
	Ao9xdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su70ybn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:27:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso12296801cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783412857; x=1784017657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/ZgBEwLyfyIVk+OdidjeJ6wnAs8OCnD38pl/d4BiaE=;
        b=GhE3vjZ+KpoXM/pAMjWGUIiUUvgvQhFIV8OyCW1K4pYCQI+qMW7SeQQMcfXfIgOsp4
         mIfO5tkSo11uELzsyNOUyjqlWQObXJ9SnZHBWOnF7GTOUcPs6dl0MyLUn1bRn88Uyc+G
         h3JGZeWLtTKxwzzIQ9+ALoqvvSIcNFtuEwU2a39vhfrr4Jn3kbPT+n9OtNHh/wTfeW5N
         G4EzBXb1yMd6L/nn+5p2cbhk28bvspegTwQ8tJdgcvdYnKEgRkL/C3Wa6pEtw9yBX0OP
         AxdfstdWf6ftm7X3u78o0zyPbUZJSuNGqYKpThxc/a04kc04ZzK8TKvfu8ELFPJ7Awni
         VKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412857; x=1784017657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/ZgBEwLyfyIVk+OdidjeJ6wnAs8OCnD38pl/d4BiaE=;
        b=lMOI9KYAiHheJtu2X8z0o5j6GgQwUkVETSb4y06qg1L2vmHKo7puqofBPIIMknWm+U
         msGGj7A7esJ8igV1Ne2mKMojAS7WmDVk/4cnBfkjc1giqAM30Ddg5UjGXVQ/guZuSCbM
         SVqsZKJh0RsFM+noHx91uRpi1dJt3i5joeCs//qfVFM4Meoiatbz9sNiJJsG0JtIQBah
         dpHDzGLj6NXy6R663IicFuHRQ0HKaIDWYujl5N3oDPyjDDeu8nDR1reZh/6EeAGrWGf0
         kcGIVMb1ns9Y4yOn7G5zwsrkcpxBH0VvaXaS/ZH2cT/7O+NBooCTZJJ2jucp+Z3wzKgG
         7h2A==
X-Gm-Message-State: AOJu0YxWRluXPheaN675MP/3owHEnNKS5YSwP1IvRnVz79pq7oLwlwYU
	4fOKwK3K0f3oFwPZ1m6cQmQi7tJfPdRTVxMXGPvlX0Tc34MB9uvpn0ip00OCcGz3wIk/cXLSOJK
	Cyjxe3ptTFUPuYNk2wpUjUv5LNNqef4WwhWICcPwfrlkIjsNGX0vfo0WbO1deHUgU9S3k
X-Gm-Gg: AfdE7ckH0atwq9K0FNY02426+TPr4yt4euzwzcmyjevDEAQTivFe8sf4J14qIHs1XOQ
	ansTzMON2i76CS+1Cmp20iV/H8EIqZnaM3VIHQHxsTCB0sdr81qfStehHeP0qADcrXGyNlQQER3
	KHtbx/9BOV8PpSRtf6KSWYCUa/9Fn6cwlmCTWuACaR8HbxFlQq98Q5wLfq1UlHMghfOTSQnHz71
	N/KImvoHpCWduYsFBJ7jTmuOHAx/pMAd6c+YcdiatEB0KY9FGuTJiz4HuHBoGYN/+TnNI38SkIc
	5UAUSw4HKwPZ0ro7DznwHj10cjgwO049HHpxyecmudyoqaNZ8kB5PDLh+VsuFbYcw9UQR43n/4R
	cgS4n370g0Ody/QscqzdsY3XQR0Wis1q5neI=
X-Received: by 2002:a05:622a:3:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c4bd94c36mr122379451cf.1.1783412857089;
        Tue, 07 Jul 2026 01:27:37 -0700 (PDT)
X-Received: by 2002:a05:622a:3:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c4bd94c36mr122379271cf.1.1783412856618;
        Tue, 07 Jul 2026 01:27:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm81296866b.8.2026.07.07.01.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:27:35 -0700 (PDT)
Message-ID: <edb2a1ad-4213-420e-b494-af71da00a213@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: George Moussalem <george.moussalem@outlook.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
 <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
 <6a312986-49b7-483b-8253-5bb3b842ac34@oss.qualcomm.com>
 <SN7PR19MB6736F66FB96D6A43C128AD719DF02@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736F66FB96D6A43C128AD719DF02@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MSBTYWx0ZWRfXyJi6ixj92QNW
 ISe35npmV5M9mGpMNNbI6UecKZiJ0V7GJWNq/4yEllAcKF9TrjiNWXfcBlCf5/ZOxJBwQ42tjLO
 6tHsTkK3/g3zEH+irGvOQ44lNvs1VVVOCGV19Ss0R7wxvmrKaKb5E12M19odN0KjuKcjtdSu5Om
 ak/3gevAD84qdxSHPVN65LXEx6XdIxURkX3dsgBoK/FkZmH0AUHa7dtZjbvYVLDJjZXPWKIpnx5
 5jHzQaO5CNvmqP5XkGeL6ZA5pINXDojeWNQu8HdAG+gkAnGYTJpiTl1RWBrSRxkzpZwq9TNVv0b
 XXhSCsio5YdUL1fOoLHINaNNG8Eaa1/OOxZ/Tv7bFMdWDEk75WkQRlI5M5SL6jGYuvjXSm78Khq
 n8bvzcnBpwWfUyt9gnW4VHP6vUeBsv89LEuD2bE5uKQYQnh96H1klcqDgbRFI3QGeWY+rfPF8Wo
 osB9PAOAdlZK0y5c89Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MSBTYWx0ZWRfX6p6T9x55CmMo
 UFbJWH9+BSwXqjHbtZ9xVuka8MxpsqtVR7WqmUWSECYyivYxyvPcnSGcusEmeTsIvSl5LM6P5DW
 E0qqG8YdHWBh2Y90Jy1kpNMwJYiB88c=
X-Proofpoint-GUID: mK3nQJv78hTxfRV0rKKTKYwGmIXhqSK-
X-Proofpoint-ORIG-GUID: mK3nQJv78hTxfRV0rKKTKYwGmIXhqSK-
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cb87a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=5lF2iwBCjgZWocWpIzkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117184-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0CF67191A9

On 7/7/26 10:12 AM, George Moussalem wrote:
> On 7/7/26 11:51, Konrad Dybcio wrote:
>> On 7/7/26 9:51 AM, Konrad Dybcio wrote:
>>> On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> Add nodes for the reserved memory carveout and Bluetooth.
>>>>
>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> @@ -136,6 +153,11 @@ reserved-memory {
>>>>  		#size-cells = <2>;
>>>>  		ranges;
>>>>  
>>>> +		btss_region: bluetooth@7000000 {
>>>> +			reg = <0x0 0x07000000 0x0 0x58000>;
>>>
>>> FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
>>> just be the 'reg' value of the bluetooth node. This makes even more
>>> sense as you write to this region using I/O accessors
> 
> I wasn't sure whether setting the unit address to the memory region it
> uses and write to. Perhaps Bjorn/Krzysztof can provide guidance?
> So essentially, the proposal would be for the bluetooth node without a
> reg property to look like:
> 
> bluetooth@7000000 {
> ...
> 	memory-region = <&btss_region>	--> which starts at 0x07000000

I was proposing that we remove the reserved-memory region and define
this register range only through the 'reg' property.

> };
>  > FWIW2: The region is called "BT_RAM"
>>
>> Konrad
> 
> Thanks, I'll update the node name of the memory region to bt_ram@7000000

Node names (between ':' and '@') must not contain underscores, use a
hyphen there.

Konrad

