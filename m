Return-Path: <linux-arm-msm+bounces-108510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKYtHZdjDGp8gwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4957F7AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 843FE30C5946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FE64DC549;
	Tue, 19 May 2026 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBxxob1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1ghoson"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0D4DB559
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196540; cv=none; b=GSk7wsJMAx9ILHOe+mV62v/CmfR4AB7kI904R3GVB08foMUP3jWaFDPSU/wcfGpm/ozpcB3J9K7Z31BxOx/fsYg4ZAT29nM71Nc1pwqZO1eoaw0JX8vRZ3DzMyqbwbrx0yktcSpqAqWWfpLmmXWglJgbLR5CMwWcaITy8pu+wi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196540; c=relaxed/simple;
	bh=BTj2KL+dLb4ULPkUGDrOO4gjDvy9oKLU6oqhZSB3bqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXQskRByFqGm6dP5znj/VXN1nck4aAJAxCCHOa5q8XE/M2xY9ln7SqiFaHXIfZKJ4QILp8J2RTt53ZL4nlf2FCIEBQGDv66unyYw0hOUPLnh95i4Jww2fLvvjV5VMjgfxjoFZ4hBxqdwFZmDiVAadCEosgEz80x8X+p7tcJNaeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBxxob1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1ghoson; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9ksB61257018
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lumGDobfStR
	XGabvnziVfxbEzSmJpltC0nS/hMOdM+k=; b=FBxxob1dyg8PzHlLChWpH0OBp1C
	1YVB1Khdbnr3gdA1IGaSzDeZoGTm8ahca0/B9BTYFeZ29JeQEWLIIrxgvog9FheY
	46u6EX7W+G52ShbWQ7kB7dBFjw5I1ytrpZGGFTtWRkvaJjbSfHkrBnKaYM/OZt4X
	UQVWbzYqPWCqztQy9rJeUMTfMf+KwRLkFz2UZtYoJjVXM3zV/NOurMP6NSNo8k42
	4B6NBCrxwrs+VwYFspW9EkMBmcdpOWWfyy2Yn8aAzAi1jNd4DfoobJC64VynA9fX
	ftMYuUDIoLUID9NXCk2ksmelsc0/6DNTWMP4yWRWzO0otqQiEb5JAYw1HIw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj8rqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:36 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-956804755faso3977833241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196536; x=1779801336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lumGDobfStRXGabvnziVfxbEzSmJpltC0nS/hMOdM+k=;
        b=M1ghosonigvvQL5zwf/GbKtsfQzS0wVSpW+L4ZH9mV3YqktUvUJF+rwt0P8rxz/4Hd
         8pgyLotIu9DCATw/I9IFKBue+eKTe/HfQqp8ylwLA9Lhe+AWzwEI8JCq1BM0CWsd2zbn
         e5rsiaETgrbRcrpcJdNNkHslxygJuxkXM47Wekco3diXt8wapDxc2vIilYKZqek0yRbY
         su+j6Bd+yyN1GdUxKyfli1TF8BSZMAPHqBwIYOeOow3XBlPmhb4LEAgsqqePH9ltwV0w
         D5ZsjSqTHLrlFYduRuT4u22Rg7eUERtsFuPA8+MXef4WAqyDDX+0XyERH2WsVwhBRbFJ
         hEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196536; x=1779801336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lumGDobfStRXGabvnziVfxbEzSmJpltC0nS/hMOdM+k=;
        b=mTs/zygWFphJEhMKbXYtzkU3/tO6ZgssX/ZpbRzE5iKYrHK+k5qMFW6+Ro7r4llgOr
         Wv0KmoVg67+APL+3lVN4g4mPo6OH8cG7T4iXH9uD7LlPy9BUSUvztMDWmPnBMjHS50Qh
         vG3nW7qyX57DIlfkbSbzTKsETnlF9gGw8lGqZlJUt2FsQHx7Ic2x1ae0sg13WbO+lQUB
         e4r6i/I5QH2RGVmRU3N/XTarfokossLFVmP7ERAvr+HwVfiUusTRo6aE4BCK5DUtMQTC
         bVOvfjArbs8tF6gfEQTJdtbMemBFXmCSR1mFOt0eEu/q/nW6qMjX0J0PaCcjM47gHOfW
         YJdg==
