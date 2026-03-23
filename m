Return-Path: <linux-arm-msm+bounces-99429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKLbKjHCwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:44:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A42FE6D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5529130BAB55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B730386C1A;
	Mon, 23 Mar 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZ8uCA0O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnFhIvQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6652384233
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305566; cv=none; b=LiAKl4lwytLDhwa3NI7PbMA6KlymSF2F3ADKws5vZEZEDip0FPK8kOU7uZKA+3j0wKLtn7kNStPlONOU0NS9vjXUoOwHr/V/kbjyDbuvrh04fj657o9mNxh3gt2OJ/FmrwK7+926tEtkGe0YhzbRsiKzc1DI6u4pCKngqIFGyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305566; c=relaxed/simple;
	bh=i7xC8QwgKa/e7Tbxlrmvz+rJTCfxQ9AsYbFRZN9K44c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyH+QOhH6lEcpcRodMXfviMa5Es31iCocqBryae/Cjbtps4oGm6XHrKaI8vjWza48WyrHtx3bYPguLehFHYBMSYDz3diAxqw3dlu0vp+vsNBn2lUc7L1yKD9TZTtVulGIP18rryXw+I/EzZ/oIW5rNoN2j7i+eSAQ7+3fzMA+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZ8uCA0O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnFhIvQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqjMM2971973
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b4BDjNCVk8p
	9irzHcBYf7+HuKzr5jBjQdwW7M52p7pY=; b=GZ8uCA0OxmSR3rFjyNRcXd6MXnl
	UaQJ+EFw16CVC0raVsnVoE+Ag+K4DZQConhYvqKbuAj4f1p3BS3Fsuner9my23/p
	uDEBxY4x9aNZAt9v+xySuwqKStoVzkpD3s+LVyjhf9C04EHDtnGk8KubQacApkoX
	Sb9p5x/oJC0SzYbPJpwDIDr4YMttZNFp90kInWZe1nVdqfRTbfzosl9h9AKbkKN6
	T5k60A24omcZqUX7Cfjg8RQno0PP0TkhFSlI0WLn3W+WSue5WauHi376O4FG7sU9
	jdswmxbvxYhbtkldabysDzqK5uxZyvfSBgJ2kTKSqQ8ozn6UmBPzAY0bJ3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc30an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso10165551cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305559; x=1774910359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4BDjNCVk8p9irzHcBYf7+HuKzr5jBjQdwW7M52p7pY=;
        b=ZnFhIvQD/p24UOghlcTI+ihl9p3y2sHeidW+M/mDa21eHtQYodk3dkqPr3O9Dcyr+v
         8XUKbeMEWDQsno9RqtZV3ZHi2EGdHFClVT3ZmKtYeKqza0pjPWiH6KxqrDsbrVrmC+oE
         HBzUeD5sjiFRkhCm0OYlltrDjt5G+Ner6JNMmYaqnEuEuJFM9sGzELZwcssLOwzkoyvr
         AGBE7J1SDJuYKVZEUixyUCx6x4waOORp8SkQEjnWTHEBZC1chcCqgfLENBwg9Te9lTVG
         waBkWFqcEKLt19RFmvG9LxEPJAw1RFs2ilma+45mdtooc2g3QoEDpl4r9HX5CsVWKXGT
         ckgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305559; x=1774910359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b4BDjNCVk8p9irzHcBYf7+HuKzr5jBjQdwW7M52p7pY=;
        b=fGYMRLNGsmkpGOH4r8me69t8zkRWBmeEe3/2NQGCvYoARFfM+J6W2Ht7jiJmdfQz83
         edsJFEHLRU/9L1qoBUwU3Y14l9gXABkuNOQR7t3k7aqy0MwzdDzeCi+WKWiSxOtSAkGD
         mj9/CfIK1JQujuawyIstNzJG5l4kckCyIZoca8GR1ndAyX1pxsD3Krj0J6ShoMKr9bY8
         +5c2EeQ3ZuF4yxRFkHHfrRFmK0TPJ6+fdiFYMzGY5tOjcUID5wzP1Kb/UAu+wisKLE3r
         fODa1b/h2vFriGue3Isid6P2IXWc6GFN4GSYBAY3vdWoosmARDuuaBWXa8LXXCl7LMGr
         i/qw==
X-Forwarded-Encrypted: i=1; AJvYcCWskPUvtR4lcm63Uungr7XiOkGzKyrmkuxik9w4qKv8cLzNt1PuYDYv1O55iQ8PaFI0srgZejnH4uUS6iSv@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTllHJY8SJev14p3AtN6/WEOSfa5Si9T95ZjKThvSJ0RF/r08
	0tDSRc1zglePx2S4UQM+mgD0el/acJhu4Bkt76QX4gpPfDg9j8hRRWGWWd57IgTc5nfOSHh86vF
	jhwbXV9vzTWPbvpKDMB/okISq48MLN3jv170f1UdvAglkv94SqdFJRiKgaC2uaAluelwZ
