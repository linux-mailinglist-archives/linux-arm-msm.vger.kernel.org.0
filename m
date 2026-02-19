Return-Path: <linux-arm-msm+bounces-93430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH3fFN9Vl2lPxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:26:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DC161A92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82386300BC98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 18:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21722D94BA;
	Thu, 19 Feb 2026 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SluWv3z2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E22BD031
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771525558; cv=none; b=c5rqpA4NsAeYDB1L23Ze5XbpMClhQNxs5KuFBBooSYP9hY1OJiLP1QtWpxCFs5Ld5KFkxoNMSmrydkbp93qsn9LHTo8MmUJ06vBpWG2wK2goBjM6ZM8HU6V6efSN/G39AM8cQFti9beVkR5ZkK7ls0+zD9CMOvHu8uRsZRfybN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771525558; c=relaxed/simple;
	bh=LbhSbi5zKqhiLaVuo6XC2NAsCjq2jZSoAuH1Hc08HGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMXK6QUYzpQnhdxDYGvfxh3l+Ax0/+fcn7Qps1975xHfxebeyLHz8gndfUQerik2Hqr97KAPObkM4i2nk3EcH0XsCWRe8rnjVwkibBCTjO6HvXQQwtj1b7UHEKdkgAVKhnOeFAW7poRLcUjXpGBekMeBiVJn+nlxeT/nc4NnMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SluWv3z2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AFEC2BC9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771525558;
	bh=LbhSbi5zKqhiLaVuo6XC2NAsCjq2jZSoAuH1Hc08HGg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SluWv3z2fbYGa/M/cfmT9kD342wqlhAPqgw0lSycC+o3bUC5OdVvTvfC5uonwWiRE
	 D9W3gIdWTwp08pOBWIjVA+Tc5KRzBBkF7ZJk23L7wydBSqoz2w4A0wd0e3GEgRbqJ9
	 +XiVctS8adKqy7tdADduCpyb7Hexx14K41LT1OTqLADwijH5QHuK81byc13orw6W/C
	 TR66guly6TLm9nycqx3+M6Y/XiPaoKtk9p7CTyPmsKgz4Mo0HgnI9Nkbcdcay2Tu41
	 mXxPjs3g6rsylmzw4WXAVnQS8EldXA0NLVio08g6nbKZzvn6q/PRzt9AZhdxROLB+F
	 kt01VIENYWniw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-797d36fdb96so29364227b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:25:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVn2PRi4FERaGj+gBnKqgJPYPAJwtZ+LjWlx+3ATWYqYXqgSH/egqi2lZNRw4CtY6COViL+DalZEew6n+84@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2qS99IGNMvu3SGZMEGYmjVsp8Ojl8WiAv7vKFTS043Fjj7Ga
	NlncvqgS/ZGe3H5tnNtArNtHNp3A2bH9Nx7lTtBwV/pBHDFWYOtWJVgLqsPASdcD42MbNLZPDcO
	tZRKEkjQl53vPTqezeBgEgXo0R+QEyLU=
X-Received: by 2002:a53:ac85:0:b0:64a:e1e3:77d4 with SMTP id
 956f58d0204a3-64c6419f99dmr2035943d50.23.1771525557543; Thu, 19 Feb 2026
 10:25:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZZeyr2ysqqk2GqA@google.com>
In-Reply-To: <aZZeyr2ysqqk2GqA@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 19:25:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWib0pzY8_UYWk-6EW7egDW-kvTmM6JyRP0CWh=n4e+A@mail.gmail.com>
X-Gm-Features: AaiRm50mZeka2C5ADE1wUI-_EJ7HPxC0dqPRO4DT50kl3QcwUgXVOLZhA22rAVg
Message-ID: <CAD++jLnWib0pzY8_UYWk-6EW7egDW-kvTmM6JyRP0CWh=n4e+A@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phy: qcom: qca807x: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93430-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 971DC161A92
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 1:56=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by qca807x_gpio_get() is
> normalized to the [0, 1] range.
>
> Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::ge=
t()")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

