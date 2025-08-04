Return-Path: <linux-arm-msm+bounces-67690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE1B1A326
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DB591889FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154B825DCE5;
	Mon,  4 Aug 2025 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTSbDpVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D591D6187;
	Mon,  4 Aug 2025 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313754; cv=none; b=fbxB+7xbMMm5msGfU/mV8xXRltTolrK6Jpm8ZeG3XOo6XRqadJCx2s/FY9lFLT3y08D0XdFBdMWf1UNsv1v08/I7O6fQooZw0RdS8j53EjFrrfcC7Kdfxwpid1HGa3LZIKfnALpJyNBna6ujduv9hZKiJWuhRyV3ElqIICgoKDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313754; c=relaxed/simple;
	bh=RJusp7M7fVBPRc3I6RnHKaJXw2APU1eUnneoAuCHfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGqIR8n3udYUbxSubWMh4+yqSj0xh/R50Jm3R/IS1Nw6Ysx5gT0I/3c/E6A7lS8aHq+Zq+FbzSMHNN8LIqa5fzA0oYV2rXZZ4SXeKvIDNHE19b/e5Jweym30XnQW/HqEa7vU3EfODO2rAyrrAbRqC9F60cxjBUcGQMJXWoK+Nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTSbDpVF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF3DC4CEE7;
	Mon,  4 Aug 2025 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754313753;
	bh=RJusp7M7fVBPRc3I6RnHKaJXw2APU1eUnneoAuCHfTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTSbDpVFfyQverdP5h6h+L/eARv7PgwHA1fPzEb+1sfYSFtDQ6apJ4zv9gtBR/ZD+
	 iAXTaokpGPIBrbsRz/tgSPxBpBcpaRPF8Ep6xyiq6+w7I8kqyHu3f1XzyI78CifDkF
	 f1TyH/QMKsmcwOvD6gaivtBCQgmHat7OJGHyLHHmLrY1FTwk2kddOJ2k6MeFugQorf
	 tkACtzNTQMi5tldHlmvdKcEoQ5uzlEBRDZ3e92Obedr4IWMITEWljISZ3ieJ1FY3OO
	 Vp8Craa26o5RqsOlXGBaU+oTUz9EwxphAr8amlkmGSokE3eJdMtkw24qEk1NX//JDb
	 MydMg/hvqSHjw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uiv96-000000000wS-3LJ6;
	Mon, 04 Aug 2025 15:22:32 +0200
Date: Mon, 4 Aug 2025 15:22:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <aJC0GLAeGneb3WFR@hovoldconsulting.com>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
 <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
 <5d86adfd-e16d-4072-b5a8-4f128a2c9adb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d86adfd-e16d-4072-b5a8-4f128a2c9adb@oss.qualcomm.com>

On Thu, Jul 24, 2025 at 02:09:10PM +0300, Dmitry Baryshkov wrote:
> On 24/07/2025 12:42, Neil Armstrong wrote:
> > On 24/07/2025 11:32, Dmitry Baryshkov wrote:
> >> On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
> >>> On 20/05/2025 10:06, Johan Hovold wrote:
> >>>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
> >>>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
> >>>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> >>>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
> >>>>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct 

> >>>>>>>>> drm_dp_aux *aux, struct drm_edp_backlight_inf
> >>>>>>>>>         }
> >>>>>>>>>
> >>>>>>>>>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> >>>>>>>>> +
> >>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
> >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> >>>>>>>>> +     if (ret < 0) {
> >>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
> >>>>>>>>> pwmgen bit count cap min: %d\n",
> >>>>>>>>> +                         aux->name, ret);
> >>>>>>>>> +             return -ENODEV;
> >>>>>>>>> +     }
> >>>>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> >>>>>>>>> +
> >>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
> >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> >>>>>>>>> +     if (ret < 0) {
> >>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
> >>>>>>>>> pwmgen bit count cap max: %d\n",
> >>>>>>>>> +                         aux->name, ret);
> >>>>>>>>> +             return -ENODEV;
> >>>>>>>>> +     }
> >>>>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> >>>>>>>>> +
> >>>>>>>>> +     /*
> >>>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> >>>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than 
> >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> >>>>>>>>> +      * the sink must use the MIN value as the effective PWM 
> >>>>>>>>> bit count.
> >>>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability 
> >>>>>>>>> range to ensure
> >>>>>>>>> +      * correct brightness scaling on compliant eDP panels.
> >>>>>>>>> +      */
> >>>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
> >>>>>>>>
> >>>>>>>> You never make sure that pn_min <= pn_max so you could end up with
> >>>>>>>> pn < pn_min on broken hardware here. Not sure if it's something 
> >>>>>>>> you need
> >>>>>>>> to worry about at this point.
> >>>
> >>> I'm trying to figure out what would be the behavior in this case ?
> >>>
> >>> - Warn ?
> >>> - pn_max = pn_min ?
> >>> - use BIT_COUNT as-is and ignore MIN/MAX ?
> >>> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
> >>> - reverse clamp? clamp(pn, pn_max, pn_min); ?
> >>> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
> >>
> >> Per the standard, the min >= 1 and max >= min. We don't need to bother
> >> about anything here.
> > 
> > Yeah, I agree. But I think a:
> > if (likely(pn_min <= pn_max))
> > is simple and doesn't cost much..
> 
> Really, no need to.

It doesn't matter what the spec says, what matters is what may happen if
a device violates the spec (e.g. if a driver triggers a division by
zero).

Always sanitise your input.

(But there is no need for likely() as this is not a hot path.)

Johan

