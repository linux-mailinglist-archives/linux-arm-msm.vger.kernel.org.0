Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF1027E10D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 08:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgI3G0q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 02:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgI3G0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 02:26:46 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D25C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 23:26:46 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id md22so439351pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 23:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5Z9iD5dbjUlbuGrYIcWwsmUnfsJn43RhdMJSmu8N4W0=;
        b=UiFRtbu3eLT7FS5Hy7ERPceMg5/UTDo2+19HFhdidUKEItEXkBniPFFBR7tvWT6avC
         drfjqSVPD1pDg/0pSyD5ifxdMxr+9/33Z3Fyg3QU6Wj62EfkNx0Lmzxag12EhW7NK990
         V0+0e9z+GqgcsFZj1+fonoCGeLUlDou63hthch91R8pmxvuy68VsJCniUkLsJrBJ4Sko
         VYFuQ4dOU8ExVX5rTRHgYNBFSk7ksAFohhsZ1DWcRdjsyLN0EJZMf1BFerVWA1Ji66Uh
         0S9fAtD+1VE9CSiXawEi8839+UYdKs/nVa1j3RFjmNLvXBetf9M8smyj4YnrDivqbyVA
         Jh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5Z9iD5dbjUlbuGrYIcWwsmUnfsJn43RhdMJSmu8N4W0=;
        b=jLbPbAu4kOivTjH7ep9moLSJhHz7fPOCpql7i8wpln2N5FBZVVSS8y+1duE3w5Gt9t
         knfG7GRIFKrRyyDqzjEfs46s1+g6XmJpwl4Y+pra3Z4KacrS8JjM+lbRw30fMbz4rR5G
         c61IHqVlFf6Ijr0hepabTHfiX1pgAiJm75Tz+5plzWoTuLKLm0OLVBNYcTHujSyGw/Fv
         eTEc32XRojS96ig3Ndt/M4+64Eejslk+2rO+l8CJ/dwhMrJKMYFe/K9aHO0Ok4DKWXMx
         XN9zYL4mD8RTUzRyRJptPegabJPfIz8oQR/eorGzKKgA2+sM/TXpGXbAQ4qBowv+MvmA
         +4Pg==
X-Gm-Message-State: AOAM533cLWg2+116JCA0HT91P+dLcNGwaAkYWg62F66Zm+Dh0SRAHcjL
        y833YcGFQTby/TbDvd1//VWBAA==
X-Google-Smtp-Source: ABdhPJwLOIRB0uYUWFychq/TdPRKyIeOqOuAHqynnk+lG197pAQSDO9uxpwRsVeHjQLNNJSFXiiVXA==
X-Received: by 2002:a17:902:ed53:b029:d2:8046:f57c with SMTP id y19-20020a170902ed53b02900d28046f57cmr1320188plb.55.1601447205668;
        Tue, 29 Sep 2020 23:26:45 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id t5sm772462pgs.74.2020.09.29.23.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 23:26:45 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     nks@flawful.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     shawn.guo@linaro.org, Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 2/3] dt-bindings: power: avs: CPR: Add corner adjust properties
Date:   Wed, 30 Sep 2020 14:26:02 +0800
Message-Id: <20200930062603.29009-3-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930062603.29009-1-jun.nie@linaro.org>
References: <20200930062603.29009-1-jun.nie@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add corner adjust properties for both corner and virtual corner.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../bindings/power/avs/qcom,cpr.txt           | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
index ab0d5ebbad4e..4f4108730dc3 100644
--- a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
+++ b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
@@ -10,7 +10,9 @@ and meet silicon characteristic requirements.
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: should be "qcom,qcs404-cpr", "qcom,cpr" for qcs404
+	  enum:
+             - qcom,qcs404-cpr
+             - qcom,msm8939-cpr
 
 - reg:
 	Usage: required
@@ -70,6 +72,40 @@ and meet silicon characteristic requirements.
 		    "cpr_quotient2", "cpr_quotient3", "cpr_ring_osc1",
 		    "cpr_ring_osc2", "cpr_ring_osc3", "cpr_fuse_revision"
 		    for qcs404.
+		    should be: "cpr_speedbin" "cpr_init_voltage1",
+		    "cpr_init_voltage2", "cpr_init_voltage3", "cpr_quotient1",
+		    "cpr_quotient2", "cpr_quotient3", "cpr_ring_osc1",
+		    "cpr_ring_osc2", "cpr_ring_osc3", "cpr_fuse_revision"
+		    "cpr_fuse_revision_high", "cpr_pvs_version" and
+		    "cpr_pvs_version_high" for msm8939.
+
+
+- fuse-version-map:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: fuse map table to search for entry index that for below
+		properties lookup table. Based on SoC's speedbin, pvs_version
+		and cpr revision.
+
+- init-voltage-adjustment:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: Adjustment to initial voltage that read from fuse.
+
+- quotient-adjustment:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: Adjustment to quotient that read from fuse.
+
+ - virtual-corner-quotient-adjustment:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: Adjustment to virtual corners' quotient.
+
+ - voltage-floor-override:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: Value to override virtual corners' floor voltage.
 
 Example:
 
-- 
2.17.1

