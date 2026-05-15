Return-Path: <linux-arm-msm+bounces-107807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCpTHwoBB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:18:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4754E43D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B317030BF985
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2028A46AF2F;
	Fri, 15 May 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFoy1cOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2qxSKD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5A46AECD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842483; cv=none; b=SYsUf+JsTUoFSzBuXiQiWPuVS1QymbEdv2akxu/72qTIDg4pVm37VpsgurkdsjEM1zGjpLUYJIbvWjXWRS0Itvplknzyj3yCR23ZbAHpeYvKgr8y6+nyvgeR3Wam9hSnRjY6wEH0VnMwr+WftFykzlYfRu3A2yoDohyeOu8eCLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842483; c=relaxed/simple;
	bh=PXlklGP/mfWQ/1xEaIjtXHpjJ9Wk3Hd10+lAUTbV5Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnilMCZc6SOOSjVcqZu2tJ2sM+Z60MO+qVmpajzRznxjgJnWredhgvo5i6t7c1LonmNTgJe48zuaugAnwQZGPgAAvfgBN6aVM+w1rklWugDcQ9Zc4M8LYXEO28xfwz1KXnQkURKnBBH0CpZe87BrHDpXma+zoagO6YIJoSlqKZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFoy1cOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2qxSKD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4gdv43200311
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=; b=MFoy1cOXPtGvkye2
	9kaT1rre9BofxaNLweYPIrA9vBgHGpzOgHp+QeS1H9H/CULXiAOoq/taV1LxaIui
	rjWopT1wm/IqSFW+ey1yTHbrdMG1B1ACp9GuGcQ9MDDDcK75znZ6b5vEJeVyB4vN
	6u1EEgRrSl4dY0w4NZSGB4IqRANy3uHNMSBfLd3eT3GBMyj91v1qVJJRL7+Hwjcd
	Nj3QTEP+fWmCx0mX09HHqQnGVLVnLBaFaw5C01IcsEr8nY3KSrPB5puGy4sam64y
	pgPIY6zcbpZgfCxfas/nfrrhryo6gorKwxdw6wre4PX/5vODEtzEheqk9UUumrA3
	ntqqHQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtvk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:54:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cd67d9a7dso371752241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842480; x=1779447280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=;
        b=Q2qxSKD++eVD+N4ln7731QIvHTaqrAPdUX3bqLo9KuI5Glhinh7mSpLojMGbZuvE65
         8uuv0/F35BXaXqG98OtC3b03P3oreijfBawtlB6yc0GgDwKhb+Gj6CaVFkczU3E10KQH
         8N9Udh6tquabXluX6SfcGqL45JI1W8kqdosjH16xMTWiigZRPHL24GPkMhTmHrB8QFRK
         VghETNMjh5MrkL9n2LLqSsl9PVsxzXaszUMMIN0tmj/YOCkv0TYQvI0t8WXLrcNVvoLX
         B2/n1buZibiL99KZMGNM17h+PcYFYKtWs/s2CVRP6Vo5W0e+3E6bA8HiL9hReJp3WLx2
         65/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842480; x=1779447280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=;
        b=GYV2idnS2/pJJe6n78symUWsZr90fVBnn7/0yd6wljJ/dtOfNzfxLOErcRYnPA7iOe
         ieTo07pI7BDMdynTDrpdRbYzeP4ezMASmgCFpRQIRHfkhXRea7OlnfaNdsTrnJAbC+k6
         tCaKL4Qs62ZOcW93nly+jCOzVv+4M7oSTBslvVPuYXWEn5m9TI2bXqPHss6xX/Rb2rBc
         1mcLHzj2J2GsdmdOCBqyKGAnOQefoiYnS1pYkbj+tVSRR9c0RK5wf0pJW2LcL3ySxOVO
         GERawnnPUwynRlOmVhECpAWyOJlYlsMLbtMioqLet6UBDB51DjQuBSO8S7gu8tFcT/i0
         IrCQ==
X-Gm-Message-State: AOJu0Yyq83JbLB5PSrG7axtDNHI9JUyq1Kcjv9MRAEPRjWZdjJEbW39K
	c0Jw/4uu4c8bNVQxgbjKammdCp9Hqestv/cUdPCoyK7tbQ2NrEiifvUixla5atKuEScICcQ1TTC
	h4YXsJRNXHNKBTkdTG08ehik8ShOwEgZVolEhRoAutXO+Xy1kTlflt5ghiRHZCybqZfjN
