Return-Path: <linux-arm-msm+bounces-102888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLaIIpio3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:26:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAC3E9158
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E52793003E87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC533A1CEA;
	Mon, 13 Apr 2026 08:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZ84zmrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSoXer4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00A3A2576
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068646; cv=none; b=BoCA5BuvwB0KvcWlrmua56j0wwGzVz4CJQUPAiYBoygO5Xl3fG1lCrycY8xz6zJEV5Wo69Wp3zqIKzQ4XsClcMuEwKUYwDfJf+VD2fwmAl0DyIm167xidv6vyhyqxHeQxmmOJ1Gs3nlROHSjALHIrz0sZrVmcxICd5zTQY/3FHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068646; c=relaxed/simple;
	bh=4Fv4TzWCTxbFtAS7LD0EXq0TXIBHJeDtcmJzVXsy4/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgy+qZdfNT5PgdbnoKiPnjj+OoOFzsZLlJywY2JtoU6y62VeTr1nUuxwnM8W5XY9NMErh5e+gK/br/+8RHYQi81uU/ARihtDeO36rpcOFSApgZ249HGJxFXxs3Yet0nDNzgy3dvwggq3d6c0JgcvnycFHwK8WgMR3TdUzeNf8TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZ84zmrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSoXer4z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7Nni3755867
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkGUvu1zEWd3P4bUIVWPcUr5fHxhDbdoo1VkZGeFlrc=; b=SZ84zmrK65VMu6RT
	mqjhg6/NI4xbs9X0kcixKu4bOa3VfoS+zq36CT0xO6DF8qzdZIHeoAvlWAFOno2Y
	ESFRG7j5y70BQO5AEgUyqfxs3ovJyEZTbHAWtqtOo1NQLfR7qEj9tvnpuAp1BCW8
	y1t2jk+le+FYO0OAGZkdbqXJRSOFV3KhEor/KmInD6tMwtz6SZqHu2OxVLrSa7Bd
	5LD0h9bRc+KKMK/jUkSAwWjh03NLjtBEYL6SGIGM8rOlNhy5SG2NmdKEr3/BnMS9
	B2cpCehKLgso4louoOXclJnR83JHqaIG3cR2V/FDUVfRh3v1GPbjsdTyuGP+RgOF
	Lqd4SQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew04egu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:24:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca281aaa4so1856326d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068644; x=1776673444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkGUvu1zEWd3P4bUIVWPcUr5fHxhDbdoo1VkZGeFlrc=;
        b=bSoXer4zYUj+ggVZmuMtfTn9fm8dbhxet5fRCUuX0T5UwmeB3hfj9adOLs5LjF/lwM
         HSkmbymPpS/F8im2Os3uwKqfDI8OgSJXH33+GwHH+mXw8k+DRQhVOC9Tx0MuCGpyulws
         fAGc3DSXidd+F6YN5nEwRiZ7tEMb+oyBRhRTE3b94XUdq9n/Tlz6VoC4dj7B6MOn5WHP
         eCyYKSU+/Iyo1rR1FHrcVkjm/eJyZGNx27x156PbJ8Zc8kVpt/Lkw8OTNgaxzD+sWK3X
         KTItW5K9UW3qPrRAm5wbs9dXRBVvv+LlCFBPpiGk2XWI+7emjYVZ9yjP9XUdKzSm8vE+
         hglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068644; x=1776673444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkGUvu1zEWd3P4bUIVWPcUr5fHxhDbdoo1VkZGeFlrc=;
        b=UdM+7IskmMixB8xwlaF/MtXr4+yg0bkgy/TwiEXmEFl328NorDZQDDgCeWmR64Oz5J
         PdTSTdHgwzxwergZX0A2IcdxGbTsFtZlJjC65V2UI4jC0pX0B1Mr5qzmQMgDFgcmfPTj
         i0xnqEa2fAuzl9xtMrYPLL4Q03z646DcZyhzEXXzh/Y80NhUkfZetx1QEgEjzw7E9OOR
         1XdI3gqYSO7JE+LLeT/AGBYvxseVk4CB0PoW6exPRzCytdWMWjyIDT1aStAhKiDRipGX
         Nd456croNk1NcIh2d5LP/LpppYwlwP/tNXVgA8xgr7bYSqJ0J87iQC1nzUT3JK94hlEF
         ZShw==
