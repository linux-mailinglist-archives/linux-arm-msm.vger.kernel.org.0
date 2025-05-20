Return-Path: <linux-arm-msm+bounces-58807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B4ABE60F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 992354C6131
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB7225E46E;
	Tue, 20 May 2025 21:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHCzveXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80902251791
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776606; cv=none; b=rtb6ul4o7G9cwmPiy9wWu67HhnnhZrd0w4VqxguRWZ4bNK+WUZa26/r8QmYVLlYX3gaXQggdNksz3UGB8u3ghfT/3/KTLbGQIOk8B89xjs/79HNF1GyhtdBqY3rwtjP7N1GyXYnfQu7Q6ri+cC9DHD+BXUhWeY9i51VvZnfWBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776606; c=relaxed/simple;
	bh=08+L51Dn57LL2+LU7AopFK66UrS0HEzgbWTWcFVWtps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PODHaG/MkJjKEGQI9A/xQRvS1ikTLNr4zq7F3/P4JYlYuxR+oNLRLMjryWnS9el0zUg5L9ErqhM1C66gL13S5jZIRAok4Cij1/IcSDfwmvVpFDqH1Zt3Lq8LnYgrCQVQLnR3z3tkMeStkSwI2v8/S5DJyt3LEG5/GuEYQcw19Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHCzveXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe6Dw032102
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yp6gS6fiXRKVst4i/0JwkECc
	tK+Yj9KUJFbKtK5dEDM=; b=iHCzveXQmDV0zvg6HWoiNu4PI3BCnn+CyijSFMCQ
	yNR/imF0BhjPSk0zRXtsfmizj7CEQAQbGFlmN2GjfZkultGsPHkOIVLRq5sKRENK
	Z033bEmvEd0HyU9MPwBQoZfbQkzovi/Q8buD+TODgWteQszKgIbepDHDZgvn37Zi
	uL0ay/XuT5Q6CTah/7Hvx5FmI/rjIczKWlb0OWLbrnAqJOYliMUaAjSliv8d/hLy
	dL9Bbmj0XG5rtD8ZKz7YXcKgBP3VhR3w1EG4Jn4pI1QXDWvVu5p/dYvHCEeqURR+
	0AP5POt/Z36iTLDI0Y4u1w0o2zE/7xgJJmyCDo04g/xO8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6rp13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:30:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8dd95985dso52797556d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776602; x=1748381402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp6gS6fiXRKVst4i/0JwkECctK+Yj9KUJFbKtK5dEDM=;
        b=DaOQ2qBkpwhqntEx/Fs9WTijVvq4vPYUPyqvTvbRSQqg3dpuTACSAzMsMtvC2cqBbD
         wKl/5Ph7pgLRd+XgVo3mDOo5QXM1FaklcN6vz+hblEoBiWIf2at1ByCQ1MWJvwk/wF7G
         0TBwQmYo05zGY9BM0y1ACBd4NwJSTaoAXNVplPQV9BQR64v0ct9obB65qsg0/DGtsd7r
         uHJmNmCPT/IoKB7yEYIQ9KNBCveenEn8pr4xX6aJD3o5+VE1Wqgu1xCX1QZ/Ql/rk2JR
         Vw9knwl0Chy9/BPcaJYauuk0dixh/+lC+9KRoAWhjVzOP6JM+KpqIRUnFa6IZBbVlkaZ
         qEKA==
X-Forwarded-Encrypted: i=1; AJvYcCVCrpgx26A5+b+dJ+C8zRXB8KlTC/qqLnM1s6Lm/Ls54YeCz/8KBKvpquybU4OhKx6H908CGkgPX3RVjGkA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb6a4EsTDdIZWgMSXJ83dlVJorsswUVYSYdMLa+J1MWSW2gQj1
	YHUb16rmGsAyQJkeFA8himo6g0MNzDZknJgkusxxg39KcURQEdlHdnfVPvCrvnV2vQ/K/IlBJf9
	zbWV0BaOZ3O4vWqOXCSsVHE6cICzCbRdhKCr4b4yC+erOFoJALZU/tMn3pcrN6Hm0Ctex
X-Gm-Gg: ASbGncvUynX6z6n8qxETUkzrLQq9/DURVKW2+KkboNrp7Ne/trSUNIh/PGTJjS+o3N/
	uNiZSqMPnkAFK8YiCoKS29U8BgQVA/51BXJSaFWrWzRJ6fgxdw1hqD/QJs1wJs/HAN0NBc7x17H
	T32e43jUeuVQG/9+e/LxbuBMsxO9/YtzBD0DIh9Cm4Bl/5vovPyREMm9/3UNE7A4chadkwfJ0sJ
	QEJSDxtxQE6ytn5I/nk6c/ueDOqgYw9Lt5heebxcc95IRFzzPYcAy87bYprqCVhEOWHDALw8608
	h8OCsYt4AhAajsHlrH2zdaFb/QoOszdHypqUWAxbnVQlrxA/JdaTMueob9Wy547ewrL+k5Vx9tA
	=
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id 6a1803df08f44-6f8b2d0fcf6mr190470516d6.30.1747776602230;
        Tue, 20 May 2025 14:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRHg3BPZjY/B10Mp1qFG51/Xus8QH5zLJpu0aZ2V7CVv1GX6G3h/VmPHQU5N4wG981wP+NUA==
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id 6a1803df08f44-6f8b2d0fcf6mr190470206d6.30.1747776601801;
        Tue, 20 May 2025 14:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc7d8a77sm582050e87.186.2025.05.20.14.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:30:00 -0700 (PDT)
Date: Wed, 21 May 2025 00:29:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
X-Proofpoint-GUID: zDcbcFZ8Uh9Vb9x3I8AylWe1q1o8gyyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfXyHJXKrLLwEOi
 V9pV1ZwD/3Bpo/eKLESj8MhcDTeBKHAo97MMGeZoOZiazQtv8oKJjSeqF1yFSsAbbkm4GOnjdLl
 ekKyN1M8bSxh9X59Asd6PWPWE5WWjWLkcB9l5fXerAcNSMiiAS3QfKWSWzF0wvXnDS63vtAXF64
 iuuKgGJzz35p8e9tJcSNGiG/99gVhOrY0TAgvr0R7Ta5hx6rFk4VbYEZ/zuORFXJsvDMbaSzz2V
 Ho89zfxlk2tvepKtqBEpOyRkDLP9554Bk4bLMSVoeO7u7YFzMnMTIIpuSyfBToztcqsrw10xUwV
 fhpkZQACfjO3oupeKIGsUhepXt/VmV3b8BMYdOeUdB2N8Aw1EQOVGDq9uJYh3Av7EvqMWaZpXNx
 Qh7xmR3rRE8YR8uYAqnwQ985XAmZtv5nTar+cvCHCR9H/F8Gm9EJgWVs67LFz2vupQ5hei5O
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682cf45b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=2NsQiy_ISMybaogD8ncA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zDcbcFZ8Uh9Vb9x3I8AylWe1q1o8gyyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200173

On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> >   17 files changed, 6 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   	/* setup which pp blk will connect to this intf */
> > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> 
> Why did you drop the version test here ?

bind_pingpong_blk is only available since DPU 5.x, the same set of
hardware as the DPU having DPU_CTL_ACTIVE_CFG.


-- 
With best wishes
Dmitry

