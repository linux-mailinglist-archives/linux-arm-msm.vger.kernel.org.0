Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6712545E836
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 08:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359118AbhKZHKr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 02:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbhKZHIp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 02:08:45 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D79C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 23:05:33 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso7381757pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 23:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S41K82TlyzNl7CcaiiH+u/JaFxF407OUxi3K6nruXfc=;
        b=Uov4MAOiZoH9n71UibBfiL0PLknrKMUEVLcZTqF5+4B54tzM5BJHoWjZB0MoDsPXBr
         n5Gbw9YHVI9CQq/St/ZMpfibv9sRkI04VqfRgY8JGVirGhsv1vKmlefT+AR5BZAV4kQW
         7Wbxdt8yejpNzNYv0v+1UjgW7mjzNIk+QxTmxSKTaMExIVJXj4/tDpfiAJz3jTjYneRA
         oNNOUm0FEDbR1R0un0UE7cAZpDMmHaUI8SEiF1aN8gc9u+SHXss2tOB32+ZZBzQtzvGT
         vOTeklKYQ2sTjJSXoRiSy65eNjsuXkDjSQYbfU9hT2cfOJpKsKkY52wpG4tGE6c9t+T3
         K3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S41K82TlyzNl7CcaiiH+u/JaFxF407OUxi3K6nruXfc=;
        b=qVC9AbdWCmx8kqXMxlpA4i6v1sN6yqq9qBuf2W+WVPKeAIzE4Iwm3mZ1lDoEtSqJq7
         glpRK5JqP5AXos3vyO282lQu8zQPn6LWaOpjv3VZ4sDCZHXaDZ0NAwQKzv9PHE0dm+mV
         sRaSfVcSuKi0uzIMKGY+Bn6FSGxi7239SXBZ+aniKPRH0lvan4OEfTUNO8jYaB/O7yUi
         4W72BDbWqajXvWEoMMSjwxIJmDALMrIYNRwoQYqM7alsMOnB2Y2v27+QwLTJyz1QANuB
         yMF3K6YqA3IsnPGbfp1iPpYtLPtODyGbxx8QEuvsv/KNUZ0kSK4Juz7Ne/Hl4zPIbSVW
         aXVw==
X-Gm-Message-State: AOAM533BFxN7WigTryv/lV2XKE5/UpLX3UhYg/ccewJ118ah4NINHhdC
        v41JDaSoaB2gl+P041nP4Cls
X-Google-Smtp-Source: ABdhPJzlUwFRFdxVEaPxyaiEw8xBo2gwPzIa/WiIEgIZqRZporwRCkVKYaDV+Rv9FKUrnEwYU1vvfw==
X-Received: by 2002:a17:902:e74e:b0:142:fa5:49f1 with SMTP id p14-20020a170902e74e00b001420fa549f1mr36045659plf.84.1637910332593;
        Thu, 25 Nov 2021 23:05:32 -0800 (PST)
Received: from localhost.localdomain ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id d12sm4042104pgf.19.2021.11.25.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 23:05:32 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/6] ARM: dts: qcom: sdx55-fn980: Enable PCIE0 PHY
Date:   Fri, 26 Nov 2021 12:35:16 +0530
Message-Id: <20211126070520.28979-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126070520.28979-1-manivannan.sadhasivam@linaro.org>
References: <20211126070520.28979-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIE0 PHY on Telit FN980 TLB for PCIE EP.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index 80c40da79604..e8b5327afbe7 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -236,6 +236,13 @@ &blsp1_uart3 {
 	status = "ok";
 };
 
+&pcie0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1e_bb_1p2>;
+	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
+};
+
 &qpic_bam {
 	status = "ok";
 };
-- 
2.25.1

