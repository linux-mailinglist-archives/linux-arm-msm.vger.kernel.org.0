Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC2636BA812
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 07:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjCOGn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 02:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbjCOGne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 02:43:34 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1F82ED48
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:43:27 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id rj10so7194851pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS/BEmRpdBxk7z2vn4cP+VagM+gkHpiXxJLmHI41D7s=;
        b=cVBK2HWcEVCnjtMOOtgliHcbaG865Ni4TWDC4oqxMPwEyS9sIWiN9ghwzannMJQS5f
         N3S3/VOlzcxP/FzueRkqDdf2gJARfAX2ecOT2wbxbkaCIVHeP7hAQL5w/vq/1lb1Pqmv
         BqTWGAJAQYG4AyMW7P5+uPlssx7y9xBjDWfh9wAi+6/huUCG+V1TPGMgbR0h2+ExwpXX
         UtLQt42gvT2TFUoBe38v30HyhGN271mF0kJu7tbzDDRQSVt2ybrqzHW/FeVllapjmMnR
         XzCAFcPJkY791ttOALk/SwG5cBtpY8GlV7l7JQsZ+srlDfy89SojgTXRhuPoLXJg1myL
         Xypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hS/BEmRpdBxk7z2vn4cP+VagM+gkHpiXxJLmHI41D7s=;
        b=lL5CZz9gel5vGJqeJbKMBmzRnFAki8OAktMsqYYo3BqBKTJwSPJfY19M4sQEQbIddU
         bzikqISApVKVoyGqjFvJn+0GPXoJMRuRIL3qLdU//pMg9APIDQTIRzI9NqKk39KUU/0c
         6lB1IdaidIA4MLopoWmQOOpMTh8wheK0FvFC793agkRIga/+IcU/xozDssf3Ii8yEs97
         Ri5+xJ2YVmyLHk5oa+F4mPWhFfyZ3HyrdpmE0IpiBS9jU9bZiCxHhgZAsj6do+ThbKyH
         CAwDi1G2YK3f5PK5F605J4dybUP3fjmju6Wa26eJh2yq0bUTNGXfcLkfrXeAg/iUPdOQ
         u1sA==
X-Gm-Message-State: AO0yUKV+SQuAIl7uKwVowvOE+XJzIWaguNom7iyVI7tDndCFoEuLJG7j
        /yMLz0f+q5o15KQvx1rRnKXZ
X-Google-Smtp-Source: AK7set+4qLlgnZZ5KpIhHm4xZwn76JEDE3xbBr+eGYOwlhZq2DCEatayLJ+aSfL+Wyjs2HZXy6Yk+g==
X-Received: by 2002:a17:90b:4d0a:b0:23a:87d1:9586 with SMTP id mw10-20020a17090b4d0a00b0023a87d19586mr38750833pjb.23.1678862606892;
        Tue, 14 Mar 2023 23:43:26 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.35])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090a6a8400b002367325203fsm550747pjj.50.2023.03.14.23.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:43:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 05/18] PCI: qcom: Use lower case for hex
Date:   Wed, 15 Mar 2023 12:12:42 +0530
Message-Id: <20230315064255.15591-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
References: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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

