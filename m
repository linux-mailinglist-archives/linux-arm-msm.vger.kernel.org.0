Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595232C5087
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 09:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388953AbgKZIbz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 03:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388957AbgKZIbx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 03:31:53 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53733C061A04
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 00:31:52 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id k11so1129944pgq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 00:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=veZUTOqi4xMcoQ9kyn0A0Ud/TzM16l418+A2vqtpXSY=;
        b=hTgv752U6BTdsoU6zmD+Uzbq4HpXB4SKUQNc5B+zAphrL0flz/lBVzsKhxM0FnrefZ
         Oz1KFInzzRQh8q+OTYDLvb1XD10FZ+qmD9DnZYW+tDIuWwdfVM/TB8tV1pkQqSbRx81t
         WIbFm2ZUVNFHWmyK0a49Gd8myXYoJhyBdLOvK71dj3ZnDpgBHk6i78GwNBUzQzJJzP4V
         5ht9gJEcoS1Myh3OW+oWITbIrr94GztdQhGXR4X/jWbpx6NIIRacyl1eOFe5zsIVEV9/
         hVOEZcbXyJtt/3N5elCvvsRTg9aBhY2lFVaL8w1d2Cgq4HscljD2KoKz4raIyJ3xx7A+
         vHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=veZUTOqi4xMcoQ9kyn0A0Ud/TzM16l418+A2vqtpXSY=;
        b=J0QEsmBNVlDJu8HY69ycirtjJgGTBk7psd18z/4H3IXjo62enJK5+xMKt2yE08TOIR
         mCAVw2PUZ3NFKT/S5jMYIoJEO6V6GZi4pRBAjCmHSMCfYeYi9bcZSpstA3ejKEfoTcLu
         QFOVmcwRJOih4Y+A+2ALBNurfxdKdcm4FAw2vZP1LKlKpilsAiTJjg0ugXyewBUWh7sx
         LzU+ODrHHNJ+230ue5Na9QiK5uA97GyOJ5cfOt0kUgwbYVrtWHsb7LaFEoCpnwUPUtdM
         Y6cHmPuNN6IqDyd2ismntCN/inUW0D+2pNnnZxHJKjpyeKaFeykvyUkSkn8ivWxQdXq7
         fPbw==
X-Gm-Message-State: AOAM532Yyx2TpO6fpYfhTvqUP4mDsATj3d06ANumhtB7b4lSanejOkbz
        8Nt4E5piOopPxg1HyY1xLC8X
X-Google-Smtp-Source: ABdhPJzz2vUgL2AEvYQZOHt/t2ol46jTOTHHQ9E47cqREBxm8lWbLIHoK13YpsUS4vIJuiFcuMIocw==
X-Received: by 2002:a63:8c55:: with SMTP id q21mr1699762pgn.362.1606379511801;
        Thu, 26 Nov 2020 00:31:51 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id b21sm5360949pji.24.2020.11.26.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 00:31:51 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Document SDX55 platform and boards
Date:   Thu, 26 Nov 2020 14:01:37 +0530
Message-Id: <20201126083138.47047-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126083138.47047-1-manivannan.sadhasivam@linaro.org>
References: <20201126083138.47047-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Document the SDX55 platform binding and also the boards using it.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ad25deba4d86..1b8193023091 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -40,6 +40,7 @@ description: |
         sdm630
         sdm660
         sdm845
+        sdx55
         sm8250
 
   The 'board' element must be one of the following strings:
@@ -178,4 +179,9 @@ properties:
               - qcom,sm8250-mtp
           - const: qcom,sm8250
 
+      - items:
+          - enum:
+              - qcom,sdx55-mtp
+          - const: qcom,sdx55
+
 ...
-- 
2.25.1

