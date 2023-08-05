Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C10577110A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 19:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjHERmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 13:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbjHERmj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 13:42:39 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2EE3C2D
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 10:42:24 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so2111135b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257343; x=1691862143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Sk0pPWqBxPd0LZRhqUZVkkGQlVge4WAhNj/aqE/s4Y=;
        b=r3e0kB4hxBfTtxIB0onMjnTolvvCfOWZ6jFqGifW4WvCZljrocy7UTblzz5SgbZSMV
         Tsg6Grb5tNsecdh7a3xvki0xfGCzsjstt2awTgo5qChvIy5eZZHhzs3p9ax0WcWC3Tei
         tgcyE9SjI8JNLSsZz7XZn+YlxNV9B7RczmluWvy6OA5QTxU+XnstbRxTykip1aunBR+w
         wvO3V5k/mzf7dNLhvllWENRiaYAON41uRSDRlsd3pI4/QUAx8NVDMFoRJUe9M331xiDK
         WRxJ80B9Pix7WXIMMX/Eh7wTIMNZMUz6ESVIzmjKRIGxflRDWv8dy9e9WDLjaLBsQmj/
         CLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257343; x=1691862143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Sk0pPWqBxPd0LZRhqUZVkkGQlVge4WAhNj/aqE/s4Y=;
        b=JuxeedJr+iOrf46yS159QU24eDMRgeM13X9bCMAzBCE6tCSFaDDGT9qZiRhc25dvvY
         SJfWY0Qyvb9QTy6C8q4JECrsS2wdnuarMQcDxmTiZty/f/zlnCJAPa6salTij8UiL6Uu
         Didrplr510ay7mAp/1d4F/hkmwmqSu2IkLJq/6NACNlBUKr1Ez3O5D/h/fYkB5aKIUii
         vERcjS7qCPHQTgvJKru9w367tNIag1LldDuIfxDf6NkFtZZL6oY8G56SYxV3Ro6hw9w2
         WANPCpXzX6lOnm8vkH9IPlHPmHUWp9Y/S2woe1gh97HT3ZmHDDY+U4TikndJ0q2CdBVZ
         kKww==
X-Gm-Message-State: AOJu0Yyh25cjP+co3RTASDkx4ZH1NraSR/N6JlA1Ls5LD2QP+OQ2ipSX
        Kmmf8ZxYsT8z2dLnvSYtJYyf
X-Google-Smtp-Source: AGHT+IGfVwqNV2yZu3HBwsINeFiBqSoo6eDBh4XGHw3BY2S/rCtcxHL+55POlo+nJk6aFa9hHqDL5A==
X-Received: by 2002:a05:6a20:12c2:b0:12e:caac:f263 with SMTP id v2-20020a056a2012c200b0012ecaacf263mr3443189pzg.20.1691257343130;
        Sat, 05 Aug 2023 10:42:23 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:22 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, vigneshr@ti.com
Cc:     richard@nod.at, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mdalam@quicinc.com, quic_srichara@quicinc.com,
        dan.carpenter@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/10] mtd: rawnand: qcom: Wrap qcom_nand_exec_op() to 80 columns
Date:   Sat,  5 Aug 2023 23:11:42 +0530
Message-Id: <20230805174146.57006-7-manivannan.sadhasivam@linaro.org>
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

Both the function arguments and the definition could be wrapped to 80
columns to save line space.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index a7a9421ef003..4f38579ae03e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3051,14 +3051,12 @@ static int qcom_check_op(struct nand_chip *chip,
 }
 
 static int qcom_nand_exec_op(struct nand_chip *chip,
-			     const struct nand_operation *op,
-			bool check_only)
+			     const struct nand_operation *op, bool check_only)
 {
 	if (check_only)
 		return qcom_check_op(chip, op);
 
-	return nand_op_parser_exec_op(chip, &qcom_op_parser,
-			op, check_only);
+	return nand_op_parser_exec_op(chip, &qcom_op_parser, op, check_only);
 }
 
 static const struct nand_controller_ops qcom_nandc_ops = {
-- 
2.25.1

