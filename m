Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5A1771117
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 19:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjHERn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 13:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjHERnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 13:43:21 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B65A3A81
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 10:42:56 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-55bac17b442so2224187a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257355; x=1691862155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN0f2LOKeZ6eEoWkB3wmreNy3AFR6iUd1H9kbvp/ehA=;
        b=kAh3rzHl75lVGO7PZrVPAypy0Oexu0VKTje94TlCGbSduQ+Man2JdW9EbqXb7oNuJD
         Uc3fItb3E9yDaFi0dayjguINssLDunrCXo2we89n4zjze6JekLxTQhV2RiiZZ+gDv7lX
         /c0EDF4xL8NMKtp69j9pc0+k17hR3sHwo3tzmrcK4/yyJHT7B669scqmRJYcsENqdLrv
         0ecYm0IuWiMAFg3OZFHOn+GLL+ovcplRgWCNezFF2UiiKENlKru/EskP01YIqKX2lLXt
         nbrTaCNxB5UZnoGRuDcowQQQZ9NKJyqpMoFbO/B8sWhj7cu4zeeNdHMISM4JObt+soxW
         MSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257355; x=1691862155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HN0f2LOKeZ6eEoWkB3wmreNy3AFR6iUd1H9kbvp/ehA=;
        b=krOCCDlNAKb/7M/QjTg3iavKUI4gqOg6NA1l1maa12HKCwnZlvO4WB1uBoDH7DhMHO
         AlDiquMYoflH9SUww+CIuT6ccQxkKHscyX3sb8SvQQEQfH23tcbpdKiNDmoEoPup1uZO
         Jj3Eti1FdPzTksXTQ/PaLQHJiFfChU00mXmeOV8yfib6gH2E1oDJ9k5+ttHKccLNaYcz
         kOaFR9kz2DL6Z4Y/jEmwgtOhNP7psI0WIJnrxLyt8dFS0caQLuW9oVTAmBXYZW72bz6f
         GyHRNNkLqEfR7fuMr39aOYOSiN3D7NBFyavu8F7P9ue5JDGnSIpKiBPZhn/w/q9R4rGt
         mU6A==
X-Gm-Message-State: AOJu0YyS+S60D/AzTjtxWvWVFJNsX4TsXGmjKFdo/meJtNKTQozyoZqz
        OV/xPSt4npmhRZc5fs2IXwc+
X-Google-Smtp-Source: AGHT+IFjBXPzDhGC+YxAaUnKhYgvfBaOEAF4Hp9xdEsX8uxBumlNIYcVEzsjcorJg843xxFN9GBbUA==
X-Received: by 2002:a05:6a21:789a:b0:133:7276:324b with SMTP id bf26-20020a056a21789a00b001337276324bmr6489967pzc.23.1691257355606;
        Sat, 05 Aug 2023 10:42:35 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:35 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, vigneshr@ti.com
Cc:     richard@nod.at, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mdalam@quicinc.com, quic_srichara@quicinc.com,
        dan.carpenter@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/10] mtd: rawnand: qcom: Sort includes alphabetically
Date:   Sat,  5 Aug 2023 23:11:46 +0530
Message-Id: <20230805174146.57006-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sort includes in alphabetical order.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 0fbc6d1a558c..d4ba0d04c970 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2,19 +2,19 @@
 /*
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
-#include <linux/clk.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <linux/bitops.h>
-#include <linux/dma/qcom_adm.h>
-#include <linux/dma-mapping.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma/qcom_adm.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/module.h>
-#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/of.h>
-#include <linux/delay.h>
-#include <linux/dma/qcom_bam_dma.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
-- 
2.25.1

