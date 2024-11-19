Return-Path: <linux-arm-msm+bounces-38333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A059D290F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D87BFB2D331
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6386F1D0B91;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1d8HCI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCA1D04B9;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028465; cv=none; b=KL4fdxhfGGGIUNSlgQUhXs4SOcIzvrX2Zu09m3z8htW8WjAqa9dxcOWcFGAuT2ufb856+BzWVzm48ze0lwqig9odKLgc7YQNs9l2BStiquvELWBa3g4ka6AuMlgnBs282sMDI10WSG6UmWZJGQkUxBShcwDfoMHy5Ne4I8LQFXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028465; c=relaxed/simple;
	bh=yiJTTdbSCBehVA/L/eEZohJ92LRA5AN12VTV8Lrt+K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6V5mnQj7A7afSHWAR1RlGK3nH3mw39hBJ1n0O79FzBgPrc7nM81ImJVBklQxPCT6L1sZ0dIK78E/OhgsyNM0BcanM9Tecd48vlJlPEXWfWSyf5VEvLp0/jT1IhDLxY5YSDRNrfVo0bL+RgHUb82X+GAUUxCvfxjtpuoV2opJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1d8HCI9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3455C4CEE4;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028464;
	bh=yiJTTdbSCBehVA/L/eEZohJ92LRA5AN12VTV8Lrt+K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h1d8HCI9MTIQdG0KAGKuo6f8fNNEVireKaBtDcaxUs6jPHbcHBbsq9B/rIDEPyYDW
	 TPmytZcAFTZ2m74CJvXHlkagHICv6s5u1ArQ+i39mEwQ5JXpEZunIG8/Ee/XyFvTtn
	 QrCIcwi34y69U/VF79m34fRUD62rJGSc3VbUsI2r8tsW16/EWsuIebm0jMNS8g5Gsc
	 Nbk53MinSIiWXey4Cp+daV9dRaydDnk6B/pQA9zSA3fRvJx8XAEi1FZVyuQqVbO8uV
	 EhPUYu4MPslPzcthqao4v/vzqnSBY5CJCUKDs1QCUPRAyam4CF+j6eLQ2ZwYsDtfeK
	 xV/tL0c4YYOHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C90D44162;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:16 +0100
Subject: [PATCH v5 10/16] net: macb: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-10-7dcc90fcffef@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=996;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=U+5Hu4M7x0TrRD8qVcOZhTAwOuugFLfhyCNLJdF27x8=;
 b=LhgGR7PHLpII+75vmV9SAGzHIxvTr1dj0O5nQgbUB25EX1V8sKH1Tz+8pNTq4LLulryU/A+Ne
 svTyjwEjOpFAaGvIR5A4ZF6+vfU41ysuUW6JmQ35/SZFMujM54+Iueq
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 56901280ba04..ba9d9567a3ec 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -530,19 +530,9 @@ static void macb_set_tx_clk(struct macb *bp, int speed)
 	if (bp->phy_interface == PHY_INTERFACE_MODE_MII)
 		return;
 
-	switch (speed) {
-	case SPEED_10:
-		rate = 2500000;
-		break;
-	case SPEED_100:
-		rate = 25000000;
-		break;
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0)
 		return;
-	}
 
 	rate_rounded = clk_round_rate(bp->tx_clk, rate);
 	if (rate_rounded < 0)

-- 
2.47.0



