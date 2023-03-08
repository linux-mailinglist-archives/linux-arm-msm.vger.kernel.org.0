Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92AB06B145C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 22:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjCHVlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 16:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjCHVlb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 16:41:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBB015895
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 13:41:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id r27so23105521lfe.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 13:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+0l9w3j86TvfIl4Ozy94cjTNyYvl1DohyAW75aJMRQ=;
        b=PfQ9mpStKIDHEzLVFXHNNDTNw3fcw3/xsXjM9ed47kqn1PH4IJFCVf9N+E47RLWIzM
         XSY+9d/LZWz6h4L+dXwOi6cEHsmy/7xGvOciZbhv/GCY5e9Qd2tmUwxaOct4daheHbP8
         bov+HMGBECRPtzxheE1+s14NV1Nhds8fNKKysMmJhTJBxliIPHsByR4ZBmsp+7gJKeMh
         /X0HM/eVgF/fwz93kKpIKyqG/yz1nHPi9JPyIg4oi6Ab2vfvnJF9tRLFxWLwulceFViD
         kOSecZT5+iex461tdmhTrffONTtuC6ytgSWJkjLKC/IS0GVP7NIvpeIgd62w3udLqCJD
         dFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+0l9w3j86TvfIl4Ozy94cjTNyYvl1DohyAW75aJMRQ=;
        b=tYGqe+dLJvdrc+jgAYqbcLWJ/sxahvgkqDoK/R0DnB/OhpXQ5Zfn6D8aFgZpF2n8wu
         6qttBAt6GKaNuWzOkzLgyNYksLFbw/GZ4oo58YQLfQVw5Ky4LqxVxRA+cX8whA78znFS
         sNO3S5/O4vSE+mOV7sCg3j+VV4hwhq4V2WQrSksQI93q7Y8M0uHb9BjIre69X+1Nd9cB
         IQ76DZZVtQIRf82CkSD1RHXP5QBaAck081XlgejA9kUuKLrx6B4UgCSDfvEdNt6CWYy1
         JgQnbvF4lF4ZXWHK1pE4kQwDseJTzQ8fBDR666fnXHFu6RGlQikCNTu6/LxlKwlhYGEx
         Gzmw==
X-Gm-Message-State: AO0yUKXjtPn1hXxjnt+RqhioOtgnmlZfJdU59JUa3oGJCDd/Hq8H6mtl
        bryhxhFM0mnCGyUjff2vcvZgxA==
X-Google-Smtp-Source: AK7set892RPNUTtNQadqUSUAExW0pHWvLV1nEouKSGEv/93gX767qt/zLH/IqBZL5pTlI6au3vTnjQ==
X-Received: by 2002:a05:6512:3d90:b0:4db:25bb:ff0b with SMTP id k16-20020a0565123d9000b004db25bbff0bmr6147627lfv.2.1678311635647;
        Wed, 08 Mar 2023 13:40:35 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id a6-20020a2e8606000000b00295a2a608e9sm2688844lji.111.2023.03.08.13.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:40:35 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:40:14 +0100
Subject: [PATCH v7 8/9] interconnect: qcom: rpm: Don't use clk_get_optional
 for bus clocks anymore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-qos-v7-8-815606092fff@linaro.org>
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
In-Reply-To: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311609; l=1105;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OSAfkyJvvvDXJf5AHSbe23m5GiOxqbkKHaYbUhLD+NM=;
 b=WcebsguplvEedMiICVRR6tw9G2J6b6JAwcRKpsP4b34niNN0zXH9BVKa/397gk1X23wuzK2glT2l
 VdbLkx8IDYVGrujDys55r/L6UPn7hO/t8shQhzvNMx60x2tjXSve
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit dd42ec8ea5b9 ("interconnect: qcom: rpm: Use _optional func for provider clocks")
relaxed the requirements around probing bus clocks. This was a decent
solution for making sure MSM8996 would still boot with old DTs, but
now that there's a proper fix in place that both old and new DTs
will be happy about, revert back to the safer variant of the
function.

Fixes: dd42ec8ea5b9 ("interconnect: qcom: rpm: Use _optional func for provider clocks")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 31d069433343..554fb27de4be 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -517,7 +517,7 @@ int qnoc_probe(struct platform_device *pdev)
 	}
 
 regmap_done:
-	ret = devm_clk_bulk_get_optional(dev, qp->num_bus_clks, qp->bus_clks);
+	ret = devm_clk_bulk_get(dev, qp->num_bus_clks, qp->bus_clks);
 	if (ret)
 		return ret;
 

-- 
2.39.2

