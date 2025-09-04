Return-Path: <linux-arm-msm+bounces-72018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42267B43899
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3233B14D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AC92FDC28;
	Thu,  4 Sep 2025 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XApCXX6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4882FD7C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981137; cv=none; b=UsKe08SQ+UcL+Yz+G3FoayXwk364Kh/tOjT0m/vSP6NGSBJMa3hrGZv+Q5vIGf66OhlZL5ja+LS9jdj1m06ZsdiYNdE4dnXLdvBiuhCuu/Ywj8Z5TgKiZrivRKZg69B9ktjEEpsqAuP4S646ZzvbNU6d5Y4urvd6nWI0AWWNMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981137; c=relaxed/simple;
	bh=0z4DvdjsLX6ePogBY1auCiBA6lQ5eI1Z0Og0lwAREbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2gNad/GhmnYMSYCeyZ971INJA37CIqfLByjkqNo2nA3+Yv2fmRVhrKfZIPQ8DHKxtLBzn2zxe7IpaQPrbvfF8C0v1IINVxxxXQgrLcij8Qvq6sR7UmVAUKy1kzyQ+XM0d+gl1LKYObEYWT/wf6DQf6nISUmMKJj09jHtU7GO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XApCXX6N; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61d1f60aac7so147232a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756981134; x=1757585934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=788DvyHs5EODeIANR32XpfigfVcSqxiFxI3EsfOqEDI=;
        b=XApCXX6NeNhNAvhmv8CVw75krY9UpYhjvZTYa59GqJjJPe/TOI8//VN5zgPEHK1BJI
         QSs7lI7/izZE87KcZxBE/eR6DcLe8vuE7ipf1VZpcZCURX2sjonDp3yXj4cqZu+0nreR
         0colCHAEN4emV5MzJ/TLPjVYH/fQf0ECbzthOIAjTtcCwQutEArATKMTtZfpYVD9f3z1
         EwYofra9Qx/hmCKqnHcAI0wICaH6bNAjVW6gkKgKjcsl2BU8RYvo6LPFOwC+I1ZSm77k
         KWwNFEa4KWsL3Uq0bOHmPfJvXwx+g9Q5MwY7K7MKfcdz7xFlabxX5uNJK0tVZQ/n/DP8
         /zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981134; x=1757585934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=788DvyHs5EODeIANR32XpfigfVcSqxiFxI3EsfOqEDI=;
        b=rKnvZ71nrI/UCrCWhLAGHgBmKrUjSmoTCEpDDN3VZyaHF9A/CgXWeUgjRkgx6BMFGP
         UhcZN6nGf98R3RrqPWAL9hMK4GVPoWpNdSzSTdj1rKM//KYE75ibTIwilaIwuhrix/Pe
         a/eI4iVFez2r+bHSO2KtNUF/bYjYsnvhtNDfuF66/NgYMPxULu+R0yAQuET6OReKGW4J
         lkkuGsyYdpkUg1+FZ4FFQSZDMfgdT9LFStzkt1nyoOs+cMB8bkEuyFEFV14THL0Vwj23
         Pcyik+5z0eqlkLRSTq1UjSHtkhA6dVRl27xdhBN0qdU1wdzrXHTqGk0o50f8z3ZX+fAn
         tsfw==
X-Forwarded-Encrypted: i=1; AJvYcCXjNqvuqa3+ZYuKp6zNVwd3xCn8r9lKsQ7KIYNgzjEjYeNuO0qOTHQPgKedNzWsHAs9eNmP+ABpwF3Ond9R@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdGeKxdiUeQt60WDvnqu+TG/Z7/pDf9hQH8aDWElIZfTdakdY
	+u1N6cYf4snzw5xazQUaAk7yy0AGcXVRYciasAvzYAoCyK+dafqc7mZ5yONoQKMX6vk=
X-Gm-Gg: ASbGncslJ6G90DNV0lmZTxtMfM6XVcPMdsz1dVOIXxH0ixbVdy7f17rlqJt5/SQ5Ovi
	aoEuw8MCveU7eUdHY5lLV+0AKH6jkmq63kTpdP40U8Ami2TX+W+9xyb3y6+/xr64W6n5do7wz4z
	LnWPzbR2krWxV3Wn89uU+63u/63eQqMGEyvAWexOagbpbX600NNteUqXbkvF7VRfpktwNojiplW
	KcOdqZnuXMDDtb7rv5Zt2H1WbPozi8mUlDlLHUEgyPcqhQ5eEMmYc0zy/1VThUQpZJqfbYCLXYi
	d53KLK1NG578zXkbHgk2ooV0LYn5EVY3GMwzLEKKWNgMmpGofz6bSYA2uiD/WZgpvIFG6AsU3KN
	rN29AARcMbSwow/6KfmCFiX3YgJ8kxkY0P3cYJdgMIaxQ
