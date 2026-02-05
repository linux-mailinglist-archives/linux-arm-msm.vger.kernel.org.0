Return-Path: <linux-arm-msm+bounces-91958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKqMFE/RhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:20:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5614F5D36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20F643051C86
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E25C43D50E;
	Thu,  5 Feb 2026 17:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCREUsYv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B989dFO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33BB43CEC0
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311675; cv=none; b=nyZ4mPF7Co9gvv/CBgiaXNA+1pRpDnPCRwVlb986ILOYTelZwh/7jBxGtIXqCqHlTX5tpRInL1IUni5xPdGMT+ONDjyr30qF1a+q8JNpzpVCspVkzN07ILnVGVsNwoiH43yujICtoojoWX63NCuT8riSLcx/qEWVcs4y5O09e78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311675; c=relaxed/simple;
	bh=vuRX+W1q3fyWlPl+Qsrbnh5CxCX5l6c/vEM8mN6V/20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YT+OKi4dObNacf5wzj+cq2jw3TU5rK9d1dSzscjXdsDlSvUWUvPYrts99OthFgo9VOx13WDpU5Hs7aFgx8Mxteh1Q8rUppBjC4lEY/9IgxjEghz1TYPFiLU8VqyCr9axrZDK7UJWza+MHBeodGfJUrRtjSnG1n2CMiqQl1LeLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCREUsYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B989dFO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B3wiw176892
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y56whS/w1wg
	0ftrGnAYvb5bPQHNA0WkHm66yq2qgP18=; b=NCREUsYv9ISnBgx4lXH8wmKGl3z
	jGFxwb+Pnc0DIiNMuxylT/5Ya9A/e56xFz2Req5Brn6IPZSuytxGCVlmdUg253ud
	PTZYkVIln23VamJJzbt0cTTf6wu6pSmKYES3+15tLIL0YXIhNAM1ddlLHzR2xck6
	VODGBS2HKdfqSlRkSIRz+BO3ZDNfcnwxK6KaHWqsF42HNDoQT17s3aMWh61lWmVP
	b6fD3v2zDeHwTcTmqWSf99GN7txrR/rRBAWUzVil4mDzZ1XtIoPmbivMsbEpydnf
	vvIH+DGsss6F0xwcduUfR60JKn3degQBEIsllmhIpdq/bzTM0Mqfe2UxApw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p154f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89493622b50so22072436d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311671; x=1770916471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y56whS/w1wg0ftrGnAYvb5bPQHNA0WkHm66yq2qgP18=;
        b=B989dFO4WnaoCoTW73oUCHacMF86R/OzP/p7c1I/NbBSUh5TncqaQaazoqdMZGDj0a
         YvwSWJSfrBURMwcQzHCVg/SJ0xIC6bnYxdKH0FqaRGJXUeZnU6rOdpOM7DKCSpyZ2//n
         mrbqZ3j/2zoyIaqrstfdLM4kt7BPTlpsh0mwMSLbwbp18QTn8SMDU/W550ZDllBoCZSJ
         77Eu5AkLnOmI7oPb+mers2TEu4ZOqCh0jNeGVCwmntHAbLwmSTj2hRRVSKmz7yoWvqqy
         HV23SXv6V3qXlW/VrtVZur5RB87VQ9N0NBys8zRraGo+kgoAqLJQPKD9cSKZs58e9kn6
         3kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311671; x=1770916471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y56whS/w1wg0ftrGnAYvb5bPQHNA0WkHm66yq2qgP18=;
        b=u+FVDFWaxORCp0r8VKHx8lQ+u76KxUeWFaNJyClwEMohcABepkGZuBIgP3I3RjcEGM
         FCUQ94EYT3dIvcn4g1zkaZnuIFwntnCOwdZ3vszSBC5Z0DHuQfa+m7YhUoOFAJaxBksF
         xlfY4c74/g83wmRAEXBODlRdqAsvG76LAzDPTKOZQBi/V4aRmNRBM85Kv6cVVsuzMtKr
         rmhkydwnlWjeoIhn1SltI3TPEKA/7GMB8ePWJlhzgrEAS6yLxMmjSnk9JwlWprlUqeBg
         QNixl38bp2V1eKCpeNWb5GRYLw+HIna8n8zpqHIgFrCcasxul3YmecgNdvIQLHWcbZN9
         HSRg==
