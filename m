Return-Path: <linux-arm-msm+bounces-112575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nx5vHdVBKmojlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:04:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C86ED66E5BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:04:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CZpRset6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G3yezmhJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112575-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112575-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 937B13053329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 04:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD50F2EBB8C;
	Thu, 11 Jun 2026 04:57:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD09282F1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:57:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153873; cv=none; b=eTDPsRbH1XC/Eksgd0tye2xdTayzeGQ6xpXZETia8p51mNJQ5oY9qbfSZHLsEpe0KJ2sBk9rxXBaTWptt4QYSzFRrnJ0kBulEPcuHiZDmcodbyanMgCneabbqUmeFkxFRmR2QnvWvUpzjqryDKkB4pkMbbia+jW+sLMJoD0C46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153873; c=relaxed/simple;
	bh=QiPb0ebVLggU+ODmCM0f1gjy4RN0OAeE5ZBnJgNvLUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERj2AO0noe+54g+hTVnPBJ1C93M94q1UroIsF2emCaodEbMToEK8FUzhJDJUEMhFyyRjdblOy9r67ne8tpjC2q330MTSBuVQBp6gJdKneTnBdcA+W8WwKGUjVQTwUKnXOfQF0qi6ugoMPzB0bnjvLHErclJ+dNLCi0lCsm8gYGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZpRset6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3yezmhJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NcIU3082810
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QLRAahITlkegKHnXAX/1dd0Rog+SWmDFOa1I9P9L5f8=; b=CZpRset6f7LRg793
	b9ga/1/uahtVY/Zav7DMvhkO44epquNDFRBsJjsnoXhxcTJuBKMm7Fd8426m/05/
	V0am0VEKIczBX9sjr426lqpPrMjcWlvydkdpmtyxrtT2kW1paWLjkzxmiLeKiN3p
	bd6WQc57+y3LRivFsSQBxA8SKQmmDFBm6aLALzTkAnmeo84cM1Nq30sN5yf1nHPT
	tavT6NVzOqde9fzR45Ii7k7VW3E7OT9H7EZvVkzF+kyC3phiIhsuXuqdrKXqCGAE
	ippQJYjjHCd0eIRDLIpuBEZgOBBErv3lt62brz33tUUKLOb1Jr3GmDZSFUi1TzQu
	12KWJA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:57:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2beff6b6e74so76121495ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153858; x=1781758658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLRAahITlkegKHnXAX/1dd0Rog+SWmDFOa1I9P9L5f8=;
        b=G3yezmhJKAhZVQEUuU4ZCQGdxLUB/0s+F2ZruQfiGeO5nP6+3rhyXi0gDWoj7YftsI
         1EiXRgL+eAwKkV5JNl6h3lcTBUBYHFzcKCJWR8DpUmvFnCrUiCZE84qU+E4P50xfFhW2
         KJSpK1nXgQHad80+mzIwD6b0ST5iZ7CC8E92EiuwLcQ98v3xgrxb7tv7yh7RyprT6P5X
         JxcSvZU1UHfpZhJawQzEF81k38eVLl/WgeiizP3Ax2FOHHIIf4lfoQ4H7Ki1fwqokPos
         icDcwXoC9+GMxuPIQeUiTfhhaMJps5dBHYgxyn6dqC6YwOLjfUhLC7RPGQvmoqLDapB5
         l5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153858; x=1781758658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLRAahITlkegKHnXAX/1dd0Rog+SWmDFOa1I9P9L5f8=;
        b=Jbf6CQ1/PlTSIt0FlnPYjHsErKpEQyz2LIJ24Kt9/SXF4k3aDiFSx65HGYa7Pqc6wd
         Y9u+Nf0vHkIIRxES+T4k5W+QeYvbPVJc2b2oqP+fXZMK3OeUqNv2uFblcx1UH9UVCNy2
         xVm6XqwkPs/pd8e+nDnLehm/dQQD+aXMs3PaB4cOoIxbVjcr7Zl15Rqc/5dA7+GtZWDW
         CM2PZ5yJxeD0W6uaWYoX22+nUrRt7WNIu63k8qjJmwl0irMfJcb0XHJmmqVa9FCNRMe5
         lOZ8oWKa8d4MY4LTwErAnGGev74pf+5bv5IO2ZpfFva13s8baS9Wzc+5j0bELwi+P0lB
         AlJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Rj65YeKEQHww3uLukj8GLPOUbO2PjK1C+T+kUopunPB30y91Lu7jCUxng/em/BOW1SyX440ktqb26fO6w@vger.kernel.org
