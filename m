Return-Path: <linux-arm-msm+bounces-61374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07709ADA828
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 08:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC61189144B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 06:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8DE1DD9AC;
	Mon, 16 Jun 2025 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vuW4jsZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0621CF5C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055151; cv=none; b=Lh2F98WbABTuPTG6fox34FMIubIBQdJdg6VOgmBGnNhf4Ug0w9wDCkDstksdQaXM1fdUtOjb7XUwPVCq0CiEf1vnxpOCWRVOxE7tz4ZmZDLBoy/JCT/7GjGAfS8cK3N9TPzz8RjHrir+vKaBprVSkR4I4ywZZD3WXgM7LWqsQ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055151; c=relaxed/simple;
	bh=hP8oqMRH0eoAXRKjft8SzhqvyrnpxIF8t2YdwglNn/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeh/HifcW9dwEkxWNsM2UJkHaz/Q7Lp5d+FVeSCmhSeXXW8JzX/4M2DOqH4DrBLZ4imc+yph5s7JR2QcMEk165alOqUfDMutCvWPPGQpk65e7IjePy9AbVcQZ/OqR9Nprjy3rdD3EanKyWzSgpbN/ISnYM2rEDU2EH+z0J3M8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vuW4jsZP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso508552f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 23:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750055148; x=1750659948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EQHsf96Ap45pHjzL8MdOZppUdVax0jMIgbyM9QNM/g=;
        b=vuW4jsZPxBkJAzDyGuNMb7hRAH05Fh6wyQ49hAoAhuBeQMuJH6iNgXFY8DQ7rjEtlV
         FCmb8gB9N9jCEKwOaZaKsN9Jq04F237M6Rqi9GnoJLLFeZvGtiQdki5zQogdvpAeNN7w
         CxdJTk8neLILOFNMtzPvV5ZHoE70XIoeqq9pAyKnBF36vCknukfgVbx+yLp/IKLS8l3L
         MBvM0LCALM6uQfB91y6s1Hwu3FthoPVUhMFOiPjLXkPFCrRAER3rUAvKD/MJpCfXhMI+
         PieOitRLqpCQKdJNAkDqlSR3DnxjN3UQrQdMXpIVF7zRH3HUhq2HKB/6cWPI0kNAndXU
         WoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750055148; x=1750659948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EQHsf96Ap45pHjzL8MdOZppUdVax0jMIgbyM9QNM/g=;
        b=nrTKl8ZcxpFAgND9KfBociUk2uIl90lqXTMyXFT5MLubJeti25upMPvGmZVHK0wjVx
         T1majPb9YhVAzIXcg1nvRAZVux7Kb+mg4lhY0U/+qIyPHHI673GRzks4HlEuSG7e3pqy
         RPpcZS0K52s1Jhy/Yi6pmSfJkhCvafVYAX0naToJDGeVqGea+oT+JYYXgbLhwhDIygPi
         a34OKf3xUN1Q22VMJ0adC9XC6JnCaDE4lTnw4AIxwEBMlyWTi0js7tXNpUg/RaLQsyCJ
         PmRucZ0EQeVP1a0iz06rIOiou9KbsjA24pUlNZP3beiC/YFGIa32aWXs8UDNK8JaqlqJ
         pQBA==
X-Forwarded-Encrypted: i=1; AJvYcCWWldBGcXc92xchFA5UI4ctfQciysFxnLRaBf+f1cPKZQZPeTXnKQtAlKDY1Scxx8NnT1HgTnflWCqVzGvM@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQsbJfaSn9heTXBglK4MlC00eAxgJpC9cRPXLvAvV5+ipHTp4
	qrFAGtwPCV09MNq7kLHhI231RVjocBYKPUibmBHT6miNKu8XbCYlGAQVmsjcctwttfDGTtqRLed
	goUyRSbDLsw==
