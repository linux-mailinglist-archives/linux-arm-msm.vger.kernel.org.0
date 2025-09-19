Return-Path: <linux-arm-msm+bounces-74188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1860DB898F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 15:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C69116225A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 13:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0635E2367AD;
	Fri, 19 Sep 2025 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WsdrUrtI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vaKHYxr5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WsdrUrtI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vaKHYxr5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19881238D42
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758286805; cv=none; b=JdoyhRY4kPPQiQ8PIL92nvOt06oK5D3D6QXpVQLz0RBVq+ZQK0QmGaV4xVc8tvImFqqCoVWzmZwQ3Kyhi01oJWqC7jac59iVzpsiLUNMzYyHQTZyewJxYlMXq4R5mh1sYQIYDadzRZNv/al0Lb9M3ecZfyU9Iy81DOLQFL4YAOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758286805; c=relaxed/simple;
	bh=o14wFhxXepo5o+mqZ3aUgF/dYby9/jrJO6CfF2IpjPo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KusKOmxE5st1IZSRc2pi3X+B0/tT2xJxXOB1nNXy8aoxgfVbYjAY+OU5bAgWKeODd8JhAMFjd1boeGczxukYhH9UpUliwY7kvCtHlp5Yx4loJBTebCUHnE6bbIw46nueC5u4KXYY/O9opkdNekLjXvCN5Av1SSGH50hPzr+X5yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WsdrUrtI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vaKHYxr5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WsdrUrtI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vaKHYxr5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48CD21F7D8;
	Fri, 19 Sep 2025 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758286802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y2LrxQGrj/DRzcR+81yCK2sfCYQD1ShVTHdJPOHNt2M=;
	b=WsdrUrtIXGLPPXiklonoK0G9uAbyUovr6DVy9JZNPJTx0Lpdwjb0BrP6YQxpR+Ync7Z7lm
	FfV3kFLneZvTsRxWRD8Ya8vo+LqviZHO3mT3GbtfpeR6/zwETQ51CSkOiLd8MBOz3zU9bP
	WWvW7/2D6dgxUt5EyXwAugUhA/Fuxsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758286802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y2LrxQGrj/DRzcR+81yCK2sfCYQD1ShVTHdJPOHNt2M=;
	b=vaKHYxr5OJtYDo+jM/Rfo2iw4PMpwoTlSp9ALBhtfxwyxuVYayQHQ6B+7xkbTs/6+7mLQN
	fqSr/6+sa1qYJ8DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WsdrUrtI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vaKHYxr5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758286802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y2LrxQGrj/DRzcR+81yCK2sfCYQD1ShVTHdJPOHNt2M=;
	b=WsdrUrtIXGLPPXiklonoK0G9uAbyUovr6DVy9JZNPJTx0Lpdwjb0BrP6YQxpR+Ync7Z7lm
	FfV3kFLneZvTsRxWRD8Ya8vo+LqviZHO3mT3GbtfpeR6/zwETQ51CSkOiLd8MBOz3zU9bP
	WWvW7/2D6dgxUt5EyXwAugUhA/Fuxsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758286802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y2LrxQGrj/DRzcR+81yCK2sfCYQD1ShVTHdJPOHNt2M=;
	b=vaKHYxr5OJtYDo+jM/Rfo2iw4PMpwoTlSp9ALBhtfxwyxuVYayQHQ6B+7xkbTs/6+7mLQN
	fqSr/6+sa1qYJ8DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D900513A78;
	Fri, 19 Sep 2025 13:00:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oFSpM9FTzWgwCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Sep 2025 13:00:01 +0000
Date: Fri, 19 Sep 2025 15:00:01 +0200
Message-ID: <87plbm8uni.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v3 0/3] Add raw OPUS codec support for compress offload
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 48CD21F7D8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Wed, 17 Sep 2025 09:32:49 +0200,
Alexey Klimov wrote:
> 
> This series adds support in kernel to recognise raw (or plain) OPUS
> codec playback for compress offloading. At this point this series
> doesn't deal with OPUS packets packed in any kind of containers (OGG or
> others) and focuses on adding missing bits for pure OPUS packets.
> 
> The second patch adds its usage in Qualcomm Audio DSP code. To correctly
> recognise raw OPUS packets by qdsp6, each packets needs to be prepended
> with 4-bytes field that contains length of a raw OPUS packet.
> It is expected to be useful for usecases when OPUS packets are streamed
> over network and they are not encapsulated in a container. Userspace
> application that will use the compress API has to manually add such
> 4-bytes long field to each OPUS packet.
> 
> This is tested on sm8750-mtp. It is expected that next hardware revisions
> will also support raw OPUS codec offloading.
> 
> Dependencies are:
> -- hardware with DSP that supports decoding OPUS packets (>= Qualcomm sm8750);
> -- adsp fastrpc;
> -- explicitly setting format in sm8750 soundcard driver
> https://lore.kernel.org/linux-sound/20250911154340.2798304-1-alexey.klimov@linaro.org/
> -- running adsprpcd tool with support for Audio PD and DSP libraries
> loading support (or its alternative);
> -- tinycompress fcplay tool that will prepare raw opus packets and
> do the required addition of length field;
> -- mfc module in topology compress-playback path, that module is
> expected to parse channel mapping and do the required things to
> map streams/channels to physically-present output channels on backend.
> 
> The userspace tinycompress tool with support for raw OPUS compress
> playback is located here:
> https://github.com/laklimov/tinycompress_opus
> branch: opus_v3_workinprogress
> 
> The userspace tool is not expected that it is ready and still needs
> some work, for instance recognition that it runs on Qualcomm hardware.
> More like working PoC.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Applied now to for-next branch for 6.18.
For further improvements, please submit on top of that.


thanks,

Takashi

