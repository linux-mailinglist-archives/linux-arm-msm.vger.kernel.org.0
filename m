Return-Path: <linux-arm-msm+bounces-118606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hrizDNQkVGoLiwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:35:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A27463E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:35:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IP2JFGcH;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118606-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118606-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6E7F300CE55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA9437A856;
	Sun, 12 Jul 2026 23:35:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C401A6806;
	Sun, 12 Jul 2026 23:35:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783899344; cv=none; b=OfU/2cI3XVD5CPuAi1Z5a66aCNHlipPyv6a/rV5NHbkaSKHn11RPe8e0Do1IPAk0LEAwiQ9nFXOOiP7qcCfZLgXMT6+A3oLydj0PuQRRJKtFbxS1tgUQ0Oaa7uNpMWk8S0r91UGB4/GabxuBrsRkGGy8A9nEHdiQBrmyu6ljlrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783899344; c=relaxed/simple;
	bh=cVNbrT4DiZgPuENaNtsaO8FkHokq+L9DX7daSloVt+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j23fme5HLVSaWYqLwTjv0zdl7wwTw/xd5sO1pq9dH6XwhH2UgRYD7KVJH2quuCZ55vnQaCWan4NpEqExobeP9eIeTjI+LehL9AXPRQ+euaBiMLYq8nTPe+SK78XfNHxt4P7ETZS9vhw5QgJRuGrdFk2so34S9nnanBTiLFee5dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IP2JFGcH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354A11F000E9;
	Sun, 12 Jul 2026 23:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783899343;
	bh=Kztp/pK0ZeXMTwVMng3BJPkLjmG5qsM2tXuuwHmx3Zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IP2JFGcHBU9QkzjPR8p4m8aBvmgLzSPE6ElwZTZPYxw4009EczTAh+7wpiIpjsfsq
	 fuV/daSBMhiepb2NoARP6t4ofY40nxlZqcRav16PsstJ+POtr1SETLmOnZkn85VdYw
	 cpOJwZUAlshXarc1LJG/H0r3mNT/aXPFHGCJ4ag1lL80XtuRQTQYVI2bxqD3ufk7mm
	 PwfypHh0b6vex20LlNXmlme5IVl5tM1gr7BcSR07bs6qTjYNEJYGui7n+qBK4A8Peo
	 Xjs1VOzweUShpyT583GjU7w2R8XASsNYgd7Dylv0TCQhqLQ6AbLWMAPJS096YioggB
	 7bm0HkB+4xpGg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kaanapali: Add SoCCP
Date: Sun, 12 Jul 2026 18:35:39 -0500
Message-ID: <178389933575.327930.11442336206634868553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
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
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jingyi.wang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-118606-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F0A27463E3


On Thu, 09 Jul 2026 01:14:22 -0700, Jingyi Wang wrote:
> Add device tree support for SoCCP on Kaanapali platform. The SoC Control
> Processor (SoCCP) is small RISC-V MCU that controls USB Type-C, battery
> charging and various other functions on Qualcomm SoCs. On Kaanapali,
> SoCCP is brought up by bootloader by default.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali SoC
      commit: 8e1d8b4102b536f0b0e0c0c2f3dc390c5887c2a1
[2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
      commit: 71f17efc405a5edf882b1aeb760cc777f1599af4
[3/3] arm64: dts: qcom: kaanapali-mtp: Add SoCCP node
      commit: 1c553b3d0cfca9cac2186daea6e2f81808ce7d8b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

