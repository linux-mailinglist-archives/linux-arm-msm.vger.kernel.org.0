Return-Path: <linux-arm-msm+bounces-52663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A97A735E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B4611798C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9B0155C83;
	Thu, 27 Mar 2025 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XO6E1K9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E971DA3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090416; cv=none; b=ZhI/vEn4ciHx+/Hwl24EBKcaY0pBVSXtE62vQMVusoUaNnqZgtAZca2OsKpro2EgW+V/27te132Clq8xCbinK/epIxPYQGXeCLXFZT8SuseicgNSaeg9GlBUTfZqoX29fWPx1rgdX3jue9HnLD/sdhV3yTaw8b0sFm7aWUijRTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090416; c=relaxed/simple;
	bh=LPH7fmB2piYJTlMhDGZnc6I3l1pOMgZFoEBi543qq+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HzjiFAg/Totdb48nuu1tNSFhMurqVsIBpjTeT1pwlaub0pGY1UlWC9+WBB80FS9VMKhD+KIdM0Vh/V4RqqezAAb977M19IbV9FYbgzpecNl2UZO5UvlBo3qHnGvqgO6yaD5aba4IOQ42QV6kL7iwsYcf9laGOmwLS6trmEDLGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XO6E1K9K; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9350585e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743090411; x=1743695211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tA2zJWv1o+75nzP8/krgasVJF7/Bs9xLeh0TRybxqLI=;
        b=XO6E1K9KBKFAlkpvoa6b0HjQWU6bAXd8PE2o4jWs5h21l+Ayfus4yWTQYC0Tf23w/3
         oZdXcrQBVP2Gznv5foI/iIsk0dvsWLRJk7k4ouCuVy7/MxLuOvjnEtcpUHx8t47JJgSE
         iKdMXxQKJuXD/wul5EuiFJxBiqb0/KvDF0xN5wU1v3S0MKxjLlOz5gHcUDQYP5YqX6Ic
         Q3O6ZsFT3e9lEI/KbdfDEEhDT+lE3ui27Q+VGwr+epSUva1m87kWp8QGqrH0tx3wpL8w
         hTep97GrN9dw79lU/XvF0mlw4ffv/TBS9UTYAPKOFbXQrJ8GmXYHWfT7bPLyOZ3vJgLB
         uquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090411; x=1743695211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA2zJWv1o+75nzP8/krgasVJF7/Bs9xLeh0TRybxqLI=;
        b=aNJoFAScGaNWMPmn7BrKyCaHuA/mU7pF/R3S++2jVC7wI+VvE0NK9jisG2hZivFOFw
         436dcjHX4TMpNXRt3YhFrVU8djg2spZuQYWy5AX4pCI1KI1Myp6GzjCC81qz44SjaQ1+
         bF1ab4SGrE3qNhlGGcFVYMNjVoTc9D9U8OQiKfWhrT3yL6llLLI57AHdl2/LFc6qIVdc
         k8faqI6ybCNgNKYYEuCwqEV41QaYDqHIHM1v9D2SFAQZLx7T7hvAxO/NGDBXxhhe1cUl
         uuWdegwST8tv9GeRTWtz2b96aAWLgqPEr6Qw9YBekwDH1wAUDDBoXPC5GL5WcP+3DS0D
         VBfA==
X-Forwarded-Encrypted: i=1; AJvYcCUkjL5uUR6U8yOekthYhW7tRtgt3hl8ZK2wSpEWa8kb+drimDNS1TlxyT7NAEKYPo52woqQUYUSb3BPuoJm@vger.kernel.org
X-Gm-Message-State: AOJu0YwkrMPkwzlVdwGXkh6Ovrdj4UWNUQtZDsK08vMRNeyS30yJbefL
	gnD8vEOwhwjlf92sHrROklA9vSOUc7TlCTTQSB58cicXpFAas9jNQCPSsqE5sLQ=
