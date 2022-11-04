Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE1B61989B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiKDN5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbiKDN5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:57:13 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DF42F64E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:57:06 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o7so4583608pjj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUmqfMirOXscpTm4z7KeYAbRwSxaLS1LCpAqzIugH4o=;
        b=eFXFoY//OFMqP6HSReO/W8MW+RQMgzamdcVyeG9A7zNIChv+0Da/f6kd5ZBVa+JgOF
         sqx8QNOHF8Iz3fjRKHGsiVn65gJms5N1Uh6g0EIJTCKtoxXEs6BITwDvAu1GMU0PHQN5
         HtdwShla/MTLqVq2kK6sGwV8+WKJNedmFYYQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUmqfMirOXscpTm4z7KeYAbRwSxaLS1LCpAqzIugH4o=;
        b=1MgESWkYNwYLmxJyUGOOCtyD8ZzcffZpMmn4NelcM2kAZRwNHmvE1c/dS1LW4FOSB/
         4kyUgBjLOaogEYI2BPPqt+F4y300IUymqWaY0Sqk8Auj5t/K/M/cQHaDpKetpvg5l9XW
         42E/Xdl7iA4uvEy/b6SdBnjhgQCKQrorrgHaxFntfWcd2VUdX/SPF1zUd/FkIAgrM0A4
         Ug11Qe7ix2HCp1Q0ZZ+hVpbPIuhpTnB+T8afmA08s62AKLECAhdsWTSEbSYCdBdwPbJf
         nsHnY42KIkuG7uGgH9OAOgZqkZnVnWCZl7pwDO+6vz1VTTEMOTAsLIJtUd4cKgBBwsJE
         uRXg==
X-Gm-Message-State: ACrzQf1/1xS2KFsyY3N/GiGhkRiFk0yg46IPbJAZxDCtdta+Tp/4qWl6
        Dkhk4ckETVBhFPoR5kHtkgodSg==
X-Google-Smtp-Source: AMsMyM6YOXj7u1WgsbjsDS1av6KmpteOVbK1rTWolai4sACAFuPp73MaXdq2vfAzhGY0OCEPUPJuAQ==
X-Received: by 2002:a17:903:41c3:b0:186:dfe6:f25 with SMTP id u3-20020a17090341c300b00186dfe60f25mr34810903ple.47.1667570226254;
        Fri, 04 Nov 2022 06:57:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:5e74:f068:4840:3631])
        by smtp.gmail.com with ESMTPSA id m6-20020a62a206000000b0056bf29c9ba3sm2829367pff.146.2022.11.04.06.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:57:05 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: qcom: lpass-sc7180: Avoid an extra "struct dev_pm_ops"
Date:   Fri,  4 Nov 2022 06:56:30 -0700
Message-Id: <20221104064055.3.I90ba14a47683a484f26531a08f7b46ace7f0a8a9@changeid>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The two devices managed by lpasscorecc-sc7180.c each had their own
"struct dev_pm_ops". This is not needed. They are exactly the same and
the structure is "static const" so it can't possible change. combine
the two. This matches what's done for sc7280.

This should be a noop other than saving a few bytes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/qcom/lpasscorecc-sc7180.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index a5731994cbed..33ed91c67e1c 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -459,7 +459,7 @@ static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
 
-static const struct dev_pm_ops lpass_core_cc_pm_ops = {
+static const struct dev_pm_ops lpass_pm_ops = {
 	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 
@@ -468,20 +468,16 @@ static struct platform_driver lpass_core_cc_sc7180_driver = {
 	.driver = {
 		.name = "lpass_core_cc-sc7180",
 		.of_match_table = lpass_core_cc_sc7180_match_table,
-		.pm = &lpass_core_cc_pm_ops,
+		.pm = &lpass_pm_ops,
 	},
 };
 
-static const struct dev_pm_ops lpass_hm_pm_ops = {
-	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpass_hm_sc7180_driver = {
 	.probe = lpass_hm_core_probe,
 	.driver = {
 		.name = "lpass_hm-sc7180",
 		.of_match_table = lpass_hm_sc7180_match_table,
-		.pm = &lpass_hm_pm_ops,
+		.pm = &lpass_pm_ops,
 	},
 };
 
-- 
2.38.1.431.g37b22c650d-goog

