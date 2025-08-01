Return-Path: <linux-arm-msm+bounces-67341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B3B180B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CBB53A8E2F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013ED2222BF;
	Fri,  1 Aug 2025 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dohDivY4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3B02036FA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754046398; cv=none; b=RtLdw4WS6/ShzFqkHmd/+Yj+Px3j12UcGLosZQTV6aMF/KPE834yHjySHsI0E1T9u1A8M1mDnloxnLqNEOqyQX4qrKV4d9sf5vFEDXxuw6iwL0y+NncmFQ3aeAeQ3IaQxbvKsFmmaqaQR5p4zDIlhww1kR30XnJx5CS6pgBRehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754046398; c=relaxed/simple;
	bh=Q2ZZC7eAw7ekUxPgB+ZWGu4sti7oHieVjvDAo2dtteI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfpYnXouG7flzetR4d1IlSeznC9Mz7SAuF6+x7NKPxLv58a/qB8mSvvkwtqow07BTGtOJ8dEYwRMSKAH4jXSUel5AfIcZQgaG5q+fQ+3GOUZrlmvrwNK7e3oIDu/hoqHgc6vRG/rjCFmiz7AMiH6m5A37Z99hoORoXjRLt8Lv3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dohDivY4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719EAfv020328
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 11:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ohWu67k8HbB1UHHgamfp/0d6mH0sfNTpA38ZH8ZkldA=; b=dohDivY4oMDnATkk
	9f3S5ewE+CnZH6drV6sJiaPFu79g8KwUmK1qSZotlj7Jz6PpXUERiuce7hPYY/0E
	sS4oMIM43AuHQUY9wkgmjUFAoNrxyNQ001t0hhrEvuRTou7AD0uGLLPw5T47nty5
	ZAs1EaEOE50dT7TkJTx5AFYM3nB7RD8CzIZZtoSF2v9GjawdM5N1pNDQ/9BuClr2
	JwzP/xWTJ6v5xrOv3yz7BKLY6SUlrEERx2JD5DXT4Z0AI8oerg7FLDeGpQCUSDjo
	VZIjgx3ye3rXw9eLv+wa/tWoomrd2QkFh1e1zDK3cXC3ji/11SjfaC1Q60mwXjE2
	2Ysz+A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aug79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:06:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4fc0ab6c584so417853137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 04:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754046395; x=1754651195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohWu67k8HbB1UHHgamfp/0d6mH0sfNTpA38ZH8ZkldA=;
        b=XC87kMV2lRlYnkZOf0ZpfsxlaYlluQnpZhPqMss5K7DDWfk5/hc/VdfvmzU/6j7ldi
         4LlxZMxUI5RjuB9oKnUJQkF2lnuwGOFdSS6ihWxX8B5+/XjNKFHHQxIceBA9eg7KZ8SV
         IxLPqBsYr3GI1AHXmae9MhzSyoHQm1iH7NPU23NAy0UHz80L2pXMipHxKJHM82FKIVeF
         7bFUsxLuu/gv0U61pIeeX30S4lvk0oON1oiwvOIyYn5i1taqCJA5mF08rCyoBGmGRqeQ
         FOOJHCu9QS8YbqyCCwoYbMnBJorCyMzEGm1FGaUv1UPMVbUs3jaY1POmaZrzoV8x+bw2
         44Og==
X-Forwarded-Encrypted: i=1; AJvYcCXvD9hiBDVPRIqp3yskNk+t1Qr+krJQuz2C88ttsSkPAQ+i3zNpMVBaTBIxHTA5zcVE0pRL7wfRzuPwSNBa@vger.kernel.org
X-Gm-Message-State: AOJu0YwERVrdVc9uCxF1Xz6bvDEmp/+Rx4NtSJVUzVbr56ZwiUOjYGnt
	2/OcytmB4hP/75uq5nyufBOSgNKyPylpII/GxshvwNgy00XeAJpGFZcvXaZNBoUoW4mxQAVP4tO
	hTYU/8y200QeFhzLG50rMxWORI/WHa6cK3F7Hl+ZgJy37IFoI3xYYujCZ1+v8LSVOKRkg
X-Gm-Gg: ASbGncutbd63lmqiCbjqD1hc2A1ekjicEiGxi+rQFc6sRhDCuftosmC/0OvEOok5Ryd
	ro3GAgTzQPCkVmSNo+r/dxC3mjQKrWj5mt4TmYEJEQlhIhy7cntzPmFT2GQ6mP/fQMus76fPHew
	KVD+6BQxHrxCV6sj+DcUpfFVhOdkjsApgiYC/ZkdxuSuZqfiThH5+m3qF9zB8kzC4MkOvFO8U/y
	C3qfu+GJpqNlItQ3L0/hnlcBPuBTYPaubM1imo6z1myMpudEIoZ30ylg0MOsxbscKgereC9UgxM
	h1xi55edDyzbMyG9rgTGEdEC7awshVp6INU+ftMTUV74QsOfzQGxpDPjSjoAP3pzepNrzKmNeYN
	dRNvwVt7LpihcuLWnX+8guhSohCC/RJKjQbaIachpLf4iz5rYA0le
X-Received: by 2002:a05:6102:d8d:b0:4e5:9426:f9e6 with SMTP id ada2fe7eead31-4fbe88fea36mr6776816137.23.1754046394953;
        Fri, 01 Aug 2025 04:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELXu+i98JlBWaD9NFVhCHmgXrDjDlJp2pJeGlNotCFdOuNkns+rDbVOGaCSxMcLE/OBy1MTg==
