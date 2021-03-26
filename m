Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6593B34AE18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 18:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhCZR6n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 13:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhCZR6P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 13:58:15 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB34C0613B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:58:14 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u10so8382068lju.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XWrsj3dJwSrfufEFgLCZmi7yoC1QmoKQ7JDMUs4x5U=;
        b=QQvNVz0Qk43rfmOgDmj4FuygNAbkA+Wxtx0QDebmBNYwE963Z1i90oUylRTiiUK/fJ
         rM5mAYYwah96UPBCviX4uiA8xMGKRggRwG8lK7C77fZyNdXg971UuDcMV1imLLDx9PIZ
         Sy0hcqoqTsigAD/MroFxAFyYiD2z12cAyyqLt7ONJBkrRe7mJWnGn0oqVonsus+x75fc
         uVtGgMn05AswFdeBRE7r/ezOUbLzyw0+/rCQdjLzBMsEv/m22zGaS70G6K5wuDOU5PRA
         xA0FOSPdA1wDtryq36Wtc7AAlwICOkpio2KEtyRzDjWv9KaglSFZjuwx/06VDbo+Gf4j
         KMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XWrsj3dJwSrfufEFgLCZmi7yoC1QmoKQ7JDMUs4x5U=;
        b=mWNDLkRo6D4ET4pX3DUGamAnMDbVAcIoAUSJRGtAKQlv5Y9ZwL6RjR8FrMLyvq9bzx
         Nlcx2CF2UVkN7jBJacjHKnN6v3aLvrXPUYZ98mIMuTIZLy6cLQotKvLfc4mTqQ3M88it
         /UbnNUyQKP8OvpWk+plnByKlKAoyf3A5bI3im5jrORtetYg60OOJ1N81myrE13QsI5JQ
         VuXeLDy1HKGJHQFIf8e7Izu5rFx/4t+u9k6kUSqvvWBkDdOao8BhxlNlDOfHfCZMEgzN
         9a++IMKvZfJ+1M7rQVpg9ppUUSoUl4Vh2g/o2LdTkHhQRIf3LmKohraMJ4JFcX4d6wXY
         /RmQ==
X-Gm-Message-State: AOAM533ovCEEF/m775VpaMkBKS0v8D4UUkG5kHdznx0qjSBKOsa09uUN
        uYbcGYu0PnI82WE9g+9CqhPQCw==
X-Google-Smtp-Source: ABdhPJxzl/nekbxczyiDMF3pxav/w+7RHX9+sbpPDXeJelriwVmEFVuzdrUTxDc7JMlKYe6HTQGLZg==
X-Received: by 2002:a2e:988f:: with SMTP id b15mr10071833ljj.394.1616781492873;
        Fri, 26 Mar 2021 10:58:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f3sm1249554ljm.5.2021.03.26.10.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:58:12 -0700 (PDT)
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
        devicetree@vger.kernel.org
Subject: [PATCH v4 2/7] dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SM8250
Date:   Fri, 26 Mar 2021 20:58:04 +0300
Message-Id: <20210326175809.2923789-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org>
References: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SM8250 in QMP USB3 DP PHY bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

