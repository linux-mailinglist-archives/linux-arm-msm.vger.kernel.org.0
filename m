Return-Path: <linux-arm-msm+bounces-115875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j4+IK3gxRmoPLgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:38:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2016F55AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:38:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=pGNIMCGF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115875-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115875-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 916973006B6F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4219247CC9A;
	Thu,  2 Jul 2026 09:31:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0247CC91
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:31:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984714; cv=none; b=qQ4P32jJGIKUM/YS0miTPFkP9yeKg28oADkSisyGyAEY4faFOQd+ELJGq+C9Y9deEG9ZvLWxiTffxoA1RrUzcKl7qrfvs411nI7JhRhQO3IPuky5+eFMCuWbxb147s5dzhZPpfmGlb2TIZ3TD7XFsHdzlf++A7/MlSW3OVNbEqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984714; c=relaxed/simple;
	bh=JS2Cu9PFhjN+oRxK7VK2ewZJHs6kGgiOoatbXi2VYGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZvCcNX4aReS/r5+DE4DhVN5wtRZWM8IMZN9tYOgVWsX+F2R6AwK9bjX/jd/lXxtarpR0diSOWtJT3KFRBSYAOxK1Ge2+rbNKOwEf6Ll7SHjgJxUeWOgEnPOblRxMaEO4j1bShjYO/fYKsc73uJFG61kItARmk1oU1x7ifwJQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGNIMCGF; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472055b0efaso1089939f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984711; x=1783589511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ok2v3DlNrjowCRkiJ8n5iUqw+rf50B18Q+TzPiUx5ao=;
        b=pGNIMCGFfqNm9HQk8AbR4MbtUlkHJNpOteWUFzA0YfW3ZjNN816jBcrb5SugDXk7bU
         MxiSW2irQh0SRDytH6Dw/1pq+H2AaR4NqDPlZLfsrFzfPW2VgC/+iHy6+ZaBrrQPl0F1
         kJbYV9LISxpprOikSMA6Yvw3k0RlpNxmHswrSWzGb09XEzCx2FiRDryR9H/G12rBisbX
         +JKHg+JoAfUBshcJu7tLZf5w0n3IBImkl3QOH1CPzhE6UPWf8h0b8teks2X+2FiLSy0t
         /qgMzW3ggNtxAxrLzCAcWl2VoZHjiPtAXn5/VlxN/EmKe+Ry3o6+rG+uiJ2swb8k4tW5
         1DDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984711; x=1783589511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ok2v3DlNrjowCRkiJ8n5iUqw+rf50B18Q+TzPiUx5ao=;
        b=Obv2+iW6d5wactBEaCd15lBLpQt9mD0+s4mdtRY7W7X4XsdbPB+y/Nvma4RnLwt+Ok
         HUWM3JnuUoDpJleOScriBhmAalPRQ1mjgNJo7YX1NXmAwYDyzUZNbUITu7e7nlEhyewr
         QgYVmD1G7pysA/RX0+LgfFeh2EVEeRJtBggP/FMOJAhCZGi5lMVZTBMRz0OGqnfpgPua
         jRVL5RlVmmjBKk2j2M333fCrmvNGxtCTnOqjXTEisge/r4+5npe0w52+A94dKDMB6Hl4
         weVCO0Ws+vj8YzaF2+kGp8GgN4LqCnAGF7+FNo5fr3l6oAbnVMigie7liq4vPhfuvu59
         lFSw==
X-Forwarded-Encrypted: i=1; AHgh+RpH5wt1eR3Hv2Pklrlg6Pl253jc3CvpildpixBqc73QOv273c+/N8ZF46CmOy7vq/E7zUBCByUq8IeJTbGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVr5yq5hXEpEcD0qYlF3WQqsCtZG27RFfAaAm/MPMDbQpWbAl
	jmkgjhdpY1vgn3Kx1HDz1Q945iKN0NpHD3nPGEw91of1WxkfbzkY9gAPWc6fF5D6K6M=
