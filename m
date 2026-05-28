Return-Path: <linux-arm-msm+bounces-110175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB3CHmORGGr9lAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094C5F6D20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFA02318DA8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D0D2FD7D3;
	Thu, 28 May 2026 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CArtEfJc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCEQFu7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ABE336EDA
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994720; cv=none; b=a/FGSUzwmuYvMrkjQShXGvzrDDXtr0pinNGsUV0mDgg3W8+0lY1FCXgSnqsYGHmbh6c7slYx9mN+zcRvZgVg+LhYoTgE69is/G1CKA0P5A8thAjp+88vb3dSguWzXXMnQdPUzbVN93kttqS3dGIB/t/CWhvTWfn05e3jb+TBO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994720; c=relaxed/simple;
	bh=qLUhuLwVPjChuycrUmttdHPf8StA0wYdTF9zQMVxxRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B61rWRERxWwqkHO3blJvsljxcAB5swqEhUHnqTJiFjGjNQFSgAkUDHHGn63FNbRLpj0V9wIi5Bzlwm+U52n2ufhFpHpGV5G2AjLBpd51ugjshD2h1pUcge0nvupf8NpW+aikFDsSJt/1jiL1jUr0Ir1SUby4Ca7292HUJJxn1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CArtEfJc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCEQFu7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SHPcHF3203245
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MgdLusidFaY
	6ZcoM7gj5BjToDJmFX6Csm44/ud8xC/w=; b=CArtEfJc3qrUmGbhNOt8TTeLmPb
	fCr4hCPehv2WXXHBP4vdx3q7V190yGEvKq+glc5R98eSoU4hqbC1gSseexNUYdkk
	ecKzp/ds2Ps1RH4hSIBbRdou1zVDlmLaHOiOdu7qvelaH+iZkD+knNrq82PjVSIj
	JoWVGAQwAZ99qcwVuDVLYmPZNgRVAxQuwkwIBA40bQ/6o35biHnKu/GHhWNQBcmQ
	gjmVazZCqIzqEPrC2xk/w0Yyjecn4ciFNVOs+0UUimTPE4KfpgsQpgwDQZQUvBcq
	+93h/WwO/gBqxQIWH4Lo0O33Lxut7k0Af8dWaTUUiPK0omx1qKNIGT02Urw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynma7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517288c4ed0so10272071cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994715; x=1780599515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgdLusidFaY6ZcoM7gj5BjToDJmFX6Csm44/ud8xC/w=;
        b=ZCEQFu7RwkPs1VmDHjb0+FE3vas6lEawxGo5buAXcLws9vnwQwgF35gpJyQhiISt3D
         sB8m0A9Gq+5FJcka+mber/rs+DOoWsV3TxhnY+6bhIMMJiS4TT9rTY+Ziy3ZnJy2X4QY
         dbxGp2KD1fZ51pUhCjbfTFbZZz1RmNFFa9/VCMieC7CeVIAh/u5I5A47B0mOE8adMHvl
         /irRWHeauygUgL5qlsZL5rtkjN2S1MJJr6svygbL9BuwGmqbvdjVsuefwwDppwxjZK3k
         xG5Bz57FcPj+pSnnL7zAWIyvX5xXGyDEFHFoWmmQIQe9onV4/FYIKBdQvnwxHEwM1yF4
         7UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994715; x=1780599515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MgdLusidFaY6ZcoM7gj5BjToDJmFX6Csm44/ud8xC/w=;
        b=NxeVvtVV8fENDCvHKNEGofLZ+X2dfAalSlg9FW52JRQyg1FyO3d7JTxIvKzwutf7FP
         kPlVJv6G7e+DDF9p9R1RkNvKlJU1+6osaUGydZhAjVxXOhLgAGOsHQkw0Wntxn6VCPmA
         gWwPP3UHnaIF3SijLturAglktFGtPozH+Dse7NikUHfKa4IxWHPA/gUm3TykicGkFkay
         ECGyNalOVZ7LIDTunJd9l7GDSI1i8fI3aywjfTBR54g0G7H2/DwA5w7aFrlwp6oF3yCM
         e7140XukuIclkmI60JIGmAoIwB7Ury9XVRQegl54buO11Mcu1QOzJ6vQfB83lMOICQrN
         /eng==
X-Forwarded-Encrypted: i=1; AFNElJ9yJkApJd0ucXgqLnOCRGb9vSD0gy040HuYgR5VyZVlqHCXxMd1CEpkIN3oFJLRzZ1CGMH6zK6UjlXlwjq2@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKP9iO0RX8lWgQllFVDC9FHRqtZ45rs/d4LO32oUmcONAAKd/
	lW2KmB7e/9lpKCdZi/t5O4nH7MSrVcXd9M2CPhCZdhhfO7daMbKUZEeUJ5xM20KcQuZ5w2AxSBr
	Hqqdr8PbzLTJ7JspgwV8OhF9bWm82LCxyX+sxAjMo1UWc7NPRsKX18MTCLP0iowv+CjT/
