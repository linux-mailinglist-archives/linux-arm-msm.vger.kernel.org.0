Return-Path: <linux-arm-msm+bounces-72019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED405B438AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE9716222E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A732ED15F;
	Thu,  4 Sep 2025 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtl/90RX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42475481CD
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981567; cv=none; b=mgZpqGj1IjJ8WIM7Wki/WSbAqMKaoYvXLMzr/ksmhz/Er05Y7DyEbM8nuUtAVqgc9dRF6AmxZwzsdi/93uB/DC07KmgoPKsS6wPWhibJeuS4rutgH36rdW1Bw3vai2Ayemikgq2HK1b01mfFm8+nAI7Ou5dgmfpMv+8Yej0U0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981567; c=relaxed/simple;
	bh=BI2ZP0T/2XRoH+M4+QI/c/CiOCDichYufqvrnpKIP2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nneqvu2YKTiNiSsNpvKep29wAnvaUsyxIcxB8neWYayofzLi01E57xKtDvxqS8VLAZgQ6rvy34gEZH4Ir6C56foMOntxUJYVQoikg1wheEJ/2gFql1NIZiTDOcNWCAoQ3laxi731L5U0JENp2tyQyd8rQKNfeGnYVU8wxfrjYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtl/90RX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61ec7a9a002so143528a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756981563; x=1757586363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UW3bkHx1vvQghfKXG7aIDgCaJXMu8LRQiFsEscet0eY=;
        b=wtl/90RXSI/+BG1hs+zM0iznhWQ05giQ7GvLqbNlMRPM3QJHKMeqUdsMB8PHJL3b/d
         DpmrG4JTClmdrc7zcPTIPU+htZ9hxYfLtWm78C8+HCd2kGgKTh4ILbFk+YSPXeLUKhKL
         IBmhRsNH2hp/yNVKgxhVmE3T04kQaI8VyVxUKgQu4tAKajAT0b4WaCtiaHLf1iGcaCdn
         4qOXrbgajl/XmmJesEf49yCLjvIqt0Mnnfa5QBr3vDboPVVp9O8AoRLrFZWGinzinTmb
         uje5W5OLT9xdmNZ+VgNtc7wB+HbT+E3ecDsTQ0PdaT29I3DimxRsqhkOv10vLBusuOS0
         jabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981563; x=1757586363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UW3bkHx1vvQghfKXG7aIDgCaJXMu8LRQiFsEscet0eY=;
        b=JSqVYyzcTXIxQ86/qzMcKiN9gOOAio2M0BBnk5bO5fyUradNPFpWmlrSIWaEv6iJVf
         aC/9RpHXcOWeCsFCeN1jBGOX2jXzImHIQcmDWlOblIVJfcnjYJk8B1cBnFfM+IrXjjbX
         LmnjUMGoUSjkSWhAOukjo4kMoPVLoDEgV/Pp3NS2uRjMBFiiWJ15CzljJzEM0XkIhFiH
         pY1vPmNMgQ8ucGy4EIs6s0GnqXC67Y23MO/4wjq5SgL/XIVTB5WPM4N3a394HyWYxEtG
         hV0RC/chC69o1hyp4tzz4i2zznsQDm+0oANHiPjx2ViWOnV83slZMNMIA2hALaAgQlgA
         f9dA==
X-Forwarded-Encrypted: i=1; AJvYcCWxI0oQeRSHYtF1S/VYoTUV7Po37Fba1Q6QDloAB3ZHv52o3NPSaYmgyHXlTJwraHd5FZF8b6ZuTW0wD3wN@vger.kernel.org
X-Gm-Message-State: AOJu0YxWw72kv2iiWpPHo7uRg9eEmeAuYs1/D6A1y163m89hppw8G0GF
	J8AEmkOGU8hX7IPhCRv5jNlirtUKZSYK10xSUBpZPXFVmbpO6ybwfTFtYn8vfIMilb8=
X-Gm-Gg: ASbGncsEh1OUxw0Xoy+srcim6MrLNLMc/KyBTlu40+KuossqDMXy+PDFKd/mahgTmaN
	brhel30U0dCAL4jhPSNAjzX5LbeOOixla85GaFdWRBNGuZS/Qo82wmnAcrfWSPVIG3wMfErHakI
	t4aUt8mWlGmR/1dNyfUMfa4wbxF7SIEgSGnS4t0ggS6hsagNreqBpX0qvJEy8I5xJ/wDjncu7ny
	c/cCblfhBxw30gIyVOXAu8UL50ozlJ5B5sr/ETYNYd9DXLT0kG20dDjxG0NYQfvLkC1FU5WzJ8w
	uR1iHIu1l2WRsXf+lSeilti3kZBkABNfc2h0OKQS2IWuZpTtu2Hv/iD0kiGt4FWrfFOBq+cuue3
	nLUqPhUKGPKKdrpY7n4h1n1r5omyQuMc3Cg==
