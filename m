Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5303C1E5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 06:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhGIEec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 00:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhGIEeZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 00:34:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FE6C061766
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 21:31:41 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 11so1905134ljv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 21:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLWZj85HgqkOqv1HxmNCRrODidaWLC0A2DygbxwWKbA=;
        b=sParuvrSW3yxOcQImsE/pSCTQsOWei74sYLKne+13T8AGuPpPTPGmK5tqJ4t/huvC5
         JqLDLskOrOsSFTCiWSPOnOYtGMF4nepGfge0N7s3Hc2mQCV92Y5FnUvfk0avW1wP+c/O
         zzNNICJ5cPLJvz5M4slRZs6w+pZrJ2ssyQW6qzU7Zf7w27OyOE2+MuwolUJ6dxR/tcoq
         vY/bsMKFBI5LVvmLS9I2oRBAiazKiG3T7ow9wMDWwo8URO7kgblsJCAbCSFsR5eFXJjI
         OyANlUpiTCdH4cosnKXw09vr+OuDE0MVDu62o3ozIoT9t05f2bPckUVb+Wn8gGPc1hu4
         5xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLWZj85HgqkOqv1HxmNCRrODidaWLC0A2DygbxwWKbA=;
        b=e8Wg5ES3yaOYu21baKFlO2D64chCqzgb4/IRhmeiddzLce3mpl1vAZjCyKc2Y+EKAw
         dJleTG5W4HPmyHqPjQisK1Xu/Qd4wBe9P46j87a/3Qv3Yj4GSkBYw0yYsvhGD8cXEd+U
         Q2RXZ3Y8YhwBK3hVpdzzdc4Z9WdWTz2v1bMLqLes/IlyeTst8MKKfs5uQOmmWxAtPczL
         SUsNo+NR+4PkFmyBo7/hNuTQGJc9vUpugYgl3wv/QMBKyCky2/gOk3q7nZ+FTGujEtJt
         65q0T4ITRaPvp80GSWRHxZtz584QQrpwc1gwCA5LVWQSOK3k5TDH4npCFkJ2ycNJIU9d
         uodQ==
X-Gm-Message-State: AOAM5323dKoAb+MtWB08dyp5TPW1nGk1SakRetlhyYUsBjzk9UMsenyM
        FWfmcaFkNVRrGNvkqmUTdQLsGQ==
X-Google-Smtp-Source: ABdhPJzC7Z+xZjYcUQMVMQp4Gm4Y3ui0lhahHrsnQGoO/Uq+qBwQl2gqLJ7mDclck5qgW7HBdX0rhQ==
X-Received: by 2002:a2e:a54a:: with SMTP id e10mr27331977ljn.120.1625805099320;
        Thu, 08 Jul 2021 21:31:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:38 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 1/7] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
Date:   Fri,  9 Jul 2021 07:31:30 +0300
Message-Id: <20210709043136.533205-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
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
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..d5c4fed56b6e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -55,6 +55,11 @@ properties:
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
@@ -69,6 +74,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8250-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -89,5 +95,6 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
     };
 ...
-- 
2.30.2

