Return-Path: <linux-arm-msm+bounces-118879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id letxFghrVWp3oAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 00:47:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A123E74F939
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 00:47:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=3dkiarpw4bg4zokmj73yonjex4.protonmail header.b=In+B9Cui;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118879-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118879-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=proton.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 795AF3038F49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 22:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1F63B83F0;
	Mon, 13 Jul 2026 22:47:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81FF20ADF8;
	Mon, 13 Jul 2026 22:47:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783982852; cv=none; b=pW37RoTvm+OMb3YNqi2sZSf/ju0EeMmfQH1HIKpOB4v772oxkH6MzYX1G1hOFs6rEUOKeMhqC1QOmIV/+/2JgOLoGQfKVG+OkZn7vOBY0ynIGHzGbJnApH1jj6UppC/g+cgIiRhMPMpVWR50qhy0+P4XvUrpc172G9qXoxYxspU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783982852; c=relaxed/simple;
	bh=jMGWE8tA/29DhQ/N6afaPNZfUuTNcd/k2GMf4/rve6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyMJT0AJ9tLlv5qS+3FGITtiPbsdJYoC8dB2H4opKUtEABg6xW1PfMa/YyF04yO9tiUvhpIZSZP5SwMcdVuTi18ApCNj+qG6aBoqBlgFqJi9zPaNYU9JhTvhPJg1O+NMMksLFRQ7fqXXnmSb4P7lBp8zhM3u7fZhKEPAOJ9g8Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=In+B9Cui; arc=none smtp.client-ip=109.224.244.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3dkiarpw4bg4zokmj73yonjex4.protonmail; t=1783982844; x=1784242044;
	bh=jMGWE8tA/29DhQ/N6afaPNZfUuTNcd/k2GMf4/rve6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=In+B9CuiPaRuzaxYQwMp4IgoG2wMQ656Nifnp9pcE8NftRUttLfb9sztvdrtvADkJ
	 oFla/PDOyY9uXaJ5dYYvfLgKVjz4RhYwmpfre5fLa7bHz342234qyhm4yai/VJfS+n
	 RPgK0oNWGMX+XAKc3vDt8sGSOWkIS7AW+M+iZwgo/rgfQZFHQbSGFMj8M/rZ4oQRWE
	 nAmPZ8hIskIq/Wgxq8zyBXEwHE7O/fpIdERP0ikOoMRBrunvY8u/hkVm5BBLGcPswP
	 NBLMQuVxsLXKc5i5245lqlGgFOvonNOcqNFCpk7GppFmoIf7Giqg9aav+dMZsrFnrq
	 wcKS8TVh02ciQ==
Date: Mon, 13 Jul 2026 22:47:19 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: dispcc-sm8450: Keep pll types as is for SM8475
Message-ID: <d58a72e3-fbb3-4dad-a706-a61b8267825a@proton.me>
In-Reply-To: <d6a56ee7-2380-4e2a-b217-6d7398944279@oss.qualcomm.com>
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me> <20260711-sm8450-qol-dispcc-v2-3-fc1a07ac5601@proton.me> <d6a56ee7-2380-4e2a-b217-6d7398944279@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 31ff9d771682dc8a421c67293ce9b4f8748cda45
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
	R_DKIM_ALLOW(-0.20)[proton.me:s=3dkiarpw4bg4zokmj73yonjex4.protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:danila@jiaxyga.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,proton.me:from_mime,proton.me:dkim,proton.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A123E74F939

On 7/13/26 6:57 AM, Konrad Dybcio wrote:
> No, these are two separate hardware designs and you can't mix the
> configuration like that just because it so happens to circumvent a bug.
>=20
> Taking a peek at clk_lucid_evo_pll_configure, there's an early bailout:
>=20
> if (trion_pll_is_enabled(pll, regmap)) {
> =09pr_debug("Lucid Evo PLL is already enabled, skipping configuration\n")=
;
> =09return;
> }
>=20
> I think it should be fine to copy-paste it as-is for LUCID_OLE. Please
> check if that resolves your issue.
Indeed, this solves the issue and the display no longer glitches out at
boot.
Will correct in v3; thanks for pointing me in the right direction.

Regards,
Esteban


