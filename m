Return-Path: <linux-arm-msm+bounces-112262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T++IB6lMKGpQBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:26:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B13662ED8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:26:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=bc+sHZUz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1697D301C938
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 17:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B9448AE39;
	Tue,  9 Jun 2026 17:24:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046AF35E931
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 17:24:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025874; cv=none; b=j5X0DMIq8TdVikGG7lsTQiAKl46Z2HZhv9zooaPfR8CW4nXwcEOaGnX8IU+xuo67aeEa1AaD4xKfFYamLuLSyOY3DTq3RSjOjaTFnRNlij5GGSt64azJdolx8/QPMMGscFR82IT3m+cVtWY0uYSK1jRhEF/ybbQ8+YthOPxAVmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025874; c=relaxed/simple;
	bh=gYwYfOmSg9zh/57EWqaO6+udlKH9XGV6iJe7D/Dqlkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcYzCHqTxWRgMGVKk20DzhZLC3xRFqB9BGHlel0aCWXan/T0qeIH9pEzkuZEG4l/YiUeppzcAuNV5MWENXSPlIPk0DyseutlhoPJYEhbq+xhjiUSPRh80BpwHrx2hQMLrsKjf3QMu8ldlIKvmJXB1Yowp1mzY5cK3NvFl2yCDac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bc+sHZUz; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vkWjdZEEK6l/tP876mm0YBiUu/HDkRP00MJLIgeUa84=; b=bc+sHZUzPEFyRmoxzi1d7tODvH
	l0fUqBtQ13lLqVfTYvVOzS7+mvfj/FBEBzDN48eMk8+WEVUGYYZ/IloVnrU92vpMdXRjiv/Uy00H4
	jskdzxmLzvC4ZbfQ3OaANuohLlDD61aV0cj/E5RCFaxU+Xdj81MmzBPMqyW7fR55oXhlwL0ELUPQX
	Mz5omswZozJaYNUiqstG6rys+boYlJkpgKE58uJ8j1/fQc/MhkDoaSeWHqORl9p8ymGpepdFwW2Uk
	Ucz6Xn/MAa2+ceRqZeaYChuoMNDeLIF0azfYhF6F3LhKOg/7GHe9Gl20j/fCYDtMDxBzunGIwY2jr
	TJAqZMFA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wX0Az-00F5Lq-PA; Tue, 09 Jun 2026 19:23:45 +0200
Message-ID: <0a0a4d13-9821-4a74-82f5-5309a1e168ca@Igalia.com>
Date: Tue, 9 Jun 2026 10:23:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/atomic: only add states of active or transient
 active colorops
To: Melissa Wen <mwen@igalia.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Alex Hung <alex.hung@amd.com>,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 Rodrigo Siqueira <siqueira@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "harry.wentland@amd.com" <harry.wentland@amd.com>
References: <20260526142940.504911-1-mwen@igalia.com>
 <20260526142940.504911-2-mwen@igalia.com>
 <e8aaf4da-8fb6-4d6a-95d6-563ac0562b49@amd.com>
 <4452e675c4853faf665b520a8932a960946206bb@intel.com>
 <f9e5f9ed-ed15-40ae-9330-44f8c42f5f98@intel.com>
 <cb0599d2-9dd5-4e93-b21e-b843f4a79182@igalia.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <cb0599d2-9dd5-4e93-b21e-b843f4a79182@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112262-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:chaitanya.kumar.borah@intel.com,m:jani.nikula@linux.intel.com,m:alex.hung@amd.com,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:contact@emersion.fr,m:uma.shankar@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:harry.wentland@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,intel.com,linux.intel.com,amd.com,gmail.com,kernel.org,ffwll.ch,suse.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vger.kernel.org:from_smtp,igalia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,Igalia.com:mid,Igalia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83B13662ED8

