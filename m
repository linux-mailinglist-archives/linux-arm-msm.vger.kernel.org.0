Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9528445CB8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350037AbhKXSAk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350023AbhKXSAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:39 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4C1C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:27 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a9so5701778wrr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VaypeNrUOCg7S0K8f6ZLIMgJdldXUrMIgt398GOYj4Q=;
        b=MnC0kGtW7dI1S7FYkLP3xSw9Gl+C4ZmKYI5wRcpy/NBMBvZ2bvZi6bTCF2iWpmvRyf
         vafqsrukn+xXsvRurRlF0lCDPEqpv0iddv06Er3MPXqX91fPyLvmRsedNINvBdzSD8LF
         jVOwkMLJjfLjeP7Smp5BS69awzM/hMoklm2Qa0ng74q6vtinGp5RaZ+WwVzcetrCPkEC
         ynisWsyW+qGxHclrTvUHg4xEhbV4Pk+NIC5TjrEs0jdgdee7MWUxthNWGTlf4iAARwdY
         YYTFY/TRM9C+6AoIQQ6YUJZ0k4KI5cDsiX82S1Q4yfuoI9Y6wf5IfxcdEVSZ/MEy+pWa
         ynQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaypeNrUOCg7S0K8f6ZLIMgJdldXUrMIgt398GOYj4Q=;
        b=FED8Q1W6bZ3beQYYYk9NhUWYA6UvtaTARiEwXe2IgCL2MijzlbxiqUczlAV+ifMl75
         6L+1PU0aHKNCEwqMpWfmmLXFgCVch6GlhKxdXnXMWAo7oqHZv05TAEbrGbnsEv7qWLLs
         mhmr9gwEJQGjtJ6fj0+lD0VRpp3FVgPKTgIdXyr26kriNORKbIfpz9mQf2cjzb165yRB
         6F2A8r2XdhSTT1XleVNy8EEv55Pz7mvwx5xMCPztenBO2lL1OzzjHhJCs8s9NRt1X8g3
         ZyPB8hJTgld2qEplX5+f/zgZSe1YY7v+C6kp13+Jd/m+U4SR9qgUltyoZS7pKpQ/eeGC
         lgkA==
X-Gm-Message-State: AOAM530PM2hEgAVL86yXAZmFw5YcpapACSgJIUQlnAxdpoZsPo3M3SVF
        UncxhCK4MgCeu9gapnpRkAU04wLe0YqszmC6
X-Google-Smtp-Source: ABdhPJwSkY3VqdPUrKeMLvGKxdo6u4WGalKcGuEPZobOJmKc0AEKt3cI4LZwPYzBCntObVSmBRXMrg==
X-Received: by 2002:adf:d202:: with SMTP id j2mr21358430wrh.271.1637776646078;
        Wed, 24 Nov 2021 09:57:26 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:25 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 07/19] media: camss: csid-170: remove stray comment
Date:   Wed, 24 Nov 2021 17:59:09 +0000
Message-Id: <20211124175921.1048375-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This is a leftover from my original patches, it doesn't serve any purpose.
(it was a reminder to figure out how downstream sets a particular field in
the register).

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index a006c8dbceb1..f0c6a72592f9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -442,7 +442,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
-- 
2.33.0

