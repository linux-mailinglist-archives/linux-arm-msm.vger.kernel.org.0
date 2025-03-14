Return-Path: <linux-arm-msm+bounces-51455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C121A61887
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF64319C0F1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF03204C35;
	Fri, 14 Mar 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJKBzx7e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A6204696
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974519; cv=none; b=lKJwq740QzoaUYh1O9KE94q4r6dzC10+v9ffXErqmH22EDDkjqs526kW52lwqZ6ChgAjps7wuParFbUZ+uDmzaxs9Izy8mFlhoLp9hFEXNnCetsLEqXfeqxY2PRXFBBiTniFVqOcpFhWSWwCn6tRsLg9KWf8QFRMSk5AEY0vjSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974519; c=relaxed/simple;
	bh=kR7vQIpKuKVU6uOBjHBa7C2tnbKEH2GpwQgL9Z6Aaqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3eUWvhSzOgjBEKUyo0HxGFyImV/xqexWUOW6BrumncFtgbOXoKd6wT/tRzyX2lCsUqgm4U9Lri9QTe6NQY+wHqeaWTE+6jd66OZeV4cCNusXGFNuUjuRQKjkgMJZCfd7WSMucjjuyqWt2y/NZiJNOP/dxBouwSpdYLcgaHKXuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJKBzx7e; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso2080440f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974515; x=1742579315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekNUjvV0aZinr/Wdt5BX9JoNO1SKBq/J2zFS3VBUJfM=;
        b=qJKBzx7erXlBrDrOHAxlrJqYfMV9V8SU6mm2rQhgVH48uzIePmZkitHrlcravbY+wL
         8bkDKqEKUnRYEDlBcBjAIQ97SQ6Jtcgrb0BKIL3kp5I3DICUqAW5dJatztvqa53FNyuX
         FKq5dNZNBm0CdPXkp0j+IrVYebOlQZ5iqH2CLpSmmnSAmO9CEl0RWlgHOOA+kaUn/0Cn
         oYHeLS7SZVvH5Z8fr0fajwwGlN0SIeKd55tLKA3IY7RqKT5eEQFbv76kthPjp6D2vPst
         IQrbvkKGLmTtnLWrJhNjUL+BZUNbSMwAasIRNX5J74NykSlRe6ycdrMucCwc0acpPeIM
         OT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974515; x=1742579315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekNUjvV0aZinr/Wdt5BX9JoNO1SKBq/J2zFS3VBUJfM=;
        b=uI4DBTdaKm1VB1B66DPWmJgu7Tmq7jVtpTuzJGjaUCT2qn+NIs1sTrrAdpLX8A9O6P
         9jmjX5YhTt6NK/U/QKvN9Y6bsrZ7xDQ/L41zXQuuUnMmW2zNy6P+wCtRW0Q1HUiNIaAS
         8eCayh9Nxwq/nV4th4QGwjH5gEChhCJ6afNWMuBmGfbRLbno+Bo4gN+MUiZydQUlHMoF
         G1Eg7gLwtjdVlTb7WFX2MM9Dj3pTDTQD20l1bRtOPoGZ1slu5GakzkrkuDACzD1uR3EN
         7W6AmxFvAVXkOp4abV39gUxS9SQ51Ujw0U5quALo0WJLN1O9rOsgQhvfMVvcNe4lWy3R
         Gmxg==
X-Forwarded-Encrypted: i=1; AJvYcCV4BcgbfRmxOvgKPqeUa1w4RhcHGzz71sEIsZHs/hSD94lk+Tc25/tDmVfzvWAryZBMwLEVWW2Tj9jXozsy@vger.kernel.org
X-Gm-Message-State: AOJu0YyJu5M2mjtE06Pi7pFfC6cVMeNggVHj4ox8tn0yO3b/dtzyt44F
	b9xzsnaI61Gd4PArbOQanIJkprjiHiZd3AzK6Nf38o+eYal72iY4zzYYAV4bfC4=
