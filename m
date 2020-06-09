Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832CE1F3438
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 08:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgFIGpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 02:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgFIGpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 02:45:06 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77919C03E97C
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 23:45:06 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id p21so9848433pgm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 23:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wG0+Ch0zEKVHYp36DijWu0KUj1hShzvRRIkz+3ay5qE=;
        b=eo7EGmCNTTZuRXco4dtjEewlalbihfhWZ92VRyRlC+hp0KEiurSKf8rbQfi35M3dBk
         og46Fc4s2Zaxy53+xSjIJ3qOqe7rThwMbqWbXpyVVMYCiXGUNXxDyVg650iJMSVrOpnK
         3VafbWDwORzv44nThFbpJyOSZ2j1QV3aN0tbbI1TKtabsidLs6xGT0kkCNQYZNnNOre4
         /piRqfuRpNBzpTHBvwBEDFc8QKZPJ88zCqvkK1fcpXB/L3HhStcOj9JLk1lg2cf/TNGm
         9RgiwJr9ZdL7dkPtxqBLdoNvNyE/KHWf1srG+wPmFsxHFArQB+/A8m5cwnSS5dhRyCHT
         eTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wG0+Ch0zEKVHYp36DijWu0KUj1hShzvRRIkz+3ay5qE=;
        b=F90OOV1aX0Q7WScfKyf8oyOAh4FZhuGddKPQTZGGwV+RubiJ1wmT+vD2fAUVq1JSZI
         yegoKciJA/psULzbIcAMMcay/wK4NHhWyZ1kglFokLOFKUElATWa8lksKU/jJZnEvlFK
         0tWBdMyH9bg1/8sK/PhFAC3OOeciMCS3quvr9cY41LZmwDrkNy9vKs+2Z3SxyXjZdOSg
         dNFNxv7fvwGLksc8Bd34wAg06pPjYVFqZiLUwdvXttKC4XsgaNdwgu0QrEMaHNhH4ubK
         fTWjzViD6jReODT8caJsWyR0xTxWYV9ZT0HldRh889P/3trAayn8eQWM9WXcBcYN+r4W
         wnrA==
X-Gm-Message-State: AOAM530Osd1BHlTJmXvRYySQVSzQhLmuR4BMpnxHIcVw8HFSn/ja9yDn
        ti4/32xcD0QOMlf/LAIPm8yXgg==
X-Google-Smtp-Source: ABdhPJwz7++0CVF/zOZpvNRCw2+dYOuiyk1fQ4vdbnMmIu9rwwTB/PT4eXeZ1O3doDx7mC8j+9ezAQ==
X-Received: by 2002:a63:9304:: with SMTP id b4mr22660320pge.229.1591685105957;
        Mon, 08 Jun 2020 23:45:05 -0700 (PDT)
Received: from localhost ([45.127.45.147])
        by smtp.gmail.com with ESMTPSA id 4sm8830988pfn.205.2020.06.08.23.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 23:45:05 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codeaurora.org,
        manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: thermal: qcom-tsens: Add compatible for sm8150, sm8250
Date:   Tue,  9 Jun 2020 12:14:54 +0530
Message-Id: <c3361043e66139812bd4cd85b917659d85e1564f.1591684754.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1591684754.git.amit.kucheria@linaro.org>
References: <cover.1591684754.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added tsens bindings for sm8150 and sm8250

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 2ddd39d967662..dee3836a82854 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -40,6 +40,8 @@ properties:
               - qcom,msm8998-tsens
               - qcom,sc7180-tsens
               - qcom,sdm845-tsens
+              - qcom,sm8150-tsens
+              - qcom,sm8250-tsens
           - const: qcom,tsens-v2
 
   reg:
-- 
2.25.1