X-Gm-Message-State: AOJu0YzPEF703S2mvmAMfZ0DuLuT8UtabtQZQAiUYHXHIBZh9yu3DtNe
	lqSDBEKhXFj7YJHwS7MX3eCgozhJ5cxB/F/oOIgVVi6933TGoiznE+wtTDh5kKS7wvD2g4Cyfqo
	CGe5nROrm1K1VjuWwHMLm6D6lVuAfFje3TZ/MwqAGgQqIK9kQvFluVnjeZb/XZfPO8Bxh
X-Gm-Gg: Acq92OFtoJ3QGPiYCsrT4OejRFndWUdpl8Csk4IYEj5F0+oZsVLG0rHbaUjKaoy7So3
	j8PFSd+7jARE/tFaG5ZyEHq/mfSTOw39p1qDwdQ16RkOWRrpkQlbhLL0tyO6IBY9YcFfLpy1zGu
	GPvpqxtIi4SKf4WFKxGDYwnxMn0VB8caQZ28QxU/Sa8iZWw53wyiAS0Kk1pXNXkZ//lDuPw7XKq
	oCbYkPSTOSrUH9WenI/5YXkpDEUB//EkinAEzJXttNm+XP4zVOej51TNiZQmwG00YAgiRaCPYNA
	qfIXmMHITPPumaxIhY/03GsM+T1H626XLm4/aBj67hr1oW/FeQaKwEEyOdw2nIJTaR0iEWwfnlD
	pTjL0Cq9OTffwWdO/NwzQpjGjDYLUWGOmCxUo7reu/q4xaH1GspVkDZauShGuc/SkvC20C9jzGT
	jsRaU39up660rOgPgAPgC4lA==
X-Received: by 2002:a17:902:e883:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c2f15ee4bamr14258255ad.15.1781153857638;
        Wed, 10 Jun 2026 21:57:37 -0700 (PDT)
X-Received: by 2002:a17:902:e883:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c2f15ee4bamr14257855ad.15.1781153856899;
        Wed, 10 Jun 2026 21:57:36 -0700 (PDT)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6ce98sm243670335ad.10.2026.06.10.21.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 21:57:36 -0700 (PDT)
Message-ID: <3328efab-f835-46e4-b83b-71bf103f6f4c@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:57:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
 <20260507-enable-byte-cntr-for-ctcu-v18-6-2b2d590463a3@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-6-2b2d590463a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NSBTYWx0ZWRfXyP4cXZRChQ3m
 TNj/Pn6t1+/mmSbE/Fx6AKGFfMhJ5nYFMSVNIfTbVl3O1niJVyXfMqGsIhkhc4km50Z4Z66SsRn
 DhpeA5dZs8790TpRU0/Xtx9O/jNVZmk=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a4043 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=anFEHkTd4I48GMdGUucA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NSBTYWx0ZWRfX2PkPMNzcH1+v
 tZTdW4mN6KakN0Wj9nnduAsHFWaAH3Rbj4sy188bzLprUkSuZMmIO63pjuIjyHVuvFfW/dEYm1i
 akaz4EfLmlSTc8kTvODijVh+7XRetUaIkm9UrW5eVzotCqeKiphjrVmx/F9NoGOQKOaNnLyDhUD
 N6a1+JDAPcj48nwP+FxOHhJOPI3UlCxTwd4mE1YdN2CKAcpb7ARoDcZ9lhErI2zxTZbyH7GMkUS
 Q+4bV4DuxfWnFsPTQqMNPgrIBZ5yOr2lMV/WGMiRKj4kkteZ7thRPWv/CCJI2y/upxBzc7OpOXG
 K9Eriq/XPASD9WFMcvh50Qjq9gF2ffCCwpB3jUGmun6EAxkZ1fqDRFRBKRq3NA+EHuxq+KSaFMu
 7jdHbbQmOImNY/An5Z3cDQ+o+igNPOuj3uAv9pPsIGOJKUrE6Nop1lbHvwBPVMLfDuVJxnWCbHZ
 xQaSrHl30b3T19AYySw==
