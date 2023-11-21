Return-Path: <linux-arm-msm+bounces-1334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB057F2B2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 12:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D383B219EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BD8482CB;
	Tue, 21 Nov 2023 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2HMzVma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01EA11C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:00:12 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso20588625e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700564411; x=1701169211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfu2ORpkeCL1UpHBva1eJY9Hjq38Pt6Ou/3N+ye6TmI=;
        b=B2HMzVmaK5+6xmtWKuIqmqMB1e34NodefluFbX+2b8jOoPg6elJHdljSZqZsOPBUu7
         2VRJ6dbh5bd7lZN+0BbtiVBe99BimGavnmUMXJYkZTSoDK89fCbIoI+HNzryF4lzS4h6
         RDQYSTID6iAwIFvuTAIkcTLv84Hym7w6LFdddT+An3jS3DYlm72Agp71eVpl1LJIULcy
         yRc4Db3rNQbZf0oB1+MXUuq8poHVe+R6bK/e/CmpsI23AwZu2Tk5IZveKfMN3DVCM/c/
         LRVfoN5jMN2CVs2RZYhxoiZLzDej/zlo2EF+OHdRu0kKkIywMFCMWvKVpM5YueevtEXO
         0zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564411; x=1701169211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfu2ORpkeCL1UpHBva1eJY9Hjq38Pt6Ou/3N+ye6TmI=;
        b=f9U3LtS5JoaTulSkERluBHLNaqsreirPuSjvFTkKDIYWFnTkgDI8lTT+Z+/ZTwvwE/
         aZuF4mlCZKEhXMX9VykhhnQokcinYe3X6biN9HlBKVIdnIvumFWetJgo68vKHv5HGym3
         gBiCUK5tTdgHK+19lpK8JmnxVKWWuGWsw1muFc/QWseG7J6gCG8LzKh+rMyVn+P2E1rK
         odA1g1g/EZ9vTsD7GhciQbe/QBr0VsaDu/x5NW7Eh8MTCOcp0lSM+G+rbQOka0xR2/YL
         bs76RIRug9bdR3QoeTsZKFE5WqSZ37ffXTP03PZEivN1KmLH0TcyaTOFw0ZKaPf0iM5D
         bF3g==
X-Gm-Message-State: AOJu0YzBzOzn9mkM05+lD/xZJtsU4eVFn099C9Z+mROuyVjFLnk+ryGV
	yRG7klpQDCO9KLZUmp4aiNMsJg==
X-Google-Smtp-Source: AGHT+IGJEMVbfeQsa1/t0EbFaTPYjVinRX1FCAKKVCsBZQFMfQSrhdYe/avvpXPPTIBbDyl3j1mZkg==
X-Received: by 2002:adf:f647:0:b0:331:6d19:6899 with SMTP id x7-20020adff647000000b003316d196899mr5290839wrp.70.1700564411126;
        Tue, 21 Nov 2023 03:00:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f1-20020adff581000000b00332c0e934aasm9028500wro.44.2023.11.21.03.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 03:00:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Nov 2023 12:00:02 +0100
Subject: [PATCH v3 3/8] arm64: dts: qcom: pm8550ve: make PMK8550VE SID
 configurable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-topic-sm8650-upstream-dt-v3-3-db9d0507ffd3@linaro.org>
References: <20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org>
In-Reply-To: <20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2054;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GxogOVA0VSEH06pH186Sg87gTWs7OvO1dtqJiV/PY6g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlXI20FmYb8a1akK6sOe15+S19QginB6KTJmspXWx6
 5Wr+Fj+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVyNtAAKCRB33NvayMhJ0XnKD/
 4svV4tZAhMRqfwqYJCWDlSFUN2RgnlhsPb4zZGGlR7PUvbcz40kJsChOP7qejlwT9CIoFBhWXk6YTS
 zDwLrHiThhoWodlnxQZCKNhYFbNXd5UFG9Z4rUIU2zxNA8+lpij0uG1KZCV/NYkhb3fd3uJRIloden
 SK9KOpSQExPmdwRILQNMHL6QHm6cKbfUdE4/aQ3ncmHhHMv0atszGEKyy0sdK3SISAjAghMcFQ9sZn
 qEQqjsfLHLka4VSM7BVTquliRzikZ5QaUX5C6bJKSotV9sfL2PVViRQY4Vtb5LC+uX4bIJ83hDi/se
 qyTrfARlWjCSqSb2suw5S02ryaI+Syb6caKDCl2xK7rEh8G9SgZTfeI7M8n0NFVaR9TZ0fHt546yik
 GfJXThMlZATPoXdW1XBMM55Tqw7D9Af7WslegmYvk+MJ9pwIHTmpxNm0RCpVuwPzEnlAPurMmBiush
 3Yothail4MOrbVXwvbNL10Wy5CfY+olhPwCwm1EKKoy+jhq1WREDK/9i4CzQjoQDGgTZL6NqKExAPH
 v7HFHnpeSjYyHc341TrWUCspxEMJz5EV71Xfl43XPhgVNxYSj7ieYPzXmLzlHdkuq1sbZxQlQUrRu/
 zvS/8CxVWUPSSu4ch4zFz0xxv+L4JhssQaLXc168YJ2L0dx1BAWDrftjgqTQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The pm8550ve can be found with a different SID on SM8650 platforms,
make it configurable.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi  | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 1 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
index c47646a467be..4dc1f03ab2c7 100644
--- a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
@@ -33,16 +33,16 @@ trip1 {
 
 
 &spmi_bus {
-	pm8550ve: pmic@5 {
+	pm8550ve: pmic@PMK8550VE_SID {
 		compatible = "qcom,pm8550", "qcom,spmi-pmic";
-		reg = <0x5 SPMI_USID>;
+		reg = <PMK8550VE_SID SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		pm8550ve_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
-			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <PMK8550VE_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 9a70875028b7..ac045bfc51e5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -10,6 +10,7 @@
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
+#define PMK8550VE_SID 5
 #include "pm8550ve.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index eef811def39b..6d5c2312960f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -11,6 +11,7 @@
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
+#define PMK8550VE_SID 5
 #include "pm8550ve.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"

-- 
2.34.1


