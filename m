Return-Path: <linux-arm-msm+bounces-114295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p+PeDLqJO2q0ZQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:39:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A86BC3ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:39:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ERDeY80/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RmuSb19y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114295-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114295-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1541230099AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC19E2EB856;
	Wed, 24 Jun 2026 07:39:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A181EFF8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286773; cv=none; b=C6eX2Tdw84ZRKqVJRn/XG3i5Kbz3+UZ6pZ/yCpb0A2g6NJopfU/IZG/cwtvCrquNyTfMoxnPJMdyfgdiZMG5WhkdZ8AwupfF7X4/EWI4zcBuErQv4ZI4LxT0BLlCaWNtv2FMPaS/OUkDEvqQR1nPvcgUh5SBpr12C6ql2huRFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286773; c=relaxed/simple;
	bh=jJ9YG2tB1GQah48jOchhDBoZwkGDBycXPbvfGVlIL4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OjvsKm6EuPvem3XKyd3fuIGgpIY9I1YdM2ULJ2oTQ7Eza7kBWSZhMNlUU9jHwcBBHzwE2NFf4LnVqTrGNqgXbRdpg2KP78lvjVQ91UAvBAk2MEDEKqYLwJqMwKdkpTgcDHAwltTpnMW5X8tgYWYjHho86k6XA1Z0DDZgHLtKz3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERDeY80/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmuSb19y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uBQS2439078
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBY28EHIgWlqZkL2cdIhQQofqRyA4PuEZ3MPh7m5b74=; b=ERDeY80/dGKOTaIa
	HxwnKaAN4KUN10EXybqJOY7kI/hV9NNdJoNHOzxE2fNnPz4HnmVLTKyVGbwmviUa
	iJfg+cPJFLAt1t8k4tQIbcixBRmmB4bHEVKWxoGS6HAbZv163Zax6OYqYOmwJ2+K
	HBXwUXgdEjJlbzl+SdO6qdPWGQfO/dKyd5TADUzApG1A8cUhDm6Kh7LNQZ03M8lF
	NgdOcmceiclG4ejYeBtADRzyENFKosq7VubuCjMyNCzdVoVlVLoPUgme3TjA0ZQt
	+xwehtNajWTMwj8r7zIE4aK+ZtgcuSOgBrIU6HReK8bZfDNJ/P4uy6yJHSaurawv
	AJuc2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar14br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:39:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178a632a12so1482841cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286770; x=1782891570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBY28EHIgWlqZkL2cdIhQQofqRyA4PuEZ3MPh7m5b74=;
        b=RmuSb19ygR/lDH2EyG4OMUHuqCtxcD0W/abrpybHpZ7TL5ivVays2Fq8rWLmd4u7jB
         I6ar6gHW5+nq6tASrO1wQTKxDAhlFAUo+brbMkGsYNHzeFvxMxSVE8eNOxEOXANqVpyd
         QeW/ypFuF9oXs8dWRz7zjMQw+LyC6J6ZL/mDOKpKdCGXNXUHGlYsFJy+MyyVHJA/6SOR
         JdkaSsc0+PWuZlVvk+kk2o/9sLZfmhjNn9Wv7zsdC/QW+JirOgm1iF4FQBw7Fdk1/i+E
         mvzL97GYMfQ7UnlWv3wRJZ8Pls0KggCQIFptXQYzivWmrs8dmot5cLZ6PZZD/LRHEKRI
         rDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286770; x=1782891570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBY28EHIgWlqZkL2cdIhQQofqRyA4PuEZ3MPh7m5b74=;
        b=o6ua5V58Dgy+YSSG05fuQUcCZtTW+yWREPs6EZ/+UyY5p630+9Qtf0z7HVglR/tHuJ
         m7mQ/E4lZQN7btwoVTBnlXGDMz++/Lr/iv4DVHOa3+eIr/N00+xFFfPS6sysNoqLLzxy
         hWIZ4JI+ldzNVB8j+kQn1oWG2MdvmEzAoVLTaKFhlUbTYH+7wFPPcWaskBd1bD6FcNLe
         AkbO0+2NwvV2Cs/NxhnJ7wKTlgphxeKQlbu3QG/myUB7UrkxwZLtkMHe1Wqe6pD7KhNn
         +XuTnR0KLSKqYdsPFxX2VIQ1sVctskh8WEggWgVfoRmpx3FEqqSRPT/oxk9ABwo3pgrQ
         0tfg==
