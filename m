Return-Path: <linux-arm-msm+bounces-110174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKzXGl2RGGr9lAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5E5F6D18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96C10318B559
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6BD3368B2;
	Thu, 28 May 2026 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlImDt/O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbBElb36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34127330B07
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994716; cv=none; b=ZW/8hxhMcS7p0bYDezbWygnVmArSKZKIzJEmsw3W9wRM679+rINyODI5+dlwFbF7H9TO29fNCW5T0S34JfGjdMplMMHc1Bwdjqr5IURdCYGE21UMWPPVKLDvIQEVBSZBllU9TMTQq7nlq2DdcY1iCOotEHpQfymwb4/ivgz3jGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994716; c=relaxed/simple;
	bh=ApaDNDS3C7+IsYBvmZYT4kP7WppNyNcjdG1Ib/IIE9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIopbXJKuEzbACxqV2wecfNLb7gGpJ90uZLVpQI6xH+VAoI2wWJcE0BQsY/WEJZC3m8Mdvtu+rZOXG+hlCCfWn1vSh+iYvQoYu/EB3B2P8UEKJieNBZePGB9Tw6vTDTLiCMYYR8LQIr+yLqmS+wpj71S2EUlTRZgx9oTteIy7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlImDt/O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbBElb36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SHNpn13203243
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uxel72aCS7k
	ulDd81/nJWJKhmII+A/lNBec0BYNUuME=; b=NlImDt/Od7BMoDyWcOr8sIrTm9D
	R66+3mnrKs+whiRgFLJuL5rcdB3X3nhdiMNrZMLm35V9kz5TjD1XRHtH1EQcQglW
	2KRBcrDjLiunQPGhz2A57A5B2YA/FFnIdnLV3GeuRLM4V0t+fzPh/zFSr3Dm2FaT
	BZ7ne0atpGqNYUR3ty1tS0+fkEcsOXLO78FCQdc9zmJwQ1ULWHysq9sPQp+FQMgM
	o2tEbn/qZCoZ9pzR2wpmj5jlVD5Tkb8C/SD2ufRDgS1RDIyYEnuxb04nkCOuAjmy
	GjMpBhSwYgCVJGu+92DuXwwp49gL+zJnxyX0Vjmc8ecMj8I1oiD0jIJ209A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynma7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d09e77e6so150176371cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994712; x=1780599512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxel72aCS7kulDd81/nJWJKhmII+A/lNBec0BYNUuME=;
        b=MbBElb36Bd8qUtmeHpfsr6FVW3L5r4XUy1xEh2Ve/gOSm4WoWTuMuO3NlPbQWUFCgs
         zZZGQAQbkqyTNIUQVPqD9vcmwRy9nKpRGQ8syWmNkWR7GHA8gVaixMOUGkao8TUC6lZQ
         +rmoC06tiZ/UhN5tC9uf2et2uZmyz8V2ranPDGFB+TZ6GUEPxk+wrcbgWObfleDSB3jY
         ic8N8PPdxFV9WIArth39rvvcGHZfdsQHKVaf2XPTzlgt2zeQkndxEVzZ7HJdLAuAqG/x
         4qkJZHAkxptBC3I/9j276gBw4DKMDK510Zc1mXIhgW6Wu9kvwSmVwqOPRmT9um1yMTrN
         MgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994712; x=1780599512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uxel72aCS7kulDd81/nJWJKhmII+A/lNBec0BYNUuME=;
        b=dvxpReCEWOLgvu0Zf3v0Bdy4jboAUZy09eu/169j/9NQa60Id2toze3jxhK15FJsjQ
         cVz+AtZtw7JPBkUUHavHp8zyK4UpxOvU+Wz1zarl4t1iSuxyRdLYl3yeiJ/Gg1yAe3w1
         5i6yrjQLxGX13LDC/f26YmoXEZF8RTD2T3BhekxcZIbhSg938ffmwZWNKxfK0aoN5nLM
         lC8fgEFb7MN8z2NPNmMwPgCrJxwcF1IoYtOS4kQGtWtTuUKViCe9/uv5tJ3UoA5YXKAx
         X0AON+LIylgi4impBofbBAW+0jbAWkPmiITEohZTwe3BsXh4m3lWMYoPYCqHQbvZi1z0
         GItA==
X-Forwarded-Encrypted: i=1; AFNElJ/1wQ1O8iFB75FL7YT+RLlOACHJY+m9K4Ll+1GUm9th/SmWCeP5CEx56wa5Ey6yllvujXm2p7xTGiQVoL54@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJ32G/2nozrQDWYjuIY/0ejV8ttBCBu5EiF2kjvkroTp6EQMx
	Ma4AZx2vFEqCMQkubINwbPgop1O59c2ZKeNOSIR7Wy43MNlLCszwhyBNnZPjqxk+f6e7++F4XPe
	5zdsdlM2FNhxloGCRn8q22RJkcbB2D3nZSonexnTih6Xst7q0HXi3DRbur3aaVrZuX2j0
