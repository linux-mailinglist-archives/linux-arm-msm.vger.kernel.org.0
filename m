Return-Path: <linux-arm-msm+bounces-110277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HYvMMuYGWqGxwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:46:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23B6030C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AA553016C4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7503B19049B;
	Fri, 29 May 2026 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbuDu6gi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623624EA90
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062406; cv=none; b=KSwZ7tp1FP7KyS41zFKcC016XO7Yhf4TZJOutWpBDbBIuFEHrSBE7rukdqvcKaJ0EWhofy1IUaU8hlJh6FMEkeVbZMFIuUT7ItwVh+qx/oEEhmPkGoQqii38E1bdkGYvFPjJaaxoI+5ARkYkmu/p7uBN2wO4SDwluIHHaHqSTdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062406; c=relaxed/simple;
	bh=KahDASigffRrYNY2fcECjx0aBmuc/lCu2aotDwcoHh0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l99ZkalbJuV4ZqVh+ZhPhhk7UY3CBXhUndq57aDYp3umWG2Y0J3XgGz0oYTd2F0Qh1ehC9WIEqEcojddROZu16143sKfe7WmvIN5c+61ir0anURLxecMqwKIkjXybiH4e4OQoVdaInS2QDToAdcSbuz7v1ju1T5L1351YOb/QBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbuDu6gi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780062404; x=1811598404;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=KahDASigffRrYNY2fcECjx0aBmuc/lCu2aotDwcoHh0=;
  b=HbuDu6giLhsMv81S3KduuJ8PaUmhDnSLGs5o8bwTEmSp2mvexP1eHtkG
   bb+VKubLGkJwqTT6x+gsJ+5wCDOz8OOWKYNWAD1Q50yLAU8RHheXFh7DP
   F6meR/bL6IPsIGDYMctJmmHBho0suluDtXM+nhO5LEByIhiw1dM5fDE/y
   EwBfV+x2KIfkWpgos7WtZp7T7vQ8nRy2LzXvWICpec9z6DMhaC2RVc17i
   YxSNjNWPyeBTCIDbaGkkCKZ/lCTFkjHYR6QPyCbPh1FOSqqBHqzTo3OX7
   UySvqSLRpeJIxXdO8ufIuzhE2UWQ15HDmCIP+tbt/+DfW5PZ8iI5y46n/
   g==;
X-CSE-ConnectionGUID: hS1gHymhSAeDm0jQnh/nhQ==
X-CSE-MsgGUID: 7p/BET1BT3Sg+7NlFEElsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84800467"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="84800467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 06:46:43 -0700
X-CSE-ConnectionGUID: qs/w7OeFSaKMoNNE015oFw==
X-CSE-MsgGUID: 0cI2WQZgQ0qk3t7kkDhJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247950446"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.147])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 06:46:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Xaver Hugl
 <xaver.hugl@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Matthew Schwartz
 <matthew.schwartz@linux.dev>, John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/atomic: only add states of active or transient
 active colorops
In-Reply-To: <e8aaf4da-8fb6-4d6a-95d6-563ac0562b49@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260526142940.504911-1-mwen@igalia.com>
 <20260526142940.504911-2-mwen@igalia.com>
 <e8aaf4da-8fb6-4d6a-95d6-563ac0562b49@amd.com>
Date: Fri, 29 May 2026 16:46:32 +0300
Message-ID: <4452e675c4853faf665b520a8932a960946206bb@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,Igalia.com,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110277-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 6E23B6030C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026, Alex Hung <alex.hung@amd.com> wrote:
> On 5/26/26 08:17, Melissa Wen wrote:
>> Only consider affected colorop states those that are part of an active
>> color pipeline or a pipeline that is about to be activated or
>> deactivated in the same atomic commit, i.e., colorop is in the chain of
>> old/new plane color pipeline property. To cover color_pipeline
>> deactivation, remove the condition for plane_state->color_pipeline.
>> 
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c | 67 +++++++++++++++++++++++++++++++-----
>>   1 file changed, 58 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 170de30c28ae..4fb3a23e862a 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -812,6 +812,59 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>>   	return 0;
>>   }
>>   
>> +/*
>> + * This function walks old and new plane state color pipelines and adds all
>> + * colorops in use by @plane to the atomic configuration @state. This is useful
>> + * when an atomic commit needs to check all currently enabled or about to be
>> + * enabled colorop on @plane, e.g. when changing the mode. This also avoids
>> + * including colorop states that are not part of the atomic state.
>> + *
>> + * Returns:
>> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
>> + * then the w/w mutex code has detected a deadlock and the entire atomic
>> + * sequence must be restarted. All other errors are fatal.
>> + */
>> +static int
>> +drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
>> +				 struct drm_plane *plane)
>> +{
>> +	struct drm_colorop *colorop;
>> +	struct drm_colorop_state *colorop_state;
>> +	struct drm_plane_state *new_plane_state, *old_plane_state;
>> +
>> +	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>> +	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>> +
>> +	if (WARN_ON(!new_plane_state || !old_plane_state))
>> +		return -EINVAL;
>> +
>> +	drm_dbg_atomic(plane->dev,
>> +		       "Adding old+new pipeline colorops for [PLANE:%d:%s]\n",
>> +		       plane->base.id, plane->name);
>> +
>> +	for (colorop = new_plane_state->color_pipeline;
>> +	     colorop;
>> +	     colorop = colorop->next) {
>
> This for-loop is used 5 times in this patchset. How about a macro in 
> drm_colorop.h?
>
> #define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
>      for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)

Is there a reason struct drm_colorop reinvents lists and doesn't have
struct list_head node?

BR,
Jani.

>
>> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
>> +		if (IS_ERR(colorop_state))
>> +			return PTR_ERR(colorop_state);
>> +	}
>> +
>> +	/* Same color pipeline as new; no point walking old. */
>> +	if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
>> +		return 0;
>> +
>> +	for (colorop = old_plane_state->color_pipeline;
>> +	     colorop;
>> +	     colorop = colorop->next) {
>> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
>> +		if (IS_ERR(colorop_state))
>> +			return PTR_ERR(colorop_state);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static void drm_atomic_colorop_print_state(struct drm_printer *p,
>>   					   const struct drm_colorop_state *state)
>>   {
>> @@ -1591,11 +1644,9 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
>>   		if (IS_ERR(plane_state))
>>   			return PTR_ERR(plane_state);
>>   
>> -		if (plane_state->color_pipeline) {
>> -			ret = drm_atomic_add_affected_colorops(state, plane);
>> -			if (ret)
>> -				return ret;
>> -		}
>> +		ret = drm_atomic_add_pipeline_colorops(state, plane);
>> +		if (ret)
>> +			return ret;
>>   	}
>>   	return 0;
>>   }
>> @@ -1607,10 +1658,8 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>>    * @plane: DRM plane
>>    *
>>    * This function walks the current configuration and adds all colorops
>> - * currently used by @plane to the atomic configuration @state. This is useful
>> - * when an atomic commit also needs to check all currently enabled colorop on
>> - * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
>> - * to avoid special code to force-enable all colorops.
>> + * currently used by @plane to the atomic configuration @state. It's useful
>> + * when re-enabling a plane to avoid special code to force-enable all colorops.
>>    *
>>    * Since acquiring a colorop state will always also acquire the w/w mutex of the
>>    * current plane for that colorop (if there is any) adding all the colorop states for
>

-- 
Jani Nikula, Intel

