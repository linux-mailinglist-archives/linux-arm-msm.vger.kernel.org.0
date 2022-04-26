Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2706F510CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 01:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356124AbiDZXgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 19:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356117AbiDZXgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 19:36:23 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CFE29837
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:33:14 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-e5e433d66dso292492fac.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=942QrtpSBRbsY3q+/6UH3EyPi6IfXkfPg699xSaSzUw=;
        b=wHo/gMNWrCZtHMJqnti0kuBo/9UJtbCmFnl2GEoenvATYbhVtuGyIs5fx0MOmCOEB+
         UGNYQAhdp+SMbuhm3ap7zParrTAOX2h7ZX7paAVc0rzcNj0ydTefSDNdZWAuflYuijmu
         Vr22jKPZ/fX/W6dOkILU769dXrJdU2miURXm0ySIqhTNXUBy4dDEGXooKh5O0sc1G8Jb
         EtEyeqIHeJeIok9K+US2s5C358j0qwpfpFbdhMp24YRYcjuPxeeIe73iv1IgvauJU57d
         EWVzEdDwPxVj55TxzItQlHUov9pk5I8B4XOmWwOJTRup9N23aDr4p6wCoYu2wNDot8RV
         ypSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=942QrtpSBRbsY3q+/6UH3EyPi6IfXkfPg699xSaSzUw=;
        b=sotyyNx5mghV+gos0I0h5N7fvKUrKfjnAsHWuierrSlD1oRSRCWR9xqDEdoDRwxBt+
         dHe1Ip/eUi8kdFVmzApC2d8I8FLt3L78O5Osaby063lMeXuF7NfoN1NhwpX4RlCcNkUu
         LEaVyrxrKIuEkegzL/edOJICfvO3h6ieprjpMBDYXsU3OBzNQiZzK+rbYvZ22KCUH2FR
         cnHJZaNyAkjSZ7cVKLQEVaD7zWMcBsp0AzGyVkwmpWf7P0HQo34u63jZaSG0YKZguMCc
         hkt2PFkeaDCfe6nTL1CcePRoj3kveC1i1LxQlqq4jvecFwMMjCx8Yio048s7cA6kr/Gt
         jZLA==
X-Gm-Message-State: AOAM532LjfMRw9LahbYEYNEDZd7P1h80QnyendR3zUbYYwEIS7/bGDO/
        cdgyx7JZFHWOo0SacWmBA0XMZw==
X-Google-Smtp-Source: ABdhPJytkQuHXlH7XNOFtBaVr/S16LcYKSVcmQFzvh+HZwqT6j2AXOwDKWLmzY73jh253l1DPJVayQ==
X-Received: by 2002:a05:6870:424e:b0:e9:6ed6:cb58 with SMTP id v14-20020a056870424e00b000e96ed6cb58mr1827472oac.37.1651015993597;
        Tue, 26 Apr 2022 16:33:13 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k2-20020a4adfa2000000b0033a3381a7f1sm6151658ook.44.2022.04.26.16.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 16:33:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] soc: qcom: rpmhpd: Don't warn about sparse rpmhpd arrays
Date:   Tue, 26 Apr 2022 16:35:07 -0700
Message-Id: <20220426233508.1762345-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426233508.1762345-1-bjorn.andersson@linaro.org>
References: <20220426233508.1762345-1-bjorn.andersson@linaro.org>
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

In some cases the DT binding will fully describe the set of available
RPMh power-domains, but there is no reason for exposing them all in the
implementation.

Omitting individual data->domains is handle gracefully by
of_genpd_add_provider_onecell(), so there's no reason for printing a
warning when this occurs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/soc/qcom/rpmhpd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 11102ac47769..f8d28e902942 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -613,10 +613,8 @@ static int rpmhpd_probe(struct platform_device *pdev)
 	data->num_domains = num_pds;
 
 	for (i = 0; i < num_pds; i++) {
-		if (!rpmhpds[i]) {
-			dev_warn(dev, "rpmhpds[%d] is empty\n", i);
+		if (!rpmhpds[i])
 			continue;
-		}
 
 		rpmhpds[i]->dev = dev;
 		rpmhpds[i]->addr = cmd_db_read_addr(rpmhpds[i]->res_name);
-- 
2.35.1

