Return-Path: <linux-arm-msm+bounces-2292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E507FBFCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E2B91C20C2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 16:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678E4443E;
	Tue, 28 Nov 2023 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qu1UnCoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AF510DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 08:56:49 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a04196fc957so827939966b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 08:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701190608; x=1701795408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idILoaA2JqRIC25Fjf9nyuPXcQlZpZOQtMl2iaoFfrw=;
        b=Qu1UnCoiW8ID2W7eNHGSEyJckWzOnCMRWQk8EKW/NvJbE1n3vgGOq5UnHTP3o+k2Oy
         uIrfmYG/0j5zACxTiPoRiIZo/6QqhCSv3u67uhIm1Pdi+hAO5Wx0Tpd96PJkq5/4ZVqr
         2X+9Z5nv+Ap2mTVh54FWiDCChEhqzQNm9Z0CDPZYzAjXvA3ScQIUTJmEWtliFPZ0v9zW
         jDbbh01Ox/Jzg0rkEOgL6t5p+sD6BW8KQ3rGs4ymnZWfTHmQxhOR8uVuua1clfFp9QLe
         6wr3l0wSmTMWV0oJpFiNJX5zNPbzvYlsvuBV+iKb6cA2j7RjhodH9VLmH/wf0mprs0Jr
         kR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190608; x=1701795408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idILoaA2JqRIC25Fjf9nyuPXcQlZpZOQtMl2iaoFfrw=;
        b=tgc6GIEsPJNxZe0w4Qk9g9AuFL+eQLC7Th96q21QMI6OBQ8PTlxno2V+kj7q0ehLBQ
         JQoG8WZTXem6xJbi+7r9QGeHHLug+rpY0TXm963GDfDCB3SSdp0bDFlfZATuF00t7Cd0
         7NF2zceoJTFDHZQd/Y0DyMbyisNpR4xCXvuFTWHhcpZ3gPqOA6z5uxLRgu2ckVN/4d8X
         o1weU/pvOPwJcrrfBF7iOhh2peUkteC9PwWnujLp45LQiu7Inb6W1eAUqDUaIyEnN3sj
         FgNr0IV9acgOInQZhUIZr0lOgP8xM5jPdGj58yx6TgPES0VByX3ZXcQTBcHGtZrT+RVi
         JotA==
X-Gm-Message-State: AOJu0Yx47+jYAMT/kzVpX6Jiqodc3QSSPchm2D2NamgKuCL9Nsv+3J41
	hv1ACJ3t5pYzCZH52Wx4jHy4sg==
X-Google-Smtp-Source: AGHT+IFifNuJpcawcpWiUxQK4fn6U2n7H3bqGqSV8Mhuvr/erPBff7VzJpLR21GhXuqTUDqAPhVJZQ==
X-Received: by 2002:a17:906:749c:b0:a14:b151:72e4 with SMTP id e28-20020a170906749c00b00a14b15172e4mr1775658ejl.73.1701190608259;
        Tue, 28 Nov 2023 08:56:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id cw18-20020a170906c79200b009bf7a4d591csm7126252ejb.11.2023.11.28.08.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:56:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: Move Soundwire runtime stream alloc to soundcards
Date: Tue, 28 Nov 2023 17:56:38 +0100
Message-Id: <20231128165638.757665-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the Qualcomm Soundwire controller in its DAI startup op
allocates the Soundwire stream runtime.  This works fine for existing
designs, but has limitations for stream runtimes with multiple
controllers, like upcoming Qualcomm X1E80100 SoC with four WSA8840
speakers on two Soundwire controllers.

When two Soundwire controllers are added to sound card codecs, Soundwire
startup() is called twice, one for each Soundwire controller, and second
execution overwrites what was set before.  During shutdown() this causes
double free.

It is expected to have only one Soundwire stream runtime, thus it should
be allocated from SoC soundcard context startup(), not from each
Soundwire startup().  Such way will properly handle both cases: one and
two Soundwire controllers in the stream runtime.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is an entirely different approach than my previous try here:
https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
---
 drivers/soundwire/qcom.c  | 33 +--------------------------------
 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
 sound/soc/qcom/sm8250.c   | 15 ++++++++++++++-
 3 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f42c83c390ff..ac9176f714bf 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1291,10 +1291,7 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct sdw_stream_runtime *sruntime;
-	struct snd_soc_dai *codec_dai;
-	int ret, i;
+	int ret;
 
 	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
@@ -1305,33 +1302,7 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	sruntime = sdw_alloc_stream(dai->name);
-	if (!sruntime) {
-		ret = -ENOMEM;
-		goto err_alloc;
-	}
-
-	ctrl->sruntime[dai->id] = sruntime;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
-		if (ret < 0 && ret != -ENOTSUPP) {
-			dev_err(dai->dev, "Failed to set sdw stream on %s\n",
-				codec_dai->name);
-			goto err_set_stream;
-		}
-	}
-
 	return 0;
-
-err_set_stream:
-	sdw_release_stream(sruntime);
-err_alloc:
-	pm_runtime_mark_last_busy(ctrl->dev);
-	pm_runtime_put_autosuspend(ctrl->dev);
-
-	return ret;
 }
 
 static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
@@ -1340,8 +1311,6 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
 
 	swrm_wait_for_wr_fifo_done(ctrl);
-	sdw_release_stream(ctrl->sruntime[dai->id]);
-	ctrl->sruntime[dai->id] = NULL;
 	pm_runtime_mark_last_busy(ctrl->dev);
 	pm_runtime_put_autosuspend(ctrl->dev);
 
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index d93b18f07be5..7c20b25ba3de 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -31,6 +31,17 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = pdata->sruntime[cpu_dai->id];
+
+	pdata->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
+}
+
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -91,6 +102,8 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 }
 
 static const struct snd_soc_ops sc8280xp_be_ops = {
+	.startup = qcom_snd_sdw_startup,
+	.shutdown = sc8280xp_snd_shutdown,
 	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 9cc869fd70ac..f298167c2a23 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -66,7 +66,19 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	default:
 		break;
 	}
-	return 0;
+
+	return qcom_snd_sdw_startup(substream);
+}
+
+static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	data->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
 }
 
 static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
@@ -103,6 +115,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
+	.shutdown = sm2450_snd_shutdown,
 	.hw_params = sm8250_snd_hw_params,
 	.hw_free = sm8250_snd_hw_free,
 	.prepare = sm8250_snd_prepare,
-- 
2.34.1