X-Forwarded-Encrypted: i=1; AFNElJ8C7MDqafg3dSFiPajOvi9U3uofg3uNySzsVmKKG3/jNirD0hg/EahayZGBrI82PLFJ6qu++08UE/J6o1Kv@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNhmcWkZZiVRRqL462AeePCC99FCfqzwDFjovtQtYTX9i7X/r
	oZt830eKejFcxwFmxYVvcKVRXkZPW+UUWFt5ThAFQGvi2CKeCpjaQaCjTBnlAegSiRR5ECQXgas
	RpWoR8haHNhdrsYOKmPAQr9I71NgGl+tFEYZQDG7wvJ1qQme9gTZjKXedh+gyEC32r4C0
X-Gm-Gg: Acq92OE22B5aY85Egeacub1ogb6DASnZo1uEqge+uXZqWgPryY5fHZOsWsiehY9Q1ne
	zxQfJe+sMd6Qo/1Vva4ZWy9YofeWrvY9vvb7wd8QrhA/SRciyEuUBAqJJq5HIfMA2zse9/DOr9T
	Gj4V70YMMNGUMQ0d5W9/P1Xp6EeEhdXU7cya/bQvs++LTQ0dllNO3gZjKAvA9RhCWgC31y6cEl5
	Kz2LopVjHqvYKHTXnXym19BJ3oTYtDvutGZg4nIQn1Uz1qOvHklep0jsIZi0KaGBPs904zLNBTP
	J8k4BoF1aIASeb8Jl04DCwcrhuhijhm9wX3tRg+ZeR/xge7mczBsJxvlXpw/v+rC1HGurQetp17
	cV4PRcf+xMqrruN3lZ55ctXb2fhbpxlT/gp2IKNjGz/MkNsIYIYxn4fh4u/yL2J6PTw==
X-Received: by 2002:a05:6122:3384:b0:575:eaa3:2a95 with SMTP id 71dfb90a1353d-575f582411cmr9803014e0c.5.1779196535978;
        Tue, 19 May 2026 06:15:35 -0700 (PDT)
X-Received: by 2002:a05:6122:3384:b0:575:eaa3:2a95 with SMTP id 71dfb90a1353d-575f582411cmr9802963e0c.5.1779196535472;
        Tue, 19 May 2026 06:15:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:34 -0700 (PDT)
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
Subject: [PATCH 4/6] ASoC: qcom: audioreach: Add support for shared memory push/pull modules
Date: Tue, 19 May 2026 13:15:25 +0000
Message-ID: <20260519131527.4002526-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: s-Og7ne75lPTMEz4wv2Z0CNSPGJoYTsL
X-Proofpoint-ORIG-GUID: s-Og7ne75lPTMEz4wv2Z0CNSPGJoYTsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXzoEQf13W3PnG
 fMLiHrX+NMHzB/JmV6EOFW2eCvnw0oSyRwOzEcOttrk72ZL4xncqUg7PtJA3CnyvrOWr+890cf9
 7mf9PHyjNf+XxDZel+kuG7AkeKBNIhgfyT0VcDf1dhlY96aSH6F99SoCkysmbbQOcHVFlmiGz3O
 C5DOEqKztjNh8t551jCVIDGz9PfbpybhIulgY7jmLbC+3es8s/dKrGjPPXJp5BmuK5wqmAMh227
 VYUYmPLAjjeuxtF8wpd8cBNhrXyragv1ojFdkBoXHOyz7ditW+ScjuO5FBD6P9fTacpxWhsbME8
 hhGXoIQoQsY+rDUGdg8340RlBBkeOA/Z6Py+5jxe12wccZbAb+GX0e0eSCJ8MiBI5HeUlhaUDzq
 IhnUJ6+JXL8ebUvNs9cuSpBFKiUZWHmYKUTzDx1dl2gw7bfrb19EBhGJiTi33AX+AeO+KcB1EST
 8YXVDSF1aKmbvQs98iw==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c6278 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=eJp2UY_-qWcN76HEE-cA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108510-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: CCB4957F7AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Push-pull graphs use MODULE_ID_SH_MEM_PULL_MODE for playback and
MODULE_ID_SH_MEM_PUSH_MODE for capture instead of the legacy WR/RD shared
memory endpoints. Detect these modules when opening the graph, cache their
instance ID in graph->shm_iid, and use them for media format setup.