X-Proofpoint-GUID: fygh3pazlICHNJfBaF5h2OZ-0T6P8G00
X-Proofpoint-ORIG-GUID: fygh3pazlICHNJfBaF5h2OZ-0T6P8G00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112575-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,desc.dev:url];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C86ED66E5BF



On 5/7/2026 10:12 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is triggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the synced ETR buffer.
> 
> Switching the sysfs_buf when current buffer is full or the timeout is
> triggered and resets rrp and rwp registers after switched the buffer.
> The synced buffer will become available for reading after the switch.
> 
> Byte-cntr workflow:
> start -> ctcu_enable(ctcu_byte_cntr_start) -> tmc_enable_etr_sink ->
> tmc_read_prepare_etr(jump to tmc_read_prepare_byte_cntr) ->
> tmc_etr_get_sysfs_trace(jump to tmc_byte_cntr_get_data) ->
> tmc_disable_etr_sink -> ctcu_disable(ctcu_byte_cntr_stop) ->
> tmc_read_unprepare_etr(jump to tmc_read_unprepare_byte_cntr) -> finish
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 304 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 127 ++++++++-
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   3 +-
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 114 +++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |   9 +
>   8 files changed, 622 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> new file mode 100644
> index 000000000000..6e53a5197e53
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> @@ -0,0 +1,9 @@
> +What:           /sys/bus/coresight/devices/<ctcu-name>/irq_enabled[0:1]
> +Date:           May 2026
> +KernelVersion:  7.2
> +Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the flag to enable interrupt to count data during CTCU enablement.
> +		An interrupt is generated when the data size exceeds the value set in the IRQ register.
> +		0 : disable
> +		1 : enable
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index ab16d06783a5..821a1b06b20c 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> -coresight-ctcu-y := coresight-ctcu-core.o
> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>   obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 000000000000..268194f35fd3
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>
> +#include <linux/uaccess.h>
> +
> +#include "coresight-ctcu.h"
> +#include "coresight-priv.h"
> +#include "coresight-tmc.h"
> +
> +static irqreturn_t byte_cntr_handler(int irq, void *data)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data = data;
> +
> +	atomic_inc(&byte_cntr_data->irq_cnt);
> +	wake_up(&byte_cntr_data->wq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void ctcu_cfg_byte_cntr_reg(struct ctcu_drvdata *drvdata, u32 val,
> +				   u32 offset)
> +{
> +	/* A one value for IRQCTRL register represents 8 bytes */
> +	ctcu_program_register(drvdata, val / 8, offset);
> +}
> +
> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
> +						 struct coresight_device *etr)
> +{
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(ctcu->dev.parent);
> +	int port;
> +
> +	port = coresight_get_in_port(etr, ctcu);
> +	if (port < 0 || port > 1)
> +		return NULL;
> +
> +	return &drvdata->byte_cntr_data[port];
> +}
> +
> +static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *etr_drvdata,
> +					 struct ctcu_byte_cntr *byte_cntr_data)
> +{
> +	struct etr_buf_node *nd, *next, *curr_node = NULL, *picked_node = NULL;
> +	struct etr_buf *curr_buf = etr_drvdata->sysfs_buf;
> +	bool found_free_buf = false;
> +
> +	if (WARN_ON(!etr_drvdata || !byte_cntr_data))
> +		return false;
> +
> +	/* Stop the ETR before initiating the switch */
> +	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_DISABLED)
> +		tmc_etr_enable_disable_hw(etr_drvdata, false);
> +
> +	list_for_each_entry_safe(nd, next, &etr_drvdata->etr_buf_list, link) {
> +		/* curr_buf is free for next round */
> +		if (nd->sysfs_buf == curr_buf) {
> +			nd->is_free = true;
> +			curr_node = nd;
> +		} else if (!found_free_buf && nd->is_free) {
> +			picked_node = nd;
> +			found_free_buf = true;
> +		}
> +	}
> +
> +	if (found_free_buf) {
> +		curr_node->pos = 0;
> +		curr_node->reading = true;
> +		byte_cntr_data->buf_node = curr_node;
> +		etr_drvdata->sysfs_buf = picked_node->sysfs_buf;
> +		etr_drvdata->etr_buf = picked_node->sysfs_buf;
> +		picked_node->is_free = false;
> +		/* Reset irq_cnt for next etr_buf */
> +		atomic_set(&byte_cntr_data->irq_cnt, 0);
> +		/* Restart the ETR once a free buffer is available */
> +		if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_DISABLED)
> +			tmc_etr_enable_disable_hw(etr_drvdata, true);
> +	}
> +
> +	return found_free_buf;
> +}
> +
> +/*
> + * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
> + * The byte-cntr reading work reads data from the deactivated and filled buffer.
> + * The read operation waits for a buffer to become available, either filled or
> + * upon timeout, and then reads trace data from the synced buffer.
> + */
> +static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
> +				      size_t len, char **bufpp)
> +{
> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct device *dev = &etr_drvdata->csdev->dev;
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct etr_buf *sysfs_buf;
> +	atomic_t *irq_cnt;
> +	ssize_t actual;
> +	int ret;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
> +		return -EINVAL;
> +
> +	irq_cnt = &byte_cntr_data->irq_cnt;
> +
> +wait_buffer:
> +	if (!byte_cntr_data->buf_node) {
> +		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
> +				(atomic_read(irq_cnt) >= MAX_IRQ_CNT - 1) ||
> +				!byte_cntr_data->enable,
> +				BYTE_CNTR_TIMEOUT);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * The current etr_buf is almost full or timeout is triggered,
> +		 * so switch the buffer and mark the switched buffer as reading.
> +		 */
> +		if (byte_cntr_data->enable) {
> +			if (!ctcu_byte_cntr_switch_buffer(etr_drvdata, byte_cntr_data)) {
> +				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
> +				return -ENOMEM;
> +			}
> +		} else {
> +			/* Exit byte-cntr reading */
> +			return 0;
> +		}
> +	}
> +
> +	/* Check the status of current etr_buf */
> +	if (atomic_read(irq_cnt) >= MAX_IRQ_CNT)
> +		dev_warn(dev, "Data overwrite happened\n");
> +
> +	pos = byte_cntr_data->buf_node->pos;
> +	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
> +	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
> +	if (actual <= 0) {
> +		/* Reset buf_node upon reading is finished or failed */
> +		byte_cntr_data->buf_node->reading = false;
> +		byte_cntr_data->buf_node = NULL;
> +
> +		/*
> +		 * Nothing in the buffer, waiting for the next buffer
> +		 * to be filled.
> +		 */
> +		if (actual == 0)
> +			goto wait_buffer;
> +	}
> +
> +	return actual;
> +}
> +
> +static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{
> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	/* byte-cntr is operating with SYSFS mode being enabled only */
> +	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
> +		return -EINVAL;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
> +		return -EINVAL;
> +
> +	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> +	if (byte_cntr_data->reading) {
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		return -EBUSY;
> +	}
> +
> +	/* byte_cntr_data->enable may race with ctcu_platform_remove() */
> +	if (!byte_cntr_data->enable) {
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		return -ENODEV;
> +	}
> +
> +	byte_cntr_data->reading = true;
> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +	/* Setup an available etr_buf_list for byte-cntr */
> +	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
> +	if (ret) {
> +		byte_cntr_data->reading = false;
> +		return ret;
> +	}
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	atomic_set(&byte_cntr_data->irq_cnt, 0);
> +	/*
> +	 * Configure the byte-cntr register to enable IRQ. The configured
> +	 * size is 5% of the buffer_size.
> +	 */
> +	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
> +			       etr_drvdata->size / MAX_IRQ_CNT,
> +			       byte_cntr_data->irq_ctrl_offset);
> +	enable_irq_wake(byte_cntr_data->irq);
> +	byte_cntr_data->buf_node = NULL;
> +
> +	return 0;
> +}
> +
> +static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{
> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)

