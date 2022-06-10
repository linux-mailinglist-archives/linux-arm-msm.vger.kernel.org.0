Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4B25464A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 12:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242903AbiFJKy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 06:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349151AbiFJKxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 06:53:24 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2912E4C9F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:52 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h23so2525447ljl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ibT088o3tL/bymNr1oLa2f6k8GLpExhK6XLLzYCM7Yc=;
        b=yHjSa5coCG+OVA+PNvp8A4nckMSGkVFgxSHtzc4vGnWtg6081O1bW74cMRT5K9Kp2E
         MteROXUm4jiQMBqLaSZ9j1c4g6dvsvkOVi02hUO2DcJRlgFzJGI0ivrUQxlxZQE42j14
         dLPunEY1TnZ8PgudD7fH1IHYW8ueRY39So9RXALr+1NOrgAm+K+zPAf2ijj8bneyVSkd
         gtfKcGEpgZ686JIYg8iQ6s1MGqE1dxAe2r+7SDPYXERgD8KRFkYvOp32tEr0tYd5ZnLI
         WEPXD+9J+QOT1iIrSvsvlBQwubgMgeP6+kczWXkZeF/YE0HJeftakUpzCnQ4d1drT3BV
         vo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ibT088o3tL/bymNr1oLa2f6k8GLpExhK6XLLzYCM7Yc=;
        b=k3Jiq+8yY1j3unQs/+YHREPWtdz7hqnFTuxOwjDwjfPLLf8lq2bkcnbf9IZ9v1Jcp2
         Zi5+x91FNweQFhCo68w/IkebOB7TUEqc81Cugj5uyRT/RI2MJYD7pSNG+s1WaD8tYQSw
         3Z2KITJq0fSexkJgSMceGADxZLRKa4/+Co5fUK9tt/natDYokXJcnV0QpECmbMdZN2wB
         7gJIGp5AW/Ey9GG5sjcy1w0d5X67hUpCTKm17jJ6wHhY/CjfDdzBLJoH7smoMOcucCjT
         xc5P9HLvEyxeDK8wBZDBoLa6++Q4AvDCc6Dit+HIzdhydtyXVZDOqeePbEqVnaLQM7T7
         qdcQ==
X-Gm-Message-State: AOAM531s2E2yEMGU0nOPv5Ub3CVdXzH203MasVPD0GzI2c2dTZcMBckp
        aGFWH3PT7yaOSxg648uwbcojHA==
X-Google-Smtp-Source: ABdhPJyE0pj1/rQIZdtV0sJ5icIPufdNiUSVlswuyqIFkBsT6B6tPb8h5p6ihjC7FHvwrSsogw5s/A==
X-Received: by 2002:a05:651c:244:b0:253:ecad:a4ee with SMTP id x4-20020a05651c024400b00253ecada4eemr51119423ljn.21.1654858189817;
        Fri, 10 Jun 2022 03:49:49 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id y2-20020a056512044200b0047255d2117csm4658758lfk.171.2022.06.10.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:49:49 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v7 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Fri, 10 Jun 2022 13:49:47 +0300
Message-Id: <20220610104947.2296495-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
References: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v7:
* none.

 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

