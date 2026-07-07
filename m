Return-Path: <linux-arm-msm+bounces-117230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F9HyJSTJTGr+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:38:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ACE719E29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:38:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jc469BuK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ia1IV/Cp";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117230-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117230-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790363188983
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7619396B79;
	Tue,  7 Jul 2026 09:24:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C73955C3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:24:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416296; cv=none; b=ggbj4M66gxL7smGKUE0gWDL63P37rbqrguh9n3pzIkrIE2vewpCagXfjrdUo10SvkQBXhaHd4EaItGGCwhsTAT71Rt2K6Fkp4ns6WInxzWdfA8pSBhfpwXbKjSlwdTIJhiGJop3KV1NfJGQQUU6siZSd+QnYfFuuZ+WNPPIsahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416296; c=relaxed/simple;
	bh=PiAuRzSrVirETb4Q+BzGnIPv2Qe3sql6vwSfUHtf+LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0rLfv/7JQeWAO/FHiqn9Jz0h86LYm+6yMLRJWEOBBbLPMMcJxjV9a4DSbRBphH7zUENVad/UMDBXf1s8UazzcWKplA/BzCvbOUgTFFnuWON8JiAqSPpsgt7HY99Ar4FkykA6KdNboZjEstjX3//RioBPUns47SgGCgGttjY5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc469BuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ia1IV/Cp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DZjC3243036
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=; b=jc469BuKXnRZ1rtO
	x4pnOasOJKO0SJMmI4FlsKicl0htYcIdlNlYQ+OVGt1f4QVNTbj5AkyqlbZsDgl+
	xjlopIg3v/Kf5BLrMrkqEMNrj7uO+XH1RjHXadz31UXHoflx55oVrNJ5LrYW23WU
	iPtpi92Ds4eEW9hP5TIoVAtZA21fXGcX23P17TwVBQA8T/Y76UNhBMGtRo8PJPtZ
	D9V2J4jK4YGlV5tRCFiwy5zrvuHtNnaig2FDlf+NdfQ8fwmtxvRHmeTkWp+lb70J
	AI8PS6/w1wdaoMAbOHvAIZcEOAlmhdE9xka4P9U23L/GOa2KAGWLQ8/Qfrr7EgmW
	r04jFQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rfn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:24:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so27388161cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416293; x=1784021093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=;
        b=Ia1IV/Cp54L/zrFFbWavVePFv3GdsFcUEUZUyV3HUxfJ3zATY8kuAKHyRaceKZwNFY
         sTtIVvbYzFC6sk2YNK7iV9xjdDrvHk8d7dg6SX/PtBJlZ+7uRi7YVC12soWGChxWZswW
         bA614m+sLFsa49Huw0/a+TNvBYDz+m72HopIsEC6+n1D10Oko3mc7Zm8tD7O0fMOJkZ6
         drbwWFIi2wQUYSzM9m/tzhi7hkye6MW27tgzLcgde46qqxWS+iUOUChK2G7M5i6wiaij
         I+oPQcMnl/VseNmx8vqX0zo9dEsp+LhzKunqKPdOgZrT+4cR47kS8vqccRRUKSQ6LQef
         vhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416293; x=1784021093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJJ9VNaQeNwXUw6b8nu2XuRz2oRtDJiBhPVRNK4TA9w=;
        b=Tp3Kf0GKxdWqTr/7/CWXRDRpXz2Bmkn0AFB9DIR/ciPe+w+IuxCLsFGWFJVXYiNqQg
         baH2U9M75wFvkFAXCvWEG4UCciLHAtTgV5PqOg2Detxx8OnEnqghrJwtb2Er3Woq1Jrw
         YI6z+6LCaHkLclx9whZ/kpEImgHYf6XIxQHywuEK/LoPWwYWwJW5udklUon7A62pHM/7
         OHbXL8VDXyI+vgjujsLZ+3FSK/e2JP5/vlH/9J+YlrQTirBwXqYS4kh21b6bEWRBSAYw
         SX7eIYwIV1Gj6I3WtNBkn5QwuoaW5BTPavGMtt9q4/zeXs8tqFGMzHtmfj71ZKEN1EwA
         AaxA==
X-Forwarded-Encrypted: i=1; AHgh+RonJeOC+bO3YtSl0hSLl1AqVdCOMbRFU7hRvB23n+xXlUBt878SQzN+jH98HPeS+cQ7as47JMVb7+Pn4xRI@vger.kernel.org
X-Gm-Message-State: AOJu0YyiO4/NQrHiKQ7rkfDTkaw8T5cN661CMLWDyn8IpAmiU2qbfRle
	XOPeuEvUz0bLnOwH9oH4w1hW079yFW6Cxe+pEnoapeR+W4SDuvopystf58thmovlM/06Ujv8Etl
	+5MgJLAiZxLY4oCFI3VuGGSNqMei3XH44Yo6Eg7+9U/rK0cVv9Y1jHw5qWOARPCK4Sr9s
