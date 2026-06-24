Return-Path: <linux-arm-msm+bounces-114420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tnTBLhM5PGrclQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 22:07:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B579C6C12CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 22:07:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b="QfCoim/I";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF3A9300601E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF87D1A3165;
	Wed, 24 Jun 2026 20:07:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77A3A1DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 20:07:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782331661; cv=none; b=NY1dMNgTy4ejd94TmExtuJyTGLkOCv7T6jlHvSn2Kg/Kx6HrZw0JGp6kwHCmGbVmrHSWhI4B2u0yW9Ckjks6Y0EK18buBbyzjyX3H1bgCTjgEE4P5aMxiF9kdJYuWaJ8mjtRtjZFarbxK5fW503pAS87kW5eBxg98pkm1SlyO+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782331661; c=relaxed/simple;
	bh=foGA66VAmOVcefcFH7mvC5r9TROkHRzlL7eZux1kJrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gea2jt1BnKb6K0cYHLeOqCLHia2ny+ksAMBwf9W5zo5rWSUT/Gv9X1FCkF/9W3LM41D4lF0WuUezxKXNvSEFlx4HCVax9TS6/BSE7zKyi/1WaXbKz5FJ6eNEalPruTz8qcBcrxUlNQr646ml8DFgfLjrylFIW5BGfJaZg+5+3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QfCoim/I; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B0ETmLsDz/XVBuwzqitBH0wFYxmqpWrL4BOyECmY5VQ=; b=QfCoim/IEI+aHDNEu1lC4dJOu4
	RNM5LFfLgb4TBaUai3COr23X+5WPn85amiGspv3/AtOFswEmd54+XjyY9JHks3sK4l5ZMDj/DwH5O
	CiY1PWraq9zSxsZHZCsrxm4bvuupAGRn9wgoX21xeWWbXPQB4gduXNH1eS3Un0M1ql+l1SP2CM/8u
	vPS6n9p68tvLqvBlAlbVOyQ3+BfMKebUfROxgDiqR/GhJ1ZVDaAuREHtn+aySX0pDxaxW8oTPYnQM
	LoD1yRsfYFVpbOL4d3lEG2oxFlbHU15W2RPZKJ0wXncbAAMOkI2LZzegBJxFVBtrB/0qttutlcWfU
	FsjhBlWw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wcTrs-004kP9-Tm; Wed, 24 Jun 2026 22:06:41 +0200
Message-ID: <d1e604dd-5e84-464e-ba85-4183eef6bb0e@Igalia.com>
Date: Wed, 24 Jun 2026 22:06:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/atomic: only add states of active or transient
 active colorops
To: Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
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
 dri-devel@lists.freedesktop.org
References: <20260526142940.504911-1-mwen@igalia.com>
 <20260526142940.504911-2-mwen@igalia.com>
 <e8aaf4da-8fb6-4d6a-95d6-563ac0562b49@amd.com>
 <4452e675c4853faf665b520a8932a960946206bb@intel.com>
 <f9e5f9ed-ed15-40ae-9330-44f8c42f5f98@intel.com>
 <cb0599d2-9dd5-4e93-b21e-b843f4a79182@igalia.com>
 <0a0a4d13-9821-4a74-82f5-5309a1e168ca@Igalia.com>
 <09d1d978-0519-466b-8c81-fc045c415209@amd.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <09d1d978-0519-466b-8c81-fc045c415209@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-114420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:mwen@igalia.com,m:chaitanya.kumar.borah@intel.com,m:jani.nikula@linux.intel.com,m:alex.hung@amd.com,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:contact@emersion.fr,m:uma.shankar@intel.com,m:xaver.hugl@kde.org,m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:matthew.schwartz@linux.dev,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,intel.com,linux.intel.com,gmail.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,igalia.com,lists.freedesktop.org,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B579C6C12CD

