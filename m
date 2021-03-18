Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B6A34076D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 15:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhCROMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 10:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhCROLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 10:11:49 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4496C061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:48 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a1so7684810ljp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h0485Vy5N6KF2+fijz/rHnQfF/jhn88oJ4/4iLXGr30=;
        b=V9X8tGwLPOsHNdupzksqUgugFJqG8rnsMXXro0vtgOq5rO1G50yYZVW06e59LFQhwF
         x3X8K1MNaXxoY6Sdp/C694bQWXwXS2LswrXNKnw2e67s81LE+OF5PhV8olUkxkMHGo14
         EbyNobDtN4veKAd+WS6WKScHaLOtHueUdn+1H1D2Smih2/gCuO8Iim+p3MLM8RGAMN6A
         /l4hX/uOjM1+SZ7mNEVmJDQ+Ac7ITkI5Psziy/NeYJVP+Gj+vcygYErZoQZ3V55bKTqB
         4qWmq/w379nLZQeiH4q9tju9aqpcLu2LPhAwo6FoeF80zemLxi7YfXCJ7GTo0PATTbYZ
         uXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h0485Vy5N6KF2+fijz/rHnQfF/jhn88oJ4/4iLXGr30=;
        b=BKaI7XZXBLpGcj+icxovXyJBEU5RCy/ahGP3aRTbjzsdD0Zqm43dmOyvBwHEgNp0s7
         17WXc2oN8KWEbC7SF2ygSQrUA4EphdXsusRF0so3QnKoFMbRQ44pNE99xZbnsWMawgCX
         5b3KpsqIcphkZy9ujWzWlNqpks/kD9Mb1W/J7tefMf6CGmq6JYvO5Gyc3eSUzk98l2jB
         j1FxSJizCR0N+LF84YWye4fwTs6kNeqLL+tic/qU65C02IoTs5n8xidMNtdZL1LrZQga
         1bPlUXziqoYu8RyTCzgNuj/9irVq+KM6iA9UQk2l53k2Dqtc6oWSHRwo/RFeHHUyakq2
         oXNA==
X-Gm-Message-State: AOAM531rCScqGNzyHgX/h9o4nNRZ7xQVWvOoBa+HOv4u/y9rttWL3LET
        ixdAKNRgo9yIEQtHnVssYHwRHg==
X-Google-Smtp-Source: ABdhPJyxdydyj9Q4YB4g8BPDiLcEYu24R2Ed/BgTs9LtJh4WbYp71V96/x3bKwmgsY7ZaJOMPwC6hg==
X-Received: by 2002:a2e:864d:: with SMTP id i13mr5307598ljj.48.1616076707168;
        Thu, 18 Mar 2021 07:11:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f20sm254713ljn.123.2021.03.18.07.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 07:11:46 -0700 (PDT)
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
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SM8250
Date:   Thu, 18 Mar 2021 17:11:39 +0300
Message-Id: <20210318141144.2147610-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318141144.2147610-1-dmitry.baryshkov@linaro.org>
References: <20210318141144.2147610-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SM8250 in QMP USB3 DP PHY bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 1 -
 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 626447fee092..c558aa605b9d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -38,7 +38,6 @@ properties:
       - qcom,sm8250-qmp-gen3x1-pcie-phy
       - qcom,sm8250-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-modem-pcie-phy
-      - qcom,sm8250-qmp-usb3-phy
       - qcom,sm8250-qmp-usb3-uni-phy
       - qcom,sm8350-qmp-ufs-phy
       - qcom,sm8350-qmp-usb3-phy
diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 33974ad10afe..9792cc567cb5 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -17,6 +17,8 @@ properties:
       - qcom,sc7180-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-dp-phy
       - qcom,sdm845-qmp-usb3-phy
+      - qcom,sm8250-qmp-usb3-dp-phy
+      - qcom,sm8250-qmp-usb3-phy
   reg:
     items:
       - description: Address and length of PHY's USB serdes block.
-- 
2.30.2

