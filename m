Return-Path: <linux-arm-msm+bounces-60538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0EAD1260
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 15:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED57D168D42
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 13:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D1E20AF62;
	Sun,  8 Jun 2025 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM2APRJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EC64C8E
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749387696; cv=none; b=g5OTDHWReyPuXS1mcoTYo76FAVa/ePCLDbXFUDs/I7nBANKqFQunW44g4FbmLvZ08IdAkfF90fOq3Vxaut4k39KO1BKHwznmQ0laGSyWI6MnaKEYqJIgsZJRDDcvGZY7r9r/QRC/I+NHHeKBMogXbdbwbl6KHUcbST2cVlQOhoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749387696; c=relaxed/simple;
	bh=YnelUDed6OyhnKLYmE7DXZBfDcpX/W7HBa62Jbjj6O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gx1E0ihwEFhtjbI6YRGcU/lgk4SOIaoUjdG7Cu2dO89PLX8LaCfGlc9E3d5YCt3DqetsFGkj+/IfdeqYoWQT9ZaM8HkVjG7WoDEQBHwfEYydmx4w/rxB5wJa3ZKwyIPPKGu107dmcAPBuZvQl0v+1fBa3NXhkLujNwFKVOR2JiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hM2APRJy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5586adjX018367
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Jun 2025 13:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=; b=hM2APRJyBxpJMy0Y
	PqJXpzXxSdzlhpS26nv9g3B0UY/AwolF7gfmLl371fX2IZ5cgo0TCLwT5isxuE4Q
	PLhTFZEFnVeszPzZ+Q1s5AXB0DIY9xTM52Kj2XyrQ7xoIhQjLTzAvkTXZ34IV3Ju
	4m3Y3dVg2ShXE7lGl7BMz4SYmL1dd+h4jOI47sJLNl2mxnQaJ9Vw0lXqnYCelt3R
	5cuixI44UclEKNBRlQ19lX7bD85m31xEh/05cO7Bqy4u1xv0YWyk/WspNE68vuI4
	kWqyJktwB3cQLWXg6LnSuOdDTQWsHV9wP8yaJ2IE+SHJ4Fe8ex9QEJYs9SLFQqUc
	5XJHVw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxjxj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 13:01:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4e591aa8801so3178309137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749387692; x=1749992492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=;
        b=Muk6sLtghgVP9RFs6TzZiAJDjE1SP8ELS1E2UQUN/mu1rp/QGtJhPz80YQBn6Ns9dy
         xzBGv0FWlGFvs1+nJwZrwMohWr4s215ki+nYiXmR1HZry1pdGR61xujkrt1Xn0QAHwzK
         HgMRQdlHyPkGmEJ1pRmEmmgbHOpHsC0MWtORnVLv+naAs7rey8F3szmaU3qMQCUee1g8
         lO6A4vfftPk/sVWAjAkcPDkAM1X0OatqzyzqSPyl+OivE8CHLH8t4dUIOcwI/AZCBcnM
         I1/w1AfCdpdkY097fIPXfur1kQ6663KOxqV1lGd0fCF92IGcltw6e5RMY0RQMTJ1123D
         B5bA==
X-Forwarded-Encrypted: i=1; AJvYcCXv2tCaY6J/9L4oFaE9Bo22TtP/BMVnVmZ1ilzVDa/wvSW7ZCJf/mkF0ezSYW5ixCD6CzxMFYPd0Uspfff2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc4GhqdgBr/WVoirlzPCocQs3BcvHAsfOkGM/pwPm0tlfHf12y
	SsIe4qHeo/yEgiK+jyF1Zrk+MeQzxYFIsaovSoEpc9ucVwr0W/gv6xgTkJ/z3Nb0LjhAJNvOSdD
	TVCVNsterltiIsX0zPaGokeFzUXxpyDzRJgY0hd0vgNBGFivosZ0v2xxMDgseGhrGNLFW
