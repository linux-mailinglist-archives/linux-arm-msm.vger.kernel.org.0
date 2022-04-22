Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9EA950B5A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 12:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446897AbiDVK40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 06:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446891AbiDVK4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 06:56:25 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859255523D
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:53:32 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z99so9947798ede.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FUsF3Bm4YCkmboKOMo1H4UXrqyMZV42HmPdb6t+zEg=;
        b=iTwMIkUlm5QdnVZDvAMZ8lv3kIjxsQ9C28n0K6MiwbpwtvFce7ujI+BCC8Rv2gER9h
         a6684oc2VQwqV0D9gVE3quTVc776ypTodMrTG7mF+MNmMzk6nC3837htwDjcK3yrqYu1
         9q1MwMpYT7T1YdAgi5q0/zzUWiT8eLkRI0a2K1W8Ejv5wlKP7UXZSA251z5qHmbCdIUw
         e+JScoyT03JamWyFX0UEHVaaoAaMI6ZZbck336N1e0YwfeUiFB5OSh0WdNoX73I4DbcH
         X45e5by65ELA6hXHR/qnfdriQvrl9tiFN41UWzC+94T5Pj8RgJqQ91XKCGUlBQ0b8gOl
         0XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FUsF3Bm4YCkmboKOMo1H4UXrqyMZV42HmPdb6t+zEg=;
        b=dxxo29Zw5TYBJ010KkIugYTW6JXTRFLqnRR5t3s+ufGUfNayUPcAngzNkVK1h7rswS
         eUdD6yFTBf2NYgpSd7xEdOcRulGQoieW2OgWSyZz7rWOLIb+IW1YJRO2gyF4S87p67bm
         1JzVauyyI04BlWVF28dicFatVkkFtEEYm5UY7LCF9OnMiKimapVY6y3EsLwtZf9eLDL+
         ljN9ooWQzPIM72meQqR/++Kd90lKGEIEjO09xszqxg+1u/zH//EoZ3EwuakbzAYvKI1e
         FwgVkLFQstFKppm7TEJMD4rG5ut+oBN3+rQ0KWIU+u2Sp947FKTmFiDneHyl/UHhmC7y
         cVbw==
X-Gm-Message-State: AOAM531hZKkc8bz1ZwjMGYIxxNNv+SkubVbiGx5U8PfPLvcYOiCWp+KN
        RatBlwfcohC65NfX1rZpjwfAIw==
X-Google-Smtp-Source: ABdhPJxxWJp8w+RW/AI0tJ84JwzVl6Kbq3YxN/Efj32iTP/ULw3xGNDAXNvf59LrAf6J6fDYljZPOQ==
X-Received: by 2002:a05:6402:50d0:b0:423:f4a1:597d with SMTP id h16-20020a05640250d000b00423f4a1597dmr4136984edb.228.1650624811158;
        Fri, 22 Apr 2022 03:53:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lb26-20020a170907785a00b006ea4d2928e5sm625573ejc.218.2022.04.22.03.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 03:53:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
Date:   Fri, 22 Apr 2022 12:53:26 +0200
Message-Id: <20220422105326.78713-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 764c980507be..6ccfa12abd10 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1407,7 +1407,7 @@ static int qcom_smd_parse_edge(struct device *dev,
 		edge->name = node->name;
 
 	irq = irq_of_parse_and_map(node, 0);
-	if (irq < 0) {
+	if (!irq) {
 		dev_err(dev, "required smd interrupt missing\n");
 		ret = irq;
 		goto put_node;
-- 
2.32.0

