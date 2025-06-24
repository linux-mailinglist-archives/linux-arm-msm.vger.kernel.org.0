Return-Path: <linux-arm-msm+bounces-62206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA5AE6501
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 14:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A5840185B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8515F298249;
	Tue, 24 Jun 2025 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLy2KAf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41484291C12
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768184; cv=none; b=QXYF24ddHOTLZhzucDZR4JDDGocQfWPpI2827wEUEArbcgvCwI7yZZCVrhESRnhfdCg4KnNRbCv6fdpo6FB2wlTKWBj0vnAM1EEKcdJKUGrYqa5+2NRxU8Y8oenCZcb0+N6GQ6HZFCd6Ln99vkutkC40gJqKUDQNVt2N1lHo/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768184; c=relaxed/simple;
	bh=tk5me8Uo9bpIzNKntTtMT+cM4Cb5YcZ3GuSYHhb0qxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMo8No/pargPQzc8YNaEDi9rPKNNWTECJEC94CxCKwnLbBG00TmRgXnG0CGcpBbwcADau9rDYcoZwIBRsz9OW1Peu+u7KsXPsy5AxovQwBUPUZeXkS7nwnKX7n7Q8aOtrmL1KE+eDLv38ubYiUmQF/dRDLYVu0zfhJBFVS/RCVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hLy2KAf9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so325287f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750768179; x=1751372979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8z72Xk/UQR8s3JCoKhbizomWVQUM7xOfiqftVGVa0M=;
        b=hLy2KAf9k5PsGzVxG6N321kxYZuaCWp63iRrakULfGwHhJg1h3podUmDb8CxH7YfnY
         P0v93f7DmoeFVhugKPs+jnL+VuAqTQ8BMpZ2UNFfDhi8viQTOsQkeNQLAvcw98zkWuIn
         hM2Z0RHGiVO3yyVopCRCMzFNIV38yPJAJxFT06H/1l0XgbqK6w6CWnN3t3GVI+RCzeiy
         nUNEdZ7/ZjD+ehWoA6SR6zA6lRwXwH/ZS/KSaWcZYa7qjYkMdIy9P25VjxLr6wOHElDj
         jT1329mgiwlp6OzNSEygeqdeP+LvtJF31HVBZl5K+f4nlnAfvAI+xPArAxWv+ZCPhamm
         Gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768179; x=1751372979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8z72Xk/UQR8s3JCoKhbizomWVQUM7xOfiqftVGVa0M=;
        b=PZTz5gf7ZeQtKo5NPxBGu8XQqp9ln2uKkCJ4fDw0XsAFdjKb0vUnO9JEydXRCq8HZM
         czbu/ZsNdtOPjFYJegn/9uM+NQoqg9zn8BLkPJc3GeXozse2gQK0fbPkC9D0V+sEEFm0
         RNG/qoOruM4AOpsnzk3mqWwTnNgg8/NtS+eErdYMY1mpwZudG/qQKjEJj+fT7KUmq+N/
         XfzQ8YAvXpUkXmMsdzZSR6jzcPkgkVZL6w/kHzJvnHw0lUEZMwMDM3SUM/lB77tUnFKH
         nv5j7udWbOvddYNTuwX0Ga7VX/npLAyf1jVdkGJpO4OjSxtvT8imR+MGLU176pI+3szs
         LlDw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Ny/sNsZ7tTMqbHpbt0OtyuEDDka4aJ8IYzuG4f2JEQ2Gg5qSOKir1fjZaDDs/fNHmRsMtQ3579iMckqj@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJyjB/UMjiIRBRXMVpIZiKS8foX/1UyLnhDeXiWoDBnx86KxX
	6x3+x2upXfqU5W0lvSW3ns3ElwMIIxAEAQVCfqmSIYT0BUsXEhO4MqIDdyDG5x80AZc=
