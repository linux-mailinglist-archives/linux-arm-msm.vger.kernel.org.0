Return-Path: <linux-arm-msm+bounces-38342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 459DE9D28F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33D01F23182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230241D14EA;
	Tue, 19 Nov 2024 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/68oNb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F1F1D0E23;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028465; cv=none; b=HFhVQQEZxLJtlzS+BitWu1tzFjoKKpKWLUX2QnF7Q8OS/M/OawO8f6CjdEgmJ/prXFE3EghPSZdeGuliz0qkuvjn+QcK1nc8Gs9sQrOMPL36r5fWiGGxobUcKPLIc/t55OUA+BbR5y5ns4gTx6CMasQIFcyM/i0VMZL2kf/coeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028465; c=relaxed/simple;
	bh=Jr5TibAxKlW6LPtn2UpIAws+Jljaxx/IUAbIela8acc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDJsgaIR5LfPok8L0hvU90gn9Pn/xfUcX1t52zR30l+lAD1XRCF1AbIi3KeQiPByJtIrGtH3mkvZJp0hm/SpOI+CZXnJJ+64RvovMzW5wFAl3RwPGqW+t9OcNVxQylF7dMMSL7gtqgYFkCn7SamoFggI5bZ9aYS7jRu4k8RYHRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/68oNb7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FB55C4CEF9;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028465;
	bh=Jr5TibAxKlW6LPtn2UpIAws+Jljaxx/IUAbIela8acc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u/68oNb7CkfZKhPlsIU9LN0uIefJVa3Rem3KlFpTm4daxg27ET7sDvfths89ghFmH
	 6vRrhosKyqz411NyZ/PRV0DOOD/bGD2LPTzHDfys+DXN79as9MC2/6HsnN9DCo5gin
	 gTwC81LNAKGlESVBN49n9vWaaeodJ5T5NhFpYlprr13ZW62l960G2f8NXeyi1xss4a
	 nqmFCOloDhqOuV1rUrhrpDHhfqwGXwAK8NcM9xIo53QEm/HduKBjsWUFCzcLdYs+gt
	 qj3UfE0gks/mFpjAluiyUQoL2BLxhuEplo+O8L2kJo48vr1V/ZAqGhcqX/k9euCqHu
	 BWKZM0DvKWPiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56486D44162;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:21 +0100
Subject: [PATCH v5 15/16] MAINTAINERS: Add Jan Petrous as the NXP S32G/R
 DWMAC driver maintainer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-15-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=915;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=pHfq2w2j/SBgXCktQF2QqXPe5W6F70KOUcF5p5w2GsQ=;
 b=kg29ciDxOYgCtpwUA3BwC8OyW9MWH36GrRkyP2aoXLaiP8YzLpujxXXK+dVU1O7XUH5tRKMmO
 50nCIVDiH+9CkW1LffGBetnJYKNNZxBRWJIyA9rTWuO9O0z8R/ZHoE1
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Add myself as NXP S32G/R DWMAC Ethernet driver maintainer.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82161bc70b51..c65d8f904871 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2791,6 +2791,13 @@ S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 
+ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.47.0



