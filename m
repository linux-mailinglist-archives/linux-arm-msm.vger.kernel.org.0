Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D565C5AF8B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiIGABO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiIGABM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:12 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A2180E9C
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:11 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b5so17775327wrr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Dw7d3OsmMzP0h1rzs3YajmqGoRBSQZvUOfPX4YDqiK4=;
        b=GJyJ8fT3740B5L2G5z6lS6GcdExsYqfrs4B/cpbVyj1BNUOMovmwhWxPTMm3SErY35
         bKjcr7/vuop54mU+jMsfWiaCMy8GMtRXmsWy57JAzTNI4XmsCy0n3DFUEXhnckL4DO0h
         s9MfQd9zp9DD9tlP1yRpBxyl0AVaVpLfkhCF2Q37rEPuxa8RCeVZB5FwivFkdVzV/Xrr
         uEyDceBR67+jTodokkNAZEfaUweTnd8+1jY3aDuPMMUfW1k3rMl3vrCpMKRRm+nwrgdX
         YISHu+TmmXlaXtR27u1YWbNof9+oDiRdUv9BEB7Q5adHcrpgHo/ZtXuENESG1QJ2gHR3
         yzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Dw7d3OsmMzP0h1rzs3YajmqGoRBSQZvUOfPX4YDqiK4=;
        b=Sn2Eck7uoLSx/WGWQKFjt4AiwQH3Ydg9TUilURnI5d8LED+IacDYt+/phS6WreITZm
         HmvAYOMgRzI3SEA76+WSqQFyJGEmnOxG4lBRos+Q2WVLTiYpfAxmcVGmfrtosI6SNVos
         V1CBpUicdO2DiPEVCebVga7qXw4WT+7dqQaKwcYsbIbJhKTy8JXuAUkYq4Mgq1dHS/YY
         vgSJFZWygriMMrUf2YCDMeBBVSaAFaTToH8js95xEnsSd6PQdSjeoR0atxCwTuGzqkWg
         7BN8+m/eS5JD2nuZxgj9GFeZfI/PM3s1VsoiykpHwfqr4421U8IfvO+VVkjvuOpNK0fF
         DHQw==
X-Gm-Message-State: ACgBeo2MJLUwOPIu9JbnHzACgw1+DcmC9KGzF0qZwTU8QZY6m0c8Uux+
        5DpmFu1Ft4/ICPdYvyJHVLxvepZbHbQw1A==
X-Google-Smtp-Source: AA6agR56vKIYUJ6qrkDHA4cIk9OYyt/JMZCOG55w2JTGcCK3A0MIA+LJbzmXveJMUtww1ucqXfQd4Q==
X-Received: by 2002:adf:f54c:0:b0:228:d41f:9f86 with SMTP id j12-20020adff54c000000b00228d41f9f86mr415518wrp.699.1662508869847;
        Tue, 06 Sep 2022 17:01:09 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 02/11] ARM: dts: qcom: apq8064: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:00:56 +0100
Message-Id: <20220907000105.786265-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
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

phy-names has been marked deprecated. Remove it from the apq8064 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index ada4c828bf2f4..698764e862716 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1281,7 +1281,6 @@ dsi0: dsi@4700000 {
 						<&dsi0_phy 1>;
 			syscon-sfpb = <&mmss_sfpb>;
 			phys = <&dsi0_phy>;
-			phy-names = "dsi";
 			status = "disabled";
 
 			ports {
-- 
2.37.3

