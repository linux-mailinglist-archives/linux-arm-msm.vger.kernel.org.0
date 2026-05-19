Return-Path: <linux-arm-msm+bounces-108511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCSPHJ5jDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33657F7B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1215E30C9A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859C74E376C;
	Tue, 19 May 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CO/S+5jR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKIxdPnt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C4F4C77B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196541; cv=none; b=XcCcnXuqm1LjWa7cKuzm+q0iEI1HbUG5N9xj0KXT1I0uR6L7xJBk1OZsqEDjfu1KBDFmrorCy4qMf0lNM87IPgJzUdfcnAUru86T7a0Dk8jUGU+lzX7odAurnoyjJKv3VAiPoDG9lkpjN91BOoEpbHoY6/uiwOc0/OE6M4Rv8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196541; c=relaxed/simple;
	bh=xzzL21LQ0JUCoqtli3nm8gu0EEyFSRN9RZAEojxLUxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEgQGy8Mrg7JFuNXdIoOqwOONqHmSdsSrN03Gtimpwg6x4Pjim9fXbDEH9pvUTH7KJcRgbp7+hS+7PB2EHl3Wo8pYS3n1tPp+IVTN8h1BJbHCWbY6+AJkJyQQUVCDHNBGtj/0DjKJGrSCXY1I/AiEJl8rp2VM2/gWD3xNdGg0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CO/S+5jR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKIxdPnt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JD24u42975577
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mYev7kpgqkN
	DdJjz3ITaD4t3ttI5h9By3yLE/B2VHDM=; b=CO/S+5jRfpwx/lp2O9gCt+uvZJD
	BtLpcrtr1Byt6F8ZzWsThSMkDg2ZfvJ2qC+stzldEy9OQABssEqdojyo/vgJHj8a
	JopoydrrWfs2U9cBTL0qLX0BJIAUqlj6sTFg3Lnm7yJMLvA7YSu/W+wlT85SSxdc
	DtCIWvPs7GD3Hk16bdW4NZECstf/o+uK/lZGTa49ufQ7f/5Mk7vddNUWrssLzqU2
	LTrYCwA2Whp8ycw1ShA0veCwgeiuHA9OC6EFuIIQvNiwsa05qDzeMc3fL9qcEko4
	xe6VbSbebiBUxMEVqsu6TzJ2oSpdT0IuCxINe0ALzw0qkkMCZ4JI6MnoaUw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4cmed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751772dec6so7759340e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196534; x=1779801334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYev7kpgqkNDdJjz3ITaD4t3ttI5h9By3yLE/B2VHDM=;
        b=FKIxdPnt2AxaTKEl8PfBKNSrMH262uW3dYOVepLd7Q5Rc1dFDzbDOt8Gs4j48McnUo
         uZ3sch1AAm4j2gpQ/OPgaELAmx9MREj3Hs20zjrr2ZRpXDCzgvHOaeemK+2bJz3jyfBN
         6uc/UloxEG5ns00AgsXI9ZQhq2v0EIS3xWDxkYxG08WnIuaRsV4ERZaAH8+SmEl5QreM
         LtoQWz4sK2Ka/nQLE6WpBqiVYvBf6zNAy7hkjtdOz4XLLfIEkONM/UoKV2aqpZ5oCg5C
         FcAYujF9FGqRnXm+8Y23oKygum3wk6X86qkLF75dZ/addxBNuMxsI/XncdmdCnHMynfH
         mzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196534; x=1779801334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mYev7kpgqkNDdJjz3ITaD4t3ttI5h9By3yLE/B2VHDM=;
        b=BVzj9GdRO7e6CtCkgq+qj+qwryjS5zOu28lXQHbc8KEue7PUPjtPxbKviCvAwvewGj
         t3ULqQy9yUhJM7l+7I20VXWGGkG0QUa1O3K38gu+sOLFAYVkrSixqaZSlA+gFnIN31eU
         rmaqrGI4Xu377/XGJVe0XTvaf8RxzG22zyLtV5yDrBk9PqoTlFgqcoYz1mUIp2HHHgpa
         YF/igCwkNSV8pv5qWJeH/qrouqiNl1cLKEJdKdHhlbF9/tVH75QsXv1W7+IP9D/mdajg
         BZA8HeMqTtb7SRQWkOIY7A/pJN/qfuVivzay46EYmwHtXByRzH6qBGGznMCD793XYYyt
         nQSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FICcIwNA9A+NXLE/Jyualb+/9AbOdQVXfMp1nQAvYfzNYFCseZmkOgbg2bpcino1KgHK/tDrKy0IeZEkU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7y/3jm7ktAQfpU8xHHjZ/krWj3D7smbcs6ecSbHt5fTJqRedd
	TDueU/vbzvAVBRO21b76ADs3dKu8R+3Qsc9uffiv7iu0EDi/DWc3igXc0RDQmdK2O/1AnEnmaUb
	R4SJCgul3NpU0D/PTsmerknGUmQ2cNhDDa0Lf0tzVkrqtfCnoU8YOgmyZG8URjhUzZlFY
