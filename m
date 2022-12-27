Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF41656CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 17:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiL0Qcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 11:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbiL0QcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 11:32:10 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6495BBC87
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:32:04 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bt23so3610456lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj3odR24R3zltoZ8J0vvuKsCnJFZ1r/NGOBMtXzcGls=;
        b=BJqrcT6WZus5i8s+2oU+P2gJAgp1c8WWSeXt36RLawrbLJzLL/xxIq5obXGVMDaADo
         ZFs8cG+V45I5V4ife5KLrUA/j9Gt5er/wznTBA9EXCNWIj03SFlshD7DAb7MZmpfa29w
         IWr6It9bF7HX5hrefh4QDvx58nJLgdLZXfNuHDylWr+9jMvD+gOyuVcxq8V8lO/Jqa6i
         k5DBCO2gwWhQcXT1GL2iaFu4EmIoJXgvul2/zDp04KHRZfSQkFaQo1s1UDDjnrPOxb4Y
         XqIqihPzCBfArf18vd8VpGu95Aw5Wv5C3NTLliM2AbNf9My3TuuHdkoLYdJz/JW5fBKv
         n1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jj3odR24R3zltoZ8J0vvuKsCnJFZ1r/NGOBMtXzcGls=;
        b=eHeZHt5XiASp9fuJelOS0h2PBPVBQLFyJSOgNoUll0utFFACVfonbObu3523aS9Bbk
         zdHdZAbpTZEXAfJxD5bVdNkcWBihvjrZLhAwz4Lo9a7iK8YzrzHrMCFjvh8qeSjV/vUu
         DhG9m875RgBF+iMJGuqkKHvdR3YDAbOfkiXItxbYG9NCnVMFiXzDT2at+V8QlFGKRFwZ
         G5IM0rNZxfZiwMSn2NihRWUiInDU7HX8apNLaA6MDC7vHPKChfH7OD/vlcLaySYpdqaH
         pDrjN6iL/K2MljhT+IfOmqJ7Pb9uqah5RryT8sdpm0VOGp7iJiYkLoFQiG2HyfAxB5Uk
         3ILw==
X-Gm-Message-State: AFqh2kobPU9Gk+GF+6g4+6XHaqihKF+3slrq6gzEG3fXXtCBFoVVTTQZ
        SDz0riy5QEkyDrA2jLNn7DoSIA==
X-Google-Smtp-Source: AMrXdXsR/f5ChOpOBVEToYJox+k43YLCl7w7oekaq//lCeatIW6bPIGiR8kmybCiHw3OC6WqAs1bcg==
X-Received: by 2002:a05:6512:3ca0:b0:4b5:b7c3:8053 with SMTP id h32-20020a0565123ca000b004b5b7c38053mr6901004lfv.42.1672158722840;
        Tue, 27 Dec 2022 08:32:02 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q8-20020ac25108000000b004aac23e0dd6sm2319853lfb.29.2022.12.27.08.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 08:32:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sc7180-trogdor: align DAI children names with DT schema
Date:   Tue, 27 Dec 2022 17:31:58 +0100
Message-Id: <20221227163158.102737-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227163158.102737-1-krzysztof.kozlowski@linaro.org>
References: <20221227163158.102737-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect DAI children to be named "dai-link":

  sc7180-trogdor-coachz-r1.dtb: lpass@62d87000: Unevaluated properties are not allowed ('hdmi@5', 'mi2s@0', 'mi2s@1' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index d134d172a3c5..64e85cfb36d3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -788,18 +788,18 @@ &lpass_cpu {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	mi2s@0 {
+	dai-link@0 {
 		reg = <MI2S_PRIMARY>;
 		qcom,playback-sd-lines = <1>;
 		qcom,capture-sd-lines = <0>;
 	};
 
-	secondary_mi2s: mi2s@1 {
+	secondary_mi2s: dai-link@1 {
 		reg = <MI2S_SECONDARY>;
 		qcom,playback-sd-lines = <0>;
 	};
 
-	hdmi@5 {
+	dai-link@5 {
 		reg = <LPASS_DP_RX>;
 	};
 };
-- 
2.34.1