X-Google-Smtp-Source: AGHT+IHWntgtcODAj/7kFve1sXTz2DdTGamGtUT21D8b3aznENuQ1mZPsX7EylSYmJeT9xBCC+l8AA==
X-Received: by 2002:a17:907:25c3:b0:afe:b131:1820 with SMTP id a640c23a62f3a-aff0f01e9fcmr1044118066b.6.1756981133581;
        Thu, 04 Sep 2025 03:18:53 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041f6fb232sm1103667166b.87.2025.09.04.03.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:18:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
Date: Thu,  4 Sep 2025 12:18:50 +0200
Message-ID: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=0z4DvdjsLX6ePogBY1auCiBA6lQ5eI1Z0Og0lwAREbU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouWeJllIVY+hQGdNqHZvj/tioDr963JGTfjhCS
 P6pL6DYWlOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLlniQAKCRDBN2bmhouD
 1xJfEACRVcFni8dKH4V2yPLhU+lrF63RMHnlRzgHV9jmPHmN+MvF6Q2Kz+dfrN9qSOaI3EQjmUq
 qtnY7eUeCe7aPA3eUdRBbqaoumyMc56M7YQW6HWWVHBkpHQz5xipIT7lJyIUSJ7WGlr0xFJfnLa
 TBi/sKAZKgvvjhfKe6eXwSxpl2/L1/hQ6BnWrURJH1bwxDyJl6j+wm7BNxOo6QJgHQc/J9U42u4
 axXFpApSpaZ71EZIyaiyo/PdYPX2EULNm8C+gOFIrsggipVxt7oYTzEQhogJtblISh3H/rtBEQ+
 vqNNlphoEEpCnwfrKdGYIKiOU2S3xp/QLm3AQCxFKSSIbg4q7PHl8mCsiIaXVRQAtVoBuDguZ3/
 CwlY4Hl+zI9wsNdWh09G8+C95WOGbSQul5LWEzq+eNlopX/2r/50m3Yu3kmFNqEARid/PtgtcrC
 OJTMRJW4Ohhsi8HGf0GFyv1LAl2P8xu4RUwVL/4SP2MzMg7iazAlZbbXc05O9BCvfP6s0JI2Yu+
 KNh0uP7oXCAKQ7Jt5J4zGI0376RuS4fEgVofTdSYnHZi+9OQES9Ww3Kps13xIS96+9zrNe/j5Kl
 CiC85g6WdbLDFSEg0I4eZ7bpdN4Rgj8GFOVVUYgLJqFXdb6q0LLrAJqodNUAVjtAeSAgitAbAhj ywZWoUCPOGTRV5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

If earlier opening of source graph fails (e.g. ADSP rejects due to
incorrect audioreach topology), the graph is closed and
"dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
graph continues though and next call to q6apm_lpass_dai_prepare()
receives dai_data->graph[dai->id]=NULL leading to NULL pointer
exception:

  qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
  qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
  q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: fail to start APM port 78
  q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on TX_CODEC_DMA_TX_3: -22
  Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
  ...
  Call trace:
   q6apm_graph_media_format_pcm+0x48/0x120 (P)
   q6apm_lpass_dai_prepare+0x110/0x1b4
   snd_soc_pcm_dai_prepare+0x74/0x108
   __soc_pcm_prepare+0x44/0x160
   dpcm_be_dai_prepare+0x124/0x1c0

Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Use approach suggested by Srini (you gave me some code, so shall I
   add Co-developed-by?)
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index a0d90462fd6a..20974f10406b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -213,8 +213,10 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 
 	return 0;
 err:
-	q6apm_graph_close(dai_data->graph[dai->id]);
-	dai_data->graph[dai->id] = NULL;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		q6apm_graph_close(dai_data->graph[dai->id]);
+		dai_data->graph[dai->id] = NULL;
+	}
 	return rc;
 }
 
-- 
2.48.1


