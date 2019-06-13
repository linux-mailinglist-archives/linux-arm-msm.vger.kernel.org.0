Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01503437FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733036AbfFMPCn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:02:43 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37922 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732503AbfFMOYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 10:24:20 -0400
Received: by mail-pl1-f194.google.com with SMTP id f97so8238947plb.5;
        Thu, 13 Jun 2019 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2QCsw+gA+NPdEFQB5c0NGkHe0GOzzrEqSJ0EJ9N8L18=;
        b=D3QZMoPsYPvsX/47bKkx1eBpva5zuYTOjG7cktr2dzHOA8lXZMLFHfcXul0rTb4dg5
         TtgPYAHF2gp+hEJ6oVrzrOM91MEcAq7au368XT7LyVpXSPhq01T9NT0PIViu9i0b32L2
         +9FZme7o++hHb7vcGrXiuRhqDOn2HtgQVGvxG5J8yFH/gbRZwgf/yz7t2Hia5S6dH/Ub
         435r3c5Hw0k28zecggRrU3YxLvM08k/LD+i/8wsvJEkejuG9T+IwSqY5kpRedGyVbwYm
         keI1ZUfIQ9nOXsrVLj46kxxXGQBiMQAx/g/piSWNqk+bCfaUAEiunR44N0fXSYHmoPGI
         z6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2QCsw+gA+NPdEFQB5c0NGkHe0GOzzrEqSJ0EJ9N8L18=;
        b=CcQYySWgpsL2jRleXOCllFmwovcMfWc86QTjv6pzLYxAS5hUSdfPjOJNfoE7Nno8BH
         +PFiHqTSZUTQP68+iRbE6LBxOLawNmsVr7fV02LjKy3J+Q3kEQjTpbBn0hQO/8ZSmKei
         oV66NoTQ8ehdV7iVQ+l8/NUQ++m5HE0BHfuQ6W/Y4pU/Q8FhADxB50u2ZwbpoaEqBzlo
         DWPOMq9tYinXnnz7IbL5XslLBM+Up0BEhvsaj3PxthhhYW0Xux15zuOqMSYX4FCk0wN5
         G9sox6B0hYKh3CtDwz5mGJ/s9v5lrykEnD4kvwWk2rXzBnyEWmfEyqESA1yT+Uot1WNR
         x0RA==
X-Gm-Message-State: APjAAAWDXehKV1xK/N/8yLOouTVD1zeMig6pkBs0DV1f/dtnCGZkinb6
        kEZxIbpZYCXfjng4f1Bphe0=
X-Google-Smtp-Source: APXvYqy/6K4AOIssWys8V4pHrjz3jbHxKQasmGPDBoEtzzOt1fGyshH6PO47xn/XlXrS2nO8bKxZoQ==
X-Received: by 2002:a17:902:324:: with SMTP id 33mr88294660pld.284.1560435860224;
        Thu, 13 Jun 2019 07:24:20 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id s7sm29153pgm.8.2019.06.13.07.24.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:24:19 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 6/7] dt-bindings: qcom_spmi: Document pms405 support
Date:   Thu, 13 Jun 2019 07:24:16 -0700
Message-Id: <20190613142416.8985-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
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
 .../regulator/qcom,spmi-regulator.txt         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index ba94bc2d407a..19cffb239094 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
 			"qcom,pm8941-regulators"
 			"qcom,pm8994-regulators"
 			"qcom,pmi8994-regulators"
+			"qcom,pms405-regulators"
 
 - interrupts:
 	Usage: optional
@@ -111,6 +112,29 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_l1-supply:
+- vdd_l2-supply:
+- vdd_l3-supply:
+- vdd_l4-supply:
+- vdd_l5-supply:
+- vdd_l6-supply:
+- vdd_l7-supply:
+- vdd_l8-supply:
+- vdd_l9-supply:
+- vdd_l10-supply:
+- vdd_l11-supply:
+- vdd_l12-supply:
+- vdd_l13-supply:
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

