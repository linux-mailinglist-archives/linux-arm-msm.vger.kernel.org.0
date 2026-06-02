Return-Path: <linux-arm-msm+bounces-110718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIzMMv99HmrnjgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:53:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF362934E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F37A304F21F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14153A8741;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByfxNs6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96523A05C2;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383047; cv=none; b=Fkkn+6pwthRSG1nwsga2ptG5lQzdLUoOZGZM2mC6UBL9DtWjpnmgaE+U7bCzmPe1vk2E7MFfLmfX9/HysLO4eGgqZV+pr5Jlczik9nAaqvJzPUpuyUWg5I5hJObmescurzYlIgYXGZQQNBuioFdb3kLneGA87o0jXQVn/dIFbeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383047; c=relaxed/simple;
	bh=kIefg/1GFOBugtxjwANZjrxgWJw8zIE16yRu6PaEZ6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQNiK6FobdAXump1YCaefEVUnYdbAXM0APvdD3z980CxB+LJiywJhQ5DPIZz4nkeRVXgIiQaBheBkuj6MnJ7kSiDp1gsXeM7gG75vxKpyOARSYuO3ZxSs6eNMEaUkVFuMblRHqn/XW8laoHaYETB1EjoSNx9WwMpceDGEY0RRjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByfxNs6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 688E6C2BCF6;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780383047;
	bh=kIefg/1GFOBugtxjwANZjrxgWJw8zIE16yRu6PaEZ6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ByfxNs6zvTKxwN2P1uUJZf/V2cfF0O3x5Gb4TWJU33UHKp5GlOMsFgUWR0g4cGAb8
	 WmrMAzHwFZ9YPdPYIY8OkTvtOstxvbHx7KU5sq/eJ6wrNOXUlCgKH7abbAWG+0dQfw
	 8yOBOLWoUVA/Il01Qh0/9NJoFXWBGU300mpL5MH/70Mpj2LAedyj2jBI3M8eqQs+ME
	 CNGhupECmWGlXxwj7bMtCfg/a0/R+wgsQfTKXULxkTpVOsbz7GxeQii43eW/hvAfAL
	 guaiHbY4DJ4ydJf+P6sUT5mhAjGMtZwQQrZYLr3pTf3yeud/+iUhInPBUk50ZXa4M6
	 4hj0KBgVG5/Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3CBCD6E4A;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 02 Jun 2026 10:50:38 +0400
Subject: [PATCH v2 2/4] dt-bindings: net: qca,ar803x: Add clocks property
 for IPQ5018 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq5018-gephy-clocks-v2-2-65a1f1d881f3@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780383045; l=1550;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=rp75ghzSXcjDqIvT5opgDmpxqQkfyYFvfhT3Z1yNuHo=;
 b=Usttx2e8YKj6zXboagFAnbpDINjy3YqTzY2if/dIYtg3G4sMensrQbZYOGUT1lOykjyPhygM5
 NY8rA1NJG3sDWI7ObRa3WovAWDWe/MKbUPmlyx/iCNx/zG72OMrrrd5
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110718-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
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
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email]
X-Rspamd-Queue-Id: 3EFF362934E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: George Moussalem <george.moussalem@outlook.com>

Further testing revealed that the RX and TX clocks of the IPQ5018 PHY
need to be explicitly enabled. As such, add the clocks property to the
schema.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 Documentation/devicetree/bindings/net/qca,ar803x.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 7ae5110e7aa2..07615640b0ed 100644
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
@@ -162,6 +172,7 @@ examples:
         };
     };
   - |
+    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
     #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
 
     mdio {
@@ -172,6 +183,9 @@ examples:
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



