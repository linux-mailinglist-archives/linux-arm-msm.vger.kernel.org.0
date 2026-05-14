Return-Path: <linux-arm-msm+bounces-107643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAypOajZBWpOcQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:18:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA0542F6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D9C5307A898
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB804426D1C;
	Thu, 14 May 2026 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2rg69dj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA240DFCB;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767766; cv=none; b=p6igyKNLrFDdxkGymRtS55NbEc6Qhi+Ly0ikXoRiINt7pJrrYkZQg2IQG0vO2v82u3UkfI7sYcZuXl6c+GstQ/lxx3dvz0RSDzHZ5cxeaHTH/qYa5ZAVik9S4l29J61wUvcbn9TFGz5wKseGOa4zoJSkLIn8p0FVMp5RbJcxvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767766; c=relaxed/simple;
	bh=hwGFRjkjIVh+vw2wDg9M/94dpLvDuKgHoeS0o9X0fE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5dNBdSmwpUp/7hFdnDRYFAl1Srl/HUMdWns9DwRltlMZObmci/krphZKqmH/hxxUmMAsKsE8frUTInhLYz7qGum6H3SefeIlFX43A18Z9pzl0N/a4zxlpee09A5vauGFfNVelkcGXIEyhGvqK8yy50YIBeISOASfNbTkz7yRSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2rg69dj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFAB3C2BCFD;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767764;
	bh=hwGFRjkjIVh+vw2wDg9M/94dpLvDuKgHoeS0o9X0fE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B2rg69djHdq3a3As46s4ISv+IMbyvyP+bcMKeE27430/8mupYb7BOFGsOus6RJA/U
	 yPzHoS/kzGrvCDqTn7Cm+U6kyM9Ny+N73PgM5EyfJeiI/Vh5+YvuqpHqYK367Q/9V8
	 UnrhqC848CsKwlu1/CmL0cA0L9YWX014p5WtzyFhlrlAUPjgmNSqLWKZSZ+sivMwMn
	 kw9zBpPwlSSf7Qdudc+xKYNm1utQK73b88A1RiO040J48aWG1mFHDDCjvcwsAiPo3V
	 FTlC7nN9cWT7Pi5z8fSdaleddBUyn7PiSdhBdCj4KFkBg/lekZbDEsTJOWps0vMiH2
	 Rus5ZkZo08zNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A625CD4F25;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:31 +0700
Subject: [PATCH v2 02/10] dt-bindings: mfd: syscon: add
 qcom,msm8960-sps-sic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-2-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
In-Reply-To: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=1120;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=mIW20FISbOXB32b/vpmGZrFFpfMx94QhJtXj8cpMSMk=;
 b=o3u8cRL+ezznIe66nnQVYMUu0XTtX5bGsAuJajNpFOsigkOd8P4V/HUvcSR9dUJdNUtXhQTKw
 kxkPW6gqFDZAYxkNsopeZt2L58FU2D/8qY2jqm9U/OtOx58/WerdB0e
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Rspamd-Queue-Id: 46AA0542F6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107643-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:email,smankusors.com:mid,smankusors.com:replyto]
X-Rspamd-Action: no action

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm MSM8960 SoC.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..39a24c3ff9cf 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -106,6 +106,7 @@ select:
           - nxp,s32g3-gpr
           - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
+          - qcom,msm8960-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -219,6 +220,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - qcom,msm8960-sps-sic
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1



