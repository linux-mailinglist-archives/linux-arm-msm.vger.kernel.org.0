Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7C93A15A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 15:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbhFINdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 09:33:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:13717 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbhFINdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 09:33:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623245483; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=BeYX73doWPR7lsTGFW99a7LTe6l+VAzCwPidc8WwPTA=; b=T91kbzCekiS4G6hrnLGWeaeLoq3u5upqGob3pU6UaziS6DaAHbgWY+kQvpmnsAkJicjwpNBj
 Z3Bynvg3gz/GpW3Ulj0+iyj3kzaHEnkmGWININQ2ek2EZy+AY8dOvIFu6Ex/8KSWt3Qgoyp+
 VDFg0hVNeOccPpnhtc5ThEIEpd8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60c0c29351f29e6bae5da2db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 13:30:59
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18B3DC43144; Wed,  9 Jun 2021 13:30:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DFEC0C4338A;
        Wed,  9 Jun 2021 13:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DFEC0C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v3] ASoC: qcom: Add four speaker support on MI2S secondary
Date:   Wed,  9 Jun 2021 19:00:39 +0530
Message-Id: <20210609133039.4648-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add four speaker support on MI2S secondary block
by using I2S SD1 line on gpio52 pin, and add channel map
control support in the lpass-cpu audio driver.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes Since V2:
	-- Added empty entry at the end of channel maps array.
Changes Since V1:
	-- removed set_channel_map/get_channel_map implementation as default kcontrols
		added in pcm_new API.
 sound/soc/qcom/lpass-cpu.c    | 33 +++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass-sc7180.c |  1 +
 sound/soc/qcom/lpass.h        |  2 ++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c62d2612e8f5..aff39c9f6326 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -29,6 +29,15 @@
 #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
 #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
 
+/*
+ * Channel maps for Quad channel playbacks on MI2S Secondary
+ */
+static struct snd_pcm_chmap_elem lpass_quad_chmaps[] = {
+		{ .channels = 4,
+		  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL,
+				SNDRV_CHMAP_FR, SNDRV_CHMAP_RR } },
+		{ }
+};
 static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
 			struct lpaif_i2sctl *i2sctl, struct regmap *map)
 {
@@ -324,6 +333,25 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
 
+int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_dai *dai)
+{
+	int ret;
+	struct snd_soc_dai_driver *drv = dai->driver;
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	if (drvdata->mi2s_playback_sd_mode[dai->id] == LPAIF_I2SCTL_MODE_QUAD01) {
+		ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+				lpass_quad_chmaps, drv->playback.channels_max, 0,
+				NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
+
 int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
@@ -856,6 +884,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
 			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
 		}
+		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
+			LPAIF_I2SCTL_MODE_QUAD01) {
+			variant->dai_driver[dai_id].playback.channels_min = 4;
+			variant->dai_driver[dai_id].playback.channels_max = 4;
+		}
 	}
 
 	/* Allocation for i2sctl regmap fields */
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 8c168d3c589e..77a556b27cf0 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -58,6 +58,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 		},
 		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
+		.pcm_new = lpass_cpu_pcm_new,
 	}, {
 		.id = LPASS_DP_RX,
 		.name = "Hdmi",
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 83b2e08ade06..623ddccdafff 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -259,5 +259,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
+int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_dai *dai);
 
 #endif /* __LPASS_H__ */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

