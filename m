Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB3BD571AB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbiGLM7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiGLM7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:59:33 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2401A20F55
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:32 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h17so11113746wrx.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yS4aszlD6wfaJXkFTxX6G5kce/Ags3GTvPz2INj0vkA=;
        b=UtgpWScOPK7ulWYKExX2Qx9TQNSVmYi0q0KDI8/sVm3ASbTAMqcfHrtlRs990t4y+h
         XM/fntk0QB3Bb+zaUnAZQvKcxryXHvT11aOocDHsC+nvnkNfh4PVLK34/qMv+RrozEyU
         tBF2bz0PdodHsLRBZkOjfxSJybvznPt552YmFU7nGv6AWU1GaQegj1yoaPvyDFC4fZzE
         8rhSsy4v+8p2nPWGnt1b8X9c4nNAvj2yj6j7vrFltMbTSvuO/gtHxc5ntYM5jpIH8rnt
         a8JS2JkHTJFcYQTc2BtnqCsMaiZ+yRBwCd2Wp5i1t4F5xGNci8H2g2Qt4F/Kk49N45+i
         uo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yS4aszlD6wfaJXkFTxX6G5kce/Ags3GTvPz2INj0vkA=;
        b=Y8ct2JWdBbDEK25883/Mzx4HjrB6AbrXO+wDcqnL7Bgox6fUbFAdKsqAFVgRWPafPw
         5tgdYC5IrzIvZmJXQHjAQHE6djp7cjWs4hMhnweRmRL5t5GlSU7RrMhsXKz8XFKiBM4A
         LWfY97yiL2RBpXuoT5rK6WOvemYAe/zFKSYEAbHfHhJDyRfgnhQtesHRTrWPcp5auZ71
         rSAF7t5PFVQCCbcRKA6DAPwNNGh4Ho+l0vIaMp0hnkdDAKLY5J64QOVLK3fJfhSsTXg5
         hiSoXDHE+/Md2SvpXlUG/D0Ip0tO476XZNogGwrGjea39IVd19tqSc6+R9uJSJGh9Gi+
         6xfw==
X-Gm-Message-State: AJIora+e3vigw9hEDfbu4uHv9WVn4yAIJEXwB4bm0wkeZjbSyWzKh5Fu
        WkuzU+wpdY3FxGHo24K/28HLVkRjhlpeMw==
X-Google-Smtp-Source: AGRyM1u3GMRPvrLIVNDWN96Q8Wkz0b8cZSpRfZWd35w1BmXUjX2DQ+HSF8WSSV36pxXN0vvN+Id6Gw==
X-Received: by 2002:a5d:4584:0:b0:21d:62f5:c2da with SMTP id p4-20020a5d4584000000b0021d62f5c2damr22706157wrq.671.1657630770741;
        Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 6/6] clk: qcom: gcc-msm8939: Add missing USB HS system clock frequencies
Date:   Tue, 12 Jul 2022 13:59:22 +0100
Message-Id: <20220712125922.3461675-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The shipped qcom driver defines:
static struct clk_freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
        F(  57140000,      gpll0_out_main,  14,    0,    0),
        F(  80000000,      gpll0_out_main,  10,   0,    0),
        F( 100000000,      gpll0_out_main,   8,   0,    0),
        F_END
};
In the upstream code we omit 57.14 MHz and 100 MHz.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 7f71491d52c4b..754d5573b1df5 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1468,7 +1468,9 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
+	F(57140000, P_GPLL0, 14, 0, 0),
 	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	{ }
 };
 
-- 
2.36.1

