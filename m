Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDDC2EA7E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbhAEJsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbhAEJsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:06 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670B1C06179A
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:46:55 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id hk16so1384647pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6ZtUI4Q1Kv9KoNZEzoxKYY3jMlU4aqhIrm/Qzwt2c4=;
        b=IqfZ+0JlcPO/0fdghcVD5HMjwJRSj3ILQCXHtqVd3MsXiOgcBW79R1FU9U+RCrUzuL
         o6qefTTjpGjlCBXdr+DIfWfqPQ1ln6ANDE4Kr0/TXvH0rUBRRJowRP4dROoRAwTN5k1M
         5DrP7iFvZXRpEUdpMnwIQ/Qg6r91KkRTYnte/uMEyw/U4Iv+szIFp7ZL/s3DTmAHd7Qa
         9UuNkzgBbkhN25Sg1cZy63BafrYzoyks385n5TJFnIgqz/scMZ+BQ7Z8YhM9Dx/HsNJP
         hNqU1hzRtOr9JQ96V8dIQQcoV8FMjqqV1H1iIZjEB1+U5eqSEzi2NYDDp1rYy7qlBF7M
         uqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6ZtUI4Q1Kv9KoNZEzoxKYY3jMlU4aqhIrm/Qzwt2c4=;
        b=iLxperWVoqJYnZNLahkUYPGmjh8gsGo+6o5JXS7QAcCaCOXWQI80lKb7tdPTc7bkh4
         AUERqVD8aR2Kzmv3oQ+8bb5g84I8Fknv3G2SST/RS/1ysE0/OVAp0Mu3zu4Z9mCR8ve/
         vHyXZ8+HUMMhKOg9zElYJfbdpI9XSqFcnS7VzeJTZYSq5altN8I/uimVZs9t97pBaj/p
         vcXuP/o5llAAVDK+2K3PSMG8cRILVEa71Df94M/unJlB0Gfte/6a+YEiui6s9yaXaiiv
         8MixNmf+EnRJfCfAWz04RFx4SFA8hHDn7IrE7b46kqt3UACLa/iIqODsLSp3chHLALMn
         /VVw==
X-Gm-Message-State: AOAM531rcRMpSu4UaS2vI9JFP4JLYi7JXLihKkd6AODPfcsyLh1lyB6r
        ECxQ5fw1CkEPb3OkKBLEgtM1
X-Google-Smtp-Source: ABdhPJwdjtf7ZxrFvOutgpEuMZ/Fbn0O2zhvjfCj2mZbSvhf7tqZ/2tBGg2gBBXspakdgD+yLNisnw==
X-Received: by 2002:a17:90a:77c1:: with SMTP id e1mr3326064pjs.141.1609840014897;
        Tue, 05 Jan 2021 01:46:54 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:46:54 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 03/18] dt-bindings: mmc: sdhci-msm: Document the SDX55 compatible
Date:   Tue,  5 Jan 2021 15:16:21 +0530
Message-Id: <20210105094636.10301-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDHCI controller on SDX55 is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 3b602fd6180b..31f4a5628595 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -21,6 +21,7 @@ Required properties:
 		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
+		"qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";
 	NOTE that some old device tree files may be floating around that only
 	have the string "qcom,sdhci-msm-v4" without the SoC compatible string
 	but doing that should be considered a deprecated practice.
-- 
2.25.1

