Return-Path: <linux-arm-msm+bounces-76102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F1ABBEFEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 20:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5D1F4E3668
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 18:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0299A2DF13C;
	Mon,  6 Oct 2025 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOBAWtz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCFE2DEA96
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775854; cv=none; b=XXh6z9IOcPMnsPqW3qF4OSb1dQuqL3XEP+dYFSp4I2S+S46VnaKKXvwgkdFpcwvkcFo2i4qFHpB24/Rgi3S5WCDJMkVvTX8DKbeETYlkRebhmQajzhIN46zzAkybtIMezu87UrSzYXm9M47LddIsecw5VeuFMC3wxqpIk0u5dQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775854; c=relaxed/simple;
	bh=zXvVqOY+FmkLEkipbzYVu9WiK1E5b/lEUQslscbETwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0RJ3gJL+RdkMW3u05QlNj1pguexMS8STzw4fuOg5rH6gCgEw1DNZKx96nhTxjL9SxxFE/zkMipnGXOKzpmAvFrmCWfO8p4KOIL0kepCZ13v5HQetNRjuNF8TV+ksKC1OHzrAbAWexpVWj4BtyqJtoSOqqxXwYHGwzq0OVKbOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GOBAWtz5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4060b4b1200so4648871f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759775850; x=1760380650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnX5XErDx5O3zbBQ7ufQmhBI+YSqvg4f14xs2R71brc=;
        b=GOBAWtz5AJ3DuuRSv+O8vCaxdolOVa7Fy8opj6vg9Y6ogfjRwbgcEl/eQfl7wwnw4l
         Q4/o7GnYZkCc97fd/H/7MlvrDIU+qMnN1vPnk/UokRdePqsYlGR3xITlpbWNVYLSs+ZO
         n/pcJDvG+jJKkTHMp3O6uqgYrqfGYkEmtICjNicXvwbZf/8uJVK7eUms5aFFOlde6uge
         Fi5DOSTbOFE2yspCQuhufyefiw9oly8Ffgaoxf/isDrkH+JCkNZ91f40yVa0dig3eUF5
         SnXBxYFgQu+EBguWYYw1fu/8ai0WnTu1+boc8/FGE9mjF5mxtu37PxAGL5GzsGr/EuYz
         XnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775850; x=1760380650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnX5XErDx5O3zbBQ7ufQmhBI+YSqvg4f14xs2R71brc=;
        b=RIlfiD0gsffJ53vkFmSypnwuFKaLA5e7dtiWknrg+qbnvUgVSEBeabke6oU1d5J6Wo
         esrdhnYNthUY24/Q0sqWAIXoKO/aJXqDevn/n0JmdQ2FkRlAtC+cihRbTetPWkKMXm8w
         XRqTW4k6IRXmPdLPib/oIENJI7UZYlng9JjhYAH+fMizzpZFWW6ht4T43HvB67uwI0Qb
         QAC2r4d+fLAo0vdAUAb41pqHYLudrrSvCV/YO+8bZWMn91kbqZkyy9VVxMkNlQBcFPWV
         rQqUh8nuPgO4rEn3PJLqFvpMQAR7UkcxuvJqpd7JWxPDZS8Qx7iyutgUeih8kODqf8g8
         qbVg==
X-Forwarded-Encrypted: i=1; AJvYcCWfOKExi5lYUrRtYNa68jcPWohFpaMk0rCL1oQXtdkLmz67uNC0RnKgOU/nZoANGXZ0pJ9shkVPJqTprjts@vger.kernel.org
X-Gm-Message-State: AOJu0YzpQc9UXwYaO7SlDJM/t9Ibo833yee9csddX3YnAyYFifTxSIyQ
	qQK3jJbl93jA+vdakLHvJ5NlCgaOYB1xDlTrzfzEG0n1ozTrbhN/J3Y9hnoIHxRu0Dg=
