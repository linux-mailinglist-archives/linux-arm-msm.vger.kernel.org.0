Return-Path: <linux-arm-msm+bounces-112754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cel5DPykKmoluQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:07:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E52671AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:07:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZFiXffe5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112754-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112754-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 041783005598
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CD93EF640;
	Thu, 11 Jun 2026 12:07:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20C3C343D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:07:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179642; cv=none; b=MUkb8A9mf7WpGpE1CH4zyoxDReSmBOPfORNRCaWHngvyX6kg0vJ3UbDxT08C1SBuML4ceXje2hKOmLgxWkQZudst32TCVh2PLhiB3TAIXNlW0DY8fL3sRLsM/u5VQF1wjkNeOKQiai8/Vc9ciUz5OzQrVKODtbXRCulamdSpYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179642; c=relaxed/simple;
	bh=Y5O0esjs9rbfPvesVaqPzOrKWkANIwU8MkgR6MrhlOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyGTv8ERsSlK1QZqiGSt2lrwBIhxg4lBGt8y5NhrxB3de2G4xBoAJF1IV2Jm9dwj29DBZ18Y98s/hu4HBijXmN+h60OkbNepbpKQKLcNE8aWbKM5fFKE5hFAk1G31iU1sMfQnymfAC9q12ByXcJuGQuQjfoOdMwiuiEDbOA0iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFiXffe5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254091F0089B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179640;
	bh=Y5O0esjs9rbfPvesVaqPzOrKWkANIwU8MkgR6MrhlOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZFiXffe50qrmpBwvo6Ll3SV8r3CXDSuesxaMt9JaFPggLkLsMcyHm7aMWfNnuJJha
	 R55/zVbwXtDrqc6E34eRR3aOPUU6eBJYvkazexD9Tzk0VBSq04d/0g0i1BJDvZPGtc
	 xfypQR4zOHNnrKeMnklJ4p6wwFbprWPuC/c4qAzo0eRiFLroHzJqbPjsBys1zkyK3w
	 qXvjaSpmYPM8AdPNQpyUcZQMa/ZlTfVveSaQa/qrDS79zLMhzwykQkzZPPwt7HWcv9
	 dKHyjS9WaEIn/HhsArNNaXmuaehrrlLMXNnolv+aMH3OCjJcrd+KnPZoKnX9Pva04k
	 mZJovRBakSJcw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso8239792e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8qGvIzmhzeaWM3WdICbk+Xcie5gI57PhZ3k+B3nd9fSj4Cshk7qHtBpwAzAIApLBFikRH3msDHqejOetKo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86TVJoouKMNt/RvAnETY0D0A8LCyC4msVkbbvY3D723dbAKRr
	pqipOwKbmFLUQ+DHR3UuQrEF30cSoQrigPgYk9QLK9aIjWwshEzIT+GB3lIXT6prLnrHpmHOzpv
	hh0uXSSfPHH+o9qHRQMuC2cfuY8Kc2DI=
X-Received: by 2002:a05:6512:224e:b0:5aa:655b:ac29 with SMTP id
 2adb3069b0e04-5ad27ac04c3mr852433e87.13.1781179638920; Thu, 11 Jun 2026
 05:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
In-Reply-To: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:07:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXpK5YbiY18UDyCB7qTk-oAFAf8Lp3795f4Mm2AYfn9g@mail.gmail.com>
X-Gm-Features: AVVi8CeScm66JLE7bgnGC6_ZMAcAqvuYgWnMiYZr-LWLvJEzrFjcAgE3TS_WfZc
Message-ID: <CAD++jLkXpK5YbiY18UDyCB7qTk-oAFAf8Lp3795f4Mm2AYfn9g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112754-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:navya.malempati@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4E52671AA6

On Fri, May 29, 2026 at 12:43=E2=80=AFPM Navya Malempati
<navya.malempati@oss.qualcomm.com> wrote:

> The macros QUP_I3C and UFS_RESET are defined in some platforms
> and yet not used. Remove these macros as they are unnecessary.
>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

