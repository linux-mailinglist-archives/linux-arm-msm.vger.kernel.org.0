Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11D51A92E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389859AbgDOGIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389657AbgDOGIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:08:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A11C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:08:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a32so6332310pje.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FtoXwVoleXkIcgxv+sUDXuBjYYrXNWCbLasQJpcSpcA=;
        b=HBSlhJE1D9sli7y3Lghond2tbNdmcv2k52X6Hc+g5U5gDHqLCoyA4V8trJ1hfDXtJZ
         hL/C45uaWk31S3muKirUX6mxE9l7/jfKm44TJvP0ibCdxSppuRdEa+V5jgaghqPgvPwI
         eu/W20Vrnl+C99uTB5/SyrV5HOjbQolwSD0F4bscBMiFPNwKQ+s//MBqj/pDAejbqtGV
         YltAG7lbfdjyh2323dgGYG2zkzxv72b+gc/KcqSqVYZI4HZWhkaPYITCu6FX16G58tX7
         mR6yPCRvnbR6gAWQxxosJTZcITIHjoXHzn/censmt3pPbP2o5VkW4dBenxTtyYDbnj95
         alOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FtoXwVoleXkIcgxv+sUDXuBjYYrXNWCbLasQJpcSpcA=;
        b=oH4y1EXcosofWzyDM0fCIqyL9cEB2gJjTr1JWh5OI++kw2nHFuPXpVCzdx4wJKOFrx
         bni7RlBYtVPFEdjnby74Kl78FV5qDE9oJ6hAjDphkJCmtCD1LJIqBOk00zqzyagjSqt7
         1Q3If7kYhMtrYq3ij88nNkPhGIyqPt/AOOQPH26iO+TO0yWkArBk1fgr2YhAFXOLJAfN
         utOHhzASs7VIwqZ6iTt+9HRpzltrfaHoKWdFkpqz6mFuQ+Ct9O6JCii52Zmook+gq2KC
         rKELsC9cViSVHBQ+eEGRQo6Bl+XBa+tcilVMoUU23FUTSEdcNqfTiQMDjHZSuhRhxw1F
         x7kA==
X-Gm-Message-State: AGi0Puafn2GDMJAgYMRexQ1jal+Y+q+lPvVP8oiejY4IBbhnezyYTFxY
        aZmCrZt1X3rpvXVd854pdOuSfw==
X-Google-Smtp-Source: APiQypLATgkPNLXkc5JX3Zzus/BzNEM7TgJHrpWr+foPIyUiTHiGtmwHXGsLk4VH5o6rDNk17+gOew==
X-Received: by 2002:a17:902:968a:: with SMTP id n10mr3367186plp.74.1586930888484;
        Tue, 14 Apr 2020 23:08:08 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b4sm2643951pff.6.2020.04.14.23.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:08:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] phy: qcom: qmp: Add SM8250 UFS PHY
Date:   Tue, 14 Apr 2020 23:07:45 -0700
Message-Id: <20200415060745.740193-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM8250 UFS PHY can run off the same initialization sequence as
SM8150, but add the compatible to allow future changes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 5 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.c                    | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 54d6f8d43508..5ff9e7ab6001 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -19,6 +19,7 @@ Required properties:
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
 	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
 	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
+	       "qcom,sm8250-qmp-ufs-phy" for UFS QMP phy on sm8250.
 
 - reg:
   - index 0: address and length of register set for PHY's common
@@ -69,6 +70,8 @@ Required properties:
 			"ref", "ref_aux".
 		For "qcom,sm8150-qmp-ufs-phy" must contain:
 			"ref", "ref_aux".
+		For "qcom,sm8250-qmp-ufs-phy" must contain:
+			"ref", "ref_aux".
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
@@ -103,6 +106,8 @@ Required properties:
 			"ufsphy".
 		For "qcom,sm8150-qmp-ufs-phy": must contain:
 			"ufsphy".
+		For "qcom,sm8250-qmp-ufs-phy": must contain:
+			"ufsphy".
 
  - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
  - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index c190406246ab..50cbcdce3680 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2536,6 +2536,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8150-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8250-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
 	},
 	{ },
 };
-- 
2.24.0

