Return-Path: <linux-arm-msm+bounces-43673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E089FE93D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 18:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9DD3A22C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9698486334;
	Mon, 30 Dec 2024 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MK+ZDF64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317633C9;
	Mon, 30 Dec 2024 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735578034; cv=none; b=Gd6MmeBAsakhi21uCQflKNM2kP/eP4YyQhMSqfdXRsdDEqBV1RiTIpiLJx/7XsR58wHkf93DAjQX1Tj3KTMCP41+K1S9RQ69TuQvUoDdmQLDoIKZdE0AqM6OXBT9TzgcjD1xDz/2qlJqiumybwUiaNdwT6YkKsP7Mfj4S+Qpg40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735578034; c=relaxed/simple;
	bh=bUO71XDJiq73wjQcZpelQaLVs++bipFpNXwVT+JL3c0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BilqkIpADOocSimiBCvBEosBqgyZhBgheaaRyUQV5y+iSjk48+/VtcMCMRWHntfRpeTYtcBUjMOJYObPKouVz1oPGwPrs0x3I2anSUpuasyzSWd/6KwMzocncEQiVDpxLrL7h1RG1FYD9+vX3cDqsMhs+BHVBUUDAzJuUxQIlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MK+ZDF64; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735578032; x=1767114032;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=bUO71XDJiq73wjQcZpelQaLVs++bipFpNXwVT+JL3c0=;
  b=MK+ZDF64RpNad1Tgvvc5D/l5Kvq/OLBa1MjnQZdwsFifBp8bqa9n/l3o
   1jcepFnWycnU/uUnmCEmeOM+LHdrD3oC1A/6u5XoHwxg8MRg1+iKEUL0b
   HSrc+gOkyZSjYyW9qLGGzO0x429VqbW3hcCL2bgPj0ALL0Jnzy0Aq0fgv
   +tKcLFUbimfLbCAcbcnOHQ0UgpSkME40CDmOK7y8JdiyA2HaUpo8i1dLL
   su7EzGhLs08+sUa33Emv93oA+sIsEdIxqUT9J80Pxe21yRG/5ML7N76vX
   CDrb5RqThVSO4oB+YDijcmpSWSv5emM8oN0IMHVtJ9CuGw63n0zq0eBp3
   Q==;
X-CSE-ConnectionGUID: jRUPFZMER2yVp1BUZtWAlA==
X-CSE-MsgGUID: Gy920CR5S922J3STdLqR6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35174348"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35174348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 09:00:29 -0800
X-CSE-ConnectionGUID: Er8FxBBlTt2HLYTUJsAM5w==
X-CSE-MsgGUID: 7rPfMjAqSCqhf2hQDBs1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105469494"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 09:00:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
In-Reply-To: <lnbvudvkvgifbjmscgrvv5hkuescyqz57y6m2pydphyq2ubrhg@aynvaqlu7jz3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com> <Z21VD82XCOVgVJUh@linaro.org>
 <877c7hpavo.fsf@intel.com>
 <lnbvudvkvgifbjmscgrvv5hkuescyqz57y6m2pydphyq2ubrhg@aynvaqlu7jz3>
Date: Mon, 30 Dec 2024 19:00:18 +0200
Message-ID: <87y0zxnm1p.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 30 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Mon, Dec 30, 2024 at 03:18:35PM +0200, Jani Nikula wrote:
>> On Thu, 26 Dec 2024, Abel Vesa <abel.vesa@linaro.org> wrote:
>> > On 24-12-11 15:42:27, Johan Hovold wrote:
>> >> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>> >>  
>> >> > +/**
>> >> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
>> >> > + * @aux: DisplayPort AUX channel
>> >> > + * @enable: Enable or disable transparent mode
>> >> > + *
>> >> > + * Returns 0 on success or a negative error code on failure.
>> >> > + */
>> >> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
>> >> > +{
>> >> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>> >> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>> >> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
>> >> > +
>> >> > +	return ret == 1 ? 0 : ret;
>> >> 
>> >> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
>> >> sure it never returns 0 (for short transfers).
>> >
>> > Will follow Dmitry's proposal here.
>> >
>> > 	if (ret < 0)
>> >         	return ret;
>> >
>> > 	return (ret == 1) ? 0 : -EIO;
>> 
>> Arguably this (well, with ret == len) is what we should've done with
>> *all* of the drm_dp_dpcd_*() functions. I don't think there's a single
>> case where we'd actually need to know that some but not all data was
>> transferred. And if there are, they could be special cased. Now we have
>> hundreds of cases where we check against length and it's just cumbersome
>> all over the place.
>> 
>> The question is, how confusing is it going to be to have some of the new
>> functions return 0 instead of len? Very? Extremely?
>> 
>> As painful as it would be, I'd be in favor of changing them all to
>> return 0 on ret == len. If we find a volunteer.
>
> Maybe a correct Coccinelle script can do a significant part of such a
> conversion for us?
>
> Anyway, I think it a right thing to do. Could you possibly add a new set
> of API and use it inside i915 driver? Then during the next cycle we can
> start using new functions for all other drivers. Or would you rather add
> new API through drm-misc? Then we can concert e.g. existing helpers in
> the first place and then start working on the drivers.

There are hundreds of drm_dp_dpcd_{read,readb,write,writeb} uses across
drm, and then all the higher level helpers on top. I'm not sure adding a
new API and using it in i915 achieves much.

BR,
Jani.


-- 
Jani Nikula, Intel

