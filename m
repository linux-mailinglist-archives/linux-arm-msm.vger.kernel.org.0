Return-Path: <linux-arm-msm+bounces-111863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWnEH6qxJmoXbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:12:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5BC656007
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:12:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kJ8GQ3tg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B05Ywc79;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111863-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111863-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D4D5301175F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC2733D6D7;
	Mon,  8 Jun 2026 12:09:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF35340409
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:08:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920541; cv=none; b=ILhD1JDwDFchn//bEVb/0jUNxS03E1H/IvWhFoYei0Uy3VhTLHjpEbF+VBAMuI2v6JaBNMyJVmmiH/7x0NR0B1MUGnYMhc+eE1lw5BsovVtN0DWxUnJzNCLxv3LjKXldEgTCS/IvxHg/sWIC30d5hGEUzSWlp0yIIIQHmX5Ied0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920541; c=relaxed/simple;
	bh=XiYzvzrRYBA/JuO/QX1C2PuSDfSlMv273Z2HFb4Zwn8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jfYakO2NFBOPGIttgM0pEAeZsP/zjP+QF80iFiIUV1z+XSr/wZ+YSd09DQqKpaMPfPs1Pplj1qRkycFhpFGZfcEg3pomc36OHko5/brm19DohjptQ1FZBz6/S00//81dYA3HFSGYuZJb5JTMO/MNAUSdf6wTuP3X8rXw06svSYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJ8GQ3tg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B05Ywc79; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBKn83417615
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 12:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=; b=kJ8GQ3tgWSIXFx5V
	KaDA7I/oOXBKaOphO2BEwWl4O43NK6C5fXG5css4cuSRahXZQSJ7M6LWA277yIDd
	vbFE/fQlTgh0DwkBIeMjVSxKWJZwTKhNd2cGt3LYOQWetGsihMiFA674NBDuGdCn
	T2CmXqOpD8SBQVd3uM2A/tB1Q81u1AgfC7zhS19jaFSef5M3RcfoqzgvFgSXzL3u
	rxPnzF+YFcDvyPHfZmKGAab09QR2AlL/UuW3hjvycuKtOUubr7pKL9dgJXEnOty2
	3j572mDq302uwdlBIPUzM9FwVws0EnmW5cTyWuN+wu2R4kaF6A2RjTNYf8Nd5UCT
	fGYTMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptggpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 12:08:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf30576aa3so29665005ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780920537; x=1781525337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=;
        b=B05Ywc79KY3V9P+NLPC3WSuENgYyZrOnUxpXLRK0HW/SabHTJpmUbQ4nJ4OvfXvO9n
         4/RtgXaUy/bRBR+CML0KfE8l4SW0lFoN7Gm/z3v93nWYMvCQNPixTjyBWQL7bwnqFCa4
         22nFh64n8QCrbg2HRgYzaJb6dDFG8+HvKFg4u6tbx/VyXlxYzf3c41r4TEXf0DMXf5wY
         RG53/7QrEiA63dMXQc0frQfVHIFbpgTJ2Jg3ITS+yn9JXxXl6TokDHrgcRpR7N1YGs7M
         4zvdVyPy2JikIr6VVfT+OTd4dbhx4wTPPYzLQBqRsQ6ah0ASk08pv54isw1u2znLOiXc
         uJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920537; x=1781525337;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=;
        b=kAK35Sny+kLFWC2ajwZ8uAyccaKOeaUn+sEAwW6nmerFpk+p3p8uU3tGUJbYLRosso
         TV/UOCRk/qNVvGl4BX/eeIJnf0k0uA+wu5jjZJhkn55K5c6M6I3lKC8vWyqmOupbR8r2
         c1j97WeOV0EFzSDvXgS48zib81lbnjTeoq8dZGMaIAzn7/Krdgy8RUPM64iJflM4mJVb
         qy1FCxLdzPzv88DQGHgGI8WFZ7T7kMcHJFDS6K/kFGIcUGRgaSCZQIA6PG+GcChkB6Al
         Mkz7KgAnD4LU7O9ChvHx0pcsTTBBKvylAOAVlTdurRfkcxvxfDCFRZCs+xyj2lb/gCiP
         KVRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1Z199U2WuRPoRlGLykD8JpiM0Bn2AGYZdGOR8OWl0je1SXpr4Re+/pd99XM15HiKg4TMt8QiUTKencvCP@vger.kernel.org
