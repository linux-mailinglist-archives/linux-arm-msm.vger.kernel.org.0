Return-Path: <linux-arm-msm+bounces-80365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D4C332A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC99C34921B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B64E329C76;
	Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rp+4EEng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102730BB8C;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=U6IEMGQP1yN/DPySaljMgaiDTU2slgQySk8/VzEqhC4YK7Xxyd0XwYIhdBCbzt4O4TDVPjZsKA22KveCDVx/tT/26daNXwzcKialJthhfE0lv4athU+0Z0SfD05XB0PF5vdm6GhjZ6bGTmEua1N7Uiyvr0fl6AIz42maWvroFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=38ck5RCR0LO2rWCNSIq2uzpHXbhEGR1CpmwmHrfKicM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IbG+OseB0w1+QPi7Pb4v70Ojlus394LyhcYG3SR2whhbAXqY/QlOnkhJDx52/0jqr96wRI9FWgw3klJxuoRX4OQNYtdfvdtyINJUQV/5Ze2uGWoZZFw4FStnT8wPvr7oo+jS8GXvmcGV4LeuVuiUJfCZAewQkADIzjHqLs3GQiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rp+4EEng; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5A8BC2BCB6;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294574;
	bh=38ck5RCR0LO2rWCNSIq2uzpHXbhEGR1CpmwmHrfKicM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Rp+4EEng/p6YDPtSUCCc0N1DfXz61Wa8XvHZ315SneWGEJDSm0ZvQua0oOkUUoz3j
	 Zlu0g1jVzigV7sxJcEE5ho4J9p4KUhfteTF10Q42OeDv/7MVEvJ3QE/cql66skR4NT
	 vic1tXG5YbkcoNxb2gVUIz0SVvGDvRsRAzth2xW8XjDZTncncorYH2nnRMTRCGxScm
	 yMXL+C68w3tnlIXgwrdKBW66D7Fw/20UIIg0qHi5iSM8KMD3fWSPm6hI4WesBE1Cqj
	 uRVtvmkHNDMmwYN3Q8xxGlF51EBEICs8S9l9xCA8wdKSbHTTojoZ5Pt8XkwMfT4Eoo
	 RmMtcrH14DPWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB048CCFA0D;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:14 +0100
Subject: [PATCH 06/12] drm/panel: sofef00: Introduce page macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-6-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KFWwy/+TPv3o+Pr2om1zoaTzQ1nmZjY1fcOyZY+O5S8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnssKl2JvbVAIAyvYQM8vZGahsnkSpWb0WPDy
 bQmljI0h2mJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 cq75EACDoWk8cQdRNuWiIq4qRV4qTj5eVnUk0PlrGaMWjvlDvDF2A5RHr/DOSLn79g5posLE15Q
 AobRHXayu/Mdr+dk4z2BYsekvbPY9FIc1b2UoZuvZqeIgRnM71uJF0b1MHcxkA/Hu7a9Rqa8zkS
 Ej/96tBjjiDUnOfivFei4Wm5B648h7juKTT+S2qYzvWP/iJr7Tm665JD6Zjbfdgqzz8O0R7x9KQ
 FUG6T4Xm5ZIoeudOB1Pb3KuRnzgdc8JW9Ccr4BIKxgG66vdj+bjXXaAylml6rtZHAfsrJ10MAu2
 lfPXUbkWvRAS+RLEYMrr4JJmTpAoBvept3BNSmtB2e5a2P4F+KPXTxaV6DWhdoF6dE0gUqXH9Jb
 qSFVmvHuIUlrrGrHVf1gsVp7AmxRKypKV/BzvRgXhpjVBV9o2pixpun8ACQq3tXQYwJ/7RaGR4f
 WHobmCOZnSly5ORn37GUGjNzMUwCh5wAJYfH5j4PC12RHkkCfh7F03/W9FnUI2E/PUC9oBSvyf7
 CCi01iViD6zDbn+ADIvIRhS+P1uFGNwbth3D+TLVYE6llaVT0eVXDNtiBrJNoSwyOOUlwLU4pH9
 sDTapc+kudSIRPhuowQW1NNfF4LLqvN4z92tGZUSb0YGpqfqB14XDJM5jubZMGGAmBfg+Q8UO7E
 /xpx+xeQ9NWv2XA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Introducing the macro make the code a bit clearer.

Looking at other Samsung drivers, I assume it's lvl2, thou due to not
available documentation it's only educated guess.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index a3651f0060bde..97122ec8872a1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -36,6 +36,11 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
 	return container_of(panel, struct sofef00_panel, panel);
 }
 
+#define sofef00_test_key_on_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
+#define sofef00_test_key_off_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
+
 static void sofef00_panel_reset(struct sofef00_panel *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -56,15 +61,15 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
-
+	sofef00_test_key_on_lvl2(&dsi_ctx);
 	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	sofef00_test_key_off_lvl2(&dsi_ctx);
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	sofef00_test_key_on_lvl2(&dsi_ctx);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x12);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	sofef00_test_key_off_lvl2(&dsi_ctx);
+
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 

-- 
2.51.0



