Return-Path: <linux-arm-msm+bounces-97844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIGoBF6jt2lTTwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:29:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 990BE295215
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBD1E3006B55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0095534B43F;
	Mon, 16 Mar 2026 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgDcf5yC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6MR+kna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDEE34B1A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642587; cv=none; b=aZ8+dQoOmFhPmsAiguvzYXKfDqrrMiOisfslG+SiWNktr90dNwoCxTm4jDH+ibE0MIOA5NOZu2ku0lteavQ8Eb0hL+1AcI6OOJqlMDYten3BeCaEeWbqgGFL4aETVOPoADH2QejxeWpJ43wESEwdO7PllVuqu2JKU+fVvvcSntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642587; c=relaxed/simple;
	bh=dU/7a9q3IELhjl16MljRMzver/TTsjUnL3xjdB28Z+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/YiSjBPvfpxUi3ezg6FzeH8XpwEfPphi4wydGpHuAYBpJfLq8G1s5CDbt6JBQ8BlA/3AjFNTBUXNRrvCDEj2cxP27cpKd6a9TEXdvXXrAM8Hy0lPRKsJ5xf2YQzyg71crbu5MxZ1DHqlK/dKrevudYvzNRkYyl555460lfC6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgDcf5yC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6MR+kna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64cEu323556
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YgDaK37eqwKWHKuj5DGDcHxKe4Lvba6UQy/0iYreR80=; b=ZgDcf5yCthowFaYW
	EuonTG5PftpANCK1KdxFVxRSWR6nakMOT25uowQAGabUBY8bx+ko4QWZDUCLDYua
	gj+6TuMQmk3G0wmMIkBkuk7FXLnycEkaGeRfIeFS8LpNBbXYvjdETPKuVBCN1l5B
	mFTMZAiANhWrrD+OHuNKkleCrHMzvSbq4ARd+szbUkfsLiPj+pSnMhTFImrZfyq0
	jIAmIMywIQ0H41xDIxnL25fU18iyCFmffdB9joA5I2Y2trETfV2X7iykI01VJRC/
	gABAdJ+B/81ptzTq6O+kzoeY0hPWKhnjzSEK3DC8e13M09RNd2reSqZ3uZhL16HU
	SqOBfA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qmgcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:29:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b7ed8964so4221886b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 23:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773642584; x=1774247384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgDaK37eqwKWHKuj5DGDcHxKe4Lvba6UQy/0iYreR80=;
        b=J6MR+kna5uBvmv+ErpltjFLnB/ZQPdO7hWTXTda/vYcenn/t10q8Imc0CYJEtvd0F5
         GRmMibhSa4b2pzDfTSbXoYH7lHdtFd5E7NMyJOlx4rxlrV9/BIf5SBWAn24HX/cHaPXU
         k7QZgfd250IkbHXrA0ivSAbKJdLFXJ8MhFpKljwRcqq8pip9any5UN+PEul1qXi0pZdE
         SVmTrtuApHicegsVjMVIC7ufyYXl20KzCujHaU1LcESa/0m/vwX+0dENrXI6H9LYD1mt
         Y51T9T+rJnXFf5mkneL3zTI1J3PsLxZY9jY7kUYI7pEQUilhzKWGV2Q2cBDRxy7oYxla
         MV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773642584; x=1774247384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgDaK37eqwKWHKuj5DGDcHxKe4Lvba6UQy/0iYreR80=;
        b=DAZHdn7tBuaY5TfbwAWNAqrtsgMenWm3Z/exmnJL5sPTxdc+vd4rqPD26J4OiaAeOm
         /YAo44rIyksqJ4A90MDSi8yxdCfYw335hfJrL8bF07rbw2/MkZBKKw11BLY+kEG0QP2q
         zgt+9yZUpiFG54lFoOFhCso8mChYEDRW+9Mm3AbPtj+Y6n7z5AIEOhdy55lSoLE3wyvQ
         LBNQbo5be4PW+B/wnWvqPMclSqWjiG5wZD3xh6+ltIpnCXggl5/z8sEPPXHD1YLvLaQn
         WeUAta0A89tb9j0cVyTpUoPAbfDVlASUhQp1qYZtC16BAWlofOrLTtIsqs1Pjv/8epm+
         nbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe59Lw2cdUZXylbRmffQGea1UCi1BrGEB6YBvEn7ECCV7UG4dY4uQSxZMjBh3uxFHqj530cA5pHugHedq0@vger.kernel.org
