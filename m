Return-Path: <linux-arm-msm+bounces-88883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1416D1B536
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 22:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81DE1300EE40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 21:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C437320A1D;
	Tue, 13 Jan 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEDuiNCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE1239E76;
	Tue, 13 Jan 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338001; cv=none; b=gmdg+0Gpl0gbT20bO++4O6nQZn76hAT+bRbzxx1pacsLpIhb0J6LT1t7V2MwUdB72EVRFeDbjBYLZYF1Bz18xhqwzQ38gsH5249j9vF2DawZRkjrPCJWnIZr5jmSbMuMnux47ddHGNlevh1ENnuEI+HU8bPjsQE87XSVrktnaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338001; c=relaxed/simple;
	bh=lmfFO/unuLH4tjf+bCfXXy7t0C9+nXei62nDVi+zFSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzRoZRhwB7HD2nZmhvumIjTTNX2MECwL6QpTKnPBSImljVgdIOa7dgfHbIj0Lrtxv5uJeOYO3zF7XuHWHxq5qRE0PUZVQ2RMCQhB44xq/Od0bCQCxoeTdCaph/1SUERA2SpCdrEZUkQpVnCckcUkMmxliGs56VvV+shfYmOvbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEDuiNCX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A4EC19424;
	Tue, 13 Jan 2026 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338001;
	bh=lmfFO/unuLH4tjf+bCfXXy7t0C9+nXei62nDVi+zFSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEDuiNCXzya7A8DKIJ32AJwqUd0yNt0iDY+qLZUoiFvM313srKdajF7oGN68V9Fhk
	 NinwQXuPp+Ma1SBYaSZvrdmfARNX9iKg/YVh1ZXVSN7BiT957ficuyPp/n+tkU6bz6
	 41LGxaju7XHbQGw1bUP23iUu4AqH9fOKdsZzKFwI62a6Z1AWG4tW7EJ0FOnpnFDCnJ
	 yxXL9k5ANzDHdXuBd8EtWKaKSVe4RCG5URbjPhQFnuqp202nPjBpGIvfQJwtUy+XUH
	 Q/8kwR5ShaFNkTFBHXGJ6Jtq4JZGSDSNLhoQUjsroKrJLA16+QgS0B0OszEMRW5Z3T
	 I1I6yGKZyK5IA==
Date: Tue, 13 Jan 2026 13:59:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Message-ID: <20260113205955.GA2893481@ax162>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
 <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>

On Mon, Jan 12, 2026 at 04:37:46AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
> > Dmitry, would it be beneficial to throw an actual error when the rate is
> > is mangled? i.e.
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index aa2303d0e148..4f710b8e6bc6 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
> >         return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
> >  }
> >  
> > -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> > -                              u32 rate, u32 stream_rate_khz,
> > -                              bool is_ycbcr_420)
> > +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> > +                                 u32 rate, u32 stream_rate_khz,
> > +                                 bool is_ycbcr_420)
> >  {
> >         u32 pixel_m, pixel_n;
> >         u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> > @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> >         u32 const link_rate_hbr3 = 810000;
> >         unsigned long den, num;
> >  
> > -       if (rate == link_rate_hbr3)
> > +       switch (rate) {
> > +       case link_rate_hbr3:
> >                 pixel_div = 6;
> > -       else if (rate == 162000 || rate == 270000)
> > -               pixel_div = 2;
> > -       else if (rate == link_rate_hbr2)
> > +               break;
> > +       case link_rate_hbr2:
> >                 pixel_div = 4;
> > -       else
> > +               break;
> > +       case 270000:
> > +       case 162000:
> > +               pixel_div = 2;
> > +               break;
> > +       default:
> >                 DRM_ERROR("Invalid pixel mux divider\n");
> > +               return -EINVAL;
> 
> Well... In the ideal world, we can't end up here, PHY's
> configure_dp_clocks (or qcom_edp_set_vco_div()) will fail if the link
> rate is is invalid here. I think, we should return an error here, but
> there is no need to propagate it further.
> 
> See the discussion at https://lore.kernel.org/dri-devel/f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org/

I interpret that as approving of the above hunk but omitting the hunk
that modifies msm_dp_ctrl_on_stream(). In that case, what is the point
of changing the return type of msm_dp_ctrl_config_msa()? Wouldn't the
below diff have the same exact effect as a smaller change? I don't mind
rolling this up as a v2.

Cheers,
Nathan

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index aa2303d0e148..d8ea73b89f7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2409,20 +2409,27 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 			       bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
+	u32 mvid, nvid, pixel_div, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
 	unsigned long den, num;
 
-	if (rate == link_rate_hbr3)
+	switch (rate) {
+	case link_rate_hbr3:
 		pixel_div = 6;
-	else if (rate == 162000 || rate == 270000)
-		pixel_div = 2;
-	else if (rate == link_rate_hbr2)
+		break;
+	case link_rate_hbr2:
 		pixel_div = 4;
-	else
+		break;
+	case 162000:
+	case 270000:
+		pixel_div = 2;
+		break;
+	default:
 		DRM_ERROR("Invalid pixel mux divider\n");
+		return;
+	}
 
 	dispcc_input_rate = (rate * 10) / pixel_div;
 

