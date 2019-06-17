Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC2EA48C27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 20:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfFQSiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 14:38:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37767 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfFQSiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 14:38:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id 19so6152831pfa.4;
        Mon, 17 Jun 2019 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ypy1jYMMxHq//sxPDAaM1q7oa3FUUDRh/MaSzsTk114=;
        b=qC2QDWKhELhh0AsGIxnHawjI73Ycq5E6RSIesESuhIL0ozLxErKto9rlbqwV6K7yC2
         9ou+jgPL6YJjCjCCw8C9K6rgRPHHrX/4rykDHM5uxT4Mgbk7CVjrXQX3hIIoWWQIx3Wr
         EKTdfzPBQMl90lMoWo/4NsBfHkgzh44iqgNNGSAEMg4ybRIqszoUAPfpQlpTGNimcx5i
         AIg89PYZ2kCkXTosmYZnx8PC3N4BDdo4aAI/9qHLD0BZQFI+b5mcsdCOZ5KomZFTrYBY
         i3EI9yAAy6rjjyJZC//KuuJmFzUjQrfkO9IimnT4ihqSDoO4pkh2IQEDPDyy3EIWFckG
         2mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ypy1jYMMxHq//sxPDAaM1q7oa3FUUDRh/MaSzsTk114=;
        b=CL34fySvkq73ujPgbrT1/SnImz8J1U8VFTojptq6ACkYQ7vCPp8BUd01RNsGCmuHYg
         qi4N0BKABiLLNqIW2tDfX2ZOD1WQ6Nc1BggOGIs1PNwXwyInUA+CxHje1bIaUBXQhAnr
         JGj+5Tbqc6B3tgwvMqfKIWdH9pqT5qq0+BEX1phCZ+odph9ZbjBM/kxY3NGtq5sayl/e
         xVEbk1MX5zcBFllGigvw9+q8/1RSir5KMo4IEO7+PIVCYdX0mLQrlffXeE6YHMat7/tu
         J6G+inYr2ciml7JP4RLEBBrjNzAj6wkvL0cdZoFtxQaKfVcJlUR5+GaSvOmXo9BUUeT4
         d74w==
X-Gm-Message-State: APjAAAW9ykWv3ByB1ObA5A87jg8Dm6QPS/1PgO+dh3SJ1f4CiK2DnEDj
        m3Zs97MZa72M1K/KDKcPZ6M=
X-Google-Smtp-Source: APXvYqwmjm9XTI8o8K+v8RQpMdVWRNBeF0RTGANIJAhdHeXtpf8iR4ZoczjRKhs1tKxJitDimAfYZA==
X-Received: by 2002:a62:e710:: with SMTP id s16mr82057504pfh.183.1560796699385;
        Mon, 17 Jun 2019 11:38:19 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x7sm11759028pfa.125.2019.06.17.11.38.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 11:38:18 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 4/5] dt-bindings: qcom_spmi: Document pms405 support
Date:   Mon, 17 Jun 2019 11:38:15 -0700
Message-Id: <20190617183815.13659-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
References: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>

The PMS405 supports 5 SMPS and 13 LDO regulators.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../bindings/regulator/qcom,spmi-regulator.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index ba94bc2d407a..430b8622bda1 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
 			"qcom,pm8941-regulators"
 			"qcom,pm8994-regulators"
 			"qcom,pmi8994-regulators"
+			"qcom,pms405-regulators"
 
 - interrupts:
 	Usage: optional
@@ -111,6 +112,23 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- vdd_l1_l2-supply:
+- vdd_l3_l8-supply:
+- vdd_l4-supply:
+- vdd_l5_l6-supply:
+- vdd_l10_l11_l12_l13-supply:
+- vdd_l7-supply:
+- vdd_l9-supply:
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply
+	Usage: optional (pms405 only)
+	Value type: <phandle>
+	Definition: Reference to regulator supplying the input pin, as
+		    described in the data sheet.
+
 - qcom,saw-reg:
 	Usage: optional
 	Value type: <phandle>
-- 
2.17.1