Also add support for mapping the position buffer required by push-pull mode
and configuring the DSP with circular buffer and position buffer addresses.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c |  39 ++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  48 +++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 158 +++++++++++++++++++++++++-----
 sound/soc/qcom/qdsp6/q6apm.h      |   9 ++
 4 files changed, 228 insertions(+), 26 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5b73f1d81c9b..c984b12409dd 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1342,6 +1342,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_i2s_set_media_format(graph, module, cfg);
 		break;
 	case MODULE_ID_WR_SHARED_MEM_EP:
+	case MODULE_ID_SH_MEM_PULL_MODE:
 		rc = audioreach_shmem_set_media_format(graph, module, cfg);
 		break;
 	case MODULE_ID_GAIN:
@@ -1401,6 +1402,44 @@ void audioreach_graph_free_buf(struct q6apm_graph *graph)
 }
 EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
 
+int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
+				phys_addr_t pphys, uint32_t mem_map_handle,
+				uint32_t pos_buf_mem_map_handle, uint32_t size)
+{
+	struct param_id_sh_mem_pull_push_mode_cfg *cfg;
+	struct apm_module_param_data *param_data;
+	int payload_size;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
+	void *p;
+
+	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = graph->shm_iid;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SH_MEM_PULL_PUSH_MODE_CFG;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	cfg = p;
+
+	cfg->shared_circ_buf_addr_lsw = lower_32_bits(bphys);
+	cfg->shared_circ_buf_addr_msw = upper_32_bits(bphys);
+	cfg->shared_circ_buf_size = size;
+	cfg->circ_buf_mem_map_handle = mem_map_handle;
+	cfg->shared_pos_buf_addr_lsw = lower_32_bits(pphys);
+	cfg->shared_pos_buf_addr_msw = upper_32_bits(pphys);
+	cfg->pos_buf_mem_map_handle = pos_buf_mem_map_handle;
+
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
+}
+EXPORT_SYMBOL_GPL(audioreach_setup_push_pull);
+
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 {
 	struct data_cmd_wr_sh_mem_ep_eos *eos;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 6859770b38a6..0504e8abc8e2 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -16,6 +16,8 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_CNV		0x07001003
 #define MODULE_ID_PCM_ENC		0x07001004
 #define MODULE_ID_PCM_DEC		0x07001005
+#define MODULE_ID_SH_MEM_PULL_MODE	0x07001006
+#define MODULE_ID_SH_MEM_PUSH_MODE	0x07001007
 #define MODULE_ID_PLACEHOLDER_ENCODER	0x07001008
 #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
 #define MODULE_ID_I2S_SINK		0x0700100A
@@ -710,6 +712,46 @@ struct param_id_placeholder_real_module_id {
 	uint32_t real_module_id;
 } __packed;
 
+
+#define PARAM_ID_SH_MEM_PULL_PUSH_MODE_CFG	0x0800100A
+
+/**
+ * struct param_id_sh_mem_pull_push_mode_cfg - Shared memory push/pull config
+ * @shared_circ_buf_addr_lsw: Lower 32 bits of the circular buffer address.
+ * @shared_circ_buf_addr_msw: Upper 32 bits of the circular buffer address.
+ * @shared_circ_buf_size: Circular buffer size in bytes.
+ * @circ_buf_mem_map_handle: Circular buffer memory map handle.
+ * @shared_pos_buf_addr_lsw: Lower 32 bits of the position buffer address.
+ * @shared_pos_buf_addr_msw: Upper 32 bits of the position buffer address.
+ * @pos_buf_mem_map_handle: Position buffer memory map handle.
+ */
+struct param_id_sh_mem_pull_push_mode_cfg {
+	uint32_t shared_circ_buf_addr_lsw;
+	uint32_t shared_circ_buf_addr_msw;
+	uint32_t shared_circ_buf_size;
+	uint32_t circ_buf_mem_map_handle;
+	uint32_t shared_pos_buf_addr_lsw;
+	uint32_t shared_pos_buf_addr_msw;
+	uint32_t pos_buf_mem_map_handle;
+} __packed;
+
+/**
+ * struct sh_mem_pull_push_mode_position_buffer - Shared position buffer
+ * @frame_counter: Synchronization counter.
+ * @index: Current read/write index in bytes.
+ * @timestamp_us_lsw: Lower 32 bits of the timestamp in microseconds.
+ * @timestamp_us_msw: Upper 32 bits of the timestamp in microseconds.
+ *
+ * The frame counter should be read before and after the other fields to
+ * ensure the DSP did not update them while they were being read.
+ */
+struct sh_mem_pull_push_mode_position_buffer {
+	uint32_t frame_counter;
+	uint32_t index;
+	uint32_t timestamp_us_lsw;
+	uint32_t timestamp_us_msw;
+} __packed;
+
 /* Graph */
 struct audioreach_connection {
 	/* Connections */
@@ -723,8 +765,10 @@ struct audioreach_connection {
 struct audioreach_graph_info {
 	int id;
 	uint32_t mem_map_handle;
+	uint32_t pos_buf_mem_map_handle;
 	uint32_t num_sub_graphs;
 	struct list_head sg_list;
+	bool is_push_pull_mode;
 	/* DPCM connection from FE Graph to BE graph */
 	uint32_t src_mod_inst_id;
 	uint32_t src_mod_op_port_id;
@@ -855,5 +899,9 @@ int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      uint32_t param_id, uint32_t param_val);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
+int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
+				phys_addr_t pphys, uint32_t mem_map_handle,
+				uint32_t pos_buf_mem_map_handle, uint32_t size);
+int audioreach_map_memory_position_buffer(struct q6apm_graph *graph, unsigned int dir);
 
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 6ae7d1645dce..9235089c1b46 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -186,20 +186,27 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 {
 	struct audioreach_module *module;
 
-	if (cfg->direction == SNDRV_PCM_STREAM_CAPTURE)
-		module = q6apm_find_module_by_mid(graph, MODULE_ID_RD_SHARED_MEM_EP);
-	else
-		module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
+	if (cfg->direction == SNDRV_PCM_STREAM_CAPTURE) {
+		module = q6apm_find_module_by_mid(graph, MODULE_ID_SH_MEM_PUSH_MODE);
+		if (!module)
+			module = q6apm_find_module_by_mid(graph, MODULE_ID_RD_SHARED_MEM_EP);
+	} else {
+		module = q6apm_find_module_by_mid(graph, MODULE_ID_SH_MEM_PULL_MODE);
+		if (!module)
+			module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
+	}
 
-	if (!module)
+	if (!module) {
+		dev_err(graph->dev, "No SHMEM module found in graph\n");
 		return -ENODEV;
+	}
 
 	return audioreach_set_media_format(graph, module, cfg);
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
 
-int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phys_addr_t phys,
-				  size_t sz)
+static int __q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id,
+					   phys_addr_t phys, size_t sz, bool is_pos_buf)
 {
 	struct audioreach_graph_info *info;
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
@@ -208,8 +215,10 @@ int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phy
 	int payload_size = sizeof(*cmd) + (sizeof(*mregions));
 	uint32_t buf_sz;
 	void *p;
+	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size,
-						APM_CMD_SHARED_MEM_MAP_REGIONS, graph_id);
+					APM_CMD_SHARED_MEM_MAP_REGIONS, (graph_id | pos_mask));
+
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -217,8 +226,13 @@ int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phy
 	if (!info)
 		return -ENODEV;
 
