Return-Path: <linux-arm-msm+bounces-58232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A4ABA0B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 18:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C1224E5CDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 16:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10EB157E99;
	Fri, 16 May 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MItW8aR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC631FAA
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 16:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747412370; cv=none; b=tNxVubPppOE033eYICEnc0oiENK+Tt6X9T61bfkLJeMcci+c93uGzsYexaP6tNYy6HN7bpWxcKLa99/u/OBixbfTpU1OEOfGlCIDVnSg9U2dXp175rqQ9Mq7P5XycIhE1TuBg4yWhc4cU3QyDPuwifoeyqL2uX10d5Co0iWZTPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747412370; c=relaxed/simple;
	bh=zpJssZjgpXtPwKxUER/XjTyVBwAzoIYqohP1WRwvgd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQVfLV1diD5TkHcdNa92YE/5e9xBcEPTr966ikYTYa+0QNcKbYKzcjnrwjE/ss5fY+zV4N/vgzbM2woWJ3PcHVKZzUmb2wWWRhNsD2MIvR8JtvJd1GEruJB1G2ZBQSf6tD4szTgt432dsITwWbx/8q7Dsoanpk4ZlGAr+GD9ZQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MItW8aR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB5nBd000334
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 16:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OdHizHb7IuxrNJHGu0bm0O5d
	8pJGDXJ9pmm12RIOU2I=; b=MItW8aR9W3Iw+ODPZeqNt4Au+DvaYjveXh/+vnOg
	dm/hYgCHUFCWb7y+vLGWDb+tHN4zSlxYT4wF/zvdtzaygkyRJLRWB/2aQ34V5Nrh
	hKD6dSHdAxwBcretFC5uT2ndyQ5UkokTl8lXR2BIRTTKbwjtTCSCjuIbqxqyfLT5
	QS63PSuVC3w4+grRgY5KwJDPfj6YgxWbN0VM74d8LotqPU0rSJWAYiBugYciKVZ9
	qBbst25/aj7Ul1GhBehSmrRXqp/QZH69HoDq2YFsPsFVJ5vMeFnlSGdm2Veq/4zP
	zqTwnIoVlUV4tbKENkRoFF62pQvS6Bq9Pjmw9g8P7LGw4A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp2fm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 16:19:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so1432922a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747412366; x=1748017166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdHizHb7IuxrNJHGu0bm0O5d8pJGDXJ9pmm12RIOU2I=;
        b=k768gDizheYMRLsNIl2mSluHW6NOr1OIb+tZKHvcLGJdi4AQIMH+OP+9XLnBsNlvMO
         tEJ6SZhOhuGkGNVPBUDgDvKwqh6nvVfuqpFIXIN+OS+0DTgglcIzd1NFuVeAMQyjOsyq
         jn+WaoJmpxsw1nOe3KWJeQlV8VQolCuJYNxVXW2yBoXhwnqGonqUeL4ypzSA/sMkY9Bh
         9ZvmBDEXi5gnusyE4wFe+GMN+B5ns9drC7wD4OfJi8Yf8qIWxWrMtZGihiQEMusb0uDf
         LcpOYgExLrjhBBsm/IchJahVENytT1z5DrKoEWxAjfk7kNm9sRHHde8Hii9DT7XUGM2X
         Q7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU3KYaKg1sTLMsMaqHaEn6vln3WmmVMPw82ybGiG1zdCqiB+KK4Fs8o8/6yfCH29ax3lUQP1L0nexMWm1C0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0YME3c61ZScaPeh2YZoYSHc6bSDQX+mRjz/AEapAXVxHHajSR
	JVT0E35972tMrSjgU8n76dh1sWcrusjv7iAiyLFh2OgVpf3wimtKEADFlhHuT3gUQFu9c6OPNcy
	vcio5GX4BuT0TE3HVNgLlLlcOfeyQOwil7JSk1FMfoIYAXxJ2D6AFK5X5Vc+wJGTBlcgcTEMGIm
	nWcnSbOM/k0U88BpQXMEJqR56OIXbEFo7UiawoKBT0lzQ=
X-Gm-Gg: ASbGnct44S+YzW4n6XtPMtc312rGp0RRQkxHC7YmWJAS3f0vP0sza0XzG4i92uYGMaY
	T873UvPSaSQJpTKi0NtQyIzy4owD0UKznBGz58IQAMcIbQI5uHr4ERV1AIj0a1qSNmMXxaWnwN7
	ysfCGkv2A6IfFmGud8R1DBKDah
X-Received: by 2002:a17:902:dac5:b0:22e:4509:cb89 with SMTP id d9443c01a7336-231de21d4d5mr41482005ad.0.1747412366026;
        Fri, 16 May 2025 09:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSVcF+K+W28H2kWBwMf5GyuWgdNhhGke3bb+WX4ooyAH/AXp2dXaZPpDFx8tw2S8pmh8/7WKHKH4LH3dgd+hY=
