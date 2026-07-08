Return-Path: <linux-arm-msm+bounces-117695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2vnSKkJsTmq+MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF14727FF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EmHlQqrL;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8A113138622
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA31044213A;
	Wed,  8 Jul 2026 14:57:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C8A221546;
	Wed,  8 Jul 2026 14:57:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522627; cv=none; b=r/a4vpZE7hncLGL+F8QjF9xVZdXsFg6jdNdfa5xyBc8jeuLRxovNAlTo/oui+DMN8kuGYzoOvolbwIC6aELdhk90nnz0cQkGNeEbpyHDna8vZcLAQxhQwDAsUBXvYMNI9F1cLesu9fKHpMFRdbUVHIazt0u7WBh39WWkBly84Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522627; c=relaxed/simple;
	bh=0/7Q7SOjOk1yCm8B4V/39JNT4+CBY/KVs2dhMdQKYE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UgCCz8AMzsvCknu6xCPl7wvtuKk014JUlKySd7BwS23umnqimATrgxBFGVqIIunYpnVocb9a8SsyE2hLogQVZLgb8oS5dtEg5DLhGyXcss5Op3yKSXXL82AUay4JSuAEXntdG4xym2vpF2Tn/ZSAZOc3o1Nky8AFToKnLKfOfoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmHlQqrL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A75F1F00A3E;
	Wed,  8 Jul 2026 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522626;
	bh=vOQKOnUlRi0Eys4keRgSEN2E6xi3jFOKzwm76WTc0wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EmHlQqrLwt2KvkUXi7r3CT8Qx6rBhdDLEO9ZVHMR9HafhodXYA4q4HgxhrQMvMbft
	 LerVB7BvQGqua4CnECOaGTDbPMg0+d+HnXMjDg5ikHf5Br4+MHEstMN+biqTZ9IHWV
	 gASizcG7kAmeh7bcA6BjJwTDd3LH7SPSKbOfD2PmivzK9E3d6tuESHgs1ST6k9lCGy
	 dK8b1DfOMhCVmTScOTiEsnFgckz6NU7giTWrwRLEz8vcrle423kpMcetcGgERJLYMt
	 6tca1JcxgKnyY/FCAaZMUl6tbwnQdFLRNECP2TQQkpQoMsRNy5Ce+a9NyQnr5DuiJC
	 qzH7QgKg0o6Nw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Wed,  8 Jul 2026 09:56:07 -0500
Message-ID: <178352261646.2235436.17862089371659762535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
References: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-117695-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 3EF14727FF6


On Tue, 30 Jun 2026 10:22:39 +0300, Abel Vesa wrote:
> The Eliza EVK platform is built from a reusable base board and an
> Eliza System-on-Module. The base board provides connectors for external
> peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
> eMMC.
> 
> Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
> CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
> firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
> Eliza CQS EVK DTS that combines both pieces. It also documents both the
> CQS SoM and EVK compatibles.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      commit: c1186318ea9f991ca48f9cc46a260ee62f4890ab
[2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
      commit: c20a13bdd4e57b54ef5a87ee3ef15277474891cb
[3/3] arm64: dts: qcom: Add Eliza CQS EVK board
      commit: 5e63ddfe1dd284a68aedc273f0342236944e62e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

