Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B4B6438E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbiLEXCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbiLEXBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:01:34 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EA41E72E;
        Mon,  5 Dec 2022 15:01:33 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id a18so3266690ilk.9;
        Mon, 05 Dec 2022 15:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxi6kW+nZelgmuu1SuZddsY5HzZFPIbjqBCxA1IDU9k=;
        b=UwT9Y/Ua+ei/ZoT3avPJgKPkyQGmvzWZfiBoVkNNyoOT//vk76qFP4/mF1HxeN/35L
         xHJi9cYYKqt6VeOrxYA0qtjN1Tcpqst28ivQarvBoKD83iSRHMl/kzil62/MINxj9b8u
         wWYn/N4udI8yIUXX4ZwiaHcc4nOf+YT0Xsc5DaO06s5ui+dNfTu2qswmLJSdwjxyfWPB
         r62TrUDoyAfwm2Rbsg+VcoX18l5+95KKX+D33vABMdYH2UyxUfsHR+7Rz1NgNXsHN4jA
         5ggLUxsgUgrVpK1T9qMoT+1L/7BLtFs25yOlp18p8J31majP0TJlwrHBZeULTwEQwe24
         wJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qxi6kW+nZelgmuu1SuZddsY5HzZFPIbjqBCxA1IDU9k=;
        b=sZewO8tgQvNu5J9xv0xCpkahhA3ggpile0OgdZgf40VxKLq51eziB0MY8f8IcT8xf+
         8V1GZ95jJAgG+kqukCx8Mo/mhPoErrQP9ByBOZuRpkOLnUi/AS0RoI7BDi2Gu6fq/+hy
         rUGhAIyw21H+owu6XbwHIir7VF6q5AQ7o6BPjKwTFnU7jdior/45G1rEokzXXBR/H2OV
         p+PCEap49dJzRPOCHEpakAkwWFY2nRk6vGlJlUxQjkQbazzHqh11eSlVmiOkkxqsjoDn
         Q6E1alqO6g99dyMrWnJzVBcdACFNLeWLCQjqW1uyQbqwCAGhnnHRTJmR610rTvo85qvx
         hUBQ==
X-Gm-Message-State: ANoB5pnVlR2ujy/s0fXwRGrIKd77titd8KF0RGl+XWZsz7qZyvRSFIHm
        e8Y5J+drFZzxZox3mgUoo34=
X-Google-Smtp-Source: AA0mqf6I6RUlV3Y7XaZ3cIqENYheRrr+9Z3781xqTQFw2K/KqLy5NVK+XWTbyJwhqN7iOTBmZoRUrA==
X-Received: by 2002:a92:cb46:0:b0:302:dd2d:1f5d with SMTP id f6-20020a92cb46000000b00302dd2d1f5dmr28601125ilq.108.1670281292713;
        Mon, 05 Dec 2022 15:01:32 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::be63])
        by smtp.gmail.com with ESMTPSA id b5-20020a05660214c500b006df13af1f16sm6248303iow.50.2022.12.05.15.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:01:32 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/3] arm64: dts: qcom: sdm670: add qfprom node
Date:   Mon,  5 Dec 2022 18:01:15 -0500
Message-Id: <20221205230116.2204-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205230116.2204-1-mailingradian@gmail.com>
References: <20221205230116.2204-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some hardware quirks and capabilities can be determined by reading the
fuse-programmable read-only memory. Add the QFPROM node so consumers
know if they need to do anything extra to support the hardware.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index f93705bc549f..933ad2fabf3a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -731,6 +731,13 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		qfprom: qfprom@780000 {
+			compatible = "qcom,sdm670-qfprom", "qcom,qfprom";
+			reg = <0 0x780000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		sdhc_1: mmc@7c4000 {
 			compatible = "qcom,sdm670-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x007c4000 0 0x1000>,
-- 
2.38.1