Found an issue here. Need add one more condition to address the issue:

if (!byte_cntr_data || !byte_cntr_data->irq_enabled || 
!byte_cntr_data->reading)

In tmc_read_prepare_etr(), when byte_cntr_sysfs_ops is set but 
tmc_read_prepare_byte_cntr() returns an error,  the code falls through 
to the normal prepare path and sets drvdata->reading = true. In the 
paired tmc_read_unprepare_etr(), if byte_cntr_ops is still set and 
tmc_read_unprepare_byte_cntr() returns 0 (because irq_enabled=true, even 
though byte_cntr_data->reading was never set), the function returns 
early without clearing drvdata->reading.

Thanks,
Jie

> +		return -EINVAL;
> +
> +	tmc_clean_etr_buf_list(etr_drvdata);
> +	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
> +		/* Configure the byte-cntr register to disable IRQ */
> +		ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata, 0,
> +				       byte_cntr_data->irq_ctrl_offset);
> +		disable_irq_wake(byte_cntr_data->irq);
> +		byte_cntr_data->buf_node = NULL;
> +		byte_cntr_data->reading = false;
> +	}
> +	wake_up(&byte_cntr_data->wq);
> +
> +	return 0;
> +}
> +
> +const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
> +	.read_prepare	= tmc_read_prepare_byte_cntr,
> +	.read_unprepare	= tmc_read_unprepare_byte_cntr,
> +	.get_trace_data	= tmc_byte_cntr_get_data,
> +};
> +
> +/* Start the byte-cntr function when the path is enabled. */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
> +	if (!byte_cntr_data)
> +		return;
> +
> +	/* Don't start byte-cntr function when irq_enabled is not set. */
> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->enable)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	byte_cntr_data->enable = true;
> +}
> +
> +/* Stop the byte-cntr function when the path is disabled. */
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
> +		return;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
> +	if (!byte_cntr_data)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	byte_cntr_data->enable = false;
> +}
> +
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct device_node *nd = dev->of_node;
> +	int irq_num, ret, i, irq_registered = 0;
> +
> +	for (i = 0; i < etr_num; i++) {
> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
> +		irq_num = of_irq_get(nd, i);
> +		if (irq_num < 0) {
> +			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
> +			continue;
> +		}
> +
> +		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
> +				       IRQF_TRIGGER_RISING | IRQF_SHARED,
> +				       dev_name(dev), byte_cntr_data);
> +		if (ret) {
> +			dev_err(dev, "Failed to register IRQ for port%d\n", i);
> +			continue;
> +		}
> +
> +		byte_cntr_data->irq = irq_num;
> +		byte_cntr_data->ctcu_drvdata = drvdata;
> +		init_waitqueue_head(&byte_cntr_data->wq);
> +		raw_spin_lock_init(&byte_cntr_data->spin_lock);
> +		irq_registered++;
> +	}
> +
> +	if (irq_registered)
> +		tmc_etr_set_byte_cntr_sysfs_ops(&byte_cntr_sysfs_ops);
> +}
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index e8720026c9e3..2da1a6f3d29f 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   
>   #include <linux/clk.h>
> @@ -18,6 +19,7 @@
>   
>   #include "coresight-ctcu.h"
>   #include "coresight-priv.h"
> +#include "coresight-tmc.h"
>   
>   #define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
>   #define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
> @@ -43,17 +45,21 @@
>   
>   #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
>   #define CTCU_ATID_REG_SIZE		0x10
> +#define CTCU_ETR0_IRQCTRL               0x6c
> +#define CTCU_ETR1_IRQCTRL               0x70
>   #define CTCU_ETR0_ATID0			0xf8
>   #define CTCU_ETR1_ATID0			0x108
>   
>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>   	{
> -		.atid_offset	= CTCU_ETR0_ATID0,
> -		.port_num	= 0,
> +		.atid_offset		= CTCU_ETR0_ATID0,
> +		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
> +		.port_num		= 0,
>   	},
>   	{
> -		.atid_offset	= CTCU_ETR1_ATID0,
> -		.port_num	= 1,
> +		.atid_offset		= CTCU_ETR1_ATID0,
> +		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
> +		.port_num		= 1,
>   	},
>   };
>   
> @@ -62,6 +68,85 @@ static const struct ctcu_config sa8775p_cfgs = {
>   	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
>   };
>   
> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
> +{
> +	CS_UNLOCK(drvdata->base);
> +	ctcu_writel(drvdata, val, offset);
> +	CS_LOCK(drvdata->base);
> +}
> +
> +static ssize_t irq_enabled_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +
> +	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		return -EINVAL;
> +
> +	return sysfs_emit(buf, "%u\n",
> +			(unsigned int)drvdata->byte_cntr_data[port].irq_enabled);
> +}
> +
> +static ssize_t irq_enabled_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf,
> +				 size_t size)
> +{
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(&drvdata->byte_cntr_data[port].spin_lock);
> +	if (drvdata->byte_cntr_data[port].reading)
> +		return -EBUSY;
> +	else if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		drvdata->byte_cntr_data[port].irq_enabled = !!val;
> +
> +	return size;
> +}
> +
> +static umode_t irq_enabled_is_visible(struct kobject *kobj,
> +				      struct attribute *attr, int n)
> +{
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +
> +	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		return attr->mode;
> +
> +	return 0;
> +}
> +
> +static struct attribute *ctcu_attrs[] = {
> +	ctcu_byte_cntr_irq_rw(0),
> +	ctcu_byte_cntr_irq_rw(1),
> +	NULL,
> +};
> +
> +static struct attribute_group ctcu_attr_grp = {
> +	.attrs = ctcu_attrs,
> +	.is_visible = irq_enabled_is_visible,
> +};
> +
> +static const struct attribute_group *ctcu_attr_grps[] = {
> +	&ctcu_attr_grp,
> +	NULL,
> +};
> +
>   static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
>   				       u8 bit, bool enable)
>   {
> @@ -140,11 +225,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>   static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       struct coresight_path *path)
>   {
> +	ctcu_byte_cntr_start(csdev, path);
> +
>   	return ctcu_set_etr_traceid(csdev, path, true);
>   }
>   
>   static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
>   {
> +	ctcu_byte_cntr_stop(csdev, path);
> +
>   	return ctcu_set_etr_traceid(csdev, path, false);
>   }
>   
> @@ -195,7 +284,10 @@ static int ctcu_probe(struct platform_device *pdev)
>   			for (i = 0; i < cfgs->num_etr_config; i++) {
>   				etr_cfg = &cfgs->etr_cfgs[i];
>   				drvdata->atid_offset[i] = etr_cfg->atid_offset;
> +				drvdata->byte_cntr_data[i].irq_ctrl_offset =
> +					etr_cfg->irq_ctrl_offset;
>   			}
> +			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>   		}
>   	}
>   
> @@ -209,6 +301,7 @@ static int ctcu_probe(struct platform_device *pdev)
>   	desc.dev = dev;
>   	desc.ops = &ctcu_ops;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	desc.groups = ctcu_attr_grps;
>   	raw_spin_lock_init(&drvdata->spin_lock);
>   
>   	drvdata->csdev = coresight_register(&desc);
> @@ -244,10 +337,34 @@ static int ctcu_platform_probe(struct platform_device *pdev)
>   static void ctcu_platform_remove(struct platform_device *pdev)
>   {
>   	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +	int i;
>   
>   	if (WARN_ON(!drvdata))
>   		return;
>   
> +	/*
> +	 * Signal all active byte-cntr readers to exit, then wait for them to
> +	 * finish before resetting the ops pointer and freeing driver data.
> +	 * Without this, a reader blocked in wait_event_interruptible_timeout()
> +	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
> +	 */
> +	for (i = 0; i < ETR_MAX_NUM; i++) {
> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> +		/* Set enable=false for all ports to signal teardown to racing readers */
> +		byte_cntr_data->enable = false;
> +		if (!byte_cntr_data->reading) {
> +			raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +			continue;
> +		}
> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> +		wake_up_all(&byte_cntr_data->wq);
> +		wait_event(byte_cntr_data->wq, !byte_cntr_data->reading);
> +	}
> +
> +	tmc_etr_reset_byte_cntr_sysfs_ops();
>   	ctcu_remove(pdev);
>   	pm_runtime_disable(&pdev->dev);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> index e9594c38dd91..a2ae0a0d91d0 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -1,23 +1,31 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   
>   #ifndef _CORESIGHT_CTCU_H
>   #define _CORESIGHT_CTCU_H
> +
> +#include <linux/time.h>
>   #include "coresight-trace-id.h"
>   
>   /* Maximum number of supported ETR devices for a single CTCU. */
>   #define ETR_MAX_NUM	2
>   
> +#define BYTE_CNTR_TIMEOUT	(3 * HZ)
> +#define MAX_IRQ_CNT		20
> +
>   /**
>    * struct ctcu_etr_config
>    * @atid_offset:	offset to the ATID0 Register.
> - * @port_num:		in-port number of CTCU device that connected to ETR.
> + * @port_num:		in-port number of the CTCU device that connected to ETR.
> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>    */
>   struct ctcu_etr_config {
>   	const u32 atid_offset;
>   	const u32 port_num;
> +	const u32 irq_ctrl_offset;
>   };
>   
>   struct ctcu_config {
> @@ -25,15 +33,68 @@ struct ctcu_config {
>   	int num_etr_config;
>   };
>   
> -struct ctcu_drvdata {
> -	void __iomem		*base;
> -	struct clk		*apb_clk;
> -	struct device		*dev;
> -	struct coresight_device	*csdev;
> +/**
> + * struct ctcu_byte_cntr
> + * @enable:		indicates that byte_cntr function is enabled or not.
> + * @irq_enabled:	indicates that the interruption is enabled.
> + * @reading:		indicates that byte_cntr is reading.
> + * @irq:		allocated number of the IRQ.
> + * @irq_cnt:		IRQ count number of the triggered interruptions.
> + * @wq:			waitqueue for reading data from ETR buffer.
> + * @spin_lock:		spinlock of the byte_cntr_data.
> + * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
> + * @ctcu_drvdata:	drvdata of the CTCU device.
> + * @buf_node:		etr_buf_node for reading.
> + */
> +struct ctcu_byte_cntr {
> +	bool			enable;
> +	bool			irq_enabled;
> +	bool			reading;
> +	int			irq;
> +	atomic_t		irq_cnt;
> +	wait_queue_head_t	wq;
>   	raw_spinlock_t		spin_lock;
> -	u32			atid_offset[ETR_MAX_NUM];
> +	u32			irq_ctrl_offset;
> +	struct ctcu_drvdata	*ctcu_drvdata;
> +	struct etr_buf_node	*buf_node;
> +};
> +
> +struct ctcu_drvdata {
> +	void __iomem			*base;
> +	struct clk			*apb_clk;
> +	struct device			*dev;
> +	struct coresight_device		*csdev;
> +	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
> +	raw_spinlock_t			spin_lock;
> +	u32				atid_offset[ETR_MAX_NUM];
>   	/* refcnt for each traceid of each sink */
> -	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
> +	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>   };
>   
> +/**
> + * struct ctcu_byte_cntr_irq_attribute
> + * @attr:	The device attribute.
> + * @port:	port number.
> + */
> +struct ctcu_byte_cntr_irq_attribute {
> +	struct device_attribute	attr;
> +	u8			port;
> +};
> +
> +#define ctcu_byte_cntr_irq_rw(port)					\
> +	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
> +	   {								\
> +		__ATTR(irq_enabled##port, 0644, irq_enabled_show,	\
> +		irq_enabled_store),					\
> +		port,							\
> +	   }								\
> +	})[0].attr.attr)
> +
> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
> +
> +/* Byte-cntr functions */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
> +
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 110eedde077f..9f4fd86e8c32 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
>   		return -EFAULT;
>   	}
>   
> -	*ppos += actual;
> +	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
> +		*ppos += actual;
>   	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>   
>   	return actual;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b0c5f3559085..54ca9616fa66 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1168,6 +1168,8 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
>   	return rc;
>   }
>   
> +static const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
> +
>   /*
>    * Return the available trace data in the buffer (starts at etr_buf->offset,
>    * limited by etr_buf->len) from @pos, with a maximum limit of @len,
> @@ -1178,23 +1180,39 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
>    * We are protected here by drvdata->reading != 0, which ensures the
>    * sysfs_buf stays alive.
>    */
> -ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
> -				loff_t pos, size_t len, char **bufpp)
> +ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
> +			       size_t len, char **bufpp)
>   {
>   	s64 offset;
>   	ssize_t actual = len;
> -	struct etr_buf *etr_buf = drvdata->sysfs_buf;
>   
> -	if (pos + actual > etr_buf->len)
> -		actual = etr_buf->len - pos;
> +	if (pos + actual > sysfs_buf->len)
> +		actual = sysfs_buf->len - pos;
>   	if (actual <= 0)
>   		return actual;
>   
>   	/* Compute the offset from which we read the data */
> -	offset = etr_buf->offset + pos;
> -	if (offset >= etr_buf->size)
> -		offset -= etr_buf->size;
> -	return tmc_etr_buf_get_data(etr_buf, offset, actual, bufpp);
> +	offset = sysfs_buf->offset + pos;
> +	if (offset >= sysfs_buf->size)
> +		offset -= sysfs_buf->size;
> +	return tmc_etr_buf_get_data(sysfs_buf, offset, actual, bufpp);
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_read_sysfs_buf);
> +
> +ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
> +				loff_t pos, size_t len, char **bufpp)
> +{
> +	ssize_t ret;
> +	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
> +
> +	if (byte_cntr_ops) {
> +		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
> +		/* Return the filled buffer */
> +		if (ret > 0 || ret == -ENOMEM)
> +			return ret;
> +	}
> +
> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
>   }
>   
>   static struct etr_buf *
> @@ -1248,6 +1266,39 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   
>   }
>   
> +static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
> +{
> +	u32 sts;
> +
> +	CS_UNLOCK(drvdata->base);
> +	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
> +	writel_relaxed(sts, drvdata->base + TMC_STS);
> +	CS_LOCK(drvdata->base);
> +}
> +
> +/**
> + * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
> + * @drvdata:	drvdata of the TMC device.
> + * @enable:	indicates enable/disable.
> + */
> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	if (enable) {
> +		tmc_etr_reset_sysfs_buf(drvdata);
> +		__tmc_etr_enable_hw(drvdata);
> +	} else {
> +		__tmc_etr_disable_hw(drvdata);
> +	}
> +
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
> +
>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   {
>   	__tmc_etr_disable_hw(drvdata);
> @@ -2047,15 +2098,54 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
>   }
>   EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
>   
> +void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops)
> +{
> +	WRITE_ONCE(byte_cntr_sysfs_ops, sysfs_ops);
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_set_byte_cntr_sysfs_ops);
> +
> +void tmc_etr_reset_byte_cntr_sysfs_ops(void)
> +{
> +	WRITE_ONCE(byte_cntr_sysfs_ops, NULL);
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_reset_byte_cntr_sysfs_ops);
> +
> +bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size)
> +{
> +	struct etr_buf_node *nd, *next;
> +
> +	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
> +		return false;
> +
> +	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
> +		if (nd && nd->reading) {
> +			nd->pos += size;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
>   	unsigned long flags;
> +	const struct tmc_sysfs_ops *byte_cntr_ops;
>   
>   	/* config types are set a boot time and never change */
>   	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>   		return -EINVAL;
>   
> +	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
> +	if (byte_cntr_ops) {
> +		ret = byte_cntr_ops->read_prepare(drvdata);
> +		if (!ret || ret == -EBUSY)
> +			return ret;
> +
> +		ret = 0;
> +	}
> +
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   	if (drvdata->reading) {
>   		ret = -EBUSY;
> @@ -2087,11 +2177,17 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
>   {
>   	unsigned long flags;
>   	struct etr_buf *sysfs_buf = NULL;
> +	const struct tmc_sysfs_ops *byte_cntr_ops;
>   
>   	/* config types are set a boot time and never change */
>   	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>   		return -EINVAL;
>   
> +	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
> +	if (byte_cntr_ops)
> +		if (!byte_cntr_ops->read_unprepare(drvdata))
> +			return 0;
> +
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   
>   	/* RE-enable the TMC if need be */
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index fbb015079872..a15e2f93f16a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -211,12 +211,15 @@ struct tmc_resrv_buf {
>   /**
>    * @sysfs_buf:	Allocated sysfs_buf.
>    * @is_free:	Indicates whether the buffer is free to choose.
> + * @reading:	Indicates byte_cntr is reading the buffer attached to
> + *		the node.
>    * @pos:	Offset to the start of the buffer.
>    * @link:	list_head of the node.
>    */
>   struct etr_buf_node {
>   	struct etr_buf		*sysfs_buf;
>   	bool			is_free;
> +	bool			reading;
>   	loff_t			pos;
>   	struct list_head	link;
>   };
> @@ -480,5 +483,11 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   extern const struct attribute_group coresight_etr_group;
>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
> +void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops);
> +void tmc_etr_reset_byte_cntr_sysfs_ops(void);
> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
> +bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size);
> +ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
> +			       size_t len, char **bufpp);
>   
>   #endif
> 