X-Gm-Gg: AfdE7cksMYcrIALulQhmhgywDly2WQ16YLCesTplBZ0OBtJoOeNhCubq16X4Zdj0cRY
	W8I9wRpIZRv6Hz8jfWXM5z/p4R3tk4baVkDUNg97wp1dn5JqTyoWkJXyyaF9NYwiLQsYGM7B6z2
	eTTT+9Q+hNbEP4tz3GNz/dxN757542sgIbpft8LCskl0Z1jWggs1nRKqIXNunDboZyTf2jiUlyT
	FcONy8lAVZ7WZZFCvX/OKHsdFC5BCiekc5Ed01Ylknl5CfHvsR60y590RUrbVuA3UuZURNXflMB
	Wo56q6mmjL+Wrkd2EjvZfSs1VvprtqDHX6Oj6tm4xvntRHy9OiRduHjd0cQVq83h44qRdzjrClO
	R3gNdpOrFrcbi9jCNBpNFlEQXoiJyJWTQQ303wDDKgF85zZe8inMObBqab5NymKU0ncSMN7TjG7
	Ky/r4uES07ujyaDyaqGL4w+i+zgkH/xyal2A==
X-Received: by 2002:a05:6000:4203:b0:470:3edf:e2a7 with SMTP id ffacd0b85a97d-4775918f8a9mr7769100f8f.37.1782984710497;
        Thu, 02 Jul 2026 02:31:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:31:45 +0200