On 6/3/26 04:27, Melissa Wen wrote:
> On 01/06/2026 11:24, Borah, Chaitanya Kumar wrote:
>> On 5/29/2026 7:16 PM, Jani Nikula wrote:
>>> On Tue, 26 May 2026, Alex Hung <alex.hung@amd.com> wrote:
>>>> On 5/26/26 08:17, Melissa Wen wrote:
>>>>> Only consider affected colorop states those that are part of an 
>>>>> active
>>>>> color pipeline or a pipeline that is about to be activated or
>>>>> deactivated in the same atomic commit, i.e., colorop is in the 
>>>>> chain of
>>>>> old/new plane color pipeline property. To cover color_pipeline
>>>>> deactivation, remove the condition for plane_state->color_pipeline.
>>>>>
>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_atomic.c | 67 
>>>>> +++++++++++++++++++++++++++++++-----
>>>>>    1 file changed, 58 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_atomic.c 
>>>>> b/drivers/gpu/drm/drm_atomic.c
>>>>> index 170de30c28ae..4fb3a23e862a 100644
>>>>> --- a/drivers/gpu/drm/drm_atomic.c
>>>>> +++ b/drivers/gpu/drm/drm_atomic.c
>>>>> @@ -812,6 +812,59 @@ static int drm_atomic_plane_check(const 
>>>>> struct drm_plane_state *old_plane_state,
>>>>>        return 0;
>>>>>    }
>>>>>    +/*
>>>>> + * This function walks old and new plane state color pipelines 
>>>>> and adds all
>>>>> + * colorops in use by @plane to the atomic configuration @state. 
>>>>> This is useful
>>>>> + * when an atomic commit needs to check all currently enabled or 
>>>>> about to be
>>>>> + * enabled colorop on @plane, e.g. when changing the mode. This 
>>>>> also avoids
>>>>> + * including colorop states that are not part of the atomic state.
>>>>> + *
>>>>> + * Returns:
>>>>> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the 
>>>>> error is EDEADLK
>>>>> + * then the w/w mutex code has detected a deadlock and the entire 
>>>>> atomic
>>>>> + * sequence must be restarted. All other errors are fatal.
>>>>> + */
>>>>> +static int
>>>>> +drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
>>>>> +                 struct drm_plane *plane)
>>>>> +{
>>>>> +    struct drm_colorop *colorop;
>>>>> +    struct drm_colorop_state *colorop_state;
>>>>> +    struct drm_plane_state *new_plane_state, *old_plane_state;
>>>>> +
>>>>> +    new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>>>> +    old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>>>>> +
>>>>> +    if (WARN_ON(!new_plane_state || !old_plane_state))
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    drm_dbg_atomic(plane->dev,
>>>>> +               "Adding old+new pipeline colorops for 
>>>>> [PLANE:%d:%s]\n",
>>>>> +               plane->base.id, plane->name);
>>>>> +
>>>>> +    for (colorop = new_plane_state->color_pipeline;
>>>>> +         colorop;
>>>>> +         colorop = colorop->next) {
>>>>
>>>> This for-loop is used 5 times in this patchset. How about a macro in
>>>> drm_colorop.h?
>>>>
>>>> #define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
>>>>       for ((colorop) = (pipeline); (colorop); (colorop) = 
>>>> (colorop)->next)
>>>
>>> Is there a reason struct drm_colorop reinvents lists and doesn't have
>>> struct list_head node?
>>>
>>
>> I believe that's because the "next" colorop is exposed as a property 
>> (of the current colorop) to userspace. Since the chain is already 
>> described by the property, a struct list_head would be redundant.
>
> Also, each color pipeline is an immutable chain of colorops where the 
> sequence and position matter: once the chain is built, colorops are 
> never added, removed, replaced or walked in reverse. It's a 
> forward-only chain that ends when next == NULL, and it directly 
> matches userspace mapping. Another point to take into account is that 
> there is no struct drm_color_pipeline to hold a list_head yet, since 
> each color pipeline is identified by the first colorop element in the 
> chain. Maybe we will want a container to link a given pre-blend color 
> pipeline to a specific post-blend color pipeline for example, but 
> linking pre- to post-blend color pipelines is something we are still 
> not clear about.
>
> Melissa
>
"there is no struct drm_color_pipeline to hold a list_head" <-- I think 
this is the real reason. It is possible to convert to use a proper list 
structure, but the result is slightly messy. I had a quick go at it to 
see how messy:
     https://patchwork.freedesktop.org/series/168200/

John.

>>
>> Harry, others can chime in.
>>
>> ==
>> Chaitanya
>>
>>> BR,
>>> Jani.
>>>
>>>>
>>>>> +        colorop_state = drm_atomic_get_colorop_state(state, 
>>>>> colorop);
>>>>> +        if (IS_ERR(colorop_state))
>>>>> +            return PTR_ERR(colorop_state);
>>>>> +    }
>>>>> +
>>>>> +    /* Same color pipeline as new; no point walking old. */
>>>>> +    if (new_plane_state->color_pipeline == 
>>>>> old_plane_state->color_pipeline)
>>>>> +        return 0;
>>>>> +
>>>>> +    for (colorop = old_plane_state->color_pipeline;
>>>>> +         colorop;
>>>>> +         colorop = colorop->next) {
>>>>> +        colorop_state = drm_atomic_get_colorop_state(state, 
>>>>> colorop);
>>>>> +        if (IS_ERR(colorop_state))
>>>>> +            return PTR_ERR(colorop_state);
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    static void drm_atomic_colorop_print_state(struct drm_printer *p,
>>>>>                           const struct drm_colorop_state *state)
>>>>>    {
>>>>> @@ -1591,11 +1644,9 @@ drm_atomic_add_affected_planes(struct 
>>>>> drm_atomic_commit *state,
>>>>>            if (IS_ERR(plane_state))
>>>>>                return PTR_ERR(plane_state);
>>>>>    -        if (plane_state->color_pipeline) {
>>>>> -            ret = drm_atomic_add_affected_colorops(state, plane);
>>>>> -            if (ret)
>>>>> -                return ret;
>>>>> -        }
>>>>> +        ret = drm_atomic_add_pipeline_colorops(state, plane);
>>>>> +        if (ret)
>>>>> +            return ret;
>>>>>        }
>>>>>        return 0;
>>>>>    }
>>>>> @@ -1607,10 +1658,8 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>>>>>     * @plane: DRM plane
>>>>>     *
>>>>>     * This function walks the current configuration and adds all 
>>>>> colorops
>>>>> - * currently used by @plane to the atomic configuration @state. 
>>>>> This is useful
>>>>> - * when an atomic commit also needs to check all currently 
>>>>> enabled colorop on
>>>>> - * @plane, e.g. when changing the mode. It's also useful when 
>>>>> re-enabling a plane
>>>>> - * to avoid special code to force-enable all colorops.
>>>>> + * currently used by @plane to the atomic configuration @state. 
>>>>> It's useful
>>>>> + * when re-enabling a plane to avoid special code to force-enable 
>>>>> all colorops.
>>>>>     *
>>>>>     * Since acquiring a colorop state will always also acquire the 
>>>>> w/w mutex of the
>>>>>     * current plane for that colorop (if there is any) adding all 
>>>>> the colorop states for
>>>>
>>>
>>
>


