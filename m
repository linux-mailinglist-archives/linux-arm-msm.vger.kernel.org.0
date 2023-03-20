Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F16036C13C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 14:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjCTNmr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 09:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjCTNmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 09:42:35 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BE3A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 06:42:33 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o12so46877253edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679319752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bAvIgcdwvK6qGlX9/tkRQ+PgCIHsC6PUxID2XxtmJs=;
        b=uQJkr15djkVmBgXdKKgYT+9o9C75QiioeKW8Q5/wJYPZfxnhvse2/8a0DDverHAWLS
         V4MRks7KPnmb3/58MMbQeBZJCd+WBChFQ/qlPGj271EniIbqjMTbcFNtivNU+bjVjPo3
         VJ8RMTBwR3qb8UntS5t8Mbw6a7v6pOYhS7hWQ322eXdq3ae0xeb281kDss612++wBbkl
         dFNiQ9tS/f7YmtYvC8fQTGYMgak7u2A8A0NWXOYfPEzqdzOVdoEsbBM1FOBolkv0PEJG
         8F5nYdKwqjF2UqeqKa5HdYWamA+Adnph+EsOxTr0nRpV6i04HhKU+5xExxxro1quh0yR
         j/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679319752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bAvIgcdwvK6qGlX9/tkRQ+PgCIHsC6PUxID2XxtmJs=;
        b=JBVNJ0hwbuF3fBgrehT8HEQ1hUq5zLYJsXEEs5kyZ9RwuEFY1b4uLs7yCOI9gjWhRy
         MIaCQKir6kF8GyO8c0JN4+64opz+AHlkGWrTIvd4mK04K51SMHGdYD/PCwKXMjTdvmi+
         B5IB2Md+uuHGGPIazyyESE28mNHiNHOO//0Vr3up2N6tb/Vb03+f4Sm4VtLcyCI3KF4D
         IwGzrM19Y24KBX3l37EdlWZJ/uLgV2jdue2HQSNfozfi9b+DbA003ahNx7BS/+RnZ4BY
         nhKpkWB/PST96/elU3si6ZL3dgUI2rBuftshLLAm4dz41F77nGTRXNRpLDxC2a6vHg2l
         /isw==
X-Gm-Message-State: AO0yUKXAfddUjxTM3w8ZH8MO32qs1BqLpGZPXqTc9xRMlaYwhpzONRf2
        RejAok1Uf0bdOKp7P4+/z0cegQ==
X-Google-Smtp-Source: AK7set+MK8KcRE7MiT2j4MzvskiRjviqc1Ln0yYh7b/PAFNB5eSsRSEpWjDZaOM3sZzgMOex9ThcPg==
X-Received: by 2002:a17:906:5015:b0:922:ae30:3c23 with SMTP id s21-20020a170906501500b00922ae303c23mr9566199ejj.18.1679319751913;
        Mon, 20 Mar 2023 06:42:31 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906409700b009334a6ef3e8sm2368602ejj.141.2023.03.20.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 06:42:31 -0700 (PDT)
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
Subject: [RFC PATCH v2 5/5] clk: qcom: Add sync state callback to all SM8450 providers
Date:   Mon, 20 Mar 2023 15:42:17 +0200
Message-Id: <20230320134217.1685781-6-abel.vesa@linaro.org>
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
all the providers related to the SM8450 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/camcc-sm8450.c  | 1 +
 drivers/clk/qcom/dispcc-sm8450.c | 1 +
 drivers/clk/qcom/gcc-sm8450.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 51338a2884d2..b2c6109c7eba 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2847,6 +2847,7 @@ static struct platform_driver cam_cc_sm8450_driver = {
 	.driver = {
 		.name = "camcc-sm8450",
 		.of_match_table = cam_cc_sm8450_match_table,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index adbfd30bfc96..0ea719940a8e 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1803,6 +1803,7 @@ static struct platform_driver disp_cc_sm8450_driver = {
 	.driver = {
 		.name = "disp_cc-sm8450",
 		.of_match_table = disp_cc_sm8450_match_table,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 84764cc3db4f..248709fb975e 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3262,6 +3262,7 @@ static struct platform_driver gcc_sm8450_driver = {
 	.driver = {
 		.name = "gcc-sm8450",
 		.of_match_table = gcc_sm8450_match_table,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
-- 
2.34.1

