Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8541D48ADD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 13:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239745AbiAKMuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 07:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239712AbiAKMuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:06 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD16BC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:05 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a5so28810072wrh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmXOIfjBUAj2E5aaJM+b5diPgir+YHhRfXhbVZ4gAlk=;
        b=ND/f5KPPXnOpKh5hWem2FeQbWvHjSVlLe8BLb3EqTT2V/LL+gDD5Mm5tNQi4O9rFSk
         f2Nm0noKkGOcNUpGTp7u2yNwaxz3+COmQiGTZZB1nIIx0mzHsUd73kuGDLGGXzjrp0vF
         TMArQqLMTiIwqwMnSmf0v1V8QblSJtWGtNWTLrr2FnwzlWN3UMlqA0Jq/Hz0cvEC3sc0
         deg1GbXQsukuq76Rqk8Dl9LblFmrJaTUqzc/2+IjQriV6WiZ7aP0Kiy+1hNicsPaaNmx
         okP1WtSp2lBBA8dyq+32NnaxG+EqhLZ1bNURAgxKetVjyMnkquFAfpJ/y/o+agG0bolr
         k+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmXOIfjBUAj2E5aaJM+b5diPgir+YHhRfXhbVZ4gAlk=;
        b=xS2VegpeBeOtJWnSh6E5/3z7DDUldmQhXW62LjUwmXP2lbCUXeeeT+3jGemRm0TApA
         IbuVzQR0lBgQ36St15pJ6ohUm1i71uxXZkYkmPd2yt2G1rDIw9qLRNbP9QJ3SNFAn0gE
         Eex79jKASVdHqHmSyhe3JolEg7RWj4tL5h97X/80xhPK+aOKi7qLkTuyxXd8AjUAstw0
         UDdLz+dd7m4rOST8oMn5p4BnwxEhPypmjY0DLg6uqUjLVsGvLHUUE59orQ96njmyNpA1
         WblCEXAuolnjpj29SK59A3+czdcYZEwdosak1pxzDyMcrhF35vmpsjXN6Oqm+JRZoYMn
         swIQ==
X-Gm-Message-State: AOAM532D41oEALeOr8Rh9FwC+YJuVx0EQrInEhDaMPtPt8GTHeERfBhm
        Sjo6DchLS0kd3zmaA80hFxVQNoA4ASIbhQ==
X-Google-Smtp-Source: ABdhPJx+6XfY8IEEQAii/IxhKBYAwgqnbOMDryb3jJ5Ie5tLfQuzVFc4eBgKeLlO8gYbobmOmKLIKA==
X-Received: by 2002:a5d:5982:: with SMTP id n2mr3777611wri.582.1641905403927;
        Tue, 11 Jan 2022 04:50:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH v3 1/8] media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845
Date:   Tue, 11 Jan 2022 12:52:05 +0000
Message-Id: <20220111125212.2343184-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
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

