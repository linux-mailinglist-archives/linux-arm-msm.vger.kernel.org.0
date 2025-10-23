Return-Path: <linux-arm-msm+bounces-78556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB8C00B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85CCA19C69BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905C730E0C2;
	Thu, 23 Oct 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="JyzJJslw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B44230DEA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218960; cv=none; b=m099rTkR9ThlfCId3rGQ4Y1D8VfuUAkdw43ELFgYTAfyzqyIYLW7nvovqKcJHa7FHbca31FpLxwYDyaPxEhrpUhvCpc4IjfHeU6nPjSFKJPEOxVNho+TcHahsjy9iByjNwohx/RNbYAeaOzPbJ/Or4jbl42p9+Hm5BH/AboC9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218960; c=relaxed/simple;
	bh=x8UThgThW8sgU+bTtRpNm6v4HS71/1MoGY1+mjSdEZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvuTCNiGVovFYGtYyMD1LstItMwxF6Q6/Gb6Kkz/AvkFo/rLeMqisk7dPXCs1AX7CjBmVkdLPlbs2GDPVWKtmXhLu9MkB0OjdnRaphQRELHeR/ZFLFsyLWnTwanafd23nCmnHW/CEoD1m1OkATNmizkqlopB8K+B2/1izkH7Ils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=JyzJJslw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b5e19810703so115611666b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761218956; x=1761823756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VcPDDfMA6ig8zCBApRX9ed3uOSim2Fm642DnrpLTL8=;
        b=JyzJJslw+1ZNKt2ExU5pTZPdI2BWRyNk0FmNliGwXcQbs6MGFWly/WbcwaMCucE11l
         mQ86woddhnaUHUDo6Iq+QqaRGf1SrtaMDg5St+v8K9HnACA2rO/sQ3DVsXm7YQ4yTUWt
         TXaJcnzfG/NmMS3rhWWj7xOV54ja9X0jmfPZywEQTLiEERSodj6dKFwPfeWb+c8PLuPv
         oaypWf+EnKMybZee/xolU2g4Y3fA0iqiBs2Txii5oqHeJD8ToN7gJPCKfk35qruxsUsz
         NfJ3mEeE7Fmz+e9UjYVj8A3b/nYcdBjaUbutCMnlDPYmj39cwWVYie7MTaoLX38BUifp
         lwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218956; x=1761823756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VcPDDfMA6ig8zCBApRX9ed3uOSim2Fm642DnrpLTL8=;
        b=rO5ANnhSJ/bG9D3wQgTRHoQitWUJrpkk9Qq7zJ75W64fp82ZF3W5sBehuXeKdDkgv4
         VFWnngKCjRFp+8y8cr1ek0Sa5FnWtJNxXvQbZjeQVSENEGRR+Z79wqEcJIC3vwzF7Q20
         /J67DmWWMK7N8VRFLUqjLWqqrR+TnA/u8Jl+LcVfgvSJ12Uqp9TifE3avlfl/t+GU7kH
         5TEovctMUUxzi33uO7kiUufu8EQHw6zII8HBFnWp5fdy8Att26TdMOtg6s+48UP/ZtMF
         W/VmDwPOw5FDIBzGkebh+hE992Or8OH9Ra5ykPNs1nfcv9liG65AazHNnzkt+N6fyXXB
         l/Og==
X-Forwarded-Encrypted: i=1; AJvYcCXuKRzE6GdatIcu0Ux6reXvKidAxB5q4citaBOOZv+SpkhgNE41zln6bMZva2WS5erosE8YKsd9iKO+yfi6@vger.kernel.org
X-Gm-Message-State: AOJu0YzejG0aJE7DMlMPn9EZ8Hjq1A7ESBsKL3c86j4u135NncVwZmm3
	hBDpNsgNAuUn8HeqRFavOcBNdxWpJ7A35SKvIeSEHTcdpgyhGKfeiAyXI4sG23Oxy0I=
X-Gm-Gg: ASbGncvM85WIas2+l7rxbCCWS+laMmK3kTALtNOjCXN9LrGjKg3MR/+lzh5eqVIZTTY
	HNO/9obwBZIyNcLcTIgYRRMdYrnzZ66RzCvERLn+I0auXm6B6eg2PJobl+cbBQARt9EI6guidl5
	PJuCkDUZgmRZ3SMoG1B7j/D3LerVeqMmky6lO6LanuPSBd+gH94irbse5Fi9Q4C/i4sViyEi8FO
	Tyhlhp27znViuDNMsAe0hjI9jVj6EtrImAMl0Tb2F7KEAMWcRvDeSMdEnIPg/6LIxWn4FqaZ4tn
	scS/7fxamxpwq5xHJRYJhP65/AuMM93wy1XR5wzabFDMD78NShhlkQoPl8Uu8IC3Qbqc55Sp5A1
	2MhgEVH1bhtCSbZLJ/fi9vqjCgzKPLuEYJwDi2RnpGHwNC1Rz11lCMrJVxnV+Qr+2dAGxAooR33
	ab/9lbG1XQCyCBOGCFjHJ7wU2LLDECchSZgLy6rLgHq0BL4GgHG5oXwIUd
X-Google-Smtp-Source: AGHT+IGx1IekfgAK1nsvkYIbewkd7/Kp9LHUEp2UQobF//6DrQaUqt2l8HG+IxLZVRXH/rfq8SBPxQ==
X-Received: by 2002:a17:907:3daa:b0:b50:d6a7:d6b2 with SMTP id a640c23a62f3a-b647443b9e9mr3287099266b.32.1761218956516;
        Thu, 23 Oct 2025 04:29:16 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb328esm1439098a12.5.2025.10.23.04.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:29:02 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: Add PMIV0104 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251023-sm7635-pmiv0104-v3-2-27f1c417376d@fairphone.com>
References: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
In-Reply-To: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761218951; l=2204;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=x8UThgThW8sgU+bTtRpNm6v4HS71/1MoGY1+mjSdEZc=;
 b=w6EEnHkhKTsqJFMyAkXpi9sGxV4XUKIWR9ijRcHthZK0m2PNY1je19oM6FvpfkHthQ15P+ZXg
 xiGwrDZfbmVCtvl3U6DaVeuqEeQJF0qj7BqGR0Cfgv8YkioiGcUqQqU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. on devices with the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
new file mode 100644
index 000000000000..85ee8911d93e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmiv0104-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmiv0104_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					/*
+					 * Current Linux driver currently only supports up to
+					 * 125°C, should be updated to 145°C once available.
+					 */
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmic@PMIV0104_SID {
+		compatible = "qcom,pmiv0104", "qcom,spmi-pmic";
+		reg = <PMIV0104_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmiv0104_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMIV0104_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmiv0104_gpios: gpio@8800 {
+			compatible = "qcom,pmiv0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmiv0104_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmiv0104_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pmiv0104-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.51.1


