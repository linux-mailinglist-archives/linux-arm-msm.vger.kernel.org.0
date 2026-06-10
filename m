Return-Path: <linux-arm-msm+bounces-112517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id niaNO0OQKWqdZgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49166B74E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:26:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KVlZnre9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112517-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112517-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8836534A8507
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921924C6EF8;
	Wed, 10 Jun 2026 15:45:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D100449EB7;
	Wed, 10 Jun 2026 15:45:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106353; cv=none; b=Rmqk9JBbYjv3tNvqR9aiFwmsa9vHoVCiTcnO/7FgfteSgFR0NI9O/T//V8ViUkDbO64WtxCDQynlt/fqtzWFm0j8QxxUc8KwG8Wtpke5934ECkiJoOW87g5ImviBKK/aygHorfVM61bO1fymYKNPbPCxi5WnA0V1bD1VoTSDVqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106353; c=relaxed/simple;
	bh=LShHPgBJJbiwOvTB0X4hrdZz6ElWTU1/wUV1U28lp3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fx3JT87ceg60ZWC/wIaX5Mnri5XucI1gjbhVuwcvB6TTorNrp88LOKc2Ic73rZ4yTaDNmIlxk/Z5m0C2smwHgae8T67tBTAS12+62A4foSqJaRlkCa6SwE5iHU5Oulf46H2z9Z2pI3zEqhrn4OmdRHbAycA1+SQhSSEfxe9rydw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVlZnre9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBnoX1137860;
	Wed, 10 Jun 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mcfYkOviD15
	YU8y6H2v7oPkli0dNndzxtXLfi8pX6Jo=; b=KVlZnre9WMdTKoJknMT7zvQglGO
	ZLPKjV5ng77MMj4MNVDAoxshpZztJO2+/WNvNBWLfzMyrKqZvnBYDl75e80lAdeX
	jQ0M3WxWuapAim1Hc/4TpvoMWDm+v62+l+TBNROEOpgfwZMBvMGRcRn9IaqkZwoX
	LmeqEX5TZXvOgfAHHY5mwNu5Xx/i0EsLvf0pMIi0LeXZMvoipmMc4cNLYAfeOpTJ
	LIW5SwuNttxru+gVFSLLew1NhvUvpXjm0L3188kdgX4eR1mVgUp/WVCLJAvSFjLW
	aAuatP8YAJrhq++Vb48ImDyytyRkhDlY793YBACfS0aAOSy07mefU8p/Q1g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh3cq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFjWRR003509;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7fws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFjWXB003485;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFjWSH003480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 6CB3E628; Wed, 10 Jun 2026 21:15:31 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 1/6] ASoC: qcom: qdsp6: add topology-driven Audio IF support
Date: Wed, 10 Jun 2026 21:15:12 +0530
Message-Id: <20260610154517.134570-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0OSBTYWx0ZWRfX8z2Sjh76JUzt
 CvD1ASOmbSmCyVXIZ5pCwdGowbapwwWi87x3ZW5VtxRaQc4uOY7nabZ82vwpZFHC72iPjJtFSFy
 NsRxDGAsnY149Lv6Rh28NDbkds+f/3ctk9EQFVHPM8jrHvSBmG4O5mzbZSxHMX6vIc08gtPOIfR
 XFQ7SnSlrz/iyiKp1ry+i2CeycfqUPxEyTXzmGugacROB8+MoNxsWfjwLNA7r0aTIiuHzKcvRHv
 aX0pVhqOmYrHWTRxKZNJzt0FdlcnC/Gu/8SD+lvCoNY6uzBvEuaxzzZHHGPh+mqA0Jh8nVH5P63
 p0EO1+UyCTHoUh9IHTR3ZmTdV8FmmjzkoQQHucr1MUEQjqJ10VXDrKiWa20wWXynwKSFFnaQjsM
 Tj8VghAeq+VGuyK4V3GSqMsSMaIfqzpE/Qo/bNaaKKPaZzth95fbUf0zxDAzADSaHGMwV969KhN
 hGlVf3Z716WYOCBMdvg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2986a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=-Gxs-U4UEhHVYSDV58QA:9
X-Proofpoint-ORIG-GUID: MU-mQj_1kc9HldXIDngHQSIR-9T9Yui_
X-Proofpoint-GUID: MU-mQj_1kc9HldXIDngHQSIR-9T9Yui_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112517-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E49166B74E