X-Gm-Message-State: AOJu0YwOURgxLj1wLjWyLPAKX67gxYHVZqsMK7EE8EF9+/P4gA/UIe2U
	gN9wqtesZ8HGFKetLmTR0dHn+/suCF3Wqg6WSeiK1lnplVqNfAsOKOsf15o7sG8jaK9tBC3ui9t
	eE3snk3xWWQ5K9KZkD+dxw7ubifIyGXQMDi4yFd2IWQZmuupQbd6caJSC3npNKOikBvkkPBry10
	kb
X-Gm-Gg: ATEYQzwgDmSE6GxtsHbfxS6zzpUofFOcbJm3tr6SkqFNtuSZeh9rRV/kb6Z4aVK2HTz
	XR8gbrjhuhWh1+aeFmuPuzRFhjedUh/H+f9TVbzwFO2jwSgiOpUtYoNKSp6WwbWfL39tfIOY/Q2
	FS2rIUOgfkZbh/u8+5qcxOorof63Ld/nstRfgyTvOuPSJjL2EXrO5TO0PDRyDOGYRDgUb8YD7tg
	oHZjkz/RLRoFnddVfqBQLAtesmOOvwVwE7YGUyqBeNNt+YXUIwLKDseYLA9XZbuH4g+AJIA0+h4
	2Qy0SEoqTceYqWhubINsFDP7LvJQVVf1io3PdEn4RotcKdSf/0ULfeEhzFkFNW1g5DHyhGcpIOL
	dIQUMqSY/QZDWXy1wQAKlYK1Vxojt1SzUvgRXfr4BkdclwzA/Yc/Hlw==
X-Received: by 2002:a05:6a00:2d90:b0:82a:1337:493c with SMTP id d2e1a72fcca58-82a196f63a2mr9956222b3a.14.1773642584055;
        Sun, 15 Mar 2026 23:29:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d90:b0:82a:1337:493c with SMTP id d2e1a72fcca58-82a196f63a2mr9956213b3a.14.1773642583548;
        Sun, 15 Mar 2026 23:29:43 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0727e581sm11726466b3a.27.2026.03.15.23.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 23:29:43 -0700 (PDT)
Message-ID: <faba5174-2b3f-366d-f028-8c12eddfc0e5@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:59:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 8/8] media: qcom: iris: split platform data from
 firmware data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-8-14927df4906d@oss.qualcomm.com>
 <2f233008-cdf6-5999-d703-73f58cc0f5ed@oss.qualcomm.com>
 <3vquo7j5perqak3lqpe6p3hutsyidw76d7qwbj2lj3nhgjtelq@xqbdaycdzhzu>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <3vquo7j5perqak3lqpe6p3hutsyidw76d7qwbj2lj3nhgjtelq@xqbdaycdzhzu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ztXLiuUoCCBdxTIJIPABZZ-p0_vJkLEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0NyBTYWx0ZWRfX81cV0RtQ92M4
 4esEsozmxjndjmIAEjrv43d2l0oueOqGSqH+M7la+9TUxhTfaUQSjTzAoS00C0ndXpOkzRpa9XM
 cL9LkcrC2OY9dW3TEnVzrCm7v/BiCwMAeFW8GoqXgfZYamlZ5mT1eWqzCFiM1yKencqcmwrxDM5
 VS3qb6o4n2fRa7eW/RFKGOirSE/l/bBDZRgH/YMHdxOd8TItESJrT/c46qDnKZ/f2XXUZltkCsU
 CmyXSmhUtzGh1Ls7FjpOejjOhhjkVvSYqxcZtxQfwtzEX1yMA66DP+GC59enZ0yJDSv2LrSn69j
 Gpl7jGFHHRF6ImxVHZk/vtgDr6qQ31BXW2POwFDmJRJNW10czB7ZnOPp5yuUXF276Vf8JpOmOLC
 Vg34wPimSoXsGEPK9189IUQweQ1GXMo8yadff9ibqi/4wEo/HTyEoZDh0+iQbZqvY4liFkU0gc8
 PdVUkf4/gfJxI6zIp+Q==
