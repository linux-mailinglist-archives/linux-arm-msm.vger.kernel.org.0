Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F542C28DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 15:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgKXOAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 09:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbgKXOA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 09:00:28 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714CFC061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 06:00:28 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 62so17544933pgg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 06:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kyhquv0mMS3CorMj+sWTTBHJOlo8433qYt9M5B8qz54=;
        b=nv/b25rBpLYNGQibRoKPesDWATBCnnyP2TByNC3yZ6JP5ELx27X6Z2O9tQgSXPC5LW
         aBziEr7bi8nTIx0FpnQsjG7xK6KolXL4MGL0Mnk3UL9FP6RvJ+GvnE9q5B/j0Zu2VNeH
         E8YsyeYn766BDVQNlaVrdxRWW0gdWD0mGRiaPsdOdn+3YbuPvjSuTdV+0sAnUEDVz34x
         d7ngE8VtsyFAJTYSqkmApwFzVl9Orrd6Ml2ZIEEPg2p8uKq0aiywhmWWDZ5sSxU4P5SZ
         qt0bqzNGiQmN6ZVKUa+jt+UgQUYg2SjDzagI+xHLx09AS8G8oDIqfQT+wwQU8NijCB1V
         zKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kyhquv0mMS3CorMj+sWTTBHJOlo8433qYt9M5B8qz54=;
        b=XQjyUfzrIsu9JiJbVdpk/t+LVsVgKfxAbXvHbilW7Zy+iej6L/Eret0Q0azwEpb67Y
         wp2JvaCbF6SFQrZf7Op/HMQn7zuxDQ7/wH+4yEFoEZUj3ObEK/6rk45gHlIcAbMeG0PI
         t3arBDTmuyXmQJIrNTOqaFL3hI24xUIvKs0q9yqFXyqpBpMtWaKdN5IG90JR/fQ/qR15
         3f5GYKJzsRRLUyqklM/LJ/xdCuKRXme8+c2GwhBjj9aF69i8vWfDTdXeVKKz0Xs9fG1n
         jCXCXcMnrdTh1byGvJwds3bZhEqRFjC5YBL2MAe2kIFOPyRnZfNwQwnZl/yyGropERtO
         eEEw==
X-Gm-Message-State: AOAM530BwAAeMqySF7ojsB3gdW+SuxYiVcJvbcj2QDgssB0bP8R53t/T
        br1J9q8vlBmeKZsuMqKoEkJJ
X-Google-Smtp-Source: ABdhPJyYQ1OR/BtW8WS6RWlBbgoz4qzHN2O7woZwUV68M3Dob5D+iIDgMMfcsTsQqjmIPqkV7IdajQ==
X-Received: by 2002:a17:90a:fe88:: with SMTP id co8mr4939470pjb.76.1606226427992;
        Tue, 24 Nov 2020 06:00:27 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id u3sm14485937pfu.47.2020.11.24.06.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 06:00:27 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document SDX55 Modem and boards
Date:   Tue, 24 Nov 2020 19:30:10 +0530
Message-Id: <20201124140011.134751-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124140011.134751-1-manivannan.sadhasivam@linaro.org>
References: <20201124140011.134751-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Document the SDX55 Modem binding and also the boards using it.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ad25deba4d86..4362e8f0d495 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -39,6 +39,7 @@ description: |
         sc7180
         sdm630
         sdm660
+        sdx55
         sdm845
         sm8250
 
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

