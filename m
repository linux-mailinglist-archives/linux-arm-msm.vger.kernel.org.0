Return-Path: <linux-arm-msm+bounces-40566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 026CB9E5BC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8BD28B045
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8885722576F;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8oc+62X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C0222582;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417012; cv=none; b=VorPxPM1AHjVYOSgCIpaFxS5hx325U7ePSmrxt/wfq0f+P+aQi+pzzCfK+Omk0G9s3DusemXZMBmG6PKorD3hh1TNaHEO/cl76Y7xNHZzATKEHCYu6HrAWMkG1JNFA0kVPDLrdYkZs3TjwRzHXR7eG6jlIEVLHN/2mXjQ8uzeYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417012; c=relaxed/simple;
	bh=zonr3mCcTyCgwR7d1gZNImuy1doROORC9hQH8Wi0Qyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vAsr1nH545D4NDT4wGqeLy0ET2dEr6NNeOuoD+V3s1FF0ESY6gV0i9PXjNdz6KoWHpkpNXTbJmtdYfWLffXGEuOhPC/fAFsvjLUfGdEaXqk2P7m4xG6VK6WJllYb2suyuwn89niavfAjs/cxW+WhQO7Src4ummOboz+Bn9PPdV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8oc+62X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BECAEC4CEDD;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417011;
	bh=zonr3mCcTyCgwR7d1gZNImuy1doROORC9hQH8Wi0Qyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B8oc+62XcqZXJYDwzLdQHxQmjtDEty3a7JQFOJ0C0Edbj/d2bfrEcBuv5IQ8B1/6I
	 pLuWV4hK5IjYngf+Sd2IALqQRA61xTXnq4x11haER5s/IYRPA9gNRTYIIUaHiM4dtz
	 5SkI0uHnUuGZntafkU+iLJbq/D6OIGtO5dJEjkJRaZLaITLLcihZHaPM2AueAyV+G3
	 hJXBicRsgxNKT0OeD9jG1/A7VDTIQHmm2sbZj/aOf3uqv7zumdvktYJi/GgVoGhBCm
	 p3yib1MMTL5tEqUejwVTHD8aiRMBJrM9zWmlOOihI3fggWpJHkg0K04IHtU9aya57+
	 TjwEGYRFxkl2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7815E7716D;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 05 Dec 2024 17:42:58 +0100
Subject: [PATCH net-next v8 01/15] net: stmmac: Fix CSR divider comment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-upstream_s32cc_gmac-v8-1-ec1d180df815@oss.nxp.com>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=958;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=2KaIHv/oSTo3FOtKPvkHjEF7Z3D3rI5ymtYbTqdzAuo=;
 b=v8pvfQ8UAtPhcdINtdsR/HinWMhi87hDMqA2bUaESoiOXT0yKZSWa3bAQ70f2YH6jc3aLZyRV
 y5PdyrHt1rvBDETp2KAy9KF3HHtfsuJZrbEbJFNcPj5qW7cGAh8YN0U
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The comment in declaration of STMMAC_CSR_250_300M
incorrectly describes the constant as '/* MDC = clk_scr_i/122 */'
but the DWC Ether QOS Handbook version 5.20a says it is
CSR clock/124.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 include/linux/stmmac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index d79ff252cfdc..75cbfb576358 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -33,7 +33,7 @@
 #define	STMMAC_CSR_20_35M	0x2	/* MDC = clk_scr_i/16 */
 #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
 #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
-#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/122 */
+#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */
 
 /* MTL algorithms identifiers */
 #define MTL_TX_ALGORITHM_WRR	0x0

-- 
2.47.0



