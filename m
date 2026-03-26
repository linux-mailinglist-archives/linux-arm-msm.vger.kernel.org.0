Return-Path: <linux-arm-msm+bounces-99990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N+pBUOXxGnn1AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:17:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D232E4AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A0BB3019048
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E56F306B3B;
	Thu, 26 Mar 2026 02:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="n8W5GLQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7116F288
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774491279; cv=none; b=eWN5dbVYJJVRu8QD7XfYxVO1KDSZWfH+1tO3TjJ3XLez5q5cjwDPC97ZvNfF1RFw0d1EpdQlS4dak6eqTFhAOddFeYPw1UaVYoKHmwp7ujF7mNTECCfW+gWq0/LZOpKPuoV5Mh31HPSYl8ugoeprisajYJBQEK0lK1s5JM9UeU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774491279; c=relaxed/simple;
	bh=H1jHRR2IhiZ5BI9XsuZ/e6gyMqvE20b9Y4ZVRhn+HWo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RPVg6hdcId6Q4uEE90I2CizniAnMIsz3NgClKDsOYKF1pNMizaRtCx4X+QsOKc5OB83iusJ0Qu1B3kexBrdu4tIPv2L5RtxdXzLH1dNSw9W+03SnD61rkuBZEqclx3weAsgTx99s0xc9Deu7w9ulUVmPZ1aMRqCQ9V6VRULxKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=n8W5GLQ3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HLWd0aWuu+4SO4K2ECmU29zf9n7Z79Y1dr8RP+/RWIA=; b=n8W5GLQ36aT7+dr9UT1liiuDnP
	pMY4r16wgwtZ1AE+A6Z0X2sRMbwM/6d2cSowleObF+ll/POxJC24G/S7XmiCcKoxILhmMwDw2l1F5
	DmUkymRnheSf+ntysff2oZhJ6ds9MrhtzEUklSQzPoPFj+V/boQ/eskZB+fEUTlCIi1X4Q2UjsbeF
	wzfWU0RYvoRd/OmVCCYk4qhSoBQzzBeWBLaPtKP0LgYAnPsIibQJuLVA3ZhbFT42d9IqWb/mPV8T4
	SuAq3SnMv39FdVBxL6Tf12wN1C3WmWohzN5AFQaHT8cI5023ql1KMfu9mE5e5zd3DRQ9T2upiT3f9
	UTehMj6w==;
Received: from [186.208.74.38] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1w5aEG-00679O-EV; Thu, 26 Mar 2026 03:13:48 +0100
Message-ID: <197d2909-8644-4380-b752-ffef6f300faa@igalia.com>
Date: Wed, 25 Mar 2026 23:13:40 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 1/2] drm/atomic: track individual colorop updates
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>,
 Uma Shankar <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260323131942.494217-1-mwen@igalia.com>
 <20260323131942.494217-2-mwen@igalia.com>
 <feea29b7-fb28-4ac1-be74-b42c52173c59@intel.com>
