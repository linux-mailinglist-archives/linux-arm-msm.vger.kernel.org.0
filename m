Return-Path: <linux-arm-msm+bounces-112557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uZuJC4DIKWoHdQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:26:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BC166CC63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:26:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PE7ghcoe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112557-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112557-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FC74300F17E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0708747AF6C;
	Wed, 10 Jun 2026 20:26:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615947AF6D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 20:26:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123195; cv=none; b=gu1BKdauaw6OXxAJuCmigMFSpRrciBohfBleawptqIOgzXRc3ev6dOtgK504ZG2gey86WDYOBZ3SPHN56j9zbXL51M1nHPqbczz0Xtl8MBzi0F+lRnofyiI67f/sVY38QGH8z+hTdX0GV+NKFMaqowZu01EbezLD7pjPE1Nu0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123195; c=relaxed/simple;
	bh=Qg/qfxcy1BYujEy2sc6O4WT0DNPahkQDbY35wNiKJCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liR+zCTTAkiOwA7zpjftzUr9bvG0W8C5WfZQKBQgO/6KNLfO/Jamp5fsyIfogHMTUvhUFQR6SV64elu1P24j0QrN1h4/Qhh5txmm4PnFX/ns+uZ41d37lxVyezmnCqYjVF7OsyujEUR63wJ9XhmqWaQnoDAv2DL6kMuL3Jxg8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PE7ghcoe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CA01F00893
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781123193;
	bh=EVOv78TcytEnABmq4Ak0qYtCqHY/hvOG+JxIbONSMlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PE7ghcoePWAZpFuIxf+Vv5Dbe+hlJPETjpPCvqiL+uPXB2b8wLmX5Lx7pv2ppe55p
	 ry6JqwZnoAdYgAapT/S846Tv3mEEM0eawrkIWxJDsQGkuLy0hS+QPwvEQu+NhAtZQn
	 x3zZuL0MjKv1beuhiuQQMumalJtxJFXf+658wzKLhhF9jcl/yUXegOSJPWo7Q2FP46
	 XX4fKqJGs/9dqKwcdEhUx2G/4hww1s+xLV6sW3OaesjiBZsM37uuYiyX7ZkQ3DY03S
	 AJgnvoYPiSpZ3bpLY0ThjhWXDP+CYcx5rHCHwvcG6fSnrTqnjDBh33KFKEPPNWEw1Q
	 QMgaNa7hhNhBA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso8589302e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ROAUw/cbeSol8jvzCj2ym7xGDpgwcQhEMNcqhTz/gYx7PgSvDeECCCHqkm2tB1zCuW8QvEt6RBfyoKFsd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7yGvNZ5MjTszvQ18a/raspUiihTbgIV2nSBZjSui+ke57VyRW
	bvpnhITzd215dgqILQvmJEnUVet3hrF4nIIY8rub5oaNQh+0cjjMlnwnGoHiUVhysZjuBVM99dp
	nY7sjwPWLLfNGFLa3DEDiKjfxmu/VbNk=
X-Received: by 2002:ac2:51d1:0:b0:5aa:690c:662f with SMTP id
 2adb3069b0e04-5aa87bc187amr7525783e87.23.1781123192225; Wed, 10 Jun 2026
 13:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050840.435933-1-github.com@herrie.org> <20260602050840.435933-2-github.com@herrie.org>
In-Reply-To: <20260602050840.435933-2-github.com@herrie.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:26:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmJ_FKA0aGi2LzjC=Gz=6QWANAPFmvToWOU8yE8qj3Beg@mail.gmail.com>
X-Gm-Features: AVVi8CfTsrbWGp8YMGCHsuE_RxWsr1yNlViod6_8eYvbPMluleQ-mqJkB0lgWSY
Message-ID: <CAD++jLmJ_FKA0aGi2LzjC=Gz=6QWANAPFmvToWOU8yE8qj3Beg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for MSM8x60
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112557-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97BC166CC63

On Tue, Jun 2, 2026 at 7:08=E2=80=AFAM Herman van Hazendonk
<github.com@herrie.org> wrote:

> The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
> footswitch (FS / "GFS") block that pre-dates the GDSC programming
> model the existing driver was designed around. Adding GDSC entries
> for that family's MMCC power domains needs the driver to understand
> the legacy register layout:
>
>   - the CLAMP, ENABLE and RETENTION bits live in the main GDSCR
>     register rather than in a separate clamp_io_ctrl;
>   - there is no power-status bit, so software cannot poll for the
>     transition completing and has to gate progress on a fixed
>     udelay() after toggling ENABLE;
>   - ENABLE is positive-logic (set to power up, clear to collapse)
>     rather than the modern inverted SW_COLLAPSE semantics;
>   - none of the modern wait-time / HW-trigger / SW-override fields
>     are present, so gdsc_init() must skip the wait-config
>     programming block entirely.
>
> Introduce a LEGACY_FOOTSWITCH flag and the matching code paths in
> gdsc_check_status(), gdsc_update_collapse_bit(), gdsc_enable(),
> gdsc_disable() and gdsc_init(). The enable / disable sequences
> mirror what the downstream vendor footswitch driver did on these
> SoCs:
>
>   enable:  assert resets -> set ENABLE -> 2us settle ->
>            deassert resets -> clear CLAMP -> 5us settle
>   disable: assert resets -> set CLAMP -> clear ENABLE
>
> If the ENABLE write fails after asserting resets, deassert them
> again before returning so the hardware block is not left stuck
> in reset for the remainder of the system's lifetime.
>
> In gdsc_init(), clear the RETENTION bit (BIT 9) before jumping to
> the common state-sync block. The vendor MSM8x60 footswitch driver
> does the same one-shot clear at probe for every footswitch; without
> it the reset-default value is unspecified per board and a stuck-set
> retention bit would leave the rail draining power while looking
> collapsed in software.
>
> This patch only adds the infrastructure; the MSM8x60 MMCC driver
> that consumes it lands in a follow-up series.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Maybe Dmitry has a point that there is too much commenting
going on, but I don't mind much, so work either way with
me.

Yours,
Linus Walleij