X-Received: by 2002:a05:6102:d8d:b0:4e5:9426:f9e6 with SMTP id ada2fe7eead31-4fbe88fea36mr6776774137.23.1754046394479;
        Fri, 01 Aug 2025 04:06:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac767sm537574e87.68.2025.08.01.04.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 04:06:33 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <akxp2lpikvslacz72gvp3ctzdgsrbfnth4ugqfhbxvflmr6ssu@f4ebi3tyz3am>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
 <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
 <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
 <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
 <c7346b52-c5a0-4aa2-a8d4-92761e33b011@oss.qualcomm.com>
 <CABymUCPgXAaJCLTiN1XxK1JEjxnr9qPye_E6gMLSMvEhgXJk6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPgXAaJCLTiN1XxK1JEjxnr9qPye_E6gMLSMvEhgXJk6w@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 9aHkNvApuhGPdz_uGL1ahIc9VfW8m5_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4MSBTYWx0ZWRfXyptjHcrkLey9
 a7TURAC91sOhyJxPeJ1uO65/A8fJPEEAivnaRGZD1wGQ+pLfX9dV+x5ANTWbMB9moOve4ZLWEWo
 OolbpbLfG3S147dVXt28P9HM5ov6FRyN5NVIpztH/2gbbOcAKdgDXnImdBMhRDO5eOyN+ElzW5y
 yRLdlyyb2Zexpvonr8GyMh8RuzB1nTq74Yu9C/trznR92z7RxC9PCgXpRwynow5UeTTRoDH8jSY
 hJUO4dmcsars8mnELGg2OgmRMhEkwEhPd0CYiF0/Lpf0TJF/KTZ8EbWIa1rPsPSMA2sMV0kWv/e
 WXmGDgr3gYhOvtLVXCCQCBqiSFNKyqfr3al7RaSmxdwxex/ED31uilRckrV12LrgZhaDtYjemSW
 fW8vPUpIr7gC8p4HWstjYxVs4a5KC3/F2EqHb6UEr9Dl5HrxkqzNRgrTdbV1a8xd9KXn19H4
X-Proofpoint-GUID: 9aHkNvApuhGPdz_uGL1ahIc9VfW8m5_a
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688c9fbb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=K2Uce_oDiRnA2C7xoV4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010081

On Fri, Aug 01, 2025 at 09:19:41AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年8月1日周五 01:08写道：
> >
> > On 31/07/2025 18:37, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 22:22写道：
> > >>
> > >> On 31/07/2025 13:52, Jun Nie wrote:
> > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 02:52写道：
> > >>>>
> > >>>> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
> > >>>>> Currently, SSPPs are assigned to a maximum of two pipes. However,
> > >>>>> quad-pipe usage scenarios require four pipes and involve configuring
> > >>>>> two stages. In quad-pipe case, the first two pipes share a set of
> > >>>>> mixer configurations and enable multi-rect mode when certain
> > >>>>> conditions are met. The same applies to the subsequent two pipes.
> > >>>>>
> > >>>>> Assign SSPPs to the pipes in each stage using a unified method and
> > >>>>> to loop the stages accordingly.
> > >>>>>
> > >>>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > >>>>> ---
> > >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++------------
> > >>>>>    1 file changed, 99 insertions(+), 61 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460d62901dced65e3a9e 100644
> > >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >>>>>    }
> > >>>>>
> > >>>>>
> > >>>>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
> > >>>>> +                                            struct dpu_sw_pipe **single_pipe,
> > >>>>> +                                            struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > >>>>> +                                            int stage_index)
> > >>>>> +{
> > >>>>> +     int pipe_idx, i, valid_pipe = 0;
> > >>>>> +
> > >>>>> +     for (i = 0; i < PIPES_PER_STAGE; i++) {
> > >>>>
> > >>>> Why do you need to loop here? Is there a case when pipe 0 is not
> > >>>> assigned, but pipe 1 is?
> > >>>
> > >>> Loop the pipe in a stage to count the valid pipes. If there are 2 valid
> > >>> pipes in stage of the current plane, this function will return false.
> > >>> Or you prefer the below coding?
> > >>>
> > >>> 1029         pipe_idx = stage_index * PIPES_PER_STAGE;
> > >>> 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0 &&
> > >>> 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
> > >>> 1].src_rect) == 0) {
> > >>
> > >> Yes, this is better from my POV. But the bigger question is why do you
> > >> need it at all? What is wrong with the existing check? Can it be that
> > >> pipe0 is not used, but pipe1 is used?
> > >
> > > There is no case that pipe0 is not used, but pipe1 is used. Existing check
> > > does not filter the plane which contains single pipe in a stage, which can
> > > be a candidate for SSPP sharing. If the stage contains 2 valid pipes or
> > > no valid pipes, it is skipped in dpu_plane_try_multirect_shared(), or it is
> > > skipped to be stored in prev_adjacent_plane_state[].
> >
> > Oh, I see, you need to check both pipes because you might need to skip
> > it completely. I'd really prefer to have more explicit code:
> >
> > - check for pipe0, skip this part of the plane if there is none
> > - check for pipe1, if there is none, it's a candidate for sharing.
> 
> Yeah, this is the logic of the current implementation. So the your only
> concern is the loop. Will remove the loop as above code.

Ok.


-- 
With best wishes
Dmitry

