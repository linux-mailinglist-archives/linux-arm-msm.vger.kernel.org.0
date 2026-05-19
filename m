Return-Path: <linux-arm-msm+bounces-108512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4La3OKNjDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F4457F7CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A22A30CCFF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04DE4E3796;
	Tue, 19 May 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rg81kQNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMpEniO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0934BCAD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196541; cv=none; b=ki49bmjENt02afGsds+O/W9cTdsYCgEQRO53X1NgOfPmpx3blwCmxUbMiF+1CR3h1Abt8yNDfaYDgLNlcatzXt1nq9LRhgSIENtiPxrTtA8tIeWGMBZk/1EtOdPE0bjYXAnNHUh98W2AqHdMB2MnM4eknrt1T/2vUCutDfS5ooY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196541; c=relaxed/simple;
	bh=Eojsjq92nlo2AdgTwb8BLdVR/DF5UkFPWwvqnE41UZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UT8JVF8tqgiPB6WSEBrzjlYqcnJFVROzj1NYdvHXvAZpj09QRHJDQJJD1M4P1X3O1OsD0s1e88tQ0Vfv3nyKBvJsLLKuURIqAfJv9IT5mFkzbObfUH8YwbFHb5koppsANL2gT9aJmKr9io32v4JH0c2qmV25OYOVaHWXYtu+2RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rg81kQNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMpEniO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9v4Td1054777
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O1fqH3pRoYY
	kfZnh9hO2XreKl13dtCV/1mBNYELIMnM=; b=Rg81kQNVVa4d8SXwffeLB00IWLu
	crCC9yfqYFerb6B3CG8naD4gUrju2bhuKUnNJho7qJGAPRR3/8Pmgm7mB4RSzO0z
	JMDBlsJdGDw3nCGwS0/UDvzBN3vTY3CkpFi49LoD+UUvsyL0roLIKwWDFZ94YEDy
	50lcfWUuTE2ZdDzV/7UsVU0j0Fhuhd5OUeBBVDje+o3/OYP2vi307oHkBDnJXO+i
	p3fHLWOyvVf5814lI9xglz0yq3jPpYksKcVaWp99zwUn5bVRkczDL0tgmvjNFior
	Ynw/vOWBogkPj8cJsP1tMa58KDquSLqk0ViyHJU+SVJizYZEfr6Ak6/BNUA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nparr3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575242b4308so9409899e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196537; x=1779801337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1fqH3pRoYYkfZnh9hO2XreKl13dtCV/1mBNYELIMnM=;
        b=gMpEniO4V6n8Tuy62iY/U8AGzLKotorWeviI66v9eGeGv9G/WOjKNcCUXNG6rBdr+B
         p5IAk94tzyC2m6BUfp54BuQGjCwQ4Bu+ioD+Hz/1u8begDnoNymfuJl/RfNUlmb5xdZi
         OSHy9c387YG8s99WvutVkGz5OKxJyduA+EZsznM9A4w/75NzmWpfJhxOSbtYyP+3XIq/
         Mrz5cETi7eKAKNa+LmfZvUsFxocQg/lu7mh3YnDgE5/nIni0tsBMvoCa/YNw3vhZueq1
         kmaQKHHLVEQXdqtlnSGHgt7LMV2119QUWd81Wi+Z/H5XrshY1AILemnLYglw7LiskAsR
         1yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196537; x=1779801337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O1fqH3pRoYYkfZnh9hO2XreKl13dtCV/1mBNYELIMnM=;
        b=R5Aqx1HMCRoLCWgDQoGlPYjM+2pA9lvchC4sJId3oqOM+NATG+jRmfPiOGu7776ETZ
         R/AHsT9q0f4aM69+H/yjJq4/Vi7Xy8XwV7pju6WoCPbDz20/ZAjuyJz9aFZueUvjdTsz
         dP71uT8LROkETWYpRCcI/TyUR1w6CRZoPD3PvDgkQOlyjMxQR4On1jKp3vasl/iilPVl
         xY7TqyZBTz0vq7B365sZ/eex6r1Z0chNCZL4/anTkKgFhFNz8l5sMRlg/mn+X/Q5GMCn
         AOrPffjCWobrDE7mSE+Lx8QAF1DefIvIsGbrA1VFFI2da4BZLTXFc8MovdxpVq3ybKiI
         zVmw==