X-Proofpoint-ORIG-GUID: ztXLiuUoCCBdxTIJIPABZZ-p0_vJkLEQ
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7a359 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J9tD69HXbuXSNBrRnZ8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160047
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97844-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 990BE295215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/14/2026 12:53 AM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 01:37:42PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
>>> Finalize the logical separation of the software and hardware interface
>>> descriptions by moving hardware properties to the files specific to the
>>> particular VPU version.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/Makefile          |   6 +-
>>>  .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 133 -------------
>>>  .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 218 ---------------------
>>>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>>>  .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
>>>  .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
>>>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 124 ++++++++++++
>>>  .../media/platform/qcom/iris/iris_platform_vpu3.c  | 210 ++++++++++++++++++++
>>>  8 files changed, 402 insertions(+), 353 deletions(-)
>>>
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
>>> new file mode 100644
>>> index 000000000000..74c8f38e849b
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
>>> @@ -0,0 +1,124 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#include "iris_core.h"
>>> +#include "iris_ctrls.h"
>>> +#include "iris_platform_common.h"
>>> +#include "iris_resources.h"
>>> +#include "iris_hfi_gen1.h"
>>> +#include "iris_hfi_gen1_defines.h"
>>> +#include "iris_vpu_buffer.h"
>>> +#include "iris_vpu_common.h"
>>> +#include "iris_instance.h"
>>> +
>>> +#include "iris_platform_sc7280.h"
>>> +#include "iris_platform_sm8250.h"
>>> +
>>> +static struct iris_fmt platform_fmts_sm8250_dec[] = {
>>
>> How about naming this as platform_fmts_vpu2_dec ?
> 
> Ack
> 
>>
>>> +	[IRIS_FMT_H264] = {
>>> +		.pixfmt = V4L2_PIX_FMT_H264,
>>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +	},
>>> +	[IRIS_FMT_HEVC] = {
>>> +		.pixfmt = V4L2_PIX_FMT_HEVC,
>>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +	},
>>> +	[IRIS_FMT_VP9] = {
>>> +		.pixfmt = V4L2_PIX_FMT_VP9,
>>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +	},
>>> +};
>>> +
>>> +static struct platform_inst_caps platform_inst_cap_sm8250 = {
>>
>> platform_inst_cap_vpu2 ?
> 
> I thought that these params might change from platform to platform.
> IIRC, SM8350 supported smaller frames in some cases.

That's right, and in that case the structure can be defined in the SOC
header file.

Thanks,
Dikshita
> 
>>
>>> +	.min_frame_width = 128,
>>> +	.max_frame_width = 8192,
>>> +	.min_frame_height = 128,
>>> +	.max_frame_height = 8192,
>>> +	.max_mbpf = 138240,
>>> +	.mb_cycles_vsp = 25,
>>> +	.mb_cycles_vpp = 200,
>>> +	.max_frame_rate = MAXIMUM_FPS,
>>> +	.max_operating_rate = MAXIMUM_FPS,
>>> +};
>>> +
>>> +static const struct icc_info sm8250_icc_table[] = {
>>
>> icc_table_vpu2 ?
> 
> Aren't the limits generally platform-dependent?
> 
>>
>>> +	{ "cpu-cfg",    1000, 1000     },
>>> +	{ "video-mem",  1000, 15000000 },
>>> +};
>>> +
>>> +static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
>>
>> clk_reset_table_vpu2 ? and so on.
> 
> Ack.
> 
>>
>>> +
>>> +static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>> +
>>> +static const struct tz_cp_config tz_cp_config_sm8250[] = {
>>> +	{
>>> +		.cp_start = 0,
>>> +		.cp_size = 0x25800000,
>>> +		.cp_nonpixel_start = 0x01000000,
>>> +		.cp_nonpixel_size = 0x24800000,
>>> +	},
>>> +};
>>> +
>>> +const struct iris_platform_data sc7280_data = {
>>> +	.firmware_data = &iris_hfi_gen1_data,
>>> +	.vpu_ops = &iris_vpu2_ops,
>>> +	.icc_tbl = sm8250_icc_table,
>>> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>> +	.bw_tbl_dec = sc7280_bw_table_dec,
>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
>>> +	.pmdomain_tbl = sm8250_pmdomain_table,
>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>>> +	.opp_pd_tbl = sc7280_opp_pd_table,
>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
>>> +	.clk_tbl = sc7280_clk_table,
>>> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
>>> +	.opp_clk_tbl = sc7280_opp_clk_table,
>>> +	/* Upper bound of DMA address range */
>>> +	.dma_mask = 0xe0000000 - 1,
>>> +	.fwname = "qcom/vpu/vpu20_p1.mbn",
>>> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
>>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>>> +	.inst_caps = &platform_inst_cap_sm8250,
>>> +	.tz_cp_config_data = tz_cp_config_sm8250,
>>> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>> +	.num_vpp_pipe = 1,
>>> +	.no_aon = true,
>>> +	.max_session_count = 16,
>>> +	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
>>> +	/* max spec for SC7280 is 4096x2176@60fps */
>>> +	.max_core_mbps = 4096 * 2176 / 256 * 60,
>>> +};
>>> +
>>> +const struct iris_platform_data sm8250_data = {
>>> +	.firmware_data = &iris_hfi_gen1_data,
>>> +	.vpu_ops = &iris_vpu2_ops,
>>> +	.icc_tbl = sm8250_icc_table,
>>> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>> +	.clk_rst_tbl = sm8250_clk_reset_table,
>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
>>> +	.bw_tbl_dec = sm8250_bw_table_dec,
>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
>>> +	.pmdomain_tbl = sm8250_pmdomain_table,
>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>>> +	.opp_pd_tbl = sm8250_opp_pd_table,
>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>>> +	.clk_tbl = sm8250_clk_table,
>>> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
>>> +	.opp_clk_tbl = sm8250_opp_clk_table,
>>> +	/* Upper bound of DMA address range */
>>> +	.dma_mask = 0xe0000000 - 1,
>>> +	.fwname = "qcom/vpu-1.0/venus.mbn",
>>> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
>>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>>> +	.inst_caps = &platform_inst_cap_sm8250,
>>> +	.tz_cp_config_data = tz_cp_config_sm8250,
>>> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>> +	.num_vpp_pipe = 4,
>>> +	.max_session_count = 16,
>>> +	.max_core_mbpf = NUM_MBS_8K,
>>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>>> +};
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c
>>> new file mode 100644
>>> index 000000000000..2c0e5be72920
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c
>>
>> iris_platform_vpu3x.c ?
>>
>>> @@ -0,0 +1,210 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>> + * Copyright (c) 2025 Linaro Ltd
>>> + */
>>> +
>>> +#include "iris_core.h"
>>> +#include "iris_ctrls.h"
>>> +#include "iris_hfi_gen2.h"
>>> +#include "iris_hfi_gen2_defines.h"
>>> +#include "iris_platform_common.h"
>>> +#include "iris_vpu_buffer.h"
>>> +#include "iris_vpu_common.h"
>>> +
>>> +#include "iris_platform_qcs8300.h"
>>> +#include "iris_platform_sm8550.h"
>>> +#include "iris_platform_sm8650.h"
>>> +#include "iris_platform_sm8750.h"
>>> +
>>> +#define VIDEO_ARCH_LX 1
>>> +
>>> +static struct iris_fmt platform_fmts_sm8550_dec[] = {
>>
>> platform_fmts_vpu3x_dec ?
> 
> Ack
> 
>>
>>> +	[IRIS_FMT_H264] = {
>>> +		.pixfmt = V4L2_PIX_FMT_H264,
>>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +	},
>>> +	[IRIS_FMT_HEVC] = {
>>> +		.pixfmt = V4L2_PIX_FMT_HEVC,
>>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +	},
>>> +	[IRIS_FMT_VP9] = {
>>> +		.pixfmt = V4L2_PIX_FMT_VP9,
>>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +	},
>>> +	[IRIS_FMT_AV1] = {
>>> +		.pixfmt = V4L2_PIX_FMT_AV1,
>>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +	},
>>> +};
>>> +
>>> +static const struct icc_info sm8550_icc_table[] = {
>>
>> icc_table_vpu3x ? and so on.
>>
>> Thanks,
>> Dikshita
>>
>>> +	{ "cpu-cfg",    1000, 1000     },
>>> +	{ "video-mem",  1000, 15000000 },
>>> +};
>>> +
>>> +static const struct bw_info sm8550_bw_table_dec[] = {
>>> +	{ ((4096 * 2160) / 256) * 60, 1608000 },
>>> +	{ ((4096 * 2160) / 256) * 30,  826000 },
>>> +	{ ((1920 * 1080) / 256) * 60,  567000 },
>>> +	{ ((1920 * 1080) / 256) * 30,  294000 },
>>> +};
>>> +
>>> +static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
>>> +
>>> +static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
>>> +
>>> +static const char * const sm8550_opp_clk_table[] = {
>>> +	"vcodec0_core",
>>> +	NULL,
>>> +};
>>> +
>>> +static const struct tz_cp_config tz_cp_config_sm8550[] = {
>>> +	{
>>> +		.cp_start = 0,
>>> +		.cp_size = 0x25800000,
>>> +		.cp_nonpixel_start = 0x01000000,
>>> +		.cp_nonpixel_size = 0x24800000,
>>> +	},
>>> +};
>>
> 