X-Gm-Gg: AfdE7cn2I88q7LC7H/2utXxsWjoqiLNYXywoW9kc6YtTFgms9qxBXSbX38s7cK2JYIj
	3f2+G5wq4r4wfgw5ZLt1aWafCA6sQoyFNX6dffzXhqQF9lVCPOHSwpj3sMdbAjTuVn+BVOydhd1
	JMSG0jIyBZfgAJTe3RAZOaAEW112/XGmNXrUzpEw4UenIgC+AYm+d9ISX1gMc3Zt73mr/RNLtI5
	17CGRRUMukPTUx6BVwNUQKyqiNYLSmF0eKghGzYgUz+zD1KaU+NuaV8eWqqJOvxwdGX3FK/rrPL
	kRQWVps8WqHPKo+Bc+7V0az6+K2G2sJSmSlrSCzIzXh0lBt6WI11naVHA4fy8XjDbGAIcj1RgXI
	yoLHkX95o/q4/bxfLNCzdk5d66ujFMVc5nCk=
X-Received: by 2002:ac8:59c2:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c79ed7d5dmr19016081cf.7.1783416293513;
        Tue, 07 Jul 2026 02:24:53 -0700 (PDT)
X-Received: by 2002:ac8:59c2:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c79ed7d5dmr19015851cf.7.1783416293140;
        Tue, 07 Jul 2026 02:24:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm91703866b.59.2026.07.07.02.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:24:52 -0700 (PDT)
Message-ID: <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cc5e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ZbAgfBTtTtZkgMFo8CMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6P3hjqTgZSs61SIMarYiXJ6vAluU0_66
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX5B1BP5+1+7vF
 q3+IMS96gUgVdzk7OxRB3rYsoZuxLySwhjVJ9TuHRTjL8WSmrHM8wuAR/16qoEdQNfSBUpNNiiv
 C3fw3+q+VgsWR7EliiOKzeiBJMkwHys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX57i42DhhMIhq
 EuCzTCW5F4VmTRwqNQaC83PcdJAp0CWGuVAT2+2dw1oHgtT5L4X8hzkNZaWjW+zCiK9pz6hT4j+
 Us7R8jxUjActuIfI7Uu3gZlG27W8LQjJsiHUm/KoZZOvVJIK/R4zmS+s5yVX/YmN6L5iLbP7yuT
 VSPfvl4el8Zz2pJ6pwqL25XxozdapNIktK5amd6bUbzF5W9c/XI4Gk41K4VlskP8yAckVKTdmbe
 TCjJ07sWIOUI/tERv3wjl5T4C0MjX+PRuWT8Kran/hqvKp8iUaYyCRDKOkxUYlel/CxAyrAsTA4
 QdbCiW2tN5c2cfsEsx1lLgOK6SQQDcBMpxhZEtaAG7zNv7yKQeaGYK5ZZuGWJOp5im5CqEpzn9h
 bfxgNe8o+bQWIlHX0kyjJKjmgyZa6Y4RyLPD+GYOJIPVKkvlr1Tk5yb7U0I0uXzJVmiGqsueMvl
 eS4r5JwF3OMIZN449IA==
X-Proofpoint-ORIG-GUID: 6P3hjqTgZSs61SIMarYiXJ6vAluU0_66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117230-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,nxsw.ie:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0ACE719E29

On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>>>
>>>> Why? The common power domain and interconnects have already been
>>>> described as resources of the parent CAMSS device, there is no need
>>>> to duplicate descriptions in every child device tree node of CAMSS.
>>>
>>> CSID, IFE etc are not parents of the JPEG encoder.

This is either a strawman argument or a misinterpretation of what
is being argued.

>>>
>>> The idea is to make all of these peers, eventually. Not particular block
>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>
>>
>> The statement provides the same information as before, e.g. it's found here:
>>
>> https://lore.kernel.org/linux-media/fbc018f5- c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>
>>      There's no functional linkage between CAMSS/IFE and JPEG - they are
>>      peers within the CAMSS power-island.
>>
>> Thus "the CAMSS power-island" exists, and it got its hardware description
>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>> a natural resource of all devices on "CAMSS power-island",
> 
> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of the nodes within it depend on that and it is _external_ to the block.
> 
> There is a CSID MUX on some SOC other than that I'll restate it again, I'm not sure why you won't accept it.
> 
> There is no dependency between JPEG and IFE, one is _not_ subordinate to the other and trying to find ways to invalidate that statement runs counter to the facts.

They are all subordinate to CAMSS_TOP - Vlad indeed said they are
peers (i.e. there's no co-dependence between them specifically, but
their parent is shared).

You can't use any of these IP blocks if you don't first power up
TOP because of the physical layout.

This is exactly identical to the MDSS case.
I was hoping this was clear after N other similar threads.

Konrad

