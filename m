Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B793CC883
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jul 2021 12:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhGRKwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 06:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbhGRKwJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 06:52:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDECC0613DB
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a12so24257667lfb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D63/+TxRKfSO58fkCSffqgWBORWJvZPVM0amiHKwxec=;
        b=t+HDcrLUacRbP8DNOo5e+GGGeA4NvCD16BJ6c9ka/ZJCd3Nrv0m/OPSnhoca/L5Igj
         NWWteA5rbOi21sMd5M2yzB7oPIJPe1s+LlUlQTO9nibj69OR/n//T/n52ChJmo8kA1Lw
         Jj7WfAhY2T/S9uCN0pnCx6Y1EpU9+90hCQgo+Rqqkuz6RZ0PZiXgoprRAJ75NE5dGKWn
         5Hin+Sxz3IVE5JWELvfTEFkpkjYPU6Y4+cZPS5JW83kuF9XJR/Z3aHM1UY5PBgb9lnWT
         tWhmhCMwLAo/Orn+ldJhB472Aanj37ZIkjs/pg3O+Eman8HYvduy0fN2WdSimiL9JFq+
         XTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D63/+TxRKfSO58fkCSffqgWBORWJvZPVM0amiHKwxec=;
        b=VMhNvTM6I4cKVyqjAftI7nEFFkZ9ifiXwE0TcL2B4EmuFGxYLbhqIp8mkZWEYLenql
         +IZrLfkzyfEolHuA1bfIYDCzcqbovx8sGnILcyyJtWemnLo8c9ZWOxxjpnpZqe3lqyFq
         EFXOlBhIGBgEEgUceKryIvze85qvAnU1lVbdYdsUpxiviygUKS/K8H8gNBgHkbFYMvhQ
         IUVNnVLEcBBMSktITeYrn2Okd2PoRmathqkx0QP2zAOlZi0CxTGus66hrM5kfI0q2llE
         sPKivIMhwUu2W6gOV1QuF/kKOR6VP2ZXSArolRTDlBcEE1njrS1GSq2L4D2+9oUA0QRq
         HoBA==
X-Gm-Message-State: AOAM531ULcZsthWxIo69x59gtVfMz7yN11BQn4Nr6wRmaRory7eFXvFa
        3Ju8FTHYsDJUOGGRq89qf/PJTA==
X-Google-Smtp-Source: ABdhPJxc2vkNluaAJwBoTzZVkGdqt9L9Rob3X0LlWnRT1n/e0yx/7dEc6/8BDRbSN5dRTl7uFfdk6A==
X-Received: by 2002:ac2:4206:: with SMTP id y6mr14382336lfh.206.1626605348335;
        Sun, 18 Jul 2021 03:49:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/9] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Sun, 18 Jul 2021 13:48:53 +0300
Message-Id: <20210718104901.454843-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8250 dispcc requires MMCX power domain to be powered up before
clock controller's registers become available. For now sm8250 was using
external regulator driven by the power domain to describe this
relationship. Switch into specifying power-domain and required opp-state
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 6667261dc665..6b3380cf1a10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -56,6 +56,11 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -70,6 +75,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8250-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -90,5 +96,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
     };
 ...
-- 
2.30.2

