Return-Path: <linux-arm-msm+bounces-99350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKE3GIh+wWknTgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:55:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC282FAA02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3BBF3135E25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D723B3BE5;
	Mon, 23 Mar 2026 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJACb4WY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPBSGr/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D68E283FC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283170; cv=none; b=IocLmlYa2RgyCSjt8KVILBTJXGkDBbtVP5pSetDewyV8ULChyfj2x45aRnjldHmua/GrEtq5CruKcaVr44o5bXaT2uQ8mfJEBXM3tjL5uTtYw68ZBJgYBbNnASL2rML4Fk3JOFOoll6jPQ5Jn8eb9HOnSyD+b3KKcGYdqHvCU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283170; c=relaxed/simple;
	bh=RipYnVT+ThCFIlJ374YWkAW0MCF1qLEY1u8YX+IULI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/GAoPF5yg9zbcm+4twK586IwxXubIQnUs5gdQ0GJViwv32lR7EYJm69UovZYUq2HziGeD9xOFpGloKMGe3UD5c0vtz9Y/GfcbcxYiCOtgLcOr2lVyCWjQ5ApJ+iLCxLqWOulQK9ZVnk1Baw7/WI3gEquQZA7yjxlXXmWll/LH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJACb4WY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPBSGr/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGjPJ2490390
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNjoxb/miPYUITIblVuJDVboPKpzuzXYI3UEyOHYqtw=; b=IJACb4WYCFKbRQss
	9iHQJ1JEihHZk0bcMq2Oj03VTB1bR4f7iZmspnnfGKeg0Lz1IXetIwRmnUSXQtFh
	EJ5RL5VsnVPrEd96RNn1rEtd0eUJVvpgN+L43uKp9j3sQKAfL8XyCv7YgZwCS37z
	0u9E2C/2u9yWnF3rZbwogxh1sk/+KRb5GmKP7EASPiLZnIhFYpAHatZBklIyktz8
	oQfQbS+tpryrqhyUO8uXRONLGKSvqcwBmTg0Kj5bcqYeSx84wz3MLybzGDts+Zqc
	X/dHIPc14N8vfcKW6rY18TrMm3KHfOPyu7fEWSZkdN0Pfwwld5jy9JG/hhpkv2Wj
	xmXjNQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jrrnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:26:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c6717b74dso32936816d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774283167; x=1774887967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNjoxb/miPYUITIblVuJDVboPKpzuzXYI3UEyOHYqtw=;
        b=UPBSGr/n6NjmJzrrGxckEfEhIEm6wfRBKODcj3H3+8UcnrKvc4f1LH3o9GmZ56RjAJ
         6oCWqSBX3PoB5B5UlHIZi62wP573+tzQOp162Ie+ZOycBovxjUir3PKf8pkXb76Zn/m2
         ujqqhlC52cuHE6Dp7XbDkWWPlyfSqUo0cEoJJN30+BJp2kHROujb1L7R/qJpRFN3TY0Y
         RE+fFdbA6uGXGvOw95JmsXBHENReAuHJtSCzRN8gLXtx6IqXgG1XJYy03mWGRGMfzGn2
         8pFbaFE5YPIsIUZgQyomwV1p8Y5LdMHtCibvb9+h845BFfdrKC5hik8S5AcdE0MEQAn2
         7bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283167; x=1774887967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNjoxb/miPYUITIblVuJDVboPKpzuzXYI3UEyOHYqtw=;
        b=EUfouYeMJuFLCE6r4nEliZBTC/XXZGGEqEGTG4SpeUCHqATS7yCZYAyQ/MGBlv9jj4
         N1t0227gTosOmDp/lHFxa2iEaZw/MP6cbMkQ8lwUZUHiS9x1zZrD06PE3ysbZV/nkQe+
         WaHaPEynEEx8ojee6Uic9ZsIgOezvsqHzehSDSIM7jlRvuNY0yzIxcujgfWK02ZEgIg+
         uM8dh/antf2cu+TstRf8ipapPq/JfB9g0xjpkxiHTNf7kRKT9k/0vDgIXOuBnARmgUgT
         Ymsmam8Eh4wToQ8EhuGct1GYk89jKGx7WlylSRvtHLEcVju6/71eplUbzaan7F08K36l
         7MIg==
X-Forwarded-Encrypted: i=1; AJvYcCVTrWCLnVGmUoSlz/1XjFUBg22PtjW4wdHDSCK5GMK1xO8Ds7cQRAeO1KWIP1TWSuG0XSAUxZ3fBut7JyIf@vger.kernel.org
X-Gm-Message-State: AOJu0YzBkrsxpQYilWteXqT/e5ma5AgtputCsV0ZAz8X2nfMD2fezph3
	/V29B/fdmRm3EwTOSJ+bOM76fgwBc7cTJEqDD32ch3SPQZUOoVH0lmF5fNEpZj4skJZAiDv5jK2
	jDAQ6EG2GNnv2bajE/1d0nRx3gtUTOZKDIfLpL6d9VYpEr6i2GgguwlKuAXW+Y05dFbhk
