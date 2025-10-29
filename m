Return-Path: <linux-arm-msm+bounces-79451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B1C1AA45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57150567153
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF8C1C5D46;
	Wed, 29 Oct 2025 12:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hzl6u8H6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3/B2yoq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A34357A30
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741017; cv=none; b=J40chAf5aszPtvDQQ8Q9jesNGoWmMNNiV3V5e0Npbq0wtV4GpbbdBxRgRbM2HjDgWoMftumfKsWFuNlRBHBrMM6uDMto/E66Tg1ZwUsLJLUyWsn+9ioXAUv7D6pgIESa1UP5bz0SFBhwMNpteR0kdYT4catOiebzkjABE45Nny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741017; c=relaxed/simple;
	bh=rgJ6NViG8cB+9o/YccW1eh80dpy2wvyj9cSNU462+TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVJo0htfrZBq1DhINa9at/9i6I7C4AeUP9L3CkdOnC5NfCynBHcDxGOi4BU5w1z7jiOcWZO69jOEQ/PrJAFUIjtDA5l+DFwn3FZQdIwoJjS7/I4G3uWg0WjxRRac0tjckcad4j/GrVBxwn/uQzgUI3zJM2ZNDJVwAaMKQLf3T6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hzl6u8H6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3/B2yoq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4upmP3757472
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mVO0+KaQVgEr7+VvTbIWP9Zk
	5Nqcr72UBypM4fNWPRM=; b=Hzl6u8H6z5eFAyY/8Zd2wsvdvxRx9ONJlrA2HMoL
	TzxO16oJ3wGmGPIsG7lFIOf4tDn9bX6j3znFPBP489CZ1BCj21Qfikp8RnNTiFf8
	qTL3I0SUBQLe6Waof2Fmyit3jjV3JwZri3wxgwOXt6UNgYbn4w3aS09VrqqOEVmp
	BOVpxZjkxiaY6r/xZfat1JUntV89xLcMhprRPQ5fhDPMtiWvszl5WAOzo1AMSbpk
	1IBplbbLyufxGoDF8uK0Vkwi7b7pMp4lzaM1C9vEIFpJXgJKoF05U9E+IxgB4kZ6
	PltBk3hdmWngLRhZPQOYi1dQT7I55laMplQ/3TW04cQMVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y2gcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:30:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf8faf8bdso166970901cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761741013; x=1762345813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mVO0+KaQVgEr7+VvTbIWP9Zk5Nqcr72UBypM4fNWPRM=;
        b=F3/B2yoqTCi3IglcEe57YlwCiaGr1AsbccVg1eSfYDNM1LDn3fkiMRDuurL6EjioDY
         4tHrFag+s+6LMTWCNzCJ27naymP92r2rDgWtvEYsfCb6e46PtqG9CRfwMc+icZhE3IXF
         KK2s4lWxu9h5Qu6PaAq5xyhqoFAmQU7PC+7TDSX6UX0Jo97o7KsDjfd8qyMLf2elmadq
         v6DDBddAOrjHB3eVV1MMCAwJQZgtvtnECJ/TasXoIi6813zzKBMkW9ZEAXgPt7cwd0pw
         hC777UMRNgEbVG6Ej4Q/pPW/5KzdCB+woe3OZnk8Xs+IDwid5tQoU8BNBgaAFYRpQMyv
         cLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741013; x=1762345813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVO0+KaQVgEr7+VvTbIWP9Zk5Nqcr72UBypM4fNWPRM=;
        b=FqP4iczXoaqP9HrCQQS4x2yRQLW9fZwPyy65TwYQaOc3CsRy0cTa0qUdtkQWs38zYv
         7HjwYeZ/Kke79O8dAoG/bMWZhHlVvwNmnf2XVAYQQMyb6ddl4CHq1p5Oy83ideX04QbP
         kdbbyVqa0enH2qr/qUz3utpdGWmIUao556qp0YIRtr4BuY8eqrrbfasd+Ei0ZMx3w/X9
         sfQhTi/lxSuNhz8d/cndkrLKNqYASk59B5lyyq9ojc7q5InGTsa7ZdcmwzUriEWk8jLB
         g/1J9S/R1RIJOmYrIGY1i9t5YVxg7lwyjUEdNciVrqzoe3pnvHTSLXMzfHAxcH3JFxV9
         d2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW4RlxXKk80vi7E09NNgoulTBe9+NhujgQnyTMK54X4HnV5Vmo5l+IIJSAYDL94WGiDzGt6HRytccHMvOB7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46nuHopZf/wuhltoY9Rpzo/RrlytXrtLtjnhxNrpZ5Wi1hUhu
	GPMyR94UeeHa2swvIpmBVGNY+b6DFnUWTIjwQ81m6xgftddKVZ8td9+6AHbfJFWHXoK7eE0GCDr
	DeQnFkgHVQ3gjvE6MvLkGT4hwDhnsSwhyYYi8i/r03e7ZfVBZjhXxIZbhq7Q3PAg6Wl1S
