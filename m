Return-Path: <linux-arm-msm+bounces-76367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C261BC4692
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 12:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34329350C8C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C532F6182;
	Wed,  8 Oct 2025 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ho6XeKt1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4472F60B3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920304; cv=none; b=Gy4tk+iavfsNvZs1qnZ1hJpUXPaMZ4TCwOyrsD7tlyl8R34/Xs69CVn+YFBe5r/qCBUnfJXP4vHP89FtatvI+e5rWyoHUcQOq/IMLYnbK/A/oNfinfrSOROL8ZN3LIxKdLPlR8HCzecJscjVLuoN3DRs4i+M9Fw2yCN9Xv5mLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920304; c=relaxed/simple;
	bh=F/3SDSnCTPJ5R0aJCqe0TNl9koObzQspog17xqvd3fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLD2eC16Ywh335cJGakFU7pp5/M/OLPkVHNs31u0JWuy2PTuLr9wapN5hwziyYRXDq1s2QFC1djLU+C6kl63r+mZpQuY4z7AVmWZxOdiNN20nKUHRt75Gs9ozkAYa/GZEXPZva6OK5QUJDPRPBGGHPOpJ7SJVatjfMt9Ui9FbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ho6XeKt1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-269640c2d4bso10792135ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759920301; x=1760525101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uqzprGMb0c1F9PzyQSr/KsKGC8sUWJiY/UfksYRhZU=;
        b=Ho6XeKt12YeixC/jEN02LnSrdOB1ZKXaLVqTPALWAGGuBhxK1wpQUgaRghrjyE0X9T
         GEumDn2x6S8t1Ce1dTe7RKA+V/aJanhFnfBMSUDVtdqjbFbWpx4H6ZAcv07T8/nex2mh
         HgXzup8KUxSmP013Q58dVNZeWrLKkXSzClYaBIIY4ODIGOAH4d+4bsZvixnF/T1UKXSG
         m430UUxYCtGTZ670Xy2tzxqz1hdMjVIxI/bajhddqlteKR4fI5A9mnpua3e+3SFTVqaF
         /auYN1RswKH/CfklZWwq84eKWvrVZcTLHBQw3a82likA0QCcXDf/ORkUJ0eGau5vicun
         2L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920301; x=1760525101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uqzprGMb0c1F9PzyQSr/KsKGC8sUWJiY/UfksYRhZU=;
        b=ScufPfWKcmwu4AKNXKBV79P3oqUa/cVCFPc/Zah05fUaW7Hww6FVLPzokyxQCthA4n
         zKUR9L/vYteEl8TudCaNolLpNEDjgAIO4aInXLy5DHfjIMSuvA3VlTjT3C5+Z9FTPaqr
         XAEcl7Sb6xqKz4kxF/mqJ+eYq4x0OFk+Be7KFpKNOP2MnrjpDM6Bd45ZKhqoIjcoBIzO
         m65mNQxWYYd/L0D0jDoZcS4YSvXsKg5XQndOjGwyVKIzqNgOy+0ss2nVoUQREv2qa3xE
         rblhH7TSqTsMXIdANBuNsiip2bRBhYPqpfpUUga2UsIJTDiFktVrXWResqVzBDYu1vyl
         btPA==
X-Forwarded-Encrypted: i=1; AJvYcCUu0V3sECMZE+Xel8kGyJnQcAwXq4R0ueDC85V8Cjmv0d4TBv75j4XPJbQ2ONjNus4XuxY35qqbRt20mAAG@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+BHwYMRlrn2BE+rTQDsN1ocuhmx6x3O2JzzqwBHP6g1RvZBt
	rdxpdtTLyTjK5w4S8VS+jhRy++kZMwaDRHIzeJc9B6gTYivG1kEDHp5ZYhgikvxe3OI=
X-Gm-Gg: ASbGnctfKlIXcPXVEC50+e3St4bf5iiPuG1Kt5gKg50+wS9wLzerhJ91Jph33If+Qb9
	8bc0hCZs7hLKquVnm2X2nL1EGyh/VWVHq7nQaeLgWWE/QSJgiAkl/Nhyb4IbljilIH7QZFRB+CV
	9S0OuIGMokmd5e5rrgfsBds9OZ80CfkJW6f8SJBKHgtfyU9A1RuI5K8nkj49CogxV+nxR7fgwyj
	j2zfDAiuSUGBPzU6zKAe+WH+5TXTpAUYj99gEGXU5ty//pGPoEq7qfslvR+fNe9qrL3fN4Q4Y8d
	OEuUktmIFtkIkOirBLFpp7zUQhgJQQtB725i+u+bjvTewSeSnwTugM2faeN+YKd7x6LbBIviPXZ
	umapW7qp74Juhz9j/G9P3JmT1rLRdEM3ETIU/nciMCd3cVPEJvp9CJC3TaRTl
X-Google-Smtp-Source: AGHT+IHrLX9RbBOpvVqA3cJqDf8szpNGBJuW1i7M6GF7kGam2olRVH1kbgH2P5szP+gjyhnM7ZCWUw==
X-Received: by 2002:a17:902:d4c1:b0:25c:b66e:9c2a with SMTP id d9443c01a7336-290272e3d33mr24052145ad.6.1759920301321;
        Wed, 08 Oct 2025 03:45:01 -0700 (PDT)
Received: from kuoka.. ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1127c7sm196117135ad.28.2025.10.08.03.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 03:45:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
Date: Wed,  8 Oct 2025 19:44:49 +0900
Message-ID: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Speaker Protection is capability of ADSP to adjust the gain during
playback to different speakers and their temperature.  This allows good
playback without blowing the speakers up.

Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
and sending it as command to the ADSP.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Add Rb tag.

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


