Return-Path: <linux-arm-msm+bounces-107935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPDyA5EvB2p3sgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:37:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EB55187B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 495CF301874C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C8D3AF66C;
	Fri, 15 May 2026 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bvqLLSgg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iqf3a3Dj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PTd7Jw9Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="daKmt3Ck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B067D3B19B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855819; cv=none; b=XUCHA8Y/HEUhbUGpN5N0B3qn2KDFnbe7HUW54A/GSvxN3PTGZUAlYyOpyiqPUZGRpL0yMHzbu5lEBLu+LxYlVufiNC41UTfZS7GPAYFfry1La2Lr+WN7RuCoZmO0fU+054sIfKHuz1JxxowUZwJwbIqLjweWL3Wq9HiTRXfmerQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855819; c=relaxed/simple;
	bh=lztTQKgn05ATnyqsyrmbEaETQRQqnyHNtfamOQMus8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0bb5m9j53F6VHQ5ozp0jl870WdthIyiVhrJPhHRtZDOiyRthvouqUww0rJBMyd9Wwc+a1k4zRjssaGdLZ87n2GH27ze7WN6nHByXRD/1rFSzyVrghcH6xb4P9BqZlqo8VyJJGeDbhYA+fR7Lc5eHPkKz/iKWbwKjEGEccLEBNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bvqLLSgg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iqf3a3Dj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PTd7Jw9Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=daKmt3Ck; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E83B466F7C;
	Fri, 15 May 2026 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778855815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=52kVi4ft6gEHq04LpCQ2bQJUfy4du7wTYBOy6YOZudI=;
	b=bvqLLSggkd8YehZL4yctiPOIFT+JMgksZ4SunF0rxbSujfUSUguChTNt35TorPSxAo70rb
	TZFO8ZSozugb8b0qt+SnBDDtQiGLIg8jffrEFQt+jq/U6ajUV5Z4KInO68ntW4V9qK1X07
	lfiwSXtBVpjHtvopH6zQ8OHXpvkD/1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778855815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=52kVi4ft6gEHq04LpCQ2bQJUfy4du7wTYBOy6YOZudI=;
	b=Iqf3a3DjA+PPpTghGUA0YWFCoyYoQ5ZNn1N1mLZOXQmmpqZTReEKM1z7WK/7Dh3WruZ4Sr
	GEB98n668INEjHDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PTd7Jw9Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=daKmt3Ck
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778855814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=52kVi4ft6gEHq04LpCQ2bQJUfy4du7wTYBOy6YOZudI=;
	b=PTd7Jw9ZCUVnU19WpWsacDUe5kCbQUN2mJIFeMTkujhqH8XOe3KypW/3djbAOQAiFSWfLZ
	JNQPPgujh2qZ4snc+IlvtHV7Bb31YHJshd1nZ0wJuOrAKB35mAFaV8sBVuoq4xkGf1AnNW
	YB7gz22ATA3ecZzOKmaJrs5KYYoIZnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778855814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=52kVi4ft6gEHq04LpCQ2bQJUfy4du7wTYBOy6YOZudI=;
	b=daKmt3CkwQtpWyP1/NWtD4Kb+I/GqBMdxH1mSeNMK2gbtmPd9841j9stWJpqfRBbaU/jiE
	/8hMbt+BnBnL9IDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70633593A9;
	Fri, 15 May 2026 14:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wo0DGoYvB2pZLwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 15 May 2026 14:36:54 +0000
Message-ID: <4d4e8090-3216-4a41-9a7d-3d2c0998121a@suse.de>
Date: Fri, 15 May 2026 16:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panel: Add driver for Novatek NT37705 panel
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-2-e09cb05651cc@fairphone.com>
 <c06623ba-b19c-471a-becb-2fafddb3583c@suse.de>
 <DIJBNGDNXE0L.2I0H4PBDDODOP@fairphone.com>
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
In-Reply-To: <DIJBNGDNXE0L.2I0H4PBDDODOP@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 6D3EB55187B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107935-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,linaro.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action

Hi