X-Gm-Gg: ASbGncsiMTXKTM2X1031dweKJq5xGui/h1vr3s8DInfjKpYuEVhhZGjnv9yMbylXaVM
	VlUjTjQMOduZz8PT4UxLN8EB6dgFr3mSLNU1xx/8NOHev8fMfbLGccv7ekee1md6s6tA9cTBbKZ
	0o4AHs+iZytTV2A+qOau7lfhGcwgFqM2WcO0QarwKN3sxZMz1CnzTH5MpO/zvrZo1UWCvk+0fcl
	6pCMKCVK6lrH6XDD+qiL5easkSrv6yrRU9zegWYPcXx2tm21t+L35NFUeY6ndGHnvFj2eege4PR
	Dq6V4W3NXGS+MXZdF/q6puOtT2G0o48ZnJskbDpvkhEe26irat/m6Ubikqfp+JQTzBZj4xjM9si
	C73RQvd/Wyw==
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id ada2fe7eead31-4e7841501d9mr2280624137.9.1749387692194;
        Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAG6HcPqe+MgCFYZJUxIPkKKrruQbJNIh+aB/CzHW4ZawMXDG40gTMBIHM+z8HcVgbbJF5/Q==
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id ada2fe7eead31-4e7841501d9mr2280546137.9.1749387691820;
        Sun, 08 Jun 2025 06:01:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00e2sm774355e87.42.2025.06.08.06.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 06:01:30 -0700 (PDT)
Date: Sun, 8 Jun 2025 16:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <eavjcf6vkks2e674xhcyqpdp4yhztcbw2ofrbze3ksxsrazhyh@nvu6ifpaj3hx>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
 <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
 <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
X-Proofpoint-GUID: xDpS9A4tqpPR6tARzaMnJPqs0BMinK5d
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684589ad cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CD96AAi2pJaqMmpRfg0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xDpS9A4tqpPR6tARzaMnJPqs0BMinK5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMiBTYWx0ZWRfXz2NS9hPQ72fk
 c3rrfWNf1ffHAJJ+i+V3y2tgyyDcEvHN+jHTR8oTGZfkmirBcLh+NDjzGHvHAedfrA4b+ovv9WX
 zB4JQecbh0Q31rNkorder2wndqMgfpH7ACN8kG+gCqDKUqIJGlG7Y0fkCLt8wCJEZsKAXTQCeDY
 /MKzL2U/J8eOizcDmRDbuRMIwfwtP5gVEX+1Cy5Vo6SF9ZDY+GZ/gxwbfl3s2GalojTh2XaNvj2
 2yGFJA57JsATncgFhhdsgslyjKZ5rxXQeW4k+RMd+ykealyEri0rSm4t0bDM+NeI2W+/l23D8FV
 oHVpQ7vlfzd6tv2QOpnzJkC9I57va0S6q/4TqjFbEFTpFP1+gTKSJfBrokv6JtGnQOLVQM3c+JT
 qORIJ6ZulMsD3bbiH5co7DjB5oD8cZeKtmo/o7DSB8q+WMj4wlO/kl9B9EXCi6hfBayO+p3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080102

On Tue, Jun 03, 2025 at 10:37:37PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年6月3日周二 18:21写道：
> >
> > On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
> > >  1 file changed, 94 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > >  }
> > >
> > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > +                                   struct dpu_sw_pipe **single_pipe,
> > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > +                                   bool config_pipe)
> >
> > Could you please describe, what does this function do? Why is it
> > returning the pipe or configuring a pipe?
> 
> It search all pipes. If there is only one valid pipe, return it via
> pointer and function returns true.
> If the config_pipe flag is set, multirect_index and multirect_mode are
> also initialized. See below.

This doesn't look like a description of a single action. Please don't
try to mix different actions into a single function.

> >
> > > +{
> > > +     int i, valid_pipe = 0;
> > > +     struct dpu_sw_pipe *pipe;
> > > +
> > > +     for (i = 0; i < PIPES_PER_PLANE; i++) {
> > > +             if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> > > +                     valid_pipe++;
> > > +                     if (valid_pipe > 1)
> > > +                             return false;
> > > +                     *single_pipe = &pstate->pipe[i];
> > > +                     *single_pipe_cfg = &pstate->pipe_cfg[i];
> > > +             } else {
> > > +                     if (!config_pipe)
> > > +                             continue;
> > > +                     pipe = &pstate->pipe[i];
> > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +                     pipe->sspp = NULL;
> > > +             }
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > >
> > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >                                      struct drm_atomic_state *state,

-- 
With best wishes
Dmitry