X-Gm-Gg: Acq92OF/YRNemxQr3xf9Y8RoeUkpxWMfbjVbQxGTVMFZ6IU5fkfKDuzkhrjkHJ06mCx
	vO0TuZwTjpaZPpDSL+WMW51FrOTpKixzqy6OV7V9LzsPz7a+wuo1RCqJjEQJ5hSgW7+4vboaV1k
	5yL/K6wcdhDTGFQ5YHu2XPXzODmizz4U4WapMg7QIGYZLOHhrVd9pMdlhYGKjoNAllmwsA+34Jb
	0iOyNwETI3kmjFJiRqh4Nr0BMOTNtkeQam9+CB+8Cf7Fu6XtpH/Twl1ueUKuTdTkReSlAe6axKl
	SdFSXmn5YCr3prLjE/MxHwwvMw+/OjHV/cRK7VbvMQf9REkanb57f55tOjju8OYyyYzN8IZTpH/
	4LjsbvTUU+SZrmkc1wcP82sjWzkpo8FVEL+bK4I7v0eEXq2nqkcdL2GECImLnBlQVT41EzA==
X-Received: by 2002:a05:622a:4813:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-5172cb814famr1324741cf.22.1779994715059;
        Thu, 28 May 2026 11:58:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4813:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-5172cb814famr1324301cf.22.1779994714571;
        Thu, 28 May 2026 11:58:34 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/6] ASoC: qcom: q6apm: add watermark event support
Date: Thu, 28 May 2026 19:58:04 +0100
Message-ID: <20260528185806.6316-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfXz9kq6ZFmhTuc
 AJeg+jrLS1dzLQ0AVYuRqL2HRCi4PZCm9o2Imy2tYjQp9cHl+6XcVcRhP6Rjr2ij1i+yo8qK5Xu
 GTAoBvaQXrmn3YC/UHZOXhWzPJ66+1ipdZvuRQLj2JqEKOeNm1yPHDm3IDqxCMLdRjKd4WccUVz
 R2wRqFC7YsJpiGyY+FD7EZD4G4S+q2GLMMyL5yRooD0Vgzvlar1l6AMB6LlImbTPvjEgGe2ZJHF
 sOwhJwKtE4Bna7OApNyvjGDqNsnfFdy8tC0UF57noL9GPOU/l8dBIBxNNFte83hOiDatMP4/Ne6
 15y54yOqwwiBYglyfuWSNg9ddr1De811hpsV7YxJGt/iCQB7ZqAv7QBFQQBFwpkL5XzCanfj5ji
 VkXv0hJNfaVm+dwrx3YJ8q/J15myo/9RkzGkMbsv5nKwGD9UmX3C/E2Sn469MYMv7asTq3SKO/2
 8vKV801DDg5Wxyf66sw==
X-Proofpoint-ORIG-GUID: 1Zy921Q0SRKgaspJL06HW9-tCUPtSiKr
X-Proofpoint-GUID: 1Zy921Q0SRKgaspJL06HW9-tCUPtSiKr
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a18905c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sDYR-nuGp-UazcQISOsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
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
	TAGGED_FROM(0.00)[bounces-110175-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 1094C5F6D20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Push-pull shared memory modules can report watermark events when the DSP
read/write index reaches configured circular buffer levels.

Add support for registering watermark levels with the shared memory module
and route the resulting module event to q6apm clients using a new
APM_CLIENT_EVENT_WATERMARK_EVENT event.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 36 +++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 45 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 19 +++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h      |  2 ++
 4 files changed, 102 insertions(+)

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
index b85c7e5b085e..62a2fd79bbcb 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -62,6 +62,8 @@ struct q6apm_graph;
 #define APM_CMD_GET_CFG				0x01001007
 #define APM_CMD_SHARED_MEM_MAP_REGIONS		0x0100100C
 #define APM_CMD_SHARED_MEM_UNMAP_REGIONS	0x0100100D
+#define APM_CMD_REGISTER_MODULE_EVENTS		0x0100100E
+#define APM_EVENT_MODULE_TO_CLIENT              0x03001000
 #define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS	0x02001001
 #define APM_MMAP_TOKEN_GID_MASK			GENMASK(15, 0)
 #define APM_MMAP_TOKEN_MAP_TYPE_POS_BUF		BIT(16)
@@ -69,6 +71,48 @@ struct q6apm_graph;
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
 
@@ -907,4 +951,5 @@ int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
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
2.53.0


