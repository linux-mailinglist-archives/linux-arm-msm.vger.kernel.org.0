Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66384535B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 16:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238105AbhKPP1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 10:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238124AbhKPP1I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 10:27:08 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A32AC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 07:24:11 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i12so16490043wmq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ic7tuGpaS8/hqtPDK3UcPIMhRerIURUqlJhICnkZYYk=;
        b=TFNgiwmCLGCEdZck6rW5G5PXMyo9TiiyaF3olI3ZQNcUnvhbxzUtTzytWCIG8590fP
         Gvl7Kbompuj+h3ZSdbIXsTIBtTOwuu4NBaaET/Pu3V8NYt3zghmOkES9NX55cRFyCmoP
         238ugihGpWjJSgX+1PKhK8ennyq75SWv4u44nIJOcdqTKCkOyHrIeOaP8umP+k4Vlbk4
         XyK8S2+OwJYeS4Xz4ZkykFMsSa6MY362JSHui4xaWfMzizHBNRuCvlu7FMi8Gigv9dg8
         q1Tirl7+tZAEpE8JKQVugR8Nloi6dL5uVv+q6De3n27VAFvS5t4MRI5S42x445Qlp9/Z
         K0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ic7tuGpaS8/hqtPDK3UcPIMhRerIURUqlJhICnkZYYk=;
        b=F+YzieZpemmyF2DPdmM0ybml/nl579LhUEKi3J9RAdkMNwlsBOSo94ZJedO8MhF6dl
         1QWTTIQYGgxgNt1ay2cKS1HdUrgui4t5DLWzYYnbsOiX0K/dwsVq49Iv+37kv1uCuD6J
         HLnGrbnUBCCd29ZUu/2LUPBC2AivqlyGZfQejlvc5fV9LWv7olYwfSO/25c+9BqeEo1z
         8ldiWDYsYMYPrON1c1oiCRapXorj2QeitS15Hn/uYMdkDcj5t68x0A8Kjxch+5lXbPKd
         ulMGJ5GmmcmFZ57n9hfh3dTKf1GutaPV5U6pEJOrq72nnuNIdcrIevlrotb2iH/bv7f4
         c07A==
X-Gm-Message-State: AOAM531gYDttHGZJ3EeX3B18pqQtrgpsPk53fPYEo8OY3WRsxKOnHI9j
        GaN3a1Bx/+hj9gbcUl8aSiVDUg==
X-Google-Smtp-Source: ABdhPJwdMTQXcwElNEb7d90Bgd7XvdzwElkRm0YBfVkOQaFEmb/6q16deDVzwqbeSC+m0k6krrjzxg==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr8788746wmk.27.1637076249577;
        Tue, 16 Nov 2021 07:24:09 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id u23sm18847352wru.21.2021.11.16.07.24.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 07:24:09 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        shawn.guo@linaro.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] dt-bindings: qcom,pmic-gpio: Add pm2250 compatible string
Date:   Tue, 16 Nov 2021 16:35:15 +0100
Message-Id: <1637076915-3280-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637076915-3280-1-git-send-email-loic.poulain@linaro.org>
References: <1637076915-3280-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible strings for pm2250 SPMI GPIO to documentation.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 8952b4c..42d8491 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,pm2250-gpio
           - qcom,pm660-gpio
           - qcom,pm660l-gpio
           - qcom,pm6150-gpio
-- 
2.7.4