-	if (info->mem_map_handle)
-		return 0;
+	if (is_pos_buf) {
+		if (info->pos_buf_mem_map_handle)
+			return 0;
+	} else {
+		if (info->mem_map_handle)
+			return 0;
+	}
 
 	/* DSP expects size should be aligned to 4K */
 	buf_sz = ALIGN(sz, 4096);
@@ -227,7 +241,10 @@ int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phy
 	cmd = p;
 	cmd->mem_pool_id = APM_MEMORY_MAP_SHMEM8_4K_POOL;
 	cmd->num_regions = 1;
-	cmd->property_flag = 0x0;
+	if (is_pos_buf)
+		cmd->property_flag = 0x2;
+	else
+		cmd->property_flag = 0x0;
 
 	mregions = p + sizeof(*cmd);
 
@@ -237,6 +254,18 @@ int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phy
 
 	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
 }
+
+int q6apm_map_pos_buffer(struct device *dev, unsigned int graph_id, phys_addr_t phys, size_t sz)
+{
+	return __q6apm_map_memory_fixed_region(dev, graph_id, phys, sz, true);
+}
+EXPORT_SYMBOL_GPL(q6apm_map_pos_buffer);
+
+int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id,
+				  phys_addr_t phys, size_t sz)
+{
+	return __q6apm_map_memory_fixed_region(dev, graph_id, phys, sz, false);
+}
 EXPORT_SYMBOL_GPL(q6apm_map_memory_fixed_region);
 
 int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
