Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB6A15AE62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 18:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgBLRKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 12:10:05 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34506 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLRKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 12:10:05 -0500
Received: by mail-lf1-f68.google.com with SMTP id l18so2160468lfc.1;
        Wed, 12 Feb 2020 09:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cjHiT6RRFXiQSDQh4c1GDiVmntAwjJ8KdHguwFFGoXg=;
        b=nYGyzxclTFrvD3tO5D4Eepi4o6/d5y1RX6rQtbAFr2lCFeoQXrJGaVVwBIbMhG9BPs
         9Ezut2DvJP/+/BduqEvSOjS/46jcImXTzjohhIpWAX+kRvY31SgTubuW0WJCZ1Spz+gQ
         xUwNPiXJkxXh/hgB1PGVhUtOEMlSvJqJ8aNC3X+Bz6+vet6wC7mP/DtMNNtq6yZ0+SXU
         7qqYAA+aALa77JBXeKh8P2PwRDoX7CbqiVZnYvZgaqd3synCOyZo/HGJzH0JHC5Mlrnd
         4/wR+PrHJzh9bxASG/AABS8xlvOyvODW0rpW/GWc7cesATesbyiJ+LatXeLxeGNzmzFO
         QxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cjHiT6RRFXiQSDQh4c1GDiVmntAwjJ8KdHguwFFGoXg=;
        b=Y6lZEWuQrcFOyjaRwLDnyp1hoS9W7kDQ+BNSIGmXfeH4VgXcETB2rv5y36QRzow7Uk
         Wx0zZaF4I39YXJiwsGBDFJV2Rrdee+sd7VhoDkk195BcQYVWpDl6FpdEwICTc4ZWMU/0
         2jixKZHu6bVhs+4Oxd5wEym84Al/T6vGceviBwtVSH9DB/hSFvJdpGuRD/Ml921RF1Ir
         tZoEjLH+9LWtUGDFYkKNq5MMFYHFbZZ693l4N6rYkMH6UUDYocWpk5wt0FlFbhxYNBEf
         lj4yZo8XCI3B3zwTF0r6LbJM0KLzn5pmc3cTxd+AqruwIrI7rbTpGczKdNvHkcEMguO4
         wyDQ==
X-Gm-Message-State: APjAAAUEuVyZdBBIH4UHlpRSNyzO+Iiu1Pb2OpO4bmRJeM3bxLoY5V5N
        jxIzea2aFm0OBN6G8YGzh4Y=
X-Google-Smtp-Source: APXvYqwwT5ySWGtYWNDd9YZbv0RXnQQoklx1lta9yD2GGySrGTDWNgJEg2MdHlboBXXtkAm/h8Gsag==
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr7044299lfp.96.1581527403714;
        Wed, 12 Feb 2020 09:10:03 -0800 (PST)
Received: from emb-minnehanov-OptiPlex-7060.collabio.net ([77.244.21.162])
        by smtp.gmail.com with ESMTPSA id b20sm607955ljp.20.2020.02.12.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 09:10:03 -0800 (PST)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH 3/5] dt-bindings: arm: qcom: Add sdm630 and sdm660 SoCs
Date:   Wed, 12 Feb 2020 20:09:14 +0300
Message-Id: <20200212170916.7494-4-alexey.min@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212170916.7494-1-alexey.min@gmail.com>
References: <20200212170916.7494-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a SoC strings for the Qualcomm SDM630 and SDM660 SoCs.
Also document the new xiaomi,lavender compatible used in
a device tree binding.

Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 529d924931f1..c5af92acd427 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -36,6 +36,8 @@ description: |
         msm8994
         msm8996
         sc7180
+        sdm630
+        sdm660
         sdm845
 
   The 'board' element must be one of the following strings:
@@ -125,6 +127,11 @@ properties:
               - samsung,a5u-eur
           - const: qcom,msm8916
 
+      - items:
+          - enum:
+              - xiaomi,lavender
+          - const: qcom,sdm660
+
       - items:
           - const: qcom,msm8996-mtp
 
-- 
2.20.1

