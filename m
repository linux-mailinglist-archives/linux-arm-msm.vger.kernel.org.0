Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39633B0EE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhFVUkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFVUkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:40:23 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57834C061574;
        Tue, 22 Jun 2021 13:38:06 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bu12so515446ejb.0;
        Tue, 22 Jun 2021 13:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2reE9HEGFS3GmTlFMNmOymvNynHbKbLeTe3x7zc3Gic=;
        b=QV+rtczjWmXLP9+gjBepmDsaLxtvKeuA4yDciNrWmKFV9qP2ImVIL9+K/9DoGYv+oK
         1V0b4kC0C8eZm/E6KkhLcPG2Ildm+7m0dTNF5beAnmHA1klYgO8IDWNV2nVUss1aX7Oi
         gT2kXm3Q+fw0sZW3vJAhXfsSlLSQddZonDVLUiQQGs0YcEMUENMNzaciuGPfV1OCHTx2
         ZBf60dmAnRB5Adklaxidxa09ZF3p+w5iKesMjRUBmbYocaOGI68flWptrL6wVXzA5SvL
         IeX0Zywh+9STSXKsOYDu3+r6qi/28Eb2G+L3mukADEqMaqdt3+kGfnZyAa6g05yFMszl
         Wfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2reE9HEGFS3GmTlFMNmOymvNynHbKbLeTe3x7zc3Gic=;
        b=OrR1F0YdvwaivhRD3SiRaXED2Oyy/BaxRqgSXzG9R0mDYcBsiygdaZgSTWjLwYC+5w
         zf402mWFF3WbePklo4r7Gj58LCZFFnqIlfdORPs9Moj5IpnUcB8jVQK3rG1++DYPgNpp
         OkKIFyvIr4bzjUzCv0ZymfNxXVIwptr66MDgtA1bfzg9Cx1IyPmjgYwYr+reA6/cxOvv
         UsZBuR53rzXLmEgKseVKKYJJ5SWl5EBdJoGS6GlSxcDouaMNMPiw1Eqx9RhBEVGMDg9r
         G9+COdPLl3yaw8PCMpGht2Ao4MjrvjkWrtuJsK5hLwIR3EXALsmaW7hXj3UHYs7pCA2e
         NmFw==
X-Gm-Message-State: AOAM532Mef2bMxzJBJwOjCfF3sTjMkTzhNbR90vx714zD54Vto9g9WXg
        xI1/Xm1djhRAm23py6gAyeo=
X-Google-Smtp-Source: ABdhPJwSeqV/Kln9gJnycFrxBR4phiQi0Kh7NdxE+6TTx6BL/chbRdztCWmRsnWW0HpbEWoDBoim9Q==
X-Received: by 2002:a17:906:240d:: with SMTP id z13mr5973073eja.118.1624394284830;
        Tue, 22 Jun 2021 13:38:04 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id y16sm63709ejk.101.2021.06.22.13.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:38:04 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: mailbox: qcom: Add SM6115, SM4250 APCS compatible
Date:   Tue, 22 Jun 2021 23:37:58 +0300
Message-Id: <20210622203759.566716-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for the Qualcomm SM6115 and SM4250 APCS block to the
Qualcomm APCS binding.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 5dc1173d03fd..f56897156d66 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -27,6 +27,8 @@ properties:
       - qcom,sc8180x-apss-shared
       - qcom,sdm660-apcs-hmss-global
       - qcom,sdm845-apss-shared
+      - qcom,sm4250-apcs-hmss-global
+      - qcom,sm6115-apcs-hmss-global
       - qcom,sm8150-apss-shared
 
   reg:

base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
prerequisite-patch-id: 0949ba2e2f20cd3acfeff8be80dc78c7a02962fc
prerequisite-patch-id: f72aa823fffe9b245a924a6da8a14a473fffa5a2
prerequisite-patch-id: f4548f3471a407e62555c12da5d17bd5fd70f73f
prerequisite-patch-id: 4fa7457c334f5ac3d43b733478494d74aa23b9ee
prerequisite-patch-id: dfc565680fb8e8cfa7fc32556efe00a2c329cd33
prerequisite-patch-id: 541c755a0068730e30e1d2e8a29b8c952aef0a7e
prerequisite-patch-id: ce568b048e54d44e241813ef0e2d5ce302cb06a5
prerequisite-patch-id: 83a519082ea76dd4d8579b48e203a38796042fef
prerequisite-patch-id: 43005c6a296706a18e5e5decb77935442cb63451
-- 
2.31.1

