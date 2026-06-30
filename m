Return-Path: <linux-arm-msm+bounces-115346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z3ZdBhiLQ2qdawoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:23:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F46E218C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:23:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pMPxdcv8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115346-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115346-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E61783043079
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D878A3E8352;
	Tue, 30 Jun 2026 09:20:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72797379EF7;
	Tue, 30 Jun 2026 09:20:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811242; cv=none; b=mlz5YlB/NwjQwNRRzraJTj6zOv6QPy8vSkG1lbkioravc5KTZvwgqfxP6DjH7I40Qm4Ei7s/S/OurnogVSaiEksua/+UL3vyC4eJR0H6wpUBT50gCcQPjuqO4jEtqcwr257UbL4UMyvOrkpdytJQnqms65MLNxDM0t/d8CtPUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811242; c=relaxed/simple;
	bh=twqRVVm2jX3j9DQJsBQp/A9ulNIRgckM6uD5x5XeF2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=POJ1v8egeE2JqAlJP1qwp2z161j9Pn/bDSpEFb98KZTrY7ZA8CO7rL+xqG33G0siAVWSij1OCmdnfvG8UeZaCyq1GD6agq3Y+N8XXF93z2KmIFWc35ZpJ46CQF1YbZQsih6/JtzFP0iCp1TszPePK3Vx2h2qmZFnE63dG9HeAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMPxdcv8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CJ1W1056027;
	Tue, 30 Jun 2026 09:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zS2NKJX0t2i
	l32bHO653P1abE866LuOgajP9cd0/NB0=; b=pMPxdcv8JZwxcIWclsSGpWQ4IW9
	fDTkMGpg2omOGjRFhkDDl78ZcKmajbYxbuOe0i6AqAazjCdyKrhMzO/a5hd0Zu47
	mGNZBUwK1bJQrg/cg4ROHLQIgrgOzFivXHoVFtbQo5AJxHY32Ys+eUP5Gd8cC8tA
	WWDhGom15p1+9sYHqJVW6Jh7LJXnuNzQQxlB5vHNXyjvF5+zsas1VJJJ8IVDbpbQ
	tdyNEdEyjB0fw7uiLZOYaeBhknVU7LG4KqyXk4G+nFB1wmlSFJLkBC7AyF3Tn0dy
	4pTfazAw/uwVYWm8zRAHZlpVp0MZu5wRcMdJ98VDhVleIWBPcc2RKayY6+w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861c0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U9KICQ010622;
	Tue, 30 Jun 2026 09:20:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjmer8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:20 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65U9KKxu010737;
	Tue, 30 Jun 2026 09:20:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65U9KKan010727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:20 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 9ADB563B; Tue, 30 Jun 2026 14:50:16 +0530 (+0530)
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
Subject: [PATCH v2 7/7] ASoC: qcom: sc8280xp: add TDM hw_params support
Date: Tue, 30 Jun 2026 14:46:05 +0530
Message-Id: <20260630091605.4043426-8-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: aV8BUphHUd0bDSPNh61CdN7Con-P-YpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX+ocU+Slcugl8
 aHq9oQYfie1l/XCCffY3F1XD+zpJlS+uZZB8+sUoRFIYw4ys+OUkdkYiD1Fxwa2casVRiwpXO5w
 82BBfB4Iqk6lGY2mzZa0Vesww8FrI6rv1VxvyQ0VQ0ei61vgJ1ywCoZ1BhFpSImSwY5641UB5c5
 45Cvc5bF+x59NsOr8h9UYSTPg707eX6bu9b0V0Ik8Eohw5wJgapIIiK86SrhvG+yPba3YD5CtPJ
 31crGJF+S74KTvwsnyxCOon3p96Ow2r4+PE19QpindY8VhHbujlq52quvtEaVB+ak6Oxkiy/yTE
 1NZtFkWYxjwTzBcFPvgqhGb5Me1X5wTFGrcI87JjwmVK/5hAdTAR+V2HJWG5/JKYDsK+5aXPrHZ
 DPTFlf+pUcvRnZ3EgrVUJA03mlMBjmjlzlaehNZJ589o79B0cem5NCaGqbGwuWFdGcDCuqQKqir
 D7KSrO/M4ZiGr8MujDw==
X-Proofpoint-GUID: aV8BUphHUd0bDSPNh61CdN7Con-P-YpD
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a438a58 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=QTpijNGdYiuWC2p250EA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX71SDjSKCEdSL
 4iCGwZSr8somYR+n5xFyKxMtPGjU5fbwFdHSK1kLFGbI9AybvloIEBUS3fiEQXCUPu2w5+lRVmB
 zRlAIucXD+Y4HvXLDaCxvy8nITho6lk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115346-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C60F46E218C

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
index 1f3afc6d015c..1a385a673f86 100644
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


