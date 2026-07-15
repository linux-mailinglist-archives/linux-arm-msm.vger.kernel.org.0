Return-Path: <linux-arm-msm+bounces-119155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RP5aFlcrV2owGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:40:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B175C75B22F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:40:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=XuBLs7o4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119155-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119155-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73761305EA4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DF531A56C;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C85225413;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097547; cv=none; b=JQX5QWdWCMVo4KUNjhdzFXF6MkIUt3F1HqPYePN0XbF/c6chgplXj8eO9TtzgC2kVLazwizUEEUuG3QS1FKMCB5bFkN8MKc37kVycZGBFjYq88dc1f6MLZz+t+R7kbgFeFwjwnzYuM1ndhn/7vxQkcQQBPdL3Ifxk9wBlOWTNfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097547; c=relaxed/simple;
	bh=ZliAQFFvr5pZ/nRwHOArDixoFaosYB2/I8lhndxTcO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eM2wHBKQLxIVAqDX+i4KHDGIMoTnAmFPolpUdIvoLLIS2fa3/1/59Sf6LQandvl0Dnz6P945AmvLiatFb9S26fDqNxQglPxe6wHPUj3iFcicGOB6IUkkmW+D8AH20pe1Ng84Z6rVtplP3RETgSWqHvaCAK7sx8XjyNuxECumxNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuBLs7o4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D8E9C2BCF7;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784097547;
	bh=ZliAQFFvr5pZ/nRwHOArDixoFaosYB2/I8lhndxTcO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XuBLs7o4CL23nn1O1knTTwUrQNedp41ImJhFYeBSKYo/MEj6MsKAWpTvTU12dQeGg
	 ES1hcJ/9f6DYy7AAaIhoFqXzbVbz3Of885UsjDgHDAYN/JOE7bQ7kzvj8oT4s0uLBY
	 masHnbdCe4kdb6MLWq5gRrTuVG0ySp7iCeVFZ0qoh9RVZqn4rTakqNA7+LrS1yuEWL
	 jtZO7o8N+yyUu9XeaeB09pma+fc7z/62Fzxd+epeFup9+PdjaXCfKZJe4kBjjlxv/E
	 g5YOLLszlKs9I0v6GPgfmvxTBvGeq8tDG5jtKtJ1897Qyt3QPQ0hsRV+T6vP4F4j2Q
	 zFJ655PtTpgvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ABEC4450C;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 15 Jul 2026 02:37:47 -0400
Subject: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
In-Reply-To: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784097545; l=762;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=XC8XSPTDRd/J/fHeOOhg0qB32EBC0liAXwtSxQB2wb4=;
 b=IE/Rciw/Vjeo3WceGDwW4nbymkrPBOEhmNgrYZr9XbTFxU6yq6Y9SNl3eBTGc0eDDuJvU0qWQ
 KS3JCMULfmeDow5fGhP4pF8stWe0EwJowvrk8CjQRXAJXVyeQx61EVz
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119155-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:mid,proton.me:email,proton.me:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B175C75B22F

From: Esteban Urrutia <esteuwu@proton.me>

Some SoCs such as SM8475 write data to registers using this offset,
specifically SW_CTRL2 and MX_CTRL2.
Add pcs_lane1 offset to V5 offsets to support this.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..3618812e84d5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3554,6 +3554,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5 = {
 	.pcs_misc	= 0x0600,
 	.tx		= 0x0e00,
 	.rx		= 0x1000,
+	.pcs_lane1	= 0x1400,
 	.tx2		= 0x1600,
 	.rx2		= 0x1800,
 };

-- 
2.55.0



