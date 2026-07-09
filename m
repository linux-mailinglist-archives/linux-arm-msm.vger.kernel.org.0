Return-Path: <linux-arm-msm+bounces-117824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HiQQOmcKT2ppZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 04:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13072C13E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 04:41:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FLmjNF9a;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117824-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117824-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2666E30637C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 02:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB83630FF2A;
	Thu,  9 Jul 2026 02:34:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656693382E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 02:34:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564445; cv=pass; b=jS8FGnSTAttC/cx37X929DpTU8mXbQIyY1KtWOnNbZgTey6VzbGBPOdvhk3JHG8AE1qVtUvm2EQLO0NTeUivbQeguyMTPeAyCyDNZVVtXBwQoC6HK2WyychUmuj1wO5MWAF/hRagAqnrRC4eCauUON/HEe6Qd/UP4nzgsjCFX9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564445; c=relaxed/simple;
	bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6SfK+0t1Y5dd8CNeIyn3zPGWIsexgUvVNcxqmJ8ssXLphqXsMPjqAKxwU2X4yhNGjy/x55pyATY7+xDfisoaSY4zdT+MBuEljd8/Of02Qmm+Ikebvj2xe04dtM7E1iaW6EoTLp7MoEwomJNUWp1tOCFYwPEqO1+aVGB/MQe4Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLmjNF9a; arc=pass smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caed617615so13507255ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 19:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783564444; cv=none;
        d=google.com; s=arc-20260327;
        b=U9eVVO+phpnLwYVq2U+0P2UEHMYHk9uQWbSt+ktYi0Qte6dKsLeWxxaaLPswMVsIzb
         Jb75bngSUok6VNd44YZC3h1uidPip6yCXphD3gttwUUWA/a1gIgdzOw/TX4t0W1PT8sd
         T4j/lOPdP917wWaYNeAC6qOo9ha4a2lD+YxQDIN6wUlGzCCb5rR5bmbj/y+qU94J16Vy
         7briupqvZ/wssbRrIz0XXRR+QSYJT/wDGNsY2MhG+S+Q/XoCnZFCBybf6h6kIRW7nQJw
         EPn0+LSzbxm8Frt+8oAc5ONvy8uWcNmYBaYm67draKy1BG8/4pyrmgGJwCmvzt4Tf/Oa
         LAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        fh=fX6hDJXzY/VHmD8wR0/I7Qi1MfjKeBp6sDHra3zNXQY=;
        b=XgC8Yis38IkwKnCajGPTZHMG5zXqqvNZ6Q7xWPoDBGv+21rcKAGX0uUtqdhX9UNuub
         b28NA3+L+FRUAb2MRg0ghRnGf+7TKxnePNSsAVREMwcuyY74fHMdCGBA2ClBpuL3KpaQ
         0/ql7efM/xKCGMre7JnuCBVuB+S6FuuIk7oBIdkpNZ+wJw9m557kc8+c9tLaPxjOcesf
         kXEPe+u+C/HXCIXYqFwzsc9RmYuIScSErYZU7Y83tLBbAVU65CBppxATI5OI8ST/mIGJ
         rStI42JkgPIoTW06NJIPAaFVMGx8oBBWnWELpk03Tuu3Vds993lF5PZcK+8ZnSNQRPYJ
         jDrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783564444; x=1784169244; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=FLmjNF9a1lDQVt0BbHCU5g4AsiakDvBumNOmEyf67LGRiWv6muzPCDXMCqCx0RXnY9
         FAm1WKALQr01PEnnBkti+LvLyjWVJ9tqogbH/tLQW41jMCCBVAn0J5RR32Ek2ixRiPoZ
         PdgmngkA/0Tet/y8D1Eo65YjvLGZq05P4tpirTOkohYSmhSDCei9Zi7EE7GlA8n15ZGR
         mbAu0n1swWKaE2zxBdCfAYhM9Ip16JGUmTigtFej1sSSi8/6xu0uZIxB6Ndn7kWJsluz
         ILu9ZBlD1u0JbA3i5RLvhi/+jkTe6zCzOUTqLpxXVMWc7ocGXY7PgSFd8a3bl8g3VJTC
         C3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783564444; x=1784169244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=XIoIVYp4KTToMx6QPLDOJ0st+SeZ1JCL2svOcyQ1fhoEc9O9bPGvk7Dvb5ayGd8bNy
         YNueY1bxSsv4Bhw6x0DsG8JG+hkMtDgnOwJp7a0EhjCjlDzdvMI0zC/+EWrfrtIAzl78
         miRl0njZUjROZ3sXR3JtfwYqO3ofwYkffqiz9r6hSq4wu/hUt77neav2I0pS1FMY7bRD
         8P2wXrSNEBMlMi1/ud9U52/dzqG9QHwqdnH3HUYpk/U+iWTR9WOqKTt0dpGsSe2K4Lhz
         NtmBF4cNyeWmVU6WYZOkbEosvwyf+6c3zFST+8o5aVncQ3QCexOL2TGiXNCFbjclArWY
         soRg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Y/bMcOBvbdnPK+W8wYTUXK1V/FbfE5YQbcjRD8E/zZTnPLjdCOukoJeTmStlL0M7ZEH4/aoKwD6w6q4d@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRWhgdLXONS6dh//bhEUQiCqxH9xJP/2SLTbQ8X7FlHTyp/9M
	or0MeCqtW2DC35QMO+6QX2PjKghhZxkdF4ShRffvIuKQA+az/DOGqc8kvt77+ReZsMyXCXbKmLg
	AcqB7cmx94bPZOLQqjTfFYkXC27Pr2qw=
X-Gm-Gg: AfdE7cnz87p9Jzh+GwYLhdwJc1qtCckRR0Nbm5xuz7EcSGBEhS8etVOs4TcDgPZIuqx
	Y53JFXBoNt/gYe2N1iGGO7n+V7JSi5E3q+trzPaqw9Ha0Z+8BmrjHtBahD1r7CShh5fi/jm9gbo
	Aj6oiocvXbNwLlGQRyVfN4FrTMaZ0vZ1op6ZdXI8u4OcnG48bRd6PN74hnnN92I17YdQiC56cP3
	7UX4OBZ6yUjddK740X3OD9uG0LaSFhyKPmf9i4YiqF6NMsgpOzMvx9xhOFNKIp4C4/6Gs2K/YNy
	i8a+wL/Q92wU5snDoY2yePC+hQw=
X-Received: by 2002:a17:902:ce91:b0:2ca:ec6f:aeca with SMTP id
 d9443c01a7336-2ccea3847b4mr47728935ad.8.1783564443676; Wed, 08 Jul 2026
 19:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708141734.578926-1-phucduc.bui@gmail.com> <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
In-Reply-To: <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 9 Jul 2026 09:33:52 +0700
X-Gm-Features: AVVi8CfyewtsE3QT1H6Qb0mhvtRsc5zTxpasaNVBWAckYMH2ZTVpwhyO0FrCTdA
Message-ID: <CAABR9nEjwXufG5FyWm=ExiDEmpO50U8Tnr6yg=CSFPo3SWrJJw@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117824-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[suse.com,foursemi.com,bootlin.com,diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF13072C13E

Hi Mark,

Thanks for letting me know.
>
> This doesn't apply against current code, please check and resend.

I'll rebase the series on the current for-next, check that it applies
cleanly, and resend.

Best regards,
Phuc