X-Forwarded-Encrypted: i=1; AFNElJ9zaF+CtMsx5xgVEJYtKM570hVtml0WPIU+Y1qEAC233U5b1LeSlG6P+Aj4+9CljzSSwiAQeUnN4V6FpRK0@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9eAgWdD9TtCn+w5A0Y41vjBovzcVCXpGfWNCHl87zOc1bHr2
	b4Y2/zMZCp8mVjgYxPOMiDpzR/APv0KPYIcesGAXJ2gQAwP86IZ1mLJMFKs84R/52CSmLBKbjXG
	qYUVQ26B+IO/8TxBHxs0bj7+k7syYlSj36xCB9EaryV6d+gPqzFwzvr6NLcKjI7RExL92
X-Gm-Gg: Acq92OFR7YWQjMvDDWUrHPJKCLy7lwFiKlaL0za6yD/rbGyi7f6SX7uvtT+/u2+06fu
	bJajBmJOPgAhoZh0DcPk648aj0DP4Ect1pvDLkoOdM/1jVMjMEfYh8JurQgvHBRr1gZpWszsOI3
	MKs7k7dAjYG1Kbsmurfwxy41Y4O+I4E17eCGLEeIOPchvCPATblfjG8HMBjoXiDC8FHoMrDiKKA
	6kN3kgmdRpyOf4uKH9ZcMzaKqdZT3FmcarHvl1izksoL/Odz2iUFRXvNfsKb34bzFiipNqicPZl
	sfTMrgAFSzZ+Znlo35eDsU7I6UbaSLTsD7qJgj3OHEt9/XWBV1/jEMpXZR4eAoJ81LF5lOn7Mpg
	mxqkadwsp7TH9Kt8Lx3o5ROv2DRQ7JkoeMJ3OGrMZGHo0bgP3G1zkYt8=
X-Received: by 2002:a05:6122:4f9f:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-5760be34e4amr10646309e0c.1.1779196537216;
        Tue, 19 May 2026 06:15:37 -0700 (PDT)
X-Received: by 2002:a05:6122:4f9f:b0:56f:6add:9029 with SMTP id 71dfb90a1353d-5760be34e4amr10646222e0c.1.1779196536748;
        Tue, 19 May 2026 06:15:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:36 -0700 (PDT)
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
Subject: [PATCH 5/6] ASoC: qcom: q6apm: add watermark event support
Date: Tue, 19 May 2026 13:15:26 +0000
Message-ID: <20260519131527.4002526-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX4UIWpmto3plN
 TjT9vUOzBibtGPAMGNzTWIkXmniu/WK7LH9Glns2bmvz4377kYDscpuTPE03ZVizHE5F6NzA16g
 dq1rO3QL0Cj/BhPh2PzYkRzMN4cgPNqOZXT1HJ+acpcDW0lpdm089ojXDp/TJFYRLyuatrkJaCi
 aLyDVDQTBOiDqU/IiDhSCgFmVf4Xc3tsc6yeTGsAc3vLN/fd672MnmSFu7W3I2umHOUFq/exA8a
 hpG9UXFPaGtmfaHrdAveOxQR321MZeM51pd9lDe14NP2tFtTdVS9hAogF5s9gIuO9MkJo+PyQz4
 LQd6alEbfL0bOoFvk3libJaHGoNCYHBBoCaTc89zLbLzMU422li4Xej0xs1L+EM6xpebavj14qa
 I0JuiF2/Mw3YMsncCHeGzHbMOOTqt70LVWykNICc5apsuZIb8tXYpUWta8BC8iR7dJkr5+bdY2w
 OsZFayPn09lrsWv7THg==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c6279 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=cig4ayqGPX1rv0pnnd0A:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: a_fQ0bALqIktLJHKAUfWrIwcoulJZzPl