X-Google-Smtp-Source: AGHT+IHeVQhoqHiq7M7DSuYNRekdsgwKuToJnU6OnuZ5WZbs+S98q8aT+92pCuXXZAfHE2RtjImacA==
X-Received: by 2002:a05:6402:5203:b0:61c:484c:a533 with SMTP id 4fb4d7f45d1cf-61d0d2a91ecmr8967545a12.1.1756981563564;
        Thu, 04 Sep 2025 03:26:03 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5306e6sm13887446a12.47.2025.09.04.03.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:26:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
Date: Thu,  4 Sep 2025 12:25:59 +0200
Message-ID: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2761; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=BI2ZP0T/2XRoH+M4+QI/c/CiOCDichYufqvrnpKIP2A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouWk3+PRBfkwRoqp9LwmJsk3WZeR8OgXnneZHH
 9jz5o/j/D+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLlpNwAKCRDBN2bmhouD
 191XD/9gdZ7c9cSgx3T+L4BF1NnAK9sXKZbTdYH32Bv7mnxLjRg8Uf8+O7S1XCWf7xa2HE4EUxD
 0j6dyaRNb9YZp+X4C0+G1NWdMMjR3HBDPToI3j4eE8coWnXqml+hGZm2x6XKPSRVUJ5vmsEHXXy
 DGpHznm0gOQIoiv4KkF7rdH9ObEw5NicG/IlA78DLe5vgYVNfiIE+rHf9Nuel+28fGHXLfxojVS
 iz32ojyV6fKMIamiNMxx+gpQEXLaUWlF4JdOwpB2PGly/M2/nVpAQk30JAhE+uhQ7PBGoL5UjJH
 wKrEkqupzUGI/h5w7HtxnP0ZNIhB1Wyjkgkfc+B8vtfjvyk/kc/9NxfmjvlnNnmDehlwxHU/WWB
 YRSgNIjLKvMfGgi3Cm3UoIoOc5O15KJjjBOkVSCXmLxC/dmvZBb2FJgstsnLF4bM4kFTzO91sUI
 ms3ZPyUlplK5X1qsuUNALw6tv9fez0MFudS7W0nmuhJbRSvK6lr4D6Wn7ytxF1vQ2DI7kcJpjly
 giT+rfzDo1Fvo/bkSIHekPAxRU7+hLaPzfK3y/vZtUAhVDOWsA6qsZ4xJTzQyi3M1CDabgMPoGp
 tLjBTmO+pCzV+zbR095gqWXD19IRN199ERkQ0wRgXPizKZiQKlTw+0JCB469hTkI7k72L8C0exc ZCc9HmzsDQ1cI2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Speaker Protection is capability of ADSP to adjust the gain during
playback to different speakers and their temperature.  This allows good
playback without blowing the speakers up.

Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
and sending it as command to the ADSP.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add and use PARAM_ID_SP_OP_MODE_NORMAL
---
 sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f4c53e84b4dc..3b7dffd696e7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1250,6 +1250,15 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 	return rc;
 }
 
+static int audioreach_speaker_protection(struct q6apm_graph *graph,
+					 struct audioreach_module *module,
+					 uint32_t operation_mode)
+{
+	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
+					 operation_mode);
+}
+
+
 int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
 				struct audioreach_module_config *cfg)
 {
@@ -1299,6 +1308,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_GAPLESS:
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_SPEAKER_PROTECTION:
+		rc = audioreach_speaker_protection(graph, module,
+						   PARAM_ID_SP_OP_MODE_NORMAL);
+		break;
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 790fba96e34d..9f6ddcf081ee 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -542,6 +543,17 @@ struct data_logging_config {
 	uint32_t mode;
 } __packed;
 
+/* Speaker Protection */
+#define PARAM_ID_SP_OP_MODE			0x080011e9
+#define PARAM_ID_SP_OP_MODE_NORMAL		0
+#define PARAM_ID_SP_OP_MODE_CALIBRATION		1
+#define PARAM_ID_SP_OP_MODE_FACTORY_TEST	2
+#define PARAM_ID_SP_OP_MODE_VALIDATION		3
+
+struct param_id_sp_op_mode {
+	uint32_t operation_mode;
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
-- 
2.48.1


