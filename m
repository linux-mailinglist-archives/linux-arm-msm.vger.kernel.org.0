Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB9426FD90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 14:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIRMxY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 08:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgIRMxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 08:53:23 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E136CC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 05:53:23 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k13so2874468pfg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Wm1RLRd76torLxtzliiu53YI5gvnudJPD7JdUTSsjtU=;
        b=DGxuaHUimtmf6zFTghz4IK1nXeTSde7nhpjg37DtpDQp0Z+9aRirccD7yfQdeYQkAp
         Z0y9Zj4D1kIiCP+YFpdFb01pQ6uCPHJdCguaCrAZ1D+os6Fy/bQRGCe6qkXHyUvh3x12
         8eoyXFFouoV01BAMcBJ0xSD2rW7en9cRXfvnL5JrjHjtNTqNRBJzVu6cOtGxj5YtmTpX
         ddz2Do8W45cX0f9fPAFJIVtrLoCBlXZNJF0AJ+pPGWmiLNSZ91IPiexJ0N0v2ygQ3Tu0
         b8++RRZPKTaZM/U04erpMfwv10YnJteOI7tG0uYxjoJHVpw6uTvZh01QRy6nAnYPIau1
         c7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Wm1RLRd76torLxtzliiu53YI5gvnudJPD7JdUTSsjtU=;
        b=Sn9A86OFr8fiQ/rJvaOU9fTQgOcYieO8aiWKX47y/96MHtRl7BoYmMH5sWenPIKu06
         h0F+jpqI3FfNZqMDaAez2K0dqdvwnOhUNRXqJRgGg93jWeyu4BMdeSclV8PtcwnHH+D+
         jzN4lz5kczJjv0mgklcvPr8gLfRBX8IodgY8J0HhutJzzkGC1KTvTDQCxmehGglh8qj8
         FYHajgJ8qSUhd9ZYY3EPBqlji/bbQLrKYCyeaQ9An7ZzrUodAhAQf6SJGDgcDAOiDQS8
         EVuFFN9FtfisKWYnddJbE2WUDwoJj8B6KU6mB9/pTI23DRFg5Dvmx0YTn4CLvf6QbSv7
         wsJA==
X-Gm-Message-State: AOAM531ywJWybMekXc4M+NFQBwB8mcUkvsTnbmgkxbmS3JmwF5yy7FSw
        /wutbDBEP5e5nCxhdY6S1lvX
X-Google-Smtp-Source: ABdhPJygjVywTinK0cQwbGidE3QJAjAJKZEUWpvg1kvJ6CfALKXZigeThLSk60HfzhRjquHRjb8FYQ==
X-Received: by 2002:a63:d003:: with SMTP id z3mr27549090pgf.424.1600433603385;
        Fri, 18 Sep 2020 05:53:23 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6291:66eb:7496:aa7a:b42d:458c])
        by smtp.gmail.com with ESMTPSA id j20sm3200078pfh.146.2020.09.18.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:53:22 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        catalin.marinas@arm.com, will@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable Qcom SNPS Femto PHY
Date:   Fri, 18 Sep 2020 18:23:12 +0530
Message-Id: <20200918125312.2920-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable Qualcomm USB high-speed SNPS Femto phy found in Qualcomm
chipsets.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 47ae0ab7e9e8..a803853fc71e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -953,6 +953,7 @@ CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_USB_HS=y
+CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
-- 
2.17.1

