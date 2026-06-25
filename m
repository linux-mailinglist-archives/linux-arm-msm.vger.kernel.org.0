Return-Path: <linux-arm-msm+bounces-114582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 58UXHg6sPWrg5QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:30:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD24B6C8FA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:30:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=JFG0xNPI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114582-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114582-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 752463044102
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C409D37CD37;
	Thu, 25 Jun 2026 22:29:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58B3446CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782426593; cv=none; b=attlNIuuV8A2F+vvpV7+sgsUdZRbVSk3MNk5ZF84u9rn1FBKecQbjJFF9u4T4H/Zb041pA4Fbsf1ozHOTqsFd56MNjQ2H2spsQw1uF/aXUNeoMsLZU1rqYvW91mhpqDk0xaPqgeenb/OzxZKCXg4c3/ZP6+aOdPt7dumBjDl1XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782426593; c=relaxed/simple;
	bh=JrtoFau50J/hNRwHrhwcVd90kO6UnrYASeuNapH7t2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ejkq6DvpVzYVY8gsbXEND9yKdoG61eriNUuWbi2eaBxK5OOxsIrjY7GS/5wFqX1fmxY2CzOkXEFss1MobFBQDucVMfus3js5dAHKWsgKwjYqlxbmfHrsbuYK1xFF30VgC+NiYWzECktVZFP7aoJSXSy7l7M9ss119WAkid2inkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JFG0xNPI; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+xpz/3mR0vc8MZUDX2dWK/x9YYE2W9Z6zuZ1hivI4Fc=; b=JFG0xNPILkwiYY54VdZjej0/2a
	1BMr8ZXZRKZm9affvQYSmBPwPFO8tXABfgq3zhwGCeQuwjQzrGq+T5hE2t2h98lQTZktpHkIstRJA
	zDDb/2I5WmbLIBxP07TG1H4z+JLGVJftpQ/eCTTq1h7G9m3tVek3jgQfhCK6DnXZBgKrQAUL7nB2X
	ML6Y3gGiUzto0asaKS04xyIWx6ayC+BUIBc9LvQmB3qLCMINJOitdiO4W9gHoM/qW9dD8OcXNyLp8
	EgbiFbDVNGdVMZlPifMTeM6KyVm2u62mSxvqwIVHiW6yiL06YOSLUSMy5bqeieGuFmEkfXeuA3qew
	PaE/YFUQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wcsZ4-005FfL-9L; Fri, 26 Jun 2026 00:28:54 +0200
Message-ID: <140cad50-d1fc-416e-ba84-453e1a2000c4@Igalia.com>
Date: Thu, 25 Jun 2026 15:28:43 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/atomic: only add states of active or transient
 active colorops
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, contact@emersion.fr, daniels@collabora.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260609121230.1358786-1-mwen@igalia.com>
 <20260609121230.1358786-2-mwen@igalia.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260609121230.1358786-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:aurabindo.pillai@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:harry.wentland@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114582-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,emersion.fr,collabora.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD24B6C8FA4

On 6/9/26 13:51, Melissa Wen wrote:
> Only consider affected colorop states those that are part of an active
> color pipeline or a pipeline that is about to be activated or
> deactivated in the same atomic commit, i.e., colorop is in the chain of
> old/new plane color pipeline property. To cover color_pipeline
> deactivation, remove the condition for plane_state->color_pipeline.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>
> v2: define a macro to walk in the color pipeline (Alex H.)
> ---
>   drivers/gpu/drm/drm_atomic.c | 65 +++++++++++++++++++++++++++++++-----
>   include/drm/drm_colorop.h    |  3 ++
>   2 files changed, 59 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3af1b9cc9a06..464562861408 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -892,6 +892,57 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	return 0;
>   }
>   
> +/*
> + * This function walks old and new plane state color pipelines and adds all
> + * colorops in use by @plane to the atomic configuration @state. This is useful
> + * when an atomic commit needs to check all currently enabled or about to be
> + * enabled colorop on @plane, e.g. when changing the mode. This also avoids
> + * including colorop states that are not part of the atomic state.
> + *
> + * Returns:
> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
> + * then the w/w mutex code has detected a deadlock and the entire atomic
> + * sequence must be restarted. All other errors are fatal.
> + */
> +static int
> +drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
> +				 struct drm_plane *plane)
> +{
> +	struct drm_colorop *colorop;
> +	struct drm_colorop_state *colorop_state;
> +	struct drm_plane_state *new_plane_state, *old_plane_state;
> +
> +	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +
> +	if (WARN_ON(!new_plane_state || !old_plane_state))
> +		return -EINVAL;
> +
> +	drm_dbg_atomic(plane->dev,
> +		       "Adding old+new pipeline colorops for [PLANE:%d:%s]\n",
> +		       plane->base.id, plane->name);
> +
> +	drm_for_each_colorop_in_pipeline(colorop,
> +					 new_plane_state->color_pipeline) {
> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +		if (IS_ERR(colorop_state))
> +			return PTR_ERR(colorop_state);
> +	}
> +
> +	/* Same color pipeline as new; no point walking old. */
> +	if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
> +		return 0;
> +
> +	drm_for_each_colorop_in_pipeline(colorop,
> +					 old_plane_state->color_pipeline) {
> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +		if (IS_ERR(colorop_state))
> +			return PTR_ERR(colorop_state);
> +	}
> +
> +	return 0;
> +}
> +
>   static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   					   const struct drm_colorop_state *state)
>   {
> @@ -1671,11 +1722,9 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
>   		if (IS_ERR(plane_state))
>   			return PTR_ERR(plane_state);
>   
> -		if (plane_state->color_pipeline) {
> -			ret = drm_atomic_add_affected_colorops(state, plane);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = drm_atomic_add_pipeline_colorops(state, plane);
> +		if (ret)
> +			return ret;
>   	}
>   	return 0;
>   }
> @@ -1687,10 +1736,8 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>    * @plane: DRM plane
>    *
>    * This function walks the current configuration and adds all colorops
> - * currently used by @plane to the atomic configuration @state. This is useful
> - * when an atomic commit also needs to check all currently enabled colorop on
> - * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
> - * to avoid special code to force-enable all colorops.
> + * currently used by @plane to the atomic configuration @state. It's useful
> + * when re-enabling a plane to avoid special code to force-enable all colorops.
>    *
>    * Since acquiring a colorop state will always also acquire the w/w mutex of the
>    * current plane for that colorop (if there is any) adding all the colorop states for
Unfortunately, it is not clear from the context diff but this update is 
for drm_atomic_add_affected_colorops(). That function is now only used 
by drm_atomic_helper_duplicate_state(). So, potentially it could be move to
drm_atomic_helper.c and made a static local helper. Alternatively, 
should the _duplicate_state() function also be updated to only copy the 
states of colorops in active pipelines as well? It already only does the 
state add call if there is a pipeline, it just doesn't filter according 
to the pipeline. Seems like it should? In which case, this blanket add 
code can be removed entirely.

John.

> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index b4b9e4f558ab..006278e21d49 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -459,6 +459,9 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
>   #define drm_for_each_colorop(colorop, dev) \
>   	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
>   
> +#define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
> +	for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)
> +
>   /**
>    * drm_get_colorop_type_name - return a string for colorop type
>    * @type: colorop type to compute name of


