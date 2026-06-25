Return-Path: <linux-arm-msm+bounces-114480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WXUfCoXxPGoTuwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:14:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2A6C4201
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:14:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l4QIDGce;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ihDKYSWR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114480-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114480-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F1C302F27D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276D6373BEA;
	Thu, 25 Jun 2026 09:10:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3F51E32A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:10:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378620; cv=none; b=T3qBDUuEWDXoAZTqs3chr6/sgDSAgYVJxOD5c5jOdP1dnEGLpjlkqvMN4O+yLx4eegze3hVqyGgH5D8nHrsMlt1tcT1lsliJholBX13oYVSH68andoeoaUCA+UDDNMDzvHciHCAR4zYRVwaoX9626/XL7EkVSnO8A8pEm2ORrtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378620; c=relaxed/simple;
	bh=BwTZm0QTrFC8551Lx3tFYnLALArcN7EF2f8UQs0fqks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NACpCfpeGylj3obDmqOTrFGnBzpVclQTI1fSNsZlIFHuarhrsJ8/8N84WQPLj6bl+Dt2G4NcpZnROGnwLyD1d7V1WUd7Pa6G7LOD2ak9QKxOptDytoR+jDbX/rHwhr/3VDDZHBHWncVeaDVr3YRmt4a1XraKxsbixbVjcUQtFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4QIDGce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihDKYSWR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8q5QA1601035
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Dp/rVPOEK3+fKbuVp8/HILtja3W7TceSg9QMydZFB0=; b=l4QIDGcezJlgl/lg
	l2ynRcvRsd8aXNMj2LkeJNBAhtdebvAZpUfSKtb4tr1babFtLX4DJ73IDidRWUI0
	NYImW1XboVsVRzv6cWJfgcRU72kiZKQsG3nxySKxQjkG7jN6WwgYDUrdhGeACgb3
	qlThCA3rAIh8XMyMAgKKCkNTu2pT8D+Gt00xofOHnQT6dHFBuU73dw0WrszsDvoy
	jTRPk9Qsl11kHkm4NGUBWZY2lnjGeEYoJK2NeK54lC/lSqbVWHgdqb/hVPhUIWBX
	A6ZirjRimNfABItgBl6JS4MzU2z8Sepk72vhEHy+1MK+hQGaCChu8lLoMAN7GOY3
	W5fMWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7duj0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:10:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915756c1407so26408885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378617; x=1782983417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Dp/rVPOEK3+fKbuVp8/HILtja3W7TceSg9QMydZFB0=;
        b=ihDKYSWRezxYosZXyJP5qsfT/KcMpe6cNDptvjNPS/xpXkw42CjzR+mo4TOixyArVb
         Kmq/bpv9MRinrnxmblqwwIKTeuO+UtlIRp2Xoo+QTbxp393KnQoC7ilBNnv4aLGiob4X
         m/rPZhqXmT8MX0s5gbfU8gx7xLZ13/mt2ISqhb8OiwjXbHDyRrEMXDr/ipu6Dwd8Qe6n
         20gbJGUH7jqUzJamy/y9MiuxzhFPNPURqYAEnc6FbIwRUIaJP+8cJSWXThjcToh/f/uU
         0V21jg+nQ7laFmkdHY5z6uy8rS5vFwDZSFRfG8vMOGBv3SQMrmpwDxYcbQb0JZjhCuB7
         C22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378617; x=1782983417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Dp/rVPOEK3+fKbuVp8/HILtja3W7TceSg9QMydZFB0=;
        b=C+KJ6h8/wOOD79nANI7Ph7kl/L220tNci2QL+2ErJh6frRgrHaqBQBcIDe29DkO+6W
         B+SzNW6eDV58y+21kZBHd6zHYUQKXW2Uu8nIOhnaLMPFBU2qwko6Jf9+usjSjxpJ5m0N
         +P5iG1Vs+Rk4t4Ah3JWzwSYev/U28Rus3eqthdb5+F03aOn6BF1GVlh3GvD7dSA/4g19
         ZB0Igd3suhsf8dyytsA2ZIndHylIMsk9Ec5FOaUcg3HJPdcxFrFl5eW9oie1TY2u5iCX
         gsnan0ba7GVhxLxQ6FzoRoyLsWkq5H5+Ack5hakdekJDUnauOhIM2kjwBmM+p3np14XR
         SUqw==
