Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261023FACCE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 17:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbhH2Ps6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 11:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235564AbhH2Psz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 11:48:55 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B31C061796
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:48:02 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s3so21258009ljp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTbSV1E56r1NVZnQXDLnD85O88p/XKd1hFPjXfdyNKM=;
        b=fUKbEOZOe8ciXUu+L1aPDtOfETIX4lcjQ4ye+RO8Tb0n1yBBGrGTWsfykF/igiM2ti
         JsntY4K3BnJ0JSV52cElEARTVg7hjXxeOm/ObhO+4voF5W8gZCVj5cAPpFviz2dXL5z2
         ZkyHOsYV343oMOambqC74/BCeIHJ9tAJvvGvWYWW5JOEcPkbM+pVOGBdfeC+B3VAC8Nx
         qkH7BTiwbSGg2hoQbJnZJcDlc7MxGQXTguFaXElriA/Kjq0fmfAu3sp3VaYRHuShlgjJ
         McJntFk9Ecn3hcYI8GEbPTqTICpCH0JGAV/g04Xx3ANQFhFakicsFmRUMbjirUWIn5yU
         rzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTbSV1E56r1NVZnQXDLnD85O88p/XKd1hFPjXfdyNKM=;
        b=rT+Nn6BAOvWlyWf7Pis5ktKUhVLc2Skx7bc5WImz4/GMFPldsZxy+skJWMGoxzxOi4
         IkV1NwHcehzc2TCM5im20Wy1abME+hJdwE+eLcDwIm2mlnwEy13RWqYkDMafrhnITgdY
         4/a3+/B9eNZsUcFp9YI3mFPmxObdtjzjgp5p+w09CWo1kjQftnVOoSxD/73Ho6Eu/tHm
         UFSfTl/UQ/l+axVirtgsOgv2t+ifAUklaXKDNtCPTdybM3SDKZzuOi36JR7kv05KIDF8
         MvDvjVGwbR5zmalyDmAfIwUfdA/xuB5ivu5BHoW32DpEa08lLM0Vbgqky9g6ROcxp3XC
         wyIg==
X-Gm-Message-State: AOAM531ZahTm7rOcO2t4at9kKh/fmb7mRaRyKAtcxLZRYM3idMXixZl6
        rkhipQjMlgAGMpSw1b+BxtK20g==
X-Google-Smtp-Source: ABdhPJwu1w8Ez8V1SSEP1iN9iT0vYNZi4Mw24O1Bs5AWrkAvlJWFDrzy8Pzs0mcDOxQoHdV1ODa9ww==
X-Received: by 2002:a2e:bb93:: with SMTP id y19mr16468601lje.79.1630252080977;
        Sun, 29 Aug 2021 08:48:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y5sm1481243ljd.38.2021.08.29.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 08:48:00 -0700 (PDT)
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
Subject: [PATCH v7 2/8] dt-bindings: clock: qcom,videocc: add mmcx power domain
Date:   Sun, 29 Aug 2021 18:47:51 +0300
Message-Id: <20210829154757.784699-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8250 videocc requires MMCX power domain to be powered up before
clock controller's registers become available. For now sm8250 was using
external regulator driven by the power domain to describe this
relationship. Switch into specifying power-domain and required opp-state
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 567202942b88..5d7053503435 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -47,6 +47,16 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required MMCX performance point.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -61,6 +71,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@ab00000 {
       compatible = "qcom,sdm845-videocc";
       reg = <0x0ab00000 0x10000>;
@@ -69,5 +80,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
     };
 ...
-- 
2.33.0

