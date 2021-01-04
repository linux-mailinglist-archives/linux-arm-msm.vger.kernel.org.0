Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA86D2E8FC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 05:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbhADEN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 23:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbhADENI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 23:13:08 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FFBC0617A1
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 20:11:59 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id t6so13837247plq.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 20:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=icXjVyLr8ROGK9HCrfmW24KYFfrqOe76+5Eys2pUaYc=;
        b=MUCjeC0n9Jzu3Ybx2+wYVVQZHu+be4Ab/JPXX+mx10mppyE8coiYJHLOQtIFIiWFDu
         tBlRN12//WUM+lgkJ6PgC9GzcdK4GHlrAIP6kx+aY7vfmCUtpostUbWZCfZpQ12UkCNd
         YILCpHW+eidapdhkVCU2wnGb7ghd0CWy99a5KDahC2HjtHvatBy24V9XvqkEw13tpddq
         pYhhyexGjqX5E197g6JPx9sSYsm66uBLzbGojSD10uk6mLqL8umyT4wb09EKzPZPCZiq
         UxNrEFHQLeF5GjsYB/5icUIISqQFUxKDglWMdt8qNdZ5GPbR3ipp8tlvgXKgx4Jpab5X
         NTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=icXjVyLr8ROGK9HCrfmW24KYFfrqOe76+5Eys2pUaYc=;
        b=ZNIrcFwTHeZ9WO29MbQ082/yxo2i9yjcHM0febtE4Irhd8bZs9VkLRNqS8DxFkC/eW
         GJZaKf4bz87SQnkoBtYQPgt2tD8azE5VDQcCmfLwih521yXv3onmqgkpnVqJw+vCopc0
         fZ5YUw1pHTs5zIlvtoMvJcaYZggq+oo37ZrjkwdcABiqE5xVozeG3lcX12uH3O/n67hV
         mHK1/pMzcfRP/3Mht+o29QBB4oWLzRd8hRVzsQ5cHRDARYKRrDuWmiB0O7JjUpfQ8Hfq
         qEIyRjXVVF7d8rzOyQwDCT4LY7z9tAOr7S74ysG5t6DK9oUcZUoTVsI9wYQ8GfvURBuN
         NpSQ==
X-Gm-Message-State: AOAM532xBYGXS8TGAiKeS6QbGO/f4x1wMOYTX5clVi1X1iAuF27N+G/g
        PrVxX5QwPd9sD59FUxspiFfc
X-Google-Smtp-Source: ABdhPJwWuQlC9C42p7YriHVAU0fLFuzmlbs1I6A7poFZx8dMn5NBsQ8KChaZkRch5Lf4CybfrDMhpQ==
X-Received: by 2002:a17:902:6bca:b029:dc:34e1:26b1 with SMTP id m10-20020a1709026bcab02900dc34e126b1mr52162525plt.52.1609733518888;
        Sun, 03 Jan 2021 20:11:58 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 20:11:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 3/4] mtd: rawnand: qcom: Add support for Qcom SMEM parser
Date:   Mon,  4 Jan 2021 09:41:36 +0530
Message-Id: <20210104041137.113075-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
References: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for using Qualcomm SMEM based flash partition parser in
Qualcomm NAND controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 667e4bfe369f..fd4c318b520f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2821,6 +2821,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
+static const char * const probes[] = { "qcomsmem", NULL };
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2884,7 +2886,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		}
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
 
-- 
2.25.1

