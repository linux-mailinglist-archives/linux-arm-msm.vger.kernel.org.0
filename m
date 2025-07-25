Return-Path: <linux-arm-msm+bounces-66713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308EB11F7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 15:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7BDC4E2D44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 13:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C8727472;
	Fri, 25 Jul 2025 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVfjDJws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F01145355
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753451116; cv=none; b=YeA70zZoa9G9/7IO7hyVcLRiatWIeZcWGfxQePNGF69QOB4lpe2hySWidQGFlC1xK9v4z29OitoIe3Bq7enc/xFo41f+gbi1XwWumVbIhguNVHKx/3D7SFDHtO2Kbx9jtfwipHazwIN/0P5rOpY3TUFw6srzwCRHBiR5JwYJB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753451116; c=relaxed/simple;
	bh=hH+M7I57ktiW5r2EZMUDwM8/a3OAiOfa/ym/KvC/Q+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNfMMw315nD10zYmQrsYrvwaXkcn/rXiiY4J1vfRC2VaNPlPal2fzzyNxrV1TDAXD6VqDAf51sXGDZ749LtlWezW8Bn0+4Pm0OYcFOfpf0H1g06Ygv4qGTAu1XLdR+btWR45n7JNGZ+IXBdLb6mkmgAjBAAwAR/+JDlIKv5wTOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVfjDJws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8h0E9015866
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 13:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ONmnBZZ9xI8tN7Ug6QnlRIQwZtjBF6/HFAbbw5ba98=; b=eVfjDJwsYZBzEMcO
	V6yyGTyhTzC3N/k4f0tWdn8ta6024NnF7g0Umn7vZQm86LTJSIBLzJOlBm6uM72K
	9RsB7+DbZEnqDHMcVlWNeo2pFxm+Q/9iyB82bKZ/RfgNNFZarW//YQF6qWAQpDcu
	hA/MYAhvTr6oXPnzgN7w5YhR6fz+5BS23W0P23EuyUztyVbnxMLUkRdZI1MFW3BU
	F0O3L8rj9ttoWyyXUcYtU32Zdj1Sn0aAlpCjEfsZsTOwKOdyHsRzXw19TOs65tAe
	zNi5T2HxUFHKio3HHapw/RKE8idak7xkZ5z65H08ehYLMJYq0VAuTyTfELNvutW6
	KAYNjg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w50287d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 13:45:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac216872cso48522966d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 06:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753451112; x=1754055912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ONmnBZZ9xI8tN7Ug6QnlRIQwZtjBF6/HFAbbw5ba98=;
        b=qnS1nXKEuaXrsrnv1Dx/OCKZnNBccrbZsszJmASR8EeHEpsVp0/cWKxixBX64iN1wr
         ehW22uKXOTp1it8T0+BHpYx5FozwiSDFKcbb6lzC/qKuERKfT0pLgeKrg3UfSgq6rRtl
         VJwJztYIok7ReBXrq8LPe6r6Utn3vrwANbAQhFY18kGyDlD1QlgUzCtoieWtNHN2iX+a
         IyxBZgmsu6ZwAUInYBmlBwPY7FLvSzSSE4yEjGyloL+NIfqWWukOQgUzu7a95WjNGmTs
         QrSQJItw9OIA1GWNH0BZ4F9eF9IzWGS+Kors1Wux0NuYt0nz9fRpk31NJsXxaYFFV+yW
         Yn8A==
X-Forwarded-Encrypted: i=1; AJvYcCVd6dDf9Om9zoxGXz5yn/pzZuyegoyOfqzHWZOFLkjIKc6pvlHDG+6j6QfuQOBpVtW4qB3kIfqg0ajfIoY6@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3JBqIpv8Wl0AXvv5YxYpIvVKzDX8GRk6xILyDKFDAA8+gvGD
	o8ieb7KBria144L1QXesY8abFHVubssCTd0vW0JU87kjiA/HCUgeh0hq5BR3Ibho+CVSZhN1usQ
	jAhsS5JRJMXASNj6hqiogXGc0wjjUvoNIojDYGmrP5pq17n4zAyC4dUCFPgOVbWObXoCgUyVzwf
	hh