X-Gm-Gg: ASbGnct1CtVoKU4i5rsR3osgVhpqD8Ud475wM4XbaUQFBiJ9n8Hbh5R43Ofd/zXaQ2K
	vusi8EUwooI7IwIYmdp1JaXGxSw8f+cOJGUU1iT2fgCSRCIFqpna1f1U+48qsAcnKXRfnVoOALf
	CXk7nKC7vXGOZoycPCuuJdREj85E21k7k4hxCIPgRbK4CGOJNFU/p6C5HXrhAKdPB8m8mBmDf3F
	KEYPzOg0EeGQAddQELJf8EKIMaiSZocLfZD7I9801I3lJYj6ugKhmCKnDv2FkPxCU/mfImU2Idp
	kgwJ3JTC2qLyJOhmpoaOZWbEv/wNesn4XpfskSdUyn0eKywAeVQ2bzdmyWvlJSCFyXVF1CYckEv
	iixi9AXfcuRM/SS9V1sWan7DU5xYfWpIlox6jCr7lQk4st9X5n6RlfXG3mo9dPkOAg6GV6eE=
X-Google-Smtp-Source: AGHT+IHmiv4QNzGSgUm/ckW+jgSBd7VLloyZLLNL+/yjR4sSGkKLrO/+NrpaCk6W+wa8KoSBCF8W9g==
X-Received: by 2002:a05:6000:4382:b0:3ea:5f76:3f7a with SMTP id ffacd0b85a97d-4256714a519mr8024107f8f.22.1759775850429;
        Mon, 06 Oct 2025 11:37:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a022d8sm254997085e9.12.2025.10.06.11.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:37:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 20:37:19 +0200
Subject: [PATCH RFC 6/6] sm8450-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-sm8x50-next-hdk-i2s-v1-6-184b15a87e0a@linaro.org>
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zXvVqOY+FmkLEkipbzYVu9WiK1E5b/lEUQslscbETwc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5AxkIxmKn5IT1+b4gR0HImUqI1UGtFwwvxZXXk0/
 9W1tRUqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOQMZAAKCRB33NvayMhJ0XBvD/
 4hnkvv1QftgEOxXWgVl6SGY6xgEt37UnmWMdFb5pHZNPt2NpiK30PK3phila+tmSllvcE5922lIipV
 iA00yRuF/EmkF4+6JCbOC7FYu0a3jIDJ2vL9nkPkaIs8vUIGxuxpJQP1sKTviqJ/UdeJwWKJX0Cpvg
 HNsBDQHPRjfSVVkHgfyaa/u6ZgqSyu+uM39s0FcXyjQ5h/ANNpQI1ejDfsTJ3gLQYqRqd/DQH7z3sv
 u0K3KHkYJbDCXLfgM6L77OF0oXe4BLzKcjIsftfzDUxo1jr9+8u1GdwzOCq0tYThHVIf1BMF4EEhM4
 srH5d76BCSsJbGQE6Fy9U1sthvmyt9jj2IeH9c/H43dRtiC2O2QUsycfgHBPBKfhc2X02Weo1yT9ZK
 8r2m2xXIcdbiy0EjPYqxByBWsezqZTrbYetEaOuPAGLcoDKne7puRxOyWReVq4NHj8n8jdVs3PMdTL
 kpXhdg8MsXqYIwqx775ee/93ld8j7C4jCa7MQ4uYaW2Ow5LnRSInUVw0SW0SB1PPd5c+EApHnsPE1g
 LnJBTGXTzcQ08Jq1yGscYHopnBBTu3xSMdrJPSdmAyYJrPsok7UpdQxQqfGx/XZjwnmYz9FTQsCl4W
 SGg4rlHYlP9RRrXPr74jniXK6d31yi1PsWwVDpn9hVIQBlTK6FDXCUw99RJQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 30 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 0c6aa7ddf43263f30595b3f0733ec3e126e38608..c8fd4c8c6bc644ccb5f9fb05c099f27513b86e99 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -667,6 +667,8 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		#sound-dai-cells = <1>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1016,6 +1018,18 @@ &sound {
 			"TX SWR_INPUT0", "ADC3_OUTPUT",
 			"TX SWR_INPUT1", "ADC4_OUTPUT";
 
+	pinctrl-0 = <&i2s0_default_state>, <&audio_mclk0_default_state>;
+	pinctrl-names = "default";
+	clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "pri-mi2s",
+		      "pri-mclk";
+
+	assigned-clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			  <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <1536000>,
+				       <24576000>;
+
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
 
@@ -1079,6 +1093,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	prim-mi2s-dai-link {
+		link-name = "Primary MI2S Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 23420e6924728cb80fc9e44fb4d7e01fbffae21f..5ddc1169e8c23327261820f7baa31983a3eb0bf8 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4288,6 +4288,46 @@ qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "pri_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "mi2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "mi2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "mi2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "mi2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_tlmm: pinctrl@3440000 {

-- 
2.34.1