Content-Language: en-US
In-Reply-To: <feea29b7-fb28-4ac1-be74-b42c52173c59@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99990-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.395];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 5B3D232E4AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 25/03/2026 06:08, Borah, Chaitanya Kumar wrote:
> Hi Melissa,
>
> On 3/23/2026 6:45 PM, Melissa Wen wrote:
>> As we do for CRTC color mgmt properties, use color_mgmt_changed flag to
>> track any value changes in the color pipeline of a given plane, so that
>> drivers can update color blocks as soon as plane color pipeline or
>> individual colorop values change.
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v1
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>
>>   v2: add linux types to provide bool for MSM driver (kernel bot)
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 53 ++++++++++++++++++++++++-------
>>   include/drm/drm_atomic_uapi.h     |  4 ++-
>>   2 files changed, 45 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 87de41fb4459..713fa9e81732 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -265,13 +265,19 @@ EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
>>    *
>>    * Helper function to select the color pipeline on a plane by setting
>>    * it to the first drm_colorop element of the pipeline.
>> + *
>> + * Return: true if plane color pipeline value changed, false otherwise.
>>    */
>> -void
>> +bool
>>   drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
>>                    struct drm_colorop *colorop)
>>   {
>>       struct drm_plane *plane = plane_state->plane;
>>   +    /* Color pipeline didn't change */
>> +    if (plane_state->color_pipeline == colorop)
>> +        return false;
>> +
>>       if (colorop)
>>           drm_dbg_atomic(plane->dev,
>>                      "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
>> @@ -283,6 +289,8 @@ drm_atomic_set_colorop_for_plane(struct 
>> drm_plane_state *plane_state,
>>                      plane->base.id, plane->name, plane_state);
>>         plane_state->color_pipeline = colorop;
>> +
>> +    return true;
>>   }
>>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>>   @@ -600,7 +608,7 @@ static int drm_atomic_plane_set_property(struct 
>> drm_plane *plane,
>>           if (val && !colorop)
>>               return -EACCES;
>>   -        drm_atomic_set_colorop_for_plane(state, colorop);
>> +        state->color_mgmt_changed |= 
>> drm_atomic_set_colorop_for_plane(state, colorop);
>>       } else if (property == config->prop_fb_damage_clips) {
>>           ret = drm_property_replace_blob_from_id(dev,
>>                       &state->fb_damage_clips,
>> @@ -709,11 +717,11 @@ drm_atomic_plane_get_property(struct drm_plane 
>> *plane,
>>   static int drm_atomic_color_set_data_property(struct drm_colorop 
>> *colorop,
>>                             struct drm_colorop_state *state,
>>                             struct drm_property *property,
>> -                          uint64_t val)
>> +                          uint64_t val,
>> +                          bool *replaced)
>>   {
>>       ssize_t elem_size = -1;
>>       ssize_t size = -1;
>> -    bool replaced = false;
>>         switch (colorop->type) {
>>       case DRM_COLOROP_1D_LUT:
>> @@ -735,28 +743,39 @@ static int 
>> drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>>                            &state->data,
>>                            val,
>>                            -1, size, elem_size,
>> -                         &replaced);
>> +                         replaced);
>>   }
>>     static int drm_atomic_colorop_set_property(struct drm_colorop 
>> *colorop,
>>                          struct drm_colorop_state *state,
>>                          struct drm_file *file_priv,
>>                          struct drm_property *property,
>> -                       uint64_t val)
>> +                       uint64_t val,
>> +                       bool *replaced)
>>   {
>>       if (property == colorop->bypass_property) {
>> -        state->bypass = val;
>> +        if (state->bypass != val) {
>> +            state->bypass = val;
>> +            *replaced = true;
>> +        }
>>       } else if (property == colorop->lut1d_interpolation_property) {
>>           colorop->lut1d_interpolation = val;
>>       } else if (property == colorop->curve_1d_type_property) {
>> -        state->curve_1d_type = val;
>> +        if (state->curve_1d_type != val) {
>> +            state->curve_1d_type = val;
>> +            *replaced = true;
>> +        }
>>       } else if (property == colorop->multiplier_property) {
>> -        state->multiplier = val;
>> +        if (state->multiplier != val) {
>> +            state->multiplier = val;
>> +            *replaced = true;
>> +        }
>>       } else if (property == colorop->lut3d_interpolation_property) {
>>           colorop->lut3d_interpolation = val;
>
> I think it would be prudent to add this logic for both the 1dlut and 
> 3dlut interpolation properties. Even though they have just one value 
> exposed right now, that might change in future.

I didn't include interpolations in the color_mgmt_changed logic because 
there is a comment in `include/drm/drm_colorop.h` saying that they are 
read-only.
But thinking better about it, and I think we should not allow 
`drm_atomic_colorop_set_property()` calls to change values of these 
properties if they are read-only.
I didn't track the discussions about what are the plans for these 
properties, how the userspace knows they are read-only properties and 
shouldn't set any value?

>
>>       } else if (property == colorop->data_property) {
>>           return drm_atomic_color_set_data_property(colorop, state,
>> -                              property, val);
>> +                              property, val,
>> +                              replaced);
>>       } else {
>>           drm_dbg_atomic(colorop->dev,
>>                      "[COLOROP:%d:%d] unknown property [PROP:%d:%s]\n",
>> @@ -1273,6 +1292,8 @@ int drm_atomic_set_property(struct 
>> drm_atomic_state *state,
>>       case DRM_MODE_OBJECT_COLOROP: {
>>           struct drm_colorop *colorop = obj_to_colorop(obj);
>>           struct drm_colorop_state *colorop_state;
>> +        struct drm_plane_state *plane_state;
>> +        bool replaced = false;
>>             colorop_state = drm_atomic_get_colorop_state(state, 
>> colorop);
>>           if (IS_ERR(colorop_state)) {
>> @@ -1281,7 +1302,17 @@ int drm_atomic_set_property(struct 
>> drm_atomic_state *state,
>>           }
>>             ret = drm_atomic_colorop_set_property(colorop, 
>> colorop_state,
>> -                              file_priv, prop, prop_value);
>> +                              file_priv, prop, prop_value,
>> +                              &replaced);
>> +        if (ret || !replaced)
>> +            break;
>> +
>> +        plane_state = drm_atomic_get_plane_state(state, 
>> colorop->plane);
>> +        if (IS_ERR(plane_state)) {
>> +            ret = PTR_ERR(plane_state);
>> +            break;
>> +        }
>> +        plane_state->color_mgmt_changed = true;
>
> I am not sure if it was the intention of the uapi design but as I 
> understand there are no guardrails for setting a colorop in an 
> "inactive" pipeline.
>
> So, color_mgmt_changed  is set to true even if a colorop from a color 
> pipeline that is not currently selected(or set to Bypass) by the 
> user-space is changed.
> I guess, the driver needs to be intelligent enough to ignore those 
> colorop but should we reject it at drm core?
>

Thanks for pointing it out, makes sense!
I agree that drm core should reject changes in inactive pipelines.

Melissa


> ==
> Chaitanya
>
>>           break;
>>       }
>>       default:
>> diff --git a/include/drm/drm_atomic_uapi.h 
>> b/include/drm/drm_atomic_uapi.h
>> index 436315523326..4e7e78f711e2 100644
>> --- a/include/drm/drm_atomic_uapi.h
>> +++ b/include/drm/drm_atomic_uapi.h
>> @@ -29,6 +29,8 @@
>>   #ifndef DRM_ATOMIC_UAPI_H_
>>   #define DRM_ATOMIC_UAPI_H_
>>   +#include <linux/types.h>
>> +
>>   struct drm_crtc_state;
>>   struct drm_display_mode;
>>   struct drm_property_blob;
>> @@ -50,7 +52,7 @@ drm_atomic_set_crtc_for_plane(struct 
>> drm_plane_state *plane_state,
>>                     struct drm_crtc *crtc);
>>   void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>>                    struct drm_framebuffer *fb);
>> -void drm_atomic_set_colorop_for_plane(struct drm_plane_state 
>> *plane_state,
>> +bool drm_atomic_set_colorop_for_plane(struct drm_plane_state 
>> *plane_state,
>>                         struct drm_colorop *colorop);
>>   int __must_check
>>   drm_atomic_set_crtc_for_connector(struct drm_connector_state 
>> *conn_state,
>


