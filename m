Return-Path: <linux-arm-msm+bounces-4448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E9080F5D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 19:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02FF3281E9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 18:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4C27F565;
	Tue, 12 Dec 2023 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1ON+Pat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB7BE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 10:54:20 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bf4f97752so7780905e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 10:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702407259; x=1703012059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YC/WVH3u8zE3lqMQy1sW6oW6rbaFlnYLpBOstsLNgoU=;
        b=t1ON+Pat9orIqzYCsosWKdEkD3iSFnVmjSeqkERgXpJplFDOkhI/xWOYrmIFwGejW+
         n7dYEwjBHC3cHe2Uz/9z/JBbQm+/IVQJ/9wHDNg73w8s5yXK5jVOEMvfhfHGatx89SxQ
         d8j4/P970tggiPEt+301/30oqFY0IJMYR8SzHZ99D0Xn6GvL6fPovwoRlHvpxVbkYhyR
         Fp/FGV7l6nNV2VFk8iSmn4BUKHtGUHsUumIzqcTw7/yzYLMo3qyoPVEJhU4nkjgkZtan
         ZlSJblWfeNYrPzeyzRHu0AI1fh36GvJLmwgqAUL9kqLRs9pBcRNgNmPaT1ldyS04TMCV
         Ds2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702407259; x=1703012059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC/WVH3u8zE3lqMQy1sW6oW6rbaFlnYLpBOstsLNgoU=;
        b=Xm924UDWvva80sRIxLKPetn5ipIkUVkXieYcgMRb/BLoTKT/fP1OoTGbjRUKWUN/o8
         Lzq2dtlNMNSmGqXLzTNxKrPX65JnPi2NrcfMwfGqgW/dBtwkGEr98W5QNdV73dYypI56
         B/PB2ZVI+bqnQhQ/UxIC6WahZCllRwgqGCzxZ73IJ0EZyq9M7oeuTdk12HXvUpZ3iUz8
         Lzj+E49zILFfWxR0qYG/REQxG5RMCIEfuwKCt1MSXkNzRC8Idb8da+DRAT+Z8/X7YvAi
         ju6Ha/C9g5fpgLuZFD3Wg5I/oB/otOuGyOCTTz29dcXR76n/c7CuPxEH0rjNmSaIGOUr
         gwWA==
X-Gm-Message-State: AOJu0YyS0VsrLvN43u/ibHXa2sNh2oFOUscMTGXMrM96UF1QZVbehThZ
	V7MmyHRiEkFb4oDWjDRQD8lbNQqAZa7nL0mnKNU=
X-Google-Smtp-Source: AGHT+IEnn7PgxM33KM5RP1Ci6mhXnj/c2aTqDDpc6C2q6ZUyTtIv2RFBjSuVzvHvDI603NJQeDoz6A==
X-Received: by 2002:a05:6512:2316:b0:50b:f30b:5499 with SMTP id o22-20020a056512231600b0050bf30b5499mr4430231lfu.80.1702407259047;
        Tue, 12 Dec 2023 10:54:19 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v20-20020a170906489400b00a1de512fa24sm6617766ejq.191.2023.12.12.10.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 10:54:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8550: add missing two RX Soundwire ports in configuration
Date: Tue, 12 Dec 2023 19:54:15 +0100
Message-Id: <20231212185415.228003-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SM8550 RX Soundwire port configuration was taken from
downstream sources ("rx_frame_params_default"), but without two ports.
Correct the DTS, even though no practical impact was observed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding fixes table, as I am not able to identify whether this was
actually a bug.
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 17c4f0a7638a..1f06fd33d1ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2109,18 +2109,18 @@ swr1: soundwire-controller@6ad0000 {
 			clock-names = "iface";
 			label = "RX";
 
-			qcom,din-ports = <0>;
-			qcom,dout-ports = <10>;
+			qcom,din-ports = <1>;
+			qcom,dout-ports = <11>;
 
-			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;
-- 
2.34.1