X-Gm-Gg: ASbGncux8GlppLh3Uo1zNanyl0wdzLOlR29VEG9PL1zGNCGMEuzNozmpvX5YGRAPs3J
	0Sn4y83IzVCF4JtAcXiZYDKuuq6dOZRxps6IPTBcrVbtaOO5BqVqqlWxrEDH7u6Fz3uqVgfZjwr
	0nHyxzPf6SiGpx2iEfmIOQzqx3PT+aUJlP1kaO1Wglwr5svtBYBvX//2bWvu9sO7ZTnaytD8SdU
	o9Ei9lWjz2CRD5kKtIVufvNXuJkM06fxzGLyvAk+b+6QRX9oGFbdlYa1Khgvx3Tb3MsAqvVboPe
	EPL6N0owsH1lLvoXZ+aHGXdngs4kFb6CrBsNBnVx30F7xn6kF5ghtk3ESqBeIf2YyjBKMyESDgs
	4ECo9
X-Google-Smtp-Source: AGHT+IENJZZgGY1aoIK7LKxCJxD7lsJhw1CEecwJGhMThtbgrKvCf51QCn31YGELReUPaDMQwLikmw==
X-Received: by 2002:a05:6000:1f8b:b0:391:1458:2233 with SMTP id ffacd0b85a97d-3971d235022mr5382107f8f.11.1741974514979;
        Fri, 14 Mar 2025 10:48:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:33 -0700 (PDT)
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
Subject: [PATCH v5 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
Date: Fri, 14 Mar 2025 17:47:57 +0000
Message-Id: <20250314174800.10142-3-srinivas.kandagatla@linaro.org>
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

Implement an helper function in q6apm to be able to read the current
hardware pointer for both read and write buffers.

This should help q6apm-dai to get the hardware pointer consistently
without it doing manual calculation, which could go wrong in some race
conditions.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm.c | 18 +++++++++++++++++-
 sound/soc/qcom/qdsp6/q6apm.h |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2a2a5bd98110..ca57413cb784 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -494,6 +494,19 @@ int q6apm_read(struct q6apm_graph *graph)
 }
 EXPORT_SYMBOL_GPL(q6apm_read);
 
+int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
+{
+	struct audioreach_graph_data *data;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	return (int)atomic_read(&data->hw_ptr);
+}
+EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
+
 static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
@@ -520,7 +533,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		done = data->payload;
 		phys = graph->rx_data.buf[token].phys;
 		mutex_unlock(&graph->lock);
-
+		/* token numbering starts at 0 */
+		atomic_set(&graph->rx_data.hw_ptr, token + 1);
 		if (lower_32_bits(phys) == done->buf_addr_lsw &&
 		    upper_32_bits(phys) == done->buf_addr_msw) {
 			graph->result.opcode = hdr->opcode;
@@ -553,6 +567,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		rd_done = data->payload;
 		phys = graph->tx_data.buf[hdr->token].phys;
 		mutex_unlock(&graph->lock);
+		/* token numbering starts at 0 */
+		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);
 
 		if (upper_32_bits(phys) == rd_done->buf_addr_msw &&
 		    lower_32_bits(phys) == rd_done->buf_addr_lsw) {
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index c248c8d2b1ab..7ce08b401e31 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -2,6 +2,7 @@
 #ifndef __Q6APM_H__
 #define __Q6APM_H__
 #include <linux/types.h>
+#include <linux/atomic.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 #include <linux/kernel.h>
@@ -77,6 +78,7 @@ struct audioreach_graph_data {
 	uint32_t num_periods;
 	uint32_t dsp_buf;
 	uint32_t mem_map_handle;
+	atomic_t hw_ptr;
 };
 
 struct audioreach_graph {
@@ -150,4 +152,5 @@ int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph,
 int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
 int q6apm_remove_trailing_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
 int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph, uint32_t codec_id);
+int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir);
 #endif /* __APM_GRAPH_ */
-- 
2.39.5