On 6/24/26 21:01, Harry Wentland wrote:
> On 2026-06-09 13:23, John Harrison wrote:
>> On 6/3/26 04:27, Melissa Wen wrote:
>>> On 01/06/2026 11:24, Borah, Chaitanya Kumar wrote:
>>>> On 5/29/2026 7:16 PM, Jani Nikula wrote:
>>>>> On Tue, 26 May 2026, Alex Hung <alex.hung@amd.com> wrote:
>>>>>> On 5/26/26 08:17, Melissa Wen wrote:
>>>>>>> Only consider affected colorop states those that are part of an active
>>>>>>> color pipeline or a pipeline that is about to be activated or
>>>>>>> deactivated in the same atomic commit, i.e., colorop is in the chain of
>>>>>>> old/new plane color pipeline property. To cover color_pipeline
>>>>>>> deactivation, remove the condition for plane_state->color_pipeline.
>>>>>>>
>>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/drm_atomic.c | 67 +++++++++++++++++++++++++++++++-----
>>>>>>>     1 file changed, 58 insertions(+), 9 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>>>>>>> index 170de30c28ae..4fb3a23e862a 100644
>>>>>>> --- a/drivers/gpu/drm/drm_atomic.c
>>>>>>> +++ b/drivers/gpu/drm/drm_atomic.c
>>>>>>> @@ -812,6 +812,59 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>>     +/*
>>>>>>> + * This function walks old and new plane state color pipelines and adds all
>>>>>>> + * colorops in use by @plane to the atomic configuration @state. This is useful
>>>>>>> + * when an atomic commit needs to check all currently enabled or about to be
>>>>>>> + * enabled colorop on @plane, e.g. when changing the mode. This also avoids
>>>>>>> + * including colorop states that are not part of the atomic state.
>>>>>>> + *
>>>>>>> + * Returns:
>>>>>>> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
>>>>>>> + * then the w/w mutex code has detected a deadlock and the entire atomic
>>>>>>> + * sequence must be restarted. All other errors are fatal.
>>>>>>> + */
>>>>>>> +static int
>>>>>>> +drm_atomic_add_pipeline_colorops(struct drm_atomic_commit *state,
>>>>>>> +                 struct drm_plane *plane)
>>>>>>> +{
>>>>>>> +    struct drm_colorop *colorop;
>>>>>>> +    struct drm_colorop_state *colorop_state;
>>>>>>> +    struct drm_plane_state *new_plane_state, *old_plane_state;
>>>>>>> +
>>>>>>> +    new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>>>>>> +    old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>>>>>>> +
>>>>>>> +    if (WARN_ON(!new_plane_state || !old_plane_state))
>>>>>>> +        return -EINVAL;
>>>>>>> +
>>>>>>> +    drm_dbg_atomic(plane->dev,
>>>>>>> +               "Adding old+new pipeline colorops for [PLANE:%d:%s]\n",
>>>>>>> +               plane->base.id, plane->name);
>>>>>>> +
>>>>>>> +    for (colorop = new_plane_state->color_pipeline;
>>>>>>> +         colorop;
>>>>>>> +         colorop = colorop->next) {
>>>>>> This for-loop is used 5 times in this patchset. How about a macro in
>>>>>> drm_colorop.h?
>>>>>>
>>>>>> #define drm_for_each_colorop_in_pipeline(colorop, pipeline) \
>>>>>>        for ((colorop) = (pipeline); (colorop); (colorop) = (colorop)->next)
>>>>> Is there a reason struct drm_colorop reinvents lists and doesn't have
>>>>> struct list_head node?
>>>>>
>>>> I believe that's because the "next" colorop is exposed as a property (of the current colorop) to userspace. Since the chain is already described by the property, a struct list_head would be redundant.
>>> Also, each color pipeline is an immutable chain of colorops where the sequence and position matter: once the chain is built, colorops are never added, removed, replaced or walked in reverse. It's a forward-only chain that ends when next == NULL, and it directly matches userspace mapping. Another point to take into account is that there is no struct drm_color_pipeline to hold a list_head yet, since each color pipeline is identified by the first colorop element in the chain. Maybe we will want a container to link a given pre-blend color pipeline to a specific post-blend color pipeline for example, but linking pre- to post-blend color pipelines is something we are still not clear about.
>>>
>>> Melissa
>>>
>> "there is no struct drm_color_pipeline to hold a list_head" <-- I think this is the real reason. It is possible to convert to use a proper list structure, but the result is slightly messy. I had a quick go at it to see how messy:
>>      https://patchwork.freedesktop.org/series/168200/
>>
> Yeah, Melissa and Chaitanya pretty much described why they work the way they do. I'm not sure it makes sense to replace the mechanism with lists and any attempt to do so should make sure not to break userspace ABI. I'm not opposed to improvements either if anyone finds a solution that makes everyone's lives easier.
>
> Harry
@Harry, the patch series I linked above does the conversion. It does not 
affect the user space ABI at all, only the internal kernel operation is 
changed. I think it is better in some ways but maybe not in others. If 
you would like to take a look, any feedback would be appreciated.

Thanks,
John.


>
>> John.
>>
>>>> Harry, others can chime in.
>>>>
>>>> ==
>>>> Chaitanya
>>>>
>>>>> BR,
>>>>> Jani.
>>>>>
>>>>>>> +        colorop_state = drm_atomic_get_colorop_state(state, colorop);
>>>>>>> +        if (IS_ERR(colorop_state))
>>>>>>> +            return PTR_ERR(colorop_state);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Same color pipeline as new; no point walking old. */
>>>>>>> +    if (new_plane_state->color_pipeline == old_plane_state->color_pipeline)
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    for (colorop = old_plane_state->color_pipeline;
>>>>>>> +         colorop;
>>>>>>> +         colorop = colorop->next) {
>>>>>>> +        colorop_state = drm_atomic_get_colorop_state(state, colorop);
>>>>>>> +        if (IS_ERR(colorop_state))
>>>>>>> +            return PTR_ERR(colorop_state);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>     static void drm_atomic_colorop_print_state(struct drm_printer *p,
>>>>>>>                            const struct drm_colorop_state *state)
>>>>>>>     {
>>>>>>> @@ -1591,11 +1644,9 @@ drm_atomic_add_affected_planes(struct drm_atomic_commit *state,
>>>>>>>             if (IS_ERR(plane_state))
>>>>>>>                 return PTR_ERR(plane_state);
>>>>>>>     -        if (plane_state->color_pipeline) {
>>>>>>> -            ret = drm_atomic_add_affected_colorops(state, plane);
>>>>>>> -            if (ret)
>>>>>>> -                return ret;
>>>>>>> -        }
>>>>>>> +        ret = drm_atomic_add_pipeline_colorops(state, plane);
>>>>>>> +        if (ret)
>>>>>>> +            return ret;
>>>>>>>         }
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>> @@ -1607,10 +1658,8 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
>>>>>>>      * @plane: DRM plane
>>>>>>>      *
>>>>>>>      * This function walks the current configuration and adds all colorops
>>>>>>> - * currently used by @plane to the atomic configuration @state. This is useful
>>>>>>> - * when an atomic commit also needs to check all currently enabled colorop on
>>>>>>> - * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
>>>>>>> - * to avoid special code to force-enable all colorops.
>>>>>>> + * currently used by @plane to the atomic configuration @state. It's useful
>>>>>>> + * when re-enabling a plane to avoid special code to force-enable all colorops.
>>>>>>>      *
>>>>>>>      * Since acquiring a colorop state will always also acquire the w/w mutex of the
>>>>>>>      * current plane for that colorop (if there is any) adding all the colorop states for


