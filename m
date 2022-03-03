Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668D14CB978
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 09:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbiCCIt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 03:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbiCCIt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 03:49:28 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9911637E8
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 00:48:43 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id u2so2935750ioc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 00:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vNsqVoa00YCDeFZ4I2281SG6Ep4/CfQvbPK2hEihXH8=;
        b=UbCCmVXg8hNoLQLReHYqeOJ7u0Gm74D2VEnsK0mPF7Jaz8iP8l6VAzXY1y6BOy2c9w
         9BivdYBL18kBvDaziMIY0Wml7/AWAotMvmXEyIIZRcIF3UyDCuqXvLplh0hnTNksyFR9
         YK4UYQAfDOgcErBEsvP4egeZALszSsOQbZl3j9atoNwSTR/06Dfh0ttEvR2C/3L9ZAvk
         Sz/f1fl5gmC1+khQ8iCkhfKcRAAEGMT+q86OFow6AGLSgpYK1Zydy1MgE64Qn6VegiTu
         QCWk4Yo/P798+V3CWQ5qdvqy8G3PqQ2TGqJJreB5LKYAQMyO0+peNIAKwkOCgd8faHek
         Lbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vNsqVoa00YCDeFZ4I2281SG6Ep4/CfQvbPK2hEihXH8=;
        b=giIXPnG6d7gWzaUrq1LhFRl/8SrV0Fysxn+UH9wPVYpM+d+vw54VrNWs1JponFEIuL
         bJqJ5+mEKx9qxI7wIThBLN+q/Gt6k4D5bUqHikXHuj86twYAl9q7PYIOsL37ZOHcCixQ
         EHtkIJCk2R2ViyYGIdDiApGEJTaaWmUm7HZxJGpdcbeiaD4E8V3HuaDO7e4fE1cgOfbG
         BVplOdT5+o87jByubDbIEi00tQJWwCwx6T4rny2illK+WNrUpcCxmhavlGqBjtQLeUat
         Y2taJ0hrpQWRmS0F/1drSMgWmnE/q+t2Zttqc0kNCCn71EoUszVjf0aZCB7g69v09XG/
         2JWA==
X-Gm-Message-State: AOAM533XD9N5JH499Uc8OzO7lRx2W2NFPunVTPXL1y/B/qTxb92rfW6Q
        zZMumVnaq1Grff1+w2jp+FKlNYLT56EqoQ==
X-Google-Smtp-Source: ABdhPJzPZl/TX8TodBaONLNjGojjs18uk/VVKyN64V/MKI0fF2TryeaN4V/+BsDCuj6q/nXa634yIA==
X-Received: by 2002:a02:2a0d:0:b0:317:380f:8fce with SMTP id w13-20020a022a0d000000b00317380f8fcemr14891422jaw.205.1646297322652;
        Thu, 03 Mar 2022 00:48:42 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id m9-20020a923f09000000b002c2a1a3a888sm1480704ila.50.2022.03.03.00.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:48:42 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: net: qcom,ethqos: Document SM8150 SoC compatible
Date:   Thu,  3 Mar 2022 14:18:19 +0530
Message-Id: <20220303084824.284946-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
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

From: Vinod Koul <vkoul@kernel.org>

SM8150 has a ethernet controller and needs a different configuration so
add a new compatible for this

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.txt b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
index fcf5035810b5..1f5746849a71 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.txt
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
@@ -7,7 +7,9 @@ This device has following properties:
 
 Required properties:
 
-- compatible: Should be qcom,qcs404-ethqos"
+- compatible: Should be one of:
+		"qcom,qcs404-ethqos"
+		"qcom,sm8150-ethqos"
 
 - reg: Address and length of the register set for the device
 
-- 
2.35.1

