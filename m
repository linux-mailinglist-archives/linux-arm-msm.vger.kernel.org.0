Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3D239B39C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 09:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhFDHNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 03:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhFDHNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 03:13:12 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4381BC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jun 2021 00:11:27 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so5342282pjq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04miD2l332N5JEOBvQKSIIZVsCHeGohPyIgj2Bs7M2g=;
        b=UYq57R8/DgylVe7bQQT1K0kVoUZAKg78p7JLt3nj5Xvwwbo26bubgQ5Rw0p56VKVKI
         amHFHnpXmNB3vNWQrTxGHHUWu72QjRLuyauxAguYYAP2L1gb+GKB426oPeZvXsFu720D
         B+4BkzEKNPf/O01NI2pRsfoqR1YjT6nOmi3EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04miD2l332N5JEOBvQKSIIZVsCHeGohPyIgj2Bs7M2g=;
        b=GrIW26/tKYuvPCwlFlHvIUgtCEIjgAbmV1lAfhpl0Rm+ESBiF+/ppy6oDc5zKeThSy
         YK0N1tXJwJUOKhyAAyD64KG1p76GmxhblzHjk6WoecEbO2F5gAZN4cz3MF4ExvI1lsbI
         khiATLGAcwn4DEd0v3HrlVZjcvTfOTdJizPya+muykUgydn3De1eJtuc3jYoIMyKVHBz
         zMzgjBoWBMcRoP+GkeMlqGPSl8NiWpQhK+rKh7Z2wMRhb8ZzqCrUCZ0RkO10PqCal13H
         Hu3gyO1AihmvO68xh5NR5+Mty27uCrCPI4e1cf3xRCspVa8OaJJRvIBsQTz6kU6WJXT5
         Ab+g==
X-Gm-Message-State: AOAM532WbziCPlZg9QPBSN86ND92zG0/HqZzhFWnNyKUoyYGs44CViuc
        uaafSJ+tY+UnPKHkossvBGqPmg==
X-Google-Smtp-Source: ABdhPJzzf3MffrJf8cu1pAFiWopX0p1aSBAccKzEw4KlJf+njbnIDbY3jrRzxGG+7xsb8wZZsYufGg==
X-Received: by 2002:a17:902:a3c3:b029:f0:b297:7778 with SMTP id q3-20020a170902a3c3b02900f0b2977778mr2996346plb.16.1622790686744;
        Fri, 04 Jun 2021 00:11:26 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:a8e1:b46e:86b1:84fb])
        by smtp.gmail.com with ESMTPSA id g8sm971625pfo.85.2021.06.04.00.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 00:11:26 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     broonie@kernel.org
Cc:     Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Subject: [v6] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
Date:   Fri,  4 Jun 2021 15:11:12 +0800
Message-Id: <20210604071112.1055911-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

This patch fixes PoP noise of around 15ms observed during audio
capture begin.
Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
introducing some delay before capture start.

Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
(am from https://patchwork.kernel.org/patch/12276369/)
(also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)

---
Changes Since V5:
	-- Fixed nit.
        -- Updated `mi2s_was_prepared[dai->driver->id] = true;` after checking for errors.
Changes Since V4:
        -- Replaced the __clk_is_enabled(BCLK) check by the self maintained.
           mi2s_was_prepared bool state.
        -- Removed unrelated changes.
        -- Refined comments.
Changes Since V3:
        -- Checked BCLK is off before enabling it in lpass_cpu_daiops_prepare as
           lpass_cpu_daiops_prepare can be called multiple times
        -- Checked BCLK is on before disabling it in lpass_cpu_daiops_shutdown to
           fix the WARN. It is because BCLK may not be enabled if
           lpass_cpu_daiops_prepare is not called before lpass_cpu_daiops_shutdown
        -- Added more comments
Changes Since V2:
        -- Updated comments as per linux style
        -- Removed unrelated changes
Changes Since V1:
        -- Enabled BCLK and LRCLK in dai ops prepare API instead of startup API
        -- Added comments

 sound/soc/qcom/lpass-cpu.c | 80 ++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h     |  4 ++
 2 files changed, 84 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af8cb64924a0..0430cc797391 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -93,8 +93,30 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
 
 	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
+	/*
+	 * Ensure LRCLK is disabled even in device node validation.
+	 * Will not impact if disabled in lpass_cpu_daiops_trigger()
+	 * suspend.
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
+	else
+		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
+
+	/*
+	 * BCLK may not be enabled if lpass_cpu_daiops_prepare is called before
+	 * lpass_cpu_daiops_shutdown. It's paired with the clk_enable in
+	 * lpass_cpu_daiops_prepare.
+	 */
+	if (drvdata->mi2s_was_prepared[dai->driver->id]) {
+		drvdata->mi2s_was_prepared[dai->driver->id] = false;
+		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
+	}
+
 	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
 }
 
@@ -275,6 +297,18 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/*
+		 * Ensure lpass BCLK/LRCLK is enabled during
+		 * device resume as lpass_cpu_daiops_prepare() is not called
+		 * after the device resumes. We don't check mi2s_was_prepared before
+		 * enable/disable BCLK in trigger events because:
+		 *  1. These trigger events are paired, so the BCLK
+		 *     enable_count is balanced.
+		 *  2. the BCLK can be shared (ex: headset and headset mic),
+		 *     we need to increase the enable_count so that we don't
+		 *     turn off the shared BCLK while other devices are using
+		 *     it.
+		 */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_ENABLE);
@@ -296,6 +330,10 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		/*
+		 * To ensure lpass BCLK/LRCLK is disabled during
+		 * device suspend.
+		 */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_DISABLE);
@@ -315,12 +353,54 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret;
+
+	/*
+	 * Ensure lpass BCLK/LRCLK is enabled bit before playback/capture
+	 * data flow starts. This allows other codec to have some delay before
+	 * the data flow.
+	 * (ex: to drop start up pop noise before capture starts).
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
+	else
+		ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
+
+	if (ret) {
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check mi2s_was_prepared before enabling BCLK as lpass_cpu_daiops_prepare can
+	 * be called multiple times. It's paired with the clk_disable in
+	 * lpass_cpu_daiops_shutdown.
+	 */
+	if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
+		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+			clk_disable(drvdata->mi2s_osr_clk[id]);
+			return ret;
+		}
+		drvdata->mi2s_was_prepared[dai->driver->id] = true;
+	}
+	return 0;
+}
+
 const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
 	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
 	.startup	= lpass_cpu_daiops_startup,
 	.shutdown	= lpass_cpu_daiops_shutdown,
 	.hw_params	= lpass_cpu_daiops_hw_params,
 	.trigger	= lpass_cpu_daiops_trigger,
+	.prepare	= lpass_cpu_daiops_prepare,
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
 
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 83b2e08ade06..7f72214404ba 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -67,6 +67,10 @@ struct lpass_data {
 	/* MI2S SD lines to use for playback/capture */
 	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
+
+	/* The state of MI2S prepare dai_ops was called */
+	bool mi2s_was_prepared[LPASS_MAX_MI2S_PORTS];
+
 	int hdmi_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
-- 
2.32.0.rc1.229.g3e70b5a671-goog

