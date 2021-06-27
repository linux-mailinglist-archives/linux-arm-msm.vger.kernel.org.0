Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471A73B54EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhF0TCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbhF0TCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:02:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9491C0617A6;
        Sun, 27 Jun 2021 11:59:35 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id g7so13293117wri.7;
        Sun, 27 Jun 2021 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JOv6qHae3oCbikVuTJPrpoMGFW5lMce2DcFuNYr9Ow4=;
        b=NFVQvFqkzRXZrGCzMc2mS/AhEsgDUKiapWTHEfLTvenHavVKeK0FAbYTbdrtUCEax6
         Yw/N6ALJQjroAVv3WxGSW7qpqlmZT+50U8+zVnUaLwyWNWQajtMHK1qdyQcn8WCoY67B
         dPDj+p1q2Tssv0FYgbYt8N6pqbDyvO30VXh1oiBVFjiFc6W9KSYM/bKo/JAw0DGVFE3T
         inoTK6HuiviMuVCZq9BjpZRRM2ZWkI/XkpdY5SCoHNc1tJaUV7dXTbgOxcdG/HTr8A66
         NTt2xzUwYinhe15qgtRV6/DvpxGtjDAYWRPNFATmGR+bgrFDdWWJwgCMw9GxpXvW2GJr
         rVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOv6qHae3oCbikVuTJPrpoMGFW5lMce2DcFuNYr9Ow4=;
        b=tAvv9zuxjTNKPUZGfVWMejltt9kpOhSkZLB2AZejRxyfu/RZfU2ZkVbNWRGxsGYz9r
         71C3bRQoFMmANQE9oJIC1ivRiXWdu3x8OzCz2C3iUpqLpr508OSw0FRJTN2ZhCiqL1C3
         dbOiSR/ZlVGgZcxol1cxxRkwDFOedyNYrLoAvDaOIIzUZKEODcZMsX+Ncs5ZjQ2U5bm/
         Y1c/XD545hBTq0vtGf1fkPlbrBlq9RPRcIYurY6EnjxHy8G/ulgijePZfYSGg0OY6r9m
         +WxEeL2RMQp4BEqe0EWOx8CIts87YCw+jJR82jatMPzFXfLkSTgNEaU9GOhQbYRT/t1d
         APIA==
X-Gm-Message-State: AOAM532XKo17V7yFNsOliv5zBX0LisuTdAZJPx53ca8GIHeasVoPssiM
        ujnLvakAKHDnpMeNcqzZeD8=
X-Google-Smtp-Source: ABdhPJy3J7L9359qrxAouC5deHjkvZM6r2fxmkHbA7rRDa7E3nijmspRTk+tpPSft4iPg3zIP64+Uw==
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr23742736wry.97.1624820374386;
        Sun, 27 Jun 2021 11:59:34 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id x1sm11242838wmc.31.2021.06.27.11.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:59:34 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: rpmcc: Document SM6115 compatible
Date:   Sun, 27 Jun 2021 21:59:24 +0300
Message-Id: <20210627185927.695411-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185927.695411-1-iskren.chernev@gmail.com>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the dt-binding for the RPM Clock Controller on the SM4250/6115 SoCs.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt |  1 +
 include/dt-bindings/clock/qcom,rpmcc.h                 | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 6cf5a7ec2b4c..0045583f02b5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -25,6 +25,7 @@ Required properties :
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 			"qcom,rpmcc-sdm660", "qcom,rpmcc"
+			"qcom,rpmcc-sm6115", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
 
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 8aaba7cd9589..aa834d516234 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -149,5 +149,15 @@
 #define RPM_SMD_CE2_A_CLK			103
 #define RPM_SMD_CE3_CLK				104
 #define RPM_SMD_CE3_A_CLK			105
+#define RPM_SMD_QUP_CLK				106
+#define RPM_SMD_QUP_A_CLK			107
+#define RPM_SMD_MMRT_CLK			108
+#define RPM_SMD_MMRT_A_CLK			109
+#define RPM_SMD_MMNRT_CLK			110
+#define RPM_SMD_MMNRT_A_CLK			111
+#define RPM_SMD_SNOC_PERIPH_CLK			112
+#define RPM_SMD_SNOC_PERIPH_A_CLK		113
+#define RPM_SMD_SNOC_LPASS_CLK			114
+#define RPM_SMD_SNOC_LPASS_A_CLK		115
 
 #endif
-- 
2.32.0

