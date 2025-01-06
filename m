Return-Path: <linux-arm-msm+bounces-43992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185ABA025D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3A63164BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 12:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647841DDC2F;
	Mon,  6 Jan 2025 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCf5WWz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96031DB951
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736167557; cv=none; b=VClkAXcj3S7bjH0I1oBrOF90d8zWdsHMzAFcAIm0IOSaKEw87CRUwRi/gphd90htJAEmocly6JtJNNhpMpNwjqBwuSni5IE1khOmflX4PmwdyFOyUsaMUjgALsrmIA5Zmg3GxNAWjpCHfX/ekn6KmiD7zXQTvN/uv3KzIlSUzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736167557; c=relaxed/simple;
	bh=fd7zdlxTAGFRBS7rqsaz7guw5qHgt0UMqK/lopJACT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0yXmd9i0K2M+WCIHMJAvJvmvF4U5hefTAYklSGBOPEY3hqlwihFYPQCRdjxqxHVd5ZYMZOo4gNh/3cLTYRoAeWoTdASn5QFG4NgrdKHiyW6RbZ3TprP/JsGQFyi9kiwgVFtOY0lJ4MYgs65BZyMVTdtguT3yLWwnmcHzellyEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCf5WWz8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so6928841f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 04:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736167552; x=1736772352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
        b=SCf5WWz80v4RQr1XHjrA0yKWGzYLavXAfbQXQ+5h68kG5hpzqyvJYK00kgiyh+G6UU
         A0VI9BlZJc84L8fFXUBty0oY97hsJ1KTwPzAF5tHpzpfgQbaCQAEt+YUBf948capUvXU
         Zb/ISigP+7YBcwB8zakEf4nbv7NYaScD4j0Fwueht/6TKHIlPsMVy1aXj/AB74Hh6gjL
         Gl9fUESZu62zpT9g9b82HyNlkaB/Me76GndsAVBZFz59JjqzRhpT8WkdUzh+WGS9p7IE
         sQx6FNStGknBl5i7KJsLhKPUM+w+PVsaTfd4hl2SpW9w3rsYqWDMLDPDXzQvFMnfGcM2
         MffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736167552; x=1736772352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
        b=rk1zhwTsCXtgh4lNXrrbc3nYqwzZVkRillVf/pFOmUuJGNGuO+UOl8Gk4419+VMOO+
         EMLXOyvLd+wEozj3UOWYHZUaA38BZfUBbwo9DUipBZ4gdWDceyNJLZyNVk8kYsZZZ6wa
         wtLF4BzGC0ERJBtK6G8Ln6FI8e77H6UK+Bmu1SglZ9IfdsU9hYWZtrutphF3g2I587ce
         OOsS76WSPhNio/szti2ul4Lqz+lnS3MzmIReir1/FYo5NRScqBRn/byoApszWRdGIQNn
         WTCZJ/CqnK6Jrt0U2YmI6tafflVHz7JW5YEEYngV0f875bOZ5jAdvxQ7MvXV6VPtQEd7
         147w==
X-Forwarded-Encrypted: i=1; AJvYcCW3e55/lRTWythuTrmPX7fRZi3o9yQ2jxCN9slJAtDEGM0ztGJBaQcDo2RmaMMn+V6uJ4/z2lRe894SHk2S@vger.kernel.org
X-Gm-Message-State: AOJu0YyDsaIOFBmQWx6PFJBaNSWnzIiLaO4GBuUXxRU5+Ai1GFNk0ast
	/k3htcokHoY1xCcH2YHm0aO3yGRlzmRCdWOmTMOR5uwOMCuJHXMlR6G5EO14XSs=
X-Gm-Gg: ASbGncu1ragU3X10hRR6yT77OZV94NQG+IJbngDZTZOstXHBeoWLYIzDFaRb/zesK5t
	6MDSBvwP+x6lWtZsgNrKlqjXXz6noUjUdR+0gqaAeZBy0AAqaOCubH3t1KXwXXnMEznPxYT4hlO
	rHgDFQ8GGnZdambZBr86IVojBEFzPHtjJa9LkCgOa3PESebpQxZAFS+mCOxwAoCMSm9Pu/ZS9jx
	rwfohivylSb3aCeJb92F7TjuqwLu04sreviWEs66IdEVpHgqoNDuR0=
X-Google-Smtp-Source: AGHT+IGPXXCGpVVL8gkklF9ZQV+if58UuE9ZivrnPJUbIt2RzTzppNgGN6AJ5opvpHjGWhdKOASxmQ==
X-Received: by 2002:a05:6000:4b07:b0:385:fa20:658b with SMTP id ffacd0b85a97d-38a221f6135mr46513894f8f.24.1736167552118;
        Mon, 06 Jan 2025 04:45:52 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm603466965e9.38.2025.01.06.04.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:45:51 -0800 (PST)
Date: Mon, 6 Jan 2025 14:45:48 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <Z3vQfIIDDgnFJsDn@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>

On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > LTTPRs operating modes are defined by the DisplayPort standard and the
> > generic framework now provides a helper to switch between them, which
> > is handling the explicit disabling of non-transparent mode and its
> > disable->enable sequence mentioned in the DP Standard v2.0 section
> > 3.6.6.1.
> > 
> > So use the new drm generic helper instead as it makes the code a bit
> > cleaner.
> > 
> > Acked-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >  
> > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > -		return false;
> > -
> >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> >  
> > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> >  	int lttpr_count;
> > +	int ret;
> >  
> >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> >  		return 0;
> > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		return lttpr_count;
> >  	}
> >  
> > -	/*
> > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > -	 * non-transparent mode and the disable->enable non-transparent mode
> > -	 * sequence.
> > -	 */
> > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > -
> > -	/*
> > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > -	 * non-transparent mode fall-back to transparent link training mode,
> > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > -	 */
> > -	if (lttpr_count < 0)
> > -		goto out_reset_lttpr_count;
> > -
> > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > +	if (ret) {
> >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> >  
> > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		goto out_reset_lttpr_count;
> >  	}
> >  
> > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > +
> 
> I think the code now misses a way to update intel_dp->lttpr_common_caps
> in a transparent-mode case:
> intel_dp_set_lttpr_transparent_mode(intel_dp, true).

It is being called if the drm_dp_lttpr_init() returns a non-zero value,
but that is not part of the diff here.

> 
> >  	return lttpr_count;
> >  
> >  out_reset_lttpr_count:
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

