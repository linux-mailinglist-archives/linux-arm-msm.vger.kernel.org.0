Return-Path: <linux-arm-msm+bounces-93696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFcEJwpinGkoFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:19:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DBC177EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04294304C945
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3F2142E83;
	Mon, 23 Feb 2026 14:16:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0BC27FD74
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856214; cv=none; b=mknQpWEwXXgsPdkYxoaUfhilSnLZiebzi+u0aDRW6VfvGCEdPFXGgt5WYrwLe6n+pFLrjp7tds0dyMRiULpJ04PPv3sT8PQqWCLgdcfZEhoeelzbm2mOJYLKARIZD/BOG1QoBt+CyYZxbALcZm1iFqQCiH5FvP4wsJZBtHAY0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856214; c=relaxed/simple;
	bh=BPlCyTz8G/El4l0BA0OckJ22InPEejXQZx1TWREEqyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcKZ9C5uTWBR513VCLQd5spjbV7w1hySf48XbIo6PKcc27aCzSQhqdO38XaTomW8r9ay61IjTcZHrUsQ0LT3xCNPEIUAvt5km1w0KJdKH2NMEkcpC25Jxdbmj9+JMaTchhl3BuVC9tjkOP1DMYv0kfTmIHW9bILpaSsLTp12HGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d4c383f2fcso3783548a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856212; x=1772461012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLzVdK8lDfgaTPyV9xNjlD/1kxno0u/2SblofGNbVRQ=;
        b=sI74bB821BgBC4F3b+3a0bRp/F1nK0dgHWxOzZ5mr1RqyFUD6nE3ZlySHhn+OySZE5
         kiEIHowlEcQzSZuHuuz2FMuSTJp0S2S0iLy6v0vU0rEyCdMzxc9ApEF4PVL+pmeH0bql
         82cdtii35r1NgRk0S1TWAAxJ9h6CWLOjuozzjwR8K38A1pPdnMZGe1TMUAxXGYtjiDfY
         q1icskgLhgo1qEKX/LeK5eTqg0HuwkWIE9IV1FWZGwPQIhXIHWP+IA+1l/1uJNREqFqO
         ZGp+ovoJQwFkdsxbYIUzAuThB+TYyLNbun/G+lUbCTfRvLO4lL+6AyvBgJ8SD60tiHJW
         f+iA==
X-Forwarded-Encrypted: i=1; AJvYcCX55mwNzdg9Fb/vkLVIe7zW/Xwpk5v7ALZ7TlUdoqCEQ+JZ9p5KIs1Ig80+XokYy/Wmp/SjSR42IAut4k9H@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aoVj/jhj5uVTqdNqIEnnFxXjTpVnDgqMZUMMSN/2tMhL/8Le
	Zcrf2icaj2JR+hM9LdXyKiEof6rc134DQW+C3W9HloqmLs2S6b0yhbsZJh0hzZnx
X-Gm-Gg: AZuq6aIRAh2tnTwglbfnnGQ5cqON06oLKOzUDgdYkF9jGRx8MtXCrqdfFNvJOFmTass
	jcESA/MFqCRZHXzna13vIfpBomHK1le/d+ryqE3Fkz0hxIoNUKmuR/XTUhnijSWp+RGQwloVaVH
	qDKk19LMgruL+roQPBYwAqKe0piIAI4/2KbfYPEwvOrArtOXA4UFz+GNp6T718LafWFx/ln7qqc
	isA0ULYRQhrYZRB/nci2i/HLyusptQJWOfHGiWBPQ5YLzRwYoWiS80pWXT5zlaPGPq8SVLWfmPE
	kHRI4pz85BMtpbCxBZ6NmtDtMbGhdmR08OhH1sAfiipNUyBcdorZDNN4FGd+Yy0QABX7VK8kTqE
	kEszfirl/81H7myMlkyHqftPz6d+VK+osWWVIGbH6Pmhalz+kfTtljog3CgVQAd6fzPeSO961Zd
	zIz/179q0UpBLn5j9hm7kZxNNmDCOZ+L77mXWKVUvOP8ZglzY8vbwt+/tlsnA3
X-Received: by 2002:a4a:e906:0:b0:66d:bbb3:caa7 with SMTP id 006d021491bc7-679c44751aamr4982197eaf.25.1771856212535;
        Mon, 23 Feb 2026 06:16:52 -0800 (PST)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c5644231sm6731682eaf.5.2026.02.23.06.16.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 06:16:52 -0800 (PST)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-40f387a688dso3238056fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:16:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUE57CtTjxf7klNTH4v6t6xiUmi8Juf1/ZnDWyQsW3IAKUQ5XlKSJ7LmO/TLj+kKC5wWY1T+6LCrLYoMVSg@vger.kernel.org
X-Received: by 2002:a05:6102:38ce:b0:5ef:a346:a020 with SMTP id
 ada2fe7eead31-5feb2f081dbmr2742454137.17.1771855750377; Mon, 23 Feb 2026
 06:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 15:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
X-Gm-Features: AaiRm50V2ONm2B9njU7ZJRcOuR4Nb8zI5Hsqj9aPxNU6M55eyuOZ1HhwjvL4ass
Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-93696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: E9DBC177EC6
X-Rspamd-Action: no action

Hi Bartosz,

On Mon, 23 Feb 2026 at 10:06, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Changes in v2:
> - fix a NULL-pointer dereference in gpio-rcar (Geert)
                                      ^^^^
I guess that is bound to happen when a GPIO maintainer touches
the I2C subsystem? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

