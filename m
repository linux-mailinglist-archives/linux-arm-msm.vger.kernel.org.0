Return-Path: <linux-arm-msm+bounces-117732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QvphCPFpTmrfMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:17:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98556727DCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:17:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XnQ5nA72;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117732-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117732-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E819E3039C7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85A241CB55;
	Wed,  8 Jul 2026 14:57:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC82241CB36;
	Wed,  8 Jul 2026 14:57:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522664; cv=none; b=gI7s1MslmxMiAfmISMtEikf1F7CBpor9SYAc6Lle/HPTmxmHe/viLdi57urzRZtfDGHououV7lRIEif0AM1wEkr3PIKq9gdqeJyg1wWiF3K5jQ5Ygu9WDI1aJRed2RvJ40JxI19N0UXgASeBnPa3UVjOpYl9XnVFH8MjvPzBGzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522664; c=relaxed/simple;
	bh=Xc5D881nwJ4AQuagC9EDbsxAlK/b1RP/EITStWnryhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4W9to51gTJuXxSosvkFbBdWa+6bSSogOolTxokWqpOGrULUL8g0d1+2u+fBgvtfvF8UM3hw6bJTTTAiuaWhCgwVH3uoMbcy0YRodpb6+knScG0eMgHWgj4zeWV2sdEuSWPDyl+HQtEf9Hw1/7+TQpkW+1Vj4MUk4xOeGHBXlp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnQ5nA72; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D001F00A3A;
	Wed,  8 Jul 2026 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522663;
	bh=Gev/DnI1vpZo1LFicsV4F+bc0hm5E+mUcswsZcfRyUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XnQ5nA72Qn+o8imtPr/RclINBcyacBNWnfBfg39AICYE1skZu0/HpdUZNZYrDGFEE
	 NJj9ej0Yml9DCjjZIZSFFi7ii9VSE3JQ29sxxwG2oxulrgJ7TZxxyxwOWiwA50fwJA
	 gHTfoeDODCCbBtdLe+PsQywpb0N4bXDOs6NJ95aH4MvqewyeHoHTeVbU08vDvLe5l7
	 Pttjv/vmfjqGi7gkoCVPm0YnkI1wGhj78WjYOIO/+2F7/n6DtEIbKeMMao1I2dcjlm
	 MjmlpmUR93LCQsIpV106QKCY7hP3eiHH4PSLdlavZlN6mRxmiNmJw+Hwn1qRjUbCw1
	 3zl98KVjKDgjw==
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
Date: Wed,  8 Jul 2026 09:56:44 -0500
Message-ID: <178352261648.2235436.17142424668289030368.b4-ty@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117732-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mail@etehtsea.me,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98556727DCB


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

[1/4] dt-bindings: vendor-prefixes: Add HONOR
      commit: ad469274acb9f44674e8c5890dc155d02403f661
[2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
      commit: c7d79e2e1400102e7921a60669d5e53da5f1e03d
[3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
      commit: 745b08ebe1fcb120c66cfb8fd1a89d93e24828e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

