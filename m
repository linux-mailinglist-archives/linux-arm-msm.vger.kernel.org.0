Return-Path: <linux-arm-msm+bounces-107830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJkOASAGB2p+qwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:40:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885E54E9E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DED530F2957
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534AB478E42;
	Fri, 15 May 2026 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjzVHlaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOFmqauv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A43449EA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843496; cv=none; b=bX/M6K60+HOKUFGWjPykSupSpqs98ZfsvH1Ch0a9u0AzacmvNm3D4dh8jIr5FjXcOH6YwYa7u9M/Uc9qt4IAm08MfG+cs2QueXgX3vkGS5C1ZYiG5OyVhE4edOo3aJ0c+gNs4gM+QANKjKU4qMrzXbqvLUIBm9/3PC/oexRjkZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843496; c=relaxed/simple;
	bh=C5eDbSnia97kcONPNPgXoQZz4SfSKCYG0QSnGzPC/MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTh37WHyF4lcUl7+8xMtTjS+Qf6H1OzUOY7cDab8gd4VOPeI2bPZpoCPEF+bZZqlp3Xtw/ys7OiJhaKe32Ep1nA9pFQsMmkWiTTlftStiQanl4fmlDEOiUQjLW3MuZIFNvvLaaHwUVnuLG1Yo1qIjrOljV0GK/FHPPwGK6PwNZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjzVHlaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOFmqauv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5YmJ33795642
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZjUt1uwVNfewUqlWPi6VDRZNzVhKIxFXDMZSasRtuA=; b=QjzVHlaTUlnRtWPM
	6lVRtP41zUil4Xt5gSQ5RgyhlLEjNmwzeKL7FFcTODt3W1dRYV8svi2e7QkkHPUB
	cShncDLiHi7I+AxGuTSjDoMcu1E1GRL4CVVJ2OPFakszoisNEnHsSJQFnBxxq0hj
	VleOcTHTRvrgaJ+GRlMPO/DKrGOs9HeRCP+L08V0KY64BReSe+dwthqq2+Ur+K5F
	yQBiDzXZXROtDYaHKdy7LtlpVmae6BG7jW0P+5D8OaryMCSulORFkKVkpHiGXYQn
	HezfkrpDy3lOvv/CVD7wEQuYndqH966ntZCOlWP0jrDD7pE3bZUZTYzP14WmoO+c
	oFAqBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stx9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:11:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so156772601cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843493; x=1779448293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZjUt1uwVNfewUqlWPi6VDRZNzVhKIxFXDMZSasRtuA=;
        b=EOFmqauvktwIr+6czFpJdmd2jKEDMWx/b9DDzzXI4ix2fdZyPXpygFbqBpmItOsAik
         NCSkUbHf7wcJfgGPsKZig4GJ8FbUVaJICd0O2Xd03uN+vcldBvwHzSHpdU70GDnU/o9G
         k9izT/u9lpzY6bQWF8huhA9D8AjktUBuX1A6Xe+m3vZqa8f8f9vJAbv7C0QEzirAgVy0
         kO4A3Zkna/BfBWXzsA7/Lw/yz4X90W/TgKX2Ho3Ax/riYfNDRbeFtkgpdCLmPNXN9H0C
         Bt21EW5Cfq55Ed60409DdLR5LC6G6EUYBW2/tPe66Jr9PdNWU0BRwJRWxuUkw1vZ8fCj
         3/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843493; x=1779448293;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZjUt1uwVNfewUqlWPi6VDRZNzVhKIxFXDMZSasRtuA=;
        b=R8SWTD9dxm++lg5s+drZKrlLvvz10CFtVOnktMffFutSVXt4uc5YAKKUS0GkbSWPxa
         hM0uRAPKgOjENdIGw0TK5Onn1wsJQ2sGePoIuCThrFU39o3YTMCmZg8D9lP3SnFVAbaf
         RWtiba94+etZ6tFFA4atu1GgpmODgsrP1yT25Ssuz6I7k8Jkzj7iUKi5qyKpr2kpnsFd
         JFtmYYyMKYYvvf4FZ9lWpR5xOZiaRyZtqf6BbfxbEFDae0rjHJEcrLF6oq8aLOyhT823
         UdmHIlCsvaLcVADORrjZDi/Nle63738AGjUHUezMVG1n1vKbMBcX4YWyI4V8GM63sqrq
         8g1A==
X-Gm-Message-State: AOJu0YwKf7uQ/5MnLwA5EH1ybZ6lyKJJjI56Xa8FtA5wlqDsa/AGiY4e
	Z6xyySgQ8SbazZI12EthIhGVy86lO83R3x8MaRwY5e/zFRq/kuSfkZ5ljiR0+x1qz7GCjANjbd2
	F9Rxtc9x9QxEDPws3s/rj0k7xDmoS0jYn35++NzquXmL3ap/4quDvjsdrnLl0eq0RVhGF
