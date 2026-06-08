Return-Path: <linux-arm-msm+bounces-111665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hee9JY9OJmqHUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:09:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141E652B64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:09:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=jG5by0qH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111665-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111665-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E586E300E26E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DED359A91;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD66351C3B;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895366; cv=none; b=cVL/mkgREc6pZU0RiP94dKkFivKNEeLef2Vp01CAtbxGZysaaeWZNOYb/dt2eILx0Syoyb7zKdcHsmjW2OfMo/p0nvDhynbiSEpwnG0JNEgz5RVGUFcyskCDsAHYqgv5kVVkOniilgW54GxJDxY6W1k2g7WKX+HgwHpG7iiWoHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895366; c=relaxed/simple;
	bh=MHonpYPDMxu6OCmszC5LL+NjrY8r/y0Ipf59wp1R70c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BH9YTRIENY+V79LmYRpMY4xIOZ7p8QFERQZuiJzT9V3WoBn5yuhiMmBMxcoBN+j4RgzJaRdZ6bcK0l5Ln1sVm1ykOPCZcJqe7Dk3Kw2cw7yh3zaeCKwH2fkMCG9CGqAqf/4qJc4+CtQ7/wz6ENuOgySQjjHFBkwnBEXTQbU3pAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG5by0qH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 410ACC4AF0F;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780895366;
	bh=MHonpYPDMxu6OCmszC5LL+NjrY8r/y0Ipf59wp1R70c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jG5by0qHVXXZQ5k3d9mTz3N6zOtAbsqKMGrpyhhSeehg5fNTkeIuk6PnsQa1kGvw2
	 6PxvAjz7WKbFY1Ks91HgZG1/lDJ+u15Zu59k+kB2bI6cVq4iEzcnA7J6NdF5GY0DUr
	 QEkgwGo4XyRNgLp/A0C8+5S8NyRBnZLDn8bzmc5IG8CRLniMk9QUZ5DM+jF8f5OUb0
	 WMo9TGqjGuHhN/DXPaJMuqyQcZOI3ivEENihNZhB+eKiC0fnVZRyI31EnEVjoQWvsH
	 Aw905p73vKFnxPEb1rK8Eb6j8tAHgDmHjOzwylWvzZSfZPG3SW7zO6E230LuZ0sHvU
	 CCrYugV41j7/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2C1CD8CA4;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 08 Jun 2026 09:09:17 +0400
Subject: [PATCH v4 2/4] dt-bindings: net: qca,ar803x: Add clocks for
 IPQ5018 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ipq5018-gephy-clocks-v4-2-fb2ccd56894b@outlook.com>
References: <20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com>
In-Reply-To: <20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com>
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
 George Moussalem <george.moussalem@outlook.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780895363; l=1860;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=9Z6aakN1HhLaGxa1OIpuGJQY0KdKMjoTdfWwUAWMHF8=;
 b=LFiQLhl1FVNGLEM516fSBbYg8lSXLhkWN81pTJCG8OTIG3vU3BNpXECY+Lu3BxKynEH5/ryOX
 ra0oht7UxLMDwb1HAxQD9mBLxbNlt61o7RTYCabPTmcpTChqGFPytqU
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:george.moussalem@outlook.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111665-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:mid,outlook.com:email,outlook.com:replyto,microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com,microchip.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5141E652B64

From: George Moussalem <george.moussalem@outlook.com>

Further testing revealed that the RX and TX clocks of the IPQ5018 PHY
need to be explicitly enabled. As such, add the required clocks to the
schema.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 Documentation/devicetree/bindings/net/qca,ar803x.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 7ae5110e7aa2..53f648c4135f 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -28,6 +28,16 @@ allOf:
         reg:
           const: 7  # This PHY is always at MDIO address 7 in the IPQ5018 SoC
 
+        clocks:
+          items:
+            - description: RX clock
+            - description: TX clock
+
+        clock-names:
+          items:
+            - const: rx
+            - const: tx
+
         resets:
           items:
             - description:
@@ -42,6 +52,11 @@ allOf:
             of this PHY are directly connected to an RJ45 connector.
           type: boolean
 
+      required:
+        - clocks
+        - clock-names
+        - resets
+
 properties:
   compatible:
     enum:
@@ -162,6 +177,7 @@ examples:
         };
     };
   - |
+    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
     #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
 
     mdio {
@@ -172,6 +188,9 @@ examples:
             compatible = "ethernet-phy-id004d.d0c0";
             reg = <7>;
 
+            clocks = <&gcc GCC_GEPHY_RX_CLK>,
+                     <&gcc GCC_GEPHY_TX_CLK>;
+            clock-names = "rx", "tx";
             resets = <&gcc GCC_GEPHY_MISC_ARES>;
         };
     };

-- 
2.53.0



