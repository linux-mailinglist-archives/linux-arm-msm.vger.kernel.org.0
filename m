Return-Path: <linux-arm-msm+bounces-44686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734DBA083BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 01:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A9433A1BEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6E25028C;
	Fri, 10 Jan 2025 00:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWECsQMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49AFC1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736467244; cv=none; b=YWqAbRbZLX0a2KmPC1hdXGVG3yDSC48fpwqEIpXtDnAWWPnvxtxVpEtaBMCKS9+5kwK72Xyrt2UK7/P95AaM932fBW3UEh4e05jpYvwWHFbFr8moMSQDBWNZbG8qMtHWhEDhymkhBX58OfDJHNxwpScnClsebJ+Mwx9oJZ4t+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736467244; c=relaxed/simple;
	bh=9IACV5z/CgubkMSnp3SOw1be+ZWd2t8hgmJedpX7mCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3yvmMOCg0a3MDKxg4W9m9n22yZnvNuEXOQuxi4HR5JZqyVKyFATUbTKTEDlDGEeRfZglg3A/Gyp9VsjK7yRcniwBN8Z168/ahEjHVly+b3Kp9c5XC8vc0Qg9NrKuTVKuIwoNMXxo2YGR8LEZsKiMTEi48zhTCAXnJj/GC1lWm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWECsQMJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso17096601fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 16:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736467240; x=1737072040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V89tZmVrHGFuPql+PBulxt76Abvyv1smk3+78i/64eA=;
        b=FWECsQMJDXvcaxo1oFU+8yeBrN8ITlTg6mpS8FnnLkz7Vj4LA6oVduK5B9XqhQDyAX
         8pzzd2F3rzjSPqArByaz1TfdrbfI6gOA257mUrNEY+wMb84PAn+kioiKA6IiBNqUhZ5C
         Jnb+pGsAFmN2dMyqEq2hcWdce2on4dGDtwLBm60toxLE1TXp1zDLVMhlcFjnT3uIeP0T
         ScaM6d2d7SmCxpEyYqadLfA/eCLLysqSFgS3W+a1yA6zRU0LqlpYvO2Af2VFdY/lvzDz
         YcoHryLn7J8Oh/l5/lHjGpHQSbx22x/RqkbVD6ZZGPHbV+NukdAGrqea9quk1kTOXL+X
         3UhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736467240; x=1737072040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V89tZmVrHGFuPql+PBulxt76Abvyv1smk3+78i/64eA=;
        b=XhGq+AJQJVx+rXR17TYLsvPNUlcyA0xR2y10IZfLiXpryFKJhQ830z7+52datEdGYY
         x2hA2l+DLsr1RlciJVMqtjyinaf9xM8oQwRY1AanySqz9Rwj/XNRZFkkKySDsUXYgm+d
         1tjelwI9VYCXPQ0TBjHVJrCUqQlrt85mUiF8e4EGoPVGQH7gl4jJ0a7OUJCcbbbr9wQo
         d3Z1eDiCV9FNHoo+/Q+JhPaOAvl9QXqcbrRylkgJhNhZTMqkvUS/V3VWxf7pgT82RAch
         4/ADoLsDGIu8h5RqMyVZ4rNrL9W10og6+gnrpyMPdksBOSHZ806YHetNenGeyFdHotcT
         Wjuw==
X-Forwarded-Encrypted: i=1; AJvYcCUXQeYU8TrrxCNE13qqvmugwnpLfRL6Wv83EbRPYBh3t/bsCZJNIzbrwn7q11dSigQU3LkLmZbX6DHY7pEZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Met/m+/BS6PuIC/7t1zFN/a8AoR8Gr2AivIMkVhaUSV1Sm2m
	Zo4PZivI6bYEy0ZNNrlEKqM4fp1ghm4CRr6DbSVB1WNRaBR6eKtEyuHbI7aXA7zGd+QSHNY3r38
	0
X-Gm-Gg: ASbGncsUvNB2hlSWRXHMIclpnb8t/j4KGChrg/aQBeepI72ynAq0NH6u/SXAS3aBOZI
	+PzwC7rH2hd0Ny3Od75ZeP0tZ/xONfYp5g5sR+FWD9+5zp0rIwztRfdHIXsVPKy3ZgdbxKhJnel
	Hmo7TFuTIC0vyN+Pp5q2vQOuTNS84FH3+/fVE+iC80dX5KIifA9/I04NVGzm2kqC1DesY4zhJRd
	hX9hvDvecBDQfmYEAqX2Abggv06X1n3QE+6rTa99zziZOj9j++ikLRIxfxBFHSde5rrYfXsLH/r
	3knbg2ytHBf1els6MplOTUnjbxWE3X9jHVHe
X-Google-Smtp-Source: AGHT+IF1kMl3/8tplC3d3ceeZdPyxdOdcXWi0l4AL0IfJYyKy6rFEmO45OwPi0QlXvFa+z23H39rUA==
X-Received: by 2002:a05:651c:50b:b0:300:34b2:f89e with SMTP id 38308e7fff4ca-305f45747b3mr28788641fa.17.1736467240081;
        Thu, 09 Jan 2025 16:00:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4ecsm3364311fa.103.2025.01.09.16.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 16:00:38 -0800 (PST)
