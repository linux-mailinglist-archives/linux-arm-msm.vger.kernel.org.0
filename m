Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B424E615EA8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 10:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiKBJCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 05:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiKBJCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 05:02:05 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C765D27FF4
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 02:01:49 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id v7so4452390wmn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzmAJH9YQHiTesc1z9ldOLJSqv+prtu196GqUJFfcRE=;
        b=ILs12tG7hkbdb+cHXkxKXea+I+frdKuFfWAEQBS/FUNC8M4BZz+TZIN6TdQWbIXBqB
         uWr1EoCMvueKuJXvqRVxJswPfnoUY5awGN/EBZGM27GsfzeCra3ziYie7SmsFzl5TcPG
         TNfy2wsop4uUUTkqXh0xvxIXs29baDgvE2Zk6csI6nq82z3Wydw9OPr2iIIRcSVQkgAG
         mG03T5lD2N+/SyrxE+/6lz1JjcaUvwEKgQA9BJRzd/84o27lzeNU40PCmrEfycndoEVk
         eb2Ev0kBptHDyknyxypIq2wShneh6WbC4nC5kF9LRzDyfmUFzEFE07MkwG2Ot5Sqh3Lu
         SlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzmAJH9YQHiTesc1z9ldOLJSqv+prtu196GqUJFfcRE=;
        b=W32OAQu1Ei7wKsSXY7lT+kxKuOyC0h9LQBguIsRZy2EomSwCbqVqU7HIRs/UE0KZo+
         H7JmbLKNo6wr3lA9p+zdCAa0MBQgfF/iD6biZ5et6Q1xdEI5DKSFbvZfuqK71QH1GgEv
         N6vH5kFdDVRMyxideHRC7shzbevBPqXaqTh7U9h/e25ebJS8P1JWn2Ip/7PFj5MCPgkP
         3tE3Cm4SdvP5I6b3s1YDgOuEXTA46t1bkdB3aO+cLcjsfsM4qQuKio21lXtm1GPCrOfg
         peIVuME5SaZmpqLPKv/QhJIMb6eCAty/XgzCk1PDMD1JpKFMxogtjZoZVeL3e8E5vCP4
         jA9A==
X-Gm-Message-State: ACrzQf1BsSix5kPxN9YOIRq6K6t7i+/dhoM8x4FyawIpCbmPhfA6kpL4
        VZhxniAcl1WGDl1IgURXQ2wJLQ==
X-Google-Smtp-Source: AMsMyM7symkQrgKHjzoO57cPYLKB0VTs4nHaHnnnm9WbAAevST+d6XYEcpMQHfQ6g66VWM5OyjIxNA==
X-Received: by 2002:a05:600c:1609:b0:3cf:4dc4:5a99 with SMTP id m9-20020a05600c160900b003cf4dc45a99mr14842484wmn.67.1667379708335;
        Wed, 02 Nov 2022 02:01:48 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id bd26-20020a05600c1f1a00b003cf6c2f9513sm1425322wmb.2.2022.11.02.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:01:47 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        dmitry.baryshkov@linaro.org, Jonathan Marek <jonathan@marek.ca>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 2/5] clk: qcom: dispcc-sm8250: Add RETAIN_FF_ENABLE flag for mdss_gdsc
Date:   Wed,  2 Nov 2022 10:01:37 +0100
Message-Id: <20221102090140.965450-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102090140.965450-1-robert.foss@linaro.org>
References: <20221102090140.965450-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All SoC supported by this driver supports the RETAIN_FF_ENABLE flag,
so it should be enabled here.

This feature enables registers to maintain their state after
dis/re-enabling the GDSC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 180ac2726f7e..a7606580cf22 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1137,7 +1137,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.34.1

