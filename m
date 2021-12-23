Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A643B47E06C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 09:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347111AbhLWIcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 03:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhLWIcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 03:32:02 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93370C061401;
        Thu, 23 Dec 2021 00:32:01 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id t18so9911509wrg.11;
        Thu, 23 Dec 2021 00:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klb3GZipUxVE87hG0mDNNofCpYIEj1rlS0izQpUwlS8=;
        b=F56nNZrVXAwG7hGDjr6a/WM4aVnPR2SPX9X8rNb58sVDA27UYge8H6eFio1wwRxHWj
         d2vQ7uiS/1SV1dG4bmizeHBRLWurtbYI4iYXtaiPoG0qbaktBimW+Cwo6yJEIA5w++KA
         dJ4cdgakjtWfTyXcPQbLna5qmCboQ/aFJve8GNLg3SJZ4TNTqvF6SCC8pzBB6nj4XP5O
         iPrsQYFqcGwkmNqo9XkFMzQn/6Cf/0SQL0A03bUFz/AnyCEYXDA3l54+Uxn8jkpaRDa6
         tfjnXbAcETltAyqGsKZATVSgymWjqAWj+bq0AjCM7Ymg7zXNrT1zrDIuYbbfdrF+JeSS
         0Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klb3GZipUxVE87hG0mDNNofCpYIEj1rlS0izQpUwlS8=;
        b=Pm+mgLz9T1H7Ls3DVUAu9TQseBQSo9nLqJrI0wj8waNkowxTnEEU7tnwQZ/+Xbqc2u
         LRt/VQ1dWz/VXvVH2VMaYOEYQGHilYv24Dd3ba/fI7SXxAeZ9sULseKPO6+ZoPIHvm0U
         168vG+5us190Aa7uQlKpZaFst56ajwnpHQKyA81vcKZwtceCtD/52M7pxjR4gFUn6vIX
         QGhtbvUXhU2/y2lydOc4OvMEbx1YPNDy+w2nJLNTv2D+HN/kfoory4DySGJ4Gcm6AgKc
         BcMEKX0vly8CMerVIul3hhwlt61xFWJBRyWGKly/DPOFU23o6WIQH85k3Td1DKvdmw27
         4BLQ==
X-Gm-Message-State: AOAM532S5tKRHD/TFlwbHu7FzYdVZsKNvDi7Aj7XAmqBLBMghCe0topa
        TxAp9wO73EWHvOMrdqt5co/4tuzeDlBndA==
X-Google-Smtp-Source: ABdhPJwYyQc6ZEDrt39JdadKzcG6/fNWd2FArcNGolGL/oHzn0klZQRMXDHDA3MsX0TZAGmA6fLP9Q==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr931702wrs.55.1640248320188;
        Thu, 23 Dec 2021 00:32:00 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id p21sm4038277wmq.20.2021.12.23.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 00:31:59 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: Add compatible string for msm8994
Date:   Thu, 23 Dec 2021 09:31:51 +0100
Message-Id: <20211223083153.22435-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add msm8994 SoC specific compatible strings for qcom-sdhci controller.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 50841e2843fc..6a8cc261bf61 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -17,6 +17,7 @@ Required properties:
 		"qcom,msm8974-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
+		"qcom,msm8994-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
-- 
2.34.1