X-Proofpoint-ORIG-GUID: a_fQ0bALqIktLJHKAUfWrIwcoulJZzPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-108512-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 54F4457F7CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Push-pull shared memory modules can report watermark events when the DSP
read/write index reaches configured circular buffer levels.

Add support for registering watermark levels with the shared memory module
and route the resulting module event to q6apm clients using a new
APM_CLIENT_EVENT_WATERMARK_EVENT event.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 36 ++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 50 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 19 ++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h      |  2 ++
 4 files changed, 107 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index c984b12409dd..e6e9eb2e85aa 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1118,6 +1118,42 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+int audioreach_shmem_register_event(struct q6apm_graph *graph, int bytes, int num_levels)
+{
+	struct apm_module_register_events *event;
+	struct event_cfg_sh_mem_pull_push_mode_watermark_t *level;
+	int i, payload_size;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
+	void *p;
+
+	if (num_levels <= 0 || bytes <= 0)
+		return -EINVAL;
+
+	payload_size = sizeof(*event) + sizeof(*level) + num_levels * sizeof(uint32_t);
+
+	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_EVENTS, 0,
+				     graph->port->id, graph->shm_iid);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	event = p;
+	event->module_instance_id = graph->shm_iid;
+	event->event_id = EVENT_ID_SH_MEM_PULL_PUSH_MODE_WATERMARK;
+	event->is_register = 1;
+	event->event_config_payload_size = sizeof(*level) + num_levels * sizeof(uint32_t);
+	p += sizeof(*event);
+	level = p;
+	level->num_water_mark_levels = num_levels;
+
+	for (i = 0; i < num_levels; i++)
+		level->level[i] = (i + 1) * bytes;
+
+	return audioreach_graph_send_cmd_sync(graph, pkt, 0);
+}
+EXPORT_SYMBOL_GPL(audioreach_shmem_register_event);
+
 static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 					     const struct audioreach_module *module,
 					     const struct audioreach_module_config *mcfg)
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 0504e8abc8e2..50c7aa9a82aa 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -62,10 +62,59 @@ struct q6apm_graph;
 #define APM_CMD_GET_CFG				0x01001007
 #define APM_CMD_SHARED_MEM_MAP_REGIONS		0x0100100C
 #define APM_CMD_SHARED_MEM_UNMAP_REGIONS	0x0100100D
+#define APM_CMD_REGISTER_MODULE_EVENTS		0x0100100E
+#define APM_EVENT_MODULE_TO_CLIENT              0x03001000
+
 #define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS	0x02001001
+#define APM_MMAP_TOKEN_GID_MASK			GENMASK(15, 0)
+#define APM_MMAP_TOKEN_MAP_TYPE_POS_BUF		BIT(16)
+#define APM_MMAP_TOKEN_MAP_TYPE_SHIFT		16
+
 #define APM_CMD_RSP_GET_CFG			0x02001000
 #define APM_CMD_CLOSE_ALL			0x01001013
 #define APM_CMD_REGISTER_SHARED_CFG		0x0100100A
+#define EVENT_ID_SH_MEM_PULL_PUSH_MODE_WATERMARK	0x0800101C
+
+/**
+ * struct event_cfg_sh_mem_pull_push_mode_watermark_t - Watermark config
+ * @num_water_mark_levels: Number of watermark levels.
+ * @level: Watermark levels.
+ *
+ * If @num_water_mark_levels is zero, no watermark levels are specified
+ * and watermark events are not supported.
+ */
+struct event_cfg_sh_mem_pull_push_mode_watermark_t {
+	uint32_t num_water_mark_levels;
+	uint32_t level[];
+} __packed;
+
+/**
+ * struct apm_module_register_events - Register or unregister module events
+ * @module_instance_id: Module instance identifier.
+ * @event_id: Module event identifier.
+ * @is_register: 1 to register the event, 0 to unregister it.
+ * @error_code: Error code for out-of-band command mode.
+ * @event_config_payload_size: Event configuration payload size in bytes.
+ * @reserved: Reserved for alignment; must be zero.
+ */
+struct apm_module_register_events {
+	uint32_t module_instance_id;
+	uint32_t event_id;
+	uint32_t is_register;
+	uint32_t error_code;
+	uint32_t event_config_payload_size;
+	uint32_t reserved;
+} __packed;
+
+/**
+ * struct apm_module_event - Module event descriptor
+ * @event_id: Module event identifier.
+ * @event_payload_size: Event payload size in bytes.
+ */
+struct apm_module_event {
+	uint32_t event_id;
+	uint32_t event_payload_size;
+} __packed;
 
 #define APM_MEMORY_MAP_SHMEM8_4K_POOL		3
 
