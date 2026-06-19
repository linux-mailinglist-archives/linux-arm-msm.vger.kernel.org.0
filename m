Return-Path: <linux-arm-msm+bounces-113822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5aTLuX7NGq4lgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:20:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCFB6A491C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 10:20:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hWm3soFi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113822-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113822-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 381B63026214
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 08:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2CF35AC09;
	Fri, 19 Jun 2026 08:20:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A3330666
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:20:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857250; cv=pass; b=iqWIuXumztdpliVMFAo5BC7T5qREJSe4OeB0ULEV6+YAMwPsOVv3h90HflZYqJBONYFRT5FWEKlR8HBg8h7UyBml8nTnqx1daegv6b89bVfJZPMSsRwaLzxwMbyqdvO484lqWCBOaze9Ktfqk+Ph+5y4iZtqRtCgFfs0fQhUlqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857250; c=relaxed/simple;
	bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qidNwuI74LWakptVBUuAMIVq+J5J3sHpW4+8k8dhzMCdEvCQaK3BCHH+t19SWAczxOKcA30rB0XIY54lmL8DCcmn+bTDRu9xqsodx1gWxjTBiwx6bdq/eTgCEO12aSR5I08SYwLLer5MBSpEViGCe/5M135lj/gYFoMTt1v0sEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWm3soFi; arc=pass smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84231305a80so1071648b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857249; cv=none;
        d=google.com; s=arc-20240605;
        b=LlMayBExCxhXV76Gnnz5UyhIvfTq5A8FZyHEs4HvaXgUOhQGV8RXGmSdA4Yyit2CLi
         y308fVdkJMksZwedqueU/s3Tnlj+AxGR47Dp78c04aqf1qLvBRo6TGi2kOBIzjFy3cHQ
         QMEDU5OeKXTJHGk8IYo3vjZ23nJXfbAPLFmgleqJ9zED7OBuqpJoUXH2QPnBYhKGRXVp
         /D3nNa/3HDJaGt03u9IcEPbDtvHU45CMZnUJuOpH/kKlTjdaKmZKkQBGTJ+5hlg4mcWc
         2TJoCGl7Q4kmEvT/uA26GekH5EgV0y0cHKnjI8Mecy6c+p+MEYpmnzFSm2wAX/ApxIhO
         N1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        fh=0DXgHsG2twA1ca/YlyD+rOJGgolvRBVR0sKUt214Je0=;
        b=KBbkwtgHcFbe0elVtWrTF5m3bUhqDzUdSj33a6n6mquJIdnq4vygIA0KbCqDDmOt6q
         M2mg03oWBCTv4nJZJ1IcvzoIhY1rkwzFrEhxewBl84cS+NFoyaJhgxZH92PPXBnUbp4A
         F64dJwKW+zvQ4X8BBp0jkW1LlM0ll1LnvzCxQ8dsnQjPcgvWje1EOy1/RFw/c3jyt5Ls
         hxXBhuka1xmKjrnJoki5RptMXfFxI096TolVzPCyB22tzIvFJGxVMLqv60wyh1TuKM4D
         vdHmpQtFHCJWhPuXdiTwIOAsaWig2b+aEj1K7jcjTOJ/QvOFQg3zUFt05AJ0FfkEHPbE
         MDUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857249; x=1782462049; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=hWm3soFirZ9rISqzBUdz2vMZaZC/l+qulyXwX2DxJgoWNXZgicsoCKqnElMrhc7xKq
         1EuyDUBLQXsqPzle8p1pYHPJ8rGAtA2zgbVVdH/BNtUoWj77UkfpBbzG8xg5dWXxvvOi
         kfgdG/75P4xdYPbW5piMp7VAoArwTqh2ngBy2tXyNiRhknaVAMN5gs/RVrVnoT7SIvrA
         GATiectR018NPCYVksZUC5HUqahevcwMkrave00FpVqTJVFugsl8PAUh2k4TijegRqDU
         wOzFPxCFXgGsKQBJURMLPMD7EOao8w2pIjyY4w5C93AiUCOmCevudD6F5gN9mPXuBpKA
         e1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857249; x=1782462049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=G597HSZhd00fDAz5w0KUY3CVw+aAoa5eE5qOsLkNuz7H6eGrpsdW3eTr2pYN8E7pOW
         6IsQ8GOFakYD/xRDcxxn+KYpoeAsMUC13INk1qnXj9PD/5pvDTdxERcP3f6L7tBL/GRB
         QE0YVbHn4H9PUGX4WuV5N1TAJG30jveOB1gFzWNXCazwBrri/0ooVUzsaziBRxGvm8uq
         pYiwD8IIpvE8iQIuWUc09jqKbGEYfZ/vOr6HVs7Lu2S8uekwEogNQubWpgdDk7Xon1Le
         3SaMzsB9NP74vOsMtrn+4itBq6mIvMqiVjUtsaDkSCTBQG+8T+kpbN/oAVZkd7DwCrH8
         408A==
