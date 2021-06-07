Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE0439DB85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 13:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhFGLlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 07:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbhFGLlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 07:41:23 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173B9C061787
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jun 2021 04:39:19 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id z26so12854338pfj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DlAUbwKHHHe65i+U7K3ydnc29EqdXosEre7ru7N+GbE=;
        b=Al2mbeZLpBHewqO4nzNNMGC7AmYHSvaDvA4nQB48+J+guCAbRkfkixMt97BbMmXrGr
         uTxIrFZLx9qwECMBWouLgWtFvgjQ+p572SkE0ttZMeTW2MgEo3BLUch25f11/6XMsWkS
         l5L7UIoLZb5A4cOJAWm4eJVAXFVUv+q4P4DEZG8YfWnGoFiUa1o5jRu6ZDzQJF6d4Xoh
         t1IMuRDKDg+tfCbweu40oo+jJc7JL2FskCx18GmmNBiGaSier82tlZy0sVl/h2aD+4mF
         bcv2bja/oH3i7XmaiDTnmqc4hJaRd+RjhBw//9Nt2GKn/RpzW5R48zI9LD2wRW7j2Kru
         gFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DlAUbwKHHHe65i+U7K3ydnc29EqdXosEre7ru7N+GbE=;
        b=HEwZUinJFZtpQZLWLrNFSLW80QBsMVKm45tYfiKl9o2inhk6me2G9dEhjaOPJarvvJ
         +IiXZFrLlgKgMQjCM/ILE2XOys5zY+VZ4yQ/QDaTfPenGIfit3lHUAKgSZcRTSL9GOyW
         SUoUFxoKCCs9/raRp17KpicvvvXtOV+aqFH4rkGDlA9zEXWSQSG/hMZoOAIBGNuUlGqh
         iSGM0ow+tX/kYh/EzOKJkuGzJP6Nx7P2X8MEqNSoc1jizWSQi+D3PG+0k55njGZK5H3J
         8m3p2UWDAmWVf6sVIggsaOVMCrTksDJgx3pph633tfr+txw3vkuW8GWlZXnHiWn0w4ok
         /fwQ==
X-Gm-Message-State: AOAM531UUofUkBCJTRyxH5o6+7b3HubH02BBUtlHIRN5psxKSAG5ItRm
        IdUsNDg9yPLJjaB6K81px8dOKb1k5Xirxw==
X-Google-Smtp-Source: ABdhPJx+JA3GA3bvFkAkuQGUzsnkDN8ow3pxo3VkR/8fBNo/FWLxBAnGiKx2f5yDP7DPkOghyThelg==
X-Received: by 2002:a65:6911:: with SMTP id s17mr17717276pgq.128.1623065958453;
        Mon, 07 Jun 2021 04:39:18 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.177.211])
        by smtp.gmail.com with ESMTPSA id j7sm7223939pjf.0.2021.06.07.04.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 04:39:18 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 2/8] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
Date:   Mon,  7 Jun 2021 17:08:34 +0530
Message-Id: <20210607113840.15435-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pmic-gpio compatible strings for pmm8155au_1 and pmm8155au_2 pmics
found on SA8155p-adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index f6a9760558a6..ee4721f1c477 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -27,6 +27,8 @@ PMIC's from Qualcomm.
 		    "qcom,pm660l-gpio"
 		    "qcom,pm8150-gpio"
 		    "qcom,pm8150b-gpio"
+		    "qcom,pmm8155au-1-gpio"
+		    "qcom,pmm8155au-2-gpio"
 		    "qcom,pm8350-gpio"
 		    "qcom,pm8350b-gpio"
 		    "qcom,pm8350c-gpio"
@@ -116,6 +118,9 @@ to specify in a pin configuration subnode:
 					     and gpio8)
 		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
 		    gpio1-gpio12 for pm8150l (hole on gpio7)
+		    gpio1-gpio10 for pmm8155au-1 (holes on gpio2, gpio5, gpio7
+					          and gpio8)
+		    gpio1-gpio10 for pmm8155au-2 (holes on gpio2, gpio5, gpio7)
 		    gpio1-gpio10 for pm8350
 		    gpio1-gpio8 for pm8350b
 		    gpio1-gpio9 for pm8350c
-- 
2.31.1