X-Forwarded-Encrypted: i=1; AJvYcCWhUKQM45yHSDUaaoW1iaLPx4XfHOp1dxsi67mjkQj09qHeoFtJyGYcWVEjg/mE+iQcs+dIFm3SlRP+SHcS@vger.kernel.org
X-Gm-Message-State: AOJu0YyMS8nFAbFqPiXBEJ4jS/qVLBboMjL9mT3cGVme/lzxo0uuGKPU
	+qcqF0HxX8cIGWZQdeWCSR7W9abHaD4OX54skhOhpQEt55OLfDLkx3UME2aTFt6SF3KF9P692L+
	Vkjvj37VkyVHR0dp9VuiOEJXISqizjnooTtT3Ogy9EX/yIVQ8xVgYDMHVGmBCemFS/WeH
X-Gm-Gg: AZuq6aJQlfZoZYMHyHxji0sPq4zWl7KV0mUuIu84Wh7S0JNs2WHne8HcWUcqQZW02Zm
	TY6k9MePMxcy82Zg9p+3tnl2cnr73FEr5egMLdIRMXtxFjd4jiiv/hqUwDAKsALE8/ddqOHC3Lu
	L79pT/p/lM6lO25vNV9KHjGe0eLGqg6O4RAM4y5eRHBl8bmt+kQ+dVRl8MHBWxCuigeWcqz3Ln/
	6aJ1egLgGd5u7uZT/axK9POrmrAQLh38UzYY7pimQNZz1iWKNF0YwLPjBiWHxhNRludzOQjrvID
	g0UsPio0xq7aq7anKECIDtBcr91JLFnvN5KK9iGhh/vogwDG+WfVr3uYmMoR61tVmFuUd1fGsw6
	jwHtOoSLq7+nB3BWLSxOexOmeOFWojpil8GMOXV8NWHw=
X-Received: by 2002:a05:620a:4720:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8ca2f868aa7mr897622585a.40.1770311670396;
        Thu, 05 Feb 2026 09:14:30 -0800 (PST)
X-Received: by 2002:a05:620a:4720:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8ca2f868aa7mr897615485a.40.1770311669785;
        Thu, 05 Feb 2026 09:14:29 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:29 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 10/10] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
Date: Thu,  5 Feb 2026 12:14:11 -0500
Message-ID: <20260205171411.34908-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=6984cff7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5FlrmoDGYMl1lO3QxRMA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: gMFys9pnRYgXzeretU52vAJFqFchmlD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfXxHm8nMWF/2Yb
 bYuZBNHfqrMB6O1bX1sWxr84zfO6U1RXWQ9vnwsWH5/z915FUvx5Pe+PnyiO7axmzvvPnx9U0Vz
 NaJIPjlxNgLwoXGg/82aIOhRFT9841liEnDCRZlurdjyyPjKpwYAX5pLkAIpeNNrJTPo2oZAs2k
 bUU+R0JcyAzzaAZRd3iTzVTlGHx1er5/E1NYO3BP8f6O0obNJm6LuXVFSAzufyecuaWZ3bqQYzK
 oppoi7XbQnzw6M3Z1Lc9gqbLWf+prqVqSiE2CjmejppSBxzAzEDgrt9yET9a108N/sVsSiGXZE3
 5aigcz/Y+fgqfZ09T0qpyyjHzIc8YQJFccARZGdbo+HhVcpoNy/P8V0tzwKZWGSKwB+J0aOfq54
 NyICbLrBjWj2DcuTR2RUzbHg3KKDjLmNtvXPlnYqBo0WoAhzN06mhlWgcNLJXQIPNyiDEQqQepa
 P6NglvpRdZPfaQWndOQ==
