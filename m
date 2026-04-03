Return-Path: <linux-arm-msm+bounces-101653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLivILPHz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:59:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5EF394CE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24A653033EEA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7CE39C658;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i81/UDh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C243290AD;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224734; cv=none; b=Sw46Wbc6sKf4Y0KBh+tk//5JahigWcoLBsIJ8Eptec7YByEQtELWTeNTLqbl5V6g3LxzVIap0WDY/kHDCyj3GCCXA8bpbevPqsnGUzQV3HWDPkV+Q124wlurHSA6kKqTkHOK/iu9VBdTHgcvhcb6+IZOSL22rkhiT7/CjjZBpTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224734; c=relaxed/simple;
	bh=s+dU1/g0RifyG4LIuYKHQ+oCFbdwqSv3LSZS2ks+Cb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dp5uXA73sHbdnfn1SEvMHkUnxa3aJF95okTlEYfnWVp/AQqeptGE764YcWWsJToSFiG38sb6YyoPKdn/0hCwsmSJ6pRlw+105O/ps3RdVpO6+TXmihXDQsE+fJWnvXINyxuiLngmCrIjE7ascWA0kyK7pJbMHd15rVp+QfBy6Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i81/UDh8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF887C19423;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224733;
	bh=s+dU1/g0RifyG4LIuYKHQ+oCFbdwqSv3LSZS2ks+Cb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i81/UDh8mQTWjgDyfogKB3F32uFPxuSqMRDQ18i1Moy9FAVJIg+9sVaKSjI8t1Dtj
	 OD7zSDxTQ5mj7ard7mdDt8+klAghQaWHZUPmgJhuBp9zrl0FLIFvLPgYVR8l6CZYB3
	 Y+XbOKCxV136HNhu/Ho/fl1XvybVXHq/PIpx0fsj9YPGN7VH26k7yIwXK+m1kTb8a3
	 s4C9g+AyMovsJ7OVzaESNrfoRAFG/acTI+jAOlznGp4kj5ngR0BmEiQoPozGFxp8z0
	 bR8ntFEWxXqRgEZkHqbzXsN40S7Rg/SUKOHg7SM4WE59IgnTR12ByHfM1yPabr7Lmo
	 /o+nyREP6eyxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC36EE8536F;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 15:58:46 +0200
Subject: [PATCH v3 1/5] dt-bindings: nfc: nxp,nci: Document PN557
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-oneplus-nfc-v3-1-fbdce57d63c1@ixit.cz>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
In-Reply-To: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Martinz <amartinz@shift.eco>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XAr0YPSe88hbZiI1E3SbtdYUk0kg/OIc+A90H6b4IMY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz8ebxDmaJwjzyRUTYj1d8k6YnudHVAbaS8Z0z
 WZS8g3mTjuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/HmwAKCRBgAj/E00kg
 ctP8D/4tH7JBKTPHlQxYPJDFWKPPaCb8sX95ulLhQltIx4eKz3/rdyOWz0DVGxLHyOCCxXY+yh1
 vzOjvHlM1+uUlUT9fKALTgVHIdK/ekiYEWh9mvzTGp2+XYyC7nYZgu2872UpcAy+K2+4bErVOx1
 vnlPUbSMj6EdN2g65b9zQhWzRdqwZ7b3coCjU0mtV2h4ZcFCPSfxIvGnS9B7C0NwG7D6/RW9Ut2
 AQZoHQL0gu7+MWSV1yKGqtPsH2kqmcLEefupzPJLXArS88YX7uDL4Nev1ce3ypTeOXoEibVSTII
 QzQo+FMLr++ILDXmsHhdjN+Fr+Zke5f/5S+Y600rSwJRr6AV08BKSYl9KY43HU3/56xBpd8/Mav
 Z6wkL0vn1o/orT6cZ/Vqzc0Q6TWsbsLjZ/pdG7kMrgqbF2K8VBpc5OTACiWDYCu//khwO7wY1Db
 o38e2ilcAT8DfwBsuOLPvpfIZ7gxTrYLimWc0kA/ovvliXQ6qr2sEdI9CrPEJeLQh28vcbovgaI
 3XtUwbjF2FG9yL304R39Xj7ALJMBvegnY2xHZxOhKgHpA+wLIL0YpnFn/IpLpmIj2jm5Im0D44p
 BXy6Z2nBYxDge68OwsDc5MHwLJRJID7+wvxCiuPEsWOyb6KiTUVoOKZ10cTXO3aim+fnaANu56i
 yuA0YIIcTPCechA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101653-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 6D5EF394CE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

The PN557 uses the same hardware as the PN553 but ships with
firmware compliant with NCI 2.0.

Document PN557 as a compatible device.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
index 364b361511808..4f3847f64983b 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
@@ -18,6 +18,7 @@ properties:
               - nxp,nq310
               - nxp,pn547
               - nxp,pn553
+              - nxp,pn557
           - const: nxp,nxp-nci-i2c
 
   enable-gpios:

-- 
2.53.0



