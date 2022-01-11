Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C8348ADD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 13:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239842AbiAKMuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 07:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239712AbiAKMuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:07 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD652C061751
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:06 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o203-20020a1ca5d4000000b003477d032384so1743486wme.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9u71FfotiObjjzKGzy6654bDamQZcE+O+lmIbhxS87w=;
        b=oBeyHuy7A1QX70qum6EWV0rpAB78Hh2C9miRoCM2LADsBEiTA4YkPmQIdRVYwtTNRY
         kF0rrJ4cFXVsTXA0H6UTX19Ngcyq6Zu3DN/+BuLhnm00sxnk7cSr3kXouhrdVw+xH/P7
         yCQBQWA8f/5AWUU7z1Mr0XxXD+LQ/t1ZHkslG1zlxts7xu/6uw4tOMzrZC1htkSgktfc
         gfJmVjhpVwz46vEkI85OlLZfHO7IxRvcqBRkQfKRRFHdxgWxaYyg7NZZhIMZo5TTNmHn
         phouRFzB8Ud16kZqgEoGVwHTIiPG3mFKEQcdEw8hvMrg4XZ250dh1UU1LKiOt5Bg06/T
         rwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9u71FfotiObjjzKGzy6654bDamQZcE+O+lmIbhxS87w=;
        b=feAFwEp3nRFtqE6nZGBw1TXfNV4pfLaEcHPSnqgYlFodYNCNhJjGkqNk1lg1kLoOUu
         n0HbyRwgl1uFUeVzRciSGitVxC+afXUJhTeCFQbduwk+jgCcuoeDmmhM0zG+Ujx3yqLX
         pF/eTh01B02nTprItA0f2tRyoDYpwnk34bnxu6ztABhQcSt2z3HcegCKUu0oR+rQssia
         tsQS10Bz5BAWHdoY1txALzlxD5HzCysCgDPzwy67GhP+V4NqAfsJ2c8dsCwtXomCPO8H
         m49CVxs9vlhVIQN3C4poRoCc4oHa0w22v8gvlPRhSLW80QXRwp+4WYxcToohLzkVvQ4d
         pGfQ==
X-Gm-Message-State: AOAM531WFBoMvXq3Zd7DpeZ45loSm5xultgCeLEB/yNWAnCHqwTncbqe
        WAMsAZzuWer2WukI2FA9/FTLTuUVczic+Q==
X-Google-Smtp-Source: ABdhPJxvs2jKKKvCwIvaCFBhtVhrLkBry5rug9Cxs1rAi5M7+aIt9svUFfTnNzJjJazxy+6DP8mTpw==
X-Received: by 2002:a05:600c:4e0f:: with SMTP id b15mr2311823wmq.179.1641905405125;
        Tue, 11 Jan 2022 04:50:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH v3 2/8] media: dt-bindings: media: camss: Add vdda supply declarations sm8250
Date:   Tue, 11 Jan 2022 12:52:06 +0000
Message-Id: <20220111125212.2343184-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in missing vdda-phy-supply and vdda-pll-supply declarations. The
sm8250 USB, PCIe, UFS, DSI and CSI PHYs use a common set of vdda rails.
Define the CSI vdda regulators in the same way the qmp PHY does.

Cc: devicetree@vger.kernel.org
Cc: robh@kernel.org
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sm8250-camss.yaml           | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index af877d61b607d..07a2af12f37df 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -265,6 +265,14 @@ properties:
       - const: vfe_lite0
       - const: vfe_lite1
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
 required:
   - clock-names
   - clocks
@@ -277,6 +285,8 @@ required:
   - power-domains
   - reg
   - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -316,6 +326,9 @@ examples:
                         "vfe_lite0",
                         "vfe_lite1";
 
+            vdda-phy-supply = <&vreg_l5a_0p88>;
+            vdda-pll-supply = <&vreg_l9a_1p2>;
+
             interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.33.0