X-Gm-Gg: Acq92OE+C7sy0FSgJf2alBwiWcbcmBJ/HFD2sQJAPsBxezsQu95+8kc47ttE+i4ZsaK
	qC9CQ1036GKZ6YEMqV1lm5b79RGPC5EiskXn0LkjG3ABy+tv1uJl01+AlyqwEWJXB0yc9Fg0Pf9
	8mIhBwlHVMkPN/6rIhDJ098nAVzhRB3WhEv1pRI4CnOYiWm5oAUOGJwacU2h8KYFcQsNxRwH1pF
	tpJlw4nZ8hlnEEbxftVzH3tnx/vpK7KrKUtju/9PChdWocRdnkudCFG38n2qbmUQZUkk9Ps2xz+
	rrc9vsrs/w+BWENeL6oEopLg69Dve8JgBaiakBx021X+ije5qBBBRfKiUdabmDwndYxKbSLl/M0
	un9kYcRegrW9CTa2MEVQsrovi8IrZ0q0Zdon5LdCDPUwJ38zjLTSiaVb5db4Is+gN5A8BYg==
X-Received: by 2002:a05:622a:418d:b0:50d:e471:2d1e with SMTP id d75a77b69052e-5172cd74b11mr502751cf.35.1779994712365;
        Thu, 28 May 2026 11:58:32 -0700 (PDT)
X-Received: by 2002:a05:622a:418d:b0:50d:e471:2d1e with SMTP id d75a77b69052e-5172cd74b11mr502231cf.35.1779994711863;
        Thu, 28 May 2026 11:58:31 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/6] ASoC: qcom: audioreach: Add support for shared memory push/pull modules
Date: Thu, 28 May 2026 19:58:03 +0100
Message-ID: <20260528185806.6316-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfX/lz9A10IzeWy
 ezEXDwXCaxTbnGZsTHe/kmB1BxG2hw2+G4qItK3qQTywyFvxv+Pzlej+Pi8LhlcstMSs35d08LR
 UJjdoGsHlUnX/BiZxfin1/7G9vLia/29PRIcN40IGbo3ASQHG8xCtA4SiF/LdBOlL6Z0CaIDGxM
 dJ5QgyaibB1p169RdAPaU0pB0d5MkcQ5aUdJn8w9Ix67dZy4Jb8u6CcLSrxIOC3fYcbf/rCkr9E
 d/IsLlgE484I49nh1eaTLZR37l7T5dZHyn32B2MuX7jZ2Iou1a0qC0X4L5kwBwXjcHJFCG4gybY
 PRB46ls+Ax9tZFZJpPUsS+lzuZ19cJ93nV3Yh0ZHP6wN3L46IqdZg6efhiSaHxubPVA32AoHzef
 vD2mf3mwhYnAr8X7AnWOm+86ryfu20+QxIMibT5ThQuxAYLXsSf0E89+MFEOgBC3ZBC5weZSKP7
 N4szf4MP+VuBzugQhXg==
X-Proofpoint-ORIG-GUID: eaAr97xezpFuZRv0m_jWOKBcgZFHjTFt
X-Proofpoint-GUID: eaAr97xezpFuZRv0m_jWOKBcgZFHjTFt
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a189059 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eJp2UY_-qWcN76HEE-cA:9 a=kacYvNCVWA4VmyqE58fU:22
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
	TAGGED_FROM(0.00)[bounces-110174-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: BCC5E5F6D18
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
 sound/soc/qcom/qdsp6/audioreach.h |  51 ++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 158 +++++++++++++++++++++++++-----
 sound/soc/qcom/qdsp6/q6apm.h      |   9 ++
 4 files changed, 231 insertions(+), 26 deletions(-)

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
index 6859770b38a6..b85c7e5b085e 100644
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
@@ -61,6 +63,9 @@ struct q6apm_graph;
 #define APM_CMD_SHARED_MEM_MAP_REGIONS		0x0100100C
 #define APM_CMD_SHARED_MEM_UNMAP_REGIONS	0x0100100D
 #define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS	0x02001001
+#define APM_MMAP_TOKEN_GID_MASK			GENMASK(15, 0)
+#define APM_MMAP_TOKEN_MAP_TYPE_POS_BUF		BIT(16)
+#define APM_MMAP_TOKEN_MAP_TYPE_SHIFT		16
 #define APM_CMD_RSP_GET_CFG			0x02001000
 #define APM_CMD_CLOSE_ALL			0x01001013
 #define APM_CMD_REGISTER_SHARED_CFG		0x0100100A
@@ -710,6 +715,46 @@ struct param_id_placeholder_real_module_id {
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
@@ -723,8 +768,10 @@ struct audioreach_connection {
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
@@ -855,5 +902,9 @@ int audioreach_send_u32_param(struct q6apm_graph *graph,
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
2.53.0


