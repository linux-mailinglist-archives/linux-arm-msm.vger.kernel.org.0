Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4DA6AC52D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 16:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjCFPdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 10:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbjCFPdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 10:33:40 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BA6AD38
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 07:33:08 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so13508352pjg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678116779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS/BEmRpdBxk7z2vn4cP+VagM+gkHpiXxJLmHI41D7s=;
        b=DLTKhluLIf0IiTpNHeDrmt8vRlpubL8ui2AjStd4vUha/wf1PfXT2IfZOKFkr59Llg
         KpyKSj1t7AkQQ3kacPQJItAdPJaIae+hjI+JqhpCOYmjmuqsFrFGUuPELOtKQyaO3+y4
         MaRCQUfr84Z9GrUDTR8PefqV6J3hcO6EvyPuIHnM4kQ/EBZ3dAcstzK4M+e53Xgr53Lp
         IrvGWe6r6ogHUcHwHP/ZVh+jzKjvPBf5qAxw3q4YEPx/02Iv5fXpCl5Ox7e+wtKEf2vp
         4G3YgYW5nwQNobgKPNQp2dCZNxbKZ/B5ftCqu1ILSKMPhGTulFFICgxmhJY5nFzRqwHG
         K/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678116779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hS/BEmRpdBxk7z2vn4cP+VagM+gkHpiXxJLmHI41D7s=;
        b=rnLTy0bU8pXMi/Ir40hw9NKhrSVQiNy6zgQwRsCKffZdS++X6Jgll+KKI/EuKdVhsN
         OFwsSwH4IHTyx9h0EY7l0ESWkdPRdJLmwJPLqgjIciJ8wYnqhwHU3cA2gb99Lvugd1H7
         VCsZnwfip/4Z9FULDbyoFwZ2LMZ6lr8k1uaZtsXrfCzXloZqWiajqJjz4CW49YTf9u9o
         yNRN1gxk8yUWXSvJohQHzL66v0WxL5dsBgngqlAP0eO+VfDNAocyDp1FDUdRttNyo0+X
         jJ8OxTkg9dZLMhaVFyR1XT4IG3QGb0Nx21fcy8g0cbcu8SH2prVsiY7GHkUco6V388oK
         AQBA==
X-Gm-Message-State: AO0yUKU1UzvN+U6S+HkalvvkRorWFfCPnD2WBiUUnp72FLw7I/GrHGHq
        Icci77zJqrOuiQJHqpW4yj2I
X-Google-Smtp-Source: AK7set8sZfp6sQ6SgvwCNPs1Q+4jgzTymMOqILCjziXLWGsQI7/n5c/oVmkuG35voAzHWkcbvG1YMw==
X-Received: by 2002:a17:903:22d2:b0:199:12d5:5b97 with SMTP id y18-20020a17090322d200b0019912d55b97mr15960253plg.12.1678116779431;
        Mon, 06 Mar 2023 07:32:59 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id kl4-20020a170903074400b0019a7c890c61sm6837430plb.252.2023.03.06.07.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:32:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/19] PCI: qcom: Use lower case for hex
Date:   Mon,  6 Mar 2023 21:02:08 +0530
Message-Id: <20230306153222.157667-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306153222.157667-1-manivannan.sadhasivam@linaro.org>
References: <20230306153222.157667-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To maintain uniformity, let's use lower case for representing hexadecimal
numbers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 926a531fda3a..4179ac973147 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -39,17 +39,17 @@
 #define PARF_PCS_DEEMPH				0x34
 #define PARF_PCS_SWING				0x38
 #define PARF_PHY_CTRL				0x40
-#define PARF_PHY_REFCLK				0x4C
+#define PARF_PHY_REFCLK				0x4c
 #define PARF_CONFIG_BITS			0x50
 #define PARF_DBI_BASE_ADDR			0x168
-#define PARF_SLV_ADDR_SPACE_SIZE_2_3_3		0x16C /* Register offset specific to IP ver 2.3.3 */
+#define PARF_SLV_ADDR_SPACE_SIZE_2_3_3		0x16c /* Register offset specific to IP ver 2.3.3 */
 #define PARF_MHI_CLOCK_RESET_CTRL		0x174
 #define PARF_AXI_MSTR_WR_ADDR_HALT		0x178
-#define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1A8
-#define PARF_Q2A_FLUSH				0x1AC
-#define PARF_LTSSM				0x1B0
+#define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
+#define PARF_Q2A_FLUSH				0x1ac
+#define PARF_LTSSM				0x1b0
 #define PARF_SID_OFFSET				0x234
-#define PARF_BDF_TRANSLATE_CFG			0x24C
+#define PARF_BDF_TRANSLATE_CFG			0x24c
 #define PARF_SLV_ADDR_SPACE_SIZE		0x358
 #define PARF_DEVICE_TYPE			0x1000
 #define PARF_BDF_TO_SID_TABLE_N			0x2000
@@ -60,7 +60,7 @@
 /* DBI registers */
 #define AXI_MSTR_RESP_COMP_CTRL0		0x818
 #define AXI_MSTR_RESP_COMP_CTRL1		0x81c
-#define MISC_CONTROL_1_REG			0x8BC
+#define MISC_CONTROL_1_REG			0x8bc
 
 /* PARF_SYS_CTRL register fields */
 #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
-- 
2.25.1

