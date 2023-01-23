Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB50678773
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 21:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjAWUS0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 15:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231981AbjAWUSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 15:18:22 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF4735279
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:18:20 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id n7so11946872wrx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FflYPwr3M/bnWPvk5ojh/SDXRU2zuT+fKUMW5bHVZVU=;
        b=anAeWvTLdi1pF9jtm4TWVL/XxAXUksOyceS9GZfF72xOmEKnPLB7FkFJ5w0kLyBsSY
         f9SvHjXioyo3glKeD2Wzn/FMtrAfGT8MRTrIbsUccSNtTscxJ9h2ulra5z4TPvy2U9n0
         ZkQV7ZB2CthUkXwJVsmLlwhDdgz3XB6fJKP0aqst9/3JdQcFGOePpUgZOI0aAQtCeSjp
         70/w8p4pCdNvoObjrhbevR4FI1xD//y8C2zJEYo9jTl3WEuw2ppIZgn3oDLaVvVgVIDu
         AlKJ6r+gaLv9LBNjPlHn01uxF24B21KVDTCfoDgFXiRXAKKuOdnke5KSvyoz4wn1XtIy
         C7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FflYPwr3M/bnWPvk5ojh/SDXRU2zuT+fKUMW5bHVZVU=;
        b=FmPzHfU8B5+mbROPxF8UdZFUOryyqqwgP44W1RmcA+vcs7pVg944QfD+c/yi+nfheH
         D29sAke5ln0+qI874Qu0RpcaiUG/bT1vSoZed8GIYGXcKCo1iYzWcpCk94Cbbp7WjXpp
         /RDwSeOEV/LJ+vkPxZBQo/IynOSL/E6EMa8FN3DcYIY1wLCdNAolShSIzQzsQfMcUIRA
         t/UcZdNaaynRGDMZqy1RqyUNJRvp3UotItOeZw0nJ+pzs8WMAe8SYqanjYOoTdhc9sHe
         qqu/wSNb04NxI1yJXcuz7vFsID1OPqS/9jffmMGyQXnHU0VbiDwebV/vdtmgkuibSe29
         6Xgw==
X-Gm-Message-State: AFqh2kpi0pM7V9Eat6LfqYYFDczLyGqZ+RSvB3ZO9Va34gUfLtYBkqTl
        k9CYqWaufoXu5PjLBWKtHeOS/A==
X-Google-Smtp-Source: AMrXdXv08153HfRvW8bM0I5g+nTjDJyeBcfgRRZFjH8pbb2MQMmyx4aarBkFE9Q9Zv1qpgAd14wXQw==
X-Received: by 2002:a5d:6e8f:0:b0:2ab:78e2:864e with SMTP id k15-20020a5d6e8f000000b002ab78e2864emr22085836wrz.19.1674505098968;
        Mon, 23 Jan 2023 12:18:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d4b01000000b002be53aa2260sm210078wrq.117.2023.01.23.12.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:18:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] clk: qcom: gcc-qcs404: fix duplicated num_parents
Date:   Mon, 23 Jan 2023 21:18:11 +0100
Message-Id: <20230123201812.1230039-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
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

num_parents field is being initialized twice:

  gcc-qcs404.c:63:32: error: initialized field overwritten [-Werror=override-init]

Fixes: 2ce81afa0c7c ("clk: qcom: gcc-qcs404: sort out the cxo clock")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 5f58dd82d3fe..a39c4990b29d 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -60,7 +60,6 @@ static struct clk_fixed_factor cxo = {
 		.name = "cxo",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
 };
-- 
2.34.1