Date: Fri, 10 Jan 2025 02:00:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <wheu3izj3pit6k3cmslpyegunmrcryy65y5eu432nec2y2aor6@kda3xnujhtnm>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
 <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
 <a4akor2liqafta53zeev22x2pkqwzo5szwidr2ruzdvttvze5h@jtio3jue7ez3>
 <e47b33e6-142d-42d6-8ae9-f2d2c7793d18@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e47b33e6-142d-42d6-8ae9-f2d2c7793d18@quicinc.com>

On Thu, Jan 09, 2025 at 02:34:44PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/3/2025 10:16 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 03, 2025 at 10:03:35AM -0800, Jessica Zhang wrote:
> > > 
> > > 
> > > On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> > > > > Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> > > > > to account for concurrent writeback
> > > > 
> > > > Why?
> > > 
> > > Hi Dmitry,
> > > 
> > > This flag is necessary to specify that CWB mux(es) need to be assigned for
> > > the given reqeusted topology.
> > 
> > Why is necessary? Please rephrase your statement (we need foo bar, so do
> > baz).
> 
> Ack, what do you think of rephrasing the commit msg to this:
> 
> ```
> Add support for adjusting topology based on if concurrent writeback is
> enabled.
> 
> Currently, the topology is calculated based on the assumption that the user
> cannot request real-time and writeback simultaneously. For example, the
> number of LMs and CTLs are currently based off the number of phys encoders
> under the assumption there will be at least 1 LM/CTL per phys encoder.
> 
> This will not hold true for concurrent writeback as 2 phys encoders (1
> real-time and 1 writeback) can be driven by 1 LM/CTL when concurrent
> writeback is enabled.
> 
> To account for this, add a cwb_enabled flag and only adjust the number of
> CTL/LMs needed by a given topology based on the number of phys encoders only
> if CWB is not enabled.
> 
> ```
> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
> > > > >    3 files changed, 20 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > > > >    		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> > > > >    					    &crtc_state->adjusted_mode);
> > > > > +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> > > > > +
> > > > >    	/*
> > > > >    	 * Datapath topology selection
> > > > >    	 *
> > > > > @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > > > >    	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > > > >    	 *
> > > > >    	 * Add dspps to the reservation requirements if ctm is requested
> > > > > +	 *
> > > > > +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> > > > > +	 * enabled. This is because in cases where CWB is enabled, num_intf will
> > > > > +	 * count both the WB and real-time phys encoders.
> > > > > +	 *
> > > > > +	 * For non-DSC CWB usecases, have the num_lm be decided by the
> > > > > +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
> > > > >    	 */
> > > > > -	if (topology.num_intf == 2)
> > > > > +	if (topology.num_intf == 2 && !topology.cwb_enabled)
> > > > >    		topology.num_lm = 2;
> > > > >    	else if (topology.num_dsc == 2)
> > > > >    		topology.num_lm = 2;
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
> > > > >    	int i = 0, j, num_ctls;
> > > > >    	bool needs_split_display;
> > > > > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > > > > -	num_ctls = top->num_intf;
> > > > > +	/*
> > > > > +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> > > > > +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> > > > > +	 */
> > > > 
> > > > Why?
> > > 
> > > This is because num_intf is based on the number of phys_encs. Since in the
> > > CWB case, the WB and real-time encoders will be driven by the same CTL. I
> > > can add this to the comment doc.
> > 
> > Why are they driven by the same CTL? Is it also the case for platforms
> > before DPU 5.x?
> 
> This is because the WB and real-time path for a given topology would be
> driven by the same data path so the same CTL should enable the real-time and
> WB active bits.
> 
> This is the same for pre-DPU 5.x.

But pre-5.x platforms didn't have ACTIVE_CTL, so they should be using
separte CTL for each of the physical encoders.

> 
> > 
> > > 
> > > Thanks,
> > > 
> > > Jessica Zhang
> > > 
> > > > 
> > > > > +	if (top->cwb_enabled)
> > > > > +		num_ctls = 1;
> > > > > +	else
> > > > > +		num_ctls = top->num_intf;
> > > > >    	needs_split_display = _dpu_rm_needs_split_display(top);
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > @@ -46,6 +46,7 @@ struct dpu_rm {
> > > > >     * @num_dspp:     number of dspp blocks used
> > > > >     * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> > > > >     * @needs_cdm:    indicates whether cdm block is needed for this display topology
> > > > > + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
> > > > >     */
> > > > >    struct msm_display_topology {
> > > > >    	u32 num_lm;
> > > > > @@ -53,6 +54,7 @@ struct msm_display_topology {
> > > > >    	u32 num_dspp;
> > > > >    	u32 num_dsc;
> > > > >    	bool needs_cdm;
> > > > > +	bool cwb_enabled;
> > > > >    };
> > > > >    int dpu_rm_init(struct drm_device *dev,
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry

