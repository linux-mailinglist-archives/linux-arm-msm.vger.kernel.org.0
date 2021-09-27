Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD5C418E76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 06:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhI0Euv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 00:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbhI0Eut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 00:50:49 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A14FC061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 21:49:12 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id x4so3413456pln.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 21:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yqut9De+8qKtl1UwHb70hm3Lp+Eib/4T+4ZznburE20=;
        b=B+jaGLcWqs5eaW1Zz7HJ5ZpRIcABigLjJ8jgI3gc+6UyUZjhZznJvDGZwWows5qK7f
         cY/lLDnR9u0gryCmklGfZBYrI7DA0WpJeIrw8jHh+0et3FA5mJ8LC31xZR7ioYrI/NUq
         tJ6umUpk+UlGiqx5W3/We8pZNrxG49sAft3lpk83nZXxMtBnyjML+dBv0529ys2RMu8Q
         kKOgczBrg52oLdBTPR4HkyjZQ+UVbbc+mqikypJ9EBAn9wsipLagu2FmLMOU33KKOFr0
         jOZRMvpfhgLTnkcII6Fo+jOEGRFt+8Sua16G5fhS2ehhza9fmiYA6YdAoI/3a0lpSUuG
         OKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yqut9De+8qKtl1UwHb70hm3Lp+Eib/4T+4ZznburE20=;
        b=D0iWHrLRIQtul5HPQVsHovQ73XRxBaPWBmZk0Ihp0TyEDlwGJnHnlx9QtWl1n9IyUb
         NM/V0fwT55dCLXxOxsLqXnu2zTcHLnkpNGUU2z7MT2lULfOIR9fYPg30A8LfbemwjHGg
         CV9rUbk0SqbVPzieBdSuys8RA4CesbL0hekoMWnT8CVT+Sobg4r9PJKC2LHoQVoC3Rkh
         b2HU1EPJ6GWjIHFeqVzobIiT7v5iu6SVyxstZpR4FJmFtFqs+bXabX0b1bF4ef8Ck9ZG
         sqm/pugMHSu3VbZKBUebsz8i23PVz3B70RNyEig2trl+r7IX0qGu5e575Wncw4UVSlCp
         i2iA==
X-Gm-Message-State: AOAM532wpFDInOikFIpqjy2vTH80mHVfMNOtDWWuXAM9/yF0IMt62Ko6
        34XPtQFEZtoDfylJbOUKV+Lwcg==
X-Google-Smtp-Source: ABdhPJzMdnW6OyUR+AHbSPpIu8fhtS0rEKQu96QW1RDDYE24xE1zJyIXGuqw/N9ORjpMtMCsdJWKkg==
X-Received: by 2002:a17:902:d34d:b0:13e:25e6:f732 with SMTP id l13-20020a170902d34d00b0013e25e6f732mr4337542plk.58.1632718151608;
        Sun, 26 Sep 2021 21:49:11 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o8sm14550651pjh.19.2021.09.26.21.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 21:49:11 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] phy: qcom-qusb2: Add missing vdd supply
Date:   Mon, 27 Sep 2021 12:48:23 +0800
Message-Id: <20210927044824.30246-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210927044824.30246-1-shawn.guo@linaro.org>
References: <20210927044824.30246-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per downstream kernel, beside vdda-pll and vdda-phy-dpdm, vdd is also a
required supply for QUSB2 PHY digital circuit operation.  The driver
works right now likely because firmware already sets it up.  Add it for
correctness and completeness.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index ae063a8b3e28..7a8e4333babe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -371,7 +371,7 @@ static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 };
 
 static const char * const qusb2_phy_vreg_names[] = {
-	"vdda-pll", "vdda-phy-dpdm",
+	"vdd", "vdda-pll", "vdda-phy-dpdm",
 };
 
 #define QUSB2_NUM_VREGS		ARRAY_SIZE(qusb2_phy_vreg_names)
-- 
2.17.1