X-Gm-Gg: Acq92OETzwntoTnqnoR3W2sDFSByAkxOx8yVJlLv3PWlQBREPHQy9svHU8lP5+6nVUc
	nHNbnoaNR8We1+f9RtNbV8fSSFMLu8Y50JP/aKHlJ5EzNcAPz9/lTm8QpvqSaxP8uNBPLUKjHHl
	mujFcIHkZquqV8qsMRikz6baWGW0TEqtkhAGrKMiZWNGDZpmdQeoY8baFLw7BFeLpqD15wFHq1o
	WcY2AjjHzEZrdVt6E1nszXR0Taq12MKEIzQcXqpr/PBuxukAQtHPQhFLOmb+T2VuXETJf+jcqgH
	aDEmuOtrkAZtu/Mz/M4PcwgFS04V8bqCwGx094KDdUoIM6lxfHtd1U3qQBipZOJmL7Yzcd7l/q6
	0wl6FEXXPEdn5BggZDMmGbEsYXTgBcfdWqi/XuBUBelmIaZZVAKAdRkU=
X-Received: by 2002:a05:6122:6b8e:10b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-57751e4f011mr3849565e0c.10.1779196534511;
        Tue, 19 May 2026 06:15:34 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8e:10b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-57751e4f011mr3849493e0c.10.1779196534073;
        Tue, 19 May 2026 06:15:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
        ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
        verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/6] ASoC: qcom: q6apm: remove shared memory IID helpers
Date: Tue, 19 May 2026 13:15:24 +0000
Message-ID: <20260519131527.4002526-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c6277 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=j5C22CDG7AQ3G0DocvUA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: ziwrMRX77LLnPxSCh7V0ZdRnwJtvuN3L
X-Proofpoint-GUID: ziwrMRX77LLnPxSCh7V0ZdRnwJtvuN3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX9bXih0YCnm5D
 j4M1iLDEOqog6f+skuj4Ij8Iic7cG2LI27I19WXVejf5dvWzo6/keKrr13GUrN+wGP7soxjixfn
 g1XPflrnnYPEq9ulNOqppnJmzf3bJNUeqJBEj7sCspNQpKCrUMwvUkcPhV3aqW+BK/4vBoN/yXk
 u8RHAXQ18PSJyb2nBi6WrfK8vjMcWCJIveQy0xa9BsvlL8KGlX1bK0ATX6ZhnTYwZEsPjqApdC9
 IGf6ozwGzFpkChnD41PmVL1m3tva+ndwttNvhaBDEUFGTmqPtW0M/CfFub3HC7pxBWluWaxTUm/
 o1bRHB80fHzzAiRmde9CnTIkBXsTV0GH8Gt9HvK9UKjHERx/DhmjJSA/Bi1sEjigHhgIZIeME7P
 knP3v5jauKYQEsN9RAQmndedIVvmT2oemc4CDm4IKMuacE+z7C+3tPE+Qq5gBS0KZJuIBx1Wyfr
 p2wzEfe/IRqn0Wh4Lug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108511-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B33657F7B5
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
2.47.3


