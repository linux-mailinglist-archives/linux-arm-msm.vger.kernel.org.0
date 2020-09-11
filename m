Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB843266351
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgIKQNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgIKPfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:35:46 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFB4C061796
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:34 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id j3so5395636qvi.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cznD9PtbdCnTuIZHnsXFM10RQkLCsdUaXijp1Kw5QfM=;
        b=P9QknNE1aAuC4kFJNTMIPm4V9anpO9ur7O97Qs7oKMmkt40+bLIuzPQjN0Zl5vOGz+
         X+6xr2KY/T8e2o/ozewC6LMosMmgvAuv08GCSijoV73LImGOoAvXeIQTJuBskZYol3Sr
         ujgrWNveABiqQP5jWWXxi3/KJFBN86AGXyIKnDIt3kcZ4aVraHsPZDDxKwQNGVslZMZv
         zBDqqSyQon4hZHF5vDipGydaBniv8+LY7sn/W/kyR6Q5/gWt879m8bbXiTJ5gjw90vp0
         kuHaTx15m4uYUYu/a3VJhuVAapjZTJ9ld3u3TanELyNr7jBamha4IEY88w425OCV/klN
         HG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cznD9PtbdCnTuIZHnsXFM10RQkLCsdUaXijp1Kw5QfM=;
        b=umg2+U4RwdY1vp8EK/1np/N9OjjT9596XBtU4noCx6cMjlxcE3BkjZmwFQDNWJqQsZ
         JnLdFcwXg95jKNybFOdfh9FYFjWMaQ45sntAo+w+pVB31BryEPTlomc3T9QwOdBK1cSx
         /19T3DKykNRJhhL//GdKZSfWjC8imKQyDxHwyunHU1M1BS9mbtyg8bxcr+hKs8MTv+C7
         ti95Otc9dy2gPQ469OVMggTgrGwtD0V/UqUCj6PHIsWgKddjqbZg43TM9uOfEa3BwcJ4
         8UB0LqUEIGEjQD1j5/ZrmPADsBQ+YtIWH6xNacPY48icVTjRKAuZ9va04HaFasCrux4L
         nF4g==
X-Gm-Message-State: AOAM531NXygC78Ge8UZufY72rzJRQvQZngXU1VtyMQBlk+d9LqZhBCXQ
        XwExBck76t9GjxfnYSPYTlrw7EJ0Gh4B4ozNtno=
X-Google-Smtp-Source: ABdhPJxTYCLs2sh7OCgELR9nztjiEkUmHMHQI/9SBfkIRMDRwjvcrCIR6EZfChEKTL46j879jOzCLA==
X-Received: by 2002:a0c:f1c5:: with SMTP id u5mr2488860qvl.10.1599838533324;
        Fri, 11 Sep 2020 08:35:33 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v16sm3001744qkg.37.2020.09.11.08.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:35:32 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/7] dt-bindings: clock: sdm845-dispcc: same name for dp_phy clocks as sc7180
Date:   Fri, 11 Sep 2020 11:34:01 -0400
Message-Id: <20200911153412.21672-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911153412.21672-1-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes it easier to combine dt bindings for sdm845/sc7180 dispcc.

Note: nothing upstream provides these clocks and the sdm845 dispcc driver
hasn't switched to using .fw_name for these clocks (these properties are
ignored), so changing this shouldn't be a problem.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../devicetree/bindings/clock/qcom,sdm845-dispcc.yaml     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
index 4a3be733d042..ead44705333b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
@@ -43,8 +43,8 @@ properties:
       - const: dsi0_phy_pll_out_dsiclk
       - const: dsi1_phy_pll_out_byteclk
       - const: dsi1_phy_pll_out_dsiclk
-      - const: dp_link_clk_divsel_ten
-      - const: dp_vco_divided_clk_src_mux
+      - const: dp_phy_pll_link_clk
+      - const: dp_phy_pll_vco_div_clk
 
   '#clock-cells':
     const: 1
@@ -92,8 +92,8 @@ examples:
                     "dsi0_phy_pll_out_dsiclk",
                     "dsi1_phy_pll_out_byteclk",
                     "dsi1_phy_pll_out_dsiclk",
-                    "dp_link_clk_divsel_ten",
-                    "dp_vco_divided_clk_src_mux";
+                    "dp_phy_pll_link_clk",
+                    "dp_phy_pll_vco_div_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.26.1

