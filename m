Return-Path: <linux-arm-msm+bounces-110942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yKUvNv8SIGoDvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:41:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 516DE637292
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:41:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=s34N3cAq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110942-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110942-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E177C30976D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918A628F948;
	Wed,  3 Jun 2026 11:28:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31933ACF1C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:28:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486084; cv=none; b=EtAY/bFE4yCWCLOrtMCSzngvsLmn+cezNrgpYDNXE3p5uvaDxukpopecBfQsABjSNhC/W8NNXgSnbw9GPmDiCzOdwnbuEYI5eGqsNnmWs5YFSfM8nItxSHCqL2pFVj4iDZyXDnEW583PQhcEf60+4mn1nGsXwDV/SXD67b6bGjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486084; c=relaxed/simple;
	bh=SYlj5QyI+toplPnOUvSHlPegmzzjGVOaEDiJ7XEKVCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/c17mstgUimYjSxx4Pq+8J4nnP8BG4pXU4dDOsVOfzCVy2N4U+h4GvyO+TNkpHHwotC7FR5UgqozT6s1jsSFzG96bnPkZCZm6jKfC6ffoLKXPeJnIxghHlpY/seb3/dtXZd+G3j4Ayu7YsD/4GUbuQ//hldiKX9pIESw7DLtXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=s34N3cAq; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SskacXz9nn9lh6X6a6P91EXX6t2deHKrepH0n7+A9Zk=; b=s34N3cAqiTFiFsUGSuXnF9zJRh
	5buVIAQFeoer6w+qFj/tKG7ivF386OjXm+kgR+PA13uhDX9Nn1IfXQUHKWmxPwM8HzCsRrTM3eG6d
	yW4lMTtXNH2Vx3ElWAWIw2QBFUisVSryGEs9aLmwZS/tMi18b0M9zeAhCqcIiP015G3OzbKWONxgu
	Enw8rKlCEq7lRIqmv+rr6aBWT+1owuUrWxKy+eKZQ1Qi5gyWfVKnSXPURya4ONHc1/dKY4wZpeh/j
	bKWbkA9GtPrDbyX5+fUL3e+z6WWuoKgoXL39HU0y0SJW6FQZa182YHn7qIvFC0FEjWETdCxS71Pvu
	RHM2m1iw==;
Received: from [79.117.146.159] (helo=[192.168.1.135])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wUjkn-00C92S-6G; Wed, 03 Jun 2026 13:27:21 +0200
Message-ID: <cb0599d2-9dd5-4e93-b21e-b843f4a79182@igalia.com>
Date: Wed, 3 Jun 2026 13:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/atomic: only add states of active or transient
 active colorops
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Alex Hung <alex.hung@amd.com>,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 John Harrison <John.Harrison@Igalia.com>,
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
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <f9e5f9ed-ed15-40ae-9330-44f8c42f5f98@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110942-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chaitanya.kumar.borah@intel.com,m:jani.nikula@linux.intel.com,m:alex.hung@amd.com,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:contact@emersion.fr,m:uma.shankar@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:John.Harrison@Igalia.com,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:harry.wentland@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,amd.com,gmail.com,kernel.org,ffwll.ch,suse.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,Igalia.com,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,vger.kernel.org:from_smtp,igalia.com:mid,igalia.com:from_mime,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 516DE637292