X-Received: by 2002:a17:902:dac5:b0:22e:4509:cb89 with SMTP id
 d9443c01a7336-231de21d4d5mr41481555ad.0.1747412365584; Fri, 16 May 2025
 09:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
 <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws> <24e419da-71f8-4b0d-9416-0fe4c63eed0f@oss.qualcomm.com>
In-Reply-To: <24e419da-71f8-4b0d-9416-0fe4c63eed0f@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 May 2025 19:19:13 +0300
X-Gm-Features: AX0GCFs30z0wUwczwcpcFSVo58xy4x1zGA8X22Qv0jPIM8FmHAw1HbbWJAzWeGA
Message-ID: <CAO9ioeVnbgWt8Ov0LF8y5dqydLM_7PhwHN3h=PEu-T2aibpkDA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max width
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Oy7TceXWVcb_K6uHiqI-Sue7lMW7kOCL
X-Proofpoint-ORIG-GUID: Oy7TceXWVcb_K6uHiqI-Sue7lMW7kOCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE1OSBTYWx0ZWRfX+iywKaVQw4rQ
 fdw4Ck8IJiBM7L44M+Iic3QAWjrdUNKkbJInbwB7cEDgiEdisI99oKuekZRaJbH/1apObBtjQzO
 X6lFntkHS5Z48Mz7jTHLAp2hrxWeL8P76xw/sOYjSFxxwWyiI9pmQEa7Rf1Tvj3QP3L50w6Ab+X
 1ePLCRmuVWiy/G91TPOkkIgdaY9lfwxHpDjQLfQFDlcTS8HGZlLrgHqyJOrihZc9uQNZoL/CW0G
 E9MwNwIwX4yFGjvxGM+3EuP31WURIaLxg2/a5apTCfySEQ9QmkAObKAD4BK89IcVd/hLiNjn27N
 rOG2SHrsiWSygWfE3fX5nFAoT0bGwVLQelyroaUs88R+7CwYActf8b3oAE30lkZPZjNyxJkGWio
 Uiy+wavYdWzKRec2xZDaD+qguuZgJvkBxjCPezi3kEz+tOkRQZp/R9t5g1J+PfUdGsq/FJaZ
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6827658f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=YjGi-erzSBDx4MDg3asA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160159

On Fri, 16 May 2025 at 03:39, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
>
>
> On 5/14/2025 5:28 PM, Dmitry Baryshkov wrote:
> > On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
> >> Validate requested mode and topology based on the PINGPONG or DSC encoder
> >> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> >> off of PINGPONG or DSC encoder max width
> >
> > Separate commit for num_lm, please.
>
> Hi Dmitry,
>
> Ack.
>
> >
> >>
> >> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> >> for PINGPONG_0, there is some additional logic that needs to be added to
> >> the resource manager to specifically try and reserve PINGPONG_0 for
> >> modes that are greater than 5k.
> >>
> >> Since this is out of the scope of this series, add a helper that will
> >> get the overall minimum PINGPONG max linewidth for a given chipset.
> >>
> >> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
> >>   1 file changed, 39 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 0714936d8835..6131d071b051 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> >>      _dpu_crtc_complete_flip(crtc);
> >>   }
> >>
> >> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
> >> +{
> >> +    const struct dpu_pingpong_cfg *pingpong;
> >> +    u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
> >> +
> >> +    /*
> >> +     * Find the smallest overall PINGPONG max_linewidth in the catalog since
> >> +     * max_linewidth can differ between PINGPONGs even within the same
> >> +     * chipset.
> >> +     *
> >> +     * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
> >> +     * 8k resolutions, this requires reworking the RM to try to reserve
> >> +     * PINGPONG_0 for modes greater than 5k.
> >> +     *
> >> +     * Once this additional logic is implemented, we can drop this helper
> >> +     * and use the reserved PINGPONG's max_linewidth
> >> +     */
> >> +    for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
> >> +            pingpong = &dpu_kms->catalog->pingpong[i];
> >> +            max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
> >> +    }
> >
> > Since we are skipping PINGPONG_0, wouldn't it be enough to return
> > max_linewidth of PP_1 ?
>
> I don't think we're skipping PINGPONG_0 here since `u32
> max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;` at
> the top of the function.
>
> >
> > I think, it would be easier to follow .max_dsc_encoder_width and store
> > .max_pingpong_linewidth in dpu_caps (and later add special
> > .max_pp0_linewidth).
>
> Ack. I think my only concern for this is that max_pp0_linewidth won't be
> set for all chipsets. But if you're fine with that I'll go ahead and
> make this change.

You can set it for all chipsets having PINGPONG_0. It might be the
same as .max_pingpong_linewidth, but that's not a problem.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +
> >> +    return max_pingpong_width;
> >> +}
> >> +
> >>   static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
> >>              struct drm_crtc_state *state)
> >>   {
> >
>

--
With best wishes
Dmitry

