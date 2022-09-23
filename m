Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86B85E7184
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 03:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbiIWBnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 21:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbiIWBns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 21:43:48 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC8FD827D;
        Thu, 22 Sep 2022 18:43:45 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id b23so9260165iof.2;
        Thu, 22 Sep 2022 18:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uZmP6cRO+2tkjn9k8/NCTzUaoPITyxk1HEeB04T7EQg=;
        b=RsfmeuH6YVdUXS77gOIXlafLDL9LXZnA66gxD0cRM221sYoEZwx/Lu7/5EMZbH22T/
         5CxyDaIaDVZUabjQRo0FiY/y0o5An+kjb60WLeRDpFygsNVa8l/FFflGXIAs4FR+41vi
         wdcudhzZPHomFVcHUCYV2GLqH/p5h9WCru9asKmm/RPGi8FmoRUnviQYAN5dyjJsPC/y
         udQV0crkNOacTlhec723ytUPPokv7DPucwLM4stlBBl+zNOLLaQ2f6laNSAq970wBrff
         VpNwy3yxqifaRgA54oX+TIStBTPAyqI3AlVWeaaxoM1zLxdqpCNd6mYSy1E7v8Q4N4XP
         sP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uZmP6cRO+2tkjn9k8/NCTzUaoPITyxk1HEeB04T7EQg=;
        b=D/UyI01WviK9Upfh+xakSGI4iNJ4f/yik7aP05ZETeglDg7kNQrJWUDXd1WYY2/xYb
         +IvYykiZsyFK/TJeljIJp6zH12NkDd5pPwgODjSMJWbl0tMEtuqIQV8rEk3f/WljQ/b0
         R6JV3vKV6Iz9wWoAwIud8j1sOhQ61WyAjIahCiFrnBFhzr8HuLayZHzAlM/m2pW2OyTh
         MQEpv2kRB21DHyQGQlK7GhfhLBrTTbKg7riK8VrmjndHsh3ucOI2reNHq5ORMBF+Xuro
         TKyQY2AABjforBMco5Qohzus9Y6g4UryMkiJgK5zYSVvbZ0YDDci9CEsmDeRhxXp89BP
         Kq2Q==
X-Gm-Message-State: ACrzQf3phTYWgPTKjec331TGn1BLvie6Sf7pCEeFlN2waMd4j3M5YxWA
        KDDce1sUVigQ1Lh6gK1ggbIyQb/t5Yw=
X-Google-Smtp-Source: AMsMyM5J021qo6Aq6Z5vh71aUCHz2b6nMQv28SqbpA0turgOM7YTLLOl+tNXu0blxVprm8Zl1w3UtA==
X-Received: by 2002:a05:6638:150c:b0:35a:f7a9:c3d8 with SMTP id b12-20020a056638150c00b0035af7a9c3d8mr3662216jat.38.1663897424417;
        Thu, 22 Sep 2022 18:43:44 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::1e16])
        by smtp.gmail.com with UTF8SMTPSA id q24-20020a02b058000000b003566d1abeabsm2847507jah.5.2022.09.22.18.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 18:43:43 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/2] mmc: sdhci-msm: add compatible string check for sdm670
Date:   Thu, 22 Sep 2022 21:43:22 -0400
Message-Id: <20220923014322.33620-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923014322.33620-1-mailingradian@gmail.com>
References: <20220923014322.33620-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 has the same quirk as Snapdragon 845 (needing to
restore the dll config). Add a compatible string check to detect the need
for this.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/mmc/host/sdhci-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index dc2991422a87..3a091a387ecb 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2441,6 +2441,7 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
 	 */
 	{.compatible = "qcom,sdhci-msm-v4", .data = &sdhci_msm_mci_var},
 	{.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
+	{.compatible = "qcom,sdm670-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
 	{},
-- 
2.37.3

