Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54CEA4FB03D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 22:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242322AbiDJUxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 16:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235275AbiDJUxn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 16:53:43 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AECE55237
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:51:32 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h11so17861149ljb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7JvZ4hBKAGCEsqD/L8bcJY0jmn853mSTZ8aHf9c2cG0=;
        b=Hfc6vxkB3Pu/unKGRbcA0ci1U7Uy99XJrr7E9Ky31Y1amtW3mfK8S1IbtoFnvmQZ6Z
         pwPYtF1DagHfZZ+4I9H7QHGJ718ERyXhyjby3OC6kxrJT6/qQPPJH5Dqtg0AisUyeJaM
         M3Er21eooUMFAbkrUSE8qVsq3NWyf3/iK1waZ2t36l4qXdINfSjZ94eZEBz0/H3wqW/r
         sfMz3xirS+uOmMrX2aH65TqJ5mlKQru3YdKN68uA//f3taGD1DUde3JH0Wd1RDR2dtcX
         oXxbmHAt/Pd3CSusmnLaO1dRU862WysA6rbbUlJuQaIuuXhrINAjBZCaol7BMbQsq39g
         LC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7JvZ4hBKAGCEsqD/L8bcJY0jmn853mSTZ8aHf9c2cG0=;
        b=PDRO/4HFJH32sdtGUCox03rtAtjt5fsilkItJG2myNhF/KuUkBUQMbsrFSuzbbizrO
         ywWeZo/oCIafad2Ut23UZEzVpG/FgZtqMUjvYuWnGV1RI7prne1oJiRWv4dKRUPT4UlY
         iB+XCoYgTLvbevgZpY3p9f1G/2nWBAvWYoEBtulKMG8OK2L4oiqVrY5/UGE0F1w2tdLd
         DDq5rYFKf8RLBMyYkILk1Ir4Y6oawOGr5VbAKGiwLF9s0kLriV3FTpRjGp5MS/sTTB7T
         hPNoMIninztOodNLbR+QcA7fIOvQwcidYsWFwEjnvFQLav2r39fWeW+usEV4YZxJhWqP
         7/5w==
X-Gm-Message-State: AOAM531oEY1gOQLyGlZ1hWuvrKv2RRdgkYhXzECEqDP+I/qwR9E1rg3x
        pbFbvY8XHrThRho9N+9VC72Egw==
X-Google-Smtp-Source: ABdhPJyuKNJ8KiL4bbYEd/uJJ6SFMUPqP7StWHZvvQWj8AWLheTL5EiA1HomkC3tMahU9x0Bnjzdyg==
X-Received: by 2002:a2e:8904:0:b0:24b:63b9:4435 with SMTP id d4-20020a2e8904000000b0024b63b94435mr1080677lji.87.1649623890282;
        Sun, 10 Apr 2022 13:51:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15-20020a19910f000000b0046ba6b39d14sm85244lfd.10.2022.04.10.13.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:51:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8450-hdk: add missing PMIC includes
Date:   Sun, 10 Apr 2022 23:51:27 +0300
Message-Id: <20220410205127.1670705-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410205127.1670705-1-dmitry.baryshkov@linaro.org>
References: <20220410205127.1670705-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add includes for PMICs used on the SM8450-HDK. This makes GPIO blocks
and thermal sensors available to the user of the platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index f0fcb1428449..e4b34ba22003 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -7,6 +7,12 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8450.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350b.dtsi"
+#include "pm8350c.dtsi"
+#include "pm8450.dtsi"
+#include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8450 HDK";
-- 
2.35.1

