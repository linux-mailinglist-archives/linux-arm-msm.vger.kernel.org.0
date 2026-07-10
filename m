Return-Path: <linux-arm-msm+bounces-118187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JiroGGyuUGqC3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:33:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCE738857
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:33:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="LTK3w/pf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GtFReaBW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118187-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118187-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E6DF307EDB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD85D397E85;
	Fri, 10 Jul 2026 08:27:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1693F0AA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:27:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672078; cv=none; b=nw/PFL5m/Wgz8JQij4+Rt0nlonkJ6BEjPNPdMINmy1SxndkNsvIEwA29gyRr9YwL75CfY5k5NqWxvr0s4xhpkHDalhznEcyuJCyx8BMiPt7pfTLT2q3qBKnXD7LuHbgmS4LzRyacDo558MI16XOW6C5enrEeoB2o3fOslr6ppJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672078; c=relaxed/simple;
	bh=w0XukhUGcMXl1pfRJDXW4iErHU1Kq89lOp4vXId0pfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gn/UU/p7SjZ/SGNDLXFRP9uzn7YuoX7dpUjd3Z2iaKB0+p3bD0dswvdHcptjoNZVV5CKldoP6wTmJfo1kqdWdo4R/kuaG9TH5k/x+7GixjpoFbnRqSroxKr3J6q7F4/MtvmBin5hbeD/STPgvlY/0plUUAMpI/6VGEtTjCvZGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTK3w/pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtFReaBW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dW0I235369
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwL26Vdu8eHV+0HZPUj6SDG3AZi2maZop/sTus1frl4=; b=LTK3w/pf3y2Iwjay
	ScD6QLWv15XwLvfa+FLdeLfN4OlKhxIRNGhpmo1qec5K4gDHlsNxK9tmeazt5uED
	JiQJGEG8ZD0SnkJ91uuLUs1m+dWSKRV/KgnrEHpmC8hlhxa6I3VvaCVhzqy5tgS8
	TTu+cTF8uJlQgkZsoZfRZeSRHromjAdPhGS7vrr0/Oe6g0fkTAF3dlrwQYbnCVFY
	k9IY1n9ADtRlUYK+sAw6WZG5LIOcWKyUbjbSLGEJ19Dyt1cYhJgDAwpRBR0HOq32
	Cl/P/LkEtnZ+0ihDpFs71ZmTR4tnqCgVLsWo+eggL86azB2OKYcynoOQ4IT+X4tP
	NwgJDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3kjhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:27:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8c689b5fso7016751cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783672076; x=1784276876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwL26Vdu8eHV+0HZPUj6SDG3AZi2maZop/sTus1frl4=;
        b=GtFReaBWjS1RpAs+mubYSuPaEbTzuDSLEZvo6Ty9kZB64UI17vLvUVlZZLP4KVTMli
         rKeO0HajI/jbqZvPnXUdqAS8frtfQbRMATHcPQcxKcUKrPfnS9IO4cx3JR6JTAXZurwG
         uX+sagAzQdqPItQuZzuMU3bE2u2UY0a3BpvJ4i0AyiTcba9fB5vHbi8FTj6/QHuJBYRx
         +/b1sPd/icLcoU7Vlhw2x3X/weg/fppGW9FxZZvkCoOGPvYRQIi/ON/yboQAU2zuTAHZ
         qeni6eDHXkY20cnFGFf0cGH6/a0YHRQxgoL80Su0flM/8iHKCXDZPJovrUFxgMv4iDjx
         SpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672076; x=1784276876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwL26Vdu8eHV+0HZPUj6SDG3AZi2maZop/sTus1frl4=;
        b=XIicSQuCt3P+gQZCA7VIXEDsUYPXWcLCEuQRZpqkFaenu1Yh4t2eGAcgH1Rwf0vtGp
         kQ6CKRwa3kD5Z6Hk6t6O+RDw67jsG4sa5vfojRhMHjs8ToG2Ad4ibcSxOPpUIUHD1AKm
         9QzuH+CgnUIjJrvJPAkD/sgRLajZsH6if8g+gVwQwOkpUfqgHKe6Ixe5TQmD/tmg85/P
         VhYVFwz5FU/r6SfpOF5NxYWCjc7Jofds7y74qWLFFrJsE166tW9iqxNPSRH1ZuueFhzB
         Z0Ys7tYwDYFuK/9iGi0tRvjY7ofKeIlnVJRSwkVEIvnhXpuEX8mv0WYEs6kuCL25jXWT
         Lnog==
X-Forwarded-Encrypted: i=1; AHgh+Roxre0pBDbUcwUUhBgPUskFnM7Iw03aT/M/ZaT5bFHIs/uYg1KY4+mEXAKehXM+8S6X8l3Tdvg3t+Gys0hM@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEC2Wh1TpJ/mtsoliG36zcAkWijz5lS2jrcCm9u8B6381k+Yo
	6csW0tcVQo2gBAkC3PsNHfbewI0nWcCR8EnD7xmlCfMyXBN4YmO+GBcfrMwwREIHFmzu33481Tz
	Ay4UvN30CqbXbMN3DwIYy12sYreUG/SLXyLUreyWHLt8dk+DNWQ+w1b91pVwJEtOFJT0h
