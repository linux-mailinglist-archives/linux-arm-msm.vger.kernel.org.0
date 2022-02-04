Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4CEC4A9B31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 15:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359408AbiBDOqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 09:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345529AbiBDOqu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 09:46:50 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C34C061744
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 06:46:49 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id q22so8814650ljh.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 06:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPkuuzEWFvZ+7dgk9RSn0ku3pRGEa9D7Qqz+AeteWoE=;
        b=o0+wFNvAqkVME/NNoGbBG+koZHoFJAo6KpsL0Pry9/W9mmuH9ydDbTopaaOMkLFvhX
         jSXlKNhOxMIcn1DLwYxR1bNZylCL3hFolh+cfybIES9AB6jEylsjGADe4F+dfUgEpeZI
         7Zor5enMD0rHRP2eBPlYnImXEkLpF6ln7C0R8BbxjI3VYbjaXnSqV+GF3sjV1O2J5pKM
         OWJOnFiGT0FooU47Ns5KVhpyOp3B3AfAS5KZq3QFDBxWBAZx2B2CtJbZ2s8nuM5X78q9
         8aD3c44ZJLWAwH29fWZDwC5jNFCfQxEPmSOFqWYxEgOISmu+LrWCdUok9xxAfADWUM1G
         psLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPkuuzEWFvZ+7dgk9RSn0ku3pRGEa9D7Qqz+AeteWoE=;
        b=5yLIiYd8MZqoNkgOtDQVayfuhbHxIzPIAjK/bhlcE0y75GRX/+eqkUrHGUj9jXg2pV
         xgiAkm1Y9pYQzpg61ldbPyx2lUm+oLInvm5ZPpsyqXsMghIbEDrAMlCUlt7wlyCpu7E+
         1iqphGCMxAqx4eatNX4McY7Uq56l3KZY6nxeYVzjXHp/gWjsx+k7RWF85xsDZ+TyyiUb
         Q7zEHsSdeyVACWHfUeKijfvajNMmIjOK03Y/b3Q0RmCdGumZLqmfxEAsuKAGvjk68Lsk
         bPBcTggTu7/jUN0lqDPxsH0MePcwNeH0pD/LwmGaSmcKVM7Kvk5eHvvbCMXNcJpT+y52
         ZqOA==
X-Gm-Message-State: AOAM531+kocNhCZ7hPOXGwA1UzACfZ3Gse0gyouay6H0HBOjsdiKHIVC
        0614W7JajVccNouJ3QIb0Tr/lg==
X-Google-Smtp-Source: ABdhPJyI52y6JCeoGwpRWzLaR3ogw2OKjlHYJLAxqhMrrL9Jsd86ueIxfVPjkzHz2V+eWSt9nobd/w==
X-Received: by 2002:a2e:9f54:: with SMTP id v20mr2090108ljk.438.1643986007968;
        Fri, 04 Feb 2022 06:46:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y23sm348222lfb.2.2022.02.04.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 06:46:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 01/11] dt-bindings: pci: qcom,pcie: drop unused "pipe" clocks
Date:   Fri,  4 Feb 2022 17:46:35 +0300
Message-Id: <20220204144645.3016603-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204144645.3016603-1-dmitry.baryshkov@linaro.org>
References: <20220204144645.3016603-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "pipe" clock is now unused by the PCIe driver. Drop it from the
bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index a0ae024c2d0c..da08f0f9de96 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -154,7 +154,6 @@
 			- "bus_slave"	Slave AXI clock
 			- "slave_q2a"	Slave Q2A clock
 			- "tbu"		PCIe TBU clock
-			- "pipe"	PIPE clock
 
 - clock-names:
 	Usage: required for sc8180x and sm8250
@@ -167,7 +166,6 @@
 			- "slave_q2a"	Slave Q2A clock
 			- "tbu"		PCIe TBU clock
 			- "ddrss_sf_tbu" PCIe SF TBU clock
-			- "pipe"	PIPE clock
 
 - resets:
 	Usage: required
-- 
2.34.1

