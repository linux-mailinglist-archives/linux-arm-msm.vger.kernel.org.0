Return-Path: <linux-arm-msm+bounces-104963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NXUGiCW8GmrVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:12:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 076AA48368D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 265C03089098
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8578A3F6610;
	Tue, 28 Apr 2026 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkZpK3Kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300E3F165D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373473; cv=none; b=f+5MUyWGoyQT2k9Z+fQ10MCEu3rNEWe+gxZ3COh4s2XElvNy7Dn9RCG95T++df/3amQQyQ7tVDW1lEsZ+7QvZEYEqsFEfnxM/J4o2WqJYZDKxCKwVlXG7ySJJDP0FkGMCt8D7evEwzh7DfvZqSn62/IMa1Tvzz7ibX3m+sZkxaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373473; c=relaxed/simple;
	bh=0HutzdFNa0obdPVLGrfLNhx/g4CaTgRC5uNOdkJSmA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2ILcBAnXVjvw0SW3YS8LHFxpgMD4jVn4TnOUmsmotx4lAcAbWc0cFLc37ZEVnLGeCxOFyc0MCwXxxWB/HkPhGbSdLOQYuSWGf4+/CgVsEALVpz7T6hM9ydAUfCl48bpWKboK8AudIbX6QEv7VMjEDL+GuKUA37h/UXoAl7zLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkZpK3Kd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE04C2BCC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373473;
	bh=0HutzdFNa0obdPVLGrfLNhx/g4CaTgRC5uNOdkJSmA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dkZpK3KdiKZfm1LFxn5n1JF6HjQlDUahfC2FKTP7JpUO6sJSbCjgRxwKtFZlP6eUJ
	 FyM7ZUCSWAFcRK/JblqOih0Sj5T1exzFu4DiREsWuOfeVh6Qj4MxK6wr5C9J5JXIdC
	 ZlB/Q2GRLA3+qKIht+MIisszHOyrgax3YBrPa1lT4HGd54N0PSTEbTt1OPzrg0j/eq
	 D+ZQ4qTlrOZ01PG1MjVcEqIAMnKL1WIa5ghn7Lsee32GfOZ9zohpIelEWjCDyNjf82
	 GlTV2z5LHP19uh8u2G0mDuhEN4p8k0rd1hfIvDg7jiarivOH+sVtKvqK1TlTN1kkcN
	 PHvldzmRhafyw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e7d984096so124367091fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:51:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9hJXRQZqcOgbs7+MBQk2pO24/Japd8I76ZXNBLtToCV3vNF4AhHf/mOhPtNaIlJGFlqEJfMVflHKKI4RHc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mhrX+A47U+AejtWoB/rAp96MjW75OCB8JeWFg/jJr35votbC
	/yjm8QEYEmUs0rLXVconXA1UeQcZl/EDc9lDg95JBZOqhSbsZciGxEwXjg0SFwm407Nwhib8qT5
	0R3J9MuFiVdWNc+6gnENdrp5+i3mverI=
X-Received: by 2002:a05:651c:3252:b0:38e:cab9:365c with SMTP id
 38308e7fff4ca-39240b34918mr8858931fa.0.1777373471941; Tue, 28 Apr 2026
 03:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com> <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
In-Reply-To: <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:50:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmk2o+i4uqwsv9Pb5ABqnt9584gnmZLosNkLmx1YtsN2A@mail.gmail.com>
X-Gm-Features: AVHnY4IhvQMDEYW8EoPHVxBDI4gshdKsR1xp_fkpIh4_xsz5sgNJU3TihctEl8s
Message-ID: <CAD++jLmk2o+i4uqwsv9Pb5ABqnt9584gnmZLosNkLmx1YtsN2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 076AA48368D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104963-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]

Hi Bartosz,

thanks for your patch!

On Mon, Apr 27, 2026 at 4:00=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> +config PINCTRL_NORD
> +       tristate "Qualcomm Technologies Inc NORD (SA8797p) pin controller=
 driver"

Krzysztof just tidied up all of these strings, this should now say:

tristate "Qualcomm NORD (SA8797p) pin controller driver"

or something.

Yours,
Linus Walleij

