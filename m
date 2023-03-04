Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1AE6AA9E7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjCDN2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:28:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjCDN1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:27:53 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6FC1CF49
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:27:50 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id n2so6984570lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sg5MUUS/RsvMJqG0oyZOGmW2KQWocuS/nndCa7/Leo8=;
        b=FxG8MQTgshq7ZXgNGnLPcInBYnPjz7J2SBFZmx5pSSqtfRhePjrXOa3uixl5CY19OQ
         X4cFXTEwCRyR4fM5u7YPvZUv1sO/0wrJQFiNVRq+/mewZM0J0AR3vQ25DuieBnGCF2cU
         9GeyvHL9OnvJfsafAo1bOLq6JZ0X8phUC3m9lHRzG4IGFe3RTTIvYrnby2wBRu4vyesh
         nYznzgsIiFia3aPNvRDyOSXyAI7+zhG2idKnb/Z+dOBnoBuy1/w6iOQHjqeE8ISNRV9/
         ++pndzF/COIAGrZLw29Dds/8BAo8csr+dzZh5yu3xIFepVa85+AMeymiT5CbcVJey4dR
         TL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sg5MUUS/RsvMJqG0oyZOGmW2KQWocuS/nndCa7/Leo8=;
        b=AxcEDENzQ7v/yjOzSgMgg6IuY+OkR2wvYEo/HZnyzjWq2Op5th0jDRQnkl8vBRgEuy
         1ZPucyevRhVr2NmQJD4vBEXHb84TL2K90T2YfVd/b97UV9S4ZxX38Woa/bVqnrcbK8be
         QEqaHFv6+m876m9LpTb4x4NlTwr9NZQ0jlh1BLlFLaO+77HLZqEakU+H0S95eoJDwoTR
         sbtd/KgAQZsrIvj0CS5sCLJ0BAGXulAJcfUEKCxQfh4dUKikfpdc16wSMLW1voohKaI6
         HyCGQq934aD0TvFBsiY148tcNSUJ/ShLIqmO8DfbBR3jH7dB//+qlQGNiG/JCMSbnIKW
         w1Qg==
X-Gm-Message-State: AO0yUKVrsAYLt0XxVGSYZolSfCg607unsH3XypWRySZVzcTAvp3Y5YNn
        tZeVHDefpYQ2Qd7ieFJXdIiUgg==
X-Google-Smtp-Source: AK7set/+tCW5SYFAarvgZpRSOCv39Kef+QfHr0Kj7mSlqn6EBEIYc6rGdd2nV3FNaGywlG7G12fJ5g==
X-Received: by 2002:ac2:48b7:0:b0:4dd:a86c:203f with SMTP id u23-20020ac248b7000000b004dda86c203fmr1482024lfg.49.1677936470120;
        Sat, 04 Mar 2023 05:27:50 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:41 +0100
Subject: [PATCH RFT 06/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MSM8909
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-6-d9cfaf9b27a7@linaro.org>
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
 bh=7ViNlNQmKGvqkVAUmi2Hj/9cd9y9CDyFSAhdPgHMoms=;
 b=9KrpIXyi1i//002Au09KnaAtBtBqtLG0ajmDLO6201qe7dikbcLVaFjDYnyKHxIqa1l7TyUS8Ivs
 t7RNfR9HB0XVfDggzdaONcFoBAwO5lyZY9L8vMbgmaZGbMx0K8xR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8909 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 72d06d9d2619..1a678a962770 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -562,6 +562,8 @@ static struct clk_smd_rpm *msm8909_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_msm8909 = {
 	.clks = msm8909_clks,
 	.num_clks = ARRAY_SIZE(msm8909_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *msm8916_clks[] = {

-- 
2.39.2

