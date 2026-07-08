Return-Path: <linux-arm-msm+bounces-117702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XAYSFnFoTmp/MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:10:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB4727CA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:10:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lTdnqPoR;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117702-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117702-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E77EB3179334
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1F04C6F08;
	Wed,  8 Jul 2026 14:57:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4F449EB8;
	Wed,  8 Jul 2026 14:57:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522634; cv=none; b=Gp4rNYplVpadXSrD4q+kG0alwhgcEZzpbgGjheGWOFmE2Z3MsGRfYHlQyv8se1JhELGr40r3rbberbvY1zwxc7QrzWlszmDHMOvHc/cIDyFs2ByS2c8kCJOsCbCDnEnjEfPQbZvVbWjqvUbHITWWOslTFc4kGvWM4dUFiPGWIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522634; c=relaxed/simple;
	bh=pIGSnfnIYwLJBEI78MzuESZyh91XSirlEed4svHdw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMDcLoHDDSKHxoUegzkwNfYy/Rbb+e68EnEHMJcbxJC5CzRcYJVVZjrljffRJIonXA5KngeRtxMTqRCTawpHlx6YFjMhgfbmHnDMAvI2Lr2N7WfpJciqePsP6LfjejlmtG1NdFBuz1yiTeOR30cBFurTxTa4KRc2jwrv7CYnaXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTdnqPoR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B824E1F000E9;
	Wed,  8 Jul 2026 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522633;
	bh=4uQ508Bd0bc7mLaC8m4/5Bx9glijirQQhS/Y3+JS85M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lTdnqPoRR2/WAo6YbJXwb3q9OuIrrTONc1Euw681gfZgUVeOEHhDfWn4bD2QMO2qn
	 gueOmOS40Em6j28bhSYYjitFMaAZ1ww5NPg6RKqh3PBYwx2VNsJIMpdW3NVbh9XGnM
	 MLxbGd8QUcu67uuQDdwsLmkQ2ZulJ5J2fWLN2tKyCz4GDAe5/7hrkZWTXsNdm3uEhu
	 0ucloBjzgGuKiPcePpzD7OeXX57ljiE9tL9KE4zCbHE//U8dsF5i72V3VxB51ezt7t
	 GFOuWRQWQRuBFHptqVgUSy/3NJvW+ePZpOkWY/jJCeJ+nFa/P+qmCPb1IypNj2V3w6
	 BJgyDdG/M7pLQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wales <daviewales@disroot.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Add initial device tree for Motorola Moto G (2014)
Date: Wed,  8 Jul 2026 09:56:14 -0500
Message-ID: <178352261576.2235436.17200055989994996286.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605-device-motorola-titan-mainline-v4-0-08a7be31f05c@disroot.org>
References: <20260605-device-motorola-titan-mainline-v4-0-08a7be31f05c@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117702-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daviewales@disroot.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70EB4727CA2


On Fri, 05 Jun 2026 23:19:10 +1000, David Wales wrote:
> The Motorola Moto G (2014) is the second device in the Moto G series,
> with codename motorola-titan.
> 
> This series documents the motorola-titan, and adds an initial device
> tree.
> 
> These patches have been previously discussed and merged into the
> downstream msm8226-mainline fork:
> https://github.com/msm8226-mainline/linux/pull/18
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
      commit: 28236bb8f50216fe98f895b31d593e8d8ddb8a27

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