X-Gm-Gg: ASbGncvo9RyjczvZPYbPpEii5XqVMe8YKv7AmtIVh9Ooxs5ZsSoElV4yVrOxO+aAch3
	ZnpQP26y9ZhKVi8ExUaUP6CZEyW+FyR40LO9WRYQR4SItIeHDzU9Ss0suSlqMhEmIWsvwtBKeDw
	LGWK9gfXKrrFCj1dr3p/dkRNW/CmVoAuOpRhE0CfoN4D+OoKTZ4zdPvORwi9Kq3/td2kzsWW0mq
	1S/sNBkE1h/EeBnq14/rYXkklUZjheBM5mYDVKIpU1Km8pnz/vY7MOWtvvOaaxzNShztRwMkKNM
	rymCvUNifgbQmj6eFeP5C2jc3rMu7dF3j30coubioXd3Zzg3xEh+Fl0mzQ6EtSolkjP7NQjVnU+
	aDKmVChJM6Hg6bmbZm1ykKY/7WCmOuiYX3Z6pj8u1iMVvYcfPkChB
X-Received: by 2002:a05:6214:2262:b0:706:c5f3:c137 with SMTP id 6a1803df08f44-7072088723dmr20905626d6.24.1753451111596;
        Fri, 25 Jul 2025 06:45:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1U/xIZZYpQK1jfWnH2Yh4VPLMFxYgo4DYiR+SfBY8b+qvkCOewAz9ojreIom0tLRc0x+sNA==
X-Received: by 2002:a05:6214:2262:b0:706:c5f3:c137 with SMTP id 6a1803df08f44-7072088723dmr20904936d6.24.1753451110818;
        Fri, 25 Jul 2025 06:45:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b34ec2sm948748e87.48.2025.07.25.06.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:45:10 -0700 (PDT)
Date: Fri, 25 Jul 2025 16:45:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <tozhsnjg34ob4xdhzs2tzga3cghjtkpfy4672ubdyazbqvne2e@kzdhjuwmrtor>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
 <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
 <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
 <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
 <CABymUCOgnOMTM=XYEMbE_8h_x+zeC1OnMKGMH5ZEP+Zuhz4PKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOgnOMTM=XYEMbE_8h_x+zeC1OnMKGMH5ZEP+Zuhz4PKw@mail.gmail.com>
X-Proofpoint-GUID: _SAcECQNBiVTzPjBtaoimmnlP5JTwsRC
X-Proofpoint-ORIG-GUID: _SAcECQNBiVTzPjBtaoimmnlP5JTwsRC
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=68838a69 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1EURjifVAzo2SBUh9P8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDExNyBTYWx0ZWRfX7ZwrMcI3P7ZI
 2shNYCwllDUfkzodxJKPdbZb4lsPt0EdWnRnvs3FlIDD/G2PKg2dJzi4imJWyzpERAJoc5Q540o
 1abZWtJDf0AtjEbvQDSlkAD6hczJavyTpzQiaTzLkCM/wnMTQIIYNuw7VW8HxTx/jW6xjnwbo8Z
 inwivhrPUMldi0/iVl/7cgJ+EiOOl9yo2ucdl/21TW+Gjza9xuQhGB2zjAlMhft67Z2CAkotK+A
 rdOsO8woO5vZrfqe1GBDwD72HcfAcwqiwgrnc+msHJtnS9Q1yznjxD+qF3WiZWEVv1n2c5skMyk
 bgPAWQbxnaKaL/9tn8wjvCWeuByynqCjRp6MT7SukM1eQ7It4OJSsFBmWuBv6PRr0oB/gdJBqXf
 iSRtTO5GMt+wPK7X9scfTistRkRIIYh3eoAdpPBjppuhHSlLh9b7y5/MrGdAosDMeKL8xBTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250117

