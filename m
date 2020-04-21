Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053E11B2560
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 13:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgDUL4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 07:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726018AbgDUL4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 07:56:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2C3C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 04:56:07 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t63so3230184wmt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=SK0twZznEqzJD5MKEltpD1yU85935Kk/UwNoJNpy5Ig=;
        b=DhgFBXzN7Z6dZ+cdyKU9s6K4b8aUyxnBkh/O+4AjSI5b/O2RLlbs124RLsldFMAT+3
         uDI1xdP40Trb4+U48TT7Um9kksYCJnOIC2pcu3IF8USZlR62iOqdleZDODwU51JsMT0Z
         r31lEMISkXDi80+OmnOKQgH0tXZjwkW84KOJqD7qhOC/A4H42jzWRG/InMeqqQA11nBr
         KD9oF3GBCwhccpuCVPH4jXVOzk/xKEbA5tWBDsdn1eUFNvOucmJNfyllHjcyZ78S7trs
         ThuGDUP5iVt0JrnyvIaC/aLoKJuzYBDLAjKXopCcOXvHh5Xbv3Rr7pKWpuk2cegpruYL
         tHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SK0twZznEqzJD5MKEltpD1yU85935Kk/UwNoJNpy5Ig=;
        b=f4Rk+42m0tFl84vt28BnOcdN2B2a1esF7oITM6vyKir58L4lIuxe9yIwwuCFSG8sK0
         xh91fHwH5/yJEVeDhlxiSOlTu5d+cUb7Tlxmt9r9YT61Y3vHiM3H7bFhB0yrsojoRpAn
         i+EpGwwPJMrsJlyjIA93pdwlN4Z6Lt/uRJawZkREbVGLRTKnHBUWBw0vK7wowv6CjkY5
         8YNNsR9NQXGh2lvHojaQMCiytoWQA6/dZM+j+cvVrfbHOKJsvAV4XA6h+A1d1X9gn7O2
         Xi21sQ3usRIDGOOAi3wqoJlsznDjkxZa1XjOjPDlyuFZQkzdfhDOKla6M4bKEq7+PaSK
         P3eg==
X-Gm-Message-State: AGi0PuY/9avO73W+t0G6bmheOepE3VQr/619VrFcbToDzsCB5ZtEzMjM
        E0SiudkEGmtRveMhzNSrdqvDYg==
X-Google-Smtp-Source: APiQypLEJIuLTeiFzueX9EjioDIcOXTCHk2h/G4FDPDcyih31IRM4CZwfAJxE+LU+gdPmuwB9abWTQ==
X-Received: by 2002:a1c:3884:: with SMTP id f126mr4805111wma.91.1587470166134;
        Tue, 21 Apr 2020 04:56:06 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id u17sm4116430wra.63.2020.04.21.04.56.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Apr 2020 04:56:05 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/2] arch: arm64: dts: msm8996: Fix CSI IRQ types
Date:   Tue, 21 Apr 2020 14:00:24 +0200
Message-Id: <1587470425-13726-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each IRQ_TYPE_NONE interrupt causes a warning at boot.
Fix that by defining an appropriate type.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 951c53a..24a4625 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1001,16 +1001,16 @@
 				"csi_clk_mux",
 				"vfe0",
 				"vfe1";
-			interrupts = <GIC_SPI 78 0>,
-				<GIC_SPI 79 0>,
-				<GIC_SPI 80 0>,
-				<GIC_SPI 296 0>,
-				<GIC_SPI 297 0>,
-				<GIC_SPI 298 0>,
-				<GIC_SPI 299 0>,
-				<GIC_SPI 309 0>,
-				<GIC_SPI 314 0>,
-				<GIC_SPI 315 0>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 315 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csiphy0",
 				"csiphy1",
 				"csiphy2",
-- 
2.7.4

