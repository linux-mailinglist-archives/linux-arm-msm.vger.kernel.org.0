Return-Path: <linux-arm-msm+bounces-101117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JpgN9oPzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:18:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5136FD72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 734383016ADC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D278377019;
	Tue, 31 Mar 2026 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="me/OxFfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054C2C21DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981054; cv=none; b=r8MRkG32Qo6vWvTkml4k+SWf/8AjuPfvryS3bljRHhQeY/TnTHac0a5UUZN8duAScmCqXSSbK2xKXa+VeGdBWZeudxgtaOVmU/0hKa43j/BA+7+k41+7F6IdZ4PLnqETgbcgYgGYWpez6nRXYMDPzoUj/AG9cbxs6m6q2mKMx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981054; c=relaxed/simple;
	bh=5SfKtWMW/MTMKZvB2XBW+7ZIzP+paJSdBKtCWkXfuQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9wuKV+aW0UH2yL8m0Rp6dDob/nIeb3A7MIKRJEHPiOBfM9xrXGjaMwqNmOcoE3M//WeoK/HgXH06+Ofwb7HM7nNnFMu2cG+RG9IeziDPeOaRjomQ76moEPWerVB9K+bP+UPMBKpwwAZa6fuwfOn5aqCEY0HN3fY6w0PFTUjuiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=me/OxFfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2A0C2BCB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774981054;
	bh=5SfKtWMW/MTMKZvB2XBW+7ZIzP+paJSdBKtCWkXfuQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=me/OxFfUISMvykfhsnEp+wrFvLV35pI1c90khhHC9tV28mOWcbhwxFXO3x3N69ImG
	 qAO6HtLLxNjsh1iVi549Qlv8GIkxUxkJMjA8WwCutdxI5pDGx29osO63pdaMS+D+FO
	 xMiwJ1DfB2/50loYj8Bao2SjTl+2m+KW0ZGSxgE0OKrIHPA4AdV96H+B4khxMQPwj/
	 sLUQrVAh9fctU1onyWK3sFJwg3xiucEr9jdVKjFLnxvFVvd8/sxp0papS7IaY/+N9n
	 ZPDlP0TU/wgGoZIBJ9qbS74BAT8pXvHwgOuI5zrlYqJtFV0T8U0UYT1HxAZ6KNu4uV
	 jB0Mjl4Aermyg==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7a17bc5745eso68697b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWG+rZv1/Tv6qoq3VhFG58442WB+odc7GKG6iH4kZLL0Y0G53X0MVSpqrV3adbuh1zszeUbmd79nAnktuje@vger.kernel.org
X-Gm-Message-State: AOJu0YzI47q6bNxmoJg76OxI3m0hu7CaC9qJvqTa+7Y4V83inx5ffPeF
	rQL5788Xknhr/yBW6xgNbPDaTPTgCo+UeSxoNLsJMJljvQjhiouok3TahoaXCQkPZ4TPTm9rNS6
	F+M0fEocjcRGJt+rfYhrJ7CAy86toXRE=
X-Received: by 2002:a05:690c:84:b0:79a:4767:238b with SMTP id
 00721157ae682-7a20ffc58b5mr5096637b3.18.1774981053248; Tue, 31 Mar 2026
 11:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com> <20260331-expressatt_camera_flash-v4-2-f1e99f474513@gmail.com>
In-Reply-To: <20260331-expressatt_camera_flash-v4-2-f1e99f474513@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 31 Mar 2026 20:17:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmK2Pxw=Zj_8TsPm8vKcLWwGRjuFzXhHhFgq_ekYmmrzw@mail.gmail.com>
X-Gm-Features: AQROBzBYeESNwniyKl-C50INEHNyIKSVre4W_M1f7i-oE4ahJatHHOaELZwZf2Q
Message-ID: <CAD++jLmK2Pxw=Zj_8TsPm8vKcLWwGRjuFzXhHhFgq_ekYmmrzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-101117-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87B5136FD72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 7:08=E2=80=AFPM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

> From: Rudraksha Gupta <guptarud@gmail.com>
>
> Extend the RT8515 driver to support flash ICs that use only a single
> GPIO for both flash and torch modes (no separate ENT pin), with an
> optional vin regulator that gates power to the flash IC.
>
> When vin-supply is provided, the driver enables the regulator before
> activating the LED and disables it when turning off.
>
> Make ent-gpios optional and validate at probe time that exactly one of
> ent-gpios or vin-supply is provided. When ent-gpios is absent, the
> driver uses enf-gpios for both flash and torch brightness control.
>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Excellent this looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