X-Gm-Gg: ASbGncssJLP8smP7b9lC51WEZZkPU0PLW89MGndXoTF+YsNLvm+NGfSLG2wuchbq2bI
	JW8p+i+HqKereHqqbIssNT+vOU611R+Ps0zH4kdfJstoAsOTheP2W0c6QJBdikVhhdcw7d1sJ++
	346ube7pW+YYylPcCJDq2DqPJa4pKoxEKCKO2Q+MafWgBWEeqPoSZEdKxRTt1fMJppoA6nInP/P
	x1u/qjsd7jsi8Qaz8qoyyl9PHlkEOxkhdlE0phwHNIeP4CH0L0suBFBR7PO1KFL8IpxT8d06XPh
	7s5s728HvrdKZkbSbvuom72UrQfCUXkDlluV5sA4BKmkozkX54QrQwzbV8muse9bBPs7TNRI/w=
	=
X-Google-Smtp-Source: AGHT+IHOrBlTc3G8fJx1xb1aa5RUGG1oL3w34p4Na9dKbV7Y1WMOLPihmPd28RFY8vCtYNB9cSHDiQ==
X-Received: by 2002:a05:6000:18ae:b0:3a4:f912:86b2 with SMTP id ffacd0b85a97d-3a5723a1dd9mr2082389f8f.11.1750055148252;
        Sun, 15 Jun 2025 23:25:48 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54423sm9883073f8f.20.2025.06.15.23.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 23:25:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO) configuration on SM8750
Date: Mon, 16 Jun 2025 08:25:42 +0200
Message-ID: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=hP8oqMRH0eoAXRKjft8SzhqvyrnpxIF8t2YdwglNn/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoT7jl9HxQJ01hueMCf5wsLpD/COtPu5BUqukRd
 lnXUBpXzaaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaE+45QAKCRDBN2bmhouD
 16BTD/9m3fBFtzLaw1BvGg4t/4Kp0huLPdfDPZuuhdhcMzhpKmH1o+GQ6HO8SPHWwg3n19fjQmq
 FCVPqFh+sIrCz5qKZHm7TmZveqix1pEloadlV0yPm/4c6o5UEEIfHotbf9ukCjUdhY0a+FrwahZ
 UEurnmeedLssm0PGM7xB4yyscFZPxDnf55+c561SenD12/UuUnIsz0IAmYQ3SvHKe6UB8Ny41xQ
 a5w1b6g+3HFwQMUHw953PqDmqm9tFir5pDUq098kJ2f3cgdk8KiYkAvPxBz8PeY9j07cGGBI8R7
 MYenhC9l3vJFHJfWZt5Oq22URYdrdwQgbY9srxcklh7tegVDKGvAj/j1xMSeHuWWtCnu7poc7sE
 amAKd87PyuhYFw9nwh+Do9g5Nnt8ibZWrnS+oE69ahMDhtsSP8zXeGz1UgSzTCNptf9YsRghP9S
 iFVURr+auZyw8qv1UMOhcxqgFSFh9qoVogzL1vX0RMSSFUDmfoe7aNA7WmxZC/DkfqazPMi3XUN
 tQAAksEslDNvdMhNFkEoJEULGxbvV3X5vprUIGvLLjOn2JXzxSgDB7qsU8MGZ5tnBfRP6GqhcFd
 945KXzeIL1r8hX7NaW1qW+WoaQydbTu3Lb146cXuFEpyZoJA9E7pBtzm4hdRLuEa1obZuBKm3wd YBKiAmnBqWXa1+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing DP PHY status and VCO clock configuration registers to fix
configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
works on after-reset half of rate which is not enough for DP over USB to
work as seen on logs:

  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11

Fixes: c4364048baf4 ("phy: qcom: qmp-combo: Add new PHY sequences for SM8750")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 8b9710a9654a..f07d097b129f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -228,6 +228,9 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V6_DP_PHY_VCO_DIV,
+
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V8_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V8_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V8_TX_TX_EMP_POST1_LVL,
-- 
2.45.2


