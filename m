Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 147735AE7C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 14:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239923AbiIFMUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 08:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240302AbiIFMTd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 08:19:33 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6046D7C50D
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 05:17:11 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id l12so3635529ljg.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jxL+xsbNPMQ0LRDW07pB1gCBkhj6BzOUQBO7qCX71FU=;
        b=CpJkP37qUoWaOHam9E2JAXwW7u39U2t7NFMBIZbyL9Ciwo2aoTnIgBpY+VG65GKios
         EUzehYF7WCd/erNoIw86cRzW2VbckRTzNQobzDqfQZKHcX670oAW7M42ajfMLnlJa7OC
         Ei6EkLBbFSLdvQKMt85KhsRYgSoPBN5Ksdo4IW4lUMTIig8RDzobfhi2qOAorUCZ4Ulv
         SK5qajKFl91SwgYZVOjt4fXC3P2kGaDKQtN7lq5M97lPtH/bjun8/tEyyAyr3oR1Zep4
         OdzNmbCgNP++pWpBk2mL0sOs5DrYjhw5YQBX76MiP3B9KvLslR/ZiI2drDGkdb7GZbhh
         ohBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jxL+xsbNPMQ0LRDW07pB1gCBkhj6BzOUQBO7qCX71FU=;
        b=TiCR17CFl1Hj8u3OJb/x1ACoq5++8iIHyz4dkCPt+METz5tbHIe2mKppL04LJrtOzP
         SPsIonhF5peE5GSXBuxfrdDtT4odsxnqkwYsgsswIICnOX7R14VnZh4EQRoBY4Iw8QS5
         dR9U1XtVO4gaSS1/rmKk/1qLqB8jWiJ/ulDNwakdPmZZBUZjrTaJ5xkoxl0Y1M0ZEvkE
         kC5/+/wCQ/Mu4IEbN3ZdgyixShlWe6r2V/Mp93rZyPs/plnkKZJRWM2kVq7ecBxmF43a
         p0Nllyxn4yRIkrZtN6bDGDmjeaa2A2XU23crKb7c6YmItWnr9gXmfk6AYn3RpUnu/9Ou
         +rtQ==
X-Gm-Message-State: ACgBeo3QOUizj16Qe2uACI7lDzwFvoN5ywkIZDX2RixxwHIA2zZaRssq
        9y3Ud6XDEhIlAYDaAVeJW9WhjA==
X-Google-Smtp-Source: AA6agR7/pgyd1DQA1bmXkzqfd0ZlNJS2Vz9kmJ4Jy591mvQSpPAnHiz8NkjvC+XOwPPeTO8BxJc2Vw==
X-Received: by 2002:a2e:a604:0:b0:25e:87b1:fda5 with SMTP id v4-20020a2ea604000000b0025e87b1fda5mr15152545ljp.428.1662466623852;
        Tue, 06 Sep 2022 05:17:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:17:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/12] arm64: dts: qcom: msm8996: fix APR services nodes
Date:   Tue,  6 Sep 2022 14:16:47 +0200
Message-Id: <20220906121655.303693-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service" and to have an
unit address (as it has a "reg" property):

  qcom/msm8996-xiaomi-gemini.dtb: apr: 'power-domains', 'q6adm', 'q6afe', 'q6asm', 'qcom,smd-channels' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 742eac4ce9b3..8dd4f6d09330 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3388,12 +3388,12 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					q6core {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 					};
 
-					q6afe: q6afe {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						q6afedai: dais {
@@ -3407,7 +3407,7 @@ hdmi@1 {
 						};
 					};
 
-					q6asm: q6asm {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -3419,7 +3419,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: q6adm {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1

