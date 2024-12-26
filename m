Return-Path: <linux-arm-msm+bounces-43370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 661399FCAD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 13:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D001882DEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 12:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF02E1CEAC2;
	Thu, 26 Dec 2024 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7XB8eSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC351D357A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735214993; cv=none; b=n8dcI5ilWXp86Dxs88BnED/XW1gNIJoWptIDipIcfRlzLKbFrkSoAKog7uO1LH69BwMLYUMfGegfLhslCSXGXsT8ouJzmXdrkizbm0UmGl54yf6/Et4hRQFkoESER/JaKAe2UNCkjc1BUPjvGaOZ1/oNbTtR3AbwgUGsOCcoMFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735214993; c=relaxed/simple;
	bh=PX0BTHSpAU0RgYKAPrHiU3ux6VgUOu7WTStvXJfqFnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wa0R7mHTW/Hichkjgzm5Dz6ON52DgxtZ5OHlHx5Ya08SVDx5HTXqCM8aKLC4yDE2slaJjgA8JsHQE7nvOm30gKDSyBwu+jk+QpJocIB5WCNxSBTH3ctrw+VtGVyJF7IcfZ89dq27zSk89f7eWm6wATzvA7oQaS0uwDYZj75S0FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7XB8eSz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso4895653f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735214990; x=1735819790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yE0d6/fT2fHAjzAIYMLLWaXzKg6hYqakVFryoy6JvQ=;
        b=E7XB8eSz5Lmvlx9kPlcBUnznkOpCQQFtE4xLrBWLdFSenonS5qZPU43quXWYxDAlMB
         03yKAkixeJxfMYjzMfTt703uEt8PddGHzbHRJ98qWyWaC/6C64qyT8HLz/q7Mlbxqora
         P9UfRMWr3y0f3KZVKLkDp13k0cJe8gLJ5t3R8JYkWbVZ485SFmzXQ/UICbM3PnP6ypkF
         on/axKVV0o8acjQPhdGFRoIB4yez/uocXcwnwl67BnDr09Uj5XRKC/lxSbb7HGGCl47C
         YModTUIrXYKv51UW44tNu7PPki6qJClsCkqmkWtYvJ2rvmTnPaZmOp2IsdNS43dmncIH
         egJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735214990; x=1735819790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yE0d6/fT2fHAjzAIYMLLWaXzKg6hYqakVFryoy6JvQ=;
        b=PDt2/lste9RNOjyNPfYzFLFCLwsTTHLNecyWzxecjRA4bm8nlUBS1X3ijH/CXxlMc0
         mlFTjp+IbFP0RCEH3IByjNCjIq/anazZgHW30lJBhJJ3xXatX7dnRyXeUD9hb4cJ0Z5G
         r7l/+043y1jhuYn/jsS/FsjQEIyPL7Nx8qRnm9a3j0sxANOWz7Y/6rTwFQx73Qsvu7lt
         EWxDOb4ahFGkhYsEFJTnCGJJZS3UeuKsXIFuAWaApVF3M4JnRhLW8Pga6u6WnWrUPHk/
         EpqlTiTTrkN3CkGh/mLk5WCex7vwBsyvNvKAWADRcDrQbDAeyc7go3vlLX3sMSL1xJPo
         Y4mw==
X-Forwarded-Encrypted: i=1; AJvYcCWHHJLEpAJ+cRe+Sg2m6RFMlakJ8yS5wCK1B4yY/sMrnV7ttLlhtVZbcguL8XUQ0PLU+A5aEF3yvGFrUzm2@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2codR7Z2kfQgtuUqNjO0uROmzMZXiZUqpuefHrgIvB0Hqn6e
	I5zLzLrE6jcKSeULr4Ekd0yUpc6g7IrjgahS8EPEjqzhxNokSN7WcdSIXbauMvk=
X-Gm-Gg: ASbGncvE/zb8zPLPjwGJVnjQ1k1C+sGMc/ldFPrkOr2f/cPMitj9EzMTB+cg334ZlLM
	eCxG6/k/sgzj51YYaDvkyoYAh7PdGawxlBKHOnewrmouSD5031Ols5Xb97I+tyqdCQHccVDEiji
	I/ldTkLBeJ1uHjnuiWJc/yN/gHyFUy120Dbpn1TnipUUqhdlGgotP6M2Lb5QMssL+fr2Lzpyz7d
	Bd+Wtk3gOZ6QxpuBB7lMxqndo9JRYi9tRl/tJngXIDQubACGkXDIes=
X-Google-Smtp-Source: AGHT+IE7Mzk62uTd4yycH28u5xCSB39eiD96qbQg0fIjJMfiTxkRYB+ECRA3AUQrSJ8HACLT9c1tFw==
X-Received: by 2002:a05:6000:400b:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-38a221eab74mr22082237f8f.20.1735214990215;
        Thu, 26 Dec 2024 04:09:50 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1cesm19043982f8f.64.2024.12.26.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 04:09:48 -0800 (PST)
Date: Thu, 26 Dec 2024 14:09:46 +0200
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
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z21HimmBvwwA7/KD@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>

On 24-12-11 21:22:00, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > Add a generic helper that allows switching between these modes.
> > 
> > Also add a generic wrapper for the helper that handles the explicit
> > disabling of non-transparent mode and its disable->enable sequence
> > mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> > to move this handling out of the vendor specific driver implementation
> > into the generic framework.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 52 insertions(+)
> > 
> 
> 
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> > +
> > +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> > +		return 0;
> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> > +	 * the number of LTTPRs is invalid
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> 
> This means that if lttpr_count < 0, then there will be two requests to
> set LTTPRs to a transparent mode. Is that expected?

Yes, exactly. If counting the LTTPRs (see drm_dp_lttpr_count) results in an
invalid number (e.g. more than 8), then according to the DP standard,
we need to roll back to transparent mode.

Do you think I need to re-word the comment above more to make it more
clearer?

> 
> > +
> > +	return -EINVAL;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> > +
> 
> -- 
> With best wishes
> Dmitry

Thanks for reviewing,
Abel

