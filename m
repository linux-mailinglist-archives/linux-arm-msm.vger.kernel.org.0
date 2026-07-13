Return-Path: <linux-arm-msm+bounces-118801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HKVcIC3zVGpghwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:16:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C10AA74C3F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:16:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b="fvbSQ/tJ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118801-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118801-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=proton.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 059E4306B7A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE3E361DA9;
	Mon, 13 Jul 2026 14:05:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640FE18D636;
	Mon, 13 Jul 2026 14:05:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951527; cv=none; b=fk/Y3jpsvuBJUKPwvXF/0B3KhC/n8vKIbjhfRK0GAtOIOuIOxI0AasOl1tb3eSRQeScQSmKKwc43DTdigwKV4DSSqhOy9zf/3YL9zwhSFNT2TVd98n1lovj25sRkgo38VhR1AGWGnFZcAMizBrabtBCXvWCzheDzmT3AwZjt1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951527; c=relaxed/simple;
	bh=Jmkrf/EOcsaJtEIwx99+hxx+pRDkd8Tp9R0cq4jY6os=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bymJbsc/2lDHP6PglCFDvkLaIV3EBtWbWbUxcz+wsqJMpOYnv2Qeqc1Dv95QqGbVenfeLmRRbGO2bz0HJySFPeJS8PC6WawhXuUz2T0XM1zx9Nvh6R3VjAFKU+PD2H+kk0NY/rTB0lz8BcJUEK67Ec8G3e4MErfvjlwFbKY43J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fvbSQ/tJ; arc=none smtp.client-ip=109.224.244.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783951515; x=1784210715;
	bh=JNVm5dqtN4z1AXI4iOUrU1/SqbEPl4ytOZKLht8iRdk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fvbSQ/tJkUDLyg3/6asMTv9lTYHTIYXAw4o0ONgjz6ZQrMnA3qtx48KjyTjICDwQf
	 0sGjXv97+Vrz8iqRL+83wHypwtbglPZV8L3G+HQGmnYaEOAWvRv6Z+WXyQur78LyGl
	 sXGt2S9k4lTGQubdPqB6UuqsV3IC8XCjAxjIFjD1KYLZ+yvsvDGtXcftzuT0nKe52H
	 Gs7l29m59PCe+/qxgJCLRuCDYmRjKzX+t0DINc/mVa9Syqlu1SR25lwyfQJNpNGIef
	 qqG2ebhDKAdudpHGg59UHnh8swkDd7UcnVjYhLr3OlN36cfFk254F/02vfXlcjRjkb
	 d3L0f0+EMoRtw==
Date: Mon, 13 Jul 2026 14:05:12 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
Message-ID: <83ebfe48-3161-4261-8e3b-905b2eebd2ee@proton.me>
In-Reply-To: <dcea3653-1428-49ee-9287-a1b27da2003b@oss.qualcomm.com>
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me> <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me> <dcea3653-1428-49ee-9287-a1b27da2003b@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 69e0dd07640d0cb1341423a707ce184a092d134a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:danila@jiaxyga.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:from_mime,proton.me:dkim,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C10AA74C3F8

On 7/13/26 6:47 AM, Konrad Dybcio wrote:
> [...]
>=20
>>  =09/* Enable clock gating for MDP clocks */
>>  =09regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
>=20
> This would ideally become regmap_set_bits(..., BIT(4)) in desc->clk_regs_=
configure
Will do in v3 :)

Regards,
Esteban


