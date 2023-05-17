Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8F170600F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 08:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbjEQG3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 02:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbjEQG3V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 02:29:21 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A95846B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 23:29:20 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-966400ee79aso62281866b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 23:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684304958; x=1686896958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfKdoeG8mu6zu/394MW7KJlMb3XJq7sqRyZaWwU7lKw=;
        b=yG1sjowuQgNuEnTswfId2mpQi92NzfDWCP7Vtmbev33mPFWrkgjbvl9q3a9SzZGyQF
         qZA0uaqI6E8wigDsVNexiacOJlFAWbly5sZo2oVVrT0QyYmOHjMnK3bVKNe5mt0hYY5U
         YalF1ng9dlgMBX+kHUlqtet4aSPkFZSrhM1DJ7f9GLFxSljCgErYVL8G7ujN2NJpk5aY
         4l1RmGMuPHaZIU1ka5hP7xFvYkZuLUG0A6RLFQZSZ8f4zcNhApu1t59T/u+St0vD6wEj
         srGJ2GwLsOoef7ycwmY1/dhU7UB7tNk/mWQqpFR3Ngaq4NvTu2UoYqHYPgw8+w0uoqlW
         31bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684304958; x=1686896958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfKdoeG8mu6zu/394MW7KJlMb3XJq7sqRyZaWwU7lKw=;
        b=aVA13gmTzVT4FkVA1De2w8JQZx/UtvUJ3Q1CMScWCRF6TdR6RUfpEeI77prKlJX3Gx
         4HHLRuejqd17xR5YXRUDIY5HAWeEm1z3EwLqIm/IVvo555IDMGfH+UFD5appJX5268AL
         VWSwRne+mko5N3OCLlL0381eWY/cviTTGpjqwoQ3++Uv/NggCxRpMaLi4tYmYWnFJLpI
         D5mVonuT4knQiUxGZiC1y5Kwsloc3bLauWYUPhKGOzG1jZDjjEPZk2YtmB2fNruyEu+8
         tgiuTEd9ICaMPLk18JtM8x18BHeZu+7/PtvDH2kMoCYB6cUt81HBuE78injoMMLSdJr0
         R/ag==
X-Gm-Message-State: AC+VfDyiE8ZZwhzlYwkMqxajkQXTnK0Q/ku0YPJVmVZ1Z18p2YOwKd4B
        acLyAIl7nWCqzkfaElrRLCNJ
X-Google-Smtp-Source: ACHHUZ61Jjt8joUEACF5USsOU/f5o4zpBwTdjvE5lOwRjTDMAG/ESct56yKXskhXNDLmXpyJhSaLIw==
X-Received: by 2002:a17:907:6e8e:b0:94f:3521:396 with SMTP id sh14-20020a1709076e8e00b0094f35210396mr43619846ejc.23.1684304958544;
        Tue, 16 May 2023 23:29:18 -0700 (PDT)
Received: from localhost.localdomain ([59.92.102.59])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906648900b0094f3d700868sm11859273ejm.80.2023.05.16.23.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 23:29:17 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH v7 1/2] EDAC/qcom: Remove extra error no assignment in qcom_llcc_core_setup()
Date:   Wed, 17 May 2023 11:58:58 +0530
Message-Id: <20230517062859.57371-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517062859.57371-1-manivannan.sadhasivam@linaro.org>
References: <20230517062859.57371-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the ret variable is initialized with -EINVAL, then there is no need to
assign it again in the default case of qcom_llcc_core_setup().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/edac/qcom_edac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
index 265e0fb39bc7..53d666ffcb1f 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -170,7 +170,7 @@ static int qcom_llcc_core_setup(struct regmap *llcc_bcast_regmap)
 static int
 qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
 {
-	int ret = 0;
+	int ret = -EINVAL;
 
 	switch (err_type) {
 	case LLCC_DRAM_CE:
@@ -198,7 +198,6 @@ qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
 			return ret;
 		break;
 	default:
-		ret = -EINVAL;
 		edac_printk(KERN_CRIT, EDAC_LLCC, "Unexpected error type: %d\n",
 			    err_type);
 	}
-- 
2.25.1

