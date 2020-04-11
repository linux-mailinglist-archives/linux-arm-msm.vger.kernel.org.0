Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0037A1A534F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 20:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgDKSWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 14:22:10 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37639 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgDKSWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 14:22:09 -0400
Received: by mail-lf1-f65.google.com with SMTP id t11so3586516lfe.4;
        Sat, 11 Apr 2020 11:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z4Hb15o1pOtBSMtLEXqyNxfvtNHew8aR0AYuhLiRqe8=;
        b=J3Q7ccRYcvyVhwP0obAt3tFUP+ObAZfhkqIVGb2pKWMHPIE4O50SqJoS7iNmeFGsZf
         m46wHt4x8XSGglKuBZCtGqUnAe2n2iNrHnEBYCtVG2OkUi7olTynfc4s/bETO7d2pGml
         vW/LFMJL5fXdRyF7cegdYvIzwmSsPQumE49tCL3MNuw3woLRETN9tdsweaDUdfV9VWhq
         Wkl1DDP8GCUWyUtKHBqxYXPP1G6h13HqbxAmFGM4o8S63jAoPPkL4SPE6+RzpFhRScZl
         1BE4sbw7lY88+FC81GBNpR7Wbt6xFeRkmVPENqlIFAo8IKexRJxRsC/QLPAOVVDtwWo3
         +sMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z4Hb15o1pOtBSMtLEXqyNxfvtNHew8aR0AYuhLiRqe8=;
        b=iFEJF4NlD02wFHklWuNzZdq3O2Ia26q5igDbXMXkfSELWbZHDUl4qNXT6B0FcAInTt
         QMmM3/SltY95BSrww5d9BsFOlWiPlLLc4ihB2KtXP4cThwSYAQbhVJTRCh2arupCoe31
         TlajgT59PKgZilopWehOdfkR3ppPkV36BR21LQLLdqngjTUx9Gn7jV3wzYoUXt8Q/hh0
         xbt2+h3VDZoAK1ekBrHVnFyeg3/t82fxUok5gGGIJRsLcuqztAjpIKmb5thqbq3sBOLY
         OmNVEF57Hxwl276BPQ1GRqVMks8v5vX20akOHUrRvnJ2CXbpi5nXLTosEWstI6NxS0ds
         5fhw==
X-Gm-Message-State: AGi0PuZMBAaFaXe3Wwfqlh/q7xWpvHKJIlQ8QNOIiH1EGo6WfR1jdmkz
        92QkT13pFSqVIznl4JHSqPxhooK2lIS+Hw==
X-Google-Smtp-Source: APiQypKgIInJ4YQqesUWfn0MQzYAiHoWMRPGx+e48y0e6wi5iVVP3y79/fXMS5mhL9LaX9buzXYzww==
X-Received: by 2002:a19:9109:: with SMTP id t9mr6006751lfd.10.1586629325522;
        Sat, 11 Apr 2020 11:22:05 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id m23sm312419ljh.36.2020.04.11.11.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 11:22:04 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 2/5] ARM: dts: qcom: msm8974-klte: Remove inherited vreg_boost node
Date:   Sat, 11 Apr 2020 21:21:19 +0300
Message-Id: <20200411182122.2677248-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200411182122.2677248-1-iskren.chernev@gmail.com>
References: <20200411182122.2677248-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

The Samsung klte does not have a vreg_boost node. vreg_boost also
depends on pm8941-gpio which are not present on the klte.

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index b6329f24c502..36ad8ff071ca 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-msm8974pro.dtsi"
-#include "qcom-pm8841.dtsi"
-#include "qcom-pm8941.dtsi"
 #include "qcom-pma8084.dtsi"
 
 / {
@@ -198,6 +196,8 @@ pma8084_l27: l27 {
 			};
 		};
 	};
+
+	/delete-node/ vreg-boost;
 };
 
 &soc {
-- 
2.26.0