@@ -290,11 +319,13 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 }
 EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
 
-int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
+static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id,
+					     bool is_pos_buf)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
+	uint32_t mem_map_handle;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
 						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
 	if (IS_ERR(pkt))
@@ -304,16 +335,35 @@ int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
 	if (!info)
 		return -ENODEV;
 
-	if (!info->mem_map_handle)
-		return 0;
+	if (is_pos_buf) {
+		if (!info->pos_buf_mem_map_handle)
+			return 0;
+		mem_map_handle = info->pos_buf_mem_map_handle;
+	} else {
+
+		if (!info->mem_map_handle)
+			return 0;
+		mem_map_handle = info->mem_map_handle;
+	}
 
 	cmd = (void *)pkt + GPR_HDR_SIZE;
-	cmd->mem_map_handle = info->mem_map_handle;
+	cmd->mem_map_handle = mem_map_handle;
 
 	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
 }
+
+int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
+{
+	return __q6apm_unmap_memory_fixed_region(dev, graph_id, false);
+}
 EXPORT_SYMBOL_GPL(q6apm_unmap_memory_fixed_region);
 
+int q6apm_unmap_pos_buffer(struct device *dev, unsigned int graph_id)
+{
+	return __q6apm_unmap_memory_fixed_region(dev, graph_id, true);
+}
+EXPORT_SYMBOL_GPL(q6apm_unmap_pos_buffer);
+
 int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
 {
 	audioreach_graph_free_buf(graph);
@@ -402,7 +452,9 @@ int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_mo
 		list_for_each_entry(container, &sgs->container_list, node) {
 			list_for_each_entry(module, &container->modules_list, node) {
 				if ((module->module_id == MODULE_ID_WR_SHARED_MEM_EP) ||
-					(module->module_id == MODULE_ID_RD_SHARED_MEM_EP))
+					(module->module_id == MODULE_ID_RD_SHARED_MEM_EP) ||
+					(module->module_id == MODULE_ID_SH_MEM_PULL_MODE) ||
+					(module->module_id == MODULE_ID_SH_MEM_PUSH_MODE))
 					continue;
 
 				ret = audioreach_set_media_format(graph, module, cfg);
@@ -589,6 +641,42 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	return 0;
 }
 
+int q6apm_push_pull_config(struct q6apm_graph *graph, phys_addr_t bphys,
+			   phys_addr_t pphys, uint32_t size)
+{
+	struct audioreach_graph_info *info = graph->info;
+
+	return audioreach_setup_push_pull(graph, bphys, pphys, info->mem_map_handle,
+					  info->pos_buf_mem_map_handle, size);
+}
+EXPORT_SYMBOL_GPL(q6apm_push_pull_config);
+
+bool q6apm_is_graph_in_push_pull_mode_from_id(struct device *dev, unsigned int graph_id, int dir)
+{
+	struct audioreach_graph_info *info;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct audioreach_module *module;
+
+	info = idr_find(&apm->graph_info_idr, graph_id);
+	if (!info)
+		return false;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		module = __q6apm_find_module_by_mid(apm, info, MODULE_ID_SH_MEM_PULL_MODE);
+	else
+		module = __q6apm_find_module_by_mid(apm, info, MODULE_ID_SH_MEM_PUSH_MODE);
+
+	return !!module;
+
+}
+EXPORT_SYMBOL_GPL(q6apm_is_graph_in_push_pull_mode_from_id);
+
+bool q6apm_is_graph_in_push_pull_mode(struct q6apm_graph *graph)
+{
+	return graph->info->is_push_pull_mode;
+}
+EXPORT_SYMBOL_GPL(q6apm_is_graph_in_push_pull_mode);
+
 static int q6apm_graph_get_module_iid(struct q6apm_graph *graph, uint32_t mid)
 {
 	struct audioreach_module *module;
@@ -598,7 +686,6 @@ static int q6apm_graph_get_module_iid(struct q6apm_graph *graph, uint32_t mid)
 		return -ENODEV;
 
 	return module->instance_id;
-
 }
 
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
@@ -607,7 +694,7 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph *ar_graph;
 	struct q6apm_graph *graph;
-	int ret;
+	int ret, iid = 0;
 
 	ar_graph = q6apm_get_audioreach_graph(apm, graph_id);
 	if (IS_ERR(ar_graph)) {
@@ -629,11 +716,23 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph->id = ar_graph->id;
 	graph->dev = dev;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		graph->shm_iid = q6apm_graph_get_module_iid(graph, MODULE_ID_WR_SHARED_MEM_EP);
-	else
-		graph->shm_iid = q6apm_graph_get_module_iid(graph, MODULE_ID_RD_SHARED_MEM_EP);
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		iid = q6apm_graph_get_module_iid(graph, MODULE_ID_SH_MEM_PULL_MODE);
+		if (iid < 0)
+			iid = q6apm_graph_get_module_iid(graph, MODULE_ID_WR_SHARED_MEM_EP);
+		else
+			graph->info->is_push_pull_mode = true;
 
+	} else {
+		iid = q6apm_graph_get_module_iid(graph, MODULE_ID_SH_MEM_PUSH_MODE);
+		if (iid < 0)
+			iid = q6apm_graph_get_module_iid(graph, MODULE_ID_RD_SHARED_MEM_EP);
+		else
+			graph->info->is_push_pull_mode = true;
+	}
+
+	if (iid > 0)
+		graph->shm_iid = iid;
 
 	mutex_init(&graph->lock);
 	init_waitqueue_head(&graph->cmd_wait);
@@ -790,6 +889,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	struct device *dev = &gdev->dev;
 	struct gpr_ibasic_rsp_result_t *result;
 	const struct gpr_hdr *hdr = &data->hdr;
+	int graph_id, is_pos_buf;
 
 	result = data->payload;
 
@@ -840,13 +940,19 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		apm->result.opcode = hdr->opcode;
 		apm->result.status = 0;
 		rsp = data->payload;
+		graph_id = hdr->token & APM_MMAP_TOKEN_GID_MASK;
+		is_pos_buf = hdr->token & APM_MMAP_TOKEN_MAP_TYPE_POS_BUF;
 
-		info = idr_find(&apm->graph_info_idr, hdr->token);
-		if (info)
-			info->mem_map_handle = rsp->mem_map_handle;
-		else
+		info = idr_find(&apm->graph_info_idr, graph_id);
+		if (info) {
+			if (is_pos_buf)
+				info->pos_buf_mem_map_handle = rsp->mem_map_handle;
+			else
+				info->mem_map_handle = rsp->mem_map_handle;
+		} else {
 			dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 				result->opcode);
+		}
 
 		wake_up(&apm->wait);
 		break;
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 8ea64085860f..780933ff17e9 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -136,6 +136,10 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 int q6apm_map_memory_fixed_region(struct device *dev,
 			     unsigned int graph_id, phys_addr_t phys,
 			     size_t sz);
+int q6apm_map_pos_buffer(struct device *dev,
+			     unsigned int graph_id, phys_addr_t phys,
+			     size_t sz);
+int q6apm_unmap_pos_buffer(struct device *dev, unsigned int graph_id);
 int q6apm_alloc_fragments(struct q6apm_graph *graph,
 			unsigned int dir, phys_addr_t phys,
 			size_t period_sz, unsigned int periods);
@@ -155,4 +159,9 @@ int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph,
 int q6apm_remove_trailing_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
 int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph, uint32_t codec_id);
 int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir);
+bool q6apm_is_graph_in_push_pull_mode(struct q6apm_graph *graph);
+bool q6apm_is_graph_in_push_pull_mode_from_id(struct device *dev, unsigned int graph_id, int dir);
+int q6apm_push_pull_config(struct q6apm_graph *graph, phys_addr_t bphys,
+			   phys_addr_t pphys, uint32_t size);
+
 #endif /* __APM_GRAPH_ */
-- 
2.47.3


