Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77484657701
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbiL1Nc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232931AbiL1Ncu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:50 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0510AF5B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:49 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z26so23641504lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc2vcBWD/PXgOVDu8nqsrR0srt+UNv7H2MyITJYE51Y=;
        b=zBDhvJrmjUhid0dBmQpMtfz4n1T3esELCKd1geP8RV5NK+T5hCV1rF69nK0RF9Pu/S
         Jq/K51BtE7bUrcsldNlgnTBDuzoCzAjZNlVSAVRPcKrZUjeqwYjU1ILDkHZ3dp1v9TNL
         CBrIFJRiEVyRzkiCg0g94TMPP50ZWe439OdNxRoWpRlHUmlmRGuNrrZol7aAr6qQkrIs
         NXShN/MEcgbUdkceTtY1Hp2BG1wRQ/gm2At2x8aMn/t4H+IgUdnQ3vSY5hkP+yXq8lX6
         chVIxZl76nNQmU6+iu/fd1cNO4ATJZbHz5lNJjhm6s9Rq2IYQ3zMkn5SExvdEJ1X7vN6
         M+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc2vcBWD/PXgOVDu8nqsrR0srt+UNv7H2MyITJYE51Y=;
        b=vMh5hIBRZmQS3Og+7jPuTb7efYkngVazFqz/LRXg6qBc6A6F6jFJL9WY/YF+9wkv4R
         1ddeZ2ARqNgm21WyGMZAtodVwQ3CblkkMVY3iZiv5D3pClnAgjVj9TVaFJLSfIHBeZb5
         M2oS4/SUW/ASxl2aAFPuPcTWKu1lHdDv7zf6Jo9kkK+aOofTAiLs1og5comVPVSpLCw6
         m9ECZoQu3sYjNbiX1nHcrA4EL66TtNFUByyA2vrE0UUGU7leQ9t5Iw5cg3zTcVRo8cyh
         cxtwEFZHeiyYEdlL4Sc8cNWTqBhNUdy7wZLJ99oa0Nvts+0uxHTcf1uKV9eRHdW80peZ
         d6yg==
X-Gm-Message-State: AFqh2kp4Rwx5uVKb7Py8wwWqWHtjh2AhH7R0agI8iT2AIe54AI+0uMkQ
        OPs8VeUKcw7yPzH+djNzCqKm/Q==
X-Google-Smtp-Source: AMrXdXsA0BDvuQtN72oyy6bIy+u1Ak1CKj2k5y0DTtcv2hNQs7zAiXNywLHGDyQ/ebPrsPE1AZKlPA==
X-Received: by 2002:a05:6512:3a8f:b0:4b5:8a01:570e with SMTP id q15-20020a0565123a8f00b004b58a01570emr7987856lfu.45.1672234368567;
        Wed, 28 Dec 2022 05:32:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 04/16] dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 15:32:31 +0200
Message-Id: <20221228133243.3052132-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
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

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 703d9e075247..b4fdde71ef18 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -23,7 +23,6 @@ properties:
     items:
       - description: Board XO source
       - description: Sleep clock source
-      - description: PLL test clock source (Optional clock)
       - description: PCIE 0 Pipe clock source (Optional clock)
       - description: PCIE 1 Pipe clock source (Optional clock)
       - description: UFS card Rx symbol 0 clock source (Optional clock)
@@ -40,7 +39,6 @@ properties:
     items:
       - const: bi_tcxo
       - const: sleep_clk
-      - const: core_bi_pll_test_se # Optional clock
       - const: pcie_0_pipe_clk # Optional clock
       - const: pcie_1_pipe_clk # Optional clock
       - const: ufs_card_rx_symbol_0_clk # Optional clock
-- 
2.35.1

