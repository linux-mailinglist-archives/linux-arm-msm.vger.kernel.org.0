Return-Path: <linux-arm-msm+bounces-109440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLsJDxMPEWq0gwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:21:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE35BC8D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DE6D302BBCC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF5433A9F8;
	Sat, 23 May 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hO4I0jG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F6B306749;
	Sat, 23 May 2026 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502816; cv=none; b=TiX/0YQLiMoem4HSU870Hr/DebtiK56gd2fW/RKtTH7FSwlXFjU+r5dabT1d/QM4rxwg42mUwOo8+gphbEI1EMkWIVjp/RNO0saUqrCnqQomZnXCgRCylOTgZW2PGNiGVbSYlTQDMVg1SlpqaP0ApXLvAezX5vU9bhnI4HA8j+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502816; c=relaxed/simple;
	bh=wTjr1pfl8GQZ6l+yByEmUCm3CbPt2Ig5BXyTuHJCyD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aI1e4GdKzNGe28fFvu6Q8kHdpQ9wAiZYXWFTU2Up4JjsP9DkhKqaMXuiZtHOwoOfjpaIdoNGZByCO7skIn2eIPCNcHuXMTE63WScA551EKGSI6E7OILtJileqqAMH8A1ulwdQZJDa4+pNVmBP0DzqWZbeGudlsFJ7FRYx/9fNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hO4I0jG9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FCF1F00A3C;
	Sat, 23 May 2026 02:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502814;
	bh=Gs6/IO0ROncRPx7hA16KULsnqj0mW1VdYmPNz736PZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hO4I0jG9Vv7XB7smC01cFnjhFSdUUu5uqNn/v3gcED7k96H+tmY/ekgNVN00eKhBk
	 biClLiHxi0PrmH5XSp6Hd66+nyGnbI5ejSRbYy0bR68VJ+FEwa/hA49xaWh0c2m2mV
	 aNirkR+4/2RoXiWBweaGr3n9XkDnzLkErfLDaNB8qWA62IWi5mouYMW9T7VSst7aP3
	 7D130dtEUif+g2m7M108myPH+mDyPPfkTxuyTY/SNJBq+a5aM/YHzPJ2EF+bZfTXzM
	 uETWwbyYC7cjo6H6u/fVZ7jc0iXMoJ086lbdrhBgv4MnHQxKUfwhjJMWKaM8MGTbf8
	 ToB3WQwssS8nA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Describe IMEM on Eliza
Date: Fri, 22 May 2026 21:19:44 -0500
Message-ID: <177950280321.1097700.15602009097952910700.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109440-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AAFE35BC8D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 18 Apr 2026 10:39:38 +0000, Alexander Koskovich wrote:
> Add a compatible and describe the IMEM for the Eliza SoC.
> 
> Sort nodes by unit address, this can be applied separate of the other two.
> 
> I kept the IPA modem tables in eliza.dtsi per Konrad's feedback about the IMEM
> containing it regardless of SKU.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: eliza: Sort nodes by unit address
      commit: 853a3ead458c409ffcfd7ff6a33ddc994b9a444d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

