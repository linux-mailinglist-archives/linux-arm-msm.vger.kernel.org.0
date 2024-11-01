Return-Path: <linux-arm-msm+bounces-36669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB489B8A79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 706EA1C21EA2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 05:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7280614D2A3;
	Fri,  1 Nov 2024 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2BFlKow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3854E3A8F7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 05:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439123; cv=none; b=XZmVu+VHBFpLqaxZ+vi4UtDLeSEtU3UoxGpGs/zPnGdKAQQnzDo6muNQbxo2mbwfc+SNWuFQrr9ww/bXXIzw5kDSgWBt0mlhHdteV1UiTDMjbbQGaWiQbbjVe2bsQm1EqS6YaLzb1Zv4zEM4W4xdQFqtvNCyx2hWmqKaoPseuWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439123; c=relaxed/simple;
	bh=6c0ImAxpls+T5z2bpQ9Yl4ZdWHui8yMGQ0RY/fek5lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEKp9ttxIFNBd+9gJOxgLHWe81qXG3tDAPaVk+ifeoFD4vqhIp6f2icEdtpJkUjyOSEBa4/C65UlrASSysRXc2OwUKg7gJTrZmw7Hb0+ikPir6aoUKSeKO+Q6+N6JzGYP71OmHgWw+dGDThoz8rWLtapNz9zb7lFTbID07vIoIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2BFlKow; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so968589f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 22:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439119; x=1731043919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AagxMQSTeepIIRbJkNHGMYKTNJijkgoWpQ4x2Maii6E=;
        b=z2BFlKow3SzRncajDgWooC/DTyPN3MbU+2BUgT4t3JnJphPdhkl5tDrAe5lRsPouLC
         sfAyaB7UAev4A7B6U4hAUBPtoIIphlXWApQu9pd+ioPb3xfV04xfSam0TAHu6SMCMlnC
         5PHdMxG8b6YRxZj9eIq6rtEME17T1ke1mRZ1EhedSQp2N/otTmvt5W9uibxMBZ/c5MI9
         9/Wr9W9DfmDpWs/u0ZMWckAiya9egKCD2FeJnCCzsdp6WaTJQJDo8j7kM49YAbzWZcnY
         Vr4jJYnDYV+tYu4YDrYXYc4BgZlwNmhEaq6MKg91dzIO0ukZlMWDGWHA4vmRDQJj37P6
         mt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439119; x=1731043919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AagxMQSTeepIIRbJkNHGMYKTNJijkgoWpQ4x2Maii6E=;
        b=ftADKAi1BbeJsr3Dx74PJZG7eXEpy3rSi6gPc/nMA3S0vJq1Rs3DIT32Sb22/xziZg
         i6ob46gTM98OlWI7wd8y4hjGVmSV+FrxyBs6+Gq47Zk8upQZd7p9bIrdhow2gRyQvKFk
         o+xrQIkFUd9lpjXx9SH3MDsPNYPts+S0X5paab/pA7Wd53os3zQ04KemDhJ+TgHfhSJz
         FTtnYiw3Yw4Hhm+Lwvrd02nJbWFYuEnopqTn7KI587NbVkyyvjX/PoRoM07WceXAl7G+
         rgQdIL3fqtBunCKunENATZsUuNk8vCjpLtWZ3uueYlhIOROm++0O/RfzyNNc/4j+g2Ma
         pdBA==
X-Forwarded-Encrypted: i=1; AJvYcCU3OzR4ioCjookdkB0FDkR3MXR78ukF9bcpQVOtr3PXadvSSHg/ztpmEid/guhj45fztB+qsvQAWGxA6WjI@vger.kernel.org
X-Gm-Message-State: AOJu0YxgDXxam1BTryDp6R9pimzYaUelZdbzg6PKKFbnwErDaSdVGGsh
	orPy6ubYAZPxIJ2oAFx/cxggRoQadRCFMxp1+CbKN5In5ogLgko8xGfDtvezJjQ=
X-Google-Smtp-Source: AGHT+IENmFZ2CH0DtPNo/eS9oAo1+rJXuWpBueUsCl0BOJBXfwA7xhWdqjWkh69ceSQdQ5+HnDh0+g==
X-Received: by 2002:a5d:5847:0:b0:37d:4d3f:51e9 with SMTP id ffacd0b85a97d-381c7aa451dmr1773039f8f.40.1730439119587;
        Thu, 31 Oct 2024 22:31:59 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:31:59 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] arm64: dts: qcom: sm4250: add description of soundwire pins
Date: Fri,  1 Nov 2024 05:31:46 +0000
Message-ID: <20241101053154.497550-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101053154.497550-1-alexey.klimov@linaro.org>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds data and clock pins description (their active state)
of soundwire masters.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index 1b9983ab122e..8873015c05b9 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -37,6 +37,16 @@ &cpu7 {
 	compatible = "qcom,kryo240";
 };
 
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+};
+
 &lpass_tlmm {
 	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
 	gpio-ranges = <&lpass_tlmm 0 0 26>;
@@ -74,4 +84,40 @@ ext-mclk1-pins {
 			output-high;
 		};
 	};
+
+	lpass_tx_swr_active: lpass-tx-swr-active-state {
+		clk-pins {
+			pins = "gpio0";
+			function = "swr_tx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio1", "gpio2";
+			function = "swr_tx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
+
+	lpass_rx_swr_active: lpass-rx-swr-active-state {
+		clk-pins {
+			pins = "gpio3";
+			function = "swr_rx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio4", "gpio5";
+			function = "swr_rx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
 };
-- 
2.45.2


