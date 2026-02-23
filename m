Return-Path: <linux-arm-msm+bounces-93704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLb+L6dnnGmsFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:43:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F55178318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F00753022F7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C3034DB60;
	Mon, 23 Feb 2026 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwfIKLux"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236C634D934
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857828; cv=none; b=L52xayJL2wMwrH04u377ayPGy9m5P0oNC7sFNXe1F9ZmircWTmEIeaGOxz3Nv1u7HigdHgP0uKS0rJTbbBQGWeTuSlAmh1m8CoiW+zWhGaZG2WxOXZCEDmosuepZTFDQ2qWqAHgFDqwDH6eXqmZZDV76L+xr16rn8rREYT0AZ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857828; c=relaxed/simple;
	bh=xpkGtbKSLkOC6t0Nfnp/Fk4IE5J7TBULp81UPGnND4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/Hb34OqbUSiG041eDBlY8lU9VxNhwp5fF7pso6eudu7EDy021qHKdCF5COVkQieSHvFTxnIv1mH25SryzTOEqR6xTPEkHWFzh6UwWEnmrATQha4IlcDyCJ9FZ71CishQgLb7L3KS5O2lrUJOhRY20o3EM3EZCtrlgASSXoVVts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwfIKLux; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FD5C2BCB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857827;
	bh=xpkGtbKSLkOC6t0Nfnp/Fk4IE5J7TBULp81UPGnND4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VwfIKLux9JjVYynMSEnRVL7QtelWDuU+UToW1xycpMKmPtA4YQOmihE34mNLMitaU
	 19JHi1jtHx4qQNpipfLozCmLfWV0AKwy/ETivTpZ7kB6ideqGLt1krkONxaLqGfZNJ
	 POTa/jhoJzkQFJeX71rR+Ff9ZSLSF6OgliniAp+PjXv81p2oVqZ4myDxHuBxAz+rVy
	 Y6i9V2GaRTBGDcmGypb7XZc/xXKdCn5cZG3zABAAQCgLtoEuMcZNd1yi1R/AgFKlhJ
	 D/vm2EmJqMLN70ekuobPW6e3dK4zQaAasrGzdZ6UmQVBG23mUpTE1I79kr4OKLUPth
	 JtBbFlWsbOZJQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4887901e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:43:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/rpGthtxcpJwZWkFHtNSEYa/xESo/EciMid+3LL95ui/lxe/emvXCVmtbDmvOWP+DqUuJJUqIpP8okKtC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69eO/iDvBCDidAxZbxkVwD0EpBoNmj7+zJy5ntQ2AarxasJjz
	3qFXyWMAQALt/rSsl+cNedhXlMUV01IgbXwqxuWL7sET0u64TOK38k3OhwKHCZckDOEYZHI2j8y
	he88d6SxlWRF6aK0vQtcK8oz8Y29ouvaY0T1rpUdRpQ==
X-Received: by 2002:a05:6512:3a96:b0:59f:6ec7:fa6 with SMTP id
 2adb3069b0e04-5a0ed9b2a30mr2997072e87.35.1771857826355; Mon, 23 Feb 2026
 06:43:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com> <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
In-Reply-To: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 15:43:32 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me57wj7=BJ_nJZP9BV5-ZhebbFAS+DcZ=ifGxMyo=S2kA@mail.gmail.com>
X-Gm-Features: AaiRm52wJXWjyETw7SJc1Vpbds6l0EdwJaHmK-itcIl4J2BcM6sfQPM4owz6q88
Message-ID: <CAMRc=Me57wj7=BJ_nJZP9BV5-ZhebbFAS+DcZ=ifGxMyo=S2kA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
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
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93704-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,sang-engineering.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33F55178318
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 3:15=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 23 Feb 2026 at 10:06, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > Changes in v2:
> > - fix a NULL-pointer dereference in gpio-rcar (Geert)
>                                       ^^^^
> I guess that is bound to happen when a GPIO maintainer touches
> the I2C subsystem? ;-)
>

That or caffeine had not hit the system yet. :)

Bartosz

