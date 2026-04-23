Return-Path: <linux-arm-msm+bounces-104216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FFVEJLR6Wm9kgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:00:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B444E420
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7505B3007CAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A333451CE;
	Thu, 23 Apr 2026 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uxA1ifH9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tYbcOygt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uxA1ifH9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tYbcOygt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF62E62B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 07:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931130; cv=none; b=Wv7H1S2fx02wqkOOa7zquEUHe0dNEv2ULZ6fjSBbHPIfjcsUDxFz7gB+OneeaoBWfQCmGA25FAqWmO+mSMWwaHfhCDQkFT6dkzvMt7Y8HFeJ5BGf8droBlaLHRnRL+IRnPPI4zOENQlpkUuLbRRr1vecw6gLUGkd3dfXHqz+N0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931130; c=relaxed/simple;
	bh=x4BIMmNjV+GaviRjQMA3gkmgtVYkfr8E0ZOD8QqZdLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbMXVAhs3snYKGFXT8p1L3s/dp2grxxLLyZD4Ox4uWRq7g8bxF2g6frr2qlwioIBWi0zfmznxCHJarZTrPSIRcOQlZpw5J3FRMEuxaD3YQrkAJdVN5LzV9Jezryp/lRw+EytRwHNIsk2qHSEHjw6pX8cfViSxWscrKsxQFDzKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uxA1ifH9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tYbcOygt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uxA1ifH9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tYbcOygt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D1426A844;
	Thu, 23 Apr 2026 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776931126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q8pTHjOBe16sd6ffSKsMW34CU0TTHy47Iw8rAMAOfxk=;
	b=uxA1ifH9n5VfzHuM5MjDE+XjulMSjtec+ddyEP5BYSrIhmLRNsrOEKao8ti6wLUqQolZAY
	3Q0vAFFYBV7XthuyTAaglVhZT55NHPGMnqstKEqmtRPvz8FxWJmkQ8ISpAZF9Dc0NVGgcO
	dz7T84PHRN9aQ0xhVoDaUYmqnLlrJac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776931126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q8pTHjOBe16sd6ffSKsMW34CU0TTHy47Iw8rAMAOfxk=;
	b=tYbcOygt/71xdIC9pPy1r70vnPb1GGch/k7WF2gG3DbTi//v29SdzC4BqXEiLmIwFmJ42/
	7VlHfkPJC0nZMVCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776931126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q8pTHjOBe16sd6ffSKsMW34CU0TTHy47Iw8rAMAOfxk=;
	b=uxA1ifH9n5VfzHuM5MjDE+XjulMSjtec+ddyEP5BYSrIhmLRNsrOEKao8ti6wLUqQolZAY
	3Q0vAFFYBV7XthuyTAaglVhZT55NHPGMnqstKEqmtRPvz8FxWJmkQ8ISpAZF9Dc0NVGgcO
	dz7T84PHRN9aQ0xhVoDaUYmqnLlrJac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776931126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q8pTHjOBe16sd6ffSKsMW34CU0TTHy47Iw8rAMAOfxk=;
	b=tYbcOygt/71xdIC9pPy1r70vnPb1GGch/k7WF2gG3DbTi//v29SdzC4BqXEiLmIwFmJ42/
	7VlHfkPJC0nZMVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39EC7593A3;
	Thu, 23 Apr 2026 07:58:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xFQ2DDbR6WlZVAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Apr 2026 07:58:46 +0000
Message-ID: <837457c1-2a4b-417d-80a6-a7ca43642838@suse.de>
Date: Thu, 23 Apr 2026 09:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm: fbdev: Calculate buffer geometry with format
 helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <20260421125733.209568-5-tzimmermann@suse.de>
 <kywf5seogl4dmh6msqcmfyxdxyg7i5y2jyr2z6fcbu7qrpemhy@nemrwv3lyg7i>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <kywf5seogl4dmh6msqcmfyxdxyg7i5y2jyr2z6fcbu7qrpemhy@nemrwv3lyg7i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: EE6B444E420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

Am 22.04.26 um 02:07 schrieb Dmitry Baryshkov:
> On Tue, Apr 21, 2026 at 02:51:17PM +0200, Thomas Zimmermann wrote:
>> Replace the geometry and size calculation in msm's fbdev emulation
>> with DRM format helpers. This consists of a 4CC lookup from the fbdev
>> parameters, format lookup, pitch calculation and size calculation.
>> Then allocate the GEM buffer object for the framebuffer memory from
>> the calculated size.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.h   |  7 -------
>>   drivers/gpu/drm/msm/msm_fbdev.c | 26 ++++++++++++--------------
>>   2 files changed, 12 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>> index b3173fa4d222..00c50d7437d6 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -509,13 +509,6 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>>   #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>   
>> -static inline int align_pitch(int width, int bpp)
>> -{
>> -	int bytespp = (bpp + 7) / 8;
>> -	/* adreno needs pitch aligned to 32 pixels: */
>> -	return bytespp * ALIGN(width, 32);
>> -}
>> -
>>   /* for the generated headers: */
>>   #define INVALID_IDX(idx) ({BUG(); 0;})
>>   #define fui(x)                ({BUG(); 0;})
>> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
>> index 1eb0368a6d07..5532c5779f17 100644
>> --- a/drivers/gpu/drm/msm/msm_fbdev.c
>> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
>> @@ -95,23 +95,25 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>>   	struct fb_info *fbi = helper->info;
>>   	struct drm_mode_fb_cmd2 mode_cmd = { };
>>   	struct drm_framebuffer *fb = NULL;
>> +	const struct drm_format_info *format;
>> +	u32 fourcc, pitch;
>> +	u64 size;
>>   	struct drm_gem_object *bo;
>>   	uint64_t paddr;
>> -	uint32_t format;
>> -	int ret, pitch;
>> -	int size;
>> -
>> -	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
>> +	int ret;
>>   
>>   	DBG("create fbdev: %dx%d@%d (%dx%d)", sizes->surface_width,
>>   			sizes->surface_height, sizes->surface_bpp,
>>   			sizes->fb_width, sizes->fb_height);
>>   
>> -	pitch = align_pitch(sizes->surface_width, sizes->surface_bpp);
>> +	fourcc = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
>> +	format = drm_get_format_info(dev, fourcc, DRM_FORMAT_MOD_LINEAR);
>> +	/* adreno needs pitch aligned to 32 pixels: */
>> +	pitch = drm_format_info_min_pitch(format, 0, ALIGN(sizes->surface_width, 32));
>> +	size = ALIGN(pitch * sizes->surface_height, PAGE_SIZE);
> Hmm, why do we need to align the size to the PAGE_SIZE? I might be
> missing a point, but it would be nice to mention it in the commit
> message.

This buffer will be mmap'ed to user space and fbdev's mmap of course 
requires page-aligned sizes.  Hence the alignment here. Msm's memory 
manager should take care of this, but it doesn't hurt to request it 
specifically.

On a more general note: while we use this GEM buffer object for backing 
the DRM framebuffer, it is better to think of it as fbdev framebuffer 
memory.

I'll update the commit description accordingly.

Best regards
Thomas


>
> Other than that, LGTM.
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



