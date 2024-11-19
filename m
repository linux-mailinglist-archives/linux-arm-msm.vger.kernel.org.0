Return-Path: <linux-arm-msm+bounces-38343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3459D28FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0EF728168A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616F11D1721;
	Tue, 19 Nov 2024 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKGrz6wi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A11D0E24;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028465; cv=none; b=mewPxSQGKgCZwDClJXbbgmnZIpXBxKc+WlOn1/nPzai9KyUvQIe+If0zuVFlsd6VyeKYKZvkarrLPhDJrbjgDm4l+k6FTJ4l5M1dRN7yO5i6NITzkFHMNl0ZeV2IgdTgMRdoDkElwfEGR/HeBnV41Acf96t7cAqbXp3Ajj9YpAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028465; c=relaxed/simple;
	bh=OHxB9rBJfD9alhtYQwEZOwU5JQFBquZocPkNzhxXMqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qe6SbzYGiEmtkMj5ZzRUgQGDiXiJvN7eAnqOLlC7XTnbXG11Nb57cJ6GK4qzCxQxCUJgTiYm78TlgYoYxJyDHwF2vqv7sES0cbVYPC7q6Wjc8dYRNx7F/IBOhteW+Vip5somHFgLFqSgZbWaVOo9sXoAASXbxqK8FDDKTWEyxzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKGrz6wi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 712E1C4AF09;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028465;
	bh=OHxB9rBJfD9alhtYQwEZOwU5JQFBquZocPkNzhxXMqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VKGrz6wipn/LFmH8fMXXJyLXayMB+Im0igBI4lrMWMm7pR1cBZbT80UjZuAv/xa2u
	 ile6rQTSgvXm4ZZhfiYpcmcUmPtvSZUabEMkz5HmmVmaknYqcs8ICsX9CoDOHZmakj
	 VFvcmsxIRIRqfheLUNWRDWfFMWFoEDociWQzyWmirCQI16asY8ZkMLkj3GUUaAz9hy
	 PePdUFHT8kuvOxazr6Cs7SP9Cwk/J+5lSwzJUFQte76Zn7miBAfPXUlifQJJCeS+Pq
	 VsiV9ufJJmcK9BxrEpSMqBQq1JGXeACKMo5GHYRmVR4ncvF38kZWP942lT5gusUurO
	 ABtPQ6wQ+tuiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FDAD44167;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:22 +0100
Subject: [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock rate reading
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=1264;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=SPtatx8x0ZkbtjnD8HA6OeWFeo+DZZ7ciHEBKeYJXkM=;
 b=2UaIZd/gCwdI5kIGbU8BJj5qpiNrj2FL1GF/utf3Q9uRD7+lnoiRcKDO9pbhMhMM611X5TL1E
 toRgEv2X5geDhoQ+eHY+2G/4K1Vn3mTfArX/V9Hwli6Rqyvby60GyYU
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The stmmac driver supports many vendors SoCs using Synopsys-licensed
Ethernet controller IP. Most of these vendors reuse the stmmac_platform
codebase, which has a potential PTP clock initialization issue.
The PTP clock rate reading might require ungating what is not provided.

Fix the PTP clock initialization by enabling it immediately.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b1e4df1a86a0..db3e8ef4fc3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -632,7 +632,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	clk_prepare_enable(plat->pclk);
 
 	/* Fall-back to main clock in case of no PTP ref is passed */
-	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
+	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");
 	if (IS_ERR(plat->clk_ptp_ref)) {
 		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
 		plat->clk_ptp_ref = NULL;

-- 
2.47.0