X-Proofpoint-GUID: gMFys9pnRYgXzeretU52vAJFqFchmlD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91958-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5614F5D36
X-Rspamd-Action: no action

Buffers are allocated on pcm_new and mapped in the dsp on every prepare call,
which is inefficient and unnecessary.

Improve this situation by adding adding a functions
q6apm_[un]map_memory_fixed_region to map it on to dsp only once after
allocation.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c |  60 -----------
 sound/soc/qcom/qdsp6/audioreach.h |   5 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  99 ++++++++++++++++---
 sound/soc/qcom/qdsp6/q6apm.c      | 159 ++++++++++++++++++++----------
 sound/soc/qcom/qdsp6/q6apm.h      |  15 ++-
 5 files changed, 208 insertions(+), 130 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..b2975eebab71 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1396,66 +1396,6 @@ void audioreach_graph_free_buf(struct q6apm_graph *graph)
 }
 EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
 
-int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, size_t period_sz,
-				  unsigned int periods, bool is_contiguous)
-{
-	struct apm_shared_map_region_payload *mregions;
-	struct apm_cmd_shared_mem_map_regions *cmd;
-	uint32_t num_regions, buf_sz, payload_size;
-	struct audioreach_graph_data *data;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
-	void *p;
-	int i;
-
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		data = &graph->rx_data;
-	else
-		data = &graph->tx_data;
-
-	if (is_contiguous) {
-		num_regions = 1;
-		buf_sz = period_sz * periods;
-	} else {
-		buf_sz = period_sz;
-		num_regions = periods;
-	}
-
-	/* DSP expects size should be aligned to 4K */
-	buf_sz = ALIGN(buf_sz, 4096);
-
-	payload_size = sizeof(*cmd) + (sizeof(*mregions) * num_regions);
-
-	pkt = audioreach_alloc_apm_pkt(payload_size, APM_CMD_SHARED_MEM_MAP_REGIONS, dir,
-				     graph->port->id);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
-
-	p = (void *)pkt + GPR_HDR_SIZE;
-	cmd = p;
-	cmd->mem_pool_id = APM_MEMORY_MAP_SHMEM8_4K_POOL;
-	cmd->num_regions = num_regions;
-
-	cmd->property_flag = 0x0;
-
-	mregions = p + sizeof(*cmd);
-
-	mutex_lock(&graph->lock);
-
-	for (i = 0; i < num_regions; i++) {
-		struct audio_buffer *ab;
-
-		ab = &data->buf[i];
-		mregions->shm_addr_lsw = lower_32_bits(ab->phys);
-		mregions->shm_addr_msw = upper_32_bits(ab->phys);
-		mregions->mem_size_bytes = buf_sz;
-		++mregions;
-	}
-	mutex_unlock(&graph->lock);
-
-	return audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
-}
-EXPORT_SYMBOL_GPL(audioreach_map_memory_regions);
-
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 {
 	struct data_cmd_wr_sh_mem_ep_eos *eos;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6ddc287f0fb4 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -722,6 +722,7 @@ struct audioreach_connection {
 
 struct audioreach_graph_info {
 	int id;
+	uint32_t mem_map_handle;
 	uint32_t num_sub_graphs;
 	struct list_head sg_list;
 	/* DPCM connection from FE Graph to BE graph */
@@ -838,10 +839,6 @@ int audioreach_tplg_init(struct snd_soc_component *component);
 
 /* Module specific */
 void audioreach_graph_free_buf(struct q6apm_graph *graph);
-int audioreach_map_memory_regions(struct q6apm_graph *graph,
-				  unsigned int dir, size_t period_sz,
-				  unsigned int periods,
-				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
 			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 94066b69b5b5..35ec05fa90bc 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -228,11 +228,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
 	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
-
 	if (prtd->state) {
 		/* clear the previous setup if any  */
 		q6apm_graph_stop(prtd->graph);
-		q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+		q6apm_free_fragments(prtd->graph, substream->stream);
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
@@ -247,8 +246,8 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	if (ret < 0)
 		dev_err(dev, "%s: CMD Format block failed\n", __func__);
 
-	ret = q6apm_map_memory_regions(prtd->graph, substream->stream, prtd->phys,
-				       (prtd->pcm_size / prtd->periods), prtd->periods);
+	ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
+				(prtd->pcm_size / prtd->periods), prtd->periods);
 
 	if (ret < 0) {
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
@@ -403,6 +402,12 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	else
 		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
+	ret = q6apm_set_memory_map_handle(prtd->graph, substream->stream);
+	if (ret < 0) {
+		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+		goto  err;
+	}
+
 	return 0;
 err:
 	kfree(prtd);
@@ -416,9 +421,10 @@ static int q6apm_dai_close(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 
-	if (prtd->state) { /* only stop graph that is started */
+	if (prtd->state) {
+		/* only stop graph that is started */
 		q6apm_graph_stop(prtd->graph);
-		q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+		q6apm_free_fragments(prtd->graph, substream->stream);
 	}
 
 	q6apm_graph_close(prtd->graph);
@@ -467,11 +473,80 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static int q6apm_dai_memory_map(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int graph_id)
+{
+	struct q6apm_dai_data *pdata;
+	struct device *dev = component->dev;
+	phys_addr_t phys;
+	int ret;
+
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata) {
+		dev_err(component->dev, "Drv data not found ..\n");
+		return -EINVAL;
+	}
+
+	if (pdata->sid < 0)
+		phys = substream->dma_buffer.addr;
+	else
+		phys = substream->dma_buffer.addr | (pdata->sid << 32);
+
+	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys, BUFFER_BYTES_MAX);
+	if (ret < 0)
+		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+
+	return ret;
+}
+
 static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_pcm *pcm = rtd->pcm;
 	int size = BUFFER_BYTES_MAX;
+	int graph_id, ret;
+	struct snd_pcm_substream *substream;
+
+	graph_id = cpu_dai->driver->id;
+
+	ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+	if (ret)
+		return ret;
+
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+		ret = q6apm_dai_memory_map(component, substream, graph_id);
+		if (ret)
+			return ret;
+	}
+
+	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
+		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+		q6apm_dai_memory_map(component, substream, graph_id);
+		if (ret)
+			return ret;
+	}
 
-	return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+	return 0;
+}
+
+static void q6apm_dai_pcm_destruct(struct snd_soc_component *component, struct snd_pcm *pcm)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_soc_pcm_runtime *soc_prtd;
+	struct snd_soc_dai *cpu_dai;
+	int graph_id;
+
+	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
+		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+	else
+		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+
+	soc_prtd = snd_soc_substream_to_rtd(substream);
+	cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
+
+	graph_id = cpu_dai->driver->id;
+	q6apm_unmap_memory_fixed_region(component->dev, graph_id);
 }
 
 static int q6apm_dai_compr_open(struct snd_soc_component *component,
@@ -530,7 +605,8 @@ static int q6apm_dai_compr_free(struct snd_soc_component *component,
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 
 	q6apm_graph_stop(prtd->graph);
-	q6apm_unmap_memory_regions(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
+	q6apm_free_fragments(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
+	q6apm_unmap_memory_fixed_region(component->dev, prtd->graph->id);
 	q6apm_graph_close(prtd->graph);
 	snd_dma_free_pages(&prtd->dma_buffer);
 	prtd->graph = NULL;
@@ -679,9 +755,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 		if (ret)
 			return ret;
 
-		ret = q6apm_map_memory_regions(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK,
-					       prtd->phys, (prtd->pcm_size / prtd->periods),
-					       prtd->periods);
+		ret = q6apm_alloc_fragments(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK,
+					prtd->phys, (prtd->pcm_size / prtd->periods),
+					prtd->periods);
 		if (ret < 0)
 			return -ENOMEM;
 
@@ -834,6 +910,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
 	.pcm_construct	= q6apm_dai_pcm_new,
+	.pcm_destruct	= q6apm_dai_pcm_destruct,
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 282ba22938e7..7b5f76955cae 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -200,13 +200,61 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
 
-int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
-			     size_t period_sz, unsigned int periods)
+int q6apm_set_memory_map_handle(struct q6apm_graph *graph, unsigned int dir)
+{
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		graph->rx_data.mem_map_handle = graph->info->mem_map_handle;
+	else
+		graph->tx_data.mem_map_handle = graph->info->mem_map_handle;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(q6apm_set_memory_map_handle);
+
+int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phys_addr_t phys,
+				  size_t sz)
+{
+	struct audioreach_graph_info *info;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct apm_shared_map_region_payload *mregions;
+	struct apm_cmd_shared_mem_map_regions *cmd;
+	int payload_size = sizeof(*cmd) + (sizeof(*mregions));
+	uint32_t buf_sz;
+	void *p;
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size,
+						APM_CMD_SHARED_MEM_MAP_REGIONS, graph_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	info = idr_find(&apm->graph_info_idr, graph_id);
+	if (!info)
+		return -ENODEV;
+
+	/* DSP expects size should be aligned to 4K */
+	buf_sz = ALIGN(sz, 4096);
+
+	p = (void *)pkt + GPR_HDR_SIZE;
+	cmd = p;
+	cmd->mem_pool_id = APM_MEMORY_MAP_SHMEM8_4K_POOL;
+	cmd->num_regions = 1;
+	cmd->property_flag = 0x0;
+
+	mregions = p + sizeof(*cmd);
+
+	mregions->shm_addr_lsw = lower_32_bits(phys);
+	mregions->shm_addr_msw = upper_32_bits(phys);
+	mregions->mem_size_bytes = buf_sz;
+
+	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
+}
+EXPORT_SYMBOL_GPL(q6apm_map_memory_fixed_region);
+
+int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
+				size_t period_sz, unsigned int periods)
 {
 	struct audioreach_graph_data *data;
 	struct audio_buffer *buf;
 	int cnt;
-	int rc;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		data = &graph->rx_data;
@@ -248,21 +296,37 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_unlock(&graph->lock);
 
-	rc = audioreach_map_memory_regions(graph, dir, period_sz, periods, 1);
-	if (rc < 0) {
-		dev_err(graph->dev, "Memory_map_regions failed\n");
-		audioreach_graph_free_buf(graph);
-	}
-
-	return rc;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(q6apm_map_memory_regions);
+EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
 
-int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
+int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct audioreach_graph_info *info;
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
+						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	info = idr_find(&apm->graph_info_idr, graph_id);
+	if (!info)
+		return -ENODEV;
+
+	if (!info->mem_map_handle)
+		return 0;
+
+	cmd = (void *)pkt + GPR_HDR_SIZE;
+	cmd->mem_map_handle = info->mem_map_handle;
+
+	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
+}
+EXPORT_SYMBOL_GPL(q6apm_unmap_memory_fixed_region);
+
+int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
+{
 	struct audioreach_graph_data *data;
-	int rc;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		data = &graph->rx_data;
@@ -272,22 +336,11 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 	if (!data->mem_map_handle)
 		return 0;
 
-	struct gpr_pkt *pkt __free(kfree) =
-		audioreach_alloc_apm_pkt(sizeof(*cmd), APM_CMD_SHARED_MEM_UNMAP_REGIONS,
-					 dir, graph->port->id);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
-
-	cmd = (void *)pkt + GPR_HDR_SIZE;
-	cmd->mem_map_handle = data->mem_map_handle;
-
-	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
-
 	audioreach_graph_free_buf(graph);
 
-	return rc;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(q6apm_unmap_memory_regions);
+EXPORT_SYMBOL_GPL(q6apm_free_fragments);
 
 int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples)
 {
@@ -494,7 +547,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
 	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
-	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
 	const struct gpr_ibasic_rsp_result_t *result;
 	struct q6apm_graph *graph = priv;
 	const struct gpr_hdr *hdr = &data->hdr;
@@ -529,18 +581,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 				done->buf_addr_msw);
 		}
 
-		break;
-	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
-		graph->result.opcode = hdr->opcode;
-		graph->result.status = 0;
-		rsp = data->payload;
-
-		if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
-			graph->rx_data.mem_map_handle = rsp->mem_map_handle;
-		else
-			graph->tx_data.mem_map_handle = rsp->mem_map_handle;
-
-		wake_up(&graph->cmd_wait);
 		break;
 	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:
 		if (!graph->ar_graph)
@@ -571,17 +611,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		break;
 	case GPR_BASIC_RSP_RESULT:
 		switch (result->opcode) {
-		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			graph->result.opcode = result->opcode;
-			graph->result.status = 0;
-			if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
-				graph->rx_data.mem_map_handle = 0;
-			else
-				graph->tx_data.mem_map_handle = 0;
-
-			wake_up(&graph->cmd_wait);
-			break;
-		case APM_CMD_SHARED_MEM_MAP_REGIONS:
 		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
 		case APM_CMD_SET_CFG:
 			graph->result.opcode = result->opcode;
@@ -773,7 +802,9 @@ struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, ui
 static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	gpr_device_t *gdev = priv;
+	struct audioreach_graph_info *info;
 	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
+	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
 	struct device *dev = &gdev->dev;
 	struct gpr_ibasic_rsp_result_t *result;
 	const struct gpr_hdr *hdr = &data->hdr;
@@ -790,6 +821,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		break;
 	case GPR_BASIC_RSP_RESULT:
 		switch (result->opcode) {
+		case APM_CMD_SHARED_MEM_MAP_REGIONS:
 		case APM_CMD_GRAPH_START:
 		case APM_CMD_GRAPH_OPEN:
 		case APM_CMD_GRAPH_PREPARE:
@@ -804,10 +836,37 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 					result->opcode);
 			wake_up(&apm->wait);
 			break;
+		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
+			apm->result.opcode = hdr->opcode;
+			apm->result.status = 0;
+			rsp = data->payload;
+
+			info = idr_find(&apm->graph_info_idr, hdr->token);
+			if (info)
+				info->mem_map_handle = 0;
+			else
+				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
+					result->opcode);
+			wake_up(&apm->wait);
+			break;
 		default:
 			break;
 		}
 		break;
+	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
+		apm->result.opcode = hdr->opcode;
+		apm->result.status = 0;
+		rsp = data->payload;
+
+		info = idr_find(&apm->graph_info_idr, hdr->token);
+		if (info)
+			info->mem_map_handle = rsp->mem_map_handle;
+		else
+			dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
+				result->opcode);
+
+		wake_up(&apm->wait);
+		break;
 	default:
 		break;
 	}
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 19e223635edf..6bdc63c7dc01 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -133,11 +133,16 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 		      uint32_t lsw_ts, uint32_t wflags);
 
 /* Memory Map related */
-int q6apm_map_memory_regions(struct q6apm_graph *graph,
-			     unsigned int dir, phys_addr_t phys,
-			     size_t period_sz, unsigned int periods);
-int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
-			       unsigned int dir);
+int q6apm_map_memory_fixed_region(struct device *dev,
+			     unsigned int graph_id, phys_addr_t phys,
+			     size_t sz);
+int q6apm_set_memory_map_handle(struct q6apm_graph *graph,
+			     unsigned int dir);
+int q6apm_alloc_fragments(struct q6apm_graph *graph,
+			unsigned int dir, phys_addr_t phys,
+			size_t period_sz, unsigned int periods);
+int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir);
+int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id);
 /* Helpers */
 int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
-- 
2.47.3


