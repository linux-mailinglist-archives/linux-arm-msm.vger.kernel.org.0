Return-Path: <linux-arm-msm+bounces-118575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LEUXLnyaU2rDcAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:45:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D834744D89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:45:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HeYZJy1k;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118575-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118575-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9686F305775A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E333AD51F;
	Sun, 12 Jul 2026 13:41:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA2A3ACEF1;
	Sun, 12 Jul 2026 13:41:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863713; cv=none; b=qxCjGwu1TSeDSR1xpwDNDxZe7VVv8Fl4O12KdzDvr8iqcuChxqc67Erb+CgaenQJo/EHLk4oUSMOruJIQPRF6731g0CVedEFo0++mVR2IN07IjskNaEvH0OdkdRXyAVptgZxio/dbJzML/dX+EzWfZ3elolNfP4J9R3Gn/lzh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863713; c=relaxed/simple;
	bh=UYBNO8PavWcYBGXaonqN9ioCqieUh61c17kcrThmSlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mq4w6kLPZl+XuoM4TXe9FOdwHNyScyNwx+Gn7lD24W0AlgcvWrV2RfaFtIpConYU24OweYy4ZVLFStGBXXSXY1YJiyiBq8ydGdRsJm34gxiTwZpgeXgQ2kf0ZJraI3i9IFG+l9mCwqHMPlLN70UuVk49yFg8PHNYhSIq4Z3Ku0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HeYZJy1k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZkD22603868;
	Sun, 12 Jul 2026 13:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vGhrYne7bvA
	ZPZFxOkACDJ//NrqboTe4Nyn/d81StMM=; b=HeYZJy1kpsFHm93x4to0VT7k/nL
	WIk+0GxMWuIcePOGnx/Y+rTeeYdfT5e0gqlYOu8Jt0ufWXlhuZsZnWgTpXRAsza6
	Keik9sCRc9EyhczUXP3WQxrTfSsJWkya1psQ6bF+JE4l8eN3zelaJ2IZJUXrE1Iu
	el+GlS7fMLMLi/Ips2d8b8SOxrhjrwKSVnxD4QNJcVpFqz+5gKSP02T7Kx3SNnDg
	WpOdi+F3qPWSx7avKYHl6KP7caHHJv6nGwn/R1C+q9urhAElKWZnqWS4S3SjF/bM
	pZ0l/X9LIxw6ZrwgZaXq4uAGWK+9C63V/+tpIyJxJ66XJR/Ub/649ITX02A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcjt9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66CDfFS2026903;
	Sun, 12 Jul 2026 13:41:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewhmf81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66CDfEk1026884;
	Sun, 12 Jul 2026 13:41:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66CDfEoW026875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:14 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 5F0C3643; Sun, 12 Jul 2026 19:11:12 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v4 7/7] ASoC: qcom: sc8280xp: add TDM hw_params support
Date: Sun, 12 Jul 2026 19:11:10 +0530
Message-Id: <20260712134110.3306763-8-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX7FP8ATl4dv35
 PMEgPU9tkj32GI1YOkbmGw1kH4USnu6M3KI6GNaq9PZo5guwj19vV/uJA8dVy4f3g4Hh4zD2ya4
 5h0Pi47sp2lrK4+dWpkQYGMlRckGs5SxMIxwliAUSNMYvwau1Jnh3dRU57od4kqeZymVdsdVtJ8
 8br2qV8ZEwOKA4talsimICePHTXQj1/HqQ7VL/qZoieeDNOPhh+L+6sptnCG55yVisZ7zz8qCxb
 NcdzSsSMtK04PkyR8qnK15tC5Oa+ZeU6orXDpo1ZAur437i+ij4Z6nkRY9b4qLD1T72upxZ6jTC
 qnLJyNtMjuqOw7NsUGRWHLgb3YWjy86G6thOFq9NZDfAHz6iNlfdBKvEZw+wKy0pnUpfOKULY0A
 YIiH7CN/G5k4kcRV3LEH+zEeQup/cuuEKvqrcGGflo/hntkTaiWlHdmeNsEuTud9VUZ5wQXqC76
 Wya/SqM+ejfoJ8d3sAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfXwyqgcj5V3bUV
 vX/JDt8n6Wc5/ydx3zbXPqJvh0p0EzYh+dsVIyXFdGphxCAmHeaYzNkwrHsNrc2Qb0KCAjLq12y
 T2wygTGB7Ds6cB0InvBNnF9Ay/f04/Y=
X-Proofpoint-GUID: xhq4KUIqqJH7Jpw2m80ar2sqjOR_jqT-
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a53997e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=QTpijNGdYiuWC2p250EA:9
X-Proofpoint-ORIG-GUID: xhq4KUIqqJH7Jpw2m80ar2sqjOR_jqT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120143
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
	TAGGED_FROM(0.00)[bounces-118575-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D834744D89

Add TDM backend handling to the sc8280xp machine driver.

Use the common QCOM DAI-node TDM helper to parse the standard
DAI TDM slot properties from backend CPU and codec endpoints. Reuse the
parsed configuration when programming DAIs so hw_params does not need a
second DT traversal.

Derive the LPASS backend bit clock from the runtime TDM parameters and
request it through the backend child-clock path using LPAIF_MI2S_BCLK.

Program codec sysclk in hw_params so codec PLL setup happens before the
stream is triggered.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 60 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index eea571de9..728300a57 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -84,6 +84,64 @@ static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
 			    snd_pcm_format_width(params_format(params)));
 }
 
+static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	struct qcom_snd_tdm_slot_cfg cpu_cfg;
+	struct qcom_snd_tdm_slot_cfg codec_cfg;
+	unsigned int bclk_freq;
+	int ret;
+	int i;
+
+	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
+	if (ret)
+		return ret == -EINVAL ? 0 : ret;
+
+	if (!cpu_cfg.slots)
+		return 0;
+
+	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+	if (ret)
+		return ret;
+
+	ret = qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
+	if (ret)
+		return ret;
+
+	bclk_freq = snd_soc_tdm_params_to_bclk(params, cpu_cfg.slot_width,
+					       cpu_cfg.slots, 1);
+	if (!bclk_freq)
+		return -EINVAL;
+
+	if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_MI2S_BCLK, bclk_freq,
+					     SND_SOC_CLOCK_IN);
+		if (ret) {
+			dev_err(rtd->dev, "%s: failed to set cpu sysclk: %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	if (data->snd_soc_common_priv->codec_sysclk_set) {
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			ret = snd_soc_dai_set_sysclk(codec_dai, 0, bclk_freq,
+						     SND_SOC_CLOCK_IN);
+			if (ret) {
+				dev_err(rtd->dev, "%s: failed to set codec sysclk on %s: %d\n",
+					__func__, codec_dai->name, ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -206,6 +264,8 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 		break;
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;
 	}
-- 
2.34.1


