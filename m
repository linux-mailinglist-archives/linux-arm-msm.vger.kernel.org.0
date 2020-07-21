Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8320F227B61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 11:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgGUJHp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 05:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgGUJHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 05:07:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6407C0619D8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 02:07:44 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s10so20357685wrw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/OxVowHa1fzTS8gxpWxPISoWUyhArDmXgs2hoChHUPc=;
        b=rA/559WyzqjkNR0hbv9ikfJ1cN7FUfBS0VOcj1VuFigCuNRmYYnaZ8HL5f2FY6y2OV
         CNxdI61eEXdQ15w/ee103fQDg1Q/NQvsoozh5MZnCIjtftL4U4JTshJnjE8CE3kmLE82
         29rQIEHxkgGrrxj0kOidCm1FY5O/2z5dX28DYn2aL7ygStdgIuZgeFKGWwpK3HZwfzwa
         iiRHEo5furMeU9/ZnIUUKQ1F+opEl43up4wCVu5cSUeuvUWTJxhFBbB8xGk2oFt7zPLU
         CQWPhkG3F+JH9gw+dR+87Dboa5DIxFOz+cVvaB8GJYzdwaDsG9fx4mZazA6oN7lVjrdn
         QU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/OxVowHa1fzTS8gxpWxPISoWUyhArDmXgs2hoChHUPc=;
        b=GogdRPdI9zTdiZzo3JMathXgl3olzty/MiFSg7UXYHfd6ZX78QAiWeFyiitzdlwWcj
         Tbhoxf4MCS8kID+J4bQLOwxGb1T1LS2e8iT5NNsjv/ooD0JSaNxwdx+8/E9npS1d1S1f
         4873u4GYW1b5iUG88XqDSqdq0lBJe/J0U2eFMj+TU6M3CIiILs0bwlTyxkCP35F5UZdE
         t+7Iye08JQ6uvVxZ0LI7qbV1NEPO8E708YCOKF6GdRvyz/gyBdrd0wqM6McSFenWG8Wm
         BHEieK4oObOprKnA60lGOjUUPVp0CoXIgXSHdtsaBXA+CYhIBdp4m+UnZegps4Zm0CI5
         bOfw==
X-Gm-Message-State: AOAM531I7s/daiu0zJu5x2nTKnmIAOnFJOW3YA6ol7q6VlULLN6a+cD+
        ZDep6S1pZeOgUNb0+2kmMxatsQ==
X-Google-Smtp-Source: ABdhPJzvKTkGOU3P6banh76jfIC31xAnMFma1OCt8xasxSNWGqr4pPlHEn1SLwIj5zO/QkMX7HRX8A==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr28572300wrs.60.1595322463467;
        Tue, 21 Jul 2020 02:07:43 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id m9sm2495594wml.45.2020.07.21.02.07.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 02:07:43 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] dt-bindings: clock: Fix qcom,msm8996-apcc yaml syntax
Date:   Tue, 21 Jul 2020 11:13:11 +0200
Message-Id: <1595322791-18571-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix errors reported by dt_binding_check.
- Fix literal block scalar for dts example
- Fix schema identifier URI

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index d673ede..a20cb10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,kryocc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,msm8996-apcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm clock controller for MSM8996 CPUs
@@ -46,11 +46,9 @@ required:
 additionalProperties: false
 
 examples:
-  # Example for msm8996
   - |
     kryocc: clock-controller@6400000 {
         compatible = "qcom,msm8996-apcc";
         reg = <0x6400000 0x90000>;
         #clock-cells = <1>;
-  };
-...
+    };
-- 
2.7.4

