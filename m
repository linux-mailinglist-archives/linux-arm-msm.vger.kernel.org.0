Return-Path: <linux-arm-msm+bounces-43629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8E9FE62D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E87160EC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1131A76DA;
	Mon, 30 Dec 2024 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cE7zJ+u3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF081A4F2B;
	Mon, 30 Dec 2024 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735564730; cv=none; b=EAMHmeYFp+YTfeXJKoWHTiHjxwPYOy5L6ncP5y6gnYgqNdzUHzO8OTHp03ktG0DH1MIBmuaWdEq+1kMqosz8LYDbr8DK7FDgf5X4g/YgsAWA+36JxiAqe2BnPlRHVwylJLRxsMW45OOzevLhEQdhpzqujnLGduqEiHVzsfnu6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735564730; c=relaxed/simple;
	bh=F5ZAj3LKhwurq6s36HWd56Hq5EJ47jKU4wzqeBVlBYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eRFUzo8jvDReyhFQHLVil7RHKGeHs8MbZAzNTTaBvMnzYtP9q3e+PryDENzSyYHHrbWOY5yotNtrGC5HFlRTm+GYgVOaBzRGElg6EXCVx1pyrdxVkpJooR/fToSHgOu58v6vubciwXzmS2Lv49XzXkFQ3s+rThPcPwEZa+oyBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cE7zJ+u3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735564728; x=1767100728;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=F5ZAj3LKhwurq6s36HWd56Hq5EJ47jKU4wzqeBVlBYg=;
  b=cE7zJ+u3j23mfDy/5Op/7Q+pQ2+BTeo8JE1u7uwPIHiKXpulUCnoMKZo
   +yvu0mUQe37YV52nBAQ3M0ples1Ki9IsR+6HTeAMibEa44sjJNAlFI0nq
   F5Mo6X6TuPdo+eQQuq7743tvjzEd0FUZ0DIRh6zHOBu6RVVxEWF8Cg892
   oVU+pJDjrq3Ygm0zY8+Zwszk0BKOYVjHCna8fY46DA2Ejb7rRQO1Ga6Zp
   VbN0Hi1IEVSyg4hBvmIKe59P4FTrsBSpl+ukki+JEv70jZSPiUv3uBocA
   a/K/nrPAAXdbpQFOnPXBw2JbItOSNqvC+maRTDs1/hL+an/mVD3eM+B9Z
   A==;
X-CSE-ConnectionGUID: 3sCTZt/BS1iJxK0gFNxJlA==
X-CSE-MsgGUID: QezRHw/sSWmOxLBaAQ2LIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46534361"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="46534361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 05:18:47 -0800
X-CSE-ConnectionGUID: 1OB6ph2LSQ6avqBsaXEV/w==
X-CSE-MsgGUID: UwVTQ3BoRMSuV3toABd3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="100975369"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.167])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 05:18:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
In-Reply-To: <Z21VD82XCOVgVJUh@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com> <Z21VD82XCOVgVJUh@linaro.org>
Date: Mon, 30 Dec 2024 15:18:35 +0200
Message-ID: <877c7hpavo.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 26 Dec 2024, Abel Vesa <abel.vesa@linaro.org> wrote:
> On 24-12-11 15:42:27, Johan Hovold wrote:
>> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>>  
>> > +/**
>> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
>> > + * @aux: DisplayPort AUX channel
>> > + * @enable: Enable or disable transparent mode
>> > + *
>> > + * Returns 0 on success or a negative error code on failure.
>> > + */
>> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
>> > +{
>> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
>> > +
>> > +	return ret == 1 ? 0 : ret;
>> 
>> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
>> sure it never returns 0 (for short transfers).
>
> Will follow Dmitry's proposal here.
>
> 	if (ret < 0)
>         	return ret;
>
> 	return (ret == 1) ? 0 : -EIO;

Arguably this (well, with ret == len) is what we should've done with
*all* of the drm_dp_dpcd_*() functions. I don't think there's a single
case where we'd actually need to know that some but not all data was
transferred. And if there are, they could be special cased. Now we have
hundreds of cases where we check against length and it's just cumbersome
all over the place.

The question is, how confusing is it going to be to have some of the new
functions return 0 instead of len? Very? Extremely?

As painful as it would be, I'd be in favor of changing them all to
return 0 on ret == len. If we find a volunteer.

BR,
Jani.


>
>
>> 
>> > +}
>> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
>> 
>> This appears to be what the driver currently uses, but why not
>> EXPORT_SYMBOL_GPL?
>> 
>> > +
>> > +/**
>> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
>> > + *
>> > + * @aux: DisplayPort AUX channel
>> > + * @lttpr_count: Number of LTTPRs
>> > + *
>> > + * Returns 0 on success or a negative error code on failure.
>> > + */
>> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
>> > +{
>> > +	if (!lttpr_count)
>> > +		return 0;
>> > +
>> > +	/*
>> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
>> > +	 * non-transparent mode and the disable->enable non-transparent mode
>> > +	 * sequence.
>> > +	 */
>> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
>> 
>> Error handling?
>
> Yes, this makes sense. But other than throwing an error I don't think
> there is much to be done. I'll add an drm_err here just in case. 
>
>> 
>> > +
>> > +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
>> 
>> No need to check lttpr_count again here.
>
> So the logic behind lttpr_count and this transparency mode changing, as
> specified in the DP standard, is as follows:
>
> - If there are 0 LTTPRs counted, then nothing to be done, otherwise set to
> transparent mode.
>
> - Then, if there are between 0 and 8 LTTPRs counted, set non-transparent
> mode successfully.
>
> - Otherwise, rollback to transparent mode.
>
> This last rollback might result in two transparent mode settings without
> a non-transparent one in between, but AFAIU, that is OK. Making sure this
> doesn't happen would just make the implementation more ugly without any
> benefit, IMO.
>
>> 
>> > +		return 0;
>> 
>> I'd check for errors instead of success here and do the rollback before
>> returning -EINVAL.
>> 
>
> Yes, I think it would be more cleaner. Will do that.
>
>> > +
>> > +	/*
>> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
>> > +	 * the number of LTTPRs is invalid
>> > +	 */
>> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
>> > +
>> > +	return -EINVAL;
>> 
>> And return 0 explicitly here.
>
> Yes. Will do that.
>
>> 
>> > +}
>> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
>> 
>> In any case this works well and is needed for external display on the
>> Lenovo ThinkPad T14s, while not breaking the X13s which does not need
>> it:
>> 
>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>> 
>> Johan
>
> Thanks for reviewing and testing!
> Abel
>

-- 
Jani Nikula, Intel