On Thu, Jul 24, 2025 at 09:56:21AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月22日周二 20:04写道：
> >
> > On Mon, Jul 21, 2025 at 04:06:13PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月19日周六 18:09写道：
> > > >
> > > > On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
> > > > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > > > quad-pipe usage scenarios require four pipes and involve configuring
> > > > > two stages. In quad-pipe case, the first two pipes share a set of
> > > > > mixer configurations and enable multi-rect mode when certain
> > > > > conditions are met. The same applies to the subsequent two pipes.
> > > > >
> > > > > Assign SSPPs to the pipes in each stage using a unified method and
> > > > > to loop the stages accordingly.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++-----------
> > > > >  1 file changed, 89 insertions(+), 54 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc2a4b8a8a7d40b3d3c 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > > > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > > > >  }
> > > > >
> > > > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > > > +                                   struct dpu_sw_pipe **single_pipe,
> > > > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > > > +                                   int *stage_index)
> > > > > +{
> > > > > +     int stage_idx, pipe_idx, i, valid_pipe = 0;
> > > > > +
> > > > > +     for (stage_idx = 0; stage_idx < STAGES_PER_PLANE; stage_idx++) {
> > > > > +             for (i = 0; i < PIPES_PER_STAGE; i++) {
> > > > > +                     pipe_idx = stage_idx * PIPES_PER_STAGE + i;
> > > > > +                     if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
> > > > > +                             valid_pipe++;
> > > > > +                             if (valid_pipe > 1)
> > > > > +                                     return false;
> > > > > +
> > > > > +                             *single_pipe = &pstate->pipe[pipe_idx];
> > > > > +                             *single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
> > > > > +                             *stage_index = stage_idx;
> > > > > +                     }
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     return valid_pipe == 1;
> > > > > +}
> > > > >
> > > > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > > > >                                      struct drm_atomic_state *state,
> > > > > @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > > > >                                         const struct msm_format *fmt,
> > > > >                                         uint32_t max_linewidth)
> > > > >  {
> > > > > -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > > > -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > > > -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > > > -     struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> > > > > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> > > > > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > > > > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> > > > >       const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
> > > > > +     int stage_index, prev_stage_index;
> > > > >       u16 max_tile_height = 1;
> > > > >
> > > > > -     if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> > > > > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_index))
> > > > > +             return false;
> > > > > +
> > > > > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
> > > > > +                                    &prev_pipe_cfg, &prev_stage_index) ||
> > > > >           prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> > > > >               return false;
> > > > >
> > > > > +     if (stage_index != prev_stage_index)
> > > > > +             return false;
> > > >
> > > > This should be handled other way around: save N pstates and then loop
> > > > over stage indices. If there is no rect at the corresponding stage for a
> > > > plane, skip assignment (and use prev_adjacent_pstate for the next plane).
> > >
> > > You mean dpu_plane_virtual_assign_resources() shall notify its caller
> > > dpu_assign_plane_resources() to skip updating prev_adjacent_plane_state
> > > if dpu_plane_try_multirect_shared() return false? If so, we can add an
> > > argument "bool pipe_shared" in dpu_plane_virtual_assign_resources() to
> > > get the status. But that is an optimization to share pipes across multiple
> > > planes. Can we add new patches based on current patch set later?
> > >
> > > Or my understanding is not aligned with your thoughts?
> >
> > Not quite. I think we need to store all NUM_STAGES 'prev_adjancent' states and
> > update them as the driver loops through the stages for each plane.
> >
> 
> I see. So the prev_adjacent_plane_state in dpu_assign_plane_resources()
> shall be converted into an array, and map to prev_adjacent_pstate[N] in
> dpu_plane_virtual_assign_resources(). Then check new single pipe plane
> vs every member in the prev_adjacent_pstate[N] to confirm stage index is
> aligned before sharing SSPP.  Right?
> 
> If so, that is the optimization for the dual stage case. It does not introduce
> regression to the existing single stage case with current implementation.
> Can we just merge this patch first, then add the optimization for the
> dual stages case in new patch set? As this patch set focus on quad-pipe
> with 2 stages, without hurting existing usage cases. And it changes lots
> of code and involve rebase effort from time to time. While the optimization
> for the dual stage case will limit the change in plane, though several review
> cycle may be needed.

It's not an optimization, it's a normal flow: you have two different
stages, there should be no intersection between them. So, no, please fix
that. It will also change some bits and pieces of the logic that you
have here, hopefully making it easier to follow. For example, I don't
think you'd need dpu_plane_get_single_pipe() anymore, etc.

