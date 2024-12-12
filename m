Return-Path: <linux-arm-msm+bounces-41676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471929EE114
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941E91683E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E2B20C030;
	Thu, 12 Dec 2024 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioJAYtTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C1126C01;
	Thu, 12 Dec 2024 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991523; cv=none; b=E/buPLu6ICj/ZXJCGNWLVeUqPg+FUuEuo66aPJuZAj7FIlRCDfO1VjcGW98xicbs62r2FL4pQ5sPKcybclSZE1qdfkUVgraaIgTTW7UeQa9LwFhcjkSi/KEYzMnDXnrRKFys6adl/r9Hl1ij6E0YfKxC8Kt/wk7Oiaj4Jj+9x7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991523; c=relaxed/simple;
	bh=dVHHLoWyfFDn4SykayA6jpY7XugJsCld6W0h27L/1oo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O/GghdHBAsGmuAnUvH7FaGSPonZpNyNWl3WJNJwrifbENY7scj8pUROE0BUL9mFL9AqLvZzYXsxEHR0Xi3bnmDz2y3BmGLGfOP24RuN8QbwNT1iJuIFBnu/pVfV1AVkLRVu9ZtvcEB7TGGadsneMFFx3WzYFjYysJsT9txxhPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioJAYtTb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733991522; x=1765527522;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=dVHHLoWyfFDn4SykayA6jpY7XugJsCld6W0h27L/1oo=;
  b=ioJAYtTbNBFonlxPrUh0yGbFolMi4Z7osuz3yrhoWGoJ2SoaxqZ5BRiM
   kedP89Iwalsk/aV4KeZu1H08UcgJleo07WMkPGJqcg7qNBDD/KHHBsRQm
   a63OvafedMU4NTcgLd+f50h59Mm8byzAgWtGqPmu5+OhzOV6lFJOyYZO9
   ZUd2lU30vm+MYICc3AFtWZwdxx7w7NlR5X2ZxnlPIsODymOdDzk3EwI7m
   1qrKRQqrmjwg1M0aJDbpvIExrIfyKr8rVu0GbSOisBz2u+I0bhDbdJk88
   ANGB7XqdV8pPlXSvKpYlBqZkcZVRoVcFrk1S+QmPxbtB1AocxVvRgGBuP
   w==;
X-CSE-ConnectionGUID: HfQnmDw+R2eH/H8w2YIqrQ==
X-CSE-MsgGUID: JCe5ne/6Samuom5oKi6FVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="38086244"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="38086244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 00:18:41 -0800
X-CSE-ConnectionGUID: AIQA0pf8S+KINcKZiVC2wA==
X-CSE-MsgGUID: 5JT1BapkSSCqRnj0Cwzaiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="96397015"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.101])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 00:18:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Johan Hovold
 <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
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
In-Reply-To: <3omcjrgfkdmw466ok7gej2jge25vtwzaiycwz2xgejwppyvkza@rhssgk7xz4hj>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
 <3omcjrgfkdmw466ok7gej2jge25vtwzaiycwz2xgejwppyvkza@rhssgk7xz4hj>
Date: Thu, 12 Dec 2024 10:18:30 +0200
Message-ID: <87pllxxqjt.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 11 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Wed, Dec 11, 2024 at 03:42:27PM +0100, Johan Hovold wrote:
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
>> 
>> > +}
>> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
>> 
>> This appears to be what the driver currently uses, but why not
>> EXPORT_SYMBOL_GPL?
>
> $ git grep EXPORT_SYMBOL drivers/gpu/drm/*.c | wc -l
> 962
> $ git grep EXPORT_SYMBOL_GPL drivers/gpu/drm/*.c | wc -l
> 93

It's even more tilted under display/.

BR,
Jani.


-- 
Jani Nikula, Intel

