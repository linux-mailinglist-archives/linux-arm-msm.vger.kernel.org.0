Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5223564A0F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 14:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbiLLNdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 08:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbiLLNdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 08:33:14 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0532A13E09
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:33:11 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id z26so694851lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRtxs3R1067+lcJI6NGJ+gxAJa6V55Y3BrNFIRgVuLw=;
        b=H6AkD+ZuUXBAl2QvSalKLzsA7eL4UaCgLcRySD3sHovNqpPXeAculmfFbuxwDLSKfo
         REvPDoD43tLClQI1ghE2VBwxuKnsxWE3GvDb84R8tgnb9e2+xfy5b9BzlbfSrldnKnN+
         oMOWRAXLU5boywK6WmYiwjsAR0y0Ux7fOrv+A8ogDIJDlZge69jFBeGVkUScWZgn6QOw
         hsyTDgtQl4yhlvu7gQayr9X2b0dGsrKkuFKp28AFvZS0p9SJyLnWoCaltGtEHkGock46
         84FeihAhLuwi8NtI5G3XE4/r5rAaCeuXpB4v8Hm7vCIvAy0VIjb9AI5eYsEpJTbh3PA0
         U2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRtxs3R1067+lcJI6NGJ+gxAJa6V55Y3BrNFIRgVuLw=;
        b=iPuDKiqaghXg6Z5BRtsBk75OyJEfDyAnwPJJbPZxaiWcp+DTcAkgUunYXw+DmCWeK3
         Lh1vXItiP/OqSrKJBEepf4ITBvG8YvaWi/9H/ZqERsQ+nF7o7uz7VU4VdDLYHf4x50hP
         zDoqHsX8uVD7IXErHqdxL1qdqICzE7RSc0BVjcOv53DnbItMCah6iHIuI83JWasMdK8R
         sazMJzXchdDy02UpPkIcJLLW8WOQLjtBkiEIK5UoP5tcWR+/hiqD8tCIT4PCdS3u6QjC
         SFN29gA4NXN4ECvV9h20pdQkDrQIQik1BDhQxHFe/+l8oybjR7kTg3hnHbxPu9mpYzKA
         hJzw==
X-Gm-Message-State: ANoB5pl/F6xNJo8NlTWUJmTM/s28VN1kVP7XrNu08Xk1Ju3KlbHCOZoc
        HKuHdIt8tEzFmyZIhKeX/uGr5g==
X-Google-Smtp-Source: AA0mqf4ItBsT4WYW+WvnoL6UsedLSsxMkFLKaWRk7/kIUkkVrAgUUA+j40SBPHXyTPG5jhqSGV2JFw==
X-Received: by 2002:a05:6512:1102:b0:4a4:68b8:9c1b with SMTP id l2-20020a056512110200b004a468b89c1bmr5381666lfg.3.1670851989371;
        Mon, 12 Dec 2022 05:33:09 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a194f52000000b0049478cc4eb9sm1624435lfk.230.2022.12.12.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 05:33:09 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp: correct SPMI bus address cells
Date:   Mon, 12 Dec 2022 14:33:01 +0100
Message-Id: <20221212133303.39610-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
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

The SPMI bus uses two address cells and zero size cells (secoond reg
entry - SPMI_USID - is not the size):

  spmi@c440000: #address-cells:0:0: 2 was expected

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 27f5c2f82338..3cb4ca6c53eb 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1947,8 +1947,8 @@ spmi_bus: spmi@c440000 {
 			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
 			interrupt-controller;
 			#interrupt-cells = <4>;
 		};
-- 
2.34.1

