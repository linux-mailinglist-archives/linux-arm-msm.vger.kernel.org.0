Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D49E69B002
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 16:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjBQP6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 10:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjBQP6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 10:58:50 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF783B85A
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 07:58:48 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id ee31so7496722edb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 07:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AdPiwh3b8A+zGiRoWfdq4qtMfxRdZ+CJHCAn9rHssM=;
        b=NOxz72QPbXJ3FlLpmA9orNXQV7RHz+HVkf7e59E8kduNeQ1x994jq3mmmK3Cih6fyd
         lkzTKzN0xhPvp0+uLa1pQcPx+XEk4hzlLOguCPdtYAu+hIjqlAkWPis87L3zMMuS8EUX
         ttoqE6sXqA06pHBYh28ALZ0yA8z/BF4Eoc2SCXsS11NsyEiSpkLuRW/uFFpJstm7f8vv
         H50+nZ68TOPCvLfm5USzBqleq4knxdfObRzvuH5CeE3w9jighOILVq9jbz3tSjtrplc3
         i3bGkzTF3Ax1cKfM+wFrwuMfsXWAEPN3n/XSHaffrDCE7K2IDqcWmBJrwoCD+GVtvcvT
         xczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AdPiwh3b8A+zGiRoWfdq4qtMfxRdZ+CJHCAn9rHssM=;
        b=Al4hLBzlrQGwx4qQJNjUsOdIue93Y79fkkziBL0gI670z5DDKttr/xesUqZFwAN/d2
         0ELQ0cmKMN+LSk8mPwpSbLT8Cy0XTXYBtAjGaDmO4QyzWsoxAri2RPTborcPRwYfZi+m
         JbRO3xBS8+J/+vks0rECZMqD8I4TqW5OGyEKuDeFP1ZOqHu3b9HKoxuGhxFEEYgTg2By
         mfN1CvRstYSd/gYB7llRnr2Nee8SuAkz5FxDQNbX0vowNJMKTh+fiCESTsY4pnQS47iD
         WWKcYlkoxgQpYt06Zz3gUdFaiihNwjD+upB14B/UDHI+Mwv8vVGTb+UGcios8TzAbLaN
         91hg==
X-Gm-Message-State: AO0yUKWyiFxCNHgEx9o5DU1nLUVr4+hfMK+btolVpRweqelRWKdvo5S8
        4NLDhe2KpZg6d3rDCvOpdhKC2g==
X-Google-Smtp-Source: AK7set/fhUZ+YsPyas6G5lnBSvnhDlmTuRWFwJI7Z0eOSZGDUbnuYLhTVBUIjvN84F6WDlxXSS7NHw==
X-Received: by 2002:a17:906:90c9:b0:8aa:502c:44d3 with SMTP id v9-20020a17090690c900b008aa502c44d3mr10810229ejw.41.1676649526740;
        Fri, 17 Feb 2023 07:58:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090685cf00b008b1435bd1cbsm2290068ejy.105.2023.02.17.07.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:58:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sc7280-herobrine-audio-rt5682: add missing supplies
Date:   Fri, 17 Feb 2023 16:58:37 +0100
Message-Id: <20230217155838.848403-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217155838.848403-1-krzysztof.kozlowski@linaro.org>
References: <20230217155838.848403-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect DBVDD-supply and LDO1-IN-supply:

  sc7280-herobrine-evoker-lte.dtb: codec@1a: 'DBVDD-supply' is a required property
  sc7280-herobrine-evoker-lte.dtb: codec@1a: 'LDO1-IN-supply' is a required property

In sc7180-trogdor.dtsi they come from the same regulator, so let's
assume intention was the same here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
index 1ca11a14104d..485f9942e128 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
@@ -94,6 +94,8 @@ alc5682: codec@1a {
 		interrupts = <101 IRQ_TYPE_EDGE_BOTH>;
 
 		AVDD-supply = <&pp1800_alc5682>;
+		DBVDD-supply = <&pp1800_alc5682>;
+		LDO1-IN-supply = <&pp1800_alc5682>;
 		MICVDD-supply = <&pp3300_codec>;
 
 		realtek,dmic1-data-pin = <1>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
index 69e7aa7b2f6c..8b855345e5c7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
@@ -76,6 +76,8 @@ alc5682: codec@1a {
 		interrupts = <101 IRQ_TYPE_EDGE_BOTH>;
 
 		AVDD-supply = <&pp1800_alc5682>;
+		DBVDD-supply = <&pp1800_alc5682>;
+		LDO1-IN-supply = <&pp1800_alc5682>;
 		MICVDD-supply = <&pp3300_codec>;
 
 		realtek,dmic1-data-pin = <1>;
-- 
2.34.1

