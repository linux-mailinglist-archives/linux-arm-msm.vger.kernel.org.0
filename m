Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8D35EAEA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 19:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbiIZRwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 13:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiIZRvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 13:51:38 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB6E6469
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:25:16 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a2so11964428lfb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Ya1v88EZ/XL5sO47rkF+/KDWT7WSuaL0/qW3DYX0V7c=;
        b=xVro1ZEJLUK6UvST2c/9H1/8iGaGK6u2JjxVftenrMia3xiubnS4d8rXVTQZT4yI0B
         SgIEH66bXw2Sdeo/vE/7CqL7qAIMzoPKApyY6TfRZ72rjzhu63JWS1heFPFlbaCLMNEs
         5g5WxaTWun712SQPk/mtaor7DFZdQ8yyMcySaoPktphJgUYW39q3l3xJANiXMaz0ETbq
         gCdG9Ylmva2LeVmN1QGEeHZoosprlSt6CXz47XH5/oZ/UmBmV8uAW8YDmtOhImXJmA/8
         OjoKr8shyB2G9VOHHrw59C5hSHMGqDIGPujN4QCEnydfqV5oWHcQBc5+1V4QjFRypej5
         49pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Ya1v88EZ/XL5sO47rkF+/KDWT7WSuaL0/qW3DYX0V7c=;
        b=TVH8ArlL7HzMDWQeJxvUtv7mxFmu5O9ylUbFKIp2vLEFsuTj/uebwh9fF7oTY5+mf4
         UbC7Wwk4I8BrWepUk+0Dnm/r2mlnYgNBqC4lOkEAAWCSnV/LaHUsLjJi8FCqsiFMAEue
         4WPkQbHqASjExaG1DXo7GWuXELLC2PFkaVK6GvMFbxMccDtFGkZz1T4CpXqLs6x+bYGs
         JaT5K1E2jzHBNFNUGHds/17gaHcPdHeuxoISETKgk+mPDFNI6dFWVqhueqZGH1iiPXlK
         49h3PDhfm/iEf6fPHwfhxCV0saYZEbJX0QnKt0a7vGj9IudgOoXXs+lqosPQRpBFG4Ea
         /RYQ==
X-Gm-Message-State: ACrzQf3tP4yT86/8oEXbSb308roTgUdga6tT/DW6lItIS9t2/FCG35/h
        U3YGA+oog4GppP5Wog8j5hJfng==
X-Google-Smtp-Source: AMsMyM7/vngVBgs5Cre9YiLHuYyvIaPdldWzcS/+4vgTg9OSyrBxOGboY315b0O8K0vXfoVw9EWwHA==
X-Received: by 2002:a05:6512:3d8c:b0:49a:4872:858 with SMTP id k12-20020a0565123d8c00b0049a48720858mr8848192lfv.145.1664213116330;
        Mon, 26 Sep 2022 10:25:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b13-20020ac247ed000000b0049f9799d349sm2574870lfp.187.2022.09.26.10.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:25:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] phy: qcom-qmp-pcie: fix resource mapping for SDM845 QHP PHY
Date:   Mon, 26 Sep 2022 20:25:14 +0300
Message-Id: <20220926172514.880776-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

On SDM845 one of PCIe PHYs (the QHP one) has the same region for TX and
RX registers. Since the commit 4be26f695ffa ("phy: qcom-qmp-pcie: fix
memleak on probe deferral") added checking that resources are not
allocated beforehand, this PHY can not be probed anymore. Fix this by
skipping the map of ->rx resource on the QHP PHY and assign it manually.

Fixes: 4be26f695ffa ("phy: qcom-qmp-pcie: fix memleak on probe deferral")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 7aff3f9940a5..5be5348fbb26 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2210,7 +2210,10 @@ static int qmp_pcie_create(struct device *dev, struct device_node *np, int id,
 	if (IS_ERR(qphy->tx))
 		return PTR_ERR(qphy->tx);
 
-	qphy->rx = devm_of_iomap(dev, np, 1, NULL);
+	if (of_device_is_compatible(dev->of_node, "qcom,sdm845-qhp-pcie-phy"))
+		qphy->rx = qphy->tx;
+	else
+		qphy->rx = devm_of_iomap(dev, np, 1, NULL);
 	if (IS_ERR(qphy->rx))
 		return PTR_ERR(qphy->rx);
 
-- 
2.35.1

