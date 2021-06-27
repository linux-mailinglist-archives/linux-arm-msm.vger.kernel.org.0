Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07573B54F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhF0TCH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhF0TCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:02:05 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DFAC061787;
        Sun, 27 Jun 2021 11:59:40 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m18so17886881wrv.2;
        Sun, 27 Jun 2021 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6JYXbVuCIOutPpaNLYL0e3H2M/HftG19CnHo95qjg8=;
        b=lTZtwT0fVcaj8NYQv/0KtdOYI9fSnm2LzrEyvxqq3NxW51OX//VOxXk8WmY6jFqKbn
         jmzqYEzUOOmDKa29S9mlTojORGhw1v/jjNv8Av6k9/NvYF9HnW+QW1WZyfNs1IHa4oXp
         am48yMBlzDfxPw9aQ04Lv7l6JSfVfEjeM3MxCNx4Ta4jyn8OhzB3KCeDHc35pvjRfv0x
         lPs/4P92A+NrnF2rhhb1gaFEaY7neIayXDl+GgQNBtoPx7VGnAk0i5o5dXq7rLTNYWph
         /mhu0NO1ELGCLyulDzLRcHiDVBNtTED2fja0E3hL7AhwhFWXtSbbkurDlfRKeZViC0CQ
         M0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6JYXbVuCIOutPpaNLYL0e3H2M/HftG19CnHo95qjg8=;
        b=fBgVduk1yb0Fm0KkN2le46rcwNfO47eHgzLGusSzyGrm/rV8CXkZaQxAhQvSLUiC+j
         frSVo8Nu0dIBTLr+oFO8c/NvTXVZ7lof2sDLepQy82zGh6uxdMxt9Ei7ebY2HozSXqQh
         yRz1ExyK6rj5wNbl1Tubb7oTJkDDRuGdPrNhT34l/9O7krGE7qu7UEyF2Pdy5nLt9JMN
         EK0OaWlQRilLqzAZsLVGy33kDcRkyzJO68Mv+EZAH7zLjTo+wFj4RI8sLSGA7V4sVjgI
         tq5+nJf0Jm2Q+fjNAnnXUk2icT+7oqcYZqhmYHTF8LAgJ7Paymkyhz0IEJzIOqcIpJJB
         xxOw==
X-Gm-Message-State: AOAM53265dptwjk8IuJTPAAn9DPGiG5AuV4oFev31MZkShsed/NQ4Hog
        fc+u6tLjxOadgpq/wt+LPlU=
X-Google-Smtp-Source: ABdhPJwCJk3evkjv67TSD8Wz/FGSA8Ar72+PXrEdkR1rsL5mWQHK2QW4tPc/WiwS56lj/tiqUG+6cw==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr22698421wrq.184.1624820378676;
        Sun, 27 Jun 2021 11:59:38 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id g7sm8759855wmq.27.2021.06.27.11.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:59:38 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: power: rpmpd: Add SM6115 to rpmpd binding
Date:   Sun, 27 Jun 2021 21:59:26 +0300
Message-Id: <20210627185927.695411-5-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185927.695411-1-iskren.chernev@gmail.com>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible and constants for the power domains exposed by the RPM
in the Qualcomm SM4250/6115 platforms.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
 include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 4807b560f00d..239f37881cae 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sc8180x-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
+      - qcom,sm6115-rpmpd
       - qcom,sm8150-rpmhpd
       - qcom,sm8250-rpmhpd
       - qcom,sm8350-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 8b5708bb9671..4533dbbf9937 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -192,6 +192,16 @@
 #define SDM660_SSCMX		8
 #define SDM660_SSCMX_VFL	9
 
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
2.32.0

