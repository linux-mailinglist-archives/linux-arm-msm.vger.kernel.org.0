Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B6D75F3CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 12:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbjGXKte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 06:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbjGXKtd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 06:49:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB9E119
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:49:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so6198837e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690195764; x=1690800564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8HKgJSSV07pp4d9brlO+h0JzIdiYnacUoJ+79PuEI4=;
        b=RQ+a0ZCwPXPESV3mIgCp8tm1prElKptpDZyaKjzC1uelhVuzifZNS0vm0tjagrC4F3
         DQcZW4HqO9to/UuDYKcaJfw5gp7RlNb8rVlcYvBeQhY6QXRiioPm6iVYVWzFJfbEia/q
         xh2nMHfVzFpfY77jfpw++wB1iZCSedd0nWtjZazJNVVoxU1hXEml4I2b7ldB3DlMUwIf
         /IsXMYMP8Rvit3g5iTF3VYo7yTl33XsyqFOi0zHEM5ubB9zh9hDvSdBK/TFXpY2C5Idw
         Dxaa7tMp4VroJQxng1+H/Kq53kqbsKvlYDH6SxXlUhGRPjjEPsBteV7Am8TFLH0sfpbQ
         AR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690195764; x=1690800564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8HKgJSSV07pp4d9brlO+h0JzIdiYnacUoJ+79PuEI4=;
        b=l9MEgT3MgsPS3lKOCz5GpclyQ2w3+u7GpGxlkE2GikhXQWbQk5aIq92y7To+yPCxlS
         /DEBvl79zeeQ4k8iygrsgG5GANLANtiKqGWM4geazbgf+d9VDYGXVIsZZI1p6CWFraXO
         v05iL/T/CHttYYRHEssvNTBHTLlafDpKtea0YZS1hDIHKol4YmHpd2KLB1fCKSLuDD/T
         sgXG3GqoU+HtS91PRThA7rwA18SBC4f+OKYGdcVQPa1jMulCu662iRKmqdNSNjMNjesH
         8vpCIy5av2i8nue69EYhWWHJRK4Edwn4wx8jxwduNtluLWAkEXSaS8gI7tsVheUsOcpF
         2hpw==
X-Gm-Message-State: ABy/qLbf6lCbe9e2l+xngDH/lAQ9CXWrUJ60IbR0et4dulwR5oTZkUD5
        FzQsbMr7f6RIHkhL+Qb6vygZfd6yRDUNSC9ximxzqA==
X-Google-Smtp-Source: APBJJlFkO0TeYh3ZoRhiTaeivQ83oCvFNp+UJcf10hvH93B8FuaB3rm6LSEyOJ3IW11fakDe9mFCiQ==
X-Received: by 2002:a05:6512:ea0:b0:4f9:5718:70b3 with SMTP id bi32-20020a0565120ea000b004f9571870b3mr5338407lfb.31.1690195764496;
        Mon, 24 Jul 2023 03:49:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl203.neoplus.adsl.tpnet.pl. [83.9.31.203])
        by smtp.gmail.com with ESMTPSA id o14-20020ac2494e000000b004fdc7ec5cbesm2164201lfi.300.2023.07.24.03.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 03:49:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 24 Jul 2023 12:49:22 +0200
Subject: [PATCH v2 2/2] interconnect: qcom: qcm2290: Enable sync state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230720-topic-qcm2290_icc-v2-2-a2ceb9d3e713@linaro.org>
References: <20230720-topic-qcm2290_icc-v2-0-a2ceb9d3e713@linaro.org>
In-Reply-To: <20230720-topic-qcm2290_icc-v2-0-a2ceb9d3e713@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690195761; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GplZxeOl64/ZE1tfvreBeiinURUbtJKYvGy7WRRT0bI=;
 b=O9MXnPhMxVQyCLJrL3jyqGMGBqfsvhiRg6ST9CmmM/h6dHwd8kFNhD6wYW8cmNWC/1c67k5+7
 bzRBUL4EjjaCC6B+ki4drZ0UMURNFGXwB68yhuX+ukOGnhQZH3t61nf
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the generic .sync_state callback to ensure there are no
outstanding votes that would waste power.

Generally one would need a bunch of interface clocks to access the QoS
registers when trying to go over all possible nodes during sync_state,
but QCM2290 surprisingly does not seem to require any such handling.

Fixes: 1a14b1ac3935 ("interconnect: qcom: Add QCM2290 driver support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index c22354f3e667..5bc4b7516608 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -1364,6 +1364,7 @@ static struct platform_driver qcm2290_noc_driver = {
 	.driver = {
 		.name = "qnoc-qcm2290",
 		.of_match_table = qcm2290_noc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qcm2290_noc_driver);

-- 
2.41.0

