Return-Path: <linux-arm-msm+bounces-53205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1AA7B962
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 10:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C677189E12A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 08:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454B919F471;
	Fri,  4 Apr 2025 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLNvxFvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F719D081;
	Fri,  4 Apr 2025 08:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756863; cv=none; b=YYonqxpcB1+xMYz+ouYmlM8/i3kxMILBiu40pKIXby3qqjfNPgB8GqxrRKRIAWKb0u/fzV8c+Hgfk69TE7FlP40q4Gb2pWAqiLKRdWtZLSzz48yIZ/Auqqra2y9Mu4VXWf1hGa1Ea095myhoAggz5pU5bMcq+xjfCuyNK9YA+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756863; c=relaxed/simple;
	bh=9NYzRZ1COzrlU7BYU5J5GjWaayrhQctCrdHr4Vdoiyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlQ5ZVrZAKLz6GHNUxPkXlWt/yGc4SZoNVsJZm0ieiSpMrOXQK1jQkChgwV9TXQVllDGHFqVgVJGYu9JcSJ4GoDxq3F3v1CHseoHdYUXTDWLV0/xfpCDf7I1jwOo5Rcxu4VGm10VoKE02HUrB5iXZwPrjUYm9P1xIdbzoqY2mX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLNvxFvD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3BBC4CEDD;
	Fri,  4 Apr 2025 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743756862;
	bh=9NYzRZ1COzrlU7BYU5J5GjWaayrhQctCrdHr4Vdoiyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLNvxFvD/kmV6TBTFpq/R0bePHNAkKVlEOJC4gcWjs7VdASkGVSXgYGS9iM/i7WkA
	 7losMYFvh0kdVbvD+3uQ0FGTkPdFusaqF+Ad3baBU6mO4TBk9Ov/UpyREtBmCRRke4
	 imjwC693PMBULfYAwPYF3dmUXO+itxyCXNQP3oqiuVVBFQeHzoKxrKfjxdPshzvbwa
	 bFeYDsgWQHdoOYxtMyEX1Ze6UVHLihXw+h8YZkdommypBguHuDXgKmQTEo967ciKQh
	 NSSLFte/Kimx9c6osf8wtCRYoi8CjDeftEx2Iw5OqZTzqJVDXyFdMBxdCkoACYyoEm
	 dnWUuYtd09i1w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u0com-000000008Lg-0zNa;
	Fri, 04 Apr 2025 10:54:28 +0200
Date: Fri, 4 Apr 2025 10:54:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>

On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:

> > > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >       }
> > >
> > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > +     if (ret < 0) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> > > +     }
> > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > +     if (ret < 0) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> > > +     }
> > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     /*
> > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > +      * correct brightness scaling on compliant eDP panels.
> > > +      */
> > > +     pn = clamp(pn, pn_min, pn_max);
> >
> > You never make sure that pn_min <= pn_max so you could end up with
> > pn < pn_min on broken hardware here. Not sure if it's something you need
> > to worry about at this point.
> 
> I am honestly not sure. I would hope that devices follow the spec and
> there is no need to be too paranoid, but then again we do live in the
> real world where things are... not so simple ;-).
> I will wait for further feedback from someone who has more experience
> with eDP panels than I have.

There's always going to be buggy devices and input should always be
sanitised so I suggest adding that check before calling clamp() (which
expects min <= max) so that the result here is well-defined.

Johan

