Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD46D6586C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 21:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiL1UgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 15:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiL1UgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 15:36:01 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681BD165AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:35:58 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f34so25019288lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCmkjUXbYIg7r0qiPTGP/L4L4D6bah91h264EBnNYRo=;
        b=wmFpkSvKTv2rgT1bkrLnjLYWXr82lF5+g5mpKy/Tr1QQ5a4yUgDKcTWDqEuC2jq0wl
         btvoy3GDcyvSYJISZQyD1uJDdxpvjRH2S+3+kCjHaP6BaALxtNQfDnnvS6oni/L8Yl3f
         gvia4slUTuJ0ecmDAtf+MIrXh3lO53/rx1Tnci4XNh2TLxYPQPu2a0r2X6AfO1THhw6D
         3/YVpvdDVIPJePundb049QZdewpIOdGHtof/0Ey9+HXKwhYmvGeP2tqMqujCiB+FMxa4
         pAyHhbM45W5W2/Yd+loEmEsKz3hvlMgxR8HRH0HsoPTJxDo8hOlQJS0ABJTindRPZ9pm
         mxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCmkjUXbYIg7r0qiPTGP/L4L4D6bah91h264EBnNYRo=;
        b=0Hv1ZFfndAtNtOY4Rf9nw19VzM+4bUCvCAjhz5fYonGQMgPQpkm1sUqw/oMk3jUSbN
         hDg5bRG8aO8R651T25OHVyIjTk1Cwc4Wyew9ckJHJ++KxBIdDzDd52Vk4wzXwjKeBkRs
         HV7UgTtvUlnXjjdYXJ/7rLtDyDSO/0a30ZEbchcIXTcP+hR6r+kyp8ye8x0DzQorNlfP
         0sh4uDM0+kJYzx0oO/IdQDh9LFqCX08Irv7PhreUXddscvYirWCeKeqI5ydr3GsyMRfd
         OQg+hCPXfSeITKh0ZPU/rTzRI5A3OHOtW5Oq1nip9aGHcIlbJYFgWHOTaHDt/DQpZ+J/
         8VLw==
X-Gm-Message-State: AFqh2kowJM+tB69ajTjTZ5RxO11iZMIjF8Lkg7VEdRQniwWEC+OQ7iDs
        /ZK4gNKwyinQgvUT9x64liEVsA==
X-Google-Smtp-Source: AMrXdXtLqfzsD4NuV9Pozz/O3Ob5sEMQxs5F2ZeqeNcqLHEZ4NsP4L0STX+xl1Ts0n2tfW0ZhzUplg==
X-Received: by 2002:a05:6512:4014:b0:4b6:f22c:8001 with SMTP id br20-20020a056512401400b004b6f22c8001mr12453563lfb.56.1672259756766;
        Wed, 28 Dec 2022 12:35:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bi2-20020a0565120e8200b004b543f38b7csm2808384lfb.21.2022.12.28.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 12:35:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] clk: qcom: common: use parent_hws in _qcom_cc_register_board_clk()
Date:   Wed, 28 Dec 2022 22:35:55 +0200
Message-Id: <20221228203555.3130090-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Switch _qcom_cc_register_board_clk() to use parent_hws.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Properly fix the clock's parent data in case parent clock is present
  in the dtsi.

---
 drivers/clk/qcom/common.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..9f2bd37c9540 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -133,7 +133,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 	struct device_node *node = NULL;
 	struct device_node *clocks_node;
 	struct clk_fixed_factor *factor;
-	struct clk_fixed_rate *fixed;
+	struct clk_fixed_rate *fixed = NULL;
 	struct clk_init_data init_data = { };
 	int ret;
 
@@ -161,6 +161,8 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 	of_node_put(node);
 
 	if (add_factor) {
+		struct clk_parent_data parent_data;
+
 		factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
 		if (!factor)
 			return -EINVAL;
@@ -168,8 +170,13 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 		factor->mult = factor->div = 1;
 		factor->hw.init = &init_data;
 
+		if (fixed)
+			parent_data.hw = &fixed->hw;
+		else
+			parent_data.name = path;
+
 		init_data.name = name;
-		init_data.parent_names = &path;
+		init_data.parent_data = &parent_data;
 		init_data.num_parents = 1;
 		init_data.flags = 0;
 		init_data.ops = &clk_fixed_factor_ops;
-- 
2.39.0

