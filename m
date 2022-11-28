Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B6B63AE9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 18:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbiK1RMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 12:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbiK1RMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 12:12:39 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE454C10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:12:31 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id s196so10505999pgs.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kmcuJx+hS1T9qhtpcJOi+eJWPy+gkUKUxaKu1vFLbxk=;
        b=p57cQwVbsFApF9FhaVnLhcJ/q9VykmeJ9HPdd5SrVTabfW5NB4k3L1wujTfh40lWvK
         tVkeY+MoDW7ALSl7oH6HIACe7ES7WqKDoiUFo23auAkW3W5uaEhbq97FFeJWXWKKhvDy
         Glx9zWBU9Y13E4hqTwA9PtQCVkgf4xYiRq1uAn/cPy1EWt1aiR9OBIAm1Kf/kRzoRsUZ
         hzFx3aHrbwEkfz5c8RfAbWWcIQNwAIeOXmvsZxQLud3/aKR9xQTcUTE36Okko0qZWV3c
         TnR2+DgzeojfuQYTWvGk1IvxzzZY7id4ODiaGvv6iFi4KNs5QZZpy0BgpbpZd3P43GCS
         FxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmcuJx+hS1T9qhtpcJOi+eJWPy+gkUKUxaKu1vFLbxk=;
        b=Vqjhk1TJO2eIU5tU5Qk06RF8sfjuxajaTq/10wi0qZn9OzC5ToWzWDphnibtwmn4oW
         7AMUh+tuDW3jJCOqjRIaqFlQqMCrsIZ4B7Wx2otBYkqBNzMszPFN+x2Zuw1QTTAWJCby
         e3UTcV0CDMN64o6p5mhuC11SPe3gPURS3ijsFUQjugaH9UvdTkir4BPJvcex0IvYUxXc
         3+gY9HcvoxuzdMzu8Vodm1yfH6ZDdcR1YdUyH+yV/kv3VtvCgFKjgkvm/QVeUwe5ghqo
         HC+yiyl+xnSpS5U++2gdONkGVSCxlckHbnlaSjoZB1TVHnVmK1FcCrzGFM3LsmdJALb7
         CPxw==
X-Gm-Message-State: ANoB5pm9B0ZB5IB/DOQWqtr3LROMX/7txptTKJ59qUkuU1cFtQZC+MiM
        UjQulXudNYGkdwoj2CBaGtTKt+SSFHAhMw==
X-Google-Smtp-Source: AA0mqf5IoIazwJNhz8ynIjK0P9b6sppO3BDUo6lpt+/yy/98in8iE50/s+AVMa79bTjhVLBBQMcC5g==
X-Received: by 2002:a63:ff0b:0:b0:477:362d:85d3 with SMTP id k11-20020a63ff0b000000b00477362d85d3mr28167728pgi.395.1669655550676;
        Mon, 28 Nov 2022 09:12:30 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3b:2d41:78ce:bf75:900:30f])
        by smtp.gmail.com with ESMTPSA id g16-20020aa796b0000000b005385e2e86eesm8564908pfk.18.2022.11.28.09.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 09:12:30 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, me@iskren.info,
        konrad.dybcio@somainline.org,
        Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH] arm64: dts: qcom: sm6115: Add geni debug uart node for qup0
Date:   Mon, 28 Nov 2022 22:42:15 +0530
Message-Id: <20221128171215.1768745-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

qup0 on sm6115 / sm4250 has 6 SEs, with SE4 as debug uart.
Add the debug uart node in sm6115 dtsi file.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
- Based on linux-next.

 arch/arm64/boot/dts/qcom/sm6115.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0340ed21be05..e4a2440ce544 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -649,6 +649,26 @@ ufs_mem_phy_lanes: phy@4807400 {
 			};
 		};
 
+		qupv3_id_0: geniqup@4ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x4ac0000 0x2000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			uart4: serial@4a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x4a90000 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
 		usb_1: usb@4ef8800 {
 			compatible = "qcom,sm6115-dwc3", "qcom,dwc3";
 			reg = <0x04ef8800 0x400>;
-- 
2.38.1

