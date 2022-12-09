Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA8E648278
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 13:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiLIMjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 07:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiLIMjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 07:39:22 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE49072870
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 04:39:15 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id c1so6824179lfi.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 04:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vC72Obl4boekndxJ/gSAB3Hq6ZKhB5iJCxun/TEpQs=;
        b=E1skbSe1mG9A+zYJcoS5XVXJhw+FBKq/Z712q/VtlPU6JwGAnipH00voVtX1+fhWVF
         4gh3W3eQ2asRmKjewmx5oGMMuAhyzOUf+5lrhclj9hfIV31/EFjZrZD+eyH+syX2vq06
         zwETn4hIhFHASveez/k4A5N1Z+PyEaf3yJvGRUW3y+unSAcztg8LjDq+9GA0gMxoMzJH
         UtBrRtlMtCcJ9FDFRxOlQjM4TSCTFhH17Hep48RVht7NOLk6uVHj7eQ6WLZGtRDCBa+O
         a3kduRd0lotQ9ENqWlQAq7EINTYCuqjwbpwRKIEd0mtLExtaNf7+Yx2jDjU7H92jjpsJ
         47iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vC72Obl4boekndxJ/gSAB3Hq6ZKhB5iJCxun/TEpQs=;
        b=uH1QF5BVNfJpZyF7h8CMNCiUEo07uDUgnPfrJKpPCGnVmcJI2ZakrCbaX/cyrDkXue
         deKXgFN9Zy+t4E6bm+XX4PI1cp6CWtQBdyLNHc41OFbfnWW0wKuDTl89nN8gCBOkehW3
         4ZRJXR0ZCGqVn3WcnJxNwsbtrmAE8Z1BgntAdImB42njWoBByI+rA72/VG9ZmSCl8Nh+
         zrb1eLSzX9gDmIvSdvF/AYQA7mIL5OF4Wxg0GwrH+0I3UiWmhD5RhN9CFu6e6i0oXFZU
         CRmwy/B/C8u20BxYckFqQWAC0rUmE2HrnamdrIfR8M3nNapF8IFU5GF0iYXknEoqBBGK
         +aIQ==
X-Gm-Message-State: ANoB5pl3hmDPLlvZsy86IDjDejtA++DqvvM2+yaBlWxOlGzjY5KE5cL0
        s6+GqsPdmX/mzippK2fkSYuJD6uk/lnF0MUw
X-Google-Smtp-Source: AA0mqf43bzwJMJS68IFj9cpk0uk+OFLaMyuMjersk4I7KqV6xFSZJ3XChc1EwWjYdu6JBkp0ffraIQ==
X-Received: by 2002:a05:6512:2007:b0:4b5:6504:a556 with SMTP id a7-20020a056512200700b004b56504a556mr1587836lfb.61.1670589553899;
        Fri, 09 Dec 2022 04:39:13 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b0027710117ebdsm205321ljo.121.2022.12.09.04.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 04:39:13 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Iskren Chernev <me@iskren.info>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm6115: Use floor_ops for SDCC1/2 core clk
Date:   Fri,  9 Dec 2022 13:39:09 +0100
Message-Id: <20221209123910.178609-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Just like in case of other SoCs change SDCC1/SDCC2 ops
to floor to avoid overclocking the controller.

Fixes: cbe63bfdc54f ("clk: qcom: Add Global Clock controller (GCC) driver for SM6115")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm6115.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 565f9912039f..5b8222fea2f7 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -1258,7 +1258,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parents_1,
 		.num_parents = ARRAY_SIZE(gcc_parents_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -1305,7 +1305,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parents_11,
 		.num_parents = ARRAY_SIZE(gcc_parents_11),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 		.flags = CLK_OPS_PARENT_ENABLE,
 	},
 };
-- 
2.38.1

