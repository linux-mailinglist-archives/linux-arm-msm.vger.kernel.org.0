Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295576DB50B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 22:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjDGUPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 16:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjDGUPD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 16:15:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A1910F8
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 13:14:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y20so55741795lfj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 13:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680898495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmxVQOr0UERcZ1YMRZsASK3EItYYsfIdBLZTNEGU6JM=;
        b=TS8/QvzEVoiAydjEqS6eJXS9sWglXo50esu9QCI7gS7JP4MWoc3Wu/G+seMqtUy5sA
         9BdKLgLAmu4Pzch+SbNpRW6sORsloB20w1juxxbrCncxb0/R+JbkkwwEo19uvOLJg2UL
         tWuevGu2VWU/xw268YcUZDHr4BxXgGEScQTw9FfUY9XwFmN1JdvmBPbKv6KNl6FKgj5V
         QR2Pnt0W8FyHoIuUigpEkSR1lPmMgMm+KyGhRuR+N9worgahzeX0VlyCZp/guGpEwjVc
         t1HxEBz9Ya5UO+oxGdOUmjhNrkmJoUM21bpqgLXA4YSLJ3lxVrrEWzqzAiL9kBr5WoIL
         Wi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680898495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmxVQOr0UERcZ1YMRZsASK3EItYYsfIdBLZTNEGU6JM=;
        b=DZyhFba1s06DVt0DwPdeO3Jxxm2TnSG+mYKw1CRpPJnjvnQek/hEG3AMJT1Rd4BiIT
         EqkHywvqJLAxVBYO809B7p73vYUdCj2rEjoC6ZNtX50tqsw8z6kamz3LdEMllT0tII/Q
         gT/2IjcfYPKwhVofdzORUr/3a+Kiz4mm659SOqBV0MUm1Pmc3GCQYwVNRXcEbLoHxCAC
         coB4GvKC2tIa6t5kCHPjO1YeUwEs5fyWO7v6qs8yz86XFbxPGV+Cl4ICLsmu1zhoURqh
         BnN4LweH7OdnUScRAtdlfAWdSQ8MY0LRyhqUp4HVKGb0frMpUM3PlODO2tMSPMV4IfEs
         QINw==
X-Gm-Message-State: AAQBX9fjGeFc4XfbkKlvOnuq+Aj8PFM3c4Kg3I5GzBgnSbyZdbumapwk
        jfSWcJPkOCj9nII34EwV2khKLw==
X-Google-Smtp-Source: AKy350YyHJIyKc3/d2iLB1M17ZVsvrOCHCOByd0pZKgdZllWkpjHXkPQFFgwmURpWpKwz1EwyXHksg==
X-Received: by 2002:a19:ac09:0:b0:4ea:f69a:de37 with SMTP id g9-20020a19ac09000000b004eaf69ade37mr938788lfc.42.1680898495005;
        Fri, 07 Apr 2023 13:14:55 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id u3-20020ac243c3000000b004eaf6181a32sm842436lfl.75.2023.04.07.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 13:14:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 07 Apr 2023 22:14:49 +0200
Subject: [PATCH v8 7/8] interconnect: qcom: rpm: Don't use clk_get_optional
 for bus clocks anymore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-qos-v8-7-ee696a2c15a9@linaro.org>
References: <20230228-topic-qos-v8-0-ee696a2c15a9@linaro.org>
In-Reply-To: <20230228-topic-qos-v8-0-ee696a2c15a9@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680898484; l=1105;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ntGrIMziVYgfLiYwCKCTYabEq/yl5ewVMN3vP4/MQz8=;
 b=yfoAQc12tdXVQVdF6BOEuXj1J5vomOdNVpPVKYFlfaqUid1lCYeXUIaJE/6idY0Vg0osvkV6wzMQ
 PD95zQvvBAALR9xRzuU80Cy8R87AVhOySBmjYUso70sFcN1gLUIg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
index 2298eb019534..8c1beae13860 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -481,7 +481,7 @@ int qnoc_probe(struct platform_device *pdev)
 	}
 
 regmap_done:
-	ret = devm_clk_bulk_get_optional(dev, qp->num_bus_clks, qp->bus_clks);
+	ret = devm_clk_bulk_get(dev, qp->num_bus_clks, qp->bus_clks);
 	if (ret)
 		return ret;
 

-- 
2.40.0