@@ -904,4 +953,5 @@ int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
 				uint32_t pos_buf_mem_map_handle, uint32_t size);
 int audioreach_map_memory_position_buffer(struct q6apm_graph *graph, unsigned int dir);
 
+int audioreach_shmem_register_event(struct q6apm_graph *graph, int bytes, int num_levels);
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 9235089c1b46..2e5b25b8d00f 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -557,6 +557,7 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
 	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
+	struct apm_module_event *event;
 	const struct gpr_ibasic_rsp_result_t *result;
 	struct q6apm_graph *graph = priv;
 	const struct gpr_hdr *hdr = &data->hdr;
@@ -568,6 +569,16 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	result = data->payload;
 
 	switch (hdr->opcode) {
+	case APM_EVENT_MODULE_TO_CLIENT:
+		event = data->payload;
+		switch (event->event_id) {
+		case EVENT_ID_SH_MEM_PULL_PUSH_MODE_WATERMARK:
+			client_event = APM_CLIENT_EVENT_WATERMARK_EVENT;
+			graph->cb(client_event, hdr->token, data->payload, graph->priv);
+			break;
+		}
+
+		break;
 	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:
 		if (!graph->ar_graph)
 			break;
@@ -623,6 +634,7 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		switch (result->opcode) {
 		case APM_CMD_SHARED_MEM_MAP_REGIONS:
 		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
+		case APM_CMD_REGISTER_MODULE_EVENTS:
 		case APM_CMD_SET_CFG:
 			graph->result.opcode = result->opcode;
 			graph->result.status = result->status;
@@ -641,6 +653,13 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	return 0;
 }
 
+int q6apm_register_watermark_event(struct q6apm_graph *graph, int water_mark_level_bytes,
+				   int num_levels)
+{
+	return audioreach_shmem_register_event(graph, water_mark_level_bytes, num_levels);
+}
+EXPORT_SYMBOL_GPL(q6apm_register_watermark_event);
+
 int q6apm_push_pull_config(struct q6apm_graph *graph, phys_addr_t bphys,
 			   phys_addr_t pphys, uint32_t size)
 {
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 780933ff17e9..5cb51ca491dc 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -41,6 +41,7 @@
 #define APM_CLIENT_EVENT_CMD_RUN_DONE		0x1008
 #define APM_CLIENT_EVENT_DATA_WRITE_DONE	0x1009
 #define APM_CLIENT_EVENT_DATA_READ_DONE		0x100a
+#define APM_CLIENT_EVENT_WATERMARK_EVENT	0x100b
 #define APM_WRITE_TOKEN_MASK                   GENMASK(15, 0)
 #define APM_WRITE_TOKEN_LEN_MASK               GENMASK(31, 16)
 #define APM_WRITE_TOKEN_LEN_SHIFT              16
@@ -164,4 +165,5 @@ bool q6apm_is_graph_in_push_pull_mode_from_id(struct device *dev, unsigned int g
 int q6apm_push_pull_config(struct q6apm_graph *graph, phys_addr_t bphys,
 			   phys_addr_t pphys, uint32_t size);
 
+int q6apm_register_watermark_event(struct q6apm_graph *graph, int watermark_bytes, int num_levels);
 #endif /* __APM_GRAPH_ */
-- 
2.47.3