Am 15.05.26 um 16:31 schrieb Luca Weiss:
> On Fri May 8, 2026 at 10:06 AM CEST, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 01.05.26 um 15:52 schrieb Luca Weiss:
>>> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
>>> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
>>> smartphone.
>>>
>>> The panel can also be configured in 10-bit (RGB101010) mode, however
>>> currently it's configured in 8-bit (RGB888) since there's some issues in
>>> the Qualcomm DPU driver when driving this panel in 10-bit.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>    drivers/gpu/drm/panel/Kconfig                 |  11 +
>>>    drivers/gpu/drm/panel/Makefile                |   1 +
>>>    drivers/gpu/drm/panel/panel-novatek-nt37705.c | 413 ++++++++++++++++++++++++++
>>>    3 files changed, 425 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>>> index 979109c27b9b..59ab3f29d8ef 100644
>>> --- a/drivers/gpu/drm/panel/Kconfig
>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>> @@ -624,6 +624,17 @@ config DRM_PANEL_NOVATEK_NT37700F
>>>    	  Say Y here if you want to enable support for Novatek NT37700F DSI
>>>    	  panel module. The panel has a resolution of 1080x2160.
>>>    
>>> +config DRM_PANEL_NOVATEK_NT37705
>>> +	tristate "Novatek NT37705-based DSI panel"
>>> +	depends on OF
>>> +	depends on DRM_MIPI_DSI
>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>> +	select DRM_KMS_HELPER
>>> +	help
>>> +	  Say Y here if you want to enable support for Novatek NT37705-based
>>> +	  display panels, such as the one found in the The Fairphone (Gen. 6)
>> Duplicate 'the'
> Marketing really wanted to have it be "The Fairphone". Will change and
> make it saner.

How about "as the one found in Gen. 6 of The Fairphone." ?



