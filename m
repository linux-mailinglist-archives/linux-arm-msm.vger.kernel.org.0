Return-Path: <linux-arm-msm+bounces-110173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L/tKS2RGGr9lAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 426CC5F6CFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14A683176271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C11330666;
	Thu, 28 May 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaJljEms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6XV/iG+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F73B331A6D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994712; cv=none; b=BCykk9AZxpH3I8Oa64vI/vcxwTZFKBNyHd7bg66zRGzLON4p+3F+xJTAgVV4fYveV8fYXPo7lK0BllGyyuST4rw6HywNRigiByQwi4RjCr4Gz0QMTFQ+lUfSZMlbFuuMAZL62Hu5H8Pd3JhNvJsiPGuTjlh3RaZiUDCq0jfuPV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994712; c=relaxed/simple;
	bh=CXlj9K23mR8qPUX3PeSAShFKAdclQLFGUkSjy2wEbQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKgcchKOYUVYjVcG+tWWzS+eGhFwYzEa5t8y99xeRWJ6p9zvY6tq8/B3f3thnGxF16YPL+9deQd0jEsPjeMOVPkv/T5eu8W3/N0z4dQFlEK1vZvdug35w6WeJ6cDL0lg6EVXQpjGqkuDexKs/JgDI4H7lD5opd2qlHh55R6GVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaJljEms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6XV/iG+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SGFopN3203253
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LT5tF3xgMpv
	qZXrzTVKQeff3Id1ajAsfnsR/quIBRtw=; b=BaJljEmsdo483x8J22C/4LrS9Pp
	T4IPr/1ARn+M3RIw7ucrEOxcA/8i2cMRkBAk7YWvL316JOferUiJay4Y5ILHyZmY
	bR2ca6uj7uhlebcEx6HgNVj4Tt0jrZmc1YWwCOkNM4pzQpSI9C7oc6PCz2U5K2er
	a2/lrCz/jU2MoauKNRQ8jIWYwi5Me8o522vfmMM7lVxPtuLzfoT3cJRnsSrE1CwM
	Pzqxtx1uRGN4TF5bRNnKsIZ+6xUeIrcvEN5bcvf/Q/lVSmbKlMKbffcuCxLRi+3u
	uAoddxc3+ruXcZNfN7wrackR7T5c+v+UWjseSIb72ZcUziiFnJnFV610EEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynma7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso186296591cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994710; x=1780599510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT5tF3xgMpvqZXrzTVKQeff3Id1ajAsfnsR/quIBRtw=;
        b=h6XV/iG+oNzQHQMJ7VqWtl7RHlbOZ2SgbQODqfM+fUdDtCcjk199aiqWi/7ZPOmgvk
         aSnOJltsR+9nfTJ0YdrtIq0LnZ70RYuTI01dibVTiWYxAWyFeLjfvC9d3WLkJjJGYEGo
         PgvLQa+z/daLfZ7Tk3gyZF94mv5PGwf85hokC/6qey9tTobZC3p0evL2LbJEYffHgwTM
         1C5AEzUvTTaEowgjFIsreNy7KYjX6yC4LtC+l3lMzhLdx/ZFrUCOKAImCOuqZSiIRXi/
         RnQKL1H3KoH/rLNiaX+SPWW5EviZ1vrhFuSav2QySEnLGq3ibYLiadLtxfA+OORAkq2P
         dttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994710; x=1780599510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LT5tF3xgMpvqZXrzTVKQeff3Id1ajAsfnsR/quIBRtw=;
        b=OtGp/XGBRQIbGcUU1C8QDycsNr7e6Eo/F2MkuWjnpkHClz1mfc5yK+bqbYYMybtbya
         7u9531OlAQVjOYg8r/K8Azz5EPQ7rOouoQBuWG7hmF2w/TzjuaEYLKnB7zDFfTx5uO/p
         O7GiPMtNFqZWC2GE9gfdqC4KZ4CnM73Ui79gZgXa4jwqGfFPOrb8R7IJ+bmFB9n3T6B2
         du+yo6GsDW/0PvK3MCLMbTlRdUwpv4AfVWAAlpmWo41Uo+WBTYWJO/v82ALsTGN2iI9O
         cZi76ne4bRQB6W4nXPjexEXRy40f4WPoZpwNVvhpKF/c1w/jwcqNRjhWw0NKoChLvcQE
         ij3w==
X-Forwarded-Encrypted: i=1; AFNElJ+nvbVaVxYsulLdxH7voPnaLeCkFtboWK21WjbcdrGwOq00/KHaYP/DkUYE61IM97WI5lt6dzGP/MSBUmiN@vger.kernel.org
X-Gm-Message-State: AOJu0YymmNMA2SbUPbezGMCmD+7/U45jx6lcjG10kZPt1/uL3ZAnqawJ
	M0wJSCAxwC+5S0i8sSwvh9YiBgxRIBwAX8LV32bmz6XeXCf6zo5WYKa/YTWRTYz/Ia5yBUNgEZr
	b5iWSDwmn9YCH3LPbhSMbY9bgb6h6f4S3oWMCxZI6jxbyTidUW14+rBxU72/q+6ytxGSv
