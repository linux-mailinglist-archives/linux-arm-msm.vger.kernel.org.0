Return-Path: <linux-arm-msm+bounces-44375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4747A05C63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6974B18882BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F7E1FA8E8;
	Wed,  8 Jan 2025 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8yTxFUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70601F3D53
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736341917; cv=none; b=aLSkhvD2aWQkQFNMgWoRBxao/7pFOKQBmVp7A8tvSDmFJCCRBk8ZydiHaUZ6i1KrgnKI+S91IGC518jOcCEGOpcB1zsi0ENjW1wu5iXxxz1J/rPQ2WWTnX7mRcQo4H2Rc8d5ypljzZRon7JzjvcZoN107o8d0ii6l1AIqTlSVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736341917; c=relaxed/simple;
	bh=Aqf+ngn+ET/PIXNBEtCpIh2B9NyO+ZeNDxMFly2gLPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HorK5k7Zuze8U9JRyfRUVi3QEP6SY5elGREmotqGe7b5Yeb/trzer/b6R/N/ANsGPVjAw0VskH7ndTcN1HaTYjs/WwZgU8BhogB6u8sZryQj/eu6tNInHHvGqIN/hRvGejg/SHuBWjZuOqsDZbY99tsvq2ueF98cZPNyuxFewy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8yTxFUu; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a227b82so15108425e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 05:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736341914; x=1736946714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRFucKupJRi3JrfmGRRAwshOALuZUCh2srHJV4yPz/M=;
        b=M8yTxFUuxhlQVZhWJ9/O/7Lef2mxl2llmNhzlNDFsoHs88wL3obljyXxzpDs9Qf17k
         6V5mQaXHDdUlHTpaoqrXb39DlS+R1/blMNVllpIE6H7UAM44+F6he/jg6/h1eZe3Isxi
         fRrLnAeS/xqXE74bdCDmRVILj24W7xshsSn3pr7i0sGuC992jJTr0qrcNWGcHv65YZLR
         e4uI4l1KsIl46Vdv9c3sg9KhzPR39/Vdht+wi1UOi02yL1qgX1le5DpX87XnQC3OUC6H
         LCSkyTCcLqTlYjV/ZMIIJijW7r7poqPPPN3kSyn6aq12puNR9R0qMNefMeJoAGzJ8brY
         9YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341914; x=1736946714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRFucKupJRi3JrfmGRRAwshOALuZUCh2srHJV4yPz/M=;
        b=whKLLnKW/F6dINy7467KPv6v14spchxFCVeMgyhs+qso7Lkv5dG0Q8taiOnP0xvKCb
         MoxlmQE5J98uFGEQZDgEoI1j4NR8uHgYll0JbA7LtMY+RMzjjPT+U+MY02Jg9O+1Ohdu
         vAYePvi7BTMq1Ediz/0VeLl8QrEOl92x3I7lCctC2SQOM/VbLp9/rd3fKI2oTUvDkOeS
         020hIFpjW5gp9QzoWBnXwJif9/lX4LqnN/dbVNb10H1IWFZlxW7+50s8L7I07beQQ1aQ
         I47RUOya2D7wG6VWmXAo4V1y0WuZA3rOyqQSFJtjaHua5HxDB/33A4+bghCmnAdqpdYA
         77Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXAYXIeI9F96PAywkb0LN1lJ+KXvSeif1MrdXjcR5/y+Lrq85JrfMCmEjPZx9INVjLnEmZPWmfkCsRdBOIE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ei3ouvVlGDWEc1ekhxKiT2RCevnucqBfL+Ii8XYQvQN+VLKU
	m4bOwnL7HCQwza5MBH8UTgCQWR79lyEmYI8KBElUipmmm7S1EZ97BTBUxCzXyCo=
X-Gm-Gg: ASbGncvO05pU1lbGwo8phxCFF06hTHJ9xUoDXOJ6onmk68nKVB0I7PWjr3vXwQGOBkX
	U50sZtIDUjrCXXNmjcVVKp8sB/0KJA7aoDfQWLhEG/RcQp+40eveAKBrN1bFDefVE+SGTl3HGlu
	VIQh8bOqJ/eDrUI/eEHyxovUFNF8ExhNw/UivEVG8vAwOdkyqioJHMNqDGtjDXMd1M9t3HddKOX
	rJXNYlmbCdxmf34Ie305XHJSRdSMpijuIJnFOiYr5gH1ldXkIuW7+AucbzftY+sshX9nJe/3UTo
	fFD2YL3c1JNwqaKaRSGF40RcCJuxunrTDQqa
X-Google-Smtp-Source: AGHT+IH+8M6pwb6Rkal5Oy3icsCCUmDzxSkXtYlmI/444nM3KABxABMYN+TTayrP+FqimK/xSMwSqw==
X-Received: by 2002:a05:6512:acf:b0:542:63a8:3939 with SMTP id 2adb3069b0e04-542845a6f01mr769532e87.8.1736341913844;
        Wed, 08 Jan 2025 05:11:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm5581695e87.247.2025.01.08.05.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:11:52 -0800 (PST)
Date: Wed, 8 Jan 2025 15:11:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <enzj72vy523bvlphbygxn42zocvhx24eghreffzrthomhy5jxo@2l4h345h7ojl>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
 <Z3vQfIIDDgnFJsDn@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3vQfIIDDgnFJsDn@linaro.org>

On Mon, Jan 06, 2025 at 02:45:48PM +0200, Abel Vesa wrote:
> On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> > On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > > LTTPRs operating modes are defined by the DisplayPort standard and the
> > > generic framework now provides a helper to switch between them, which
> > > is handling the explicit disabling of non-transparent mode and its
> > > disable->enable sequence mentioned in the DP Standard v2.0 section
> > > 3.6.6.1.
> > > 
> > > So use the new drm generic helper instead as it makes the code a bit
> > > cleaner.
> > > 
> > > Acked-by: Imre Deak <imre.deak@intel.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> > >  1 file changed, 5 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> > >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > >  
> > > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > > -		return false;
> > > -
> > >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> > >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> > >  
> > > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> > >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > >  {
> > >  	int lttpr_count;
> > > +	int ret;
> > >  
> > >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> > >  		return 0;
> > > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > >  		return lttpr_count;
> > >  	}
> > >  
> > > -	/*
> > > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > > -	 * non-transparent mode and the disable->enable non-transparent mode
> > > -	 * sequence.
> > > -	 */
> > > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > > -
> > > -	/*
> > > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > > -	 * non-transparent mode fall-back to transparent link training mode,
> > > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > > -	 */
> > > -	if (lttpr_count < 0)
> > > -		goto out_reset_lttpr_count;
> > > -
> > > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > > +	if (ret) {
> > >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> > >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> > >  
> > > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > >  		goto out_reset_lttpr_count;
> > >  	}
> > >  
> > > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > > +
> > 
> > I think the code now misses a way to update intel_dp->lttpr_common_caps
> > in a transparent-mode case:
> > intel_dp_set_lttpr_transparent_mode(intel_dp, true).
> 
> It is being called if the drm_dp_lttpr_init() returns a non-zero value,
> but that is not part of the diff here.

Ack, thanks for the explanation. I'd suggest mentioning that in the
commit message.

> 
> > 
> > >  	return lttpr_count;
> > >  
> > >  out_reset_lttpr_count:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

