Return-Path: <linux-arm-msm+bounces-118767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9uc9MZ/bVGrTfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:35:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EB674AFEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:35:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cYyAQ6qQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hpgvf6By;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118767-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118767-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A618F3020B46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398E0409114;
	Mon, 13 Jul 2026 12:31:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56A12C534
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:31:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945910; cv=none; b=TjsYAsxEI6nSTlV9K5zsxwQo6e6JS/L5qtsX+Eq5kFSipZ03DghsDMzANtmbQ7pO1Ni+kFKxHnq/9KFYBSRFNX3lZaIyiK8Fa29+9qOSPKxzTup3bwk8mPMIHrJOglhxcs6Tik+ld0QxMDWBZCo6nMC731C/QYwdhKOr+Sy5B0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945910; c=relaxed/simple;
	bh=wu624yQ1PRaJUjpRWvM2rsbHe7MgA4pQVrLJfB0H3UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3hYBNql8InVKCGbpygSd2PBhRITn42mnX+QQbtk4EaNqo0ukL54VdHp7B+qddpByX2ggSl/ncS2AIVI7GysH+l0ZRytsvOuoVjhi2sCJhwsYnk4hSqzzOjtdZe+o/ycJHdo8JATOVkdJwvyvnQpxgmr0JHnwy3N+R2vXG/mf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYyAQ6qQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpgvf6By; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvo61428285
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=; b=cYyAQ6qQrXeI+F6E
	zvy2Z9pMjmmBTVbzypB0rHbtJfZMoVI1MCldEB6BvTlgJUnmtcyoMWLvXsAxoAq7
	oeRUG6Hcq2YbeTNMQkd1n02IjRcJQN0pjcW9Mbb8XRG0A83k92mV4y3uqFmAyNeo
	IjL2Z1+tuRXJhx/d73wtUbU0XFteZ7I7MVfxIS/in+ZFul8FkPqQhoIXHMvSKfpz
	oc0KP6pckMinsqrKxMTt+5c05aOPn5MPYOp1oyd8TLmnho5THIwZVjkq+qOsrwuW
	ABDaSiR+ipMyRUp3RTPscPPbPevpz9ms9AuCVIJaGaYjAnOToqoCL/XBmwvNrRsW
	3urHHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn124y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:31:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so43799081cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945907; x=1784550707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=;
        b=hpgvf6ByKNM/U65jau4T0Q12lh8kyDmS2fmpmrxYMCG/gxBo5jwaqgIZyMN3Sh2qVZ
         eP7Ni1IO1ebKqry0EJMsVSNaV7wEt46FrcG92DDYx9ngsn3ZnuIDQfhvE9SDMCHfdM3f
         ZLE938RyplmnG1NrP2EaSLp82QAze12V56vPdfq6drDnJ1O42vNhAGl5iVsDdu2b1rWc
         N5OOb8Upy87eNHhwhofh8Ekl3SOruwbUZ8g++CDxJhbyLWqPp8Q8z0l3GwaZ8Mz8sv8X
         8nOvT/lw2NkaV/E/+4QExk/5yqnWrcppE6Ki6uLoUJVvotPMDjKv0ar0CXf9aO5JAm5d
         /xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945907; x=1784550707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=;
        b=JsoMQoo7VQvS3G1ruc3N/JMN/xtn0W2A0AK89JKjiGJr1uhNvIK2o47vt0IlJ1WCSW
         sXY9KImX9OIqVSjaRswir9b6927Ml7Uig04TUSF4PSeSHfDGRNiKVd4KI/CMvZKpccY+
         Tbq2XKhHNqO1W/RIWD57tIc91VOsyAZsE4MoVTdIxRIpIhV6btN750gvXlJ5K/x5zCkW
         KFRjPerCCNRr0imgEohHqKRaqVSFF0H2GD35tGQPFh6zUfvJZT/iWBlQ4pMtiai+nirX
         wbdrk5+EF7D3efTj6n/md6rEWwIVoqrre3FUPUM5xQrGUY/v52czGG/zD4Khst6qYyeD
         M47Q==
X-Forwarded-Encrypted: i=1; AHgh+RrnW/h+GuXU2dzvk47C8o0w8uE2qljyExB1s5o0yrhs636ETSE5sn8cR1c9w/7Pg6MEyJ8HRUwF0Y36lqQA@vger.kernel.org
X-Gm-Message-State: AOJu0YzENFdP8R2ZW+V8gNVodwFaTSLkuZ9M1BEyfNqvW2s7IpueJ2/b
	RSL+3w6BzFNcfYvmy8ZmoIvPTuUnphwpyJVsynwtzBNnAwDUe9hvb+JQxIU5SBvWO205hOaF9Dj
	M74ZHbTWH5DHEhfN5fx6v3I7Lh9M1N4FKMQh39XLdF6BCu4EZMYTZLTN5I9BFDETRaiPE
X-Gm-Gg: AfdE7ck4Ihv1vKOP49jkFI+xISt9M2UhuJFhcRFFGHCmw4u90WoZzUNiSNidxn3GRn9
	YLr+LNyuvitgQNespQX66sBEnKvy+OJVMcmSD00hmi3qahxCvJBZOyCB5aTbXCIjLKwMWVhkypF
	jZWSwAQVhIzSynpI12S1R3oX0+6gDuBZ3RPiVZrf53v7SZ2ktm6EWaR7//y6kfQMUWjn5leYEat
	IjEioNmHWMpdcmO45MWpDgo9PZ88yvxaG66Qc9xQjhNteAjX/Z+Cys1pNN55Mcvwev1xaGyj5Nv
	QhpcIeX8FfGNFKDN2yR7KAV5N+CcJ+qhnZ8kFBJLi5Gb/JXs/zGopSaxoEgUt2Y/aYN9JG8hBft
	HsZflYTagpYuhTNwWpBYOkwQLCQqXHPunuwsXog==
X-Received: by 2002:a05:622a:1195:b0:51c:93b:4f1c with SMTP id d75a77b69052e-51cbf1fd6b7mr81466571cf.43.1783945907253;
        Mon, 13 Jul 2026 05:31:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:51c:93b:4f1c with SMTP id d75a77b69052e-51cbf1fd6b7mr81466271cf.43.1783945906795;
        Mon, 13 Jul 2026 05:31:46 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm2861932e87.62.2026.07.13.05.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:31:45 -0700 (PDT)
Message-ID: <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:01:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8C591JP7q__d0F69JU2_eKlHLDHmT41a
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54dab3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-Cfwf-izUa4NwULDX60A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzMCBTYWx0ZWRfXzaPQv+gZQ7eQ
 i/dgwCH4rS+rtZN12U4UTbygd/zToaI/XOAVfRMs1w7+mXpF/V9m3s3AwqLG+B46gBriGJ9mA8M
 xvJyIWMsUjB+uuXpmd8CSlmOYPIrvRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzMCBTYWx0ZWRfX8fiRAtQPOJGN
 fllxXRoAH2QKTKtqfC8lEiLzDuk8C9YgSPG+ae/2BQxrl/KEb8dmdoHcpgRpU8h87Fh0M7YR1W2
 d0h2/hHrhZreNE/ssdmfUcs+4FuSWddpjttMN04FzVjjUGWz3+rr9fVSHeTnCtDepef1gWCqsN/
 FBFUDJWI7jlVNHsV4qdOxRHRcVHwofvEYhPm+9B4F76t9zmmTdnprsuI/aK4K8Gq7+6jgxxEsrS
 iyG8xPQbh/WyJ/fuFzduA5MSXUFc/Ua2m56UoiM+iNHMOR6cAH+gwFvkwwjo0QR1xe8JC7ppF8y
 SAWyS/HI6T8jBlJzAsixIFndiZUm4U5JcUFU0JTtwiw8s3t5RsvcDMMElYk8SNWqaT7IiC9Z6GO
 1R3Lj91N11whV5RoP/vLPo2YW8VqFf3jBz47KH/vp85m09//aPD0Y3i8LKoQrPbBMhW/cJX2tw2
 9UTc51i+HO+BBiVMkkQ==
X-Proofpoint-GUID: 8C591JP7q__d0F69JU2_eKlHLDHmT41a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118767-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1EB674AFEA



On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
> On 7/13/26 2:07 PM, Imran Shaik wrote:
>>
>>
>> On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
>>> On 7/8/26 8:25 PM, Imran Shaik wrote:
>>>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>>>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>>>> differs across Shikra variants based on Audio subsystem enablement as
>>>> follows:
>>>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>>>> are required to be supported on HLOS.
>>>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>>>> handled on Modem, so from HLOS only resets are needed.
>>>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
>>>
>>> For the sake of simplification, can the resets be enabled
>>> globally by default?
>>>
>>
>> By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
> 
> What does enabling the provider node have to do with changing the
> state of the resources?
> 

My bad, I interpreted it in wrong way.

We have IQS variant, where we don't have the soundwire codes, and hence 
the respective clocks/resets are not required to be supported. Due to 
this, I have kept the status disabled, and enabling only where it is 
required.

> FWIW there's nothing like reset_sync_state
> 

Sure, I can keep the audiocore_csr node enabled by default.

> Konrad


