Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66E1E589A7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 12:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbiHDKfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 06:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiHDKfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 06:35:12 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542DC125
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Aug 2022 03:35:10 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id y13so22097556ejp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Aug 2022 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EO69IERChew3U/2LIgFG877Cl2jcoIbTGwSLhUjnHKk=;
        b=Iu0xP1aU7znwFVzxmB2PZJvg0RLyfR7h2XMZiMJLQ4ZGPSsaK//FucXq4dceqmmQag
         EPzjbwk6MguBLLTXlUhznPou89KB4p4aL3dckW1A2WItB4MbVKwN7qwwLLlje85sE8lV
         ACnhH9SnLTuvI775gQlNJ6mPLYWDcnojfS1BHDJMbTP7YGlNMFCkSR85Ajv8mPaEVcwW
         rq2l9ynSbU7pJRlksGRRHngGAKycZVze1bksFV7p5iSi4jP07loUs2HbG6VD4PgQdtLw
         pnbHQri8pwD41LNGxjkrE0/om0ixyCfERDyNL/uNMUvFaoHIdEUlHZoqv+95DfZanlfz
         WtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EO69IERChew3U/2LIgFG877Cl2jcoIbTGwSLhUjnHKk=;
        b=qcSDGdVaTV4mqgrDVIT1vL1WEVzixpA7ZKn1Abmn1l4S2t6UdYweIA26xpWCDQzldd
         4hyJBO2834yEm3NQkSaS5wJG+Zi3vRt53EbAu5Eq/p6BWhbt0+MujOWVqitbMM2KVPqy
         FR9OjWSovedF9yxpWehFl0iJ56vu2c27ISZhsdvSHY9ClkMrkLp5G2b8zBfUgYkg5mfa
         ceXPXnLp5JW+YhVzJSLAd/e9V9ofbpAIjj7UifVgKdPDGrYumioi+OT9OkC0AypR1T21
         /xcYDVLtvRc+ou9SR7mISYl1R6rvYdVK7xWFjwydlDcOdGA+B5WowKpoCsl3plw9jz2m
         PC2w==
X-Gm-Message-State: ACgBeo38AQYe5ZYYo31gQhtcvrdQ7/ZfCVoGw5VKY4X1R0VGObyg9cGv
        M9PUmqGXw+l8RHgWkQHmXq+mNg==
X-Google-Smtp-Source: AA6agR61mri8ZQqatzgNBCVU7gG688DD8hOMdp8btLkv2tLbBgwD1Qtcb7B1hl4hqcvrMSplwJnaQw==
X-Received: by 2002:a17:907:738a:b0:730:7537:848c with SMTP id er10-20020a170907738a00b007307537848cmr957728ejc.488.1659609308894;
        Thu, 04 Aug 2022 03:35:08 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7de8a000000b0043577da51f1sm443760edv.81.2022.08.04.03.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 03:35:08 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC] clk: qcom: common: Detach the power domain at the end of probe
Date:   Thu,  4 Aug 2022 13:34:56 +0300
Message-Id: <20220804103456.3176943-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

None of the CCs actually need the PD attached to their device,
but rather some GDSCs registered by those CCs need that PD as a parent
in order to propagate power gating and the performance state.

So lets detach the PD from the CC right at the end of probe, after
everything has been successfully set up.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..c918c91775ae 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -303,6 +303,8 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
+	dev_pm_domain_detach(dev, true);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
-- 
2.34.1

