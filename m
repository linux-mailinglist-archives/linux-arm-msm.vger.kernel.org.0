Return-Path: <linux-arm-msm+bounces-65455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A820B08CF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9567F1C25B1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7A22C159C;
	Thu, 17 Jul 2025 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XuuTTMCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FCE29B239
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755591; cv=none; b=LL1WCoM8YHBqbMiaP8PY3xUMN+4wSzrXivjDtOGXY8IO5Ek/8cE1i42Y3ljL9UZke2tE7otqui+E0wOQH0HGkJxa05LalqMRmlA3qptrcnCV5vQBJr68dSfpJjFJhuZK7D+0YJ91u6oS9j/HwkP4PN5gg2DjwlSzkNlqwc7sSns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755591; c=relaxed/simple;
	bh=9aNoDhtWXXT/OFJv10vt3bZs0Gso06rmEsgWtftDDYY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9lSpaPL/Jx6y3SrneNZKq380UHGx9JfAA0/5uweh+QGkHr/S0bvtNi9KDkC2Do00HTlbsLwo2s9SSAY5GLOwaL9Z6inOHCagvDWnExrgCIZSIdHCiW1mpO9qZVTycagNefNsqpgZzf6HEJECduNttLQryLmQ021WyvNjdcAWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XuuTTMCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBuXBi003003
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GIVsyeStEGhaDBPkM6OOtZkb
	Tex+ECjJnep7/hnb8qs=; b=XuuTTMCssnwfC8qfjdUclhu4y3iIJdbxsjMLqotu
	BDCVWvny9tIDIjNuCf4auesoOnWMxqRwP5hXkDjBowWgBt15KmTu4CWVdubkPGk/
	F7nCv6KaoQ81DUSSv5la3A3kmFkp48ao9ZpC9u5WlrHkXR33aUy+xHRQooneAERc
	I2lZg/r8mdI+35pae9qa1AF4/bbf2oBcu8kJhYKMxJ6heOYfyoCRmy4nB2yV9njI
	8SRsw4JzFqip42INVgfW9BA8VLtErIIiDK3op9fz1A8jTeUEKJq664H6mm23sw0c
	W04NnnfMlqRhfll/+0YOW6bx7JkPoi9Izv+xBeMmWgOYnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xsukse5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:33:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab76d734acso32441571cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752755587; x=1753360387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIVsyeStEGhaDBPkM6OOtZkbTex+ECjJnep7/hnb8qs=;
        b=upgcFDsU4oWNAauhGu8kyPsuMNaYwjlUdTXnABWZbXx0yLvsVYH/Px4BB2C1i90Xk0
         JvSeOeQQ/5M1feBORzASAFgn+bo4Pk+cXSLP1uY7YsRP5uLrxt2Nna1N6i5rucfsxj+g
         BDkyyT9Km19UOXMqSyN1MdCK38d4Mh75C52eNkt3fgyQYwhJGKPh2+E2mE9nRq/Pk1Yd
         BUc5VcU/rkem4D2k3R16qYkCTBAowP33b8J7eMTxdQ4lhHiKItZpwEn9dpAm7hlW6TNN
         w1si1+SLOByMXR0qbdD2prFgvQPeerN8PBKkVwYk76WNVR/mmMnsb6bRbsnjifg/vsP8
         ryDA==
X-Forwarded-Encrypted: i=1; AJvYcCXQAjLQs4Vf6bYIN5Xbm8gyNtjvnPx7sx6BQpifQmZ98UYQqRTDZkDB5cwQSOdH9Np4ZoHL9KTKn+kERXon@vger.kernel.org
X-Gm-Message-State: AOJu0YxoNdJNitmdazGB9A+ozUcwMRwReNOL0BUxtEbHHrwbqI9XOzRi
	0WrPZXQMDqnVo/zy9SJVLmxMrBf/fiFujW4g+esFkVjh7TTIHgo6koXGiwGUp0irsu2vON2KB2N
	MJnRFDMs7JlGgkpIN3wlY7rsJ+rur1O4t74qGZNwo9JbyVI2gCNhlzZbqgn/Cjb/tABxR
X-Gm-Gg: ASbGncsZoeF2JB5C88KjuFwd6yiPaxS2uEPpmb/jRkD/NfPekmkozfNwaaS/eA1it4C
	6aZa1gKeNG9YFu/4SKgHJHyTLVQtvqwI2856MYnbVtjrhgPjHaCtDrVfbvAdTV9JOcqn+PP1Wo0
	oDJpwuzhJVMqWFZrcWbnj0nuzfnAVsLLpBh9NrTOQx4NC7VenVDZco3FlKTmrXu+CSNbhjwLcGE
	Yzdw4DEGdyuo8k2zMWBIdH3sV4Ey7hojwMu56Y2cTp9jLrUXzXYVy3J467klSkYG2Sy4coYEHgd
	EMkpuIUIeLohFSpvpc1gua5NJ3mW82N8c847bWnhj9T/haqE2BRFkd93WDzaBAwlbh9nLVP7jgw
	=
X-Received: by 2002:a05:622a:5a14:b0:4ab:7a27:ec59 with SMTP id d75a77b69052e-4aba21cbddcmr52769791cf.19.1752755587187;
        Thu, 17 Jul 2025 05:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH13R+H0nJcCxdj6hXz6KQmbV5pAVw+a+dWl5Nx+JoOZKLJKJi6Tv2w/rMQVHUiySpA5Ct0BQ==
X-Received: by 2002:a05:622a:5a14:b0:4ab:7a27:ec59 with SMTP id d75a77b69052e-4aba21cbddcmr52769151cf.19.1752755586619;
        Thu, 17 Jul 2025 05:33:06 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f4289sm50118185e9.7.2025.07.17.05.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:33:06 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 14:33:04 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/7] media: venus: Add support for AR50_LITE video core
