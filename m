Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802436AA3FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 23:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbjCCWQ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 17:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbjCCWQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 17:16:15 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26F7848F2
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 14:06:52 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id cw28so15927569edb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677881137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fr1OHq/Y0F9EXyjJfE+Cc02kHVOPdqYGSbtmI+oAs6M=;
        b=CqAexUSg9vneLS6aHjbpnxUUg4/LwvXeOcGcP3U5lvn9NJdbrgP0N0wC2MsWWFtgy8
         Oz1cjV5KmrbLJLEKxsTJNILOa496WsI58guWBPKQ8h8SV4rxQGOD7it6Kue7H77JqqsV
         IrhRGJjHi6NNjCk4xIHb/oTcynnc3mwe4xOblNHmOed4gnhSg9h7kj5LbEtO7Bf57+4+
         WRQdUf60RAK3d0eRq2hqdaX2MKG8MINHi7Ev3tu3sklk4B+/zBSVmEwgIV7zjFZU9/SE
         lirRA6OfvzyDQnoVzAcYbZpXEuS0evYuz1Z6z32Mqy79bNM1my0mHtr+ORP/bDfK/CNT
         4ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677881137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr1OHq/Y0F9EXyjJfE+Cc02kHVOPdqYGSbtmI+oAs6M=;
        b=XZbSfNxQbgYDpXBU7uRRq6c2sxHVYhLqK8lAiPafvHOldAeCtBvtNNn9naOSzz9EXt
         y3ViqizHtrk2blwMSmsGzYQgeCqWWTDmxrr1+ORrkXVFUTZ2AehWfK59uxSILJFpB0tV
         y3m0Ih6bU+cYDDXF3BhDIf/cK31S0g90DoLpzIQlohPH9T+u0yZpdTV5dpSZoSrqqUZG
         NqRkQSxhPrdA7SwcpRCjcCXzYuWoeDV4VqOrAtqrKFjGIOIHHB35vuPskBBQCTx9tHJ9
         NE5VPGdmsaeVhKIaAUwQuyI9K6MQDKNQcNJ6IQeB35aXsrLfgUGtc59gls01QZW3UHRc
         aevg==
X-Gm-Message-State: AO0yUKXN4t1Lj0JZpF6q9N3B6t99UdynMRSuPAfUH7i+LyhVanJjfcpI
        8Suqg8L0isQJnP6pTeiHriQwrrV0ZLBA36O+nak=
X-Google-Smtp-Source: AK7set/KN+z2wYZVudX97d+dJPyqeM+XXZtoDSsCz75EJroknIj9hAlhYIxSV4JdraOf6EDZuvTcnw==
X-Received: by 2002:a19:550c:0:b0:4b6:a6e4:ab7a with SMTP id n12-20020a19550c000000b004b6a6e4ab7amr1007164lfe.8.1677880706328;
        Fri, 03 Mar 2023 13:58:26 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id e27-20020ac2547b000000b004cafa01ebbfsm552670lfn.101.2023.03.03.13.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 13:58:26 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 03 Mar 2023 22:58:10 +0100
Subject: [PATCH 10/15] arm64: dts: qcom: sm6375: Add TSENS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v1-10-8c8d94fba6f0@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677880689; l=1456;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ykqp5bp58crzGqyySJ//g66g5IA2DYwCTKLczf3b59w=;
 b=uFCnBJBBP4ewL8ml3Oy7ai20aaNMelzJwBlm11SPgm7brQB3chwmE71EgPCT7XYgYzRUSXyCbGLT
 b95LkYqxBl/7PTHaW35MVOjC0W2Ovl/W8xe1jF5QpJRsO43rhznr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for the two TSENS v2.8.0 controllers present on the SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 59d7ed25aa36..a88ed6467e68 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -764,6 +764,28 @@ spmi_bus: spmi@1c40000 {
 			#interrupt-cells = <4>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,sm6375-tsens", "qcom,tsens-v2";
+			reg = <0 0x04411000 0 0x140>, /* TM */
+			      <0 0x04410000 0 0x20>;  /* SROT */
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+			#qcom,sensors = <15>;
+		};
+
+		tsens1: thermal-sensor@4413000 {
+			compatible = "qcom,sm6375-tsens", "qcom,tsens-v2";
+			reg = <0 0x04413000 0 0x140>, /* TM */
+			      <0 0x04412000 0 0x20>;  /* SROT */
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+			#qcom,sensors = <11>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0 0x045f0000 0 0x7000>;

-- 
2.39.2

