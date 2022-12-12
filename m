Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57F164A4E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 17:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbiLLQgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 11:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbiLLQgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 11:36:13 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB9C13F97
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:52 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id z26so299931lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMYpvtSfwDxCzfIHZhIbSDEbFJT+TaF8mIcLpnMfQgc=;
        b=fkSp9mEjEyRJN3vrbKnBDL5ZekTLuhkdrkTe1tfnE521dXSUN+gmnrYNgPKczX8cua
         UlJ2FwOj/jAG/t1Bf5mma7Mpp2Uh2ThRyGocdkTRkIJx1jbH1dvx/S+9h6zto4MskboM
         p5/ejxfzP9jd4jiN996y36irO17Zre6wctFuGRj2QK1T5L7866u/rDZLu+sxsNTGMubY
         oa7aA76KLfF5waevK2XFeQyxkaBpKbTHLcmvzOx50o040Ya+NyJRVEoahqIyxz1//eee
         qDF/KxZKOjHk2m108Loyl1I2WMBMPLlWN+MF/9pxhpVZHDOpQBJLZrFghUJbPEjn6XiN
         6oiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMYpvtSfwDxCzfIHZhIbSDEbFJT+TaF8mIcLpnMfQgc=;
        b=IqzHs3PCybTgFIxtniCXSo9+iH0/SZNV8nBnvUGiTR43NEBkyH/ALOK6+e8cvdImGC
         YOtK5ic13JbpLAzf54HZcz3MutoXM/9HbbQWNdquAXwrNuzYL2oYp90p1s/jFx+5MycO
         J3saDRqNNcOdM7sqdpCh0tgDzN8ZKzRuwQZkmtxEh8tIt0emHwxHrW9ifjHk2uuAQVzP
         9O/8Uc3ITa5W7QXyUKrzVl3eia5pTD77vSTgc9DIlKsDr0pE5/N45AtnkYJI/iL1togf
         cVM75EyEcg0vrroNSPpTbLuO4MI4m8MWwyhby4ePtAry6PJUfWJtunRhaH5BVB4BOyrq
         7utw==
X-Gm-Message-State: ANoB5plZSZ/VgMkEpwroK2a87CoEMRZ4iGbMe7KnAjIIIA5N2j2Vsbzf
        4jsZHNPMIWrNRWI44bJG6C1dFQ==
X-Google-Smtp-Source: AA0mqf4jCUK8D/Vr3CV5Nu+ZW3eZtFyKsscqyKq8yK3XYfClYd3U2dbOYJETJ90iL2S/I0F4itWELA==
X-Received: by 2002:a05:6512:ea5:b0:4b5:a207:8d73 with SMTP id bi37-20020a0565120ea500b004b5a2078d73mr5418067lfb.52.1670862951011;
        Mon, 12 Dec 2022 08:35:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm29209lfn.133.2022.12.12.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:35:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] ARM: dts: qcom: msm8960: add qcom,kpss-wdt-mdm9615
Date:   Mon, 12 Dec 2022 17:35:32 +0100
Message-Id: <20221212163532.142533-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
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

Add specific compatible to timer/watchdog device node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index a6331e5ebe09..536bd7b50762 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -79,7 +79,8 @@ intc: interrupt-controller@2000000 {
 		};
 
 		timer@200a000 {
-			compatible = "qcom,kpss-timer", "qcom,msm-timer";
+			compatible = "qcom,kpss-wdt-mdm9615", "qcom,kpss-timer",
+				     "qcom,msm-timer";
 			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>,
 				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>,
 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>;
-- 
2.34.1

