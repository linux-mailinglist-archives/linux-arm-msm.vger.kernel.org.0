Return-Path: <linux-arm-msm+bounces-45626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D76A16FA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0888A7A27EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CB61EF0AD;
	Mon, 20 Jan 2025 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6z3Kh3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2CC1EC011
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388035; cv=none; b=Tv+50vXPCLitM5KyquRhDWNXXWMuOY7zyqsFY76est0kcsVShHk7FaK+Fmi3svh1G7lQ37HhWmsoFgyA3lPB581JuW32e/Ve/9K/pA6RoxXiOniIgE0av8dVWn5lgPdiwb9sv1ucd55nI04gktG1Ek4GEhDcPZHgsEfNlutYD/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388035; c=relaxed/simple;
	bh=rN0mUh8xSSzoQH6SIK5f07uULeQhnDD8arxTDYv+hQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXTtSQir3HWi4mVkha6RNrBeWc9BD1hAVzcCnLeiPViOU8og5piDp90GGLFH4EFrf29zKRJU3Ziath5zCZ9EzeEIHx5jNFQRIXDVPBJpa7NTrolTiuwV/JE9z88f44l1kEmUYkodERUfRY6ZVfNCYW3UL6jReBV/c4HkzVx4yV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6z3Kh3K; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436281c8a38so33147565e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388029; x=1737992829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNkS8iEEupB1QIvi0LaSATcY3VaqLaa0UnXwOKyimeg=;
        b=K6z3Kh3KHbVH4VZivDhZHhmGM9+RxDMFI38EuadA3uUK7ZOvFL0fkVEcGe8sT/eYm0
         yVOPoBvPJr5zgjwKRmHUITVJtT5PgbhUf6Lqds5XCZfSKhbPnkm0l9OXWVZS3Bb1l3fK
         +r7mUfEyqy41E1YBYpykeSCyodHIi6ANLXowWv3mB/MFeOdwiGd75sd7UyX/kQtRxWrz
         /N5XB66knh7alD9QdSAF0WKyTqRDklSPF4lkJNrX0UsN4+vXqSuABtkAP2SMZexPMtm4
         GdL+t9brlF0+ejJjqbGZvleIgNCpHytKo5wemayqjDqNJbDFNeMko8A+WKpG01UNvfjC
         FWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388029; x=1737992829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNkS8iEEupB1QIvi0LaSATcY3VaqLaa0UnXwOKyimeg=;
        b=IM2x0d6ttKPvzaFtM1PobbD/ZlCJzR2099GIvIQAmd9BbooY7aWrPs1/4b9rbEs7ak
         wDnhARGzKJGZz5z3lobWUW8WpYepABcPYDAQDzKAko34PPNpiFfmQhq7j/kETrQQkEM/
         zYqB+5AKx+VBrnDs9iN2YBEwTyclPVZ9+zPYMuA9sHcKNk6LJWSOwueWL+tgmjTeP/qb
         2b2qgiN75u1pedsITZ3iYVaYwATqAyUNJ1yNX2+67SSSlsY4gYw7bBRL3C9mrrEiwDiz
         FTcuFMGJHviqBRfrARXxgX03gkWvLrQBSZAkRhoyBWSzc7CSIcIVoAMha4Sk2fzEGhCC
         xQLw==
X-Forwarded-Encrypted: i=1; AJvYcCWQLAnYCfxAAkqiHKZUoZCCUiE0+lXFmj9xxD6V00D9PH5j8M3icE3klVVtrdl3NQvLIFWBO3G5OlQdbRDE@vger.kernel.org
X-Gm-Message-State: AOJu0YyPV3qWFGLl2/WWeSEPql7M+IoZhrAeyf2K4M4u6YcoyIv6K7su
	aBmqr7gurVw5IsYRq1QKkcSRWsEefboMOxiy9Kbb+PKegy5BWDPIrl139lFHcqM=
X-Gm-Gg: ASbGncsOAZNuCuxegil2pWThAjGe58xoO20gKZWuTRMAIYZZNsq6MUeVVzvbQVjh/Jx
	5yDD8AQAljFFWUg4q4Puc5RXHkY1HkaoeXHxQctCwPAQxYfemO7GzlpnF3f8+DTWJCEjN9nxz+q
	3ZTCqFqCToX8YKWvudSx5zLTe8ML2su7YnKSiwptezVMeHxYTtqixqXyclquLZfZaS+R8QkrWCs
	xLG7bxDmH3RHsr8YiBSWHwatlcpvDXmCZub2LIjdd59WT/6sMUKADz7WN9Eb30YhZ4r57iCO51+
	z00=
X-Google-Smtp-Source: AGHT+IGGhga1fvX6C53DMfp80vMmu5od1cu+K8nITn1gg7G3mvKcbeB3m95dt/kkQETQja2mGLTZkQ==
X-Received: by 2002:a05:600c:3484:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-438913e48fdmr131484835e9.12.1737388029267;
        Mon, 20 Jan 2025 07:47:09 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:08 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jan 2025 15:47:03 +0000
Subject: [PATCH 6/7] media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph
 5Gbps DPHY v2.1.2 init sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-6-44c62a0edcd2@linaro.org>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

For various SoC skews at 4nm CSIPHY 2.1.2 is used. Add in the init sequence
with base control reg offset of 0x1000.

This initial version will support X1E80100. Take the silicon verification
PHY init parameters as a first/best guess pass.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index b44939686e4bb..fc624a3da1c43 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -55,6 +55,7 @@
 #define CSIPHY_DNP_PARAMS		4
 #define CSIPHY_2PH_REGS			5
 #define CSIPHY_3PH_REGS			6
+#define CSIPHY_SKEW_CAL			7
 
 struct csiphy_lane_regs {
 	s32 reg_addr;
@@ -423,6 +424,130 @@ csiphy_lane_regs lane_regs_sm8550[] = {
 	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_x1e80100[] = {
+	/* Power up lanes 2ph mode */
+	{0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x005C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x045C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x085C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0860, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C5C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C60, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+};
+
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
@@ -594,6 +719,7 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 			val = settle_cnt & 0xff;
 			break;
 		case CSIPHY_DNP_PARAMS:
+		case CSIPHY_SKEW_CAL:
 			continue;
 		default:
 			val = r->reg_data;

-- 
2.47.1


