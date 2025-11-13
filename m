Return-Path: <linux-arm-msm+bounces-81541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A997CC56345
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60BE34E6C8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 08:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A8D33374A;
	Thu, 13 Nov 2025 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0DumcjlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0CB333422;
	Thu, 13 Nov 2025 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021683; cv=none; b=UP6wBrUex9bA1o4jUEqjTfwNCvJE1boeC2z9jBq8YoadA4CeR5Ikw/D21vJcO7POxgoAitxChfooBfZyhoPjb1FQSIGuiCMZJkSyRja794MLQd0MP0LSVKaqxxIX21NDg0UHeC6d6HFzUQUA+B8DqsJJmErIHk159bzY5s0VdCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021683; c=relaxed/simple;
	bh=K60pjcKmcrdK2kxwsxsiz+J4c392hY4P1Lo59f0EnI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leYKiL3NugwhWinhtB/Nt8LM7Epxpj6ddlhaF4mBkIzk2vdEhoIEh+r6p38sFBe/p+eKHUijLsZH2FsV2Jo4CYld6Ti4DkOhcON8ZVmrIdn3CCZjsEMwUwg1C9bpb7L2m+eeTY0XRcjY4sqZa7MZAre8+3KoDz96IUqJ6bdLFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0DumcjlN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24FC74E4167F;
	Thu, 13 Nov 2025 08:14:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE6206068C;
	Thu, 13 Nov 2025 08:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D165102F22B1;
	Thu, 13 Nov 2025 09:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763021678; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=w6hA9H0HHthzZPB4kPUV/IKUN+tVwNwNJT82uj/ljvo=;
	b=0DumcjlNK0kzg1Mq8IdrS7EXXoehhZkNBzCL90dPAiU+ojn/qPvOA8KKvoLtjeSLGGDkpu
	zaMfZK9sk62SD64ZwG+pn2eWo8M8aA1NuXf/tyepPRGWTnYM97qxLfEXHuX7wB7kkmvDhJ
	kQ5bjtvdSMoUXv/ESuevYUr95japedwYWHXU0MHg/oG2DjGiwOS1mqSt4hAE9tggDBNi8m
	hpuwlK2/YGO1wLFnbBfselGU9PLs6YAwaGInjksn0nlzv9UooGD+hqu1IV2QJxh0qN1cTK
	FGYRKu9sVnHUKvewu4WQ9TMB6AP1xbqQJUkyNbUrSkAi/9wJGkQoJpn2y9HP8Q==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v16 05/15] dt-bindings: net: dp83822: Deprecate ti,fiber-mode
Date: Thu, 13 Nov 2025 09:14:07 +0100
Message-ID: <20251113081418.180557-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The newly added ethernet-connector binding allows describing an Ethernet
connector with greater precision, and in a more generic manner, than
ti,fiber-mode. Deprecate this property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/devicetree/bindings/net/ti,dp83822.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
index 28a0bddb9af9..23c70d863c39 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
@@ -47,6 +47,9 @@ properties:
        is disabled.
        In fiber mode, auto-negotiation is disabled and the PHY can only work in
        100base-fx (full and half duplex) modes.
+       This property is deprecated, for details please refer to
+       Documentation/devicetree/bindings/net/ethernet-connector.yaml
+    deprecated: true
 
   rx-internal-delay-ps:
     description: |
@@ -141,7 +144,11 @@ examples:
         tx-internal-delay-ps = <1>;
         ti,gpio2-clk-out = "xi";
         mac-termination-ohms = <43>;
+        mdi {
+          connector-0 {
+            media = "BaseF";
+          };
+        };
       };
     };
-
 ...
-- 
2.49.0


