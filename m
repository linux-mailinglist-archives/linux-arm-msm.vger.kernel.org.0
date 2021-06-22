Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8859A3B0E93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhFVUYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFVUYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:24:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4854FC06175F;
        Tue, 22 Jun 2021 13:22:06 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ji1so368205ejc.4;
        Tue, 22 Jun 2021 13:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wiyFxzRG4eYcz/TzbOaSY6nW2F1dZos7gYhAMYmo4TY=;
        b=AszG1Vrxu3C0nFy+TZcJ0UrkxUoQqFGSWa3X0nG7KpQMbYZ6G55KdOWJ4JQ/CGqgBp
         d1fkDT9uG26PvhpfhtmvvFwkdEhxmZeNU1pa6IavOH6ZJuVtdnnZTkNyXFjuwn4jGiMd
         4RZU2ANo41kWBjEI/Wq9CQoVpPW4603tN2Q/QVC6xg8r6i90y67SswVp/yltjGFek31y
         T0ssRrnEaQMVnH7M1Kz2rUeTYYlWSMw+xth257hmBtdFnYvVLzF5A8hOqALrycEstPPO
         8wmQMZr+apEcclJftuU6d5YM/S8yJbiQcfjRv0gCIbM8ptKs0GoixhQ3zWULz4b2XwDt
         teDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wiyFxzRG4eYcz/TzbOaSY6nW2F1dZos7gYhAMYmo4TY=;
        b=H886pKoYgMUfB3pWFPCzkkzNyASWNuH2m/nqGgjNSu+I+nV2u/f0UIevIJVYEg8jr1
         SSu5ROB3MYZEx4bSciwFvoVzH6B8sdwuHTUmXcw+VRWMnyEpRQoiVFfmoLqCRYMON6L3
         B4MaTCpT/btDbf3hHs3C9oh11zumRlm+U+RuEuwVGqch/Sc6B3nd4q9SZ4/LV3M4R0gP
         E380z4iaoGvRdAr1q6wcN/lSEPBjBjf6srxnWiK6DZRUi9x3ns4XujAf58VDWwTOfMIg
         +1+bAneFs+I1r0kD/C+Czw3ED+EVN0wqqhtWmv5QqreZ1wKCvmzBdtVJHrPkXBj8tCTl
         NWqA==
X-Gm-Message-State: AOAM531eFOdp3NVmxfaLuBzk+ElGvIylWSfcjJkwMIOQxoliIVxUwKnm
        AP4+UTfoBHfNm+YVrBxwYrc=
X-Google-Smtp-Source: ABdhPJz6z5sRDTlQ1hKsRYsW+4fkGnwYQYud5pSpYQifT/bIN6Ck+uymaBUeua+XiPiDuJO5iVKRFg==
X-Received: by 2002:a17:907:9604:: with SMTP id gb4mr4245834ejc.544.1624393324937;
        Tue, 22 Jun 2021 13:22:04 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id o5sm12511281edq.8.2021.06.22.13.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:22:04 -0700 (PDT)
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
Subject: [PATCH v1 2/5] dt-bindings: clock: qcom: rpmcc: Document SM6115,SM4250 compatible
Date:   Tue, 22 Jun 2021 23:21:53 +0300
Message-Id: <20210622202156.546718-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622202156.546718-1-iskren.chernev@gmail.com>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the dt-binding for the RPM Clock Controller on the SM6115 and SM4250
SoC.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt |  2 ++
 include/dt-bindings/clock/qcom,rpmcc.h                 | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 6cf5a7ec2b4c..869d73cb29b8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -25,6 +25,8 @@ Required properties :
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 			"qcom,rpmcc-sdm660", "qcom,rpmcc"
+			"qcom,rpmcc-sm4250", "qcom,rpmcc"
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
2.31.1

