Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 508844A6D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 18:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729414AbfFRQ0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 12:26:51 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38707 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729327AbfFRQ0v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 12:26:51 -0400
Received: by mail-qt1-f195.google.com with SMTP id n11so16061784qtl.5;
        Tue, 18 Jun 2019 09:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U4eue9QD2pPeVeT2ai/iFEEFKk30Y43OtLfqYls/35g=;
        b=QagC7sW2bP/MUt5RWlCOg9RwanF047NS3Fxmsmc18LrlD0Sa0izH8axZtcjB30+LKa
         hlr1db+5X7V6P5xy0HqHuMUPfZ2Kmyfswm+8a5SS5MJR9wQDfm4SrZUlC8XVxcgPgWBC
         IaYRYYMkP6xP6lPXk/86DDK2aPpvpnyS2ehhy9fKxRw1WMEI6hpd3302+QxFCTyNqgNZ
         TqebdJctCE1dmPe1iiRb7Fg5lHdTMKUj9eCEsUju2dgOLKMcn43XvdValwzjWaxMJdhc
         ZXx+laY/VRDZ0gdAb1AbAlNDl/+UsD0o55tl08QF4MKXyzA0v1gmJmIH88IncqC4aqZ0
         5GiA==
X-Gm-Message-State: APjAAAWa5vlAmCboCFC2rE8i9bXT2q442bFCJMVI33VwMW54IQWUaMcM
        emyb0QPYvaY5cU6U+M8kFKQomSU=
X-Google-Smtp-Source: APXvYqzzE34RMcgJY4arI8Ax7Qc+Kv32GC1vmCbW+uqEcP5YgCl0IgU3X47Rkrvutw6NRZBCeT6n8g==
X-Received: by 2002:aed:3e3d:: with SMTP id l58mr51774215qtf.382.1560875210544;
        Tue, 18 Jun 2019 09:26:50 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.192])
        by smtp.googlemail.com with ESMTPSA id a139sm8936713qkb.48.2019.06.18.09.26.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 09:26:50 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom: Add missing schema for IPQ4019 boards
Date:   Tue, 18 Jun 2019 10:26:49 -0600
Message-Id: <20190618162649.5901-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The board bindings for IPQ4019 are undocumented. Add the missing bindings
to the schema.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Note that this doesn't match the dts files as they don't use both 
compatible strings, just the board string. They need to be fixed.

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 04867577306a..54ef6b6b9189 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -119,6 +119,11 @@ properties:
           - const: qcom,msm8996-mtp
 
       - items:
+          - enum:
+              - qcom,ipq4019-ap-dk04.1-c3
+              - qcom,ipq4019-ap-dk07.1-c1
+              - qcom,ipq4019-ap-dk07.1-c2
+              - qcom,ipq4019-dk04.1-c1
           - const: qcom,ipq4019
 
       - items:
-- 
2.20.1