> 
> Regards,
> Jun
> 
> > > > > +
> > > > >       if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
> > > > >           !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
> > > > >               return false;
> > > > > @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > > > >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> > > > >               max_tile_height = max(max_tile_height, prev_fmt->tile_height);
> > > > >
> > > > > -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > -
> > > > > -     r_pipe->sspp = NULL;
> > > > > -
> > > > >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
> > > > >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
> > > > >           (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> > > > > @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
> > > > > +                                           struct dpu_sw_pipe_cfg *pipe_cfg,
> > > > > +                                           struct drm_plane_state *plane_state,
> > > > > +                                           struct dpu_global_state *global_state,
> > > > > +                                           struct drm_crtc *crtc,
> > > > > +                                           struct dpu_rm_sspp_requirements *reqs)
> > > > > +{
> > > > > +     struct drm_plane *plane = plane_state->plane;
> > > > > +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > > > +     struct dpu_sw_pipe *r_pipe = pipe + 1;
> > > > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> > > > > +
> > > > > +     if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
> > > > > +             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > > > +             if (!pipe->sspp)
> > > > > +                     return -ENODEV;
> > > > > +     }
> > > > > +
> > > > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> > > > > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > > > +                                           pipe->sspp,
> > > > > +                                           msm_framebuffer_format(plane_state->fb),
> > > > > +                                           dpu_kms->catalog->caps->max_linewidth)) {
> > > > > +             goto stage_assinged;
> > > > > +     }
> > > > > +
> > > > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > > > > +             r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > > > +             if (!r_pipe->sspp)
> > > > > +                     return -ENODEV;
> > > > > +             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > +             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > +     }
> > > > > +
> > > > > +stage_assinged:
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > > >                                             struct dpu_global_state *global_state,
> > > > >                                             struct drm_atomic_state *state,
> > > > > @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > > >       struct dpu_rm_sspp_requirements reqs;
> > > > >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > > > >       struct dpu_sw_pipe *pipe;
> > > > > -     struct dpu_sw_pipe *r_pipe;
> > > > >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > > >       const struct msm_format *fmt;
> > > > > -     int i;
> > > > > +     int i, stage_id, ret;
> > > > >
> > > > >       if (plane_state->crtc)
> > > > >               crtc_state = drm_atomic_get_new_crtc_state(state,
> > > > > @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > > >       prev_adjacent_pstate = prev_adjacent_plane_state ?
> > > > >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > > > >
> > > > > -     pipe = &pstate->pipe[0];
> > > > > -     r_pipe = &pstate->pipe[1];
> > > > > -     pipe_cfg = &pstate->pipe_cfg[0];
> > > > > -     r_pipe_cfg = &pstate->pipe_cfg[1];
> > > > > -
> > > > >       for (i = 0; i < PIPES_PER_PLANE; i++)
> > > > >               pstate->pipe[i].sspp = NULL;
> > > > >
> > > > > @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > > >
> > > > >       reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
> > > > >
> > > > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> > > > > -             if (!prev_adjacent_pstate ||
> > > > > -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > > > -                                                 dpu_kms->catalog->caps->max_linewidth)) {
> > > > > -                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > > > -                     if (!pipe->sspp)
> > > > > -                             return -ENODEV;
> > > > > -
> > > > > -                     r_pipe->sspp = NULL;
> > > > > -
> > > > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > -
> > > > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > -             }
> > > > > -     } else {
> > > > > -             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > > > -             if (!pipe->sspp)
> > > > > -                     return -ENODEV;
> > > > > -
> > > > > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > > > -                                                   pipe->sspp,
> > > > > -                                                   msm_framebuffer_format(plane_state->fb),
> > > > > -                                                   dpu_kms->catalog->caps->max_linewidth)) {
> > > > > -                     /* multirect is not possible, use two SSPP blocks */
> > > > > -                     r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > > > -                     if (!r_pipe->sspp)
> > > > > -                             return -ENODEV;
> > > > > -
> > > > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > +     if (prev_adjacent_pstate &&
> > > > > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > > > +                                         dpu_kms->catalog->caps->max_linewidth)) {
> > > > > +             goto assigned;
> > > > > +     }
> > > > >
> > > > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > -             }
> > > > > +     for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> > > > > +             pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > > > > +             pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> > > > > +             ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
> > > > > +                                                      plane_state,
> > > > > +                                                      global_state,
> > > > > +                                                      crtc, &reqs);
> > > > > +             if (ret)
> > > > > +                     return ret;
> > > > >       }
> > > > >
> > > > > +assigned:
> > > > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > > > >  }
> > > > >
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

