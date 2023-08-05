Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB1D771105
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 19:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjHERmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 13:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjHERmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 13:42:24 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30F01BFE
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 10:42:17 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686e0213c0bso2219498b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257337; x=1691862137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw1sNygr+6EOLB0Bp4iKWYmwaK5BTcQtXrfXFuq/ooI=;
        b=RvaRNKwqniSRcehrR0lce9LhJjPEMUynlSdYrqa0l0Stp5DYnvJBYyg5XWgF5xF+09
         NCRQTj+LLwGgcnNuaeSKibgV1TC6oesV1KVl0/ZMKD9g1UaDJX8pvnIi5IAkjf05Vm4p
         RukbhjCgP8zj6IZYmiZYQ5TLsQ2W1Gm4VN5hVWKOOPU9FdzgBQziLCrPmRhQU5gZNtOu
         6qpshnoZBT+0w5A/Cw7JgP0RJ15MUojMgQqYgP4r3nCpBscB7FNj/6xz8iH5z8LCgqrF
         AbRHBjHs7FVep9gQsJUCVe/6LdP6LXna8hY+lV/UN7jeQ12TtZyzczJls80inwqLaRI3
         fNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257337; x=1691862137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw1sNygr+6EOLB0Bp4iKWYmwaK5BTcQtXrfXFuq/ooI=;
        b=hF+EfkFHpzQZ2M3kLdpRxZOpom0w4BEYKD5Y7p3UJTWeIsLyzGmXFsroCzvNWSmUbD
         4trz0jOg06g2l2LizuXuEINGPmE47cZ417kEzf24jEdefnFCM6qVD1lnQp265nZADaUb
         DClA8m8DKdnqWALIYLrW8HYFda0R3DWbNBvqjAjyhXa1j3MnfK2qL0gAQPyJA8lwU0mE
         dgmvgZEGqYOSmrmAq2Oa1ksLQWqVXQ0BN190uqATDvmLGVNYM1Gqf8g096ArTnT53oB1
         izjW7CI1h7DTZuCriUADqjfRy6xRNsNdWt6934IjEULwjs7a8ZSXNe0mUvhkFm2GxgG3
         BHKw==
X-Gm-Message-State: AOJu0YzKzgiis/vQRUYHFLPPAnLlTMLOpveGbyio/WzZpdJPKy8hxGEr
        e4zVmDEVg533cOVorDdKRGeC
X-Google-Smtp-Source: AGHT+IF5OInHqRHyGBbYddAN6cm7dEHOkjfzNQKZvIYJ4gy5VyCVJXSOv047XOI0sN9UpTafW2p9+A==
X-Received: by 2002:a05:6a00:2d13:b0:67b:f249:35e3 with SMTP id fa19-20020a056a002d1300b0067bf24935e3mr4741963pfb.26.1691257336916;
        Sat, 05 Aug 2023 10:42:16 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, vigneshr@ti.com
Cc:     richard@nod.at, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mdalam@quicinc.com, quic_srichara@quicinc.com,
        dan.carpenter@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 04/10] mtd: rawnand: qcom: Fix the opcode check in qcom_check_op()
Date:   Sat,  5 Aug 2023 23:11:40 +0530
Message-Id: <20230805174146.57006-5-manivannan.sadhasivam@linaro.org>
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

qcom_check_op() function checks for the invalid opcode for the instruction
types. Currently, it just returns -ENOTSUPP for all opcodes of
NAND_OP_CMD_INSTR type due to the use of "||" operator instead of "&&".
Fix it!

This also fixes the following smatch warning:

drivers/mtd/nand/raw/qcom_nandc.c:3036 qcom_check_op() warn: was && intended here instead of ||?

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4957e9253878..29fcdac932f1 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3033,12 +3033,12 @@ static int qcom_check_op(struct nand_chip *chip,
 
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
-			if (instr->ctx.cmd.opcode != NAND_CMD_RESET ||
-			    instr->ctx.cmd.opcode != NAND_CMD_READID ||
-			    instr->ctx.cmd.opcode != NAND_CMD_PARAM ||
-			    instr->ctx.cmd.opcode != NAND_CMD_ERASE1 ||
-			    instr->ctx.cmd.opcode != NAND_CMD_ERASE2 ||
-			    instr->ctx.cmd.opcode != NAND_CMD_STATUS ||
+			if (instr->ctx.cmd.opcode != NAND_CMD_RESET  &&
+			    instr->ctx.cmd.opcode != NAND_CMD_READID &&
+			    instr->ctx.cmd.opcode != NAND_CMD_PARAM  &&
+			    instr->ctx.cmd.opcode != NAND_CMD_ERASE1 &&
+			    instr->ctx.cmd.opcode != NAND_CMD_ERASE2 &&
+			    instr->ctx.cmd.opcode != NAND_CMD_STATUS &&
 			    instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG)
 				return -ENOTSUPP;
 			break;
-- 
2.25.1

