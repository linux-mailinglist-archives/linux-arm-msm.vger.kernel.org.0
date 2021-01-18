Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67A82F98FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731009AbhARFLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730122AbhARFLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:11:34 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE92C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:16 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id q20so9504337pfu.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pHI9PJDZ4lLZo/sEvf3uvSbpMTTpR+8Xw+81k1KJyJc=;
        b=dOaorn99d5yRq4LT1/LjnW5aWCZoABYq0NtrkrXHVlaQYAPZnqIg+iI/kJZn6oENHg
         2wrSf+2dqr2V9zzCrSuqPUfagKYvz9aoQHD1ILOhTfPXOGbpvAko1w31exGPaDPm0ocX
         YEjRhWiBZch+TIUFYKWmPQx4Be/lT7XkbckqImWyKo/a5VsOMRf46JpIigZg9h+WE64d
         h86bddUuPWWs8DCM3uRZNnZE/vsOtN3qcHnmdDfsj+GLRfVdrGeCS7Jcil1urCyN3H7w
         s9JzIYk2dUroYZ8aJJeCDfnSFJRESNMFi6rQ+cPS1Anj7S+s2sLE9aOVpHSYyo4Pvi0Y
         uulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pHI9PJDZ4lLZo/sEvf3uvSbpMTTpR+8Xw+81k1KJyJc=;
        b=QstaEIZdI+2Sm1ujrfV8ELsTNSwIOg7JYt8XeV0pcWy4EI+3jz70SG7KKH+zzbKZ09
         asm5pMxr848EQOeqCWeYbnOdDxC8O4G63Yw+34bAf6Tk/16n4abikd6B1qPASQIxOj75
         z+ajR6jP2oxMAHCSswR26SD5vJmxWV9iXoDiYZ2RzFI/m0tEWpUXj3qYys7dTLdPniyL
         m9sFpJKns/lpUy67rgQQcttBx2+7ZYruFupyjHPz5KjAOTDzv3ZEWUX7Y20ffOzXSqKU
         1ZjGUwcRBRMrBB6C9UzsYwYBJjJ0nxdUojhrtH5BQAPne7urhqkp7tIts0xDG+AzF14R
         L6dw==
X-Gm-Message-State: AOAM531UnpR/CRtTfVdeX30PNCR6OSXrTPJrBu1rMbHFGb/qv5JCUBAY
        FDWmI9wcJ9FV1lXRjoPjitiH
X-Google-Smtp-Source: ABdhPJx0B9pAlQO/jE37qJCOimQMmUmIgC7xP6onVLVa04ASVNfk7vin/9IeStWNo8BOxFYoMpg83A==
X-Received: by 2002:aa7:82c6:0:b029:1ae:8580:9b55 with SMTP id f6-20020aa782c60000b02901ae85809b55mr24830988pfn.72.1610946616127;
        Sun, 17 Jan 2021 21:10:16 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id j3sm14703571pjs.50.2021.01.17.21.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:10:15 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: usb: qcom,dwc3: Add binding for SDX55
Date:   Mon, 18 Jan 2021 10:39:59 +0530
Message-Id: <20210118051005.55958-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
References: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for SDX55 USB controller based on Qcom designware
IP.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 2cf525d21e05..fd93b941f07a 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
           - qcom,sdm845-dwc3
+          - qcom,sdx55-dwc3
       - const: qcom,dwc3
 
   reg:
-- 
2.25.1

