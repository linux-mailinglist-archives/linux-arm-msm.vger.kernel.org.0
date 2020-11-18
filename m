Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503032B736F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 02:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgKRA71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 19:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727155AbgKRA71 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 19:59:27 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A965AC061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 16:59:25 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id 5so57375plj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 16:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7AO2qORKT4+avCz7hMT+yBOcTnb5ezlHHC8XeW/HDXs=;
        b=Na5izE9NISYqPS/DYWEhhhQAU/OJDp0XUz15N/sihLzwQbwz1N5Fe32ZH7ZJg7kE2X
         gdLwB9GcswgsirTidgqvC3JJBVJ5EwHbXyhAxfStMej3lWAtzk0efqzh5SYir0QvLQyU
         /Y+W8l3361QsyPDAxMrIK5qVPI9ZcxcEEZdCxtl2f5htbJrYa2qVQ/Jf5s5+p1LFUSsO
         My7k/TexcJuQaVZOpEwx239BkYTSXa6ZPTk50FIv4ir31K3PjBtZ8lCKaONHMBNKLKkD
         IbyNn7ocmeTm/5DMS+8kiEf6aBvFYu87bQtcEpWO5QabrztHGLRYPED4WcN+UNK0Y9oV
         ZfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7AO2qORKT4+avCz7hMT+yBOcTnb5ezlHHC8XeW/HDXs=;
        b=cegJZ9qx14eiMsSkUU27hdaYZw8oQdXL90g5GqY5VJo3b+NyFWdX/eHJz7ekYZu9iv
         h6MYwkXrAR2Xy8qO4IOgQ1hMKsSMZ93VbGStbARLdY3PWfizuSnrBgMsqyzU/lPBzH9D
         YWB5NG7cJli/bMg2imng45Lp2lUWkvUex/LJnwtAAMJemxUWmLwwjQtO0YK+dSVQ1zSM
         SyfkSQ+wdnmJdILVb1i7QfhSkr54iMSjVSljrdoe1+xUx0DJLgwCsTP3+Wg0+rCWTRej
         fZT5IaGO8dbsut5AWjbgKf/7yJQSy8aD9uhNktj1zpXLDs7+QtyKTjJ3S7murbGE3iRw
         66AA==
X-Gm-Message-State: AOAM532aVhdvMZ78ftpi4tGfjtgKGezPz4rxg9lbv9FI1G33rusovEc5
        5zlPbC+B1QWIlAhCdzD3Hn6N
X-Google-Smtp-Source: ABdhPJwDch/fiHGH5MBIh+IEocm1RhT1h6NVz+y7GYF61GBmS6tnBmDqOPaWEwmIxwLqfXs+vKuCOw==
X-Received: by 2002:a17:902:b410:b029:d6:b42c:7af9 with SMTP id x16-20020a170902b410b02900d6b42c7af9mr2165162plr.21.1605661165303;
        Tue, 17 Nov 2020 16:59:25 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id y10sm307159pjm.34.2020.11.17.16.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 16:59:24 -0800 (PST)
From:   xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
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
        dgreid@chromium.org, tzungbi@chromium.org, cychiang@chromium.org,
        judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        zhouguohui@huaqin.corp-partner.google.com,
        xuyuqing@huaqin.corp-partner.google.com
Subject: [PATCH v1 1/1] ASoC: qcom: sc7180: fix 32 bit format for adau7002
Date:   Wed, 18 Nov 2020 08:58:58 +0800
Message-Id: <20201118005858.123013-2-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

the microphone is attached to external codec(adau7002)
instead of rt5682.We need to always use 32 bit format on sc7180
to meet the clock requirement of adau7002:
The ADAU7002 requires a BCLK rate 
that is a minimum of 64× the LRCLK sample rate

Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
---
 sound/soc/qcom/sc7180.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index de70fa792aea..768566bb57a5 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -245,6 +245,7 @@ static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -252,6 +253,8 @@ static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
 				    SND_SOC_DAIFMT_CBS_CFS |
 				    SND_SOC_DAIFMT_NB_NF |
 				    SND_SOC_DAIFMT_I2S);
+		runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
+		snd_pcm_hw_constraint_msbits(runtime, 0, 32, 32);
 
 		break;
 	case MI2S_SECONDARY:
-- 
2.25.1

