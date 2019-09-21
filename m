Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 509C6B9D61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407523AbfIUKRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:17:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43121 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407522AbfIUKRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:17:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id q17so9124280wrx.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XinaigRZRPCsTtnc+cnJp3LE5Y4tXrMkrDHkNcx+Dgg=;
        b=NwnN5+fxMSguMuCmGz8b2Xgp6Guf2UTbJgPmm8Va4sHwXRisWYlHXegGbevDNGW6Yj
         /BMutQBLN1tWs+59JmUeCEGLG++qHWt5nzpDnWYUvDSKyy6FJo+UvP25BTQuyx0iJ9L2
         am0SmulTpODss3Jv1eHeOknKmZuMcHEW9API7aJ8v7DSFVsJzkMaUPbRE3UtEZrZ7bbs
         kD5LUuADlg+IP0xm/Rk/FxDd+qnQLT+7+FZCUImKX12KkAJh20EpwOje2MB3uaZGKmwZ
         jOMf3R7Kzj8AIUHhT2aKt4m1RfSUfyapKenvVqz2XCA2/JOqlx4BSCurJHqorZjHXNj+
         EqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XinaigRZRPCsTtnc+cnJp3LE5Y4tXrMkrDHkNcx+Dgg=;
        b=QjGPgTLEBfDlRAwekPylpd/hRk7Q8vlzPsKxmCSI35AIr88Sy7YInChRwYbYmY/gc8
         bfZVthd2H4FkPmpaSxAzTvmuy4u/3bJErcIRrYdRTNtbAVhhOcB6cYq2Uzr2eqrqOE9f
         PcV8YQh9k3AnXrsHNCa0gPjoL1l66B72f+647m0uMU6sXjarJ5euPFY6JwqQTfCtHzkt
         WxfjwXslp3d8BZKwPx9wK3umzyy86yhe4yKMNFnrLA4mRLazui6LJ81rqgX+T9+wmW18
         eCuiVYTxSwJsfJEnPj1tzICm9Cg7zrJxIbSeekZeuxxOFvliuvk3BWbm5qmjWJOWTzKm
         E40A==
X-Gm-Message-State: APjAAAV4LBhFl6A+RazLHeIo2zhW9X4OFCn44NputJ816Y//iMoij93I
        qYRe2xuzw+2SLEzO+WlT0psw6hj0Fb0=
X-Google-Smtp-Source: APXvYqy5vPHoMInYsVd5J2FJ434JgD6FuMdQ210tAdRsMOuNKFc51GdE4LGhcD9eH1dX/N+qoR+bHQ==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr10355033wrn.234.1569061068800;
        Sat, 21 Sep 2019 03:17:48 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s19sm8313020wrb.14.2019.09.21.03.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:17:48 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH 2/2] dt: thermal: tsens: Document compatible for MSM8956 and MSM8976
Date:   Sat, 21 Sep 2019 12:17:40 +0200
Message-Id: <20190921101740.430-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921101740.430-1-kholk11@gmail.com>
References: <20190921101740.430-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Support for MSM8976 and MSM8956 (having tsens ip version 1) has
been added to the qcom tsens driver: document the addition here.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
index 673cc1831ee9..91a8c5666638 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
@@ -6,6 +6,7 @@ Required properties:
     - "qcom,msm8916-tsens" (MSM8916)
     - "qcom,msm8974-tsens" (MSM8974)
     - "qcom,msm8996-tsens" (MSM8996)
+    - "qcom,msm8976-tsens", "qcom,tsens-v1" (MSM8956/MSM8976)
     - "qcom,qcs404-tsens", "qcom,tsens-v1" (QCS404)
     - "qcom,msm8998-tsens", "qcom,tsens-v2" (MSM8998)
     - "qcom,sdm845-tsens", "qcom,tsens-v2" (SDM845)
-- 
2.21.0

