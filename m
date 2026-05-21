Return-Path: <linux-arm-msm+bounces-109103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGULL2YTD2otFAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:15:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FEC5A6FC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D467312D8E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB6A32B125;
	Thu, 21 May 2026 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kHkJGorh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A83CBE97
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370108; cv=none; b=ivCBeJYNrsoxiEDvL+qO158+KjrXR8jirEuWeeP10Zf59/9XwvbFF0oGjEdSg65s+wCO63D5E7rVplVBptrXuvwE83mbD4UVATBVUF1R7mDlgjJDoM8N3BWmZBt0NszOqhS2fu9tfldg+15n2DzL9zjFor/WzK0g4S1xa52ZKeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370108; c=relaxed/simple;
	bh=GhOJi6xvx8tpqyZA2u449mNqeG4munbUkle3RhIRQ3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rau2fEDGD0i6QL2B+EjMeHOnOYZTAbof8EhB3Woz56cmekB4sGksMLc0xrFMWSg1Xn00qCx/mMP8pZwoj03SKuTdHprl5jj/g1fLGnhw/5PgoV5Th1dJeZsh9VkxIbq0nJXJUfdKDrGiCJjCxqCw0+iA/B+tf0jR5nFUK7vh5XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kHkJGorh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1pt8cC1q/6uiiKUcEF8O51ow/PRF5dt+UW1IXwaqmeI=; b=kHkJGorhA+vU2fWMYTRysB2GW0
	yoAQesc8hnkUV+WgFa0gcQr+nl04M4mnkBWjhsD5q9xVHPvU9i4e/IqWZcKRYjXGkSlcyKXP70anZ
	l5EcNJg2uhbMESmQfEMhTQmKuWmWh0w+MsJ5vn2uHdppoZgtJ//q5KtjlYIkiNDQrVaQzePoQuuKn
	y3SF8XJ2HFzuJVT+Takvl7kLO84h4DcbAoJpWduxD0b9zkPJ4jElp+LHgZA38CdvfLxUUMkN/cjWg
	EpkN2ag7iNi8/bNcoDfSASHxTUJyUckv4aw4n89uRRd0euqCg03Ib4FsJy/vlIARFhfsonEcy1ZcR
	vY7Gc3AA==;
Received: from [79.117.146.159] (helo=[192.168.1.135])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wQ3RN-004MeT-2b; Thu, 21 May 2026 15:27:57 +0200
Message-ID: <86bb4dc7-ba05-418f-8978-4d9e8fd6a3a7@igalia.com>
Date: Thu, 21 May 2026 15:27:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/colorop: make lut(1/3)d_interpolation mutable
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
References: <20260519211111.228303-1-mwen@igalia.com>
 <20260519211111.228303-5-mwen@igalia.com>
 <ebee1103-c76e-46c3-9a71-84f5e84fd76c@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <ebee1103-c76e-46c3-9a71-84f5e84fd76c@intel.com>
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
	TAGGED_FROM(0.00)[bounces-109103-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,igalia.com:mid,igalia.com:email,intel.com:email]
