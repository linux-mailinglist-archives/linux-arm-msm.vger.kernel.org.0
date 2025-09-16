Return-Path: <linux-arm-msm+bounces-73638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C25BCB58E4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 08:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782FE165BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 06:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBDB2D7398;
	Tue, 16 Sep 2025 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hjaDafKJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gQtw9Ndi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hjaDafKJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gQtw9Ndi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCD22D4D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758003350; cv=none; b=FHEWzj93+0s0DIgcx1BDLAejzcLfR8/5je61VScEdMhnICsOrzQCFttz+M+0Ae4k7lqS1n6KvcpgPk2nS9hIsSPYlLxq4gEg6Pa+dCKBOgoQRzllWyZPkJmvyOA1HzRA7GxHHseAk0LY8JD3f4CORzMT0Fq1j7/tUaRnncaDHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758003350; c=relaxed/simple;
	bh=J5ruB7ZEr+sYD9s1+DSGp9O3WhUHxCHAuKzr+xhX+JA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdVxTCV2MaIa0oAgMcD3W/nxJkfr3vl+6JgvdzDyImse5Q1wy0YlMec40MGsbDqGU0cVAgJSkw6Tg3DyhaAOB9Imf3bwrhgurZUQqKfZNtxhOEX8NMs6v+3lDbfLX6VxaMFIzwgkhchgPCTFnPCfG4XjNwBQicovIkDpsR8sMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hjaDafKJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gQtw9Ndi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hjaDafKJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gQtw9Ndi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 341DA22B4E;
	Tue, 16 Sep 2025 06:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758003341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v1Oq14lVeTrjXO2bNaGL44+wmRwkhWZbM3d9BfGZBUI=;
	b=hjaDafKJp4K6oTIMVTDVoi1l3E28f5PbC1eZdmFAXnsWlbUoVlm8UQo+dDKbAiOrtyHhM0
	LO/KmczoqV+8+9khVgl02Byotuooya3yzCMZt3gt3646iyyPiDfoq3jmH9nAuRYu4Ub2in
	Ikk9dZfV9eak7gGg3h576PnnkQrEPtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758003341;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v1Oq14lVeTrjXO2bNaGL44+wmRwkhWZbM3d9BfGZBUI=;
	b=gQtw9NditM1sGZu4T4qVs6f0sZf8Cr2+F04M8r6NWsV6vV06OB+1VeyzKDV03IhaqwPOOe
	5QInMaZwvVfwbhDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hjaDafKJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gQtw9Ndi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758003341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v1Oq14lVeTrjXO2bNaGL44+wmRwkhWZbM3d9BfGZBUI=;
	b=hjaDafKJp4K6oTIMVTDVoi1l3E28f5PbC1eZdmFAXnsWlbUoVlm8UQo+dDKbAiOrtyHhM0
	LO/KmczoqV+8+9khVgl02Byotuooya3yzCMZt3gt3646iyyPiDfoq3jmH9nAuRYu4Ub2in
	Ikk9dZfV9eak7gGg3h576PnnkQrEPtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758003341;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v1Oq14lVeTrjXO2bNaGL44+wmRwkhWZbM3d9BfGZBUI=;
	b=gQtw9NditM1sGZu4T4qVs6f0sZf8Cr2+F04M8r6NWsV6vV06OB+1VeyzKDV03IhaqwPOOe
	5QInMaZwvVfwbhDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9A5613A63;
	Tue, 16 Sep 2025 06:15:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CMP1J4wAyWi+cwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Sep 2025 06:15:40 +0000
Date: Tue, 16 Sep 2025 08:15:40 +0200
Message-ID: <87ikhi3otv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: "Takashi Iwai" <tiwai@suse.de>,
	"Vinod Koul" <vkoul@kernel.org>,
	"Jaroslav Kysela" <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>,
	"Srinivas Kandagatla" <srini@kernel.org>,
	"Liam Girdwood" <lgirdwood@gmail.com>,
	"Mark Brown" <broonie@kernel.org>,
	"Patrick Lai" <plai@qti.qualcomm.com>,
	"Annemarie Porter"
 <annemari@quicinc.com>,
	<srinivas.kandagatla@oss.qualcomm.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	"Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>,
	<kernel@oss.qualcomm.com>,
	"Ekansh Gupta"
 <ekansh.gupta@oss.qualcomm.com>,
	"Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 1/2] ALSA: compress: add raw opus codec define and opus decoder structs
In-Reply-To: <DCTXQ3F6UWDE.3OK991GHOLHAR@linaro.org>
References: <20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org>
	<20250910-opus_codec_rfc_v1-v2-1-35fb6536df6b@linaro.org>
	<87zfb2vf86.wl-tiwai@suse.de>
	<DCTXQ3F6UWDE.3OK991GHOLHAR@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 341DA22B4E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,perex.cz,suse.com,gmail.com,qti.qualcomm.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,linaro.org,linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Tue, 16 Sep 2025 06:20:31 +0200,
Alexey Klimov wrote:
> 
> Hi Takashi,
> 
> On Wed Sep 10, 2025 at 10:17 AM BST, Takashi Iwai wrote:
> > On Wed, 10 Sep 2025 10:11:41 +0200,
> > Alexey Klimov wrote:
> >> +struct snd_dec_opus {
> >> +	union {
> >> +		struct {
> >> +			__u8 minor:4;
> >> +			__u8 major:4;
> >> +		} __attribute__((packed)) fields;
> >
> > Bit fields aren't really good for ABI definition, as it's not well
> > defined.  I'd rather leave it as a u8.  If any, you can provide a
> > bitmask definition or a macro to retrieve the version numbers.
> 
> Okay.
> 
> > Also, don't forget to bump the API protocol number.
> > It's been already increased to 0.4.0 for 64bit tstamp support, and
> > yours need to increase one more.
> 
> Can you please advice if minor version should be increased i.e. it
> should become 0.4.1? Or should it 0.5.0?

0.4.1 should suffice in this case, I believe.

> > (That is, please make sure to create patches based on linux-next, or
> >  for-next branch of sound git tree.)
> 
> Previous and this one were (re)based on linux-next at the time of
> sending. I didn't really verify against for-next branch of sound git
> tree (I know I should).

linux-next should be fine.  The compress-offload 64bit timestamp
change was merged recently, so you might have missed it when you
created the patch.


thanks,

Takashi