X-Gm-Gg: AfdE7cnzsRJtZ657e/Rs/VMF5bUv2F70ovCicgky9IL7GZmaWUZTLyhIj3slCCXkkbb
	AGR6HTrRYp3rN4cK+R7SKR83zbU7e7QP1bpgIR9qxWoRGQ7r44amApVIcd5AbgOi76y+n1Qx5rc
	itO5v13KQat3VRtMLfmANCu7uUsMkRgZAffrqEIasEDPMCPNaBfevdlql9mrOTku3ZqFL20Y1sL
	7ryMwNM+SlfYySkU6hWgV5Ais4svoeScnf5LSgPI24I9KbbMH1OKxPXcO5NvyY6mB8C+d11fAZR
	KLtQDXCwu2Iz4WxM31EgK2vs9Sh2gfguXaqW40nZaMI2e6UNiRpXZGT/dAWLprxQjfWL/xrMHC3
	IU/ULPPwr8cp+U4x6ptOMNdteoI4AoTNLvsTsjUxNvTX3ZA==
X-Received: by 2002:ac8:590d:0:b0:51c:2190:3b56 with SMTP id d75a77b69052e-51c8b433337mr114544581cf.21.1783672075649;
        Fri, 10 Jul 2026 01:27:55 -0700 (PDT)
X-Received: by 2002:ac8:590d:0:b0:51c:2190:3b56 with SMTP id d75a77b69052e-51c8b433337mr114544311cf.21.1783672075114;
        Fri, 10 Jul 2026 01:27:55 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c38c164asm429906566b.3.2026.07.10.01.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:27:53 -0700 (PDT)
Message-ID: <ea0b16a3-0c44-433f-9404-747feff3b19c@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:57:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: iris: avoid bit depth validation for
 capture formats
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-0-701d6dfd1ac1@oss.qualcomm.com>
 <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-1-701d6dfd1ac1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-1-701d6dfd1ac1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfX9vpnXuNA3OSZ
 qQF4lybwMAFx+67emJ+GmM5PYpc8gPS4ArtMu0Tjr9xoQ1Z+F8hdNf6nZfs8gj/nikVvI4Fhhd9
 jKzeRwAmfjKxhufKOMxjtwbSlHYLUts6YCXt8H5vLr2f+vV/txi0eYmHol0kySMp2+OIl8HFiyU
 Yzm/nJiFk8/bDcAH85UHTEfd2y7jexyD7T1V2gkC67Ug90xxKiZU2XKzWvnhP1JaRgrRo7v3clW
 vZFy+F+tDxEUXLef522zAIZ7fhEvrGGJCdCu2pxdrjWoj4PF1TiEZ5rVI9FYo2U9MSfAlnLlUBF
 ooWMkf5SB8tsW5ZpHol1SSo26R4Z9lEKSJcCH+GhqC/JeAj+uORJIigPZp9LlBQCpoVx0c+ISIF
 Xtvs7Aq5u99Rgy/7MLdLFDTr5hPkfbsqdCevuloR9+MzgnwFHq0B48buXVfQdT4D0Y8/2mAEOST
 hpUjMl2K/Vunr/mMUiw==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50ad0c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ukklFZUiyCJfO1Kbj-UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfXz/JCM+Wtznp4
 eM5gdrgmPuiP70XJPIOVh2IEgxFCTimfnxQq4FfttU0RHGkrokTUNSV2697imKzzlVJnpMU7vfW
 W8VRcMlPpbqP4qBhvQaNd9apdHqyrOs=
X-Proofpoint-GUID: vP230pcUmIo65jv-TpRXjzpZnQJxTdXz
X-Proofpoint-ORIG-GUID: vP230pcUmIo65jv-TpRXjzpZnQJxTdXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118187-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7DCE738857


On 7/10/2026 8:24 AM, Vishnu Reddy wrote:
> When validating a capture format, check_format() compares the requested
> pixel format against inst->fw_caps[BIT_DEPTH]. However, the bit depth
> capability is not available at this stage and it contains the default
> value of BIT_DEPTH_8. The actual bit depth is updated later after the
> firmware reports stream capabilities through read_input_subcr_params().
> Because of this, a valid client request of QC10C format request is
> rejected during the initial format negotiation. The driver then falls
> back to the default capture format (NV12) and stores it as capture format.
> Later, when the firmware reports that the stream is 10-bit, the driver
> sees NV12 as the selected capture format and switches to the default
> 10-bit format (P010). As a result, the original QC10C format requested
> by userspace is lost and QC10C decoding cannot work correctly.
> The bit depth information is not reliable during the initial format
> setup, so it should not be used to validate capture formats. Remove
> the bit-depth checks from check_format() and only verify that the
> requested pixel format is supported. This allows the format requested
> by userspace is handled correctly.
> 
> Fixes: 20c3ef4c7cae ("media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

