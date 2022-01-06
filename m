Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BED486E18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343553AbiAFXxi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343558AbiAFXxe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:53:34 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9AFC061212
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:53:34 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id w20so7819651wra.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZhVNeBs7vzyROSZpuaXTYGD6xm3M8v73/QT84NJecB8=;
        b=KELKSau2oT1xFvKyY4DFAazfYbzPxhQjurxYQ7oGWGYC/Zoi+50GPAqgyGKqcDqn2C
         iQctGcVW/Gj7LckFzmhfdi5e0IK64tT0NYUzAcHZwQsUm7vOmBrAmmZ29RrZ4gvNNEyQ
         mDzcfFw5s98q5VRszP/PdBGw8lXG3SFsiQP3YCs86b/+AXDabQJ+QRqGbx4hIoXp4H2E
         I95jDjs8LXtZNcJgSxZB+sSug8uil2v0Nsjy+cdCZT1/cI/Ifm/S5SrVMwewsWe7wnUC
         geDJMmu4vunOHhxagzTL4nuV28Ow4ZsMmSmUhyzH8UaYDGpIOjM8QXikNt9YiE+vQLXy
         bycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZhVNeBs7vzyROSZpuaXTYGD6xm3M8v73/QT84NJecB8=;
        b=dhKRr7M8fi6eS38L2UStUH6Mbqacmoxkinjdc2yHxsD/Pbppxr2FExe5qL1nMCSERs
         gPGm5IPZUympOFuEkI1bkBH+K4kM+L/nZoch7+uecgEaV1iAHSYPODfKAOvO4cPO2S1l
         dOsvlLX1XWZ0/TaFokt33E3fE94BJrBnDmxTavqXfV9ZYS9qeMuy1KAcBDnkRZom6HwP
         bFf+4/M1I142l4nonRjsEya4K82lauw+eNhqMkGnuITJaMbodlIW/9Fel374dkMtX+XH
         u4h/qLOflnR1y34m9JSCO5pybqamx+9zjzm7s0Xgs1jVNHZerurJkVLB7Bd15FeuN3Mf
         +wCw==
X-Gm-Message-State: AOAM533uKCHHX/mK0ZyHv0g6Nl14dRuoxTKYkQdqdROoCtcV7BgoKwuW
        xtRJN5h7Thin6XM2oMHIHBh0L6OshcUfDQ==
X-Google-Smtp-Source: ABdhPJxNkiPwZGI9s6xwMmpjSZGfhkE30arbomWtE9DxFEuHxXFWrpOqKPlUpHA+TJYMYrUdOVOaPw==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr6818343wrw.695.1641513212564;
        Thu, 06 Jan 2022 15:53:32 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a71sm335893wme.39.2022.01.06.15.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:53:31 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 1/7] media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845
Date:   Thu,  6 Jan 2022 23:55:34 +0000
Message-Id: <20220106235540.1567839-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
References: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we review the schematic for RB3 Thundercomm document Turbox-845 we see
that the CAMSS CSI PHY has the same basic power-rail layout as UFS, PCIe
and USB PHYs.

We should therefore have two regulator declarations as is the case for UFS,
PCIe and USB.

Cc: devicetree@vger.kernel.org
Cc: robh@kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sdm845-camss.yaml          | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 9ca5dfa7f2260..ae0642b9ae5ec 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -203,9 +203,13 @@ properties:
       - const: vfe1
       - const: vfe_lite
 
-  vdda-supply:
+  vdda-phy-supply:
     description:
-      Definition of the regulator used as analog power supply.
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
 
 required:
   - clock-names
@@ -217,7 +221,8 @@ required:
   - power-domains
   - reg
   - reg-names
-  - vdda-supply
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -361,7 +366,8 @@ examples:
           "vfe1",
           "vfe_lite";
 
-        vdda-supply = <&reg_2v8>;
+        vdda-phy-supply = <&vreg_l1a_0p875>;
+        vdda-pll-supply = <&vreg_l26a_1p2>;
 
         ports {
           #address-cells = <1>;
-- 
2.33.0

