Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1F0456CDDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiGJIll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiGJIlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A4F18B32
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id o7so4219644lfq.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0RS04L3t2B9fDxy6bqcgfJbhi5mc1B07nUo3XEHnZLI=;
        b=eT0dBRFTsi6+MKJcfryHjQtRpNGIuEQUaOdgTzTP4lSTRfBNsed2GY+0l7K92llRQT
         t70V5Dt8wZI2B4I+yjnOy+HMoHYAp60aySfT49Z3rx4JqutUW2xx3PsIw2hvAvgn5b/L
         sKrsEmc5tFoXgbHdsupyVJuxcdjJi8nuYqGeZ04rsOqMi+xoqqn9E9XrrC0Alq4O6l0L
         /ve16DHUDmC5TTDH8tyWRseIFO0wwH6nWF2bhoQ5v3vqXpLOEYqoovMGEEvmqJbx7sP7
         teQu1ZeiEtprQfnEgyLuvDoZN1BhvA9CDcuQX95OMynxlCE24DXk5uucv/p9bDefTwRh
         4Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0RS04L3t2B9fDxy6bqcgfJbhi5mc1B07nUo3XEHnZLI=;
        b=oyPNboLlHB6oW4usv1g3zSxhOeynpXf2ZsgeI4z7N8bmqpcWkikTXswTUsxfjARnZ2
         X4CgqpqoisewrzPqEViR5r85XtaXm2VDOVxeI5v2UaOLqAB+KXe8A9ey8XZSgk9SNaYb
         u2q0Kgy6ChjBIyUK6tIRMfCqopx1hYSM4bZKZ0jbQ9v3ix9eFLB5PU/YCFOLqmiLu5X9
         b8hwEgCSYSF0oUkcnkomOFybX4Kn+xyOqkBM+Errwee5L1imXXeFx5/Ht6oLgLvv9JUN
         aYaB78lTe4KM0XyrZ2iV8vs/oV00J+6YMrvAjXT67ba0I536iZO8Op1qmHp295QwNRkb
         YupA==
X-Gm-Message-State: AJIora/mXAqvFJkqeRdzDpp1rlAXw4DvCXIlRY0iGch9sQfAB3P7Y3J5
        N2kLlrqIv38e96Y74DfGcnsdBg==
X-Google-Smtp-Source: AGRyM1t+2cUnkeU4pfWfOR5f6jc/0AReGSLWhak70YmTyaCnmL/bCnDil/M3r1cKsxc4M8oiMsuvNA==
X-Received: by 2002:a05:6512:3995:b0:489:d974:33d3 with SMTP id j21-20020a056512399500b00489d97433d3mr1302885lfu.458.1657442496336;
        Sun, 10 Jul 2022 01:41:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v2 1/9] arm64: dts: qcom: sc7180: split register block for DP controller
Date:   Sun, 10 Jul 2022 11:41:25 +0300
Message-Id: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the schema for the DP controller and declare 5 register regions
instead of using a single region for all the registers. Note, this
extends the dts by adding p1 region to the DP node (to be used for DP
MST).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 47ce5787ed5b..875808cf0614 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3080,7 +3080,11 @@ mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7180-dp";
 				status = "disabled";
 
-				reg = <0 0x0ae90000 0 0x1400>;
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0xc00>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
2.35.1

