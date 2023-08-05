Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D27E771113
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 19:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjHERnM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 13:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjHERnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 13:43:09 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43D01BFD
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 10:42:42 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6874d1c8610so2228288b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257349; x=1691862149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzjUVbmqujkXx5jszw63KmEj0mqPrkYgNLPBEumwUM4=;
        b=UjtG8HGD0HXhbYE6KOMjYvoRrgHtcqD2ZE8722LK6PTedcUT6bAAuZT3T5lZa/0BFq
         dpRdRzNQV2xMdM2b+6b+GcCfiDZ6u5eMcDb9c1Zuc/Ng3RH3SLGtds/VgBpuZ4HfHyxt
         KHokfIMsu0H0rfXzPOoDDFVbVxs+V+ke7GyWVrUygP8tu3B+HsJyM6cVo2gxbMgP3Wli
         ypdb3XWpikZowDgZgaAy5c/UImiho4fNo3gUdTiqDDJwF1a67JSsrBJ+dM6M40sxaZv0
         otPqs4LjwZvCsIHBKI59i3308tE/Q2IfLhO0XhkJSFtZ1npPdl466eg2XEpsx0lh9jJl
         gP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257349; x=1691862149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzjUVbmqujkXx5jszw63KmEj0mqPrkYgNLPBEumwUM4=;
        b=jKQFXqs8ISjnIqmOVECg9n85A/RDs5Z4x8PpUv+sMirVTf/6X+PSAtGTE9LCkW2esB
         Td7J0J+4K6kbeWWeTZYnN8KyiFTK4dlXzioBenoi4ZJH72IUEuMy+jCPPc1Thntlch3Y
         Hg0uzVz1sDo7stpvrOfQO5qywrmPTGB0448dYwPTFSmDGabEWH3tt0u+pOr1Gm3iFg2t
         xvgsZEIy4DkVZpGg3J8hIRP2wfZxKxSrJacAyPgUey5e8nQvmH17IzY42otC1XOckkpH
         MxEF/iNxUJEw4h49zItA+SYeNiL/X2PQQM47/nbu0ic0G7nMieiT2IPNW5ZZCNpN0ISg
         OZ0g==
X-Gm-Message-State: AOJu0YwetEKN7IPvZieDALtXkNnMMBI3AmnWpSf03/OV/k6SfB6FOL8K
        ayk14Ha//ggMubXN/hNNX16s
X-Google-Smtp-Source: AGHT+IHeVbzFK1nWPZK6UOOQ+nXvClEVy5meGh11RDFEADwwp55gDn+bwJzz5DYrUJzfXoFc5uD6IA==
X-Received: by 2002:a05:6a00:114d:b0:687:3bc2:58de with SMTP id b13-20020a056a00114d00b006873bc258demr4086067pfm.6.1691257349344;
        Sat, 05 Aug 2023 10:42:29 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, vigneshr@ti.com
Cc:     richard@nod.at, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mdalam@quicinc.com, quic_srichara@quicinc.com,
        dan.carpenter@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/10] mtd: rawnand: qcom: Simplify the call to nand_prog_page_end_op()
Date:   Sat,  5 Aug 2023 23:11:44 +0530
Message-Id: <20230805174146.57006-9-manivannan.sadhasivam@linaro.org>
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

Now that the dma desc cleanup is moved inside submit_descs(), let's
simplify the call to nand_prog_page_end_op() inside qcom_nandc_write_page()
and qcom_nandc_write_page_raw() to match other functions.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1dbe17dcdb84..6b81781aa3ad 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2016,13 +2016,12 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 	}
 
 	ret = submit_descs(nandc);
-	if (ret)
+	if (ret) {
 		dev_err(nandc->dev, "failure to write page\n");
+		return ret;
+	}
 
-	if (!ret)
-		ret = nand_prog_page_end_op(chip);
-
-	return ret;
+	return nand_prog_page_end_op(chip);
 }
 
 /* implements ecc->write_page_raw() */
@@ -2090,13 +2089,12 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 	}
 
 	ret = submit_descs(nandc);
-	if (ret)
+	if (ret) {
 		dev_err(nandc->dev, "failure to write raw page\n");
+		return ret;
+	}
 
-	if (!ret)
-		ret = nand_prog_page_end_op(chip);
-
-	return ret;
+	return nand_prog_page_end_op(chip);
 }
 
 /*
-- 
2.25.1