On 01/06/2026 11:24, Borah, Chaitanya Kumar wrote:
>
>
> On 5/29/2026 7:16 PM, Jani Nikula wrote:
>> On Tue, 26 May 2026, Alex Hung <alex.hung@amd.com> wrote:
>>> On 5/26/26 08:17, Melissa Wen wrote:
>>>> Only consider affected colorop states those that are part of an active
>>>> color pipeline or a pipeline that is about to be activated or
>>>> deactivated in the same atomic commit, i.e., colorop is in the 
>>>> chain of
>>>> old/new plane color pipeline property. To cover color_pipeline
>>>> deactivation, remove the condition for plane_state->color_pipeline.
>>>>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_atomic.c | 67 
>>>> +++++++++++++++++++++++++++++++-----
>>>>    1 file changed, 58 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic.c 
>>>> b/drivers/gpu/drm/drm_atomic.c
>>>> index 170de30c28ae..4fb3a23e862a 100644
>>>> --- a/drivers/gpu/drm/drm_atomic.c
>>>> +++ b/drivers/gpu/drm/drm_atomic.c
>>>> @@ -812,6 +812,59 @@ static int drm_atomic_plane_check(const struct 
>>>> drm_plane_state *old_plane_state,
>>>>        return 0;
>>>>    }
>>>>    +/*
>>>> + * This function walks old and new plane state color pipelines and 
>>>> adds all
>>>> + * colorops in use by @plane to the atomic configuration @state. 
>>>> This is useful
>>>> + * when an atomic commit needs to check all currently enabled or 
>>>> about to be
>>>> + * enabled colorop on @plane, e.g. when changing the mode. This 
>>>> also avoids
>>>> + * including colorop states that are not part of the atomic state.
>>>> + *
>>>> + * Returns:
>>>> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the 
>>>> error is EDEADLK
>>>> + * then the w/w mutex code has detected a deadlock and the entire 
>>>> atomic
>>>> + * sequence must be restarted. All other errors are fatal.
>>>> + */
>>>> +static int
>>>> +drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
>>>> +                 struct drm_plane *plane)
>>>> +{
>>>> +    struct drm_colorop *colorop;
>>>> +    struct drm_colorop_state *colorop_state;
>>>> +    struct drm_plane_state *new_plane_state, *old_plane_state;
>>>> +
>>>> +    new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>>> +    old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>>>> +
>>>> +    if (WARN_ON(!new_plane_state || !old_plane_state))
>>>> +        return -EINVAL;
>>>> +
>>>> +    drm_dbg_atomic(plane->dev,
>>>> +               "Adding old+new pipeline colorops for 
>>>> [PLANE:%d:%s]\n",
>>>> +               plane->base.id, plane->name);
>>>> +
>>>> +    for (colorop = new_plane_state->color_pipeline;
>>>> +         colorop;
>>>> +         colorop = colorop->next) {
>>>
>>> This for-loop is used 5 times in this patchset. How about a macro in
>>> drm_colorop.h?
>>>
>>> #define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
>>>       for ((colorop) = (pipeline); (colorop); (colorop) = 
>>> (colorop)->next)
>>
>> Is there a reason struct drm_colorop reinvents lists and doesn't have
>> struct list_head node?
>>
>
> I believe that's because the "next" colorop is exposed as a property 
> (of the current colorop) to userspace. Since the chain is already 
> described by the property, a struct list_head would be redundant.

Also, each color pipeline is an immutable chain of colorops where the 
sequence and position matter: once the chain is built, colorops are 
never added, removed, replaced or walked in reverse. It's a forward-only 
chain that ends when next == NULL, and it directly matches userspace 
mapping. Another point to take into account is that there is no struct 
drm_color_pipeline to hold a list_head yet, since each color pipeline is 
identified by the first colorop element in the chain. Maybe we will want 
a container to link a given pre-blend color pipeline to a specific 
post-blend color pipeline for example, but linking pre- to post-blend 
color pipelines is something we are still not clear about.

Melissa

>
> Harry, others can chime in.
>
> ==
> Chaitanya
>
>> BR,
>> Jani.
>>
>>>
>>>> +        colorop_state = drm_atomic_get_colorop_state(state, colorop);
>>>> +        if (IS_ERR(colorop_state))
>>>> +            return PTR_ERR(colorop_state);
>>>> +    }
>>>> +
>>>> +    /* Same color pipeline as new; no point walking old. */
>>>> +    if (new_plane_state->color_pipeline == 
>>>> old_plane_state->color_pipeline)
>>>> +        return 0;
>>>> +
>>>> +    for (colorop = old_plane_state->color_pipeline;
>>>> +         colorop;
>>>> +         colorop = colorop->next) {
>>>> +        colorop_state = drm_atomic_get_colorop_state(state, colorop);
>>>> +        if (IS_ERR(colorop_state))
>>>> +            return PTR_ERR(colorop_state);
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static void drm_atomic_colorop_print_state(struct drm_printer *p,
>>>>                           const struct drm_colorop_state *state)
>>>>    {
>>>> @@ -1591,11 +1644,9 @@ drm_atomic_add_affected_planes(struct 
>>>> drm_atomic_commit *state,
>>>>            if (IS_ERR(plane_state))
>>>>                return PTR_ERR(plane_state);
>>>>    -        if (plane_state->color_pipeline) {
>>>> -            ret = drm_atomic_add_affected_colorops(state, plane);
>>>> -            if (ret)
>>>> -                return ret;
>>>> -        }
>>>> +        ret = drm_atomic_add_pipeline_colorops(state, plane);
>>>> +        if (ret)
>>>> +            return ret;
>>>>        }
>>>>        return 0;
>>>>    }
>>>> @@ -1607,10 +1658,8 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>>>>     * @plane: DRM plane
>>>>     *
>>>>     * This function walks the current configuration and adds all 
>>>> colorops
>>>> - * currently used by @plane to the atomic configuration @state. 
>>>> This is useful
>>>> - * when an atomic commit also needs to check all currently enabled 
>>>> colorop on
>>>> - * @plane, e.g. when changing the mode. It's also useful when 
>>>> re-enabling a plane
>>>> - * to avoid special code to force-enable all colorops.
>>>> + * currently used by @plane to the atomic configuration @state. 
>>>> It's useful
>>>> + * when re-enabling a plane to avoid special code to force-enable 
>>>> all colorops.
>>>>     *
>>>>     * Since acquiring a colorop state will always also acquire the 
>>>> w/w mutex of the
>>>>     * current plane for that colorop (if there is any) adding all 
>>>> the colorop states for
>>>
>>
>


