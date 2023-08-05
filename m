Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 001CA771115
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjHERnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 13:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjHERnM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 13:43:12 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8063C23
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 10:42:47 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686bc261111so2241860b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257352; x=1691862152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ7ZrjoLTJ5efHJXOrPgGJNKRMjipI8+wvO528txH4s=;
        b=B7+DzBY2BMwN0TLLydmymYkwIsWR3JxW+iSLL/V0XXHiIcE3NOr18Mx0HwbSsKBhWO
         iSMn8u1sw5GfUeTPmKYFpey/hPwsfNH6CjWl5ihSCT5no007WqjK5pReXK+gZlb0WAY0
         KWbAiyuDbbu8HgDPCO7iP2Xtsrb4JM+LVllxFOk18UAS3QLkqjL99MFkl5burHWLq8Ir
         dd9XoQiNvoT4dchGITvTV03HB+KUPoGQOEGX1HBN8XR6LVkZ2PfQZpG5jXn0Bh5ciSIk
         BBuCkn1sWiwt9otxwf0K5C3sJ9ddgPDJt6mLgXI8STYQ1qbePkvSExEqvAz2MaeMIxs1
         Mrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257352; x=1691862152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJ7ZrjoLTJ5efHJXOrPgGJNKRMjipI8+wvO528txH4s=;
        b=e5NKFOIRSvkrmno45Kte9gwuGOoYzHEW6m209ntIEIQWEsQHIimXw7PC4RzbBwnLlo
         yk/loOFU/nbN7n4Mr91a9KVkN1ha48XGGIMpQ3IkeZTLQI1n1X/ZbJYlTnWVTYD6HqZg
         modTz3PA1icZVU6laFnl6vkrfhvHliO6ldYQPz09j2DIyeKDog1yrGL2OskvjtPOpPKc
         rhjxmEQUgmy3AhEkBM7zRMO4pYRnfNM5303DROv7HrnKOgHa+4ZkupXpXx3386lqZzYY
         vQ6AUh0w6NRoouiAHsS6rg5HF15nixR2K57ZwPh03nCdbIPC4ECCTDLvTERAL0HrQ0KF
         kLLw==
X-Gm-Message-State: AOJu0Yyiy8mXavMNwRYoG3LJ07bl33Va32vfh3iZxUaDiPJgkyAigOk+
        YGHPEhhx5fzhDXYOgMqVOCCS
X-Google-Smtp-Source: AGHT+IFm4QL3fDeb80cVEsePvUuRS1mI1D46MeBn/d5FvxO7kyVdAKVt/ZJPShAB9Yhp4SDJY8pR7w==
X-Received: by 2002:a05:6a00:814:b0:687:78fc:e961 with SMTP id m20-20020a056a00081400b0068778fce961mr5558898pfk.22.1691257352461;
        Sat, 05 Aug 2023 10:42:32 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:32 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, vigneshr@ti.com
Cc:     richard@nod.at, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mdalam@quicinc.com, quic_srichara@quicinc.com,
        dan.carpenter@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/10] mtd: rawnand: qcom: Do not override the error no of submit_descs()
Date:   Sat,  5 Aug 2023 23:11:45 +0530
Message-Id: <20230805174146.57006-10-manivannan.sadhasivam@linaro.org>
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

Just use the error no returned by submit_descs() instead of overriding it
with -EIO.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 6b81781aa3ad..0fbc6d1a558c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2140,7 +2140,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure to write oob\n");
-		return -EIO;
+		return ret;
 	}
 
 	return nand_prog_page_end_op(chip);
@@ -2216,7 +2216,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure to update BBM\n");
-		return -EIO;
+		return ret;
 	}
 
 	return nand_prog_page_end_op(chip);
-- 
2.25.1

