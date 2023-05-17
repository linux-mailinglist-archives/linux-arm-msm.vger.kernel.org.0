Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECA4705FEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 08:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbjEQGYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 02:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjEQGYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 02:24:34 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCCD40E7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 23:24:33 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5304913530fso319464a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 23:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684304673; x=1686896673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfKdoeG8mu6zu/394MW7KJlMb3XJq7sqRyZaWwU7lKw=;
        b=LthWTdYNEHl//JSltdWk6o4MZfNEHIaNGaUvCCXZYbeJF733AaYRuqtb+nfPPRW0kk
         tQi/Ynm9/+RqdtDkeb9Dhwqr0kI9+35GVjH3k0X6uFb916LUQAfbQCvxGQHtwOsUcBt/
         C/fDbm+RWl0c6njfv540SHGchbkG7zlvxoZbamN1Asktng4PH5X4Zod96okvPIfNQLH+
         KnGDcIrEJPn4vnl9N615WDmBSqUrKtneDlZPLp3tss2QppTJEPfFduZ4dYyW1oox2bvk
         IZXpCIqmWpM1x6PjEbLseafyinWRE5ZasmttDD5qJ9q9GXBiGCNCRaQEhf1uiDc3a1SQ
         NoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684304673; x=1686896673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfKdoeG8mu6zu/394MW7KJlMb3XJq7sqRyZaWwU7lKw=;
        b=YJsTLkyHn2V7c4ZBWP379JPA5XvlOepSpW5N1ZVT91yxUhbOGl0yJd4y0zMeuI5XSz
         nqHKxuWIXfQVerOQ95Ojv0Ay7xsF11eNIfW05OTDyqmZyCQtTSpnafQUM3cDadRrHyad
         7pAM8gphjI3Ln0ZA6d5GBo+aj8gAPhp3x1vGlkOBux/0WfQq1d/1msMQIa0r+jrPHOeW
         MfSu0sWMTlKH97Lx0qIh2ORkbIkyJ/VUcfa8xZ+ZS9d41iLUTfsgatxLGRpC5zBzG/yR
         vNYEkZKXy7vOLj3sVgMPJ7aFk6PnHiGgIdyU2325Ojn2ewYMxLLqlcoG/fHPVuQ6zrlH
         gIQQ==
X-Gm-Message-State: AC+VfDxpcw0ZqhJHWNrwcL/iFCKOTHp0COOzOBSajcMsP647M1ZBELi3
        kyGk3XleYW8T7Joa6N/TX+u9
X-Google-Smtp-Source: ACHHUZ7qPiZFvMENE+qrkdJFxvEhxBUWv6GWj5OFTtoSWNkxuB+w5W56ExURaU55ZWmVj8d4MaPA+A==
X-Received: by 2002:a17:90a:ce87:b0:250:2d62:d3e2 with SMTP id g7-20020a17090ace8700b002502d62d3e2mr38404744pju.22.1684304673008;
        Tue, 16 May 2023 23:24:33 -0700 (PDT)
Received: from localhost.localdomain ([59.92.102.59])
        by smtp.gmail.com with ESMTPSA id z22-20020a17090acb1600b002508f0ac3edsm693282pjt.53.2023.05.16.23.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 23:24:32 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 1/2] EDAC/qcom: Remove extra error no assignment in qcom_llcc_core_setup()
Date:   Wed, 17 May 2023 11:54:19 +0530
Message-Id: <20230517062421.56970-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517062421.56970-1-manivannan.sadhasivam@linaro.org>
References: <20230517062421.56970-1-manivannan.sadhasivam@linaro.org>
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

