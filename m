Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8352B929B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 13:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgKSMbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 07:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgKSMbu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 07:31:50 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FEAC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 04:31:50 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id a9so7998052lfh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 04:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CzGCpiN8DDCXB/TDfvykQudKt+j67A7n1K8JxIu4JHI=;
        b=B/MIgCpuCvn1TPuZ/1KshVQ/w0EICGlUb/sM/OzYnYXJBjKsxjOt9fXEw9fnJ9uBrj
         0TjkQWyIUMem3xj7jg58MOdqi0GpFXBRuwDDiMdapcosnOtAVUF4Rw1kG4tvVyftokf2
         6FPgQabmxCqduNSqKaigr9YoU5B+dU8oIOSNnqKvl5FZuaGwb4uaVIvIhir9xP2Fb2ji
         cLVPJnbA/1G+kgGyndzwORq6FJ2NDL8pQOPue12/N4mR6Eh3aa7tojJArH3d6u6YojRG
         giVxQuHwue5m3sjSm4hBNUtwJlBiyNkTYl3Q5xjwq5OZ9FjR6iqmPgklBCjZVR++1gh8
         nM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CzGCpiN8DDCXB/TDfvykQudKt+j67A7n1K8JxIu4JHI=;
        b=m3g82LVDX0D9wIrQce+epvcAHOhVGKRyzGrUgqo2y9Sv8W9z+fodpmtSAj4hLbOAls
         aivA6KYPQSfr9Uy3eQle4UOwyAD9WTX7fygx85p5Lgp1ZGDkNJal55MtYaWmOmn/KY2m
         R5b3NbM0cLzQ58gfss83MpyjIF0nKGcVZvLtVQfQGJZ4SbU2pNOfbfUPP5GBXPj3Od/A
         NMKDrTg5t5+IqHrq3ov4LE+PXLhgyU5PPPQYBHiqWJL0tEJ9OnNeL8UhBnHMt2OpJhWF
         LS1PIOtx6YYPg4d472UoUR6heI4kd+anYJp/o8S6iimkN2/HuhFlbRZTM/bUI6hF8NPE
         5aLg==
X-Gm-Message-State: AOAM531Y7g5xf6JoYaiwW37mXuKBTZpoTwYclqaCvKNLlWHl8DB8xIRx
        lMMJjw+qh0ohwts7HsZyygSS7BCqXKzRMg==
X-Google-Smtp-Source: ABdhPJzgtIm/m55OCqiC93oYLiHLfdCfcgaiKk5l5vbCYmhMJIL2aGDS3Vp96XgOt/V/iqjKB1gj/Q==
X-Received: by 2002:ac2:563a:: with SMTP id b26mr5462533lff.596.1605789108951;
        Thu, 19 Nov 2020 04:31:48 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.108])
        by smtp.gmail.com with ESMTPSA id u28sm3962495lfn.102.2020.11.19.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 04:31:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: qcom: sm8250: fix HDMI audio playback
Date:   Thu, 19 Nov 2020 15:31:45 +0300
Message-Id: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current code does not setup CPU dai (causing -EIO errors on playback)
and does not pass SND_SOC_DAIFMT_I2S to codec fmt (causing i2s-hifi
errors). Fix both errors to enable HDMI audio playback on SM8250. Tested
on RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 35c9ad11edff..314e3e566d6d 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -36,6 +36,7 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 {
+	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
@@ -43,10 +44,11 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 
 	switch (cpu_dai->id) {
 	case TERTIARY_MI2S_RX:
-		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF;
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
 			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	default:
-- 
2.29.2

