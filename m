Return-Path: <linux-arm-msm+bounces-70197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479CB2FC1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AF697AF31E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4A3239E8A;
	Thu, 21 Aug 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yb3WFA/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73B2264B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755785797; cv=none; b=VstFiUxI/D61+j1fmt+YUE3xA08BwGoYAmd2/yCY1DvYqw61pJOfdR9nY0oc5+qZa4CXuicd44tiKSyaxavddJY1BIySEDEAbR5dHPXoggb4UhSUpylhJBRLnU4A12w2vsni++uKAft2f054tONwiCuF6fK/rQcFEwcddvBivTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755785797; c=relaxed/simple;
	bh=u1EiMmNicg99wl+W+lAeeTFivMOYtOn+iSGBN8oKESA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OR3NQ+Z/WzzOWmLLGASGEPFiPhpEc2GDF1eg6bucv35udb+1Eh4futN3eVndKnrfkse+38F2wsTofOjWHdSYRiGJctOKl/a7z0u+jY4zCjRJuW6zipK2e/Ydt76GAKgIAVpePAIEaW0+HNtZ50JAnjuvH5CO2xQ2Q4yN2t4HuqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yb3WFA/4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afdefc9b005so17766566b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755785794; x=1756390594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ0k2vcyc2tLT7HH0rxJhVxlznqPDfjw9yG0PRazUvc=;
        b=yb3WFA/4c54/hA2M9uX0H+hfil1+XLhSqJsnwTB+JI0M1llPuKTUQNRfKnlgbr5cw3
         deSFlhBFEv5kCLzvhsWuKljkwJRulqLl3XAqbfV+LPnML6MSgR2m7Pt9xOpZTzOev3jP
         7QPGF3EqAIoUFwZk+38pUwIC/0jkvOAEmr9oYCDuqNt7TvXK5PMVOsR/Bnry+8jdrb+4
         X9uIHHFy/ZjPGQuXmfubP2OwAlGaSE8ndMabRfCLqkmWJBruvLb/cUdy5Axy2aM9jobf
         z+bYnP2p2ulcedgHXlytp3S+xV1zID4ldNvT/BkWCXIFTE/buqMkw+TjwESal/CrdfsY
         PvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755785794; x=1756390594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZ0k2vcyc2tLT7HH0rxJhVxlznqPDfjw9yG0PRazUvc=;
        b=Bzmg0DziL/N7G8UMvJ6Ysk7Irgbh7EUHsinjdVB5zxDqu6prANy+RdbKU8knOFaTM2
         JeqaHujotCLMGbwLaT0jPUp1ZHCscwHjQlT3Cr/9PyIXYZoGs+6XObqlMb9TEdzf1iMk
         Mg4tOp4UdFxwK9h9IU256WMwTJPcpDCWwvZL+kPArdb0zXgR2CkTnMe9qdx+e+Y6pgtE
         V4vSY0QUnmPVTdRj+3oip4a0t9BLCAcpD8PeAB0hNg1ZJwGS6DHHOWBb7rLLBBD0UIui
         nJ76PRo9gK22TcZXdXAJEp4iTdeAmJUccFPBa1djcilryibggvFb3bKsABwe/ly6VpNc
         5cfg==
X-Forwarded-Encrypted: i=1; AJvYcCVNMJbydYQL5bBRaaJkJ54fa4jHs3q6/K9lSoGd1bslc7+0HM9F0WVDgjzXB1oPl/lx2C58wV6Fj0SBGhwK@vger.kernel.org
X-Gm-Message-State: AOJu0YwU7VMtb1i22fzIp02nh6xqPT6zZrL62UyPAy4rd+wzzWSUi3Ti
	8dWPJd2nX/TGDEQvrYMY0WNgb2p9xdwb8SJwdSIAqKINL0ywUU+zk1fLXTC26XxnUKQ=
