Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55F5669138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240573AbjAMIhl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240371AbjAMIhi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:38 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113D7676FC
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bq39so32153659lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCTRKHtFgYaHbPtkSUZRRjr3CHS5tb40ajhOyrJkC74=;
        b=GV2IkpaEE5wINYClQCW8wkutrbrq7NWwCJlD7BoC/PxfOBqE9K2m5bFOMWmTXitF//
         p/iD4pacX1FpdFX0bEAtOI3WSpu96iQe4ksNWSQimCe5UeR4Xs5eW2TpVZXC1ssnESGv
         s91d/ZvAZ5eusLcE8pONCRsVFcL2Tqu8rbjogSjDMEQFHEdp/k+DwYP91J4TjTWhtPha
         1u8+GZQyyP3e/UjaVZesHzlPOzcYCMfU8KNg2pDw/kSGrKsAnCCeZArFEy+gHtm1bUCg
         C26pXI6ZR/JfA5rgcSugaRu7prscELZONXVOVIfoaEyyakwdZywQIblvKErCjkduUhQE
         GuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCTRKHtFgYaHbPtkSUZRRjr3CHS5tb40ajhOyrJkC74=;
        b=lYuzuxhW60+468ZpKdHzsV4QJ81N0f4lXLft85nAZXsm6nrjSKOCwys9LqxNMQabX6
         WIRMVuo0rlFBGNw6HXkBIDzPrI+m/hnAk6K+RD+a6iVOZAtpE0c5tbc4tw1t1Q5JAMGe
         BvfGIpMV55ouAaZnbjhqq5DsmomucqHkLJ3zuKkeamGCgy0OmefK/r7q8r77cp2tH+GS
         GHQ20V8fn0WCNhjLzwqSYMZU2Mz2gzZehZ4iXK8TFBKrIyhINi6Lj9nUdqN8YBYqfU3Y
         cPVz9gZTa+nYCDj6qK7RLlOBs8BlEq/uHAxUEHYxaox7tPTL8NkZLEMjZdN4vn8HakWd
         GzJg==
X-Gm-Message-State: AFqh2kodQcVZPzrtGujeFMIEWMQXecWNfjYxclrNnfa2LUsM3E35Kqjz
        aeSaetqLrph9XqopTMW1hCNxCw==
X-Google-Smtp-Source: AMrXdXtGgF+DSrc/gjCX9/C/GYXrvH5S+P5vQLT16mtsr95X7PYDpdyjhraUcHtMLXiAl6j2Jj7rAw==
X-Received: by 2002:a05:6512:3f1e:b0:4c0:91d0:e7ab with SMTP id y30-20020a0565123f1e00b004c091d0e7abmr25889004lfa.28.1673599056463;
        Fri, 13 Jan 2023 00:37:36 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 09/11] ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
Date:   Fri, 13 Jan 2023 10:37:18 +0200
Message-Id: <20230113083720.39224-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the schema change and rename mdss node to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 1d8b8870b990..2e46a8b6bb14 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1554,7 +1554,7 @@ mmcc: clock-controller@fd8c0000 {
 				      "edp_vco_div";
 		};
 
-		mdss: mdss@fd900000 {
+		mdss: display-subsystem@fd900000 {
 			compatible = "qcom,mdss";
 			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.39.0