X-Gm-Gg: Acq92OG3nk1i3fQpGjOxLqT5osH8cgYJImQZAp4j6p36XK0cJEPCDAsVAg37FwuP5w4
	Tq5b0T7gVsBKdxByOfQ+O6hWBcNhnGWnfbcIawKjlF1sAUf4hMQOUws1CluVvletQGUQd/DPPFm
	bvyWEBEhKw3CR5cp4vBSjRk9DdaIEuLyzcuVxRWCORTwSVvbG9qiG5qu3i+jf7He3jg8sg4/2/B
	uhwwvybk0q8qH1+fzjxvESOmtJ6S4Yf3xN2MIdBsjiA3tC4rzbmROryR3G96KH4/afpQZVbmanD
	tZ0Wsprdjpl8inUIF3gLk8UzD/CsdZdDh0ELNDGkXt+Y8QiSMrYV4Pi+H41nQrRHCOroYyOoOJw
	N41vsSw9yw0pJKEMeUKQXTVx7F+XlcYnfCz6zaXxcDeyeoRiT8ewM4aOu4+WDMy7K2O/ZN9ktMM
	j72OXR9tNgMY4I9g==
X-Received: by 2002:a67:f109:0:b0:612:13af:f5de with SMTP id ada2fe7eead31-63a3ec8bb31mr438166137.3.1778842480174;
        Fri, 15 May 2026 03:54:40 -0700 (PDT)
X-Received: by 2002:a67:f109:0:b0:612:13af:f5de with SMTP id ada2fe7eead31-63a3ec8bb31mr438163137.3.1778842479785;
        Fri, 15 May 2026 03:54:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c23feasm212857866b.14.2026.05.15.03.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:54:38 -0700 (PDT)
Message-ID: <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
 <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
 <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06fb71 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=HltSbr2RFzsJciUvgNYA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: dhAWuFVSMdRETge_bBmXzi-hbYXS5Ynd
X-Proofpoint-ORIG-GUID: dhAWuFVSMdRETge_bBmXzi-hbYXS5Ynd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX93m4V+4aDcfD
 s6iEFMRPAcZOtz/CoT/C3yxHzQLInzw8TKDs18YGPRcqNZFsLxUFtb8+e7xe/L3XJ2NJj89mEBJ
 20QNRdUK/IcbemMDOd/qASZoMmPnjvW0JcqHJMHBGzM1EN2wPd+kjQRc3fSPVkpY1lphh4TEJHF
 z2UxpefHbgtALSnrQGTCJOf+u1d7e1rTu84NXim4JrQ3Xidn0FbTnQ1bzBC5lCfDj0YsZhgfg7B
 s5R4TVS3OzXo6m1WNudF+w68k6UngXBezBhMaDya6fggiNLcPlc2KcgLY8KvAUleTAaYILVSxiE
 fLrflTj5C3qte5Xcg4a5iGIkURSAAIOKSbmTaO5/qTDsE3EVAD8vpHTLRe0Tc7ZBqjppuzX1bpB
 jmMjq4zgE8BC9oVNeLDlAUlgvaKTjIux/mRXXr5kCGG953+8MEUz3O0PSvB50Lg/94JUNjpMhaB
 Ws2OQOrP8ZOVboyCotg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: CFB4754E43D
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107807-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/29/26 5:09 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 11:23, Konrad Dybcio wrote:
>> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>>> basic or fundamental SoC feature: bandwidth management between internal
>>> SoC blocks.  SoC can boot without these, but power management or
>>> performance will be affected.  These drivers do not represent any sort
>>> of buses visible to the board designers/configurators, thus they should
>>> be always enabled, regardless how SoC is used in the final board.
>>>
>>> Kernel configuration should not ask users choice of drivers when that
>>> choice is obvious and known to the developers that answer should be
>>> 'yes' or 'module'.
>>
>> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
>> are required to boot (minus the OSM_L3 driver which is "only" highly
>> desired, so that your CPU's bus isn't heavily bottlenecked)
> 
> So the few of them should not be a module? That's what you want to say?

I'm saying that if you only want to shoot yourself in the foot and not
in the face, you can make them modules

But the L3 driver is required to make the caches run at a reasonable
speed, so that they don't bottleneck the rest of the system's mem
bandwidth

Konrad