X-Gm-Gg: ASbGncuKPIZPKUvfDPXB4MRRkRlHFp7oJw4M/2v+so9fdecv11BDhR+/SyCPemM6OiS
	/5WCXaNNa7e2fKp0/8v2rxxMpsmb5bEl6i6uXM/arW+2HhqV5zEvCogfuffK96saoCW5pjB7gKl
	ButCXmRK0Ts1oaIY6zZAm9Gwx3Afk36Uk988fPSLjeRdHE+p+vduuhyw9pdr0ySjxQWV1Z9Tgj/
	kg4Ghtg0PH4B/xs02Q4cuC73tp3aeMu8GxysJG/BIJMXbMB8PICrD5+mMheAENg6nnAi3TzkCCN
	x9P6pWzrFM1NWaglqNTxIMUa8xK/oZ1/nL9CI+Gnd6lwCA0CdpDzEFzcKUd8//A2fI4JzWQRbXW
	gQ6GXZ/zclIopBZQ4gQWmk6nYLCA3NwM/tiKuLlRvaBh6DFjcySONyWPiFfQ7qC/bgkEAOQd7gT
	rqmGE6EwYmAzte
X-Received: by 2002:a05:622a:124b:b0:4eb:7a73:5c37 with SMTP id d75a77b69052e-4ed1fce901bmr3342211cf.19.1761741012742;
        Wed, 29 Oct 2025 05:30:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhCfS/Dm2Cb+iBIgEaP0oh85whr46nFpyW0rt817D+HaawIxEJB9TPLfKR3+G7zjVz7oSw3w==
X-Received: by 2002:a05:622a:124b:b0:4eb:7a73:5c37 with SMTP id d75a77b69052e-4ed1fce901bmr3341381cf.19.1761741012029;
        Wed, 29 Oct 2025 05:30:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d0028sm33087301fa.35.2025.10.29.05.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:30:11 -0700 (PDT)
Date: Wed, 29 Oct 2025 14:30:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <w4lwl34mtd7xv7it72nvomv6te2bcybisvirfdwzdazzqisd73@fvyusj6m5cb2>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
 <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
 <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=690208d5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oS8HsMxTxrPNE9b5BUgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IGS6p1CXD4-4Xu9MMkP5_wuhoM0aIi9e
X-Proofpoint-ORIG-GUID: IGS6p1CXD4-4Xu9MMkP5_wuhoM0aIi9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA5NSBTYWx0ZWRfXxa7H8U9Yi2/j
 VmXQwvZYY2wjS0JA4FlskXfenekg7HhGe2Cq3p6Ip++SUmyGJbZCQV9Rd+5lhDHOlOK4rbmxGyo
 YRi7zb1jzt6YCNTXPbVmUs4B+/776RQGk5Ows+vsQaWMIYmyRFeSeKKFqW6joPZ8xqOc31o0MXr
 maUIXC9CEWZ/pb/dW11IWbmJfsryn/jOdS/izwiEmqYyz0y7/qXgZfOFoCsz3/ZQmZlNU9Znkf5
 T6WGnD088a5ft6hfMIoE9jb9JRrK5IQ0YYC8Tk4FkDHJXS2470/9SFFJTEXr0m5RvkH9/LtIRNw
 ipMReDz7ER0xZxbA/+84T7cxA015gSgO//NscL1VAC3reDpQEvPxjN1+50rPvsm3SvjnpdRIXxD
 rv2ypc5JjjSnRv2im8JWr9tgu1/S5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290095

