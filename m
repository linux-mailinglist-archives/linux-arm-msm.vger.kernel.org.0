Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25F24666A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359038AbhLBPjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347887AbhLBPjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:08 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D9DC061758
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:45 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 133so111019wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LYQGqJMfgc7jR1a1+ImqZ0zlW3EDtsH9L040HbPLdGk=;
        b=fdMORNxgrvl4lm37HGHplQTWeUvT/lTgYQwqZQVSOyUALLw94w/JNDsaaknZJPSf7n
         9s07R+auMDvzEjythieh7dM96upPftfVdigD/a544cEE+gjk8p1XldFZJd8bskN628q7
         ioHKnd7IkSk2FFNXjCDMm14rKFZKuoDLVkgCuW9J+24r3NiEKk1tQCz3rjX3XgND2E2j
         IVFjldpsGWXlV46UoH29JSN7VmAcuQhQOUnHfqxpij7fVt6jNz8ZkWOYopoUjBJ0UJxC
         bwDsm7zqsLwCUR5L2a0QSyD5E0a0ibWaP6wZgvD3bfXxg+JWEp85HUsVWdMvEgIxfLnx
         WFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LYQGqJMfgc7jR1a1+ImqZ0zlW3EDtsH9L040HbPLdGk=;
        b=aoWS+HkToVdoftCtjGvG4eNYiQ1x9g4ae8rZAbnQ4d29lBswhTkMHRakBZ5YgaGuk+
         8qFm26WoMBP4xXbXoLemagKb1mxNLrLOsydr0GDVC0Uj3TFaBMQ9F5gyV2wc01KMRPSs
         ws4dUDhqEJSaEPRMiYci8jkW4j832QQ/x/WnwWpgv53zqV7ED0/vJSgji+ONNaBAjQzA
         LG/xbarl+QSTkEe3LbTBEehFH5WkblkIZPKC38XV0FNpdzfBtf/18h8BF2xbtzzPR+QP
         CTm1vyxcxTgjjMNdlid2XHKPjqNwqZp1R1Cy7Ji47FuNzCeAJ9Uis7tO4/p09mehZ3I1
         XNuw==
X-Gm-Message-State: AOAM533ZaFpXTAJsO9anP3nTSwAdxebefzL/JitGUJiwXOml9u/XhZd1
        LIxo8/Ah6VasV5CJVGeiH3lGgZvkbkpkkUk8
X-Google-Smtp-Source: ABdhPJy+PE7fbRp+X5iIPGNVGWsqUEjISavkVfDNTuIdEonU/N5BgHxs7Ms+1kn2Dr8coEWb1Fd0Aw==
X-Received: by 2002:a05:600c:2297:: with SMTP id 23mr6893476wmf.73.1638459344066;
        Thu, 02 Dec 2021 07:35:44 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:43 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 03/19] media: camss: csiphy-3ph: disable interrupts
Date:   Thu,  2 Dec 2021 15:37:13 +0000
Message-Id: <20211202153729.3362372-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

The driver does nothing with the interrupts, so set the irq mask registers
to zero to avoid wasting CPU time for nothing.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 35 ++-----------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 5948abdcd220..783b65295d20 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -352,38 +352,9 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	else if (csiphy->camss->version == CAMSS_845)
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
 
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(11));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(12));
-
-	val = 0xfb;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(13));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(14));
-
-	val = 0x7f;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(15));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(16));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(17));
-
-	val = 0xef;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(18));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(19));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(20));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(21));
+	/* IRQ_MASK registers - disable all interrupts */
+	for (i = 11; i < 22; i++)
+		writel_relaxed(0, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(i));
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
-- 
2.33.0

