Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A53C5539DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 20:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352293AbiFUS5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 14:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352339AbiFUS5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 14:57:00 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7F92A242
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 11:56:59 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id i81-20020a1c3b54000000b0039c76434147so9792079wma.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 11:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hHi3QBFwCXmqlLHYHksg4ge5xGm0n6+LjU5yPR19Zx4=;
        b=YdX6j2KdpAmHSOr5jFlVhQ7ewEBzVwmy5aYqwhZ+fO6szxEaoYdChCbO8YT6HxS4/f
         Sdq/k1jfgMJZ/1FlHNR4Jjn65rgBvlERkEM7+jIy0q2fA1Ik8hVpPbfX4paQ3C90LiYJ
         wwCwpx25LQiMWJpphGIfDnjA/9iT7+8B/+gyGIluvboDHbdOktFh97gAG+lHANEpPPnS
         m88rFF40/gw+i0Uferr9xa23hrXr/Ob6yXah6aZ6B9rgnEsLZARt246yWGsUSOq4urRO
         +CHP/PY97nLmeaOBPZvUo3Y416jMcPfe5yGtbrl2SjQBSJ9a2qMWWnHbzk3FBEiW2fsn
         hIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHi3QBFwCXmqlLHYHksg4ge5xGm0n6+LjU5yPR19Zx4=;
        b=76wBaooCWkZPu7PoZ9bwKnSUIHo8RySbjqnvcygjzMC9rlOdk4JxNAngZ0hSd/D1ur
         +WAUmicgNu8yZaij35NE59ll97rjQ6bq68KOk6WY3sMryq3di4WJGlxaqiQ29WJeV6qh
         WAtY42N4R3Sxg8m/jA7cGCW/A/8f0jdIZT3YYh0903160MP7oQW3kB600sgSYPbeiY4w
         MtZ9YHPJSktvEqu1HeHPrPs7kRsY5YoV2IJWo11Wl68GtF2JBjRu+Oaq0s0an8G8PDR5
         eM0sBQHnIB/Mb3lJ3up9cBiv/CXQIVEtsTx018jr7Qmw/7yX2Yxklf/ca05kXuNymw/R
         o1Hg==
X-Gm-Message-State: AJIora/X/tADzcSu+wj8VvAUo5tQ4iAdkk74HncRyaboTAWoW7NL7prs
        OtwLLTC8DNnkxVhdcAbZYNPt0Q==
X-Google-Smtp-Source: AGRyM1t7z3BbNcUImtmsld5hJrT81N3RlicBabJj09Hr0A9JiQAruokI7ukC0NJrr6CetuZI4iPRgA==
X-Received: by 2002:a05:600c:a182:b0:39e:fea2:c5d6 with SMTP id id2-20020a05600ca18200b0039efea2c5d6mr13836064wmb.54.1655837818489;
        Tue, 21 Jun 2022 11:56:58 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f6-20020a1c6a06000000b003a0231af43csm294903wmc.48.2022.06.21.11.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 11:56:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Kumar Gala <galak@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
Date:   Tue, 21 Jun 2022 20:56:49 +0200
Message-Id: <20220621185649.37391-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621185649.37391-1-krzysztof.kozlowski@linaro.org>
References: <20220621185649.37391-1-krzysztof.kozlowski@linaro.org>
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

The qcom,msm-id is an uint32 matrix, so a list of tuples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 7748b745a5df..15467b697e94 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -17,7 +17,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <251 0 252 0>;
+	qcom,msm-id = <251 0>, <252 0>;
 	qcom,pmic-id = <65545 65546 0 0>;
 	qcom,board-id = <12 0>;
 
-- 
2.34.1