X-Gm-Gg: ATEYQzzsuUDY/eGhmf92Pe3OdlMkBocjft1UYHpXrYT/cC5P6yKLXT3qNhF7YIrI7na
	Pd8kqndLMtk8ViyaBfvfax1zHs3GeJEe9POFqDRx6z/saExsIf+inFeeEa9VCaV4Hm6yvZ5XGq7
	wRu/q4ZiOPAW48coUWUE7iyZYenfVAAPVMnsJXk50Ki0UAOsdYrQaNLpBCJ1esC69s6lw8wH3Q3
	k9Ovava6+MFOsTTw1lOcWMtBH4iBTaGt8LIbflx7SVubcZ1+57Uz++lu5xXmzgjkHcDkd7nMu8C
	CqafEId2rmVEr6pKXemCbQjGI/6IX/AARMiV0PuKC7kAYOBvqTh3Rg+U+pciUiBEzB4QpjNzIRh
	na2qyvC0x6XnW1y2wqrY1loxukBCjbzASvPWWXlV7uLcCJe+U4UQ3GB4=
X-Received: by 2002:a05:622a:14ca:b0:509:320:2de6 with SMTP id d75a77b69052e-50b374414c9mr208120391cf.25.1774305558791;
        Mon, 23 Mar 2026 15:39:18 -0700 (PDT)
X-Received: by 2002:a05:622a:14ca:b0:509:320:2de6 with SMTP id d75a77b69052e-50b374414c9mr208120171cf.25.1774305558253;
        Mon, 23 Mar 2026 15:39:18 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
Date: Mon, 23 Mar 2026 22:38:45 +0000
Message-ID: <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1c118 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KqBSpy-4UWhbKApt0wUA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pWlPGss7yyKV6qdTHVgU8oWQ1OBtJn-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfXwHyBwrIEV0Vs
 hc8DGQOVuTWUm7jf02P3Jh2GxIBiozMpl9Ckv35dL0VRp1ghcxZJMYgxVJ4D6ZQq29jf+ZtDx7L
 JvrIEzQpWlmSTY0ouSP+cMXeZeDGWZGFs4dsMOf5xAzhz7jcXZuGRfOaky/sl9NGYk+qxhxUvXv
 7b9aezu3tftT5zJ05ckJtUeLNzR2oOQDHgT5aGhfstIQQxXsPz2HB+3UdYfbZ//DTujjicQ08Sm
 O4dgu2YUq4WPRgwGfcKA0PyPguJW2j8dkewJGmYh5c/2GVR8hv+sYL4za6uxOcmrBvhFwgKRbeh
 +2jVdy4npH/DAuTNA6RCmlulrvc9RWXSc61Pp9LF2bycLiuk4h3BxZsrCyLuVzFaKyc1paU2/UZ
 +BZUPCL2C2UHFc2d/GHsE6YqlRQn7ccpGaCShLaGqGiCfpm4LiEz9ASwK86Nuxdj5x/1vE9uGYp
 Sod3SpA+pucup7H57Hg==
X-Proofpoint-ORIG-GUID: pWlPGss7yyKV6qdTHVgU8oWQ1OBtJn-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99429-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 254A42FE6D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Buffers are allocated on pcm_new and mapped in the dsp on every
prepare call, which is inefficient and unnecessary.

