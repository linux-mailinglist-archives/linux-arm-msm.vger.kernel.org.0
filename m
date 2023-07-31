Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02B8769605
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 14:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbjGaMUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 08:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbjGaMUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 08:20:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9B319AC
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 05:20:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso6847451e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690806014; x=1691410814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf3LmmIWrMau5faq7nlMlPKiUzu+qP0dMuprgORcSfE=;
        b=K0GOcdcUPKkJCrwm9ic7QHRzs26pamIeLtNk5RCHei5D6USQDdlP0KDljYOLhYu6lF
         DJ8hXefNOSNr3LEO8N2cmvF4IZ4sUQS/NzgOw0aYkJSPXQRy3rtpcyr6hhqrzJqwelRF
         528mDua7HxjToYrkIgrkhTwRPv0TlthGuWp1Mkk2+Uxbk1hgex/HtBwzOD4qNvNrhJal
         CBpY0jiu53MiCyXWs1v6xBV1mxUvq83QjdA2wAlxJmCXeXXA6O/6mbzz9pEEHkJ27Nxx
         nwlYvcr662OVpWcxN+AypwXcFKrrwAyRq6aFVLYprmIijv9yq2hyQPS46Q8pbdrdtHhC
         j/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690806014; x=1691410814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf3LmmIWrMau5faq7nlMlPKiUzu+qP0dMuprgORcSfE=;
        b=Ym0lwTOyF2zccOzxBaoTuc7Bmt26w8hntVqNRQg97ZX4EGp6kEQmMLGAfTZmx98J11
         DZPX9oK8Cx4t2ysYYbImqdd1MSQMvQGr2GuXy3BEUIldZAjqTDCrEjv4jaNqAyJVuS8K
         EYwZBls4yxzdLs/YqSmz7JNqnTRZMhtOhNthSQWnQZh7GOGpKpoU3R0a6/DSL4TWyaF0
         D3OCKM/NigehyxfSVUAQjB8BbwLX714Gt4gRMFiUX+F4xtP76ZGcEjFG8xDQYlUSHegQ
         u30WVTlkLITQ1JpQUs/49KiD0Jbc0Ebcq2E8lHlOqPTyTnTLuXQiez26ZSHeU7wkyfSF
         hQuQ==
X-Gm-Message-State: ABy/qLYQ5PPT95CiipgnvlP9gai/JpZp5rUUMbiRO2DkiSEwqp3n3WEi
        T/4uL7KNO+m7GKacWJE3kc4E7w==
X-Google-Smtp-Source: APBJJlHK1YJ+ycb2Mi0ZGLtYYsXsm/rpLz0hFe+W+eN1LdFXfUN0jmtDbMkk4kss6l5PSzy/TZI81Q==
X-Received: by 2002:a05:6512:360a:b0:4fe:de3:9fd1 with SMTP id f10-20020a056512360a00b004fe0de39fd1mr4731653lfs.36.1690806014533;
        Mon, 31 Jul 2023 05:20:14 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id u9-20020a056512040900b004fe11366146sm2079096lfk.51.2023.07.31.05.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:20:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Set PCNoC clk always-on, with or without interconnect
Date:   Mon, 31 Jul 2023 14:20:11 +0200
Message-Id: <20230731-topic-pcnoc-v1-0-452dd36d11d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPumx2QC/x2N0QqDMAwAf0XyvIBtHbr9yvChxkwDkpZWx0D89
 4U93sFxJ1QuwhWezQmFP1IlqYG7NUBr1IVRZmPwrQ9tHxzuKQthJk2E8+Aesetd8PcOrJhiZZx
 KVFqt0WPbTObCb/n+F6/xun4pYsrrcgAAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690806013; l=885;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DpM74YJFMGMq7VqXTxFkzlshoHNLJraxbS0yzf7ueLo=;
 b=P3thT/6NZIx2XNQm85ENg0Oe3UkQyRtif7N93V4ggDQwUhQWUuV7SJViO2+qU4A5UC0HyxOtR
 vKnaGz2QSSrAdzJQeV08VdXp++xFIjKTshmAF4KMIOWDv5du/o3pB+S
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCNoC clock needs to always have some sort of a vote hanging onto
it, so long as the AP is alive. Some platforms guarantee that through
the interconnect driver, while others (that register the PCNoC clk
with the clock framework) don't, which results in a big kaboom and
force reboot when trying to suspend that clock.

Solve the issue for the latter group.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: smd-rpm: Add a way to define bus clocks with rate and flags
      clk: qcom: smd-rpm: Set XO rate and CLK_IS_CRITICAL on PCNoC

 drivers/clk/qcom/clk-smd-rpm.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)
---
base-commit: ec89391563792edd11d138a853901bce76d11f44
change-id: 20230731-topic-pcnoc-d819a4713254

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

