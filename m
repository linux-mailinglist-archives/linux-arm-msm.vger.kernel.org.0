Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB74C6C13BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 14:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjCTNmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 09:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjCTNmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 09:42:33 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCAFE381
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 06:42:31 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id cy23so46807475edb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679319750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Htzjm9MSCo4/scEOmWkP20tbOGwc7n5xhdN8GyJQ6GQ=;
        b=bg8QBqEMCU2HBbMjnyK7G8pFNFhcaxlWlgPUkC1vmuTd98atUix3MIbBpG3lJAys+0
         2OxXvRg04f1/Y4Zw8e3Vi2GHv7C9QlOn47ZCDI6ypkC2t9j4c/68f5X7HfJigdkdE4rU
         i6r/7Cch0fOo1xTP21OktKc1Onawn+Hn4+yuBsrBwgR0h8M9V2FtKPI82e3hKXiBAOs3
         0pkDKbVru0PvsTBhhRiwHkOpn+cVCzsC1PdmFNoudWUAkN/Vby253U2/xMXn+Gzbg8yk
         ZxWg6fRkJz01IddW7B7uWGI0TLzKV5ppQJdre2FTgTZw29WSq37fGZgEi2MlHSxuctke
         Iqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679319750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Htzjm9MSCo4/scEOmWkP20tbOGwc7n5xhdN8GyJQ6GQ=;
        b=m1UYBCOpZfB8VFVs35Gwl2a86Ys6Q0eWWhroARFIhKTzmbfHa3WEmAqX9UeK5MdP01
         dICrc4W+uxY1ADB+g8nFiNTWbqoBB53zHZ/ldJLAiF1nqGJWgUwzKMhXEq6R0/HFWwFJ
         GE/x1TkLHkE8nTgNSExGP6pnnLy+PKXt0yjoRvCCCtzEbatUnjKigejDc6qdmBrLeaPC
         h62gzvUC9FKY76s1kveBgIcdXDxBe5Wgrwg0rkCORiILYpCg8wmg6MdfOEw8DEx3E42b
         kIvrssltGTYY5+IXiH9DX8KG5JTkfIhY2tfGuMxQ7kNjealojIZtJGqNbFCY1R5SlHXk
         Ei2A==
X-Gm-Message-State: AO0yUKVZvVfGQ6Az8PJAbBU9unsz+ZENOdz2kfFV5p2mAiazZGYEPCj/
        ylOHyMYIWRPflxjSDgb5eX9MvA==
X-Google-Smtp-Source: AK7set8r62lDWNAku2VSCK32k/4YB9QoETXYmzVcob5j4AQs+mzZFX1MpD0qRD8dnoNReX8JRMdX/Q==
X-Received: by 2002:a17:906:13cb:b0:925:f542:1a3d with SMTP id g11-20020a17090613cb00b00925f5421a3dmr8999852ejc.25.1679319750345;
        Mon, 20 Mar 2023 06:42:30 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906409700b009334a6ef3e8sm2368602ejj.141.2023.03.20.06.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 06:42:29 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [RFC PATCH v2 4/5] clk: qcom: Add sync state callback to all SC8280XP providers
Date:   Mon, 20 Mar 2023 15:42:16 +0200
Message-Id: <20230320134217.1685781-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320134217.1685781-1-abel.vesa@linaro.org>
References: <20230320134217.1685781-1-abel.vesa@linaro.org>
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

Now that we have support for sync state delayed disabling of unused
power domains and a provided generic gdsc sync state callback, add it to
all the providers related to the SC8280XP platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 1 +
 drivers/clk/qcom/gcc-sc8280xp.c    | 1 +
 drivers/clk/qcom/gpucc-sc8280xp.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 167470beb369..a64c396b9cc4 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -3199,6 +3199,7 @@ static struct platform_driver disp_cc_sc8280xp_driver = {
 	.driver = {
 		.name = "disp_cc-sc8280xp",
 		.of_match_table = disp_cc_sc8280xp_match_table,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index b3198784e1c3..64d828ba07da 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7441,6 +7441,7 @@ static struct platform_driver gcc_sc8280xp_driver = {
 	.driver = {
 		.name = "gcc-sc8280xp",
 		.of_match_table = gcc_sc8280xp_match_table,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index ea1e9505c335..46ca242ba427 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -453,6 +453,7 @@ static struct platform_driver gpu_cc_sc8280xp_driver = {
 	.driver = {
 		.name = "gpu_cc-sc8280xp",
 		.of_match_table = gpu_cc_sc8280xp_match_table,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 module_platform_driver(gpu_cc_sc8280xp_driver);
-- 
2.34.1

