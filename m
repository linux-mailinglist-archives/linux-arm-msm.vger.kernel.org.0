Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A776D3485
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjDAWIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjDAWIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2A9113F4
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b6so6591018ljr.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AggToq1LerLWW8VVOtxwYKPnVhm1iAj3sd5znRZbW7E=;
        b=b3TISBuujfIMLfND7fbsWNW3TLzKR+YacZ6TIAbqjKcaa9vbFl+Lo41HZKzBzFv9Q3
         JWnOor3VFJqrGoQiwjhUrLkC2pnCfKV3bhuD5QjX1ACrX2ls2NBGkW42WOZi6H0kI8Ol
         T/h/NnzLHnPszfzTnbi90Sa2yAx9hP6UoXPFZR5iysNkgaOjfo86IzBWvAk1XyMJw52r
         XSuJmeM+ZsfVxAbHM2ObZd6f5sozQh/TZLI0RCRmtrWPkUIFdHJvODe3CmFGhzuHtnuq
         VT232aQkNtJBsvaPg7OjFmpyn9m741+ArVLddbOOD/bb7rFyOIwq1TNmsJhhUJ99hkbI
         5ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AggToq1LerLWW8VVOtxwYKPnVhm1iAj3sd5znRZbW7E=;
        b=JdEkELqw5+s0TSAHXAq0bpnITk+b3z3jmJ8LugPOir1JEPWV0oTVgUEb2Irz6BPvar
         C1kEnr3yNLkH/WTydxBGRlFAuYTQYSfOefQYB73zZ5d3OcQQ90D5ZssQEvbSKzDQsn2M
         4yCZHl0JkOLSKtrluOFJ5L9NglFVBMdr7hKFhWePBKdtL28MRji2RX2+iDabMsVnm78E
         A22y1NM/kBmfLSFfNyoxr7w59TiitQLWX5XuUNm0mow8ubmo7WTfHiKzLgufB6uDurNn
         Y7vh5o3j9xjjfoW0YsuXfsZaOwjrGq67mQY9V31JcQ5/gVMXS8H+W1VnJlhdwgbrWsUn
         Z2sw==
X-Gm-Message-State: AAQBX9dQNaVGUIhhplFjXuABCVhabOp/QFTi0eu/Ic+PvaLsMbSDQ42o
        mOmcoug3ptbxHH8/Z9V38jOukQ==
X-Google-Smtp-Source: AKy350aiQGt1kwAWWmJxnSdDFlBt+Wu2X9kjyZezW2VbG9k6HLGbnlhvPf7VznQkv4uihVW8Nqz33w==
X-Received: by 2002:a2e:988a:0:b0:29b:d235:2c50 with SMTP id b10-20020a2e988a000000b0029bd2352c50mr9219932ljj.25.1680386892586;
        Sat, 01 Apr 2023 15:08:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 02/22] arm64: dts: qcom: pm8350b: fix thermal zone node name
Date:   Sun,  2 Apr 2023 01:07:50 +0300
Message-Id: <20230401220810.3563708-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the thermal zone node name to remove the clash with
pm8350c.dtsi. Remove unused labels.

Fixes: 5c1399299d9d ("arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350b.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350b.dtsi b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
index f1c7bd9d079c..95e971b80ccc 100644
--- a/arch/arm64/boot/dts/qcom/pm8350b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
@@ -8,19 +8,19 @@
 
 / {
 	thermal-zones {
-		pm8350b_thermal: pm8350c-thermal {
+		pm8350b-thermal {
 			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&pm8350b_temp_alarm>;
 
 			trips {
-				pm8350b_trip0: trip0 {
+				trip0 {
 					temperature = <95000>;
 					hysteresis = <0>;
 					type = "passive";
 				};
 
-				pm8350b_crit: pm8350c-crit {
+				crit {
 					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
-- 
2.30.2

