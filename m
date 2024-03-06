Return-Path: <linux-arm-msm+bounces-13501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BFD873991
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 15:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE1F1C21622
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 14:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144C61339A2;
	Wed,  6 Mar 2024 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z6bm1Dkf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KBfRhPNj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z6bm1Dkf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KBfRhPNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4608873507
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709736299; cv=none; b=DN6jteiXyH96i5n9vIBN7jFa1OCto9fUYeU79vTHyF98+QSjqmKqBV0P5p4y/MPWaWVS0rsvTMjvK200qRCj5froEEwXjxTMkmkG5UuDtfbJ6fNztBa4keTgM5G2ewBB1Rmg2pnkvTJIUVFXXqtaWnJOWTHjCFmRVpDZgUZN+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709736299; c=relaxed/simple;
	bh=eMMJn/1cMgAEamBoLAwPmsvKPy9eh10KGjqTOB8Tj8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvFZp7FYKmP5sgHXuffOmGQE3LDjb4WcnhbKvCQBTltSgl6veco3bRHUsv/0RGcneRWozuYxfJxjP8fuKLtNOZZ5t6bqPv+aWbF4Dmp132uTA4URdRIygqbfNVfntPbUKyU3GM+BWXcNLgJ6JMG7jSjUtHlvD7PRs5+QGosPs/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z6bm1Dkf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KBfRhPNj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z6bm1Dkf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KBfRhPNj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A1366B508;
	Wed,  6 Mar 2024 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709736295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gNozcRck7HD1pz36B+cb3AEI5BDD6Vqr5+Fs9ZciyZc=;
	b=Z6bm1Dkf1AO/315BvC8m+fjvHW6W5O+amhr2HIlMBVld1r+LsBq3S4kNg9vNRpyNYB9sby
	8T1qqWKWbsF7Sl7pp3mh81uRYTliDwp0m4Sx88cGtJkqzeT9xUuAbMlzbnq9XdyKnu+bq0
	ZZ0uPwfOWQ1YhzuPdsRrzsiN52myXtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709736295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gNozcRck7HD1pz36B+cb3AEI5BDD6Vqr5+Fs9ZciyZc=;
	b=KBfRhPNj4plBaJ2be6qT/TIC17q/Uh4tuEjRqusi79TjI+T+V+u52QbTsodC3ffWMFgjOj
	ATy2rYVoA8gm/JAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709736295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gNozcRck7HD1pz36B+cb3AEI5BDD6Vqr5+Fs9ZciyZc=;
	b=Z6bm1Dkf1AO/315BvC8m+fjvHW6W5O+amhr2HIlMBVld1r+LsBq3S4kNg9vNRpyNYB9sby
	8T1qqWKWbsF7Sl7pp3mh81uRYTliDwp0m4Sx88cGtJkqzeT9xUuAbMlzbnq9XdyKnu+bq0
	ZZ0uPwfOWQ1YhzuPdsRrzsiN52myXtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709736295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gNozcRck7HD1pz36B+cb3AEI5BDD6Vqr5+Fs9ZciyZc=;
	b=KBfRhPNj4plBaJ2be6qT/TIC17q/Uh4tuEjRqusi79TjI+T+V+u52QbTsodC3ffWMFgjOj
	ATy2rYVoA8gm/JAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B44231377D;
	Wed,  6 Mar 2024 14:44:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id nQyvKmaB6GWDbwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 06 Mar 2024 14:44:54 +0000
Message-ID: <bf149016-5077-4220-b473-d2808d064c5d@suse.de>
Date: Wed, 6 Mar 2024 15:44:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and
 console
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-1-tzimmermann@suse.de>
 <c844b72e-6c4e-4c99-8e7f-b9c62f63209d@collabora.com>
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
In-Reply-To: <c844b72e-6c4e-4c99-8e7f-b9c62f63209d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.28
X-Spamd-Result: default: False [-4.28 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
	 R_RATELIMIT(0.00)[to_ip_from(RLqs7qcp4g99ribr8z1n9xsc8a)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.19)[-0.962];
	 RCPT_COUNT_TWELVE(0.00)[29];
	 FREEMAIL_TO(0.00)[collabora.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

Hi

Am 05.03.24 um 22:58 schrieb Dmitry Osipenko:
> On 2/27/24 13:14, Thomas Zimmermann wrote:
>> Dma-buf locking semantics require the caller of pin and unpin to hold
>> the buffer's reservation lock. Fix DRM to adhere to the specs. This
>> enables to fix the locking in DRM's console emulation. Similar changes
>> for vmap and mmap have been posted at [1][2]
>>
>> Most DRM drivers and memory managers acquire the buffer object's
>> reservation lock within their GEM pin and unpin callbacks. This
>> violates dma-buf locking semantics. We get away with it because PRIME
>> does not provide pin/unpin, but attach/detach, for which the locking
>> semantics is correct.
>>
>> Patches 1 to 8 rework DRM GEM code in various implementations to
>> acquire the reservation lock when entering the pin and unpin callbacks.
>> This prepares them for the next patch. Drivers that are not affected
>> by these patches either don't acquire the reservation lock (amdgpu)
>> or don't need preparation (loongson).
>>
>> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
>> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
>> internally it still gets the reservation lock.
>>
>> With the updated GEM callbacks, the rest of the patchset fixes the
>> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
>> GEM buffer object inplace while updating its content. This required
>> a implicit pinning and apparently amdgpu didn't do this at all.
>>
>> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
>> The former function map a GEM buffer into the kernel's address space
>> with regular vmap operations, but keeps holding the reservation lock.
>> The _vunmap_local() helper undoes the vmap and releases the lock. The
>> updated GEM callbacks make this possible. Between the two calls, the
>> fbdev emulation can update the buffer content without have the buffer
>> moved or evicted. Update fbdev-generic to use vmap_local helpers,
>> which fix amdgpu. The idea of adding a "local vmap" has previously been
>> attempted at [3] in a different form.
>>
>> Patch 11 adds implicit pinning to the DRM client's regular vmap
>> helper so that long-term vmap'ed buffers won't be evicted. This only
>> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
>> there are no practical changes.
>>
>> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
>> operations in gem-vram and qxl. These pin operations are not supposed
>> to be part of vmap code, but were required to keep the buffers in place
>> for fbdev emulation. With the conversion o ffbdev-generic to to
>> vmap_local helpers, that code can finally be removed.
>>
>> Tested with amdgpu, nouveau, radeon, simpledrm and vc4.
>>
>> [1] https://patchwork.freedesktop.org/series/106371/
>> [2] https://patchwork.freedesktop.org/series/116001/
>> [3] https://patchwork.freedesktop.org/series/84732/
>>
>> Thomas Zimmermann (13):
>>    drm/gem-shmem: Acquire reservation lock in GEM pin/unpin callbacks
>>    drm/gem-vram: Acquire reservation lock in GEM pin/unpin callbacks
>>    drm/msm: Provide msm_gem_get_pages_locked()
>>    drm/msm: Acquire reservation lock in GEM pin/unpin callback
>>    drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
>>    drm/nouveau: Acquire reservation lock in GEM pin/unpin callbacks
>>    drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
>>    drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
>>    drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()
>>    drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()
>>    drm/client: Pin vmap'ed GEM buffers
>>    drm/gem-vram: Do not pin buffer objects for vmap
>>    drm/qxl: Do not pin buffer objects for vmap
> The patches look good. I gave them fbtest on virtio-gpu, no problems
> spotted.
>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # virtio-gpu

Great, thanks a lot. If no other reviews come in, I'll land the patchset 
within the next days.

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


