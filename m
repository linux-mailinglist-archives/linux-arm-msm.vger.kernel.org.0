Return-Path: <linux-arm-msm+bounces-72935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B781B51243
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6EBB4644BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 09:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697323115A0;
	Wed, 10 Sep 2025 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpQ4RqM4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9XA33nXs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpQ4RqM4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9XA33nXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB530E0E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757495854; cv=none; b=EJ71oYVkrPGuipDA9olaD2XYnnU533hiAo8Wam58Q2DAzTJW48u81IN/xf9Cyu0E1yrLIaRAJiYPNtDXxKXO1IsOqZTVzmyw0LoFRnDJGzMteQOjlKL/JSseC6aQI8D1Rva7wfjbn/KqIN/VbUEKYs0XvjLTzrO1QEc2B0MFfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757495854; c=relaxed/simple;
	bh=SjKs9oCrenImG0RG3XvxaFxGywWDapdI/0foyNwUtiY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mewRYbdYeWderusNrXmFKC5NGU0Lh7s42kIE16cljR8w6WuqzSYSYfvwZGSiOSbZxIxmKUDDkCpTnR7v1grSHHVrho8YJN6Cw1F0bl+uLVd5vRMGouNGWzyK7cDEezJtmVterJwvYirZ5cZQ5wHNRy90yaMoFpasNHYISjczZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpQ4RqM4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9XA33nXs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpQ4RqM4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9XA33nXs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E932371F6;
	Wed, 10 Sep 2025 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757495850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JapfLJgp168zjhr+Azwnb5KVJmSjxr/r/6m5rjAdZ4=;
	b=wpQ4RqM4hoyqGskZ/trspeAImZoKmWXUtwxQoZP8HXj9sMw/cVJOcn+upqK+T2nFuqfIiw
	tReqlEZbEZIm+YwEkJQ3Xw2sToiijex8+bcR0c1MxlQUmK4vDPEycXYtycY1V030M7EdvX
	2captUHoWBH0Lec8nxSs0xpgE00px9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757495850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JapfLJgp168zjhr+Azwnb5KVJmSjxr/r/6m5rjAdZ4=;
	b=9XA33nXssEmV4bGhbKRKt4k4+6qcNP+rnvlv7wxtcEO8i1LJQ045V3QgPK0w9Qfjn8OlGR
	boRCwt6pwhTDE8DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wpQ4RqM4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9XA33nXs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757495850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JapfLJgp168zjhr+Azwnb5KVJmSjxr/r/6m5rjAdZ4=;
	b=wpQ4RqM4hoyqGskZ/trspeAImZoKmWXUtwxQoZP8HXj9sMw/cVJOcn+upqK+T2nFuqfIiw
	tReqlEZbEZIm+YwEkJQ3Xw2sToiijex8+bcR0c1MxlQUmK4vDPEycXYtycY1V030M7EdvX
	2captUHoWBH0Lec8nxSs0xpgE00px9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757495850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JapfLJgp168zjhr+Azwnb5KVJmSjxr/r/6m5rjAdZ4=;
	b=9XA33nXssEmV4bGhbKRKt4k4+6qcNP+rnvlv7wxtcEO8i1LJQ045V3QgPK0w9Qfjn8OlGR
	boRCwt6pwhTDE8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8F2513301;
	Wed, 10 Sep 2025 09:17:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +/D5JylCwWiXPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 09:17:29 +0000
Date: Wed, 10 Sep 2025 11:17:29 +0200
Message-ID: <87zfb2vf86.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Patrick Lai <plai@qti.qualcomm.com>,
	Annemarie Porter <annemari@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@oss.qualcomm.com,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 1/2] ALSA: compress: add raw opus codec define and opus decoder structs
In-Reply-To: <20250910-opus_codec_rfc_v1-v2-1-35fb6536df6b@linaro.org>
References: <20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org>
	<20250910-opus_codec_rfc_v1-v2-1-35fb6536df6b@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,qti.qualcomm.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,linaro.org,linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2E932371F6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Wed, 10 Sep 2025 10:11:41 +0200,
Alexey Klimov wrote:
> +struct snd_dec_opus {
> +	union {
> +		struct {
> +			__u8 minor:4;
> +			__u8 major:4;
> +		} __attribute__((packed)) fields;

Bit fields aren't really good for ABI definition, as it's not well
defined.  I'd rather leave it as a u8.  If any, you can provide a
bitmask definition or a macro to retrieve the version numbers.

Also, don't forget to bump the API protocol number.
It's been already increased to 0.4.0 for 64bit tstamp support, and
yours need to increase one more.

(That is, please make sure to create patches based on linux-next, or
 for-next branch of sound git tree.)


thanks,

Takashi

