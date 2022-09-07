Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3D15AF8BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiIGABW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiIGABU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:20 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4D182F94
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:16 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so45917wmk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LnGlvpDkVc5gAHhgjFOJMbYraXm3oC6coMP+5hCYiTk=;
        b=HyDxXTX9GnazzFrO3Dyw3wlZjj9PbqRlQ/o8cZxccj1uCad2PruXHOrkewnAhHIGG9
         fn0c0BQrZx/lleXCYu0o6zwPEbPwLeSMW22xeitL+ChzISmFWR/BRo3uxIoJID9QzRj9
         3FUqNBQeWJC6HDyO9ym171zrtJ46s0ggLhgFpcAoI7mtgllgmbxXjUA0cGM4RTpzpcFh
         8+KtVaQwAaT6MfI8oWt4pIaFpPVZPOAnHkO4DbcIdkvf4wo6eZbd4Vp6AswcoVM23b/q
         30IUx0/s4PAL5TCLy+nDrGigcHswG1RpbpzO+ZyzwxCtWEVHK7AL6UtVAay0BFF2OFp9
         trsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LnGlvpDkVc5gAHhgjFOJMbYraXm3oC6coMP+5hCYiTk=;
        b=y1OUVsFcBRSZ4qK14oQW51LOxmIE+ekupSqkGc79wIst7uBrakbngcZGHMisuIgN1/
         VZDIbMns1KDRIQdMzeOiAOZLbZzjUrKMBoDAJX2SqlEqrZf20METs9U563Opr/ggAF6L
         0LBwyFVJOL2SqMeF4PKWAy5XmBiJQe6ejOC2k5hmTmbq7xRf6onnI3wWFpVKgQ+jjSml
         mswmyDWZdkQBgVXbDDJ+AfNy92aWuUJjTVP3yYwCkNnSjdZ9+IEdqkHO/fP2KpV93RhD
         g/79ULJVAc2eA39fYIC20lwlGkumBEqEAUtKk4eHm5sCjVe9mfYNT236jEBn1kMlCN04
         wWZA==
X-Gm-Message-State: ACgBeo1bIdvlf85CfCgKk22AtcNEMgTzcVUt4TF1mhRCJzrTmNbBQ9ol
        vAVg6U9SG7uqfDTq5t8HOvVTBg==
X-Google-Smtp-Source: AA6agR48i+SXnyEsufta5mIK4brxNYTBO73qYAllNIJgES89IHSacYsHdedyTcpzRRdAHK3hkjl+Ag==
X-Received: by 2002:a05:600c:2195:b0:3a6:b3c:c100 with SMTP id e21-20020a05600c219500b003a60b3cc100mr425810wme.8.1662508874992;
        Tue, 06 Sep 2022 17:01:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:14 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 07/11] arm64: dts: qcom: sc7280: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:01:01 +0100
Message-Id: <20220907000105.786265-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
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

phy-names has been marked deprecated. Remove it from the sc7280 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 13d7f267b2891..7dc94e84243ab 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3640,7 +3640,6 @@ mdss_dsi: dsi@ae94000 {
 				power-domains = <&rpmhpd SC7280_CX>;
 
 				phys = <&mdss_dsi_phy>;
-				phy-names = "dsi";
 
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.37.3