Subject: [PATCH v2 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-1-1ef8ceb8c9ec@linaro.org>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7504;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JS2Cu9PFhjN+oRxK7VK2ewZJHs6kGgiOoatbXi2VYGQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjAC5fAqRgMaqs9ZmpYSTKqTOvNcx+/MGuf5odxT
 NdmcaISJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAgAKCRB33NvayMhJ0cnID/
 0bVcrk0AJKf9CmsoTXGPJ/0hrSGfIHcilJdVhRBnSxAqhu9TPnKWlhhWFmVChcd4xhM9Y1ljLrcTxg
 jTPKiGVIEkDHLCSWP20TRv783GG/SBLP5ED/omFnna6I9FLUxDiFYdF14hMyAHnSV5f52yikfRnnFS
 2hqOofNuI3y/IZbB++jbIVnd2YWNNMghrtAtyNxZklpLwrXtYE1l1pgibJaUF4Y7k7lIvSKEzEmIbx
 y2gl2AHRhYbczI5JbdO6ETDL/UkiKtxa9IlNlDsGV83mYVh7KmT5V1lTKHMUI27qUkYJAONYHA/est
 499elzooadGxs6UksLaokkNEOqZGRVx+/nIOSJWb8KVrzjUjyoG+C23I5LDhnOF6YjS9F14CsVADp7
 I/pBjjmPSxIh1s+K3U34Dit8BYceinD0+IvcYSjf6gwROp6UUoBxQlA8el8MI6OvueDHlXf9iCDMX4
 nym/qXKDGPZYDQStJ84qWeGnPy+9Ix3DDsvWpx4RpB3lS071hjQ+I6exIyNxAWLEpMekMWJQvrIdKO
 PKQ6u01S/DxXXsMqbmGJdwkWkZ+5E4MFzcJ7d51Kd81fmw25zAXZ9ChJFDPIyW3CaAwFMYlKqr7QRt
 RA1KzBtZMBCVnJSLOcr6YqOd6XMkVN2l0uXfS87PyE0KlPUfsQyeCgJRRd8w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115875-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A2016F55AF

The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
of 2 WSA speakers connected on the WSA2 lines.

But the Audioreach DSP only handles WSA2 in pair with the WSA
interface by using the upper bits of the active_channels_mask
for WSA2 and the lower bits for WSA:

/-------------------------------------------------\
| Bits  |     3    |     2    |   1     |     0   |
|-------------------------------------------------|
| Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
\-------------------------------------------------/

Setting only the WSA2 upper bits is perfectly valid and
functional but the current Audioreach code builds the bitmask
from the channels count with:
	active_channels_mask = (1 << num_channels) - 1;

In order to enable the WSA2 bits the channel count should be 4,
but the lower WSA bits are then also enabled and the DSP errors
out when trying to play on the disabled WSA interface.

A solution would've been to add a fake WSA2 topology element which
would be translated into the top bits only, but it's not clean and
add some special exceptions in the generic Audioreach code.

The solution suggested by Srinivas is to use the channel mapping to
set this bitmask.

This works but makes all the other calls using the channel mapping fail
because the DSP requires the channel_mapping table to start from index 0
and using num_channel length in order to apply the mapping on the
active_channels_mask bits in order.

So we need to skip the empty channel mapping entries in all other
users of the channel_map to build valid channel_mapping tables.

This should not break any other usecases since the default channel
mapping always start from index 0, and will add flexibilty to allow
some special non linear mapping for other interfaces as well.

Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 47 ++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a13f753eff98..9b80cfa56e8a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -703,6 +703,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
 	int size = ic_sz + ep_sz + fs_sz + pm_sz;
 	void *p;
+	int i;
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
@@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 
 	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_index = module->hw_interface_idx;
-	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
+	intf_cfg->cfg.active_channels_mask = 0;
+	/* Convert the physical channel mapping into a bit field */
+	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
+		if (cfg->channel_map[i])
+			intf_cfg->cfg.active_channels_mask |= BIT(i);
+
 	p += ic_sz;
 
 	pm_cfg = p;
@@ -840,7 +846,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	uint32_t num_channels = cfg->num_channels;
 	int payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
 				APM_MODULE_PARAM_DATA_SIZE;
-	int i;
+	int i, j;
 	void *p;
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
@@ -860,8 +866,12 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->sample_rate = cfg->sample_rate;
 	media_format->bit_width = cfg->bit_width;
 	media_format->num_channels = cfg->num_channels;
-	for (i = 0; i < num_channels; i++)
-		media_format->channel_mapping[i] = cfg->channel_map[i];
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+		if (!cfg->channel_map[i])
+			continue;
+		media_format->channel_mapping[j++] = cfg->channel_map[i];
+	}
 
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
@@ -1080,6 +1090,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	struct apm_pcm_module_media_fmt_cmd *cfg;
 	struct apm_module_param_data *param_data;
 	int payload_size;
+	int i, j;
 
 	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
@@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->num_channels = mcfg->num_channels;
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
-	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
+		if (!mcfg->channel_map[i])
+			continue;
+		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
+	}
 
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
@@ -1127,6 +1143,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct payload_media_fmt_pcm *cfg;
 	struct media_format *header;
 	int rc, payload_size;
+	int i, j;
 	void *p;
 
 	if (num_channels > 4) {
@@ -1166,7 +1183,12 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->q_factor = mcfg->bit_width - 1;
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
-		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
+		/* Convert the physical mapping to a logical mapping of the channels */
+		for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+			if (!mcfg->channel_map[i])
+				continue;
+			cfg->channel_mapping[j++] = mcfg->channel_map[i];
+		}
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc)
@@ -1243,7 +1265,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
-	int rc, i, payload_size;
+	int rc, i, payload_size, j;
 	struct gpr_pkt *pkt;
 	void *p;
 
@@ -1284,14 +1306,19 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
 
 	cm_cfg->cfg.num_channels = num_channels * 2;
-	for (i = 0; i < num_channels; i++) {
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+		if (!mcfg->channel_map[i])
+			continue;
 		/*
 		 * Map speakers into Vsense and then Isense of each channel.
 		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
 		 * [1, 2, 3, 4]
 		 */
-		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
-		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
+		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+
+		++j;
 	}
 
 	p += cm_sz;

-- 
2.34.1