Add topology parsing and media-format programming for Audio IF
source and sink modules.

Add the Audio IF module IDs, the required topology tokens, and a
dedicated topology loader that stores the parsed interface
configuration in the AudioReach module state. Also add the Audio IF
media-format path that sends the interface configuration, hardware
endpoint media format, and frame-duration parameters for Audio IF
modules.

This keeps the serial-interface configuration topology-driven while
still allowing the machine driver to provide runtime slot and media
format settings. The same Audio IF path can then be reused for TDM,
PCM, and I2S style backends.

The new UAPI tokens (AR_TKN_U32_MODULE_SYNC_SRC=262 through
AR_TKN_U32_MODULE_INV_EXT_BIT_CLK=276) are added.

MODULE_ID_AUDIO_IF_SINK (0x0700117C) and MODULE_ID_AUDIO_IF_SOURCE
(0x0700117D) are introduced in this patch.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  58 ++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.c  |  97 ++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  62 +++++++++++++++++
 sound/soc/qcom/qdsp6/topology.c    | 108 +++++++++++++++++++++++++++++
 4 files changed, 325 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 6b8102eaa..355a1e629 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -168,6 +168,48 @@ enum ar_event_types {
  *						LOG_WAIT = 0,
  *						LOG_IMMEDIATELY = 1
  *
+ * %AR_TKN_U32_MODULE_SYNC_SRC:			Frame sync source
+ *						0 = external, 1 = internal
+ *
+ * %AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE:	Enable data-out tri-state control
+ *						0 = disable, 1 = enable
+ *
+ * %AR_TKN_U32_MODULE_SLOT_MASK:			Active TDM slot bitmask
+ *
+ * %AR_TKN_U32_MODULE_NSLOTS_PER_FRAME:		Number of slots per TDM frame
+ *
+ * %AR_TKN_U32_MODULE_SLOT_WIDTH:			Slot width in bits (16 or 32)
+ *
+ * %AR_TKN_U32_MODULE_SYNC_MODE:			Frame sync mode
+ *						0 = short pulse, 1 = long pulse
+ *
+ * %AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE:	Invert frame sync pulse polarity
+ *						0 = normal, 1 = inverted
+ *
+ * %AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY:	Data delay relative to frame sync
+ *						0 = no delay, 1 = one cycle delay
+ *
+ * %AR_TKN_U32_MODULE_INTF_MODE:			Audio IF interface mode
+ *						AUDIO_IF_INTF_MODE_TDM = 0,
+ *						AUDIO_IF_INTF_MODE_PCM = 1,
+ *						AUDIO_IF_INTF_MODE_I2S = 2
+ *
+ * %AR_TKN_U32_MODULE_QAIF_TYPE:			QAIF hardware port type index
+ *
+ * %AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:		Active lane bitmask for multi-lane
+ *
+ * %AR_TKN_U32_MODULE_FRAME_SYNC_RATE:		Frame sync rate in Hz
+ *
+ * %AR_TKN_U32_MODULE_BIT_CLK_TYPE:			Bit clock type
+ *						0 = internal, 1 = external,
+ *						2 = skip (bypass bit clock enable)
+ *
+ * %AR_TKN_U32_MODULE_INV_INT_BIT_CLK:		Invert internal bit clock
+ *						0 = normal, 1 = inverted
+ *
+ * %AR_TKN_U32_MODULE_INV_EXT_BIT_CLK:		Invert external bit clock
+ *						0 = normal, 1 = inverted
+ *
  * %AR_TKN_DAI_INDEX:				dai index
  *
  */
@@ -240,6 +282,22 @@ enum ar_event_types {
 #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
 #define AR_TKN_U32_MODULE_LOG_MODE		261
 
+#define AR_TKN_U32_MODULE_SYNC_SRC		262
+#define AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE	263
+#define AR_TKN_U32_MODULE_SLOT_MASK		264
+#define AR_TKN_U32_MODULE_NSLOTS_PER_FRAME	265
+#define AR_TKN_U32_MODULE_SLOT_WIDTH		266
+#define AR_TKN_U32_MODULE_SYNC_MODE		267
+#define AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE	268
+#define AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY	269
+#define AR_TKN_U32_MODULE_INTF_MODE		270
+#define AR_TKN_U32_MODULE_QAIF_TYPE		271
+#define AR_TKN_U32_MODULE_ACTIVE_LANE_MASK	272
+#define AR_TKN_U32_MODULE_FRAME_SYNC_RATE	273
+#define AR_TKN_U32_MODULE_BIT_CLK_TYPE		274
+#define AR_TKN_U32_MODULE_INV_INT_BIT_CLK	275
+#define AR_TKN_U32_MODULE_INV_EXT_BIT_CLK	276
+
 #define SND_SOC_AR_TPLG_MODULE_CFG_TYPE 0x01001006
 struct audioreach_module_priv_data {
 	__le32 size;	/* size in bytes of the array, including all elements */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index e6e9eb2e8..62140ce8e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -152,6 +152,13 @@ struct apm_i2s_module_intf_cfg {
 
 #define APM_I2S_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_i2s_module_intf_cfg), 8)
 
+struct apm_audio_if_module_intf_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_audio_if_intf_cfg cfg;
+} __packed;
+
+#define APM_AUDIO_IF_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_audio_if_module_intf_cfg), 8)
+
 struct apm_module_hw_ep_mf_cfg {
 	struct apm_module_param_data param_data;
 	struct param_id_hw_ep_mf mf;
@@ -168,6 +175,13 @@ struct apm_module_frame_size_factor_cfg {
 
 #define APM_FS_CFG_PSIZE ALIGN(sizeof(struct apm_module_frame_size_factor_cfg), 8)
 
+struct apm_module_hw_ep_frame_duration_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_hw_ep_frame_duration frame_duration;
+} __packed;
+
+#define APM_HW_EP_FRAME_DURATION_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_frame_duration_cfg), 8)
+
 struct apm_module_hw_ep_power_mode_cfg {
 	struct apm_module_param_data param_data;
 	struct param_id_hw_ep_power_mode_cfg power_mode;
@@ -1042,6 +1056,85 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+static int audioreach_audio_if_set_media_format(struct q6apm_graph *graph,
+						const struct audioreach_module *module,
+						const struct audioreach_module_config *cfg)
+{
+	struct apm_module_hw_ep_frame_duration_cfg *fd_cfg;
+	struct apm_module_param_data *param_data;
+	struct apm_audio_if_module_intf_cfg *intf_cfg;
+	struct apm_module_hw_ep_mf_cfg *hw_cfg;
+	int ic_sz = APM_AUDIO_IF_INTF_CFG_PSIZE;
+	int ep_sz = APM_HW_EP_CFG_PSIZE;
+	int fd_sz = APM_HW_EP_FRAME_DURATION_PSIZE;
+	int size = ic_sz + ep_sz + fd_sz;
+	/*
+	 * A zero machine override means use the topology default; zero is not
+	 * a valid override for these TDM slot fields.
+	 */
+	u32 slot_mask = cfg->slot_mask ? cfg->slot_mask : module->slot_mask;
+	u16 nslots_per_frame = cfg->nslots_per_frame ?
+				 (u16)cfg->nslots_per_frame : module->nslots_per_frame;
+	u16 slot_width = cfg->slot_width ? (u16)cfg->slot_width : module->slot_width;
+	void *p;
+
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+	intf_cfg = p;
+
+	param_data = &intf_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_AUDIO_IF_INTF_CFG;
+	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
+	intf_cfg->cfg.qaif_type = module->qaif_type;
+	intf_cfg->cfg.intf_idx = (u16)module->hw_interface_idx;
+	intf_cfg->cfg.intf_mode = module->intf_mode;
+	intf_cfg->cfg.ctrl_data_out_enable = module->ctrl_data_out_enable;
+	intf_cfg->cfg.active_slot_mask = slot_mask;
+	intf_cfg->cfg.nslots_per_frame = nslots_per_frame;
+	intf_cfg->cfg.slot_width = slot_width;
+	intf_cfg->cfg.active_lane_mask = module->active_lane_mask;
+	intf_cfg->cfg.frame_sync_rate = module->frame_sync_rate;
+	intf_cfg->cfg.frame_sync_src = module->sync_src;
+	intf_cfg->cfg.frame_sync_mode = module->sync_mode;
+	intf_cfg->cfg.invert_frame_sync_pulse = module->ctrl_invert_sync_pulse;
+	intf_cfg->cfg.frame_sync_data_delay = module->ctrl_sync_data_delay;
+	intf_cfg->cfg.bit_clk_type = module->bit_clk_type;
+	intf_cfg->cfg.inv_int_bit_clk = module->inv_int_bit_clk;
+	intf_cfg->cfg.inv_ext_bit_clk = module->inv_ext_bit_clk;
+
+	p += ic_sz;
+	hw_cfg = p;
+	param_data = &hw_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
+	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	hw_cfg->mf.sample_rate = cfg->sample_rate;
+	hw_cfg->mf.bit_width = cfg->bit_width;
+	hw_cfg->mf.num_channels = cfg->num_channels;
+	hw_cfg->mf.data_format = module->data_format;
+
+	p += ep_sz;
+	fd_cfg = p;
+	param_data = &fd_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_FRAME_DURATION;
+	param_data->param_size = fd_sz - APM_MODULE_PARAM_DATA_SIZE;
+	fd_cfg->frame_duration.frame_duration_in_us = AUDIO_IF_FRAME_DURATION_US;
+	fd_cfg->frame_duration.allow_frame_duration_normalization = 1;
+	fd_cfg->frame_duration.min_normalized_frame_dur_us = 1;
+	fd_cfg->frame_duration.max_normalized_frame_dur_us = 100000;
+
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
+}
+
 static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 					       const struct audioreach_module *module)
 {
@@ -1411,6 +1504,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 		break;
+	case MODULE_ID_AUDIO_IF_SOURCE:
+	case MODULE_ID_AUDIO_IF_SINK:
+		rc = audioreach_audio_if_set_media_format(graph, module, cfg);
+		break;
 
 	default:
 		rc = 0;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 62a2fd79b..1dc29ddfd 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -22,6 +22,8 @@ struct q6apm_graph;
 #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
 #define MODULE_ID_I2S_SINK		0x0700100A
 #define MODULE_ID_I2S_SOURCE		0x0700100B
+#define MODULE_ID_AUDIO_IF_SINK		0x0700117C
+#define MODULE_ID_AUDIO_IF_SOURCE	0x0700117D
 #define MODULE_ID_SAL			0x07001010
 #define MODULE_ID_MFC			0x07001015
 #define MODULE_ID_DATA_LOGGING		0x0700101A
@@ -544,6 +546,41 @@ struct param_id_i2s_intf_cfg {
 #define PORT_ID_I2S_OUPUT		1
 #define I2S_STACK_SIZE			2048
 
+#define PARAM_ID_AUDIO_IF_INTF_CFG	0x08001B11
+
+#define AUDIO_IF_INTF_MODE_TDM		0x0
+#define AUDIO_IF_INTF_MODE_PCM		0x1
+#define AUDIO_IF_INTF_MODE_I2S		0x2
+
+struct param_id_audio_if_intf_cfg {
+	uint16_t qaif_type;
+	uint16_t intf_idx;
+	uint16_t intf_mode;
+	uint16_t ctrl_data_out_enable;
+	uint32_t active_slot_mask;
+	uint16_t nslots_per_frame;
+	uint16_t slot_width;
+	uint32_t active_lane_mask;
+	uint32_t frame_sync_rate;
+	uint16_t frame_sync_src;
+	uint16_t frame_sync_mode;
+	uint16_t invert_frame_sync_pulse;
+	uint16_t frame_sync_data_delay;
+	uint16_t bit_clk_type;
+	uint8_t inv_int_bit_clk;
+	uint8_t inv_ext_bit_clk;
+} __packed;
+
+#define PARAM_ID_HW_EP_FRAME_DURATION		0x08001B2F
+#define AUDIO_IF_FRAME_DURATION_US		1000
+
+struct param_id_hw_ep_frame_duration {
+	uint32_t frame_duration_in_us;
+	uint32_t allow_frame_duration_normalization;
+	uint32_t min_normalized_frame_dur_us;
+	uint32_t max_normalized_frame_dur_us;
+} __packed;
+
 #define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
 
 struct param_id_display_port_intf_cfg {
@@ -877,6 +914,28 @@ struct audioreach_module {
 	uint32_t data_format;
 	uint32_t hw_interface_type;
 
+	/* Audio IF module (TDM/PCM/I2S) */
+	/*
+	 * uint32_t fields first to minimise intra-block padding;
+	 * 2 bytes of trailing padding remain after inv_ext_bit_clk
+	 * before the next uint32_t field (interleave_type).
+	 */
+	uint32_t slot_mask;
+	uint32_t active_lane_mask;
+	uint32_t frame_sync_rate;
+	uint16_t qaif_type;
+	uint16_t sync_src;
+	uint16_t ctrl_data_out_enable;
+	uint16_t nslots_per_frame;
+	uint16_t slot_width;
+	uint16_t intf_mode;
+	uint16_t sync_mode;
+	uint16_t ctrl_invert_sync_pulse;
+	uint16_t ctrl_sync_data_delay;
+	uint16_t bit_clk_type;
+	uint8_t inv_int_bit_clk;
+	uint8_t inv_ext_bit_clk;
+
 	/* PCM module specific */
 	uint32_t interleave_type;
 
@@ -907,6 +966,9 @@ struct audioreach_module_config {
 	u32	channel_allocation;
 	u32	sd_line_mask;
 	int	fmt;
+	u32	slot_mask;
+	u16	nslots_per_frame;
+	u16	slot_width;
 	struct snd_codec codec;
 	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
 };
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 1f69fba6d..2ae7ac3d2 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -753,6 +753,108 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
 	return 0;
 }
 
+static int audioreach_widget_audio_if_module_load(struct audioreach_module *mod,
+						  const struct snd_soc_tplg_vendor_array *mod_array)
+{
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	int tkn_count = 0;
+	u32 val;
+
+	mod_elem = mod_array->value;
+
+	while (tkn_count < le32_to_cpu(mod_array->num_elems)) {
+		val = le32_to_cpu(mod_elem->value);
+		switch (le32_to_cpu(mod_elem->token)) {
+		case AR_TKN_U32_MODULE_HW_IF_IDX:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->hw_interface_idx = val;
+			break;
+		case AR_TKN_U32_MODULE_FMT_DATA:
+			mod->data_format = val;
+			break;
+		case AR_TKN_U32_MODULE_HW_IF_TYPE:
+			mod->hw_interface_type = val;
+			break;
+		case AR_TKN_U32_MODULE_SYNC_SRC:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->sync_src = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->ctrl_data_out_enable = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_SLOT_MASK:
+			mod->slot_mask = val;
+			break;
+		case AR_TKN_U32_MODULE_NSLOTS_PER_FRAME:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->nslots_per_frame = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_SLOT_WIDTH:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->slot_width = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_INTF_MODE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->intf_mode = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_SYNC_MODE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->sync_mode = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->ctrl_invert_sync_pulse = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->ctrl_sync_data_delay = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_QAIF_TYPE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->qaif_type = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:
+			mod->active_lane_mask = val;
+			break;
+		case AR_TKN_U32_MODULE_FRAME_SYNC_RATE:
+			mod->frame_sync_rate = val;
+			break;
+		case AR_TKN_U32_MODULE_BIT_CLK_TYPE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->bit_clk_type = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_INV_INT_BIT_CLK:
+			if (val > U8_MAX)
+				return -EINVAL;
+			mod->inv_int_bit_clk = (u8)val;
+			break;
+		case AR_TKN_U32_MODULE_INV_EXT_BIT_CLK:
+			if (val > U8_MAX)
+				return -EINVAL;
+			mod->inv_ext_bit_clk = (u8)val;
+			break;
+		default:
+			break;
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	return 0;
+}
+
 static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
 					    const struct snd_soc_tplg_vendor_array *mod_array)
 {
@@ -806,6 +908,12 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 	case MODULE_ID_I2S_SOURCE:
 		audioreach_widget_i2s_module_load(mod, mod_array);
 		break;
+	case MODULE_ID_AUDIO_IF_SINK:
+	case MODULE_ID_AUDIO_IF_SOURCE:
+		ret = audioreach_widget_audio_if_module_load(mod, mod_array);
+		if (ret)
+			return ret;
+		break;
 	case MODULE_ID_DISPLAY_PORT_SINK:
 		audioreach_widget_dp_module_load(mod, mod_array);
 		break;
-- 
2.34.1


