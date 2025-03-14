Return-Path: <linux-arm-msm+bounces-51456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C89A61888
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1D7F460176
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC76B204C13;
	Fri, 14 Mar 2025 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQk1h7zb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB16204C1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974520; cv=none; b=Lu9FWUfymPhTj2HEj0vTW5aZD8OceNethV1LCK/OFwbOfr1AyZGUVzby17UR+yuKGARjqGLs7BwsONcnc8SlJ88w4GLpTwME4fhbiHc9KhcbcdCwBoLDgshEL8dpKgIZyTyiMoMw5A6j46P/olTVqJWjzijCDFMD0hkvggt3f4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974520; c=relaxed/simple;
	bh=GTv0VCH3s0WKdgoZHW+Neb05F5hHPFrcMTNWEHTQEPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/2Z/MUSIZViLpraL/+CQaZAX8CvSMygRBtJ5G9WYnpvtcMUiTbB4wNRlLut1yoamCYRN/Lpz5J0HX5gRfO98i0Yp++H4MTFeeQR0Vbj37lfgLGNUUdbvolTpC9O2Z6aa9nPjwJajvK4T82eB7x1eR7B7EEacQqd/p9G8xuIXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQk1h7zb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1983334f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974517; x=1742579317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmD5vNzSSLCYtQiI6TARd80NsNkLFJqSnN180ML5a34=;
        b=FQk1h7zbG/In83KeSzc7kav2fg+TJmkzb9qqyGOf1JQkubfTfBTtfKNg7dCmKjpXu0
         PCDyBEQNDXzn+tisQNBydCsHL83TvzatS1OqrPXXLTjnqPLSbKrPnxiVIXVzpMfiGX+P
         M396vjnoecIevnUsUNYRJKRoYmFaJ1QRpF04b69AyFAPJ8/N5AUE833NBesTyEYkVB+a
         cxqekdPkdL1xGKO/a7PXK7q1wasPnO9H9ALe5nlagHWbzWSyg7LiKFOXw9RC+eqMrFtV
         OkJLN815O8ad/b3Y6ZfJgXE9C0ghNnONUf+2XrZry05hCqvR1IPEofHm2eMLq1q5x4ng
         G1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974517; x=1742579317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmD5vNzSSLCYtQiI6TARd80NsNkLFJqSnN180ML5a34=;
        b=Nj+ibVXymW5Ua7bmP+HCv0eKcx3fB3PDcEZsSEt9yomr48IarFUgvVze/430BBakES
         eXPkmwKmEltJTGrIdn8fuJ2ZG8vPVT7RnFJwOwW7MOVx2/LHZiWh+P53+6O9K1sVb/ma
         bTQ5f8eb/QhR1ZUfjFklPAfZ3lzgklh2QUBHo3E0sb0WP28tbLbeAL8slRrvmBLytZ9/
         rrmg9jhVeJW0+mZUvdMS8pUFqBusLMKoeWfKoeB6jFuSH5V7ol9vLxNYWcMNfpkBnJQl
         V7RzCHhoz+6W6BnBK8wIKKfoK67UdHIprRCJIzkb6+hV33r6Re7Ca8fWCQ5X8/AA2dlL
         u6hA==
X-Forwarded-Encrypted: i=1; AJvYcCX+e3Z30CMwjhle9WqVB51XCbnZ3JZu167S4v97bOGwmOtIQ4SGZsMe8VXsBoIpX4bNLx6xgfuIPEqK/yNq@vger.kernel.org
X-Gm-Message-State: AOJu0YxwUwANWYLjcc6G4b07YUKH0X/VJkK9mUajOZGGgE2028t1unLt
	zvGBGUZ5JubDC9DrY9/oXkeO73Q4ou4WT/T8VnVuxTsedYVLHsu6SjULTEUi4iDMIhl88cQJhaG
	n
X-Gm-Gg: ASbGncuwdFPUR38fYz6MULjwbINvcSClI+/Wlynq20JnzUVKxwP/2BvgsMhWREL/R4S
	tseV+gUnLHPuvA/ATRINFXl8D6L8iGGKgOG3Pxfh9Lio/ECm9t0k0KRnHcr0xYLVEiqTP0DHEwK
	NqluoyKuOJuP1lT28GqEPQ+aZgwgNWs+z4Hc9+ooNSUH14MKMTs6HE4g+vUXxW5bZeY/akMU1Yc
	D8ADjogswZXsITq77G0rgH6wv391nJ4fzzF7G4/vQ/A+iDzrwjkIAhloYRYyfpjA+eDMBGCeF5a
	cMn1PVCVASuBRWaZhIyoJfBQTCm+gYlXNI87nQFJPdqCJsF25r4flZk1kK9HuT1G9zfKrw==
X-Google-Smtp-Source: AGHT+IEDC3mTs5ZEgnH5M13Yv5WSovrEtsi3f3jqP63eSIlzIlegYCTCHHMMtUO2OfGOcqcPh6kT9w==
X-Received: by 2002:a5d:64c2:0:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-397202a1acemr4508526f8f.37.1741974516847;
        Fri, 14 Mar 2025 10:48:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:35 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v5 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Date: Fri, 14 Mar 2025 17:47:58 +0000
Message-Id: <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

With the existing code, the buffer position is only reset in pointer
callback, which leaves the possiblity of it going over the size of
buffer size and reporting incorrect position to userspace.

Without this patch, its possible to see errors like:
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 9d8e8e37c6de..90cb24947f31 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -64,7 +64,6 @@ struct q6apm_dai_rtd {
 	phys_addr_t phys;
 	unsigned int pcm_size;
 	unsigned int pcm_count;
-	unsigned int pos;       /* Buffer position */
 	unsigned int periods;
 	unsigned int bytes_sent;
 	unsigned int bytes_received;
@@ -124,23 +123,16 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_pcm_substream *substream = prtd->substream;
-	unsigned long flags;
 
 	switch (opcode) {
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
-		prtd->pos += prtd->pcm_count;
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
-		prtd->pos += prtd->pcm_count;
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6APM_STREAM_RUNNING)
 			q6apm_read(prtd->graph);
@@ -247,7 +239,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	prtd->pos = 0;
 	/* rate and channels are sent to audio driver */
 	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
 	if (ret < 0) {
@@ -445,16 +436,12 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
-	unsigned long flags;
 
-	spin_lock_irqsave(&prtd->lock, flags);
-	if (prtd->pos == prtd->pcm_size)
-		prtd->pos = 0;
-
-	ptr =  bytes_to_frames(runtime, prtd->pos);
-	spin_unlock_irqrestore(&prtd->lock, flags);
+	ptr = q6apm_get_hw_pointer(prtd->graph, substream->stream) * runtime->period_size;
+	if (ptr)
+		return ptr - 1;
 
-	return ptr;
+	return 0;
 }
 
 static int q6apm_dai_hw_params(struct snd_soc_component *component,
@@ -669,8 +656,6 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
 	prtd->bits_per_sample = 16;
 
-	prtd->pos = 0;
-
 	if (prtd->next_track != true) {
 		memcpy(&prtd->codec, codec, sizeof(*codec));
 
-- 
2.39.5


