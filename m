Return-Path: <linux-arm-msm+bounces-44739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB4A091F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 14:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DD13A6DF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 13:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CABA17995E;
	Fri, 10 Jan 2025 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T7cE6+as";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="73X+XmBo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T7cE6+as";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="73X+XmBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCD481DD;
	Fri, 10 Jan 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736515860; cv=none; b=dmlyRxbDIRFxWYAavqxc0lueMox1CsfU3vjpB44T5c+XGGdiNubeoWCE8Kr0KLSmAW36yMgPfZIB8Q5QwOhIZGh77WGM1Paz3WNj3fGWrfRmpKV/Lh0qr0dNgfOTB+dCQfNrCDBPTWd1PcQpPCoKKb2EUZDdGXTrcxOB0q7UO2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736515860; c=relaxed/simple;
	bh=3lOsFAXhJ/Rlpwb8ypLDkUZljoSyvCQ5VsmTcLNLt40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D50qF0WqFtJi8O7BGKdQStkT8glWwNj8Z2MkIVc1/vPcYXNswk88mrve7ATptWDjJmJtaZUeWmEughGNHoLvHKJIgF9bspa16Bx+oYZYOU+TP+O/oI36XT8PiZfR4prABJ0/LD8QXE++/ecHM6Xw1Kl9hrrEFen7ORvxEgAzzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T7cE6+as; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=73X+XmBo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T7cE6+as; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=73X+XmBo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61D3221173;
	Fri, 10 Jan 2025 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736515856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8YON2GiGTJcck3RKIC3vWLlZwPJMNbfkzQoWEpUZLhA=;
	b=T7cE6+as5UgYLF0bXB5jDtXiUOTB8vL2wO3ekCJ1/PBTVH6BqvcF6I3CCclHQ1PlPBVXXd
	jtHOz5yEnmYeFLhy33iCHayZnd61SXjQus/GDFLsc+sJOHqDlqjwwN1TDRpA/7fVJ4r6jd
	idcCzDg2yQgv5vUMsJflc+eE+53PnOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736515856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8YON2GiGTJcck3RKIC3vWLlZwPJMNbfkzQoWEpUZLhA=;
	b=73X+XmBoc1OYK+tz7wmvzjSwbtEeFDSpLq2pch9FpdzleO2KfbpO5EY/JErgjPKHSnVnNb
	tA9D6u/HFk6n3MBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=T7cE6+as;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=73X+XmBo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736515856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8YON2GiGTJcck3RKIC3vWLlZwPJMNbfkzQoWEpUZLhA=;
	b=T7cE6+as5UgYLF0bXB5jDtXiUOTB8vL2wO3ekCJ1/PBTVH6BqvcF6I3CCclHQ1PlPBVXXd
	jtHOz5yEnmYeFLhy33iCHayZnd61SXjQus/GDFLsc+sJOHqDlqjwwN1TDRpA/7fVJ4r6jd
	idcCzDg2yQgv5vUMsJflc+eE+53PnOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736515856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8YON2GiGTJcck3RKIC3vWLlZwPJMNbfkzQoWEpUZLhA=;
	b=73X+XmBoc1OYK+tz7wmvzjSwbtEeFDSpLq2pch9FpdzleO2KfbpO5EY/JErgjPKHSnVnNb
	tA9D6u/HFk6n3MBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E49EC13763;
	Fri, 10 Jan 2025 13:30:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I3F6Ng8hgWdHYAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 10 Jan 2025 13:30:55 +0000
Message-ID: <29dcf748-c571-4c91-92b7-481be5a43ff5@suse.de>
Date: Fri, 10 Jan 2025 14:30:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav
 <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
 <t7ga7l7hi5y634hc6sklp6mzae3jfqs66nkalviojrzrgez3kf@b4h4ue6fdj7j>
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
In-Reply-To: <t7ga7l7hi5y634hc6sklp6mzae3jfqs66nkalviojrzrgez3kf@b4h4ue6fdj7j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 61D3221173
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,quicinc.com,poorly.run,somainline.org,codeaurora.org,cosmicpenguin.net,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi


Am 10.01.25 um 00:57 schrieb Dmitry Baryshkov:
> On Thu, Jan 09, 2025 at 02:53:16PM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>>
>> Am 22.12.24 um 06:00 schrieb Dmitry Baryshkov:
>>> As pointed out by Simona, the drm_atomic_helper_check_modeset() and
>>> drm_atomic_helper_check() require the former function is rerun if the
>>> driver's callbacks modify crtc_state->mode_changed. MSM is one of the
>>> drivers which failed to follow this requirement.
>> I'm concerned about the implications of this series. How does a driver
>> upgrade from simple pageflip to full modeset if necessary? The solution in
>> msm appears to be to run the related test before drm_atomic_helper_check().
>> (Right?)
>>
>> My corner case is in mgag200, which has to reprogram the PLL if the color
>> mode changes. So it sets mode_changed to true in the primary plane's
>> atomic_check. [1] This works in practice because the plane checks run before
>> the CRTC checks. So the CRTC code will do the correct thing. Reprogramming
>> the PLL means to disable the display at some point. So it comes down to a
>> full modeset.
>>
>> You mention that drm_atomic_helper_check() needs to rerun if mode_changed
>> flips. Would it be possible to implement this instead within the helper?
> I think this should be a driver's decision. For MSM it was easier to
> move the mode_changed changes and to isolate that before calling into
> the drm_atomic_helper_check_modeset() code. Other drivers might prefer
> to rerun the helper.

Is it legal to do something like

int atomic_check(state)
{
   ret = drm_atomic_helper_check(state)
   if (state->dirty_needs_modeset)
     ret = drm_atomic_helper_check(state)
   return ret;
}

within the driver ? It appears that the atomic helpers warn then.

Best regards
Thomas

>
>> Best regards
>> Thomas
>>
>> [1] https://elixir.bootlin.com/linux/v6.12/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L493
>>
>>> As suggested by Simona, implement generic code to verify that the
>>> drivers abide to those requirement and rework MSM driver to follow that
>>> restrictions.
>>>
>>> There are no dependencies between core and MSM parts, so they can go
>>> separately via corresponding trees.
>>>
>>> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
>>> Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Dmitry Baryshkov (6):
>>>         drm/atomic-helper: document drm_atomic_helper_check() restrictions
>>>         drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
>>>         drm/msm/dpu: don't use active in atomic_check()
>>>         drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
>>>         drm/msm/dpu: simplify dpu_encoder_get_topology() interface
>>>         drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
>>>
>>>    drivers/gpu/drm/drm_atomic.c                |  3 +
>>>    drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
>>>    drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
>>>    drivers/gpu/drm/msm/msm_kms.h               |  7 +++
>>>    include/drm/drm_atomic.h                    | 10 ++++
>>>    9 files changed, 192 insertions(+), 43 deletions(-)
>>> ---
>>> base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
>>> change-id: 20241222-drm-dirty-modeset-88079bd27ae6
>>>
>>> Best regards,
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


