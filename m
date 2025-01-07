Return-Path: <linux-arm-msm+bounces-44162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7462A04471
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3256166917
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557BB1F63C4;
	Tue,  7 Jan 2025 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVwZnzUf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE4F1F5428
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263678; cv=none; b=ShODzfpiFIO621/M1ZpnjSw/xFLxj6znS2levVS+GyB7LihNBXnopCEKcriGEEkwjkk8U/PAowebqkyJVcb51qdCNL2gLs1FAxiAov4HHIho1F8a9vg6+MQabvLDhpToS1uDOwAp6HhdEWC+jqOzfbdgORzL8kmBpu+ypJi5f5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263678; c=relaxed/simple;
	bh=4t/j2la3SKfANzi1HPhuJ+GnbsEt9NpUKe/+VSpgqEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=og3CknzF1qBVDkAIlW/K0xDESGiw3zFa6CFeNj0kDdxU7gvvc/g3f8fhKR8xQge4cPkSx0WGmG0OQ2RDqQ9+LOEReMAcyfGd9JZRBC4sJPIN9h6qWtHMHDkmIZ7V6lF8O8cZJbJ8CZTJIxqFxRPftmp7jprW5CHgp7d70EjsRbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVwZnzUf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434f398a171so15106165e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 07:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736263672; x=1736868472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRtOUFaCEBljXEFxllb3NAprAyV2sbj8hfVfgKKWp4E=;
        b=hVwZnzUfy1gTivvn9VdZ/numJuGASoCdatG9XfA+oGVvnWpsIhRD+NuXlNwwUlvDbC
         09MgLTUVXE2CqzHAADnBWnbJc3UanpqNYshhM/ddIZZ27xQsDISqxA9/Wqhf676baCS3
         T582VI2sT2P0jDNUn/POW/KCcwQYNsqkCoPm3bLxhs58hSDo13TDsUWXUdbH2GuK2pjs
         24fSO+70CPQDzA3Jf95yO/0b0/dgajVczRYjIVUcvQYC2VE/8PmEt8khmiVp1B2EWOmt
         OfsA96G+yzX5IfvQN/rjGK0OyI81aGyAYjLv4JUJf+yc/uoZ4ZWk/NM+RsG8Bqca8m1a
         /gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263672; x=1736868472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRtOUFaCEBljXEFxllb3NAprAyV2sbj8hfVfgKKWp4E=;
        b=HUT6i8BHkBK33coATCTwkwcTMxYGiwpbop+nAtBVgdmB6dS9XGZOeB4VhvBwXTzuCO
         gCvE4s+Ws7N3FObXNWubNE6M/TQvaAC+1Cgv7JMMDqJqK5Jn5/8JI2Mu+86mgtvvntjz
         yBFT/BycgVwxBcUyWX8w/xzWfu5zKDk7GoOUBYVuYmbagwjlvS7+/vsUnwrxbzDXBHMn
         axgkO0kXs5faYoTz4M3Yi51bupAVbJxjSbNJ0ZCzxSx0p3zFth+CAQUcX+A48nUArII4
         BVumZCXaB1PGQwvoheLBB5KcSye9lt0XZlb00Q2OrlYIbgITeJ7nAW6Pvk0V+4QJ9lVU
         egpg==
X-Forwarded-Encrypted: i=1; AJvYcCUE107D6lSW9XNPGwvJY2M1R/6+JypGXVpvX4vfkcB3+Jp+xjnOiuj9z+ogs2vMFLiaQBDb3bLwWtj01Qlz@vger.kernel.org
X-Gm-Message-State: AOJu0YwPTfCVrDZSqG+N1BsiOnCuVzAQi5P2BfBwDS48rH77QXR6Eaxc
	isrERQOH/Rux+eeoSfsmgk9g3Yk6DgfhjZvj1Wkd3np4eZFaEjE/Becv077svOI=
X-Gm-Gg: ASbGncvzOrr2ev4ly5mUykEjiTNJ9R/2YfTmH9mMqHccb1pusv80ZQ8Qu7NXANmK927
	1VQAEb6+VbFT9Ax4aBetGMzPT62W7aGvWhZZbaY4qrd9FVf7/4DdTNU9b2Lc4W2rBLwUy5v2Add
	MuWgR4Z4kgutHVRdQeKBmnCROVIFVtwH7Se25BoTaKNPJMLg88l4NE903kXxh2TkUJsOGnDkmYl
	QTCHy8LFOSM1qrdc781hCgcTtDjZv80ZBNP//TduEkYzd61OgGyaaMdnrH/AszpR3li17s=
X-Google-Smtp-Source: AGHT+IGGt0MjttB87XU1mjaF7vIMMeEVgo4ktbcDmDzu7zudZ03aL1zlaxLl2cafNGGNpfFOfqow6w==
X-Received: by 2002:a5d:6487:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-38a223f74f7mr17746493f8f.11.1736263672288;
        Tue, 07 Jan 2025 07:27:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dcc8ddddsm16666805e9.0.2025.01.07.07.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:27:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers
Date: Tue,  7 Jan 2025 16:27:49 +0100
Message-ID: <20250107152749.327407-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable necessary drivers for booting Qualcomm SM8750 based boards like
MTP8750 and QRD8750.  The clock controller (GCC), interconnect and
pinctrl drivers are considered necessary for early boot debugging, e.g.
via serial console, thus make them built-in.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5e88321aa603..0812bd9df09b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -636,6 +636,7 @@ CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8550=y
 CONFIG_PINCTRL_SM8650=y
+CONFIG_PINCTRL_SM8750=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
@@ -1344,6 +1345,7 @@ CONFIG_SC_CAMCC_7280=m
 CONFIG_SA_CAMCC_8775P=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
+CONFIG_SA_DISPCC_8775P=m
 CONFIG_SC_DISPCC_7280=m
 CONFIG_SC_DISPCC_8280XP=m
 CONFIG_SA_DISPCC_8775P=m
@@ -1369,12 +1371,14 @@ CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
+CONFIG_SM_DISPCC_8750=m
 CONFIG_SM_GCC_4450=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
 CONFIG_SM_GCC_8650=y
+CONFIG_SM_GCC_8750=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
@@ -1384,6 +1388,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
+CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
@@ -1667,6 +1672,7 @@ CONFIG_INTERCONNECT_QCOM_SM8350=y
 CONFIG_INTERCONNECT_QCOM_SM8450=y
 CONFIG_INTERCONNECT_QCOM_SM8550=y
 CONFIG_INTERCONNECT_QCOM_SM8650=y
+CONFIG_INTERCONNECT_QCOM_SM8750=y
 CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
-- 
2.43.0


