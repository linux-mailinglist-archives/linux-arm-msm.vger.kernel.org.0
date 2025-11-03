Return-Path: <linux-arm-msm+bounces-80063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF1DC2A7E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 09:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D380A346367
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 08:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF71298CB2;
	Mon,  3 Nov 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A4qoqF55";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x655JdzP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A4qoqF55";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x655JdzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97B26560A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157354; cv=none; b=XFUe29v5uwHKt7i6V8e3FclPwzHUNH844hCHSQfZgysYOfp5GcQrlvqaUcU1saOcGPRxeBPbilJQDcFHzcL5Uw/IT7jJjfuOwb69iIHMPdoaNWiZmjb1JOirjPPTPu9zx8fPJwhPJp8cAANpNajxrJyEAPxSEyTrVZHMi6er3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157354; c=relaxed/simple;
	bh=Vlhw73ppmfu1j9rxIsLj7KX+usgfj87ftnAJZlnjoRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiDLhmcgyQuxPtE6zZ6PxdAkS/TkUiY9B1zAPu1awUSOuqJAEQ8kFcUjUX7AbFVun8TvnffIgZZh9SbUwPRmuwG6dxXfQoSzaZWs0bmEvt2XM0+WehBrPX8WM/I1/tbUMGrn0dLoYCti3fwxVgHyKXt2D5V/lC/8XWQ/okFzWR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A4qoqF55; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x655JdzP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A4qoqF55; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x655JdzP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B3031F766;
	Mon,  3 Nov 2025 08:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762157350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VKEz7jF5B4ooGLr9O31wK/4JWQbfcbQTlr2Qtv1zupA=;
	b=A4qoqF55edeej0Gi2mCQy3/MyLXpJnRpXzBSCVRKDz9OI0b+rqfqXi2ymsvSp4p3eV5dgu
	D7x7iK+iQ2hW0bROGVTvATsRxYrtjgiOfPzmnJ5RbkMdZS5UBfW4+ixXlZYCc0OPl+4dBl
	TaCbAcmDrXeb4qKOZtjX/9Ys6CbbME0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762157350;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VKEz7jF5B4ooGLr9O31wK/4JWQbfcbQTlr2Qtv1zupA=;
	b=x655JdzPcyKGMWf2urKCw15dH1GR1dgZS4saUvE3dwPglx6bee1GwyPCZSdeAokY2H8Z/h
	vsXtKt50tO69ZJAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A4qoqF55;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=x655JdzP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762157350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VKEz7jF5B4ooGLr9O31wK/4JWQbfcbQTlr2Qtv1zupA=;
	b=A4qoqF55edeej0Gi2mCQy3/MyLXpJnRpXzBSCVRKDz9OI0b+rqfqXi2ymsvSp4p3eV5dgu
	D7x7iK+iQ2hW0bROGVTvATsRxYrtjgiOfPzmnJ5RbkMdZS5UBfW4+ixXlZYCc0OPl+4dBl
	TaCbAcmDrXeb4qKOZtjX/9Ys6CbbME0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762157350;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VKEz7jF5B4ooGLr9O31wK/4JWQbfcbQTlr2Qtv1zupA=;
	b=x655JdzPcyKGMWf2urKCw15dH1GR1dgZS4saUvE3dwPglx6bee1GwyPCZSdeAokY2H8Z/h
	vsXtKt50tO69ZJAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D29D91364F;
	Mon,  3 Nov 2025 08:09:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HJEGMSVjCGkQXAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 03 Nov 2025 08:09:09 +0000
Message-ID: <5aa617b1-f6b8-49a3-9659-1b4d35c89d22@suse.de>
Date: Mon, 3 Nov 2025 09:09:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: fix allocation of dumb buffers for non-RGB
 formats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251102-drm-msm-fix-nv12-v1-1-096dbcb4a51f@oss.qualcomm.com>
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
In-Reply-To: <20251102-drm-msm-fix-nv12-v1-1-096dbcb4a51f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3B3031F766
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,suse.com:url]
X-Spam-Score: -4.51

Hi,

thanks a lot for this bug fix.

Am 02.11.25 um 21:17 schrieb Dmitry Baryshkov:
> Several users (including IGT kms_getfb tests) allocate DUMB buffers for
> YUV data. Commit 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with
> drm_mode_size_dumb()") broke that usecase, since in those cases
> drm_driver_color_mode_format() returns DRM_FORMAT_INVALID.
>
> Handle the YUV usecase, aligning to 32-bit pixels.
>
> Fixes: 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()")
> Closes: https://lore.kernel.org/all/vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 435c0067c2641786ca7b4a42cca0ae7e7dda3451..b9cfdb2ff33b63b92cff2568db491d0692bbe459 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -701,7 +701,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>   		struct drm_mode_create_dumb *args)
>   {
>   	u32 fourcc;
> -	const struct drm_format_info *info;
>   	u64 pitch_align;
>   	int ret;
>   
> @@ -711,12 +710,16 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>   	 * Use the result as pitch alignment.
>   	 */
>   	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> -	if (fourcc == DRM_FORMAT_INVALID)
> -		return -EINVAL;
> -	info = drm_format_info(fourcc);
> -	if (!info)
> -		return -EINVAL;
> -	pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
> +	if (fourcc != DRM_FORMAT_INVALID) {
> +		const struct drm_format_info *info;
> +
> +		info = drm_format_info(fourcc);
> +		if (!info)
> +			return -EINVAL;
> +		pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
> +	} else {
> +		pitch_align = round_up(args->width, SZ_32) * DIV_ROUND_UP(args->bpp, SZ_8);

Just a style issue: I know that the fixed patch uses SZ_32, but looking 
at now, it seems preferable to use a plain 32 here. It's not a size 
value in the common sense.

The same problem happens in imx (see patch 10 of the dumb-buffer 
series). I think we could use a helper for the code. Something like

u64 drm_mode_dumb_pitch_align(const struct drm_mode_create_dumb *args, 
unsigned int pitch_pixel_align)
{
     // do the fixed calculation here

     // return 0 on error
}


But if you just want to get the bug fixed, feel free to add

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

to the current patch.

Best regards
Thomas

> +	}
>   	if (!pitch_align || pitch_align > U32_MAX)
>   		return -EINVAL;
>   	ret = drm_mode_size_dumb(dev, args, pitch_align, 0);
>
> ---
> base-commit: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
> change-id: 20251102-drm-msm-fix-nv12-11f0e8c31b2e
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



