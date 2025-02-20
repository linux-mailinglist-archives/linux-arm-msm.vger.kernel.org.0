Return-Path: <linux-arm-msm+bounces-48736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B9DA3E0C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52E937A88C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCFC20E6F7;
	Thu, 20 Feb 2025 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMVOe6X+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C18209F3F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068967; cv=none; b=fepWgvlkMgdDmzoLsZe+hm70TL9lRMB4KQtt7/o2Q0WZ/7MnuktjsXQBFu7jGxOiat992MekPDx2erBB16wD1irPyl8kocOorttTGEmQRjed4tKKKRb1l4JAVXtJwRD2OIbn950G0adS29yq2llDyFEh3pPqOjoZh+1qNkOFIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068967; c=relaxed/simple;
	bh=jtgmyAUl97OttcegIr//hFBjAziiMMMYiBD7pE3sZEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PMB7a0feiIF5YBgc2RUoisNHxQ0+GnXzfqRUm3nfiYjgaBZ0NQsMQwUyK3UJxc+84Ar1UBKGstcwqcMqwQfbCLOZjtfZgjnSlRFqoveorAY8peAqgkXgkkJV03luAYP6fZuNSK99iwGtxfjEwXArGWRz7PXUEKkTFqNx0N24V1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMVOe6X+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so13761895e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068963; x=1740673763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMzT+jdHxkf1ujL8A9tZIPDjBjm8GU3C3qT78yn8Ois=;
        b=GMVOe6X+ksfb2KYw3ulfKjCkKKED2gn/IKcnwOz228HCTzUSw0kU9an9K76kl3UD8Q
         pva4IsqFLhIahIgFBi2wvBWy9L38D6CT+jLH+Jfyb3cZ96Wu+H2vgZYn0/hYtkAdzvPy
         zj7vMolV2mYQJdEhremHjCgUgtmBgX7nO7KxAjIldqMDw5vDvdLYB6mbbs192tTQYvQv
         fr6k90811m8dPN21Lzce46Hj5t8T8oWNjotBNHwQrCnceLmqSNLiTEIx+4qfr1NIuONI
         L8amp1/tyfHQSjNMAe+zQU1pcUU4Nd0dJHPKRGwLF/gzJ9vVrLaq87G0pGhFsnkTaHBR
         iM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068963; x=1740673763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMzT+jdHxkf1ujL8A9tZIPDjBjm8GU3C3qT78yn8Ois=;
        b=v1/Sb0fe0lqZDDDSGFenOwcFAsF68K4jjXnvWszDmagqzOtSDkiB12e45ccD0yy4j6
         BzZdUvED3t4/ywUpr1ZENTwSr5f1L+hKN4t/GZNubaIWMuD7rEWrcBfvNfmBJRokD1G0
         pTA2loxbSpQc+TPaYOsNAhsOplBCU/n3pHstu8DxpHdzK2Dkr+pOVxNJ1lwmYCf+hYzj
         41UfnCz1jdGBMSKpNiLsfyqP/Ca5yD9hD19ZRSs/8ZgZIBZIvB2Si+p1TEfDZQPOeZRf
         myEPArb6B4110MRGyDFh5QH/Qpv8VdoWQg1igwjX0A72uGv9fhmB1Gc4sEFPrKb421H9
         AJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWOxmfh+MjTL8Blm/mcKv8MPJdxFWs+5uUJTju2l/MyP3GvJrk3Y9Ipo5m6ymDOuxDt4Z/TJ3MrtRQwVZB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/uhLVinrOVokwCW3TryYu574cT3ywi67DKmPr+ezqBHu7gWx
	tSgH/yuLi4ANcxYWQkleVQwTsJmWt0Dyo0bwbkStnErcx7KF3ST9G7imZbz/zw4=
X-Gm-Gg: ASbGnctHal3gzLoySUwUfiIH6d2etNrwR0yAfkehTFSucVt0580qN5pJylhgKWxuYOw
	ckHolvnlvLZgeIXX9bESdZWgExtknQR072XN04RDaZ/Bk2X1A1EwIHXSqb20+3U9sGIHQLaXFWk
	Hd2CsRU3C6sauZxrona0Wq8duuqbhDHhk9AHPkxL0JjsxLTVbf5U5RnXIy6T2KaM4kDbh09bku6
	hx23ivV/u9SeW7WqZFFsMWiC+hudh2DpyjwsiF+lWyjb7hv2mdK4io64QJA6bzZA1XWksIae3Ep
	ay6quQSvZJZ48FQVnTa2XZz2mS4SeBI1xxdLOJ0k
X-Google-Smtp-Source: AGHT+IFEwnzc4gMpLn2JhX4tSeUOi2UNl4o8mWNSCnBzMlPANfjpmZejT80sXvTiQRWgRNzSUA2rHg==
X-Received: by 2002:a5d:4f0d:0:b0:38d:fede:54f8 with SMTP id ffacd0b85a97d-38f615d2048mr3025832f8f.16.1740068963497;
        Thu, 20 Feb 2025 08:29:23 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:22 -0800 (PST)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
Date: Thu, 20 Feb 2025 16:28:44 +0000
Message-Id: <20250220162847.11994-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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


