Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE8548C0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 20:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfFQShV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 14:37:21 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35257 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfFQShU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 14:37:20 -0400
Received: by mail-pl1-f196.google.com with SMTP id p1so4458099plo.2;
        Mon, 17 Jun 2019 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=cppmxtv9KfPrFVS95mmdcAGwbghcR3q6HELiPCXGP8Llbz0uz+dI47v2tmK9Qx4gdU
         zqCN4+FGJGDFikhXAypa+pATh/nhdG4MPNcgFrsRrPP7V+1sbT3ir6xcZPQayCXs/hKY
         g8fAkV2RoXJ3xGTd+e9ZUGHF3b6ExdaYW9YBBpiYSBxnzxztxoMJqRoWIIyszlzLTWuv
         eRQMHGBP0slbR44LyHnGbslcvvcYdmlH9p5NyIbFRfB3opNKI5MuOYTWTLMkpxwfRYbV
         LXAuJPxE6yk8Gj+UibeeQqCKxNDQyDif7taRrXJM0PxldzCk+vtdOuzaRI+fU1XE3ciY
         9eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=n7RI/ufTnlnkNxNmNteS7I/lvXvPL1KUeiewjwGTaJRHEpV5c9t0bg298v1GHYb9su
         Ce8JoUqLxASMXhgiZWTmdOLhm0EkSMyB4t1D76AKRoPDdgicjSLLUzYFDrCW3o3sFO3E
         p0qGH9hB5mrX1xUxoDIX8ar64/EJRsEVSmcGFl2pCdKotMcC2UWpuHJxB2zXLYZbHjFB
         T6SDB//UNuOpdvk95LIlvhm/PDWYgOzA3SUKSDv7TuAcJnDAhfmvL++Y1LIUOgIbpnt/
         HFI6EyBBK0ebBs17UAmKjRwbY6GQoYx25Lq2D7CB92d05JvX2tzA8SvviCeEY1jP8rVG
         45dw==
X-Gm-Message-State: APjAAAVD5M/1ENnIAjEJEsaWqQ+b5Xx6++iZk3fCoqHmxAT2wRW9YvvZ
        Vbg+Q+5Ya+GSbJAeYXo5qbk=
X-Google-Smtp-Source: APXvYqyRIRHg6gMGrA70ZHt12EDv2nOd2Sc+DfCdHhHcq35f5zXe8FA2xvVho+l5pWCImt4YiDrGCA==
X-Received: by 2002:a17:902:7b84:: with SMTP id w4mr813896pll.22.1560796640235;
        Mon, 17 Jun 2019 11:37:20 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j14sm12832230pfn.120.2019.06.17.11.37.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 11:37:19 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 1/5] dt-bindings: qcom_spmi: Document PM8005 regulators
Date:   Mon, 17 Jun 2019 11:37:16 -0700
Message-Id: <20190617183716.13501-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
References: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the dt bindings for the PM8005 regulators which are usually used
for VDD of standalone blocks on a SoC like the GPU.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,spmi-regulator.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 406f2e570c50..ba94bc2d407a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -4,6 +4,7 @@ Qualcomm SPMI Regulators
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
+			"qcom,pm8005-regulators"
 			"qcom,pm8841-regulators"
 			"qcom,pm8916-regulators"
 			"qcom,pm8941-regulators"
@@ -120,6 +121,9 @@ The regulator node houses sub-nodes for each regulator within the device. Each
 sub-node is identified using the node's name, with valid values listed for each
 of the PMICs below.
 
+pm8005:
+	s1, s2, s3, s4
+
 pm8841:
 	s1, s2, s3, s4, s5, s6, s7, s8
 
-- 
2.17.1