>
>>> +	  smartphone.
>>> +
>>>    config DRM_PANEL_NOVATEK_NT37801
>>>    	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
>>>    	depends on OF
>>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>>> index 0d694acbfbb6..94639bc58ca8 100644
>>> --- a/drivers/gpu/drm/panel/Makefile
>>> +++ b/drivers/gpu/drm/panel/Makefile
>>> @@ -61,6 +61,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
>>> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37705) += panel-novatek-nt37705.o
>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>>>    obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37705.c b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
>>> new file mode 100644
>>> index 000000000000..27bd8072ccd1
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
>>> @@ -0,0 +1,413 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
>>> + * Copyright (c) 2026 Luca Weiss <luca.weiss@fairphone.com>
>>> + */
>>> +
>>> +#include <linux/backlight.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/regulator/consumer.h>
>>> +
>>> +#include <video/mipi_display.h>
>>> +
>>> +#include <drm/display/drm_dsc.h>
>>> +#include <drm/display/drm_dsc_helper.h>
>> IIRC this requires
>>
>>    select DRM_DISPLAY_DSC_HELPER
>>
>> in the Kconfig. Maybe double-check.
> Will check. Always difficult to figure out the proper dependencies in a
> fully-featured defconfig build.
>
>>> +#include <drm/drm_mipi_dsi.h>
>>> +#include <drm/drm_modes.h>
>>> +#include <drm/drm_panel.h>
>>> +#include <drm/drm_probe_helper.h>
>>> +
>>> +struct nt37705_panel {
>>> +	struct drm_panel panel;
>>> +	struct mipi_dsi_device *dsi;
>>> +	struct drm_dsc_config dsc;
>>> +	struct regulator_bulk_data *supplies;
>>> +	struct gpio_desc *reset_gpio;
>>> +};
>>> +
>>> +static const struct regulator_bulk_data nt37705_supplies[] = {
>>> +	{ .supply = "vddio" },
>>> +	{ .supply = "dvdd" },
>>> +	{ .supply = "vci" },
>>> +};
>>> +
>>> +static inline struct nt37705_panel *to_nt37705_panel(struct drm_panel *panel)
>>> +{
>>> +	return container_of_const(panel, struct nt37705_panel, panel);
>> Either just use container_of or build something that respects the
>> input's const-ness.
> I really don't get what you mean here? Why is container_of_const() bad
> here?

Because nothing is const here. It looks like an oversight or as if 
something should be const.

>
>>> +}
>>> +
>>> +static void nt37705_reset(struct nt37705_panel *ctx)
>>> +{
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>> +	usleep_range(10000, 11000);
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>> +	usleep_range(5000, 6000);
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>> +	usleep_range(10000, 11000);
>>> +}
>>> +
>>> +static int nt37705_on(struct nt37705_panel *ctx)
>>> +{
>>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>>> +
>>> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>> +
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>>> +				     0x55, 0xaa, 0x52, 0x08, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1b);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x18);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00,
>>> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>> +				     0x00, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x00, 0x01, 0x01, 0x01, 0x00, 0x05, 0x05,
>>> +				     0x05, 0x00, 0x05, 0x05, 0x05, 0x00, 0x00,
>>> +				     0x00, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x3c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x0b,
>>> +				     0x0b, 0x00, 0x00, 0x0b, 0x0b, 0x00, 0x00,
>>> +				     0x00, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x4c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
>>> +				     0x1d, 0x00, 0x00, 0x00, 0x1d, 0x00, 0x00,
>>> +				     0x00, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x5c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
>>> +				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
>>> +				     0x01, 0x01);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x6c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
>>> +				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
>>> +				     0x00, 0x1d);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x7c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
>>> +				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
>>> +				     0x00, 0x1d);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x8c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>> +				     0x00, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x9c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x11, 0x11, 0x20, 0x02, 0x00, 0x03, 0x00,
>>> +				     0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa4);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x00, 0xc0, 0x40, 0x08);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa8);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
>>> +				     0x22);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xb0);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>>> +				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
>>> +				     0x22);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>>> +				     0x55, 0xaa, 0x52, 0x08, 0x01);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc5, 0x15, 0x15, 0x15, 0xdd);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>>> +				     0x55, 0xaa, 0x52, 0x08, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0e);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x32);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>>> +				     0x55, 0xaa, 0x52, 0x00, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x19);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1a);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x55);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x11);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x7f);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2d);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x20);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x3c);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x04);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1e);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x0f);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x20);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0d);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x80);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x83);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x12);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x41);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x13);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x21);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>>> +				     0x20);
>>> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x045b);
>>> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x09b3);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00);
>>> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xbb0d);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x04);
>>> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xfe0f);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x01, 0x19);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03, 0x03);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
>>> +				     0x89, 0x28, 0x00, 0x0c, 0xd2, 0x00, 0x02,
>>> +				     0x2f, 0x01, 0x18, 0x00, 0x07, 0x09, 0x75,
>>> +				     0x08, 0x34, 0x10, 0xf0);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x30);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
>>> +	mipi_dsi_msleep(&dsi_ctx, 120);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
>>> +	mipi_dsi_msleep(&dsi_ctx, 22);
>>> +
>>> +	return dsi_ctx.accum_err;
>>> +}
>>> +
>>> +static int nt37705_off(struct nt37705_panel *ctx)
>>> +{
>>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>>> +
>>> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>> +
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
>>> +	mipi_dsi_msleep(&dsi_ctx, 20);
>>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x00);
>>> +	mipi_dsi_msleep(&dsi_ctx, 120);
>>> +
>>> +	return dsi_ctx.accum_err;
>>> +}
>>> +
>>> +static int nt37705_prepare(struct drm_panel *panel)
>>> +{
>>> +	struct nt37705_panel *ctx = to_nt37705_panel(panel);
>>> +	struct device *dev = &ctx->dsi->dev;
>>> +	struct drm_dsc_picture_parameter_set pps;
>>> +	int ret;
>>> +
>>> +	ret = regulator_bulk_enable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
>>> +	if (ret < 0) {
>> Common style is to check for errors with
>>
>>     if (ret)
>>
>> Here and everywhere else.
> At least for regulator_bulk_enable() "ret < 0" is actually more popular
> than just "ret".
>
> Kernel doc says "Return: 0 on success or a negative error number on
> failure." so a positive integer should in theory never happen so they're
> equivalent.
>
> (git grep -h -A2 regulator_bulk_enable | grep if | sed 's|^[ \t]\+||' | sed 's| {$||' | sort | uniq -c)

It's just nitpicking, not a blocker.

Best regards
Thomas

>
> Thanks for the review!
>
> Regards
> Luca

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