X-Forwarded-Encrypted: i=1; AFNElJ9hyp+uazlx+kjfvs+Sk2iO20MQQNafhFvRU1wJZGrgclS98teg7AgtvnHEobs6VIzCL0tu1uaVe4VpbOMJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzzUR8REV7FkepSEG6C+sq8OpwBA7WhI38T+uLpRJId47ilDhbN
	K++BwtNAbK4On2rLLRGXdHrHuITCSjDCqfSjA91tiwCG+Sl9EphGnmVIa6Jtm/zeD7oZzF7ck18
	SF31/+qF+cbHLj4ThcbhESDFZREMUyfAy3+b1wGJrtujGbFweU9hiDDKBGzA4AMwC+YRw
X-Gm-Gg: AeBDiesd+mlKWoh9uucTfDixLOBaq0LVq8GHb04SrQJczV7h7WonUNcp2w2pUK7w/TT
	RkqIbBQGPU5X7wfiVRKKbVUlrKBBAJm1sJGrzqpyaxkQ39B5IOUVsgYDU1qS/hHdq2DQhrKGdDW
	ZEg5cU1yVSR31fB92vP1wviO1H3QEQJo3QopSzIDY9oPsqNtUCOTrX6E3ogk67e3h/60skdoCat
	lH5YoEErWQ3be8Y95GQz3K5pfygTFJFCiMgNoEtCldmiyyg8JFFBoStn0azXH7WAEutuijem7+6
	iTTaX1F7z5yjDHXJxuWojb7AzXE9DTdzdRXrUG7ig3Q+65L+G+aXJhr1FkRwZhUxkHp3PkFANVH
	7jeGKeO7hCqpXuFwdohFbyIkqWqZsOofABCCUutogFw51yye950/vLyckn33kGhFaY+cWgHIaH2
	sUBWw=
X-Received: by 2002:a05:6214:2588:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8ac861536afmr152102776d6.2.1776068643556;
        Mon, 13 Apr 2026 01:24:03 -0700 (PDT)
X-Received: by 2002:a05:6214:2588:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8ac861536afmr152102486d6.2.1776068643151;
        Mon, 13 Apr 2026 01:24:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd89a9sm295654566b.25.2026.04.13.01.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:24:02 -0700 (PDT)
Message-ID: <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:23:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MCBTYWx0ZWRfX3YiqWpBhVRXJ
 Fm4XrM2zoGrVS3oWKA2sOADnIKvCJQ2E/A+PUoO1S+gBErObTlE832bDN0jaz9vdaw484yY1WJ4
 hegp+uuIrByAUOMOMYLLOWdR6E+hk3LLkrEZyqezxYk0EQHj4ps7jc1Bm9Ij2ElWmtagf9B7jV7
 Q5XsboopjxoxpTkxcoB1GNwMDuVDgBzycHChQrPqJnHAkjbvgndABcKz0AWzrWx51HKR5dOiq14
 SDU7JOg71c1WXqQiy8OCICWdj42lhNzLr0SSffWHmfEJmBXAS8jH0QrJy9L4VZ6nvqolLUkxHT3
 5kEuw5O3kG87YrNg2f2u0AIk1PY+n8fP9GpbYZLURAch5ZUTys2YNEYnEOt38MIGpmBKZ4Nocpk
 /2iemYRZSDIFl8YPcMCFuZo/7Wo2+8NTXX9UUXZBVoWUQ7jtAU81oVE2ts4AlhqGM40i3BFtfqO
 pC1d4ImO0bQRS4MpYKA==
X-Proofpoint-GUID: cCsc4H0_2stbE7QP2JR4Y3Uj3uppGxhe
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dca824 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=PRTi-mQ_jkB9sSpM1ZMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: cCsc4H0_2stbE7QP2JR4Y3Uj3uppGxhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102888-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: D5AAC3E9158
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
> On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
>> The PDC has multiple DRV regions, each sized 0x10000, where each region
>> serves a specific client in the system. Linux only needs access to the
> 
> Nit: there are other OS than Linux. Would you rather point out that
> other DRV regions are to be used by ... what?

TZ, HYP, HLOS, CPUCP..

I'm wondering if we can make use of the HYP one on e.g. Glymur, to
parallelize accesses (and whether that would bring any practical
benefit).

In the RPMH architecture, each "client" has their own (GPU, AOP, DISP,
etc.). Then, each one of those clients may have an associates RSC
(Resource State Coordinator) and/or anyOf BCM ("interconnect"), VRM
("regulator"), ARC ("RPMHPD") voting interfaces

Konrad

