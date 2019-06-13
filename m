Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E2444E6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfFMV1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:27:11 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34122 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfFMV1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:27:11 -0400
Received: by mail-pg1-f194.google.com with SMTP id p10so243607pgn.1;
        Thu, 13 Jun 2019 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ypy1jYMMxHq//sxPDAaM1q7oa3FUUDRh/MaSzsTk114=;
        b=mcGAjIHlFdfW2yt/v/AAZic/R1bDW1ylfzZagyCUMP2aLSbjhKSodk2AqosF92dqd9
         rw5kNjh2LeDCizTPQh59zR6qdiyKB4s7UIKWZAlB92unImgZDiUAb35OTQBj5DHgVhZO
         9BkHqtDI03bcRTq7yum19tIwFqwx5Z+LTYK1bTaboox1YiuxUtdl6tUrEhZQ5OfrCegA
         iUkWTAnDI8dkCNYZcmf3iYd9ZIl0IOf/7dx5FykqAUAgJOlNg3OoX3gS8LlSrb+CbIud
         fQrzDhFMaKKwmFSfz5Fp9iaf9UGzW0bjWuHhCw+23WX83dWke0+pQhTCQ0N/eVyHH9TS
         nA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ypy1jYMMxHq//sxPDAaM1q7oa3FUUDRh/MaSzsTk114=;
        b=iiZhQpfmrwv3sO0kHgmGz+rlaR/9MjT8lEfbuwQeZLwEAGsdYyhZe4T3iWz8Cc/zod
         tmQlivRqW3WyD7R9vPVFbR7E5j65IytTb0MsQWyCB+2EXxZHFcDSUd5xoAQURop8gOO2
         ETF8CoyVpASpsGMClWRSVnK4n1bFgkPHbkhJ9waTvMMTi2OlcPJLByUVkF8TAwxQozpN
         /X+fVumfCCJkO77ADR0dcYN0RWsC0RQjvWGnM6HOG/748EQEWsWJMyMzEljNaKT8n+v8
         Yo8n4n92bV0B3aZ6Z6LtumpknI1Aa/1NCSLQKf4ZQ/Sctf1+PUrJMD1+swUz5etn5XSU
         k04A==
X-Gm-Message-State: APjAAAWcVspFQNpfTmaeWV3KQpRyRbqZgbJ1hlLw81vex6b7um2db5tn
        6YT5meo18Cal3gXyRVAHTu8y6a0b
X-Google-Smtp-Source: APXvYqwRrULH5BSR/2MxnRkCAyubQviRNjg5taME3JeNKlzUWulDoxuzDKRtyCuTv9FSzUXmVXCHzg==
X-Received: by 2002:a62:2cc2:: with SMTP id s185mr93611432pfs.106.1560461230821;
        Thu, 13 Jun 2019 14:27:10 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j14sm613798pfn.120.2019.06.13.14.27.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:27:10 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 6/7] dt-bindings: qcom_spmi: Document pms405 support
Date:   Thu, 13 Jun 2019 14:27:06 -0700
Message-Id: <20190613212707.5966-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
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

