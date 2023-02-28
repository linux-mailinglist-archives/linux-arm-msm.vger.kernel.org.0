Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA6A6A5A39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 14:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjB1Now (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 08:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjB1Nop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 08:44:45 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553022ED41
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 05:44:33 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z42so10241964ljq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 05:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677591871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIPKe9kvABQ+Ey2gP511WJDAmlrhCcezY7A3+lbIVq4=;
        b=mmnuvUb7ShBT7sGOwNvaIXYzsFxwbz68OC33QDMbahsMtSJGVkhyiUUsbDgagUsJKz
         BMD1L4VstyjnjnSfRdFKdT8kQJYhS9cX8QhIj0tLgNM7o+1f4ax8eVQYf2TWfUvYxd+L
         QZG7etTt1Kwz16Yzi5Z4I8NvqgsjJqV552a08gCQNa+EYkuuzMuFM4jScmbzuNJwPzJ4
         lANXLfOH/LNuTBoL2+b5btLZrbo46ZM0+oVeiUYpSFbyRYQ5VhhP807mATciJSGKoN7x
         IoyizFp4FEmS61QfGVovQ5NJ/zVg7Dxk8aYaFp9fhKNWOdXvyP3oCvupea8aepDBcRQd
         eb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677591871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIPKe9kvABQ+Ey2gP511WJDAmlrhCcezY7A3+lbIVq4=;
        b=Q9ZvBDIl9FnGe8f+aEhqxG7w735QGEf6bLD5BmGGMv/Dz581D5cyV8ocHCDeKBkQ5p
         4syDoSSIipeYI0qMOA+bOtfcOuprYEWpxTTZIVWcg/aKo2xZ1lJVFr98X5KT1K4GeHEN
         IQfB7mr9IBdDCfZro57kgbrk9Y3i7cb26QL4RQxhOGP7/EFv/sdKymQrISTjxiLqBM+T
         lcFg4zdcExOQak3i4PJg4Lrf9qRt+o3UnR7S80kZJo3l+quPFM9C4vrc4b2KkvxWA88r
         X0QSKXXWP9iliw2BIWeuInxy4Eo2KIlsShNQpGx+NjVMCre90M9bnv0XHT4Rq/h2ED54
         Oi/A==
X-Gm-Message-State: AO0yUKVQMcCqokXFlE0C/gQ0zL5IRjCwWWX3Emw82x+N2qRfnnUn8jF6
        VP90n2VkfKg6gce3d3qjTBoV2w==
X-Google-Smtp-Source: AK7set+BvqiV7jllMe4KwbyP9oV2coNbPAYhufCWbM6e3cX6HVZMHJRfvFevs4ulS22fNmlk9H8akw==
X-Received: by 2002:a2e:978e:0:b0:293:480c:884 with SMTP id y14-20020a2e978e000000b00293480c0884mr988418lji.37.1677591871659;
        Tue, 28 Feb 2023 05:44:31 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j20-20020a2e3c14000000b00295a583a20bsm1203975lja.74.2023.02.28.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 05:44:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 14:44:05 +0100
Subject: [PATCH v6 8/9] interconnect: qcom: rpm: Don't use clk_get_optional
 for bus clocks anymore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-qos-v6-8-3c37a349656f@linaro.org>
References: <20230228-topic-qos-v6-0-3c37a349656f@linaro.org>
In-Reply-To: <20230228-topic-qos-v6-0-3c37a349656f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677591861; l=1105;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Trwtp2UuhUI4fi7Cq6Zwq0fwVJM3gAyEwBU7IiWKQN0=;
 b=vT4iRKkPmPZTOxukV1H7aZoMisskXyxQ5Umd/5Gwko7beejzqOY3tg7ko07CqrbGLPx9NUWWuRUr
 KC9l5pcJDKn5QubaimNr6SkAqeopFK3yme5C+lflb0Yg3GjT1tc4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
index 48eb4394b84e..77346a2ab82b 100644
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

