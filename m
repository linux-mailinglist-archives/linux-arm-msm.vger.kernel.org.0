Return-Path: <linux-arm-msm+bounces-40267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657F9E3BEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2F9286007
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA101FECCF;
	Wed,  4 Dec 2024 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOJS4CjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA581F9AAC
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320837; cv=none; b=IG3iVmbuzKf9P648I+278u5tsQBqzQgzyrcmmYlsaDNlx5/Zn5YGa6/e3L04iqEDCaAG8/EYAoNMSVBCwL5gmCfGQEfq/JH9KMTVZxbVjyIujCSrytAYaRC1W97MKUwn5X8hWxWItB+DnFL4W+hwp9/G/N9nozfKtYvDfxMOy5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320837; c=relaxed/simple;
	bh=REvlMMxx0XAJybhZSmB310utOAbwLWPvmzpZTyrvIuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsvU+Dtb/6vemwFQGL2iPo+NM1DGW/wbXsBJhDxM8kjFv6kzLmFw54R670TD2SMekAV3aaNO8rDsJDAba6qlftz31nMeB4IBHs2RGiN+JDMp1O/aSvyuyZOnResSYquB+K29HKDBNW+FPHhrN3dIGT5ISfa5bWud1wFqV28ElKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOJS4CjN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-432d86a3085so57834995e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320833; x=1733925633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=JOJS4CjNkh+aw+dEJeFPZcPYIvVVmMnDBdRJJaftoCTwjTkMDrmc0gzggGU0KBQnt6
         //oYfGDy6Lnqz1YJynHWz+GPYCFUlnjEmtiDEDv1YFfRvntSFdpvXGi2wqWTlV1OAsYI
         9z5ZzU0E9TlLRwiQF+/IIjZYHrofMjqSNW/ryfgNSlJcdbpVfQJQHN8oXouvZJQtsAzf
         l2iP3dJokTWIYg+BT43pEq3WvA3qCLXg0iZRwM29rTk+fVZ5tIfPEUiDNNYPhXxf8yPm
         J2jiIb8Th9zhMkdqpbizYEdiiVdN4PanTGvUvL64gOde0xEfFqliTMY/ECrdiIz48TPv
         JK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320833; x=1733925633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=K9OscWIxmTb3dLap94hGFtCkYbUw0GzkiZ+hfa3xYi4MK9xTIXc1ZZl5fyKXZaIoE3
         fpFi2PdtXLe1znukuSPdXr9S+77jY37+DUWDUraMEObui+SC+YE1NJRmdJiv2dd8XufW
         QE148Jt+NA5fx00ZNg3pcozwf0tklY3yC7Hsy3qamRvJrEj2I3rwwNgYF2ATM4hH/ZZr
         ydr9nV40N0Toue82hjhK70VcXnFwb97rksOr21ppvwEIYA751XMDM9mMJuy1vUDmT2Q7
         FgllA0kZxmHlhq7wrq8ayj789aKfH/UPtIHuH/IOPTK5Q6dUv0iIqtCCwZHeKgLO+zXG
         bA3A==
X-Forwarded-Encrypted: i=1; AJvYcCXOmLxb9Qb6WdMpJxfBudvPV2lFi2Bc2Ua3na3EI2SaO4sje9rFW34qTVUK/bPBNqn9xJGL4HxOKXej70ez@vger.kernel.org
X-Gm-Message-State: AOJu0YydYCcNCMS+osopcYOTjVlAMqEwDnJKzW1BKMYrWMSfFFdJrjQt
	Z9kUhofPv371dxaa/U/x31howdv0KZAtGfv5G+0TPSWAwa72OCjG6L9scYAY4AA=
X-Gm-Gg: ASbGncvB84rW7SPGcEXOKng3iqb8vKxqgy4lHHgmpJnDWZxfCvdKscfgh/kaOancRrX
	Xiptx7GNT7+V1M5oMs6L6mD6Mk6t6rPcCkvmyLXJM6cn4MONZrZijYwN8VZMxgIwIytyT5kWlxK
	/meNl/gDBh/UQdLb14t7HfDKQDwE5gOdwGNmUHYHfwZ7+e/1X5pW+L4/0MrthSGTYQBz2u3NJEw
	Be/pd7OcbFiGrJwLLLk/Sjdyvuenrey7xlaT96+seUQWQAHxQu6VeyKgKft5zvXZh8Vp0k=
X-Google-Smtp-Source: AGHT+IEhbpa9f+P23WmGe+eMo7IUbIQGX/UUlmqDiHg7PK8H8fusSK3gTlimkg0zm5RcyUlNRq/QLw==
X-Received: by 2002:a5d:6daa:0:b0:385:f195:27f with SMTP id ffacd0b85a97d-385fd3cd094mr4427049f8f.5.1733320833194;
        Wed, 04 Dec 2024 06:00:33 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:32 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Wed,  4 Dec 2024 14:00:26 +0000
Message-ID: <20241204140027.2198763-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204140027.2198763-1-alexey.klimov@linaro.org>
References: <20241204140027.2198763-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2. QRB4210 is based on sm4250 which has a slightly different
lpass pin controller comparing to sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index a0ed61925e12..cd8c8e59976e 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -36,3 +36,42 @@ &cpu6 {
 &cpu7 {
 	compatible = "qcom,kryo240";
 };
+
+&lpass_tlmm {
+	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+	gpio-ranges = <&lpass_tlmm 0 0 27>;
+
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pins {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1-pins {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
-- 
2.45.2


