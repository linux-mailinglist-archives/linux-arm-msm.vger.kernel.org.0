Return-Path: <linux-arm-msm+bounces-112515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WmSyMFqLKWp1ZAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:05:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA566B275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QpXkDDdr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112515-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112515-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40EF233D1E2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D5E481224;
	Wed, 10 Jun 2026 15:45:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1A3449EC2;
	Wed, 10 Jun 2026 15:45:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106352; cv=none; b=mje6e+FZhQANI1vj5RaGtm4Nbe0fFr77+geYvEbiRLhldHMud50o3hVyng6Jc4tnCZG+PL2YP0uvBegckkkoRgTx4jVWbg6v6LUJBCLmt1bpMoxxVcNT+QoB6t7xoWMXDtUstwni8UkskH+r+Gi/IOBslnG0p7PYVGc7BKCpf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106352; c=relaxed/simple;
	bh=qEJJn1EVfBXbPUlfhVmaXLI5UaoUfIisf1fUd6G3FCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NJlphslLvfDjCBy5/+qfB1nmAHRbwGidRVOtbHk1YbTW5yVNwwVBiSNMHClyi1/97ULIRLxzqLCK+OnTdt8ZhaMD8ffDv3xEWWw2g7EVXSCuYjCvEHfzGLRns3mVVNqYaP9xb7wh55ix/uD9NsByESBWtrHpxak8V1O3VVprojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpXkDDdr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBeab1137399;
	Wed, 10 Jun 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4T80w6Deobm
	keGKhbkBD6/oz/ttFgfaknC4hhfFNjQc=; b=QpXkDDdrfUgg6FVLB3ivhIsNG/b
	SPkPLmmNuVaZLqJtfKqQlmuNUCodecp7tfHNTpkFjqJe0qEVaTE3RAJq1EUxqCe/
	9oxneCXn+fVy3eaHXjJZfLycrr3UFKZeHZOfEqV/1MXS6q4rjJIXS0S7CmQhtCEC
	ngP0sYSSX4LDek8s6gAdbJw8Y8og9SuL9K1ZgVzQP5HGvqLrINFUAMq+NzCEEUK3
	7feRxunFnDjb1BaClbFNMAXpBWvfhdXKBlVc6u0e4zk0WKGcbKG66mL6jWD/DfQS
	POcLywHEzOvwPmBaZ7wb+A7hoboqWFxUuxwndBc8hPsnSe8XMyIt8vJv6Kg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh3cq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFjXC9003555;
	Wed, 10 Jun 2026 15:45:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7fxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:33 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFjWuC003484;
	Wed, 10 Jun 2026 15:45:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFjXYM003544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:33 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 8291563A; Wed, 10 Jun 2026 21:15:31 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 6/6] ASoC: qcom: sc8280xp: add TDM hw_params support
Date: Wed, 10 Jun 2026 21:15:17 +0530
Message-Id: <20260610154517.134570-7-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0OSBTYWx0ZWRfX/Yn4d03/TyCA
 89HcMgIMW9Lvx+QR/o1Zg43FzZ80wbcmVRJp426vngGepHcfy8Xswqyc4eLQxdm1NzoHhJBFK6a
 W/jHkb2HYdOANLIn+e37Etg/D5yhWnFwjJXLfIknv7f42fB8oVjhZaEbX4mjtzrZIj+EofgaocI
 1mdN9Wo45HwRXmyP1+jq5JQCb949e5CaI2Fuz8ZKrJy35U4yRiLLt9AvWPhRj4lmFhG4ecQ6td5
 fIYfSvYbkhvLnTCgrZc2JYOxtL/PP5NGNUYsxolAKRSbGgVwP5OL+PIRn/Jge/gVNejbSI7unca
 jSIoRhWmv9j+psRklp4HH/CwAWF37THeWWCdi3gz9e7Z5Aya9TScaAOKNcdFzt6W8tjyiq125ax
 Lcy6d0M8h0bQO+7ezyYOXYNQhSE7QIQ2ezpUdwVDEsf3fgUkIAWOG/WXrK7yGNuleFEhpnWYi1T
 aIM6KjhtNqJlGil4kiQ==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2986a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=QTpijNGdYiuWC2p250EA:9
X-Proofpoint-ORIG-GUID: B01Ix-dj2DJl6ICZ9N-l2brg2KviWsis
X-Proofpoint-GUID: B01Ix-dj2DJl6ICZ9N-l2brg2KviWsis
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112515-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46AA566B275

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
 sound/soc/qcom/sc8280xp.c | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 1f3afc6d0..e5d23e244 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -83,6 +83,63 @@ static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
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
+	bclk_freq = snd_soc_tdm_params_to_bclk(params, cpu_cfg.slot_width, cpu_cfg.slots, 1);
+	if (!bclk_freq)
+		return -EINVAL;
+
+	if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_MI2S_BCLK, bclk_freq,
+				SND_SOC_CLOCK_IN);
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
+					SND_SOC_CLOCK_IN);
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
@@ -186,6 +243,8 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 					       0, mclk_freq,
 					       SND_SOC_CLOCK_IN);
 		break;
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;
 	}
-- 
2.34.1