X-Forwarded-Encrypted: i=1; AFNElJ+00v/rAwDFLkvbyWVedwOKiHk8nDtFlpfe44OAqb3jD6ygjjZlNCKL/yzd3sqiC1QS5hFd4bIeR9Eh8VdR@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0yhHXA1b1TpMjC6cBWExuNLM/evmVtnUHUnzQOczf/iyQ7wt
	IjfTSzqLkCvvilBNiX4WYBsrvYWv0CzGLLiRZhlYRE6wG3Dvok+jJ1nEnuwVx9pIqWYyZSQQlU7
	KRoKEqcKxmydCEcaVI6h/YdraqAw5bDw=
X-Gm-Gg: AfdE7cntbEa4MUQgbpIFIRpWuqrPjYVBL3Ej8tmY72UF+iQPxP8qTXIWss8hXYmZxgh
	yIeJEglBbIqnmDWCkvePRbjFMHOTMsTtRdCplFImrslELVIjPjUmYBtZA/RkLbVT/3jXqD6UCT/
	keoYNVcQXN2Uejd6++zAISY2AAJHlgeXkAZSOPr3lDUcKC/GhW+t7Njsef6nGszKB1uMmTI0s14
	AMciy3eFr3P85tQsdAPgxVVQdBF893gU2SfCGy85igFOjKci5hmc9DjT+VmCWM9GbEwBwjYC0bP
	fIL6Nvb1t+rC3mfMQVED7itz9L9y83sM9+ljgQ==
X-Received: by 2002:a05:6a00:3cc7:b0:842:6a97:52fb with SMTP id
 d2e1a72fcca58-845507cb50emr2639722b3a.18.1781857248942; Fri, 19 Jun 2026
 01:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin>
In-Reply-To: <20260617140209.3f89706c@pumpkin>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:20:37 +0700
X-Gm-Features: AVVi8Ce6D0PT5nT0JZlv3l3sVJ8JLAPJbKAWX5-seLq2FMr-NiEk00n-taoSGeE
Message-ID: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: David Laight <david.laight.linux@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:ckeepax@opensource.cirrus.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:davidlaightlinux@gmail.com,m:povik@cutebit.org,m:matthiasbgg@g
 mail.com,m:steveneckhoffopensource@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-113822-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,kernel.org,gmail.com,perex.cz,suse.com,chromium.org,cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FCFB6A491C

Hi Charles, David,

Thanks for the review.

> >
> > I believe you have to use scoped_guard here, as there is a return
> > from the function above, if memory serves it attempts to release
> > the mutex on that path despite it being above the guard.
>
> Indeed.
> I believe clang will complain.
> That makes these mechanical conversions of existing code dangerous churn.
>
> While using guard() (etc) can make it easier to ensure the lock is released
> when functions have multiple error exits, I'm not convinced it makes the
> code any easier to read (other people may disagree).
>

I built the code with both GCC and Clang and didn't see any warnings.

My understanding was that the early return exits the function before
the guard is instantiated, so it should not affect the guard's cleanup
handling.

Could you explain what issue you are referring to? I may be missing
something.

Best regards,
Phuc

