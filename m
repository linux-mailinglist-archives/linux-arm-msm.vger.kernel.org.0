Return-Path: <linux-arm-msm+bounces-118471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YgERKTFyUmqMPwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941274233D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VzfPEDoR;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118471-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118471-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BF4A302A4C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 16:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099463C9EC2;
	Sat, 11 Jul 2026 16:40:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1493C9EDD;
	Sat, 11 Jul 2026 16:40:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788057; cv=none; b=TyaWlsIuhNa2bRh/+Ahfn42tUUjQ690TKdK0/MrsSUHiQeUDoIMPQbqbAGp5CB78dyDRgS3y7ciL7QoXqcFyBUPyROwOKtkTK1Da1k7SF/t0vH2k8m8Ae9PQ0gXjpE9JcTjH3hJ+5khrJ+fKhQebpVBTaUvzHno2LN75o0owO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788057; c=relaxed/simple;
	bh=pKnBYKLyHuSf6ETsbZ3BteL3TvQpQYOhO3QY8f3bkw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qz8BI3Z2g/TXJMJeaYMm6WuOq6fYUSexU67jkS7bf7j5PrCY5OX4nGs2uvdOqC+aoyJ8Id5UxXyfH0SfTQWe5ZuM2nRmV0u/QDKJJu4Kbpi+oyuydfyqpkFm0P/91K/E37TEE1kYEuIhCqD3/GUUto3+4ZsFrKOLVqPrQ1r5rx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzfPEDoR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5101C1F000E9;
	Sat, 11 Jul 2026 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788053;
	bh=kU8eAldMUt6BsxSC1s1flabEKxNcK0QCEFn9gZa0Cxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VzfPEDoR2W4YKDB+Z3cwXFJ7WVkvy0WZoya5EnwkNzrHapNrGf/0kazq2g1N6YOFI
	 N6gcd9IbbGt7WS1/cZvElgqKqW052NEdYL7XwlGk3bkgbP6JU42H2Rso05yeb4PB+b
	 SuRD9uDwOUsxuEXj5pmfRqDKsrLTL67mayxhD4Wren9xXemSklwC05ldMweBpiiVXj
	 jIrVQfnE8AeZQ+l83txCSJMxwNzW/4xW7/3qEItXuOsutIaPEVb/c5tlQ6/wmTYD4Q
	 kE8hkZnOZ9FyZugQkq6OZuGk4onPYzonIvm7efmNxhqVss0E74G8osASL2/5OKASDM
	 0BcJ/z1TH5O7A==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Konstantin Shabanov <mail@etehtsea.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro
Subject: Re: (subset) [PATCH v6 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Sat, 11 Jul 2026 11:40:39 -0500
Message-ID: <178378800441.138068.1778239842219741466.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629154812.9066-1-mail@etehtsea.me>
References: <20260629154812.9066-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118471-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mail@etehtsea.me,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0941274233D


On Mon, 29 Jun 2026 22:48:08 +0700, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 Snapdragon laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].
> 
> I'm using it with two external displays connected to the HDMI port and
> DP<->USB-C (over external hub) as a daily driver.
> 
> [...]

Applied, thanks!

[4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
      commit: cfe9b47ef18bdb737be480f3e539e9561ef74078

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

