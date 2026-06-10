Return-Path: <linux-arm-msm+bounces-112558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RAXjCtHIKWoddQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:28:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C866CC84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 22:28:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AOMyTvbQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112558-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112558-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95EB7300788F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066EB374E71;
	Wed, 10 Jun 2026 20:27:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF3389108
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 20:27:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123277; cv=none; b=bWd0b/Zkmdfb4PxJmf+Z6nl+dgxMIs4Vk/PS+oUSF5qpmsjLS4Dig0dXlnmI3HQr0IPPg3ArP5LBwcywxMDYQz6c/eb4nP7eW8AmZluFBc3NbTqaI0iCLVMJhIOL3qk1M4O4GhAejM8X+KX45qca1kehN0bUiVrhshicB0f+3pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123277; c=relaxed/simple;
	bh=pkkSKWR0KodJQ0vKkZtGPD0h3ScWWHyhcqWDDPs15o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PH7S28NwpfeZsFXDmAPh/gwrSQM/d4ny2GH/Tg703HyBiCDVLzpFOD2ev7pf3ofAVCTJwt7THyWnyXr/6xQP7u1rXoUuYqT8Bfatp662YV+IWtuuwS4OKGh4BMYscc0QXSn1A+JeM8Hvyq7RqZFDt3wwSNl8N4S/FL21qwYQdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOMyTvbQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF401F00898
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781123276;
	bh=pkkSKWR0KodJQ0vKkZtGPD0h3ScWWHyhcqWDDPs15o4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AOMyTvbQOFf4cnMqCYIp9/iW/sXw0BEIZtHETWgQjQl54joutGO8WdSnh6Pw2l3ll
	 yuerVxTf0SyroNDVTjAxdy0z3PV5vPhoeIsqLQKsN199ZTtNTXXbb0PlUSPvR766DV
	 Lq1aX5ONBFlr0Vag2CQOUIucCx/1uiJkD4Rb1Gn0fG/8C8J0Ex4L19NlHE6Ff8Vum4
	 ZMnUqUBnUuTH+mlWNTlCMXEMivzR0Xf23jZWQOL9kaaiLtSEFtBOep+cLY7IUGmZs3
	 0/z94M1yMQ0vvi+Fevrp2SkpDfl/PFT7pF3xHO+jaAwe+gk7A4Hor85U+7p5MEQh0V
	 gw3GvkM1StTpw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68e66128so7462024e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:27:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+WVjwvk7eKmmTqIO0QrgUG8RQLvqlQ2vHg/XoLm8w2VP7QNMC12Pv2DZZLzqrVmfK2Nvi4JoUDsf4CPiGj@vger.kernel.org
X-Gm-Message-State: AOJu0YwyynSDCKq0XsmAZzpBmk7UdogOpwqCY8JkpHtm9466SrDVKISk
	msuchsgcoHxNgtdtwbpBS+N9wBNISdCn3YvdufMrGGmwpG8yssvGgT0MS4fMpyfhLd+2aPN5rBG
	BrO5rXY5opJ2GHered2j1afB5pRc/xfk=
X-Received: by 2002:a05:6512:3c86:b0:5aa:75c9:d304 with SMTP id
 2adb3069b0e04-5aa87be8296mr8153378e87.31.1781123275724; Wed, 10 Jun 2026
 13:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602042747.277270-1-github.com@herrie.org> <20260602042747.277270-2-github.com@herrie.org>
In-Reply-To: <20260602042747.277270-2-github.com@herrie.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:27:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLmjMrFzSamKynqs_QBVntoXCpgWzwb59_jSU9FCOHQqJA@mail.gmail.com>
X-Gm-Features: AVVi8Cd58dhay5rtIbjO_HVEJCqe06ETUbqcdGMd8VWF9ZDp7hedhRQq79v2Tt0
Message-ID: <CAD++jLmjMrFzSamKynqs_QBVntoXCpgWzwb59_jSU9FCOHQqJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112558-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D3C866CC84

On Tue, Jun 2, 2026 at 6:27=E2=80=AFAM Herman van Hazendonk
<github.com@herrie.org> wrote:

> On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> this clock but the driver never registered an entry for it, so probe
> of any consumer that resolves the binding fails: the CE2 MMIO window
> reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> signals that never arrive.
>
> Add a single clk_branch under CE2_H_CLK pointing at the GCC enable.
> The upstream qce driver requests both "core" and "iface" via
> devm_clk_get_optional_enabled(); on MSM8x60 the vendor MSM8660
> clock-8x60.c maps both consumer-name lookups to the same hardware
> register, so the consumer device tree can reference the single
> CE2_H_CLK phandle twice under both clock-names. The framework returns
> the same struct clk for both clk_get() calls, per-consumer refcounting
> works correctly, and the underlying enable bit stays asserted while
> either consumer holds the clock prepared -- avoiding the refcount
> race two independent clk_branch structs would create against the
> same hardware bit.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