Message-ID: <aHjtgHT2Nxmm5nEf@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
 <4734edd5-8224-4caa-8844-c38dabc6b6c0@linaro.org>
 <aHij+NHG5xbM1paO@trex>
 <8ac6f365-205a-4140-98b1-847f54ce08af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac6f365-205a-4140-98b1-847f54ce08af@linaro.org>
X-Proofpoint-ORIG-GUID: 2F3ZENBf_LbPiOt00rZ6HTpzMDBjIA63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMCBTYWx0ZWRfX4/Q1GG10S7ct
 pZKJeThv4UQAEMQq69SmN3FviiE8W1f/isNLebLZnzD8tgXeX27W7VI6ci/GXcvGny/RtAulyyC
 NV3soaw6WfFvSzW9owj3Nu+mFOIycEALCTaGchGihQnUQyjqXLAZ66AXUNr0bhzLOR0muieCGD5
 0txgSuxQvue+RPvR+hZVwQnQB4bwdgOlIUcOCNud4Ra/H03JI9J83PQKZ0xct8UqU9CyOWNGKGI
 v/pQK/Fn6vs09dmVIx7Z1m2LmBGuniP0nyGDvvl2JR3nQWQT3O0FeCdZJxHFtsK/A21JtCkKgXV
 tRL4kd9YmRPsgjAL3K26Quy+En9wfkyxmWEyezObTtktS4EaKBxcwbcCZJ7NezbT6ZEgS1oylUx
 vOpoDD6iCPTr6/ircqB/XKXJX/t664F9ErPPdlTkqHcm/j+Cli9MAzV/P9e+/e4BEwhnXZF8
X-Proofpoint-GUID: 2F3ZENBf_LbPiOt00rZ6HTpzMDBjIA63
X-Authority-Analysis: v=2.4 cv=JJk7s9Kb c=1 sm=1 tr=0 ts=6878ed84 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=YkcGIdIuY8UmMje9j0IA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170110

On 17/07/25 10:29:44, Bryan O'Donoghue wrote:
> On 17/07/2025 08:19, Jorge Ramirez wrote:
> > > > --- a/drivers/media/platform/qcom/venus/helpers.c
> > > > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > > > @@ -230,6 +230,24 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
> > > >    }
> > > >    EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
> > > > +void venus_helper_prepare_eos_data(struct venus_inst *inst,
> > > > +				   struct hfi_frame_data *data)
> > > > +{
> > > > +	struct venus_core *core = inst->core;
> > > > +
> > > > +	data->buffer_type = HFI_BUFFER_INPUT;
> > > > +	data->flags = HFI_BUFFERFLAG_EOS;
> > > > +
> > > > +	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
> > > > +		return;
> > > > +
> > > > +	if (IS_V4(core) && is_lite(core) && is_fw_rev_or_older(core, 6, 0, 53))
> > > > +		data->alloc_len = 1;
> > > > +
> > > > +	data->device_addr = 0xdeadb000;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);
> > > This function doesn't appear to have alot to do with AR50_LITE as it
> > > pertains to IS_V6() and IS_V4().
> > > 
> > > This I think should be a separate patch with its own commit log to describe
> > > the quite complex logic of version numbers going on here.
> > Let me give it some background:
> > 
> > According to the HFI specification, EOS (End-of-Stream) buffers must
> > have 'valid' addresses. While the firmware currently appears to make no
> > use of the EOS buffer contents, allocating and mapping them would have
> > been a better driver choice IMO. Hoever this one has better performance
> > which is probably the reason why it has stayed.
> > 
> > The firmware then does perform operations involving the buffer's size
> > and length fields, and enforces boundary checks accordingly. On the
> > AR50_LITE platform, an earlier firmware version lacked a check on
> > alloc_len, leading to a division-by-zero scenario.
> > 
> > This has been addressed, and we plan to release firmware version 6.0.54,
> > which includes the necessary boundary check for alloc_len.
> > 
> > I should probaly replace IS_V4(core) && is_lite(core) with
> > IS_AR50_LITE() instead of trying to give it the appearence of a design
> > feature.
> > 
> > seems the sensible thing to do, right?
> 
> I'll stipulate to all of that.
> 
> I know I'm being pedantic but, the title and subject of this patch is
> "AR50_LITE" does stuff.
> 
> As traveler from a mirror-universe - I would read the commit log here, look
> at this function and be none the wiser what was going on.

right this is because I think you saw through my inconsistency.

The truth is I should have written the function as below; and I think
now there is a case for it being in this patch since it is addressing a
firmware issue on the firmware release supporting this core which the
patch is adding the functionality for.

void venus_helper_prepare_eos_data(struct venus_inst *inst,
				   struct hfi_frame_data *data)
{
	struct venus_core *core = inst->core;

	data->buffer_type = HFI_BUFFER_INPUT;
	data->flags = HFI_BUFFERFLAG_EOS;

	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
		return;

	if (IS_AR50_LITE(core) && is_fw_rev_or_older(core, 6, 0, 53))
		data->alloc_len = 1;

	data->device_addr = 0xdeadb000;
}
EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);

what do you think? this is really just adding a the AR50_LITE line to
the existing implementation.

> 
> The EOS check is a fundamental HFI capability which is why I again reiterate
> it deserves its own commit log with the above explanation - word-for-word
> would be fine from my POV, to explain what is going on.
>

umm not sure yet but if the above does not make you change your mind
I'll do it.

> Long live the Empire!

:)

> 
> ---
> bod