X-Gm-Message-State: AOJu0YwiAfCyY6ht1gD2ov82nAfmjG/c//ifBInPIMagM9TJuJ82/g+p
	/UpF6VtcBWqe59hAoJK+6OMueUMMUnRg6AFkYQEVD9x+GB3VqmpzqS7JcgglYPI1lX6vv4k83j8
	4n0xE4UeiOqrc+BaJaIvQQLqzlDbuTjebexX1gZ2cUtH0y0ws+9djcA8Iqa8ANVhgQMrf
X-Gm-Gg: Acq92OHh7PbTP0JPAwdgMqI/DIBuKSYPyZJNpla6K8MZqtXavTOv1Fnf8fMAZehPMcv
	D75OQ9WxWBlUJbunYkcg7dluyH10hHIuj7hw8U2C7E3+g9lsV4/gGfkOE65pxvwwAZ4aoKZFIYm
	wlGFlqup8K/woUWBg8kNRKxekeSQDz2Z0pZ+uFBFffzqBo2unJLwYH3YTVs/y9GokU63j29s7Uo
	VFnKljkZODFF/feRxOEXS4Ytk+KUku2MNbyA1ZPks2lVcrWAuY4YwA9MeiTvIT2M1SJ1pdX340C
	fNVHdwhpOfl/2vfEJ0ftU2bCV+q5H5p120l21giwC/EThHrSa+BgiRZdzGyQlJV+ymF+ieHZXED
	Hy8E7m5zASIiqpHAHBRtRCKg3nfv6r/wk9TrRoLZq3KWg7pfRecBPuufzjVP8udoQ
X-Received: by 2002:a17:903:1ac5:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c28659dc9bmr20889065ad.14.1780920537136;
        Mon, 08 Jun 2026 05:08:57 -0700 (PDT)
X-Received: by 2002:a17:903:1ac5:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c28659dc9bmr20888535ad.14.1780920536563;
        Mon, 08 Jun 2026 05:08:56 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm183538985ad.80.2026.06.08.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 05:08:56 -0700 (PDT)
Message-ID: <b10d6220-08d4-bcef-44c3-6bd2c1e096bb@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 17:38:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 07/12] media: iris: Add power sequence for glymur
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
 <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
 <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
In-Reply-To: <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DNPwILXs9zlOCbqbT5yqX1FmFil2dStA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNSBTYWx0ZWRfXzgEMjxMZgUpV
 q9tSnaBqCNpfKeZsfqxKyYSaGsjUCYm7jhjIsrJFNHw8k9bxPdDBDTUB5vPElieQuOSc30e62Kg
 qRLbcjtKtHSFB4DLw5ru3MuJsr7KA+DWy0IY3ZsIuzy60CublBCxLrwhTBkEK4+F0J0Dgrbembq
 jh5LGuFf/yJEifs6XEcbQgbEUQ89lFchfPszFu0m7hJA04OyXzW6pwEqyoB9gbUJzZznM2Ao5L0
 l2mTY3gJOQhSkVmXFvDyyohC/ABGZIA/2PwJnlFW/fvb6WV3JlaKACX8oInjVft1ZDQTGDVA3X6
 MBHw44OiaSBrcwKrWNHzkvw6LYqn1WDZb0HtyRNhqY9C2uc0xdxbTbRm25PJjqDt7veqQY/AzZe
 AKv1m2mjnaVxH4Mp1AV53ksm796k6hvWye+i4DPutFgOWnSfD4WiTdH9ZHUO84+W5Z0kgd/qyVG
 W05XDcoCgQY7MJN7cuQ==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26b0da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zzk4QuvOVKE_xORUXiEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: DNPwILXs9zlOCbqbT5yqX1FmFil2dStA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-111863-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C5BC656007


