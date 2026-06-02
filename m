Return-Path: <linux-arm-msm+bounces-110707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKJKCLBlHmrCiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:10:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C92D36286AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B15BA304705C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 05:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FAC2EC081;
	Tue,  2 Jun 2026 05:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix1Mp1wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dm8PyLq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E212C0268
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376902; cv=none; b=pO5WG2zvDLOL13H3ahY3Y/VWvletBK1PrwX9BIoYy8uhjJHLMNKpdu1dVndBZXOQaJuaxAL5bYxkQWA9Ao8fdpCm1mQNyCL7WguRCJ8ibJcYTPVH0zLqYJAlyWDFPLpHknbcWbra8/s083PBrV3NKRsGcAH5UsiLYiYI3Yh/c+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376902; c=relaxed/simple;
	bh=eKrV9zh3ZaEeey6RkTXbrqYYTtUHHVzupxgukWOVzzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu3Dy4lEbQguAZRtsdStCAKQIMpXVVx/fTD6E9QcF5qOodvkZ5I2OK00q3WIwsQPB7l4nk1TqlgpqmkhVLqMSuRwz39QqPKqgnZeuW6PipTzEpTYRljgldOamjEOuuc2enyi6/15fPt9m0IcF1USp4WE2oMJdOblIXabj0/R1HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix1Mp1wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dm8PyLq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6520LZpm4110250
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 05:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d28Ha3EmmAL2GsQgsnbMUilRRMObNSU7bvAQPZBuHJc=; b=ix1Mp1wciowqktCM
	xHPoN72mcv1sscgpxCjYMLKg4xoVjKXqCDaqopi5lXjBXK5IT/rNRUnDAWBqfFTc
	lFubJkU1LXLNQ0coUdPtRUrR32PS0JhVBcEmc0XeH+XyvXI4joXWVjqvCJ688/pj
	jNVuF3F5vpQkmydOBqGHSc9eXhbIxg6UnC9QRA51i2QPS+p6v1awZ01O7/VuCJTC
	UiLtuOejH+hWI6XKgFEYiv63wcWUG5AY+spdQy6BD9R7kDXKnA8SOWNAByR5UTDL
	hM82tWCnsKWI1oTkP2Rw5UpRwq7vTHtHwOD0h2vMvp0ScjjqI3X5awv6W57kqgtm
	JCHSOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3vjf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 05:08:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf55c3f44aso23875275ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780376900; x=1780981700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d28Ha3EmmAL2GsQgsnbMUilRRMObNSU7bvAQPZBuHJc=;
        b=Dm8PyLq+G1drJo1GBWNGbJhes+Y85PTZfnp9AYdUsfL5RelpHayiDtxViDJALJdFFG
         zemqizjTX17SzCtu7nKcmoyscbQvrQXn6a03OflA+/o1adaCVUJvYKNG49VxTtSkiqZ6
         GZmLY/h9fFTiazGCG4EbFDtT9ZCrw0H9Ziw4klrERO+ApG/m12nwAPecB7MFabYwIKyZ
         sq9aEUCIlzBoUjD7Ven9F9HSmM4Eu497Bl5ycpvCWtLv0XFcxt5kPbp//+0WD0hX1+r3
         XA6+4NyB6zLQ92Wbv0ahDaMq/zgv45p/znuuObLbFOXQMZR1xCgwrOBRoslwcK7gvQ0m
         CFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376900; x=1780981700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d28Ha3EmmAL2GsQgsnbMUilRRMObNSU7bvAQPZBuHJc=;
        b=iZPwOfQ8xarULZh0BXetWSSf8S2riaWQ6P9HwMXgXAxcYgU1Gippicv48A1psmd76P
         KYGgeOuQoDZgRlkXnFeG0qb0Sn5VtwVmcwNSbE/tlpukRVerKIyyXuu1QppclGnJeehU
         AahIPTwG0QX8e4DBS3Kv9Urbs47q21bXBlikxyQ/QTbbL/Z96mG/3U+VsWV2PSSLzbUS
         C7mxkS7Csn5WGVLRe+GbbGPgK5l8OeRj9mHVy96zfPUIfNY1du2I4jgWo18DCpm7gF9W
         bZQ9FkH5PjS9RMu8HlQ2JhcvaM1XQk7Vz2a9151kEHzZFjN7w/2Agn+tHnwvhtu+uxGj
         aOvA==