On Wed, Oct 29, 2025 at 10:40:25AM +0100, Neil Armstrong wrote:
> On 10/28/25 20:52, Dmitry Baryshkov wrote:
> > On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
> > > On 5/7/25 03:38, Jessica Zhang wrote:
> > > > Filter out modes that have a clock rate greater than the max core clock
> > > > rate when adjusted for the perf clock factor
> > > > 
> > > > This is especially important for chipsets such as QCS615 that have lower
> > > > limits for the MDP max core clock.
> > > > 
> > > > Since the core CRTC clock is at least the mode clock (adjusted for the
> > > > perf clock factor) [1], the modes supported by the driver should be less
> > > > than the max core clock rate.
> > > > 
> > > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > > ---
> > > > Changes in v2:
> > > > - *crtc_clock -> *mode_clock (Dmitry)
> > > > - Changed adjusted_mode_clk check to use multiplication (Dmitry)
> > > > - Switch from quic_* email to OSS email
> > > > - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
> > > >    3 files changed, 39 insertions(+), 11 deletions(-)
> > > > 
> > > 
> > > This test doesn't take in account if the mode is for a bonded DSI mode, which
> > > is the same mode on 2 interfaces doubled, but it's valid since we could literally
> > > set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
> > > in addition to the fix:
> > > https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/
> > 
> >  From the docs:
> > 
> >           * Since this function is both called from the check phase of an atomic
> >           * commit, and the mode validation in the probe paths it is not allowed
> >           * to look at anything else but the passed-in mode, and validate it
> >           * against configuration-invariant hardware constraints. Any further
> >           * limits which depend upon the configuration can only be checked in
> >           * @mode_fixup or @atomic_check.
> > 
> > Additionally, I don't think it is correct to divide mode_clk by two. In
> > the end, the DPU processes the mode in a single pass, so the perf
> > constrains applies as is, without additional dividers.
> 
> Sorry but this is not correct, the current check means nothing. If you
> enable 2 separate DSI outputs or enable then in bonded mode, the DPU
> processes it the same so the bonded doubled mode should be valid.
> 
> The difference between separate or bonded DSI DPU-wise is only the
> synchronisation of vsyncs between interfaces.

I think there is some sort of confusion. It might be on my side. Please
correct me if I'm wrong.

Each CRTC requires certain MDP clock rate to function: to process pixel
data, for scanout, etc. This is captured in dpu_core_perf.c. The patch
in question verifies that the mode can actually be set, that MDP can
function at the required clock rate. Otherwise we end up in a situation
when the driver lists a particular mode, but then the atomic_check
rejects that mode.

With that in mind, there is a difference between independent and bonded
DSI panels: bonded panels use single CRTC, while independent panels use
two different CRTCs. As such (again, please correct me if I'm wrong),
we need 2x MDP clock for a single CRTC.

> So this check against the max frequency means nothing and should be
> removed, but we should solely rely on the bandwidth calculation instead.

We need both. If you have a particular usecase which fails, lets discuss
it:

- 2 DSI panels, resolution WxH, N Hz, the mode uses l LMs, m DSC units
  and foo bar baz to output.

- The dpu_crtc_mode_valid() calculates the clock ABC, which is more than
  the max value of DEF

- The actual modesetting results in a clock GHI, which is less than DEF

> 
> Neil
> 
> > 
> > 
> > > I'm trying to find a correct way to handle that, I have tried that:
> > > ===========================><========================================
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index 48c3aef1cfc2..6aa5db1996e3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > 
> 

-- 
With best wishes
Dmitry