X-Gm-Gg: ATEYQzwkbrAQgi6K9MLL3H5zwrXuBoLduQcXXOB3g/P/Lb5kUWOIiIS38klI8zXEIkL
	BPgFchDWKj76Khhr0WTYHxTXJaD/xgYXfHE4adXMXGqK/a8PzrzCJLDuEVbhuebWJGt5V84Z8tk
	YBsfuZBAylZPl6kuujNoxHURL1XPrpKxHf4VjJuaCr4Yg4EAmaxpHEInVeRQgC8mx9GPgVKufZk
	agtzKiflqV4AcuJOoR3/yz6mDxrllT8KPt1IbWur002ZZDPXyA1SgveQ2pMAA0+y8KHZJ9M6602
	YHapVks6xl7AhiSOxkOtb6+0roYxvUqPn0rPPXGOYePMNtnRKJobfrCsW0qno/z0DhGzu4LnXeD
	ngFlEoW51rxIBcqr19CryDK/rVI/5pK+0JbWRiMjpekL4w9RZpGiUfLW+zJxTHa9rX7HUUkV7YL
	kyAe4=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr145977191cf.9.1774283167284;
        Mon, 23 Mar 2026 09:26:07 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr145976871cf.9.1774283166728;
        Mon, 23 Mar 2026 09:26:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e4528sm3855593a12.11.2026.03.23.09.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:26:05 -0700 (PDT)
Message-ID: <eceb2757-5a9a-42fc-acaf-cc049131b0e4@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:26:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: qcom-ipcc: amend qcom_ipcc_irq_fn() to
 report errors
To: Gabriele Paoloni <gpaoloni@redhat.com>
Cc: mani@kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mpapini@redhat.com,
        dnita@qti.qualcomm.com, rballati@qti.qualcomm.com,
        bijothom@qti.qualcomm.com, wchadwic@redhat.com
References: <20260316102618.7953-1-gpaoloni@redhat.com>
 <20260316102618.7953-3-gpaoloni@redhat.com>
 <384e46f3-140c-4b88-a3c8-6cbb57ecff99@oss.qualcomm.com>
 <CA+wEVJYcY0nD1exUtDXmmED_YxkiCpkMrLjZJeE=B5C5p6HhFw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+wEVJYcY0nD1exUtDXmmED_YxkiCpkMrLjZJeE=B5C5p6HhFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hVcprCIxtNiAE4q1vDVsjwFDLAVPU7GA
X-Proofpoint-ORIG-GUID: hVcprCIxtNiAE4q1vDVsjwFDLAVPU7GA
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c169a0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=yPA8BO6uJK7ZP7c1Cs8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNCBTYWx0ZWRfX65vQC8if/THp
 Q0aK9iIAHCh++ZDf5cUOBCCRpR8jWhhhdnW/OeqQweRbtJfSF+/okSLmJ0oc/kPT466riK5hpL0
 CP4iJMkAghjdJ6wpwQNqkpw5LriJ4e4lmrfPJ5BeHtMxAI6jgD2gIvOEA57mkM/lfuTT+EH89Vm
 EA+Co/ZU0EaO3E/9XM77/sTQrYsQvlsTDs+q7XeHFKUSJ0Uxp+CtCxORtwSc8buC0EbIrS3Yvug
 WDZr/T2WiFCam+UdWn+aI54601gh57rRHCHpNDkLXekvmDoECh+SA1yMGhcbExiSN/zQ9GpdXd6
 h3QxjqDLNKduzkkPCakgDd+RGGv9CapV7zsQdZOJVhYmExMNq7W0JF7MG0Egcmj12+6PE6SZPCj
 /4k670ImT0PRJ7hl7jhcYDh7a5pteO2MHvo/+k57ohkhZQT1s+toA6YNcji0fH9wCJ0zJnfe5aK
 caONfbiTth9HaHOIu2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230124
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,redhat.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99350-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AC282FAA02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 12:24 PM, Gabriele Paoloni wrote:
> Hi Konrad
> 
> On Tue, Mar 17, 2026 at 10:13 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/16/26 11:26 AM, Gabriele Paoloni wrote:
>>> check the virq value returned by irq_find_mapping(), also
>>> check the return value of generic_handle_irq(); return IRQ_NONE
>>> if either of the checks fails.
>>>
>>> Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
>>> ---
>>
>> It certainly seems useful to inspect a function's return value, however I
>> noticed that out of 47 in-tree callers of generic_handle_irq() within
>> drivers/, only one other driver (intel_lpe_audio within drm/i915) checks
>> that..
>>
>> Similarly, many other drivers never check if irq_find_mapping() actually
>> succeeded. This makes me wonder how you discovered there's an issue in
>> the first place. Could you please add some details in the commit message?
> 
> Code inspection spotted the issue, and I could not find a justification for
> irq_find_mapping() and generic_handle_irq() to always succeed; hence
> I proposed this patch to follow good coding practices.

That's a good enough reason

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


