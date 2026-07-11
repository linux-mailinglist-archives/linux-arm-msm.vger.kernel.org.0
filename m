Return-Path: <linux-arm-msm+bounces-118526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E1qTJXyfUmqmRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:54:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A84742C54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:54:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F6JrJcbT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118526-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118526-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9A083071E43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E919A3446C4;
	Sat, 11 Jul 2026 19:50:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A533D4E9;
	Sat, 11 Jul 2026 19:50:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799415; cv=none; b=pWqWe9Ban0n4NiIWyuGlmFdpqomUtjISEzV0moxuDiEXyFlrvjH8EJejIIlP4Y8LMJeyzX8uftqtTMeK5MtoHmjYJx0Lw5M1gjtf8SKPjQ1RRRiN5FAxsS9ltg6+OPuLv5PSFVoR/5jc4XwW0/3227/ciK/gqZRmrHrziWpDxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799415; c=relaxed/simple;
	bh=Sq6AEdBGAtLYX1pdUxs4xNIh4SVQYBxeTW2pW0kerR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFBGcEvaYr0N4AE1zbCXjHFO+fIXTYhNhFXzlWv8z9x/UeOujHR4ko318tN/Vxep3JBxDhE60UmTzmo6i0hDcEJ2rU7S/FK+AqY++IPjEa3skmd+9qzZuOzbKVLM9JJr3JE3MKspGN7ceKY/hXcFFcHPmbfi/NhiczKScrt37rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6JrJcbT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8E21F00A3E;
	Sat, 11 Jul 2026 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799414;
	bh=lc8/sIOOnpZf83E7y/fJNO1WHGyzISseZrgZLpK+5Pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F6JrJcbTqxm/EjYBf5E6xUESPaJHe6Z9Ir9IrAASbR0m+3n3FpYfemSo8q2X7+C7b
	 MKTHnDZ9TeLrM9oEYXYWdTqxQc9IB4lx8s/xffGJv8WbG/xeSQPmid5IJrisGlv/5Y
	 gme2WA6D6dYpdyd65IxrH3e5e34CHP6bwwCIWu2+rlPh/AmmxmgPaS7+xLlTqx2cUu
	 0IhKWTKfi+HCk27h3rn2LkhcvVj5zBeTKJa4AeS0uHJsc4EZcZBUXjiKDtO8sDw0JA
	 0N2wjyBfyjm+i6/kxymrIFSEL1vNagPDt1yS/++BJq2wEaBJ9FkqYVwRZEMWkNzDSB
	 oD0/uU2iU66bg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree
Date: Sat, 11 Jul 2026 14:49:52 -0500
Message-ID: <178379938607.163099.16596449114579997016.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
References: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:xerikasxx@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118526-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1A84742C54


On Wed, 10 Jun 2026 14:38:56 +0300, Erikas Bitovtas wrote:
> Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
> Snapdragon 400 (MSM8926) platform.
> 
> Add initial device tree for Sony Xperia M2 with support for:
> - Framebuffer
> - GPIO buttons (Volume Down and Camera)
> - Regulators
> - Internal storage
> - SD card
> - Accelerometer
> - Ambient Light/Proximity sensor
> - NFC
> - pm8226_resin (Volume Up)
> - Vibrator
> - USB/Charger
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree
      commit: 1c436bca83bef0f7ca8d106a878a89af17048270

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

