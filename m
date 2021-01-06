Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A43E2EBDEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbhAFMzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbhAFMzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:01 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAD3C06135C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:53:51 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 30so2170386pgr.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1QQZy4nTcMZS1H/pSqUElj03pASMBM/FVGxS1OW0tM=;
        b=VUT/BPY5z5FqK3BG7CFZ4T9G+vHVjC18NtWumnYMps5nmN73Am9+QSe5fxVGBpk0Ne
         uBykCEjmbtiqLQ9Cowme6LK0QkGbFAbROVU/yRgRgY39zv+Ayh5M6qI7rdhpxdBhdQrF
         2b3lSXZh8iGvpSPpG7pGqkzeD31qNj/T6mqcwZX+eLF0VZSNVx+jZVXt+d4nm3atuiw1
         UefhmcjG32RTfPnCcSYxJm/IiJ7ciHxzYT/bUzCUSOzeYdOWCaidslwP6xDaIAN5i9/2
         IJ3D1dSB0xaBs54nTjd7wESoWdGnT2vhoAx2CRQbBymgMsn5EipFK0/LN6zh6sW0JA6o
         RCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1QQZy4nTcMZS1H/pSqUElj03pASMBM/FVGxS1OW0tM=;
        b=qy3wuSn87ylxeTCWo+jBFub0BFzSdjmosE6Gk2tHxmPWS3Ic7U7VE3HsUTVaswDTej
         LbN1TVoXDp1XsVGtMs0k/s9Iyj7wMjdSbWO0tJO1jcvZk2OakU7iYYmi+W7jD5+WzzSn
         CugFgkhJBOF4B4kyS+e/jEdk9TroXwany66K6S3XqeiqkKvcmPLrfRM6u5trJPWz3mnM
         1ZCncGM8C3qu1UTRp4LCVCH4dnupuhT5zV71O42+/QSuwK7IdMf/e5DUHZr5A2rjYSL0
         HzgUqZgKpuL7N+Hsgw1ErHz8oB9IpTGuU6gMGr9/5H8ipJKlaNcJeM0LIwSTfPsebvI2
         7OYQ==
X-Gm-Message-State: AOAM531+Kw0vtEaUrHZ0xpe6KpOc3F3GXjoa/DvUCkt6eTm1PIppbreT
        rAv21MtqJqSZi0VkhTWx3lxU
X-Google-Smtp-Source: ABdhPJzVadhU9fuvWw/FXRD8koVE9iZfw42dms6L9j95M2lI8vyqCU8PECwigSbABL6F1VjoXc8e7w==
X-Received: by 2002:a62:820d:0:b029:1ad:d810:6805 with SMTP id w13-20020a62820d0000b02901add8106805mr4008232pfd.63.1609937631165;
        Wed, 06 Jan 2021 04:53:51 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:53:50 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 03/18] dt-bindings: mmc: sdhci-msm: Document the SDX55 compatible
Date:   Wed,  6 Jan 2021 18:23:07 +0530
Message-Id: <20210106125322.61840-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDHCI controller on SDX55 is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.
While at it, let's also sort the compatibles in ascending order.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 3b602fd6180b..9fa8a24fbc97 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -17,10 +17,11 @@ Required properties:
 		"qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
-		"qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
-		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
+		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
+		"qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";
+		"qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
 	NOTE that some old device tree files may be floating around that only
 	have the string "qcom,sdhci-msm-v4" without the SoC compatible string
 	but doing that should be considered a deprecated practice.
-- 
2.25.1

