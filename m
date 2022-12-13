Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0D164BC17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 19:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbiLMSdl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 13:33:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbiLMSdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 13:33:23 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B20D24BD9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:33:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g7so6371255lfv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2l+AXlkbxgNmUyTRU1MNT9VBG4C9+qJhmYSE2pQfryc=;
        b=hZ0Z3HPqBRuQXe40KiDGCdasRHkvJ3/XZq+fUiQQWEppZ4EA7ps4V4ntf8Ytz4FDCm
         oGyW/CgF6rFdfWXTV/guUB9rALgZV+xRbUq5nXB7yhf/eMRN+wahpt3W56eAT4OSAYm5
         6rvqdsJqMJcsEenfhp1oF3Mupvym33h9g6mjS1OUAFXRh+eCoWjQPSdcuD5URiSxgc96
         UVgUhSELZmMuzUB24nsUs+2jxxAv6jtkvkux7TZND+Y0rx22MxNHt1YwwwVx0oUvC21b
         ZMiiNlCRs39mdH20rIvF/nUU+Rot6vgbTBYHt6LP6r3wSpPzotsKXtQcaC8f6hcEiCZM
         BbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2l+AXlkbxgNmUyTRU1MNT9VBG4C9+qJhmYSE2pQfryc=;
        b=3Tws1Ai3OZ9ny9Yqcsi5YyoDgzOUdUjWa5STwfPD1ZzbHDOkimI4xReFLeo7J6LHbR
         4UP5Y6wHjc2V170wO8yNhDCWId6Heg3k6rJjZAtg1pSgDZlm3vuQjngA7KBou2UmRnbx
         S6Pzs4AKUHIBAzlmRbtN16DSgTprznLH4/dIixXBoFermy9yyyEFt7YrDHbTp8NdBW9J
         7IRFn62mSkU2Jy7LwApYqE56wPmjXPwCJdaVvQGMwkhaoo6DGLUvcDxguaoz8FFlWBGN
         nLJhNkK6TNHOIfGMPXv3PoEgp/tj11Nf4CnR2q4kEzMMkTHZcSMJNO16EEYG7KDeGq0y
         RXZw==
X-Gm-Message-State: ANoB5pntr9u3bBhQJW5w+YGoaqko2CPtsIebnoK4z59y5xbJZ8QgZ3g1
        Db5eXAr4auWW9q0ABoku0aaiJDpAjro3gRfb
X-Google-Smtp-Source: AA0mqf58lXCXDz2c3M4SATdjrw3TeFxZUAi3AgKMRM39jYYVs4z6yaKAKIQ4GBfcrAb51SaWrPJKjA==
X-Received: by 2002:a05:6512:3495:b0:4b5:5616:ecd2 with SMTP id v21-20020a056512349500b004b55616ecd2mr5324020lfr.55.1670956400592;
        Tue, 13 Dec 2022 10:33:20 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id t10-20020a056512208a00b004b501497b6fsm465963lfr.148.2022.12.13.10.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:33:19 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] i2c: qcom-cci: Deprecate duplicated compatibles
Date:   Tue, 13 Dec 2022 19:33:05 +0100
Message-Id: <20221213183305.544644-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213183305.544644-1-konrad.dybcio@linaro.org>
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
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

Many compatibles have been introduced, pointing to the same config data.
Leave a note reminding future developers to not do that again.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- new patch

 drivers/i2c/busses/i2c-qcom-cci.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index a4b97fe3c3a5..01358472680c 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -811,9 +811,15 @@ static const struct cci_data cci_v2_data = {
 
 static const struct of_device_id cci_dt_match[] = {
 	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
-	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
 	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
+
+
+	/*
+	 * Legacy compatibles kept for backwards compatibility.
+	 * Do not add any new ones unless they introduce a new config
+	 */
+	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
 	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
-- 
2.39.0