X-Gm-Gg: ASbGncsrPt53jPHQ2iXM5yOw+DBvTz+baBTc/xawToEx/+xQWZyP7h2QFFDLw64Bfbh
	dEj47YwtpI2VEEP5WuYiEVx4p5kU+3jX+jX7SR919QGin6Aqlv1hTx2RYKgs1ZTirn4KdX9pARz
	56oXVd/JV8HQU7QSQs34MUor+ITT7pmaXd9JzcU19BqMYlRWMroN+sipjBunbPZDuztWICBO/MW
	M7Tjgaa6o/3qmNalfwP2dxEA+0v7vtH9WeYz1CGcw1esRJMrhNj0tf3dIUv7fFQtMgPL3eE4S76
	rnHsbHk/zW/wuLQ+ufQSyN4nzEc9ah5B79hyhf13Opx1qHOe0Lnfou+L7wwZpXUuglU=
X-Google-Smtp-Source: AGHT+IEQdOD49ykeAMjyB/w/AZwjJja6wbJrFyDzakLR4KdkXKrN6xLOpUaq5nSdkDLMVtpBUCPPHg==
X-Received: by 2002:a05:600c:458e:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-43d84fc181emr43722905e9.18.1743090411433;
        Thu, 27 Mar 2025 08:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedde6sm41768545e9.5.2025.03.27.08.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:46:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH] ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path
Date: Thu, 27 Mar 2025 15:46:50 +0000
Message-ID: <20250327154650.337404-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of attempts to compress playback something, for instance,
when audio routing is not set up correctly, the audio DSP is left in
inconsistent state because we are not doing the correct things in
the error path of q6asm_dai_compr_set_params().

So, when routing is not set up and compress playback is attempted
the following errors are present (simplified log):

q6routing routing: Routing not setup for MultiMedia-1 Session
q6asm-dai dais: Stream reg failed ret:-22
q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
on 17300000.remoteproc:glink-edge:apr:service@7:dais

After setting the correct routing the compress playback will always fail:

q6asm-dai dais: cmd = 0x10db3 returned error = 0x9
q6asm-dai dais: DSP returned error[9]
q6asm-dai dais: q6asm_open_write failed
q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
on 17300000.remoteproc:glink-edge:apr:service@7:dais

0x9 here means "Operation is already processed". The CMD_OPEN here was
sent the second time hence DSP responds that it was already done.

Turns out the CMD_CLOSE should be sent after the q6asm_open_write()
succeeded but something failed after that, for instance, routing
setup.

Fix this by slightly reworking the error path in
q6asm_dai_compr_set_params().

Tested on QRB5165 RB5 and SDM845 RB3 boards.

Cc: stable@vger.kernel.org
Fixes: 5b39363e54cc ("ASoC: q6asm-dai: prepare set params to accept profile change")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 045100c94352..a400c9a31fea 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -892,9 +892,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
 		if (ret < 0) {
 			dev_err(dev, "q6asm_open_write failed\n");
-			q6asm_audio_client_free(prtd->audio_client);
-			prtd->audio_client = NULL;
-			return ret;
+			goto open_err;
 		}
 	}
 
@@ -903,7 +901,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			      prtd->session_id, dir);
 	if (ret) {
 		dev_err(dev, "Stream reg failed ret:%d\n", ret);
-		return ret;
+		goto q6_err;
 	}
 
 	ret = __q6asm_dai_compr_set_codec_params(component, stream,
@@ -911,7 +909,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 						 prtd->stream_id);
 	if (ret) {
 		dev_err(dev, "codec param setup failed ret:%d\n", ret);
-		return ret;
+		goto q6_err;
 	}
 
 	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
@@ -920,12 +918,21 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
 	if (ret < 0) {
 		dev_err(dev, "Buffer Mapping failed ret:%d\n", ret);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto q6_err;
 	}
 
 	prtd->state = Q6ASM_STREAM_RUNNING;
 
 	return 0;
+
+q6_err:
+	q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
+
+open_err:
+	q6asm_audio_client_free(prtd->audio_client);
+	prtd->audio_client = NULL;
+	return ret;
 }
 
 static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,
-- 
2.47.2