X-Gm-Gg: ASbGncvw/vv2FirhXW1DF92yyTuLP4dGTwjsnAqeIoxwNb8Zhcz2J3mLhIKF9J99z6F
	vML4zPQKZgSF5yx6BhJFs/jdjhOKznA1lCZePKFgrFT/CVgOxe+xUdN1qxnax9DVdPLbgenQgFW
	DaWjgE+qbw3UVQrB7o2iOnY12fNIAURWdn+3XcpGYvdYreZbIFAAToQ+2WAUCFZ0i9jmGf6+/8f
	3yBPKxudPpH8xj1bK0fLFvHnemJk91NlaUv72wqkQ4JxTc5nbA1rmdDY7Rn9EVaPd4sm7JYFChQ
	+pxKqV6i901INlupCxm0X3jCxS6iUtKQ++J4Nr35OYr/zXTnvjyrQflpWauV89kEVrXh563jHRE
	5mLSeQCc=
X-Google-Smtp-Source: AGHT+IFHsJjw7S1n5plNZ6prP3gOPmZZg2elF58BZkzaQ51gZ2FoYGybedifRMo1uu++mNZdpaalmw==
X-Received: by 2002:a05:6000:230e:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3a6d1185238mr4945874f8f.0.1750768179508;
        Tue, 24 Jun 2025 05:29:39 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051f58sm1899941f8f.12.2025.06.24.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:29:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Date: Tue, 24 Jun 2025 14:29:34 +0200
Message-ID: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tk5me8Uo9bpIzNKntTtMT+cM4Cb5YcZ3GuSYHhb0qxI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpote8z4iv4bjWIG0UeW4eGTUo8NnG2d502Yt
 AXLXLw+rlCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqaLQAKCRDBN2bmhouD
 11I8EACDBePA7awX8UOJtFcjhDnyLPagf5PiaMTbrU4f+mFW7o/Ql6FomEAVI9AA4DyE7m+X9N1
 MByvokeP6qP6R8aTa8CefTj9y5DraCxwFTyNHdRvCAhatPJI3EnzLcLi/VlnVhY45lgr6Udh1EV
 8sUvKLncuG+k/6wfhuJlF6hNt3pIMgsZofx9PUBXyt4sI+xkhuKOmSf/bKil0yQND4adK0NgBiE
 3F9f7yL1JIkdrF4ypJiyf8W1b/VHyOnRDQFs+e1WFMj1YtjOfcTAH9b2XZ6IdiDL8BC4K0Dq2YU
 wIpUZSJvbyJnXsVCHitVwiJuZIVMBNXubh3XhAVFLDM/hn0M5M0fmFZArKTHbBK6QM91DF0oNsw
 TqaepC9wfVLpwLjnlxfKuZFN7A1BEyJtgpsV/H3/8xT0erWlMB8BvuuJXCCs35i+s7jahpj5MeI
 hogdGusmwPG5KdlzU0F3SfA6Bov373klUvP3PUOqpoZ8taE5jKe+psg4JtLBNxvYtXOLtYmlEpX
 7Whyrv8crZDYnDsQ3GS0OHWV/NCB2oxwqscfSM55JGfi4mYuVZ5NG2vzvS80dJSV+2nBKUjjYGa
 qbZg93gy09Rf1C/vJRJyiW+H6mFHPjMUuaD9U3Q/Jw0b51r09PCVkFlS0JuUFHH9bz25ck+JF3c vD0g5pAGdnswG/g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add support for playing audio over USB DisplayPort (the two left USB-C
ports on the CRD device).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes since v1:
1. Rebase (x1-crd.dtsi appeared)
2. Re-order cpu/codec
3. Add blank line before status for mdss_dp
4. Tags
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c9f0d5052670..ffef25719f27 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -219,6 +219,38 @@ sound {
 				"VA DMIC3", "MIC BIAS1",
 				"TX SWR_INPUT1", "ADC2_OUTPUT";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -1124,6 +1156,8 @@ &mdss {
 };
 
 &mdss_dp0 {
+	sound-name-prefix = "DisplayPort0";
+
 	status = "okay";
 };
 
@@ -1132,6 +1166,8 @@ &mdss_dp0_out {
 };
 
 &mdss_dp1 {
+	sound-name-prefix = "DisplayPort1";
+
 	status = "okay";
 };
 
-- 
2.48.1


