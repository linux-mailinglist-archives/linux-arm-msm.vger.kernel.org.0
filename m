Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A38E96B1EB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 09:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjCIIvw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 03:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjCIIvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 03:51:45 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CF7DDB1E
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 00:51:37 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id y2so1456508pjg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 00:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS/BEmRpdBxk7z2vn4cP+VagM+gkHpiXxJLmHI41D7s=;
        b=QUXR2lejc4jtRZY3bLaRp6RWYSQF+j2QVRM5ZAChQfdXnfGt2VDqoUhWCmVTcIDLrr
         8D/Ep48HCWW0QUtCivNiB78o68wvcuNiv8w12PM+zVdi7APRbWe3U6eawZ7Eb04j5cRi
         VXo9rOkk5jZlnBZrkxc4ZYRdLafkUTNJrSR/EljWQ1ekBElocxQoU0XbeB7RvGiJSNSg
         +WdJADeRNn+WbDD9WDNaeQUMUfE8kSO9HsB9XVBqJ//6j2t44HQ7okYbrDxS9OYWHT9K
         OBrtWLgf2Z1MFfadwN3AinUscbYoq10BFzPn90FaOABbN+0pugx+bqtaIyo9r5J/R86k
         B7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hS/BEmRpdBxk7z2vn4cP+VagM+gkHpiXxJLmHI41D7s=;
        b=p2tXFh3WJ02VyM+ZSdBfDd5K+fjle5fskHK1PyblzvnptugdCqsseg8d0dQAaQLGIq
         qkF+5+hMSQe3jfG6e/rZwdEWwpyISMdmfjBuMrbWYr5s+PEq4mgZTRaGztyvanxNrQfu
         uQ1GvVh27/45ZLNLRxlyvnDz6ZSDYibURuEQhBy9cerTCjLKNeHfJ4B3q3hk/9VBHkMt
         w0Cw2P5CCj5J5rKpurwlJVlmdnvjWhLIBrbyQhvXT4JCe38DKFVjeqKYMOE/BtYys5T6
         HktRKAw6OW/b5OGm0M/CtYZRTp+H23odYxG15na1jYZNK4X6uEGzTH5bZSJ8GWABdbKR
         tgUg==
X-Gm-Message-State: AO0yUKU4NH2Vi6b2odEi/2EtukJ+zRZzgZjQcTNorfSOoa4ZbOuNgoPu
        BKMhYYTyeD/0m2uqw8AkyR16
X-Google-Smtp-Source: AK7set9oTi3znTeiWqkHiqH0dcoLT3QUGKZI3B1s0KeDrBA6IyvYSnhD8NqQgi8hT9LMayyJRfYzHw==
X-Received: by 2002:a05:6a20:918c:b0:cc:f214:2f33 with SMTP id v12-20020a056a20918c00b000ccf2142f33mr21489702pzd.24.1678351896448;
        Thu, 09 Mar 2023 00:51:36 -0800 (PST)
Received: from localhost.localdomain ([220.158.158.11])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b005809d382016sm10638604pfn.74.2023.03.09.00.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:51:36 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 05/17] PCI: qcom: Use lower case for hex
Date:   Thu,  9 Mar 2023 14:20:50 +0530
Message-Id: <20230309085102.120977-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309085102.120977-1-manivannan.sadhasivam@linaro.org>
References: <20230309085102.120977-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