X-Rspamd-Queue-Id: 36FEC5A6FC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/05/2026 13:17, Borah, Chaitanya Kumar wrote:
>
>
> On 5/20/2026 2:39 AM, Melissa Wen wrote:
>> As it's not immutable anymore, any changes should be handled by
>> drm_colorop_state. Move their enum and make it correctly behaves as
>> mutable.
>>
>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>
>> ---
>>
>> v6:
>> - check drm_object_property_get_default_value() before set interp props
>> ---
>>   drivers/gpu/drm/drm_atomic.c      |  4 ++--
>>   drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++----
>>   drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++--
>>   include/drm/drm_colorop.h         | 28 ++++++++++++++--------------
>>   4 files changed, 34 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index 659cf56150e5..b26212e719b2 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -857,7 +857,7 @@ static void drm_atomic_colorop_print_state(struct 
>> drm_printer *p,
>>       case DRM_COLOROP_1D_LUT:
>>           drm_printf_indent(p, 1, "size=%d\n", colorop->size);
>>           drm_printf_indent(p, 1, "interpolation=%s\n",
>> - 
>> drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
>> + drm_get_colorop_lut1d_interpolation_name(state->lut1d_interpolation));
>>           drm_printf_indent(p, 1, "data blob id=%d\n", state->data ? 
>> state->data->base.id : 0);
>>           break;
>>       case DRM_COLOROP_CTM_3X4:
>> @@ -869,7 +869,7 @@ static void drm_atomic_colorop_print_state(struct 
>> drm_printer *p,
>>       case DRM_COLOROP_3D_LUT:
>>           drm_printf_indent(p, 1, "size=%d\n", colorop->size);
>>           drm_printf_indent(p, 1, "interpolation=%s\n",
>> - 
>> drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
>> + drm_get_colorop_lut3d_interpolation_name(state->lut3d_interpolation));
>>           drm_printf_indent(p, 1, "data blob id=%d\n", state->data ? 
>> state->data->base.id : 0);
>>           break;
>>       default:
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 6441b55cc274..78423905051e 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -751,13 +751,13 @@ static int 
>> drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>>       if (property == colorop->bypass_property) {
>>           state->bypass = val;
>>       } else if (property == colorop->lut1d_interpolation_property) {
>> -        colorop->lut1d_interpolation = val;
>> +        state->lut1d_interpolation = val;
>>       } else if (property == colorop->curve_1d_type_property) {
>>           state->curve_1d_type = val;
>>       } else if (property == colorop->multiplier_property) {
>>           state->multiplier = val;
>>       } else if (property == colorop->lut3d_interpolation_property) {
>> -        colorop->lut3d_interpolation = val;
>> +        state->lut3d_interpolation = val;
>>       } else if (property == colorop->data_property) {
>>           return drm_atomic_color_set_data_property(colorop, state,
>>                                 property, val);
>> @@ -782,7 +782,7 @@ drm_atomic_colorop_get_property(struct 
>> drm_colorop *colorop,
>>       else if (property == colorop->bypass_property)
>>           *val = state->bypass;
>>       else if (property == colorop->lut1d_interpolation_property)
>> -        *val = colorop->lut1d_interpolation;
>> +        *val = state->lut1d_interpolation;
>>       else if (property == colorop->curve_1d_type_property)
>>           *val = state->curve_1d_type;
>>       else if (property == colorop->multiplier_property)
>> @@ -790,7 +790,7 @@ drm_atomic_colorop_get_property(struct 
>> drm_colorop *colorop,
>>       else if (property == colorop->size_property)
>>           *val = colorop->size;
>>       else if (property == colorop->lut3d_interpolation_property)
>> -        *val = colorop->lut3d_interpolation;
>> +        *val = state->lut3d_interpolation;
>>       else if (property == colorop->data_property)
>>           *val = (state->data) ? state->data->base.id : 0;
>>       else
>> diff --git a/drivers/gpu/drm/drm_colorop.c 
>> b/drivers/gpu/drm/drm_colorop.c
>> index 764d12060666..b0a9a8094dfe 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -342,7 +342,6 @@ int drm_plane_colorop_curve_1d_lut_init(struct 
>> drm_device *dev, struct drm_color
>>         colorop->lut1d_interpolation_property = prop;
>>       drm_object_attach_property(&colorop->base, prop, interpolation);
>> -    colorop->lut1d_interpolation = interpolation;
>>         /* data */
>>       ret = drm_colorop_create_data_prop(dev, colorop);
>> @@ -442,7 +441,6 @@ int drm_plane_colorop_3dlut_init(struct 
>> drm_device *dev, struct drm_colorop *col
>>         colorop->lut3d_interpolation_property = prop;
>>       drm_object_attach_property(&colorop->base, prop, interpolation);
>> -    colorop->lut3d_interpolation = interpolation;
>>         /* data */
>>       ret = drm_colorop_create_data_prop(dev, colorop);
>> @@ -521,6 +519,20 @@ static void __drm_colorop_state_reset(struct 
>> drm_colorop_state *colorop_state,
>>                                  &val))
>>               colorop_state->curve_1d_type = val;
>>       }
>> +
>> +    if (colorop->lut1d_interpolation_property) {
>> + if(!drm_object_property_get_default_value(&colorop->base,
>> + colorop->lut1d_interpolation_property,
>> +                              &val));
>> +            colorop_state->lut1d_interpolation = val;
>> +    }
>> +
>> +    if (colorop->lut3d_interpolation_property) {
>> + if(!drm_object_property_get_default_value(&colorop->base,
>> + colorop->lut3d_interpolation_property,
>> +                              &val);
>> +            colorop_state->lut3d_interpolation = val;
>> +    }
>
> I see you fixed the ; in the next patch, better to fix it within this 
> patch. Also needs space between if and (.

Ouch, thanks for pointing it out.

>
>>   }
>>     /**
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index 53a2148082d5..d08a6a8a8392 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -183,6 +183,20 @@ struct drm_colorop_state {
>>        */
>>       struct drm_property_blob *data;
>>   +    /**
>> +     * @lut1d_interpolation:
>> +     *
>> +     * Interpolation for DRM_COLOROP_1D_LUT
>> +     */
>> +    enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
>> +
>> +    /**
>> +     * @lut3d_interpolation:
>> +     *
>> +     * Interpolation for DRM_COLOROP_3D_LUT
>> +     */
>> +    enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
>> +
>>       /** @state: backpointer to global drm_atomic_commit */
>>       struct drm_atomic_commit *state;
>>   };
>> @@ -306,20 +320,6 @@ struct drm_colorop {
>>        */
>>       uint32_t size;
>>   -    /**
>> -     * @lut1d_interpolation:
>> -     *
>> -     * Interpolation for DRM_COLOROP_1D_LUT
>> -     */
>> -    enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
>> -
>> -    /**
>> -     * @lut3d_interpolation:
>> -     *
>> -     * Interpolation for DRM_COLOROP_3D_LUT
>> -     */
>> -    enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
>> -
>>       /**
>>        * @lut1d_interpolation_property:
>>        *
>


