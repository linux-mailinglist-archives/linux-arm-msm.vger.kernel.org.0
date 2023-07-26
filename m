Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58E3476377B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 15:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbjGZN02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 09:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbjGZN01 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 09:26:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDCBE2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 06:26:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso10765985e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690377985; x=1690982785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwjQCpCfOEJj4nimKSDJjPHZcz9ikZvmWQ7qOX3431M=;
        b=zT/i9uuRDt+yId4R1ojSpNSvcir6tRZadDAbV6Wny2zZu0Lyv3Wv+qbzRW5a8XiB4A
         ZvF2LIdzy8OE0XVEGVU0tDXtZjZQnJKlV+XxK/97TN3oTlKMkPy51JDAQxE8M8HhQfFL
         jRUDCgvwqMi+Cpd+6Ka9T7e9YiRY0rNwwFJphX4b8amOR6SUFJ8lCLiNzPEvVHtKSGP4
         S+QwI73+2ZhZcQmEEYq1HzjiE8SCNEzQJRXDUyZdolOFo6Ai4jtgX7tTpwxTgIMkf09X
         sNBzxZdAgeutTn55bW9KECHSF6Sf9qzfIt2g65GJbCi5vNZrZcOvqhof8MDPwdS7CvOF
         UVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690377985; x=1690982785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwjQCpCfOEJj4nimKSDJjPHZcz9ikZvmWQ7qOX3431M=;
        b=XSg5Ca1YWD3a+xXL0nENoaPFx7tBJ6baO4RwcXt9fD76V+O3fMC+cb/hdSWjWmLCJA
         VIwK5t/XNjne1wp1Qs3qvb/OS21rCKqq8qoIP7ydwylTz5Fp8Y6QCXOI60beMt7ZMsDt
         Fllp/PMTlB74Quabfd5r02DEJ5YgelGBkYemu/PmtZJ6jwcS5g2CtbJkRXP6kAVlnYCV
         aiHXxZC/N2WGV/Bo6DXRD9mGxNpz8lFIaIJR4g5sD2fqt+P/SSVOhTsFWFv3FAl98COb
         0etW5I/RwHoWXeldN1Hu0IeI5RS4G7r0TJ2hIop8iYvGzbi0MWbD+K1v9s1m98hdiPAH
         rWqw==
X-Gm-Message-State: ABy/qLbhcp4Wruf2bJErOVm4WM3p2lBZU1xyV3jCsR3vJMF3gJAqi1Bb
        r/muhdGj1/QV0RrtmTNx/jXrRQ==
X-Google-Smtp-Source: APBJJlH/LmuLVACTSaYxROWypIaDANfYQnUj51ToYkVa4kNLyMfiM+WXzqvCURYfxtTMOueXEG0YTQ==
X-Received: by 2002:ac2:47e9:0:b0:4fd:d08c:fa3e with SMTP id b9-20020ac247e9000000b004fdd08cfa3emr1296999lfp.42.1690377984838;
        Wed, 26 Jul 2023 06:26:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl59.neoplus.adsl.tpnet.pl. [83.9.31.59])
        by smtp.gmail.com with ESMTPSA id q20-20020ac24a74000000b004fe08e7dfbdsm742265lfp.44.2023.07.26.06.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:26:23 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 26 Jul 2023 15:26:19 +0200
Subject: [PATCH 1/2] clk: qcom: reset: Increase max reset delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-qcom_reset-v1-1-92de6d3e4c7c@linaro.org>
References: <20230726-topic-qcom_reset-v1-0-92de6d3e4c7c@linaro.org>
In-Reply-To: <20230726-topic-qcom_reset-v1-0-92de6d3e4c7c@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690377980; l=566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3BR/u3fZ23sS3+cIHldabWhPszlrqMwlNCmlfPyu0J8=;
 b=Mn8YoTIjy0jBDF1F4mmrxLegHBGFymzW0x8yviOJWut/dGKoR7DuQtPkKRGA5V7MYFxpTQACp
 2hzWsnFMoijAgoHUDZIvSRJ3l04idJiHatC6NuG1IqwsnnSRDCz5Ux9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

u8 limits us to 255 microseconds of delay. Promote the delay variable to
u16 to hold bigger values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 9a47c838d9b1..fe0561bf53d4 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -11,7 +11,7 @@
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
-	u8 udelay;
+	u16 udelay;
 	u32 bitmask;
 };
 

-- 
2.41.0