Add new functions q6apm_[un]map_memory_fixed_region to map it on
to dsp only once after allocation.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
 sound/soc/qcom/qdsp6/audioreach.h |   5 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 110 ++++++++++++++++++---
 sound/soc/qcom/qdsp6/q6apm.c      | 158 ++++++++++++++++++++----------
 sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
 5 files changed, 212 insertions(+), 135 deletions(-)

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
index 86d6438bd9fd..ae5318e0aa3b 100644
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
@@ -416,9 +415,10 @@ static int q6apm_dai_close(struct snd_soc_component *component,
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
@@ -467,11 +467,97 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
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
+		ret = q6apm_dai_memory_map(component, substream, graph_id);
+		if (ret) {
+			if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
+				q6apm_unmap_memory_fixed_region(component->dev, graph_id);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_prtd;
+	struct snd_soc_dai *cpu_dai;
+	int graph_id;
+
+	soc_prtd = snd_soc_substream_to_rtd(substream);
+	if (!soc_prtd)
+		return;
+
+	cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
+	if (!cpu_dai)
+		return;
+
+	graph_id = cpu_dai->driver->id;
+	q6apm_unmap_memory_fixed_region(component->dev, graph_id);
+}
+
+static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
+{
+	struct snd_pcm_substream *substream;
+
+	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+	if (substream)
+		q6apm_dai_memory_unmap(component, substream);
 
-	return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+	if (substream)
+		q6apm_dai_memory_unmap(component, substream);
 }
 
 static int q6apm_dai_compr_open(struct snd_soc_component *component,
@@ -530,7 +616,8 @@ static int q6apm_dai_compr_free(struct snd_soc_component *component,
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 
 	q6apm_graph_stop(prtd->graph);
-	q6apm_unmap_memory_regions(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
+	q6apm_free_fragments(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
+	q6apm_unmap_memory_fixed_region(component->dev, prtd->graph->id);
 	q6apm_graph_close(prtd->graph);
 	snd_dma_free_pages(&prtd->dma_buffer);
 	prtd->graph = NULL;
@@ -679,9 +766,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
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
 
@@ -834,6 +921,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
 	.pcm_new	= q6apm_dai_pcm_new,
+	.pcm_free	= q6apm_dai_pcm_free,
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index c874dae53163..1889d50df862 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -200,13 +200,53 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
 
-int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
-			     size_t period_sz, unsigned int periods)
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
+	if (info->mem_map_handle)
+		return 0;
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
@@ -248,46 +288,48 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
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
-	struct audioreach_graph_data *data;
-	int rc;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct audioreach_graph_info *info;
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
+						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		data = &graph->rx_data;
-	else
-		data = &graph->tx_data;
+	info = idr_find(&apm->graph_info_idr, graph_id);
+	if (!info)
+		return -ENODEV;
 
-	if (!data->mem_map_handle)
+	if (!info->mem_map_handle)
 		return 0;
 
-	struct gpr_pkt *pkt __free(kfree) =
-		audioreach_alloc_apm_pkt(sizeof(*cmd), APM_CMD_SHARED_MEM_UNMAP_REGIONS,
-					 dir, graph->port->id);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
-
 	cmd = (void *)pkt + GPR_HDR_SIZE;
-	cmd->mem_map_handle = data->mem_map_handle;
+	cmd->mem_map_handle = info->mem_map_handle;
+
+	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
+}
+EXPORT_SYMBOL_GPL(q6apm_unmap_memory_fixed_region);
 
-	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
+int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
+{
+	struct audioreach_graph_data *data;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
 
 	audioreach_graph_free_buf(graph);
 
-	return rc;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(q6apm_unmap_memory_regions);
+EXPORT_SYMBOL_GPL(q6apm_free_fragments);
 
 int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples)
 {
@@ -429,7 +471,7 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 	write_buffer->buf_size = len;
 	write_buffer->timestamp_lsw = lsw_ts;
 	write_buffer->timestamp_msw = msw_ts;
-	write_buffer->mem_map_handle = graph->rx_data.mem_map_handle;
+	write_buffer->mem_map_handle = graph->info->mem_map_handle;
 	write_buffer->flags = wflags;
 
 	graph->rx_data.dsp_buf++;
@@ -463,7 +505,7 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
 	read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
-	read_buffer->mem_map_handle = port->mem_map_handle;
+	read_buffer->mem_map_handle = graph->info->mem_map_handle;
 	read_buffer->buf_size = ab->size;
 
 	port->dsp_buf++;
@@ -494,7 +536,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
 	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
-	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
 	const struct gpr_ibasic_rsp_result_t *result;
 	struct q6apm_graph *graph = priv;
 	const struct gpr_hdr *hdr = &data->hdr;
@@ -529,18 +570,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
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
@@ -571,16 +600,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
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
 		case APM_CMD_SHARED_MEM_MAP_REGIONS:
 		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
 		case APM_CMD_SET_CFG:
@@ -779,7 +798,9 @@ struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, ui
 static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	gpr_device_t *gdev = priv;
+	struct audioreach_graph_info *info;
 	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
+	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
 	struct device *dev = &gdev->dev;
 	struct gpr_ibasic_rsp_result_t *result;
 	const struct gpr_hdr *hdr = &data->hdr;
@@ -796,6 +817,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		break;
 	case GPR_BASIC_RSP_RESULT:
 		switch (result->opcode) {
+		case APM_CMD_SHARED_MEM_MAP_REGIONS:
 		case APM_CMD_GRAPH_START:
 		case APM_CMD_GRAPH_OPEN:
 		case APM_CMD_GRAPH_PREPARE:
@@ -810,10 +832,38 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
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
+
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
index 7c646ffcf956..909fc337fd28 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -78,7 +78,6 @@ struct audioreach_graph_data {
 	struct audio_buffer *buf;
 	uint32_t num_periods;
 	uint32_t dsp_buf;
-	uint32_t mem_map_handle;
 	atomic_t hw_ptr;
 };
 
@@ -134,11 +133,14 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
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