X-Gm-Gg: Acq92OEJZhMWQOW9ZiqrNALqIy7e0zIevFokdlIJx6LZNtA3LCA+T8sBde1X4XTFHWh
	A6CkXCGMS34vBDQNJmcIZHViCothY7GZOPVUWhdIV2zqjPilQBLq9NUB4iLRdG29dR3IkiLx9cG
	vEHhQX1+v0FnUwlDM1yQV+EyFxSdNdQQKjE5683OQQx7knudtdaLqMwIxPN9aN4oKRXWkEgOCd7
	QZQifcTiYrlJWQi4fKfUzqjvktdDHvc6CW6P1EkSnXnzsK4k6B4L6MVNyjwQkBOog5XN8BaR8v+
	CzH3fvZFibDaWkPK1vByM/9LXZrVjrTs2mZf3X9xbKPuZzjSVr3hStWVodjbFUqgbVjCH6JAcPf
	y/Lt1IT6w7VucvbnXow77z+1CmXbgf3lMWVPdfhBofgJ3vXTT8zxOfdULOUAq9EmDJsQUOQ==
X-Received: by 2002:a05:622a:6182:b0:516:e1d4:5541 with SMTP id d75a77b69052e-5172cc88c21mr847171cf.37.1779994709715;
        Thu, 28 May 2026 11:58:29 -0700 (PDT)
X-Received: by 2002:a05:622a:6182:b0:516:e1d4:5541 with SMTP id d75a77b69052e-5172cc88c21mr846761cf.37.1779994709314;
        Thu, 28 May 2026 11:58:29 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/6] ASoC: qcom: q6apm: remove shared memory IID helpers
Date: Thu, 28 May 2026 19:58:02 +0100
Message-ID: <20260528185806.6316-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfXxRSaLN6B+eVI
 jBtLNjAL8beMSJI75cPMp8O3FMHn1gCFBgUC/8psK+L7l6D3jwuX9hRLlyohaTLpWTte0/1NdNV
 T5FmauhijxdosYOrfOglPPsElBvMYf44gEY0l4+FGl3EtP6H692PV4675rD9CYMTgYvI0H/u5ht
 ppR7CMxWO7eU85FeCVEPxvDFZk37VOTdTRwNSObVbmC1Cx5I1AsdzlrYG5cvvmEuc+LXqXmvhpD
 hUd9KT7SaUHtniwAXF6CDdzMxWROhCWxINjnO8yK3Mqv2HSZmGiiCOkCAFMg77K/3CVxpygBw+R
 89BvWxIFHqbFzeC700QonAYElSRXsRg5rQiM4txEuMcnbbIZF3XoP9K/BUypeg/NgxfKnwfF7uh
 owEqkgfHHpB0olqUbnZs0YEdpx/FfVhNJl4aEerfosuCEU5sUl3sgNRcJ+AKQFzuVoV2Ya39CK6
 M9NeHC0/+SuS4DT1pGw==
X-Proofpoint-ORIG-GUID: leRLCeohNcrwmcvUQtOhMFpnnBimkrR-
X-Proofpoint-GUID: leRLCeohNcrwmcvUQtOhMFpnnBimkrR-
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a189056 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=j5C22CDG7AQ3G0DocvUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280191
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,kernel.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110173-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 426CC5F6CFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The shared memory module instance ID is now cached in graph->shm_iid when
the graph is opened. The old WR/RD shared memory IID helper functions are
no longer used.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 41 ++++++++++++------------------------
 sound/soc/qcom/qdsp6/q6apm.h |  2 --
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2cebeb767cd6..6ae7d1645dce 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -417,31 +417,6 @@ int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_mo
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_pcm);
 
-static int q6apm_graph_get_tx_shmem_module_iid(struct q6apm_graph *graph)
-{
-	struct audioreach_module *module;
-
-	module = q6apm_find_module_by_mid(graph, MODULE_ID_RD_SHARED_MEM_EP);
-	if (!module)
-		return -ENODEV;
-
-	return module->instance_id;
-
-}
-
-int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
-{
-	struct audioreach_module *module;
-
-	module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
-	if (!module)
-		return -ENODEV;
-
-	return module->instance_id;
-
-}
-EXPORT_SYMBOL_GPL(q6apm_graph_get_rx_shmem_module_iid);
-
 int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 		      uint32_t lsw_ts, uint32_t wflags)
 {
@@ -614,6 +589,18 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	return 0;
 }
 
+static int q6apm_graph_get_module_iid(struct q6apm_graph *graph, uint32_t mid)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, mid);
+	if (!module)
+		return -ENODEV;
+
+	return module->instance_id;
+
+}
+
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 				     void *priv, int graph_id, int dir)
 {
@@ -643,9 +630,9 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph->dev = dev;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		graph->shm_iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+		graph->shm_iid = q6apm_graph_get_module_iid(graph, MODULE_ID_WR_SHARED_MEM_EP);
 	else
-		graph->shm_iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+		graph->shm_iid = q6apm_graph_get_module_iid(graph, MODULE_ID_RD_SHARED_MEM_EP);
 
 
 	mutex_init(&graph->lock);
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 376a36700c53..8ea64085860f 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -148,8 +148,6 @@ int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 /* Callback for graph specific */
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph,
 						    uint32_t mid);
-int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph);
-
 bool q6apm_is_adsp_ready(void);
 
 int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph, bool en);
-- 
2.53.0


