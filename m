Return-Path: <linux-arm-msm+bounces-117733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /hTFLH5tTmotMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:32:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC9728117
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:32:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EvBOVfdq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117733-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117733-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3BB1319B076
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D15409283;
	Wed,  8 Jul 2026 14:57:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D467641CB51;
	Wed,  8 Jul 2026 14:57:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522666; cv=none; b=Fy9i3i5To5GW4yWaB2e+43dZOH83r+zxRYHtSlt2A76ONKjpWpVdzRchEMF4FeG02SumQXwfMeI3htxDVKdJMBCjbAjsTu0RYpQVf9KC8brp3XvhArtIFiCf2asvfDUmSYzWDzMBRI3k/AFqTs3kn0NC3kdhrWhbaFVJ0gPO+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522666; c=relaxed/simple;
	bh=EbhH+Uz/+5IziXxDDvUpyvdEQvKN/MzeDjRgcTx4OE8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPZR0xlPRvP9hCJJF/038XRcwwMIV0Uf9lVNtV6bsDatascV8todM/31Xepbdaza+0bNT7+njGpHTavxN6Zck19hZhiXQgmIPqzgtVzJH67tYlh+vOaiZHWefrFeGrHggDsWfngTj+t+CABV6Ss3vFVwUFDUiQd1uEMedPbH29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvBOVfdq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DD91F00A3D;
	Wed,  8 Jul 2026 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522664;
	bh=Mrk5N+xGMgJl2efkFQdwxtBddmsSxaLRpPS0k4o/tYs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EvBOVfdq2nXLDa+82zlZVvI9amqVXAN9kMCBDuyUAuDstzcgtQMyaV3EdWm5xkHqu
	 +IIwc6V5YAkgKXEip98VQ0HOwNt2cHqLi0K0imZtFMGlmUvk3jZB8fM5GwOtw3sPTT
	 Xdf100c909kcNxlltN5iRn1iFC36TaqY0Urz8SlKTMeWriaRAwMbxVcz0YfmsfeLZW
	 cd8B6NICti4lghbUowS9PaqxeBumprURawJDCTD2iogqdATtt37LgDw1w1hTBXek6P
	 hT6tZELWhtMK7o6Z9tbJc/KFagJIvdKGfwjVfaFPbAB4xGDr9fG0yivThr4reQZW/Q
	 v2tqWRji29SqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
Date: Wed,  8 Jul 2026 09:56:45 -0500
Message-ID: <178352261610.2235436.12501139853646973897.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602021722.30760-1-mailingradian@gmail.com>
References: <20260602021722.30760-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117733-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43BC9728117


On Mon, 01 Jun 2026 22:17:22 -0400, Richard Acayan wrote:
> Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
> GPIOs. The hunk in the original patch was dropped in the commit because
> it depended on an unapplied patch, which is now commit fe9f4a46895d
> ("arm64: dts: qcom: sdm670-google: add common device tree include").
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
      commit: 71dd62dac8e2d03f952587f8985a859fce422815

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