X-Gm-Gg: Acq92OH+nRClCoKj3nX6uXKjq9eD03RQVVt5LlO8ZR+tAJsu5s4xuujwYateBRFzVtN
	/2UIEsbIbe11NSWPnXom0fDh8c32b1DRftXclZQN3PEj/ng5Zfjjs5m4cuSQb8mM6rdt0t2eCSQ
	PP47+wZke4DDah8uH/DWKT2aWfRUWgmsVuOqEoFpjvhF/CJbRMa0BoMe4jOfpvHgIkBFQ3Uco2H
	evsymglxgT7x0BdrrxGU1D9/3bSs2TFUAuZxGn6/2mlpuJpiV9+IxCy0MqoHMPeKtxwIuGIZT8b
	Yz6otbCRfYc1qWBCQUDx/9Vdf7NMg2+//Gl5sM8xmrtQsRguL1aRWlOVPR3IhSCsHyr9zoCO8hI
	jEEwpykS2faLZh3l0Syu7P/MnE/hAnBb5bJKI9HdQW49aq4s/zX5gCgakEfg=
X-Received: by 2002:a05:622a:1b90:b0:50d:82db:773e with SMTP id d75a77b69052e-5165a22f61amr46350111cf.47.1778843493298;
        Fri, 15 May 2026 04:11:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50d:82db:773e with SMTP id d75a77b69052e-5165a22f61amr46349591cf.47.1778843492847;
        Fri, 15 May 2026 04:11:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm92645445e9.1.2026.05.15.04.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:11:31 -0700 (PDT)
Message-ID: <720715a0-eb4f-4083-a67f-aa380e130d6c@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:11:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
 <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
 <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
 <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfX2lp1n+qaGAyG
 RYOXRAtiDOzF7d+MdMr5STU5ZeQnJ6B2L5Yt8O2LhoSNQYimVsj39b54i6e5iUpoDTXgi4FK1ZD
 Qf0J/8ZEsuOs2jUDhcgGd8J7sy+9gS45jlNdSXldELfIjQuSdahcv5Jo4wdNSB6bus7TR6DMTur
 GNllgPLb9WZYkOqjc3efnZrajZU8DWn53GZJRjs+NHiaED12A/TI/qHOh4HNanQwASlfxPmuyTf
 FMFIW/7bG2dkzUm7FX/YbLYCVnJ71R+nbgqGTHVlXsZCyyfozyfzT50mPHmop1ByCwubOYc8+oI
 Im+LS10EXjmCBcHxvvgVVabb2etGASxmxnUeuySlzn5it0P2PiAqe6s0HS49/nU2yK2G6MIXw41
 NV+BparY+39roaozTsE2+B7x/b4p2r7wRroluHEBQIdIC8VWDXlnsmBB06zFPcPXSIiQpQG6eUg
 6hTp5HlSnwURa/bfrtw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06ff65 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=yrFnZ2jJMywIoLbqsSgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3-bBH4kfRrdb7SuPvFDSszvaMDRoDpU3
X-Proofpoint-ORIG-GUID: 3-bBH4kfRrdb7SuPvFDSszvaMDRoDpU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150113
X-Rspamd-Queue-Id: 6885E54E9E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107830-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 15/05/2026 12:54, Konrad Dybcio wrote:
> On 4/29/26 5:09 PM, Krzysztof Kozlowski wrote:
>> On 29/04/2026 11:23, Konrad Dybcio wrote:
>>> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>>>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>>>> basic or fundamental SoC feature: bandwidth management between internal
>>>> SoC blocks.  SoC can boot without these, but power management or
>>>> performance will be affected.  These drivers do not represent any sort
>>>> of buses visible to the board designers/configurators, thus they should
>>>> be always enabled, regardless how SoC is used in the final board.
>>>>
>>>> Kernel configuration should not ask users choice of drivers when that
>>>> choice is obvious and known to the developers that answer should be
>>>> 'yes' or 'module'.
>>>
>>> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
>>> are required to boot (minus the OSM_L3 driver which is "only" highly
>>> desired, so that your CPU's bus isn't heavily bottlenecked)
>>
>> So the few of them should not be a module? That's what you want to say?
> 
> I'm saying that if you only want to shoot yourself in the foot and not
> in the face, you can make them modules
> 
> But the L3 driver is required to make the caches run at a reasonable
> speed, so that they don't bottleneck the rest of the system's mem
> bandwidth

okidoki, so I will mark all as default built-in as you said, including
the OSM_L3, based on your explanation.

Best regards,
Krzysztof

