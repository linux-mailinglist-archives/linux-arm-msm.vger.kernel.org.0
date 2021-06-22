Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09F23B0E9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhFVUY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhFVUY2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:24:28 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2746C061574;
        Tue, 22 Jun 2021 13:22:10 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id nb6so314968ejc.10;
        Tue, 22 Jun 2021 13:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VuuSBrrrUS6vEUb5aiWQjgUkr/0W3rNcMRo9TCf4yVY=;
        b=GAwAIHYGHtYdX5EBkXtvEv3mZ0PZFCE9QjBp3l0uGIlW6ETbVBgaInAgYRiVJyGGS6
         iyOn6JqttW9cOhaIsj/SpokiWS7kH49VvdsCHGpEweWgnJvAj3JXEGxzlkM9exZC7fbH
         40oVy7UW17O8IN27ZluBdDb+VNqFKBv+z8p02uW5RAdTQ3vlT/Y7PGj7ZpDzHYDUhn+S
         RHJwpy8KOGoS1qfi0f1TkztV2H10bqT4dW6IRR9RsDrnRkPJfqnzKuWQlYqfWrNqVQ1w
         CoCfQQJpAf+5ZanWvEsdQWe+pwzS+b0G+n8tqnh20GgXbPa4DMvcXRwqddGFNyTraIdd
         +EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VuuSBrrrUS6vEUb5aiWQjgUkr/0W3rNcMRo9TCf4yVY=;
        b=KyUpq2ZFIAlj0tZAaN1/0Z6N95ggCRYqCg45VnjEOeHx3osORfXS0RZ4c2Sckwiwti
         OCvyn5+fLtOSGpbYuxref02wsA32Ig/GULJWu0+2dYWDsISHgtru8OZRxfmuf82gE9Qp
         jY0ciwL0xKRlmgw4OTEOav0W0SKuAqIChVuDCHimzKHSYQkrf8M/dKUI2pZtLYkaY3fh
         E/mSwIzQ9K0o46DoaG2pbI/79yvNc4Q74fX5XLCS9FsxhKaYEsssZ9Pn4XYRNylJDJqJ
         Mlyml7JlnoWh4exCvYbmgnpuwskivIA1ziGIeaYItbas2PoCMlx+CgTl4vHGzcvFC1kq
         N2lw==
X-Gm-Message-State: AOAM530b19fJEfYFW8DTrT6NwNflnH8k+uDOBv5o9kU+skZqzGnIYGx7
        oCX9uiu0g0QHPZEBCnq8mHc=
X-Google-Smtp-Source: ABdhPJzJwoVMoPcOTWHHqYeBrdk36mNZvgwoyprDkbaploSg0rgKcQ+VkKb78hUFJ7NEzAkFYrEczQ==
X-Received: by 2002:a17:907:a8f:: with SMTP id by15mr5950656ejc.357.1624393329522;
        Tue, 22 Jun 2021 13:22:09 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id p13sm12704354edh.79.2021.06.22.13.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:22:09 -0700 (PDT)
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
Subject: [PATCH v1 4/5] dt-bindings: power: rpmpd: Add SM4250,SM6115 to rpmpd binding
Date:   Tue, 22 Jun 2021 23:21:55 +0300
Message-Id: <20210622202156.546718-5-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622202156.546718-1-iskren.chernev@gmail.com>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible and constants for the power domains exposed by the RPM
in the Qualcomm SM4250 and SM6115 platforms.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  2 ++
 include/dt-bindings/power/qcom-rpmpd.h        | 20 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 4807b560f00d..4deffbbf54d0 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -30,6 +30,8 @@ properties:
       - qcom,sc8180x-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
+      - qcom,sm4250-rpmpd
+      - qcom,sm6115-rpmpd
       - qcom,sm8150-rpmhpd
       - qcom,sm8250-rpmhpd
       - qcom,sm8350-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 8b5708bb9671..5917fb7e7b7b 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -192,6 +192,26 @@
 #define SDM660_SSCMX		8
 #define SDM660_SSCMX_VFL	9
 
+/* SM4250 Power Domains */
+#define SM4250_VDDCX		0
+#define SM4250_VDDCX_AO		1
+#define SM4250_VDDCX_VFL	2
+#define SM4250_VDDMX		3
+#define SM4250_VDDMX_AO		4
+#define SM4250_VDDMX_VFL	5
+#define SM4250_VDD_LPI_CX	6
+#define SM4250_VDD_LPI_MX	7
+
+/* SM6115 Power Domains */
+#define SM6115_VDDCX		0
+#define SM6115_VDDCX_AO		1
+#define SM6115_VDDCX_VFL	2
+#define SM6115_VDDMX		3
+#define SM6115_VDDMX_AO		4
+#define SM6115_VDDMX_VFL	5
+#define SM6115_VDD_LPI_CX	6
+#define SM6115_VDD_LPI_MX	7
+
 /* RPM SMD Power Domain performance levels */
 #define RPM_SMD_LEVEL_RETENTION       16
 #define RPM_SMD_LEVEL_RETENTION_PLUS  32
-- 
2.31.1

