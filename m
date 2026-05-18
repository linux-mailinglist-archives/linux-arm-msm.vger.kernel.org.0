Return-Path: <linux-arm-msm+bounces-108156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE7PIBvyCmpv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:03:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1FC56B2FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 061D7307371A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73543EFFB4;
	Mon, 18 May 2026 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpjC0vNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37063ED5B6;
	Mon, 18 May 2026 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100375; cv=none; b=JytD4rxbsYO2sgxo1Z48Ec5xH1O5HOTa29mr6co8L3JF3C/5vti+WRqA2oi2ycX09Hh1iyFaJKOnPKkBgbFsOL2y2uocMtP441PPN9qM8Yxy/ZpddKgs/R9Vb5Qx0eKmayK2gjes8TPUnYH9R47revZociDj+dHIXG8wlugwITY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100375; c=relaxed/simple;
	bh=Bx+uK0De2e8QKsDbMgINkrI+kBC4yYhtPUn60fv3ne0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZb3m1IhjcrWgGIJvaRO4Awbqw5wvauK8fG6iC0BvCkf2XORGRrVNxRb+AIH/FQB34RPP1rc87s0ZlYg/6hciRcVlH7oVNMGebZjhKI6R92hiHMykLBhsJjfcXKntzE8Rj7lMVGi0wDlcvgHOCw5V7ob7s/RmPnPclcnBqa6vrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpjC0vNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DBEC2BCB8;
	Mon, 18 May 2026 10:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100375;
	bh=Bx+uK0De2e8QKsDbMgINkrI+kBC4yYhtPUn60fv3ne0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hpjC0vNGT49oMapbw3QF4sY1siLZmwzxAKWYJZZAbbqd9tK4YVApCi5160gwA51B1
	 rlTXJsCRxTZqS34ni3XF+w8RofJ0tP4GQpyLQ0rPwotL3difYOXs7QPvYTXtnVd7w3
	 0BRjHT5dEzA1kZ+nJ4qqQm/Ru7JLKjGnrHAZHXzaYJbPU/zTwIXJh0n2v5lEo5LSOs
	 OQBq+4tkHTRyEmeBzGDh+/NrnoyjXMgW9y9AKYOxbFrPlQy5aP2M5wonS4KdK/d9GF
	 b0SsLF1MIDtut0K7NdHDmesq/4SjoTptSkoaSj/hyLgzmn9IusmX3091rywq0zv7N4
	 9BQEAd+PX1hvA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 18 May 2026 12:29:48 +0200
Subject: [PATCH 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topic-usb4phy-v1-1-71d827c49dca@oss.qualcomm.com>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
In-Reply-To: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779100365; l=1927;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=pSMLt5sTaDAUG12dp7QckV1kipkrWLzLV1rYLCisTNU=;
 b=RhurK+mAgHAvX0Ecu9GE8VFqhRDtVVBt+tphD/OVy7nmVSYy3fz4Qn/qL6Z2RB/dmk8ubTDtl
 IBDNDYMUm3DDrSzq1NtOmWtfRNYOEzhplY34C1qxGn6oa6s9GNPhVAV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 7E1FC56B2FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108156-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some instances of the QMP combo PHY (called USB43DP) feature a third
functional sub-block, responsible for USB4/Thunderbolt 3 communication.

Compared to the today's state of the binding, one more clock (P2RR2P -
PHY-to-Router, Router-to-PHY) needs to be enabled for the PHY to be
able to switch to USB4 mode. Allow that for X1E.

Also, add a bindings define to let consumers access it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 ++-
 include/dt-bindings/phy/phy-qcom-qmp.h                                 | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..eba4bee474fb 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -52,7 +52,7 @@ properties:
       - const: ref
       - const: com_aux
       - const: usb3_pipe
-      - const: cfg_ahb
+      - enum: [ p2rr2p_pipe, cfg_ahb ]
 
   power-domains:
     maxItems: 1
@@ -186,6 +186,7 @@ allOf:
           enum:
             - qcom,sc7180-qmp-usb3-dp-phy
             - qcom,sdm845-qmp-usb3-dp-phy
+            - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
index 6b43ea9e0051..1c3ce0c02b0c 100644
--- a/include/dt-bindings/phy/phy-qcom-qmp.h
+++ b/include/dt-bindings/phy/phy-qcom-qmp.h
@@ -16,6 +16,7 @@
 /* QMP USB4-USB3-DP PHYs */
 #define QMP_USB43DP_USB3_PHY		0
 #define QMP_USB43DP_DP_PHY		1
+#define QMP_USB43DP_USB4_PHY		2
 
 /* QMP PCIE PHYs */
 #define QMP_PCIE_PIPE_CLK		0

-- 
2.54.0


