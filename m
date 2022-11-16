Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A0C62C0FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 15:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbiKPOeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 09:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbiKPOeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 09:34:13 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EC1EB
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 06:34:11 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so2562913pjk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 06:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lhl1Yht7Jl4WGhfsN3KHnbxlZqqtqyTEjZ2u2REimHo=;
        b=NQ/yAKYrWw5ryFKeCE0e7gFddbKS+fcQjrzAGvCCHJx7/OUhpC2Oc+B26Q8hkuNXKG
         TZ46biv4Aj26yUpHbTmcsGXx3+wlGZLaf5iUs1YtpVHuzPFzWzdUCO1V7I+pJX1lTnVX
         +RYT4mzGNjy6zz6klYzy0xiOAV3Be7OxM9wb+X774MAeaOBZTpJP79go/Y2mkHTukv9p
         j0PrUqoNW5MDcAf76OszkkK3zzmY9rrotRmsAAqN1c+KcjtLeBIvas4E6Ev2hqpxnpv4
         h5QUq+qaIc/qnKvh5ZtapY578Si6ijI024NofjRl7c5TKza/infaOmeZ1Psb1f11MBBi
         Q1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lhl1Yht7Jl4WGhfsN3KHnbxlZqqtqyTEjZ2u2REimHo=;
        b=N52BmnWEzt0L0MuRLAJqcLa3ejrTGCcBKs6uq2vaQRrHfIzaVobHpx/1RPm1lRHmOt
         R10jX40HLEbpX449nFvOphrA672mVChTmYLwhZQKI7Fl5kFcViCe5IyFCRufHBMuduwG
         h5f2dajWCaCLBGLyeusroYAsjcB2+tCJ6rzFfd3Kzn8KjMM3bi0khwG9/XiDYxa9ShfN
         pStfgJCnZicfurysEFLgS714II3AfYG+qIjB7fjDsiII9dTzTaV3tMfrFbci8ligobYH
         SP69ikvm/a7Z+ypjjB3FyTwnM+SSTB7jNNtmdiOqQxMOxqsjbFx1i2Ijk7UoYtC0mSd1
         q7yA==
X-Gm-Message-State: ANoB5pnz/xZUupJDlSnotBMOf8F74ZPGuoqgdS9g5NFnfO05OmEFz6yd
        /svsb4rZ8dFx2DwL0LLPZOnn
X-Google-Smtp-Source: AA0mqf7jrrj5npS2T7rtO8L5zePtZFKr1f2c6phSPRL0F+WKl76jwksE+P+kaHC4lT6Q1Edndg0T2Q==
X-Received: by 2002:a17:902:76c4:b0:187:1c65:e208 with SMTP id j4-20020a17090276c400b001871c65e208mr9111929plt.173.1668609251468;
        Wed, 16 Nov 2022 06:34:11 -0800 (PST)
Received: from localhost.localdomain ([59.92.100.153])
        by smtp.gmail.com with ESMTPSA id e8-20020a63e008000000b0043c732e1536sm9560974pgh.45.2022.11.16.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 06:34:10 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_saipraka@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/2] EDAC/qcom: Remove extra error no assignment in qcom_llcc_core_setup()
Date:   Wed, 16 Nov 2022 20:03:52 +0530
Message-Id: <20221116143352.289303-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116143352.289303-1-manivannan.sadhasivam@linaro.org>
References: <20221116143352.289303-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 04df70b7fea3..0b6ca1f20b51 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -126,7 +126,7 @@ static int qcom_llcc_core_setup(struct llcc_drv_data *drv, struct regmap *llcc_b
 static int
 qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
 {
-	int ret = 0;
+	int ret = -EINVAL;
 
 	switch (err_type) {
 	case LLCC_DRAM_CE:
@@ -158,7 +158,6 @@ qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
 			return ret;
 		break;
 	default:
-		ret = -EINVAL;
 		edac_printk(KERN_CRIT, EDAC_LLCC, "Unexpected error type: %d\n",
 			    err_type);
 	}
-- 
2.25.1