X-Forwarded-Encrypted: i=1; AFNElJ9MAxr1kCzWkerUmI43dQTQmhEw4ToXsQB8aSSX0EEQg6qxTXNL7NwytyakHDMMXKrYYBDtl56YUMxD29a+@vger.kernel.org
X-Gm-Message-State: AOJu0YylyJnYtwTH2lo7TbX/UuOI33AQUZ2IlsmRfrmd342LnBkIa7G/
	+SzfGQW18HxN3kW8Wr92AkN3cJ+RmU7i9oW9Fg95TInl8fMZQXUw7rTGmSsIcqzoPeimLSkgtUH
	BzRih8Pwh9EtwTbvu20InMTEbqEVOBKGG7aNBA51S6lFxNzfjwSZ/hM/NNX4ojIu32oyN
X-Gm-Gg: AfdE7ckxqQ6qCbsnsO3gB8X4ZRZcqu7ffZ3lrHxU9ao1u0jyuPitKdnKN9rhjfQj79S
	RVoUXyT5EnJ8knwRxXmhRN0OUhpDMMTl0aN5itRi2tmKYvl9qpl2V2DbV9IKW52JPayY0DvIfUS
	cnwXgVeUIfdwJl+Ixhc8SmMF3jq1PEbzBcY/enxrmP/zGxpg4ppwXhflcPRtGEPzBxv785CEN/8
	Ua3S1mexhHPSCEuQl7DL5cv5kqyDD0EhCGUpEBqsnBgiI/bsaZy4TrkNJCblP++l+eQaTPEf2Oj
	Z/O7rAD//SCfD864zf907wtaoVR78/Ukodc5F5uUCcxAkcbVOTCabUU9VUur1NNeZSwB087cMD1
	+fXMtI0hdCTQjRoDcKknKtbJrVZF9nxh6LA0=
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12656451cf.4.1782378616899;
        Thu, 25 Jun 2026 02:10:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12656121cf.4.1782378616454;
        Thu, 25 Jun 2026 02:10:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba862asm139923166b.9.2026.06.25.02.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:10:15 -0700 (PDT)
Message-ID: <a83b2bc4-6f70-401a-bb83-7b9668b5b87a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:10:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T-fNo-9GkqzNslPfmHIclqzxRSiaVObn
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cf079 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9BMPqzrIbjXEeBTFrkoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OCBTYWx0ZWRfX/zMwP+wMhtxI
 ZgrA1NLBt3hZsC3I34blX4dXMZCrLz22mRyNZsg3WHHj2XCeyHr6VPH8+Cq8h//RLoNyxmBb8QQ
 HJfVUk/tz758w2eF0c5ReIgsiGhha2I=
X-Proofpoint-ORIG-GUID: T-fNo-9GkqzNslPfmHIclqzxRSiaVObn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OCBTYWx0ZWRfX0qFx47xSt3mV
 wskq7lwHxcoxy72waJDJCTj8IlfNj6Y2QKTv9V7OdKz2I9eii4MPkT6JL9nLKskaP8Jo8UbK5Rm
 g7bZhxKCQPC8X5GGKoItRohsd4OFyE6GKxs1VG6DHzh7xPaJZNd6eWFWPMgeBu8GAL8fxTJh/4u
 1nzMt1WeB2tBVEmGyaVKN/R6HW/zREBEjsaoyFoOlSHuwRiGWUrlROdndOAZmbG9Zr+Jop8iZrC
 nS0vprQAi9cRxFSHchEGRFKjfJitCyWnZfdlAZjd3d0LmVJAnqpORAf7evHWjjlvAd7cz8HtR3m
 t69RCvvsWqxiyWy9WdBrZfVc/nq6lRpLi7YpeSFq9y0Lv2t0aJsdtLE6+29LdHxHSYYNpepm6L0
 Y/JtesNDBerVPfBw8+NiqlF90dgg70Z//HGjpVzwzpUKD5/p2kvtoHzeALNQKX88JUvO/8UXWfk
 XLUu/Ugpk72GJjbP+Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114480-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DF2A6C4201

On 6/24/26 9:37 AM, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
> 
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +out_free:
> +	kfree(pattern);

We can use __free() from cleanup.h to get rid of the gotos

[...]

>  out_unlock:
>  	mutex_unlock(&lpg->lock);
> -out_free_pattern:
> -	kfree(pattern);
> +	kfree(pattern.data);

likewise here, also with guard(mutex)(foo)

and same below

Konrad

