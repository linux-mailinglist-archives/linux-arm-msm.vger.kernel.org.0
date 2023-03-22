Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF846C52DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjCVRm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjCVRmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:42:17 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120BE5F6C5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:42:02 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ew6so13170845edb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaFooc3ZqmiLvzci4fl/GeYapWLW5sp3t92Xl0ir5ig=;
        b=ScLxyQTp/84tc3rKIdVVrg3iFCFnw/4G0yKXfPxTsZJd2OaEF0HDlyC9BYwwC0tKxg
         71G9KIQNpCWDka6YXbtIOWXSPeEPhkU85+FUp1xSlZWvKZM40SE46Her0ULepHSsiz5M
         BRyl2z54NpWv6IxWGtLZ930UeCSlnDfyi8b1mSrzJGfBswyNUYLcfOT8I+mEYV1VqsaP
         i+LSvHNMD5kC7hASULLmNrTtXkQ3NBSO930MPLJl+bRiRCwyFmmipYNWHvgM8MDoGTih
         myTZrtp9Fv9Cy8tX2oDHiDSQB3bGLfR0fP4WvaBijsyUXYFiT9V0Lo4F5xIbyFhbHQrt
         pMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaFooc3ZqmiLvzci4fl/GeYapWLW5sp3t92Xl0ir5ig=;
        b=3fOlzWAsSSxfuRHX29lCf99eNYjq9icMRNlQT1ic+sJ5biZIx6vzGQPEe7sougW+SO
         nvbPg8he84fChUU4II2RXuwqSJxGmA+3DgDL9EYJ9Lm+L88BF9tiU02UW5+gb25Erp/h
         VtLu+dAxe80+n7ePjaR7sW0X4zrr5kkxiqtwmljfLWGCEttOqgRShKyJHETnhWHbyzAD
         KDf5yGUuyn7orYQ+dCM8f4MHqNSa0ch/JF4CO7zG/9tLmgiPQEgVr9EmX/tLL0vcL9UV
         ek1TblmvuTgICX3IYHKLjjWBtPfod2UaNQexJEh9e57xipyGMBFKRd/kwm8G5vj0cjJG
         E62w==
X-Gm-Message-State: AO0yUKXaJANboFQbRKzSZ6jblYHpGqTX69pjBwtBCuVDBGmlCtR5tWx7
        3FcZ04nInaSJHn/h0aZWJUHkcg==
X-Google-Smtp-Source: AK7set9nczQ7HsTLWvgmMfvNyH8+aTWuQMHMJ5xQXGrvJoEG0yI8zfHdErkOEaPCz5TZD7uoDsS14g==
X-Received: by 2002:a17:906:715a:b0:92c:88f9:385c with SMTP id z26-20020a170906715a00b0092c88f9385cmr7564320ejj.75.1679506921146;
        Wed, 22 Mar 2023 10:42:01 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm7548088ejc.29.2023.03.22.10.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:42:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 09/11] arm64: dts: qcom: qcs404: add compatible fallback to mailbox
Date:   Wed, 22 Mar 2023 18:41:46 +0100
Message-Id: <20230322174148.810938-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
References: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCS404 mailbox is compatible with MSM8916.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index bc2ed73afb74..e4fdc40be821 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1302,7 +1302,8 @@ intc: interrupt-controller@b000000 {
 		};
 
 		apcs_glb: mailbox@b011000 {
-			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
+			compatible = "qcom,qcs404-apcs-apps-global",
+				     "qcom,msm8916-apcs-kpss-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
 			clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
-- 
2.34.1