On 6/8/2026 11:09 AM, Vishnu Reddy wrote:
> On 6/8/2026 3:17 AM, Dmitry Baryshkov wrote:
>> On Wed, Jun 03, 2026 at 07:48:45PM +0530, Vishnu Reddy wrote:
>>> Glymur platform has two video codec cores: vcodec0 and vcodec1.
>>>
>>> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
>>> same power rails. The clock dividers between the source and the branch
>>> clocks are fixed. So when both cores are running, the source clock always
>>> runs at the highest frequency requested by either core.
>>>
>>> Since both cores share the same power rails, the power corner cannot be
>>> voted independently. Scaling one core's power corner up or down would
>>> directly affect the other, leading to under or over-voting.
>>>
>>> For these reasons, both cores should voted the clock and power rail must
>>> be based on the workload of both cores.
>>>
>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
>>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>>  3 files changed, 117 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> index 7cda94601555..f07eaf4b3be2 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> @@ -17,14 +17,14 @@
>>>  #define NOC_HALT				BIT(0)
>>>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>>>  
>>> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>>> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>>>  {
>>>  	u32 value, pwr_status;
>>>  
>>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>>> -	pwr_status = value & BIT(1);
>>> +	pwr_status = value & pwr_status_bit;
>>>  
>>> -	return pwr_status ? false : true;
>>> +	return !pwr_status;
>>>  }
>>>  
>>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>>  	u32 reg_val = 0, value, i;
>>>  	int ret;
>>>  
>>> -	if (iris_vpu3x_hw_power_collapsed(core))
>>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>>  		goto disable_power;
>>>  
>>>  	dev_err(core->dev, "video hw is power on\n");
>>> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>>  	u32 count = 0;
>>>  	int ret;
>>>  
>>> -	if (iris_vpu3x_hw_power_collapsed(core))
>>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>>  		goto disable_power;
>>>  
>>>  	dev_err(core->dev, "video hw is power on\n");
>>> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>>  	iris_vpu33_power_off_hardware(core);
>>>  }
>>>  
>>> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
>>> +{
>>> +	u32 value, i;
>>> +	int ret;
>>> +
>>> +	if (iris_vpu3x_hw_power_collapsed(core,
>>> +					  core_id ? VCODEC1_POWER_STATUS : VCODEC0_POWER_STATUS))
>>> +		goto disable_power;
>>> +
>>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +	if (value)
>>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +
>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>> +		ret = readl_poll_timeout(core->reg_base + (core_id ? VCODEC1_SS_IDLE_STATUSN :
>>> +					 VCODEC_SS_IDLE_STATUSN) + 4 * i, value,
>>> +					 value & DMA_NOC_IDLE, 2000, 20000);
>> Unreadable. Extract register addresses to separate variables.
> Ack
>
>>> +		if (ret)
>>> +			goto disable_power;
>>> +	}
>>> +
>>> +	writel(core_id ? REQ_VCODEC1_POWER_DOWN_PREP : REQ_POWER_DOWN_PREP,
>>> +	       core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
>>> +				 value & (core_id ? NOC_LPI_VCODEC1_STATUS_DONE :
>>> +				 NOC_LPI_STATUS_DONE), 2000, 20000);
>>> +	if (ret)
>>> +		goto disable_power;
>>> +
>>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>>> +
>>> +	writel((core_id ? VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE :
>>> +	       CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE),
>>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +	writel(core_id ? VCODEC1_BRIDGE_HW_RESET_DISABLE : CORE_BRIDGE_HW_RESET_DISABLE,
>>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +
>>> +disable_power:
>>> +	dev_pm_genpd_set_hwmode(core->vcodec[core_id].dev, false);
>>> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
>>> +}
>>> +
>>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>>> +{
>>> +	u32 num_cores = max(core->iris_platform_data->num_cores, 1);
>> Can we trust the patch authors that VPU3.6 hardware data will have at
>> least 1 core?
> On Glymur (VPU3.6), num_cores is 2. The max() guard is unnecessary.
> Will access num_cores directly.
>
>>> +	int i;
>>> +
>>> +	for (i = 0; i < num_cores; i++)
>>> +		iris_vpu36_power_off_vcodec(core, i);
>>> +}
>>> +
>>>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>>>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>> Lowercase hex.
> Ack

Just now I found that this change is not part of this series.
Can I take this into separate post?

>>>  #define REQ_POWER_DOWN_PREP			BIT(0)
>>> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>>>  

