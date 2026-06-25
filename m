Return-Path: <linux-arm-msm+bounces-114584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jQvVOVWxPWq/5ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:53:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A406C9106
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:53:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=ewzwAMhZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114584-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114584-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F37C8301C8B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0BF33ADA3;
	Thu, 25 Jun 2026 22:53:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A230276A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:53:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782427987; cv=none; b=NKbvkE4VFklVAFkmgbjBJ6uFcFAUex0+F+f2oSLxGgrAx05ASXfVIs4qjsIYSuYPaXJinLilyVBB9aQKLDZrJ47648qWyLg2AsMhXsW20gYJxeEFBPmIE55yLAwlOyIu1Jwx8HsYV4YlQbVD9TevWgEolZ5ffQ3JP9oo3NBceJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782427987; c=relaxed/simple;
	bh=cIU4ub4aSgL4mqvF3DKLGdtmFap/CgsSLn0qsiJKfkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJ9pbKdN8bVsSsK2AgS6FUwGnJS+eGaVg8Y/V5HllS+VwUJ0dTfGIzpuSchKu0Cxnyr3xyiHRqN2Pkni32nNKw3YNOKV5Svzfp4JP8pq+5/sDAMPz5eGcWOgs6AMqofH3J1LAkplNWpoBcGaWOX4QKAj7RqEy8raVaFHBcwe+Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ewzwAMhZ; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SeQUkQiyF5X1qXChmHKlCt3Ean9AaLLtMUxpoOPrDqQ=; b=ewzwAMhZsdUzL05xcHfw2gF0Gs
	FVvpUnxl1S5o5h7Qft0lAkVpDrY+OD3G8E/9XCnQ7T5CFFajBjc7JJ+PKcAQqKwRg9PtYSZDiUpqH
	ODY16qntmkVyBHs1mU9DdHLaXxoiJJHt8drdw2VvuXJnPpVczIMM/jKeNUFjVXFgA54Zu7/ZzKOm5
	ewlHNTU6bLdXzxsutNjlbre3kjIe/gcdXqwB0jZZYXAOWpTnQN7v5snlrzDfsQiERd3HG1xWxT0f0
	3jteVOWk+NxcVci6vigmHUZRVRHPFXnCWx6j/0D5zbLOotm3CM/pn+043YRJgfzYNluU/HfoJnZyZ
	m5peeCOQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wcsvy-005G2R-Ot; Fri, 26 Jun 2026 00:52:34 +0200
Message-ID: <3691d76a-4a9c-41ea-ba3b-de08d6c90260@Igalia.com>
Date: Thu, 25 Jun 2026 15:52:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/amd/display: don't check colorop status if its
 in an inactive pipeline
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
 Sashiko <sashiko-bot@kernel.org>, dri-devel@lists.freedesktop.org
References: <20260609121230.1358786-1-mwen@igalia.com>
 <20260609121230.1358786-4-mwen@igalia.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260609121230.1358786-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:aurabindo.pillai@amd.com,m:christian.koenig@amd.com,m:contact@emersion.fr,m:daniels@collabora.com,m:harry.wentland@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:uma.shankar@intel.com,m:chaitanya.kumar.borah@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:sashiko-bot@kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,emersion.fr,collabora.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114584-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44A406C9106

On 6/9/26 13:51, Melissa Wen wrote:
> If colorop BYPASS property is true, but the colorop isn't part of an
Should this say 'is false'?

John.

> active/transient active color pipeline, this colorop status should not
> be taken into account when checking if a plane color pipeline is
> actually active. For example, if the userspace doesn't explicitly set a
> colorop obj to bypass but deactivates its color pipeline by setting
> plane COLOR_PIPELINE to bypass, it means that colorop is inactive
> regardless of its BYPASS property status.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: d3a549f4df78 ("drm/amd/display: Use overlay cursor when color pipeline is active")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 31 +++++++++++++------
>   1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ba7f98a87808..2edec3e1b838 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -12590,9 +12590,9 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_commit *state, struct dr
>    * @use_old: if true, inspect the old colorop states; otherwise the new ones
>    *
>    * A color pipeline may be selected (color_pipeline != NULL) but still is
> - * inactive if every colorop in the chain is bypassed.  Only return
> - * true when at least one colorop has bypass == false, meaning the cursor
> - * would be subjected to the transformation in native mode.
> + * inactive if every colorop in the chain is bypassed. Only return true when at
> + * least one active colorop has bypass == false, meaning the cursor would be
> + * subjected to the transformation in native mode.
>    *
>    * Return: true if the pipeline modifies pixels, false otherwise.
>    */
> @@ -12600,18 +12600,29 @@ static bool dm_plane_color_pipeline_active(struct drm_atomic_commit *state,
>   					   struct drm_plane *plane,
>   					   bool use_old)
>   {
> -	struct drm_colorop *colorop;
> -	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
> -	int i;
> +	struct drm_plane_state *plane_state = use_old ?
> +					      drm_atomic_get_old_plane_state(state, plane) :
> +					      drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_colorop *colorop, *pipeline;
> +	struct drm_colorop_state *cstate;
>   
> -	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
> -		struct drm_colorop_state *cstate = use_old ? old_colorop_state : new_colorop_state;
> +	pipeline = plane_state ? plane_state->color_pipeline :
> +				 plane->state->color_pipeline;
Why would plane_state be null? And if it is, why is it correct to use 
plane->state rather than the old or new state as requested by the 
use_old flag? Seems like there should be a comment to explain this.

>   
> -		if (cstate->colorop->plane != plane)
> -			continue;
> +	if (!pipeline)
> +		return false;
> +
> +	drm_for_each_colorop_in_pipeline(colorop, pipeline) {
> +		cstate = use_old ?
> +			 drm_atomic_get_old_colorop_state(state, colorop) :
> +			 drm_atomic_get_new_colorop_state(state, colorop);
> +
> +		if (!cstate)
> +			cstate = colorop->state;
Same question as above. Why would there not be a old/new state and if 
there isn't, why is it correct to use the current state when a check 
against the old/new state was explicitly requested?

John.

>   		if (!cstate->bypass)
>   			return true;
>   	}
> +
>   	return false;
>   }
>   


