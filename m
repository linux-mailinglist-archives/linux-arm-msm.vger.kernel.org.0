Return-Path: <linux-arm-msm+bounces-44587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12565A07838
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5293A1DA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2175217729;
	Thu,  9 Jan 2025 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tUfdHALg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="20ZoBBsD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xgWcDfsx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ywAop16h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B780C2185A9;
	Thu,  9 Jan 2025 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430811; cv=none; b=fe8f0kuhLWERl+GurcnsEZrYB9iBaqy0cNVMszaVg6pxFkliGfFhFxy3QfEoXt2RNQOks/J8TA+IoNfGfGyi4uJSToPG+YOESl594nRc/XEX5j5YLGL0wI+WGAGAzj9Bl2KmY55Ga7joU1LqRL2uHc/sU3AMUt0tydh9Q/GLjT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430811; c=relaxed/simple;
	bh=WAUd6E/tEOAn24aycmwPuYRSLomFdffFzFi1YMN+NSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9CW6hZ1M7JFZmDKNxv18McO5wxDf4SUdztwWn2MVDy5LSaGitFDTmQn1OxqnyPqptULkw1oFGVK7TJXUb4QbC3pcC4kXHt29UX1pQd9XUnCaa8dlqCkI0WbVwIbFDa3paXcCiX+8RHepxxfrI+l4fKNrH0GQ2svzB8MOjPnFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tUfdHALg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=20ZoBBsD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xgWcDfsx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ywAop16h; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 635821F393;
	Thu,  9 Jan 2025 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736430798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BtpiwbAGjYqo8EDAGEE5AiW9KUDe9ltNVFkQF2I5wys=;
	b=tUfdHALgs0ii3pMIm1AyUJOOe8LqskXpR1+ExWF91bdkGNa9CIjaLL1RoR+flsrumPwkqg
	EaPUJ6ij78PGyWCM/G/CERrOsh00bww67F+gx8xxH8bfJjgV38AbsYQc/tWZsXKCqqIwXR
	bD8qThtEhu1fEiGc1xcVyn7qS1zozzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736430798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BtpiwbAGjYqo8EDAGEE5AiW9KUDe9ltNVFkQF2I5wys=;
	b=20ZoBBsDEjR1qcQlko21QPxkqS+sBTcGZ+7fmhr3A1uonEjrAiuzvzHlqkbOC0riqQ00uY
	YKZukV9JOWNNDVDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736430797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BtpiwbAGjYqo8EDAGEE5AiW9KUDe9ltNVFkQF2I5wys=;
	b=xgWcDfsxpwpyfVDCzoFPTGYjLGRQhWl56sD1iaz9ONSAFlT72hMZ4CtWNtK9Y9A74NIe4c
	lnhiduHHOVghzNAvWl5PxON/oJ196i4bpaU2rqC+n/l83JEqpCaaWDPHf5sr5563ljl7l0
	v+OyHKkUqmwJcWeY0m2/GmV/HX6FEbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736430797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BtpiwbAGjYqo8EDAGEE5AiW9KUDe9ltNVFkQF2I5wys=;
	b=ywAop16hqbKpCohSHrBqKy/qQ/OYWtMcjfjLNPTMgszu7XHrCBFpt0u+Ep5ub9qDOYgo3B
	ym/iuGhXxB7lC4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7C5A13876;
	Thu,  9 Jan 2025 13:53:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tYxLM8zUf2esVAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 13:53:16 +0000
Message-ID: <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
Date: Thu, 9 Jan 2025 14:53:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav
 <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
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
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,quicinc.com,poorly.run,somainline.org,codeaurora.org,cosmicpenguin.net];
	RCPT_COUNT_TWELVE(0.00)[20];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,bootlin.com:url,ffwll.ch:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Hi


Am 22.12.24 um 06:00 schrieb Dmitry Baryshkov:
> As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> drm_atomic_helper_check() require the former function is rerun if the
> driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> drivers which failed to follow this requirement.

I'm concerned about the implications of this series. How does a driver 
upgrade from simple pageflip to full modeset if necessary? The solution 
in msm appears to be to run the related test before 
drm_atomic_helper_check(). (Right?)

My corner case is in mgag200, which has to reprogram the PLL if the 
color mode changes. So it sets mode_changed to true in the primary 
plane's atomic_check. [1] This works in practice because the plane 
checks run before the CRTC checks. So the CRTC code will do the correct 
thing. Reprogramming the PLL means to disable the display at some point. 
So it comes down to a full modeset.

You mention that drm_atomic_helper_check() needs to rerun if 
mode_changed flips. Would it be possible to implement this instead 
within the helper?

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.12/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L493

>
> As suggested by Simona, implement generic code to verify that the
> drivers abide to those requirement and rework MSM driver to follow that
> restrictions.
>
> There are no dependencies between core and MSM parts, so they can go
> separately via corresponding trees.
>
> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (6):
>        drm/atomic-helper: document drm_atomic_helper_check() restrictions
>        drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
>        drm/msm/dpu: don't use active in atomic_check()
>        drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
>        drm/msm/dpu: simplify dpu_encoder_get_topology() interface
>        drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
>
>   drivers/gpu/drm/drm_atomic.c                |  3 +
>   drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
>   drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
>   drivers/gpu/drm/msm/msm_kms.h               |  7 +++
>   include/drm/drm_atomic.h                    | 10 ++++
>   9 files changed, 192 insertions(+), 43 deletions(-)
> ---
> base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
> change-id: 20241222-drm-dirty-modeset-88079bd27ae6
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