X-Gm-Gg: ASbGnctZRA1vHu1+/pkPLwOdu84cVPKh/icpGsb4MAR4PeWlDB6ISpnvu3SHQLY1jqC
	l+t8mBuOy4vVNs3FPl0aArvDN3HDa+rhgjn+cQ+P8hYi8xd+JB9vAEg10scKznPC1w/OrIHtjyQ
	jV7+B+KUjK0QKz+3St5HckHZoNKCpXDWQc84X6NIfGQUr2dNVh74kbSHEbML+9GR70yCLYVFgzP
	f3RiqV8CfyzZShZDHoF05HE0KvhyPljQCc8ypAPlj4uFUKLZe0HyHM0USWo8AOFyxrEf8xarBtW
	sm/xXx/Lkd1+pom/3mR129qKML4ZC4gaRxf1EE/UpyGzAwH9qZu/vuUvWWY5kAQrqx+TbQpUPwW
	wlgRm8KFyv49H9NQOiJyQVcIUUROdmT9a9A==
X-Google-Smtp-Source: AGHT+IFVNQKIQVJcNOtV/gNXbGu9QGhl6vmLnMf5ayeRRrfxNKefdvubwF7W3Cj4qGwRr/iI9eO8KA==
X-Received: by 2002:a17:906:c149:b0:af9:3397:ee9d with SMTP id a640c23a62f3a-afe079d7a7cmr123591666b.3.1755785793589;
        Thu, 21 Aug 2025 07:16:33 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4cc3c0sm395325566b.96.2025.08.21.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 07:16:32 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
Date: Thu, 21 Aug 2025 16:16:26 +0200
Message-ID: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=u1EiMmNicg99wl+W+lAeeTFivMOYtOn+iSGBN8oKESA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopyo64EfF+ULupRyQL9/Y3l809bzF1ZqNuDj1l
 UGrNR+laymJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKcqOgAKCRDBN2bmhouD
 113ID/0biIgGnS7NEqLj/msZFRLfs4blEUj2NDA3aWzfESG91irl1s4/sE4jigJXbrkib6TeJow
 n4i1O8nhStZvCA29j+zovGe0iIgwtZGUdS4tHjkFhczaJsKufJ3MYX0wk6XMauShk7oWAtL8Xd7
 L2K7W1jKzu9TId0zelbHvjYXIpwTPYhFkkayH1nu/Gaqv7yBRdfSJAQIsIVuTgZ+uXud78b1Ji0
 0sJtM/Lxvu8PQdEnRY1uTOKKQt0YWDWWs5qy2/FdKm56nmLcZOSBvxn3GDVWx9uZ0hdnW+vXCC7
 03j3C9cSZlpBmVq8dlw4n8LzNJ3tQfmCHUTU9Dkg/EOZwDa2tw6itaKTaTikHcijdQF+fjUwGFr
 QPe5VwPNMmRs2j3mlssi7d40BDBx+vO9ueKMTbM5yKBsxLbBAhEKNM9TKzVfl2O0lzcls7jbeRv
 KA2Na+BNheuylYAINvHItwGTkPjCB1Ekv2c+iyiTQLD+VoviOuxD+UjtJYOrIjHCu1YtOBFywpi
 elm2d3BRnbuPCXw1pig4II5ZjxvglPfIeQWll1XbB8x2TgbW7h9OAyed/EiF0+e5rOgNNVrYDSw
 DXir+iAfkHC6pHT6q21geHq2m8c+ZT6Bx/tJnB0mBtOG3Phu+3BkzZtn/ZZLsldHvTwJ5+57De1 IZU3v9R2tPxkr3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Speaker Protection is capability of ADSP to adjust the gain during
playback to different speakers and their temperature.  This allows good
playback without blowing the speakers up.

Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
and sending it as command to the ADSP.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f4c53e84b4dc..b7f1fc835dc2 100644
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
+						   PARAM_ID_SP_OP_MODE_CALIBRATION);
+		break;
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 790fba96e34d..0ad566e45e09 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -542,6 +543,16 @@ struct data_logging_config {
 	uint32_t mode;
 } __packed;
 
+/* Speaker Protection */
+#define PARAM_ID_SP_OP_MODE			0x080011e9
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