X-Forwarded-Encrypted: i=1; AFNElJ9/33MrBnq9cSpkesEGQd+y1nOTv81ibT4n2bhsjoHsKl1D8R/YfmnniejLGptWgXjQdn1cxWhqzErrUeTL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn+8dIn17Cfwa3aXk6ysZUKvCKEvWIitm+JdMjy2w4MD3FeMCm
	uouEAktrG4zZ7SnrSnhfQ8axxWBJA0qh+07aEmL6Gh4ml9cqKkiLRBAxN+646srrKnD/c/fqY1J
	Bj41tzWVGaIl3iDwn5qWWYa9jsVQpGCRZF58fq0RAiiNzR3+Uf58r1XnSfl6kmmlfRxCZ
X-Gm-Gg: AfdE7cmL81PemXwAWdpcwuMFmfdziUE4u8PqnCJ0OSsubsY9VpmLk2Bl9dZN136PPGb
	nyjGhTHQm2X1NeV8C0w93BMFqhHz8VxEooZoXZ5pbivUnbAY/rlLx8Skwb3Hg8XQlj+08CYeCl2
	lpX5HqOkoGx7Gd0sL3++RW3UInLNRRp4BqRgqORp9NOj46GJMDGUJFJE0QfN4SkTDRKbZWOixAR
	oqTckbLA9lrRJIOHwU32me9tayzimHmhLwGJ5FJEYV2rFAME3J99HOB6qs9cxRTug05G04nWt7d
	zh8wl6jxn6rPfkol4C6SPZYT3i48Sh4xORyfDRPdQZ3npAsvkU5sHtflt+WwvCWB9ntpXAHaDNQ
	plrlzHBXHyJerCxM8vWHFEPrGDOCw8bsHq9A=
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1904887885a.0.1782286769874;
        Wed, 24 Jun 2026 00:39:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1904885685a.0.1782286769459;
        Wed, 24 Jun 2026 00:39:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99bd0bsm617009366b.23.2026.06.24.00.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:39:28 -0700 (PDT)
Message-ID: <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:39:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ocq6bNNvSI08frCI6e3cRG12ed8_2WyU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfX7EXxCULobO3w
 uMpuRS/nFRO/pPMzyH/gF6nd01PgadPAaCQed1K5x9ywLYdXO/WK79OBpkzQk62aNQCZNxManV4
 E7MLdbxMQFoZY3htPHxleqyT1PTfONg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfXzsirCSZD4T+3
 YRnWRvKxEKem6Q/GU9xYYfmZCsPGbwM/eRQ0K3U5caTG2z3YC5aWSGoOrUbsEOh2M0LQEZx7Z6j
 eXLKDK8iXCBhRob8YlCrTTaWmJAA9I06LyL1fWS31vs9SePH7NTvb1IqJPRTVpotSHzyEXW+Sey
 ym4tMm01U0mVMhnjaAjGAUuZ1rCUrcLeXOKRkHvyESpe42zebQg8gjejfMiKVM8wbjdFaZJYCAM
 3JiewtcEOR5nS7zgdQM+6YjyF8HJTIIsI3U/Mx4AH6KXFe45QYRy9yx/7o1yFzmRvp9KM6dRd8w
 HLtK74Alne/K2AoevhpBci32RQ6fEelPlg8cQkr5k3knidfKzK5KF8huFKaF3asAyh5F1MQa0a5
 0Nq7MusUjHDn85hnAWG7ST82Lpxn0Q==
X-Proofpoint-GUID: Ocq6bNNvSI08frCI6e3cRG12ed8_2WyU
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3b89b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zM5_-Fq6ha1Ldok9JJkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114295-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB2A86BC3ED

On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>> The HFPLL enable helper waits for the lock bit but ignores the
>>> regmap_read_poll_timeout() result. The polling condition is also
>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>> as the locked state.
>>>
>>> Wait for the lock bit to become set, return timeout errors from the
>>> helper, and propagate those errors through clk_hfpll_enable() and
>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>
>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>> ---
>>
>> This looks good on the surface..
>>
>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>
>> Konrad
> 
> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
> Krait era, is that correct?

Seems that way - cpu, L2, and GPU, maybe others

> I could try this over the weekend on top of Rudraksha Gupta's cpufreq
> patch for msm8960 [1]. We don't have a gpu patch for msm8960 on LKML
> yet...

That's fine

> (also my name doesn't have an "h" :D )

My mistake!

Konrad

> 
> [1] https://lore.kernel.org/all/20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com/
> 

