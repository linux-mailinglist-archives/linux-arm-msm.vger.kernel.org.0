Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45476AA9FA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjCDN2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjCDN2W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:28:22 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B271F5D9
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:27:57 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g17so7031559lfv.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AtLMGyHyO0DGJrz9avniGAQOG2e5k9Q5CL75KRC6OM=;
        b=whQufuE4xPYKNBQlB4o7vMLsVvnFcW416wKkTov+dpQTOo5kVcU3NlhTaZEAYOeqKt
         kWZciHVP4+0mzHeFmt+j5KKmfM7nmkbD+11InOsBeHhZV5OZ00+Rw0bJydkA0lHVYGMR
         dBcGwacoM1RYmMHSjV87+SJKQsGDb3yqfyZ2rsA8d12hUcxQxx94mk0cKFGcPJTsnSWH
         eUUxxetOc2CmZox337roI/cYi8UT1BeS6HGJHN/Rf/0djC6haru+c0q6i2ziIyZZ9g3B
         tR9gKyhw0ZA4TjtW0bpw6iYM5nucmxtSxNbCc8/nTl+yhJiMskyYbUcPsx5tKHQFTHtc
         g0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AtLMGyHyO0DGJrz9avniGAQOG2e5k9Q5CL75KRC6OM=;
        b=oOis3DsRe8MINNTxZBO6dDQyJ1OJ7ZrNkR7eDu+lGspr2B8JRvEMnBuSPiD6G58qS4
         RxCdf8Hc0sK3L/mKtlU5exB423TJOmBhurg0jbawMKyxbH8Jsi9WRz5slulHX2RapHh5
         ij9JJqX8jHpKWhzyjuLlttv8uXetrYgnDiykz5Jvb/K/7ys0/eocREG0TWIHuBmSFvNz
         FWFXMN4ypG9PUwuOyHVkHXq5VIPMQjOr45Z7oc+CYau+cKimWCdwQAzXZW9Z2gKn9BZQ
         fblFkhi6W7cEt4rDC+vTL+mt85fi8RxQNjY3/srkl7we0Vt5OdLdNIBbBWc1FKk5+gDD
         pO8A==
X-Gm-Message-State: AO0yUKVSGexSfZq4cqKQFMNOJoT8w4e9ctbxaGSvOhrDaTlSz0YG0HKM
        rACtEb2LVsNZ3079GTyXzrvdiQ==
X-Google-Smtp-Source: AK7set/l+w9G8QeTIjgW/hFxz0aJn2ygeLvf7Ga/Jm9WS/i1IVQEkPO/pLjw4YaTTMbEnIv4TPoD4g==
X-Received: by 2002:ac2:52bc:0:b0:4dd:a61c:8f74 with SMTP id r28-20020ac252bc000000b004dda61c8f74mr1593826lfm.51.1677936476736;
        Sat, 04 Mar 2023 05:27:56 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:56 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:47 +0100
Subject: [PATCH RFT 12/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MSM8994
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-12-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=782;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=BHqSpJ9W8in8CppNMmIU5onolGCmZoQTDTEqzTGWbJI=;
 b=yx8/S7yrctomj+dbBxMr67Ggx0kK28RoU1nxCgK4qvZ6wjlGYKZGdYpjXvj6H/XAXXn8MdMDxwUP
 +58tmt5UCeLHIr+uJsj81z5AKxwDBHipljybmkI+mg9UXrp2+YLg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8994 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index c7c623b258ce..4b6037e804ae 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -844,6 +844,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
 	.clks = msm8994_clks,
 	.num_clks = ARRAY_SIZE(msm8994_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *msm8996_clks[] = {

-- 
2.39.2

