Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 282134ADFE6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 18:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345449AbiBHRwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 12:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiBHRwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 12:52:31 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BD6C061578
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 09:52:30 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id y5so19245077pfe.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jol+dETTGtIFDcZ0LJDX3mcnE3qDxeQxYuYPKzLtM34=;
        b=uVxOhFl3E2w5uygsEEVOYcV9lvC3YEdBrz1J8A6DRi43hwukU559+L1rfzX8g6P3ov
         NA45kkbyzqaLqgLn2oCZN1wj/2bCWF3CNiPl/6PWDFjRM9Go56Tmy5I2ZvjVyF3cNWaS
         dVjqyscrm8IccUnSsyMqBCiLHW+NpeVuO0A6KUDHx/LZJpgPBEyRn/GNCzzJtNWSxr6G
         joRLs7vbZDfcfHT5AijGSRNJPxEvOFvdKGVwigL2L51eXfelhyGWMoq4xR586YQHeJRM
         5nw+hoBoGzk/d0q7MvczA3CHglnDCcL7si0Yd5TAsfrvhzSn3PnkU85tdEeG9jwvgkKd
         cb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jol+dETTGtIFDcZ0LJDX3mcnE3qDxeQxYuYPKzLtM34=;
        b=Fvke3NKXkwC1NEIl8v/KKCnThx6XyWAzLctlH3pFsyIKIFQfyvbkYg616NovyS6Lav
         nmgj1RncewgvJozzGHny9sIDaIqj06Dzmyra8o/eo//7XYOshxDUH5oxu0ikttXf0KDW
         LFzbVVP/P82Ag/Dcuk3lR3hZaWaAP9dHnX1C5HmjJe4P9ErDEuc60qCs7YSHVxYMrImR
         ZgQJW/JfBx/t7uQx6YjgOYbFf0DJOZRzLT2jP/9Cy0KStRRj5/PfO2H31bkCXylEMh7L
         +k/rF8D1bICRaugx6VB7oo8dz/bKxubH8tHnShDjYwS6XJrNwISLR9vq+Be87hHl5fyx
         VIsg==
X-Gm-Message-State: AOAM531gA8pI5pVkMhCzDvowWqYhUU2bAzr9bj+sgFf1rUPMhz51AgnB
        4JY8/yxZ1FPqBOOTAAxIJb3w
X-Google-Smtp-Source: ABdhPJznRykqSscOw2Q7+AcZ0+rPbkaqlvRPjTV7z383WaT1cnQelg6lrxmlkaH9+qE3TW+p+TcM/A==
X-Received: by 2002:a05:6a00:130a:: with SMTP id j10mr5450281pfu.32.1644342750066;
        Tue, 08 Feb 2022 09:52:30 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id nu15sm3807706pjb.5.2022.02.08.09.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 09:52:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] ARM: dts: qcom: sdx55: Fix the address used for PCIe EP local addr space
Date:   Tue,  8 Feb 2022 23:22:21 +0530
Message-Id: <20220208175222.415762-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the address range used for mapping the PCIe host memory in the DDR.

Fixes: ac0e2878cbb0 ("ARM: dts: qcom: sdx55: Add support for PCIe EP")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 8ac0492c7659..40f11159f061 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -413,7 +413,7 @@ pcie_ep: pcie-ep@40000000 {
 			      <0x40000000 0xf1d>,
 			      <0x40000f20 0xc8>,
 			      <0x40001000 0x1000>,
-			      <0x40002000 0x10000>,
+			      <0x40200000 0x100000>,
 			      <0x01c03000 0x3000>;
 			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
 				    "mmio";
-- 
2.25.1

