Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8718364B315
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 11:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbiLMKTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 05:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbiLMKTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 05:19:32 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE141C42A
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 02:19:31 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x28so4129127lfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X36LU1XRlzC2lW5z05k1p9nNmrwK0utCyP7x1ADjSX4=;
        b=xlr5wztUa364k2JXSSUsNLAXYrIsjBtEMP8NJhV/U860wGNZ1j34bLMFejTd+9iaod
         3GRFU0Cce+a/bZeBMZX6dUISoKKHZQuJXtAysj8xROkm1xzf8mFSExjo1wUq7EaEHWn1
         uRVOITvuQiCI3oMPlb8a2LTxhUJLuM4O+zEHNY/xUIrGVT1LorLkAMu7dFaBqbG0+1gx
         vhuB3AxzfUYMAjrCthQKFmmrkA+mFKMV54ZgRtKZODqpOX3hTJlLospcUlCOiS7w0wMw
         BBF2IhlZr9HTD4q3o+5AGtS4DSBV2WN5RjEAhNa3wsxOzgH2zWnD4tX9f+2ziH2Ab6iL
         o8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X36LU1XRlzC2lW5z05k1p9nNmrwK0utCyP7x1ADjSX4=;
        b=IXhJitx4i+ST1usg1VkBwVNd3mLLK06FgfUDU1jyaLQ+hnu+tGNn5sof2gaUVpxIXX
         7dwxyBKNSzzB2sAZZ5b7em3i7dFdrlovVBGJWVtWZXucNgYmyeJ25s9ocXw40sGS19lF
         UlFNU7SOv5RSe3kuuKJHeuAFCmyvoYIP0IVXkkHzt4yQsYL1aFXMH4Vf4mLKV6oc7jJt
         sn9YNrE0SWNOFd6/kti+VIUPG2uRJbjGkkHZqqOkp+uUIBQp9JBuh8yHAZCDtgANV2CN
         Ug2Mz3IE5UY9h367sWClzHPiHmAcbHLvFBT5/9q7u4z8DZlko29jraoiXwDEgiZmQ65h
         wz/g==
X-Gm-Message-State: ANoB5plIKboiJ7ndfD8ZcBYs0YDVsbvtaut1ZFeAZxiSH+4D9I0YVkFF
        k6w+7zM1agb0gzg8mf/aOQCQgA==
X-Google-Smtp-Source: AA0mqf6JWnX0xL4t8ziX0RWGt54Rcon3w+dRrLtSuXcG0izwnRSYxJd/v1BIkq9m+n+XXordmuo+og==
X-Received: by 2002:a05:6512:2382:b0:4a4:68b8:9c36 with SMTP id c2-20020a056512238200b004a468b89c36mr8149765lfv.30.1670926769579;
        Tue, 13 Dec 2022 02:19:29 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o11-20020ac25e2b000000b004b5732080d1sm302460lfg.150.2022.12.13.02.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 02:19:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc7280: correct SPMI bus address cells
Date:   Tue, 13 Dec 2022 11:19:18 +0100
Message-Id: <20221213101921.47924-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213101921.47924-1-krzysztof.kozlowski@linaro.org>
References: <20221213101921.47924-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SPMI bus uses two address cells and zero size cells (second reg
entry - SPMI_USID - is not the size):

  spmi@c440000: #address-cells:0:0: 2 was expected

Fixes: 14abf8dfe364 ("arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>

---

Changes since v1:
1. secoond->second
2. Add tags
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 448879d3d5cd..7c24c2129800 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4286,8 +4286,8 @@ spmi_bus: spmi@c440000 {
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

