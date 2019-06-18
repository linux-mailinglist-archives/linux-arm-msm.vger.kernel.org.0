Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05AC4A6C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 18:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbfFRQZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 12:25:29 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36798 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729884AbfFRQZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 12:25:29 -0400
Received: by mail-qk1-f195.google.com with SMTP id g18so8977921qkl.3;
        Tue, 18 Jun 2019 09:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qkdcu7zHGx1AY6tHr0CBTbe0qNt7my9OtsBaqe2MQWM=;
        b=uNjqHCqD2eIpRqjP37uw7VQ7Mty1l7px1SpXk03OeXnn+aS3t9O8amdEVeFbxubsuW
         nXeuwIkQQE4waPA5BeM4c5Bhbf9MA3ZWYSuRRVgzKaKwXo6TKW1FyZhGs4r22Yx+JDcu
         MG0g6NnGI3GYF36z3+AEnQ+7b4emuH7cl9ugmmXpKh+81t0+nW0KSop41737qmfPlcps
         i6aaCoEZxMDWykTKSDYTk8FSRysMPdm7OLcZo25+lPycv6xaTreFkm4qh9aRbxu+pwOw
         TRF0CDjG4HZVClezrVq6dpUizxco/LPoDfDDSp5Z0UbeoNJ3FSRw0MXR9PDv2Nm+ibIv
         GFaQ==
X-Gm-Message-State: APjAAAXkhwP+ljI8C59uDvrSaAp/8QbWA+TugSNtgKO1g/Xan2+GSHNo
        f9qOVy+mya1pFFgRtl5mpCP54hA=
X-Google-Smtp-Source: APXvYqwuAbO1paeBPbqwfu+B52ifzwL0iehCq7FfPuyuo/qXSaUN6It5MurZgLsKEIOUqaeFh8M1HQ==
X-Received: by 2002:ae9:c10c:: with SMTP id z12mr42178896qki.110.1560875128305;
        Tue, 18 Jun 2019 09:25:28 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.192])
        by smtp.googlemail.com with ESMTPSA id n5sm9518671qta.29.2019.06.18.09.25.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 09:25:27 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom: Add missing schema for MSM8974
Date:   Tue, 18 Jun 2019 10:25:25 -0600
Message-Id: <20190618162525.5038-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SoC/board bindings for MSM8974 are undocumented. Add the missing
bindings to the schema.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f6316ab66385..04867577306a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -101,6 +101,15 @@ properties:
               - qcom,msm8960-cdp
           - const: qcom,msm8960
 
+      - items:
+          - enum:
+              - fairphone,fp2
+              - lge,hammerhead
+              - sony,xperia-amami
+              - sony,xperia-castor
+              - sony,xperia-honami
+          - const: qcom,msm8974
+
       - items:
           - const: qcom,msm8916-mtp/1
           - const: qcom,msm8916-mtp
-- 
2.20.1

