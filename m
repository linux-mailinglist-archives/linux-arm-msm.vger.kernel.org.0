Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586CC641C2E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 10:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiLDJoz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 04:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiLDJoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 04:44:46 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A7918E06
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 01:44:45 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a19so10339391ljk.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ViFg3QNyZVtw+zxBmNfbWyO4sny1AXAMq0M/0KRlwk=;
        b=CVpRxf+2zXiCw67GOSd/Qms9suxBrX4AXuS/RX54SRVZECtwIGidrlYDqkMHLipHMZ
         P8x3yHf94Sdx0UsnymUmV3g44uzMF41v6w+5pdM14r9U1YfuvsxdhswL4ymNgpEraA/e
         pkMA2vBxb9b6Ae3hdH4M19cKoDEwTCKHKZCiSr3x26XusYS6YKfti38ier0ki1IBpian
         1XdWy2LcQ9HyKwqw/+q0NAXMyX+fGR0e28X82ycxEhmbUVIa+uTSQ1zJWplM21DyeAp0
         8kEh57LEoDoEjTMDH8R4YlCwo+gMHm4OQUm2RIjrajDDgoFpIrDfWuhi0j83aRsn5HXs
         HW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ViFg3QNyZVtw+zxBmNfbWyO4sny1AXAMq0M/0KRlwk=;
        b=s+Ws+R+Q1IWadWoFGfuwIULqD1EphIZwUbx7wIM+XNBUzpVSEZwfW8O6XPEog4MhEI
         iccZlBxAzVBkOwd9LYGKT71XP06QajphAIL/S8CsK4N4Ss1rBjADi5wgPYqflVzaZD4W
         RPcM/wvn3n4qaFvhgDcVA83LTX6vsRppti+TeGZq3DoS2J/7buCCgNvnVXx5bwQ6JMbx
         K2tKPOal4Dx6kQcEymL7ucX5F5ISre6TR4hxRh5HkucBChTOYkrYjqb/z9SStzNkug+0
         +VvJ/Jb4PT4dYCP0y0vjtzmHN/C4IGTsOn29XK6VqfqsW22NNJmH2dQUjBVkSn8v7tPT
         ISzQ==
X-Gm-Message-State: ANoB5pmJHElikqTaBRM+OQdhvzt12utaGjovVjPj2hTeRSaNrpHsnjxN
        iPZaH8WapfuryncR7Xtdom0O/T1gTTN5HtUTwr4=
X-Google-Smtp-Source: AA0mqf4Sg9RjftHh3OcqV7dy4/QpnyNwHJQ8jdAcCKCqtHTSjS03vC5L8+Dc8CgJBnZjdM/fmUxttw==
X-Received: by 2002:a2e:b946:0:b0:278:f109:2844 with SMTP id 6-20020a2eb946000000b00278f1092844mr23526160ljs.224.1670147083722;
        Sun, 04 Dec 2022 01:44:43 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o10-20020a056512052a00b004b07cdef19csm1711593lfc.138.2022.12.04.01.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 01:44:43 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] arm64: dts: qcom: sa8155p-adp: fix no-mmc property for SDHCI
Date:   Sun,  4 Dec 2022 10:44:35 +0100
Message-Id: <20221204094438.73288-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
References: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
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

There is no "no-emmc" property, so intention for SD/SDIO only nodes was
to use "no-mmc":

  qcom/sa8155p-adp.dtb: mmc@8804000: Unevaluated properties are not allowed ('no-emmc' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 01ac460d910e..25e2d9a2429e 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -397,7 +397,7 @@ &sdhc_2 {
 	vmmc-supply = <&vreg_l17a_2p96>;  /* Card power line */
 	bus-width = <4>;
 	no-sdio;
-	no-emmc;
+	no-mmc;
 };
 
 &uart2 {
-- 
2.34.1