X-Forwarded-Encrypted: i=1; AFNElJ+gxfIE/tgKqf3/WhH6D07Om9WBYEEJLR+OO75r0jnFg9LKzAJUh4M9laBthn5ou+AqT7aCgr3rPvnvgxav@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8oLUM8w6ECpftOrl1g83ulcK59SuHuM08TrWTnQ0djrTkRuJ
	NpQ4Cm+7RRejU21IdCRYPLJWdwvUJnbqnw97+WceDCWg4pLcAbF95tBgBeXPmAmt8JOIzV3Ij6l
	ryavt/CYplRpQDpXWwFfxSEu8XPWt6VtaDVnz+qTf1MKxihsTkIo3V06H1c5cy5OOr94L
X-Gm-Gg: Acq92OHLjOY4Y7Hdp70arSVHyGYPmE+1qMtWDT6mnoZ2h23iH/mvGuAfpEJnb6pw3gy
	m72ddp6MucnLC0bnv6NzO65k9Grv8bnaT9F/9LGCaEnlKJKmCZ5CntMu/S8s3bS1XohzCnPz03o
	8uH28fSMpJHJzR4/1aZjp3Ppb833+Genw2TNcgC4yMjh0rkVdF8SS6JsBtyO+Hw6hhETpQIwWRD
	4nwtm1KTTDeQQfURDaTn2WWolqdDcEu1CuwpGz53ezQIMqiCH3pEWn5g+kXVzJA2WeSh5a943Nj
	VoQpWoVP/KMSRvbMuREuvOmoQWAN40RrhbLXKlWye/XdZmdmR+R/qWU2shPa8eRqahvoOIazbA9
	X/C538OFdrYquxkuHRLRW1O147ZVLbszA9bWclgiR3S0OHDxPupBMW/NLrdNeBQUMUme4OtoUXj
	Xi
X-Received: by 2002:a17:902:ea04:b0:2bf:22f6:6acc with SMTP id d9443c01a7336-2c10cc0de7bmr21836645ad.6.1780376899848;
        Mon, 01 Jun 2026 22:08:19 -0700 (PDT)
X-Received: by 2002:a17:902:ea04:b0:2bf:22f6:6acc with SMTP id d9443c01a7336-2c10cc0de7bmr21836405ad.6.1780376899365;
        Mon, 01 Jun 2026 22:08:19 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm156004175ad.10.2026.06.01.22.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 22:08:18 -0700 (PDT)
Message-ID: <e9d687f4-0280-469c-8729-cb4ded09dd84@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:38:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable icc-clk support for Qualcomm IPQ9650
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1e6544 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WYATWo6mIzdYKek3wXMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA0NCBTYWx0ZWRfX8YpQIMqIeRIK
 ZeKjlDmkLHtBTTrG5+t1AaOWfANa+86v1YhNW5IdKr6ll+G0hYR3usK9+oH49iAVXqviCJs5Mzv
 Urtb94uuZfgU3y1gdQjmRg5pIAak79iWU4C59vSwQjl2gHsxJK+7rPs0JMSMr/CTpMhREKFGrns
 v497BcvedmgAwNNEPUQxy/1DAnGLC0jyd9ZpYTBsCcv9n8Pbr4kv+Q7UiWRB8VXsSKmyN+7NSVE
 qbexQphTvHpIwqo7jo/40t/DLFvgz39fvM6JnLVO/5PzKENg9Ku3Sc6WzytaraD9jTo3Fr0PuCA
 dPgvdNuGE6ClFlN+mGxKBSNGuwhRCdApnlo1F1Nx+6wfHCSSD8x3Bvk/NXlTCpdIFRxgTtR918I
 Ta6y5CtXzF8MzBAUUGOIYrYHK3twv0qBPBDxZgadNEb0XVZ2SBedsTeYwomDmOJ0+T0+IdwRtpt
 0E+/6mb8KogpWMSXdnA==
X-Proofpoint-GUID: xq1gQw0vY-kG1aec7dj4iqH5-7wckvap
X-Proofpoint-ORIG-GUID: xq1gQw0vY-kG1aec7dj4iqH5-7wckvap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020044
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110707-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C92D36286AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/19/2026 2:17 PM, Kathiravan Thirumoorthy wrote:
> Add the master and slave interconnect IDs for the PCIe and USB
> peripherals and enable them in the GCC driver for the peripheral
> enablement.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (3):
>        dt-bindings: interconnect: Add Qualcomm IPQ9650 support
>        clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
>        arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node

Bjorn, Gentle ping... Can this be picked up for v7.2?


