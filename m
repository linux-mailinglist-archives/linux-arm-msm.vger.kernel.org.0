Return-Path: <linux-arm-msm+bounces-108500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H/VBbBeDGq5gQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:59:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A857F2ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFF543080598
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED1123392F;
	Tue, 19 May 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="H+urp8KG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB44C4DD6C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195120; cv=none; b=lcay6HUTwgIYV6q85fGc1ALkpjd5G8/en0LvMnjwn1A5aTYEXG/qabw/Hvb7irpDMO3uq+ooyiohXr7YCi0nluXwYgFqsHJ7RnFk+wxPe42Ky+elyVlGwFDTmG3+qaXZ5iG11mUUQZ/uBOD3sXnUx5nI+yD3ijWBPBsJ2V0uj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195120; c=relaxed/simple;
	bh=qu6FTWFYVso42efRoQD8HyqQZiShQZ8hKsfv4T/MtC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2IMZuoCVH/ZSfMGeqzOo9riQCM5JXc6MlurTgy1S2XZLc0Kbhmy9kWLP5WAWfJAjKlAfLy0uwmZVneAnHbo6W6ktyLSzpux4D2h3bfBnNVJDjStXmL9MrVoFElKuhoHKxeLmdhyhQdd3dJjjsfr7XTTTdL9uOtA2x8Ig+nYJYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=H+urp8KG; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cfUHy9KSo8K972nVD6fnaOvu27yUkn04KTC6aSFDpbo=; b=H+urp8KG8Q/OPKqF+nLtNhza5C
	/4xTlP81WkV4MSgkRaKRBRXtQTFSfrFpQx6+Wbj7ZiZpvVnsRhOdWWuT1p0mvMPxu8SF98ENe6bBh
	CXdFXCy8IXVezv4WDsVhd7B1grFT4FnkiVPwfkJcYyeLwLFRgTf5BAiB61M0xvqpyyF9uKVghtWk0
	SeAhNJrB9a9bvhcDXZQ9Jkg5YjFqArMR0XqooE6niuxXVPzUZ+byVxMBrjUCm0QI3Xq7qhDH9p9yf
	6PKJhvcolbMcWBRdoQnXdg52KT9XMlzhc5dSAnNqY4PF2ieAQ28lBB+2Fwhev4LuHAzvkcqYcZqMt
	3hqmf+4g==;
Received: from [79.117.146.159] (helo=[192.168.1.135])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wPJuU-003B6b-VR; Tue, 19 May 2026 14:50:59 +0200
Message-ID: <9e288357-01b1-40b3-a83d-744168a60e90@igalia.com>
Date: Tue, 19 May 2026 14:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/atomic: don't set colorop properties of
 inactive color pipelines
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>,
 Uma Shankar <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260506192633.16066-1-mwen@igalia.com>
 <20260506192633.16066-3-mwen@igalia.com>
 <cd1d9fd2-8026-44ad-a0d3-d317dc1fb28d@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <cd1d9fd2-8026-44ad-a0d3-d317dc1fb28d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108500-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: 8E8A857F2ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18/05/2026 13:42, Borah, Chaitanya Kumar wrote:
>
>
> On 5/7/2026 12:53 AM, Melissa Wen wrote:
>> Reject attempts to change property values of a colorop that is not
>> part of an active plane color pipeline.
>>
>> Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 34 ++++++++++++++++++++++++++-----
>>   1 file changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 5bd5bf6661df..bff8d58f8f12 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1275,15 +1275,38 @@ int drm_atomic_set_property(struct 
>> drm_atomic_state *state,
>>           break;
>>       }
>>       case DRM_MODE_OBJECT_COLOROP: {
>> -        struct drm_colorop *colorop = obj_to_colorop(obj);
>> -        struct drm_colorop_state *colorop_state;
>> +        struct drm_colorop *active_colorop, *colorop = 
>> obj_to_colorop(obj);
>> +        struct drm_colorop_state *colorop_state = NULL;
>> +        struct drm_plane_state *plane_state;
>>   -        colorop_state = drm_atomic_get_colorop_state(state, colorop);
>> -        if (IS_ERR(colorop_state)) {
>> -            ret = PTR_ERR(colorop_state);
>> +        plane_state = drm_atomic_get_plane_state(state, 
>> colorop->plane);
>> +        if (IS_ERR(plane_state)) {
>> +            ret = PTR_ERR(plane_state);
>>               break;
>>           }
>
> Hmmm, this creates a dependency on the call order of 
> drm_atomic_set_property() for color pipeline and the color op. :(

I can move this check to drm_atomic_check_only(). This approach will 
create colorop states that will be rejected in the end, but at least it 
won't be affected by the call order.

Lemme prepare a series with this alternative approach.

Thanks for your reviews!

Melissa

>
> Not sure if there is a good way to solve this.
>
>>   +        /* Check if the colorop obj is part of an active color 
>> pipeline */
>> +        for (active_colorop = plane_state->color_pipeline;
>> +             active_colorop;
>> +             active_colorop = active_colorop->next) {
>> +            if (active_colorop == colorop) {
>> +                colorop_state = drm_atomic_get_colorop_state(state, 
>> colorop);
>> +                if (IS_ERR(colorop_state)) {
>> +                    ret = PTR_ERR(colorop_state);
>> +                    goto err;
>> +                }
>> +                break;
>> +            }
>> +        }
>> +
>> +        if (!colorop_state) {
>> +            drm_dbg_atomic(prop->dev,
>> +                       "[COLOROP:%d:%d] not part of the active 
>> pipeline\n",
>> +                    obj->id, colorop->type);
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>> +
>>           ret = drm_atomic_colorop_set_property(colorop, colorop_state,
>>                                 file_priv, prop, prop_value);
>>           break;
>> @@ -1294,6 +1317,7 @@ int drm_atomic_set_property(struct 
>> drm_atomic_state *state,
>>           break;
>>       }
>>   +err:
>>       drm_property_change_valid_put(prop, ref);
>>       return ret;
>>   }
>


