Return-Path: <linux-arm-msm+bounces-104942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLj5FNOH8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:11:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8DE4824F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 411C3305A377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C29F3A8FEE;
	Tue, 28 Apr 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkf8udkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90C3A6B7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368977; cv=none; b=qNOO3yoMpqYXrd44qa3nBJATCKnzRKTm9HCSCo2AZcjzrwrAKOO0tfs+CaVTFK9eVrmIpmaUSu50CgGlRqdVNhwfKpsRKElFMdJJu1pjZGSNR0DeCRDS+lHzjnOJ5m/ByA+vgsYsm+KCYLvqBidfft78cu7LDVweGqA1JDlB1ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368977; c=relaxed/simple;
	bh=Q2IhJTHAuC1AUXT694Aka6EEu2Ra5aX3eEAoeQ3/L58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C59ArVHDFcXqhtqUojM6Cs4bjssR6FLFELl3N/8wCWIuooPv0LcFR/xbCHBORPZlBmfaQlJVNN4jLWp7MLKQHThj3DLGH8ousJjvxQHqBOFVDrU2zrd7ot/rHMbv+03X6RmTkdDpL2hSS4suXqP6gQVcMfiVFBG9KxXPlgYQqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkf8udkc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E007C2BCB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368976;
	bh=Q2IhJTHAuC1AUXT694Aka6EEu2Ra5aX3eEAoeQ3/L58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hkf8udkcJ9pDoGKdTdODBX9okvmZW46aRLqAsYTpkBtG0vBhhMIa6uHLnlErWLvNY
	 ReOTJ3VVXKopkjBroPV0BPGRG6C4jljPXmF0jETV3nekZZiXbviCZUqpVFloYfeYw5
	 s7BJQp7PNO57kaM7ZROQtUUmXVs/cCmQ3d5hu3cBOYTTn11Vge52vSyIc1fW2d7xfZ
	 Qrco4h0dsZHqYh/H4dlrMQE501AmOroN28YRy/JbDq69XQ1zMHgzi0Lc3Pb7hRmQKF
	 2lRQ/OKgT9Dpvi7dfMrl3xgVBDqpzXNbPa/s+EhHwVysgt+U4Ja23gdsTn8QUqoOJp
	 plzh3imY0YCDg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ddd8d3b7fso85978581fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ghtp/eFI/hg19kn2+hU76qjdvyOi+5iHB4PwVfYrhAMMxxZ/MsgfKpR5YpipT3U0mejmnIhX8Ulm20DHT@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9c+WtF9kcMDI71wIX8Tmqo/GU4TuOLRyecwbM24O+dmB69ru
	fagsfo32nQqziVrhdSx34RcyQw9M83g4f5q8sUIh1J6H8A1bX5VRAR6xNzyGgCdYCAwhwthdGoT
	kiMRFbaZo6JXX0+36WMNucCEqjTBY4cU=
X-Received: by 2002:a2e:9218:0:b0:38e:98b0:3a7e with SMTP id
 38308e7fff4ca-39240fc94edmr5214731fa.22.1777368975320; Tue, 28 Apr 2026
 02:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me> <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
In-Reply-To: <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:36:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLk1TOwi4_=X-t0ebw9tB0oD6OD9-4j8UuzJZ7FDfY+S7g@mail.gmail.com>
X-Gm-Features: AVHnY4I2P6r0AE4a6jocyU9CkLCpVqv8N3WBBx2c2fr0tJivJQROa45r3-7KI8s
Message-ID: <CAD++jLk1TOwi4_=X-t0ebw9tB0oD6OD9-4j8UuzJZ7FDfY+S7g@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] pinctrl: qcom: eliza: Fix QDSS trace
 clock/control pingroup names
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4B8DE4824F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104942-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:email]

On Thu, Apr 23, 2026 at 6:51=E2=80=AFAM Alexander Koskovich <akoskovich@pm.=
me> wrote:

> Fix a few typos for these in their respective pingroups, the groups
> already exist they just weren't referenced.
>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

This patch 2/2 applied for fixes.

Yours,
Linus Walleij

