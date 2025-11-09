Return-Path: <linux-arm-msm+bounces-80857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A6C43B07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4D43B2B27
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB6E2D595F;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ/ijM87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90826C399;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681205; cv=none; b=oDxwDr1TgO83TwFv/d8FqLhRQfP93Gfh1lrU2P/IjatyRRDJc9044vRPXLGy8xfyyD+WtxiEmN+aU69CoJ5TBCzhKIbLYcd1vshYbudS9Ic9FYDqXQvF0onM+4PIut8TN/jBAOOx8acIqDVgbsDe/Mk/wTPf5FY6+eIP5stPvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681205; c=relaxed/simple;
	bh=VURxhsrja0d1mbf83rp6CbYeiedDgrQAvgKCqq1ekF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSEHuk/Wo00g8Ku1s8BfDrMA6XJmN4TuDnJA2CYOeFXHrUO3ijOnuX2k8AGkbAcjn03zmM8jF4GwGnKDNMkt9UfwpnHmVR2YF3LsiqUE/2p0lxFAqdsiMYWdbFWxzqJg17D64s5GjS6ZgNcEZ/GEdsW2mAWtSZ2JyMIB24gOfp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ/ijM87; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C461DC2BC86;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681204;
	bh=VURxhsrja0d1mbf83rp6CbYeiedDgrQAvgKCqq1ekF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BZ/ijM87uSBCFwUXQwAYnTfypRVKx8fRYV+q0h9yjp+6OFgaPgCSJo9BBKVsttO3q
	 rLLmeQNadwsPs5pE6wKsTft014yYVo7rhY9syOC1g1123VrMtD9QwmNVuBz3sfN8Xi
	 rjwNrVxOC57XBql4HuVqLWgniqW8FT6M8nD82GTszYlcN6TbtoyDoVglV7sTgwc667
	 raBQ5AcZD/gafWkcxqpb4hv5nzQxkwGthnYUyklQHhQJQ5khoYBaAgB/TRjRYYyNa+
	 dl0cr5FgHkZqeBjDN3gJfOXG0V+K+o0UGuUblqPYH+CB4z5QVqNEgd5L/22ffAYkX9
	 YDCbZGL+BhXZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FA6CCFA13;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Nov 2025 10:39:44 +0100
Subject: [PATCH RFC 1/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 CPHY init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-qcom-cphy-v1-1-165f7e79b0e1@ixit.cz>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4140; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=pWsEEMfrqwWPA3Vwo7teUg13fNUs6yNCOr6Nd/+BhR0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEGFyHWEZW7qXgbF0CK4H+doJ++mLYWtI2uEcV
 /MCjdkFHFyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRBhcgAKCRBgAj/E00kg
 cuywD/9X99MIxdvKioSz1yJlZgESQudwPpuTXBefCggreBsm1PT1vsrlmVHFPb/46sS5rxtoABc
 sDugMaKjQZhHAO1Quf7YZJkefYjfEYbokSJ7CMuDON8n+l156zOoHa1dv1b5aaocZGuAJFWHYRn
 djAodsM+hAYfRAbx15JPffSy0SwFlgABZzS711fcdZ8/I03LeFeUnLjLr0YVhXD+R93YGD2Qn2N
 3Fu6QTdeQDftyrNn6XlERS92xr6/rpQogQxTo3lTbBBJPWh+M0OUkCtQEX9RzxDesFG7IcC3rLu
 20tMObp0ZNjsk5kI3Eg+CgevCL4/0nhLrmk4up0rTqhemXZGqfAnODbu2h6fif/hxt3wE6YCk9k
 y1wo0Sg0V6b4HgAf5t2oDqCGXbCrSI+TLC47B9V1b/t9gSSynkmY5Nvv+mgsbVPOIGrrXGxc4xi
 F1T9xiAP/ac2B1dawx/kKK2XGa/rz5K9xchqiZ3blZfBInTiC7/JgZnamS6a3k8kJBGrzOD4oPC
 w0lk9BZaw9VMzDN09/R2nRBnLNcJL2+wZ0qRMmtfj6bVBRT4R4idZlhOBV1n/8sWVoyr2NG92rf
 eMygq5g4TMMeHr4BgOraR3/7+x3T4ZvJDfb3lixPjqJAkB0J71NAPAM1ZI3XLQed2Vfp2lX6KKL
 /tWLlXJFLCpoAaQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
Gen 2 version 1.1 CSI-2 PHY.

The PHY can be configured as two phase or three phase in C-PHY or D-PHY
mode. This configuration supports three-phase C-PHY mode.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 619abbf607813..f28c32d1a4ec5 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -144,6 +144,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
 };
 
 /* GEN2 1.0 2PH */
+/* 5 entries: clock + 4 lanes */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -218,6 +219,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 1.0 3PH */
+/* 3 entries: 3 lanes (C-PHY) */
+static const struct
+csiphy_lane_regs lane_regs_sdm845_3ph[] = {
+	{0x015C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0168, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x016C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x010C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x011C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0124, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x012C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x01CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x01DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x035C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0368, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x036C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x030C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x031C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0324, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x032C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x03CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x03DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x055C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0568, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x056C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x050C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x051C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0524, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x052C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0544, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x05CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0564, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x05DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 1.1 2PH */
 static const struct
 csiphy_lane_regs lane_regs_sc8280xp[] = {

-- 
2.51.0



