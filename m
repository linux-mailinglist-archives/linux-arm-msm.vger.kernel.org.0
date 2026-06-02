Return-Path: <linux-arm-msm+bounces-110717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LY9LPx9HmrnjgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:53:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C366629346
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9CC6304D7D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8193A8736;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdUFOIL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95342571DA;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383047; cv=none; b=iGa+ZyXavPpar8VqjPRnUX3gQPA6Wfh7rf0fzgOY2l9p4Q4BWUlP6Ew/2H8IdQlCGpbHqT7dX3g2RrgEhk/qu+6M/zO87TI7xXQEmhzotbIw4lPiRASkXTTb+bAY381i/HC7wu7dveXKt7iCobW+lCH1IagUD5hm4ZEt0PFCEj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383047; c=relaxed/simple;
	bh=SORcje6nNo4hyz3sdF5oThJ2NF9xcrhVqrTOFos5NAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j11fOvuLGqRiDA5mhqw91tZywtoOsPyKuszXzWeUSMQuBfHKGWm9lFNlj95uD08Er7rPXe27WheqO7j+jipmiCQoZaHi23rSKL80hKZCWVSEKajPDPepGi/uhqHLJwLscldHN2lMeoIqLdu0xKD5hfmsz+WoE8MuWGlIn9ZFEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdUFOIL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C034C2BCF4;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780383047;
	bh=SORcje6nNo4hyz3sdF5oThJ2NF9xcrhVqrTOFos5NAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HdUFOIL/FCQWoKf1wiNtcHuCir/ZLNMjVfRwi5+9745zwzM+FyrGZ6XcgMVeXYUMW
	 NyZW3FwWgNejXGnN+6gUzbsz2q4VOgEbFngtvysf/FhtxOtwJjFwmHJT1jOkBTUnFy
	 8fDI7IcD7q7eqVMSgmh6Ul+ktN2ptEf4Lzxs2kjimJUaYirMxHxJfm2isF8enKaA/4
	 etdqZJP0kQY1XPre2XjGqpiDCa6wHmHDxlB7agGKo1ulIYPmWsMYi5Vxzavj7wF2EF
	 D79hINRfQNIVAYRJDfoofG10o4gLSwUpV8ycqjJUEScV9r/+9DHV8kEjEvBH/Mz0FN
	 swMU8jaA+rGjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484CDC5DF71;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 02 Jun 2026 10:50:37 +0400
Subject: [PATCH v2 1/4] dt-bindings: net: ethernet-phy: move clocks
 property to invidivual PHY bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq5018-gephy-clocks-v2-1-65a1f1d881f3@outlook.com>
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780383045; l=2564;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=JF+9D9ibIujy3R8OCamEf63tGtDhuH5LrP1BT4APw7g=;
 b=qmYr1njuSRFfbA8TCMCe9/wzVxkvnZ1e2EEziVPHMEjgm/0ygSsOwXmDxgPIyLpZtgeytdr6a
 szM4/13e3aHAdGZmNX96G2RXH4GxbYkH1Yme64KJh+r6Ip29QK6vCIs
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110717-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email]
X-Rspamd-Queue-Id: 1C366629346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: George Moussalem <george.moussalem@outlook.com>

Move the clock property and restriction from the ethernet-phy.yaml file
to the individual PHY binding files. This allows each PHY to manage its
own clock requirements.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Commit 350b7a258f20 introduced the clocks property with a restriction to
maximum 1 to the main ethernet-phy.yaml binding for Realtek to add an
optional external clock source. This is restrictive to all PHY bindings,
as some PHYs may require more than 1 clock such as the IPQ5018 PHY which
requires 2 clocks (for RX and TX).

There are three other PHY drivers that require clock management:
- Micrel: requires 1 optional clock and the micrel.yaml file already
accomodates for the clock property.
- SMSC: requires an optional clock and the legacy bindings file
(smsc-lan87xx.txt) already accomodates for the clock property.
- BCM7xxx: requires an optional clock. I could not find a bindings file
for this PHY family.
---
 Documentation/devicetree/bindings/net/ethernet-phy.yaml    | 6 ------
 Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index 21a1a63506f0..709ea976ef79 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -105,12 +105,6 @@ properties:
       1BR-10 names. The PHY must be configured to operate in BroadR-Reach mode
       by software.
 
-  clocks:
-    maxItems: 1
-    description:
-      External clock connected to the PHY. If not specified it is assumed
-      that the PHY uses a fixed crystal or an internal oscillator.
-
   enet-phy-lane-swap:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
diff --git a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
index 45033c31a2d5..8a26f6941dc4 100644
--- a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
+++ b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
@@ -38,6 +38,12 @@ properties:
       - ethernet-phy-id001c.cad0
       - ethernet-phy-id001c.cb00
 
+  clocks:
+    maxItems: 1
+    description:
+      External clock connected to the PHY. If not specified it is assumed
+      that the PHY uses a fixed crystal or an internal oscillator.
+
   leds: true
 
   realtek,aldps-enable:

-- 
2.53.0



