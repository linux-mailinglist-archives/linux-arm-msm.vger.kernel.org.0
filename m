Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157CD63518B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbiKWHwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236404AbiKWHv0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:51:26 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586D6FBAAD
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:50:28 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id y13so16616882pfp.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glMEmrKRq4os3IrGzZuvFW519vUHu5A1N8n6PQVGzlQ=;
        b=BOIqJRhDIjAKXMdP0E72f+a3Mm553ME26QYgvjzRlnw5V6BDIRXLMaF1se86tGbYQB
         ZKJSBLv7ClSBzIHeOGPty5hmKbwaBrkAZyu5V7cAXRjG5/gkyz6zJVwZsudzNbC9l4sX
         xGxB/hxYu0PBYiO+yoCyjYeMiJMGg99bn5EY+aEng7GPz83FRjYFs/kI3QkayzRoFvhW
         wfs9iSr4xEj+gPjd1lE6V0ENFCIGqFFvmzEws69pHbHcVtxSZqsQQo4soZY0JUzY4sMe
         KDFqmpqix67JN0Z5Q/X7RLjj2iVbNpbHIil8wCaS62qxF0o21h88N9YOigHsix7vCpN1
         62LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glMEmrKRq4os3IrGzZuvFW519vUHu5A1N8n6PQVGzlQ=;
        b=ceFetoQIThBgrPk/V9VgDeU7BGPWu5sg0+o43syCHafBLixByhILkRfaZGKNjRurhI
         iaBV+CL0B5Ug3czuwFtRWd94dQuevrY+sQzmVyVNjVlqfjFVa+ga1ed2QPZC/6Zdokp8
         4TQDWUpPGxp8xTnaHN9QSgI7bRty4GsOxuzhdC4IZ6HDrX5PDb8r9krk6SzgWkiv2w7p
         WkVFpi7XV6kAtqfeIwCHbVksfEsZhOsiiVS5BNTvgI0L0luCvd+xyRtmPL1ShocTh4pt
         WQkKNyNaDEj0b76HJH55Cb1FHi/XuNuv3sFPoV0YSpsYLlzqmnE4LCqsGv4ojbkySSwE
         jhbA==
X-Gm-Message-State: ANoB5pmobe1iE2WK6LosFwI9DCOJ6BIdex+/HjV+opCOwCrSu/xFgJfN
        G1036PfMMIcvpxV4O7xP41yE
X-Google-Smtp-Source: AA0mqf6lPAF5IEkGpX+K2Q9GKm/yZZjproyXopeEaYdMDy/lg31urXcP7Dnn38GSLO1N23qo/ycyeA==
X-Received: by 2002:a63:5359:0:b0:46f:3dfb:87e1 with SMTP id t25-20020a635359000000b0046f3dfb87e1mr9010367pgl.290.1669189827640;
        Tue, 22 Nov 2022 23:50:27 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.0])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm13334059plq.34.2022.11.22.23.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:50:26 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 19/20] scsi: ufs: ufs-qcom: Add support for finding max gear on new platforms
Date:   Wed, 23 Nov 2022 13:18:25 +0530
Message-Id: <20221123074826.95369-20-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
References: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
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

Starting from Qcom UFS version 4.0, vendor specific REG_UFS_PARAM0 register
can be used to determine the maximum gear supported by the controller.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 ++
 drivers/ufs/host/ufs-qcom.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3efef2f36e69..607fddb7b4c3 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -291,6 +291,8 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
 		 * Hence downgrade the maximum supported gear to HS-G2.
 		 */
 		return UFS_HS_G2;
+	} else if (host->hw_ver.major >= 0x4) {
+		return UFS_QCOM_MAX_GEAR(ufshcd_readl(hba, REG_UFS_PARAM0));
 	}
 
 	/* Default is HS-G3 */
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 4b00c67e9d7f..dd3abd23ec22 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -94,6 +94,10 @@ enum {
 #define TMRLUT_HW_CGC_EN	BIT(6)
 #define OCSC_HW_CGC_EN		BIT(7)
 
+/* bit definitions for REG_UFS_PARAM0 */
+#define MAX_HS_GEAR_MASK	GENMASK(6, 4)
+#define UFS_QCOM_MAX_GEAR(x)	FIELD_GET(MAX_HS_GEAR_MASK, (x))
+
 /* bit definition for UFS_UFS_TEST_BUS_CTRL_n */
 #define TEST_BUS_SUB_SEL_MASK	GENMASK(4, 0)  /* All XXX_SEL fields are 5 bits wide */
 
-- 
2.25.1

