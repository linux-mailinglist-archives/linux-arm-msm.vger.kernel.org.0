Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC139279935
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729465AbgIZM4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729263AbgIZM4T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:19 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A914CC0613D7;
        Sat, 26 Sep 2020 05:56:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x23so1935065wmi.3;
        Sat, 26 Sep 2020 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HvvCj9L50q446ASJQ6JemqcTXtlES5Mqm7WP1YDvdM0=;
        b=BvPmQZk6+HCEJPsbi1uyRvJuGpEFZNs9DlWQK5yk0P/mnixC7o75rmTAuNrMoW2kY9
         4GdJN8PSGPL3FSeIvZlMVNcRwCmtNr1c766Oolf5WuhThwsiqvG5i2VArYAMn7+Zid4u
         2Fy/RctgyEX5CP5HhD2kCEi5oq295r0uos+c2v71+k9Bn9fMgFABd/vFKYA+mribGZJ+
         GXxFRMWN0HuRjqSSPiL+H1n4wPreUAsN9IXB9y6C+kNe3BeovmrxdOQfAPGBKm6Ql9Kv
         vG6G/4/+fgJ/PAV8Ok4PRnO9eH4MkuuzAsj5Jo3BFzWKr6Az5y85nDZQNRwF4GWv3HXg
         hTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HvvCj9L50q446ASJQ6JemqcTXtlES5Mqm7WP1YDvdM0=;
        b=G3qDsdbrPnNmoaiAgQa7Ba1NFPbYY0Dw3ddoXbE+W5GN8qRD1uUIV8RuwqKujeY3Js
         RaiTq0V1vc/Twx6HiLukXfBG8s3eoeM8zlHq6jBsK7M3DxfySC4AwazkGh3ueC5XMARj
         MuZnMrKMuK12fPuMMZZKQhVGT0apV3rhXMKNnV1dKEUY4tvNPguiRzY4rgYcJSQ8lV0p
         Ml86Gqx2t0QYLL0sFcou2qR7IuADgeWGUvUvuJ+WG5HZCLb9ovTk2B2H6TWKv8RqRIkC
         +ckHDksXyFn9O+bCPHrcRMAYllE2uiaY4+X3Y+qV/dBAB8MMTa0HoTscaIAs0GED/P76
         keDg==
X-Gm-Message-State: AOAM530zTJ6clrjQsruFuqPR32x/VhsJs8n3obfcPmJQmYSEupG7SSMB
        mgBRs1QLEZKjzWcdl1LCH8c=
X-Google-Smtp-Source: ABdhPJygyB/xfN29OwI0oMJ9mp9qD4itqXeYt+6CgXmhUsW9L+Sjtt9wsiRQdQ6/N0uhMImFtAXIkg==
X-Received: by 2002:a1c:bb88:: with SMTP id l130mr2567043wmf.143.1601124974329;
        Sat, 26 Sep 2020 05:56:14 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] regulator: dt-bindings: Document the PM660/PM660L PMICs entries
Date:   Sat, 26 Sep 2020 14:55:49 +0200
Message-Id: <20200926125549.13191-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PM660 and PM660L combo is found on boards featuring the
SDM630, SDM636, SDM660 (and SDA variants) and it is used to
give power to practically everything, from core to peripherals.

Document the SMD-RPM regulator entries for both.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index c0d7700afee7..8ef3033444b9 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -41,6 +41,11 @@ description:
   l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
   l20, l21, l22, l23, l24, l25, l26, l27, l28, lvs1, lvs2
 
+  For pm660, s1, s2, s3, s4, s5, s6, l1, l2, l3, l5, l6, l7, l8, l9, l10, l22,
+  l12, l13, l14, l15, l16, l17, l18, l19
+
+  For pm660l s1, s2, s3, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, bob
+
   For pma8084, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3,
   l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
   l20, l21, l22, l23, l24, l25, l26, l27, lvs1, lvs2, lvs3, lvs4, 5vs1
@@ -65,6 +70,8 @@ properties:
       - qcom,rpm-pm8950-regulators
       - qcom,rpm-pm8994-regulators
       - qcom,rpm-pm8998-regulators
+      - qcom,rpm-pm660-regulators
+      - qcom,rpm-pm660l-regulators
       - qcom,rpm-pma8084-regulators
       - qcom,rpm-pmi8994-regulators
       - qcom,rpm-pmi8998-regulators
-- 
2.28.0

