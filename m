Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D4734BF06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Mar 2021 22:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhC1Uxk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Mar 2021 16:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhC1UxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Mar 2021 16:53:06 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E8EC0613B5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 13:53:05 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id v15so15384910lfq.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3DDdVykV/0O7hJCqNoZ+wSUJ/w2kFv7G/Wtz4fTZPBw=;
        b=SzFLFLPcDIg98gskIC32OPQDTcn3RDLzYFL3LgxXEisuWoJNnenpapHKnOaKzs2Ujb
         Pf6lJoliMfHI1jaqNeaNgvVmghqUSf+Rg9rc00tKUW4kh/m+qnWU3XQayLKeyB8nZ/BC
         gGHyUm6P8+jqFetEjd45/GoLId8gI6NudjGkSbSREvnYV5lfXgyZ+f/3mfZhAkI9u6RM
         N6Ct/XKBLax/YWwgxwudgwmTvdppcRVUTZZzjU53xOtxJzwCpo+hFw2R19YKSZ++X+MS
         n7NmOG7BD8uFXfweRN8qY57BHjkX0rfhh4+MhD+YlZfxepBr2LVnu5bBHiMXjeMgYpjf
         +arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3DDdVykV/0O7hJCqNoZ+wSUJ/w2kFv7G/Wtz4fTZPBw=;
        b=bHbbDNg5G5ryqOUGcyQPljJVGBch/Ufxi2F43X5M4ASWJdI/VaIPsBb6f68yRow3Qv
         4Uh5Kub6dne9EX+zPWI6VjQa3phaqBN2fL6WDW7Qa9p9SuiYYASHrbbc/+65+CrXCG5C
         4YUhGSUVupo4gbn80WaE5PxuLydPBASmb2QO7EEr2cSmMLFJFR3CuHM98NYy2LjSeNG3
         Fmj4F4sY0SA6aOaxvvMWXhpd5uBDOQ6LYz0eCPQNjwJfWj6HvUt7BipehAnQa+4weiQv
         SumF6CMudceKF7Y19kHxdoErcyJ1Tueoyk3lEaPGP797NQCYMo8yWx0RzkAul3idMNT+
         7ihA==
X-Gm-Message-State: AOAM533XP2rW2BwfGCeSWWY07x0WJqnhthPjS4ZeSH9jxpgfHPQ52nCb
        vkVGzKU9COZew5tqXTzYYq/wsg==
X-Google-Smtp-Source: ABdhPJxOtzegb86TPTmyFZjDkmSZk8cQLsgTcRp0nO1c+3XhKOENwmgj3hS0Y1G4rrRKjY3+4p5egw==
X-Received: by 2002:a05:6512:b8a:: with SMTP id b10mr13849198lfv.69.1616964784117;
        Sun, 28 Mar 2021 13:53:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j19sm1589788lfb.15.2021.03.28.13.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 13:53:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/7] dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SM8250
Date:   Sun, 28 Mar 2021 23:52:52 +0300
Message-Id: <20210328205257.3348866-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
References: <20210328205257.3348866-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SM8250 in QMP USB3 DP PHY bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 62c0179d1765..217aa6c91893 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sdm845-qmp-usb3-dp-phy
+      - qcom,sm8250-qmp-usb3-dp-phy
   reg:
     items:
       - description: Address and length of PHY's USB serdes block.
-- 
2.30.2

