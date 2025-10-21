Return-Path: <linux-arm-msm+bounces-78141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 683BFBF5D9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A58423F80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1828E2F0C7F;
	Tue, 21 Oct 2025 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR1GfUzy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3192D8DA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043214; cv=none; b=QqPBjmkdAIfjXIT4Xhkv3kDDa5UDzlRjWMUN8uVMdtC5HkXk8qRDKw0lRV7o3esssp3HdrUq86B4kP/sMiiMbfszGyqLnu2yCDqEA0LK9svNY4KIY8PTv1qeRD6+CoGWv7XqP3B4DwzE4GHMYtT1OiScqouqjuHWBROV2EsOWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043214; c=relaxed/simple;
	bh=9Yzea+GEBCp3vC14uyqotsmH4Z9Whw1KznKC/UswPf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nC/JLX5RVrCJhIAY56EUZZNQ87RTyykfZfpJM3Rn8yfoUAWSlh95uJMdyZhRa3AiLzNjlROVCVLpakTBusnJDv1iGkQ7MtvQNGsO/ZzZcqwyndAqFUR04x0nnWK2F9HZXpn5anS5sWyMT99xGIio/xkoLshRvxyET/UWNWPoQWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR1GfUzy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8KamU024521
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9AVB6C9MIvz
	52Jr3ZtdLA9E94f5FNRcURNEPb2LyudU=; b=gR1GfUzyMoN8DNVtiBuVCnEqc3A
	YcvvbgefWdYvJ5OXLubEXxX82R83E8yUrNv6+7KvwsbuIVsoTZMs5n3LbIJcvyk/
	2nU6i++/Dj9AsDj9LjQRAmq6F9/iMe/FQUd0F5fsXjW4v1TszHUiL+4GD027eEUt
	4/y9+ppZDTPybmjObHk53f5+crnUhLG+HEK6jZq3iGrYTJRogo6GuVSu8z4tYoi8
	Q2cP43wKfvSxCMjLhMYAsUvNSP2W0w3mCwlmZDzSyCUuZeYtXEo13AWiDBFpsmV6
	zRAKQgi3fwtMtku4OckBpu2s6OJ/+xg7mhBVoyCcGXPflszchxQsPC8nzdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws2rjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88e2bd0791cso713345485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 03:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043210; x=1761648010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AVB6C9MIvz52Jr3ZtdLA9E94f5FNRcURNEPb2LyudU=;
        b=cawIqwqsK2llf2xMFKFBCbUXyZi4+t3L+v4XdFO3HjECr5vVf9SmpN7GmrLHvWSFl5
         v7l/kfFsi6EYJyaqEOKF6YOrzjNQe0AQywH1wjzHfGG1AOx1uYutmEMZ12R3iaVh3Iid
         bIH+N0+UMsPgWvN3TbkPw33q4WpCys54zWZL1Faw1f4TTCZVyEY1oDaZxkNTPgIdXI5j
         SGn3TkDwHuVBhO+odxkDdqWoYeQiAR3zmjR+DMIF2S4pvr/TYPr7HFTFYSXMH8qnT6MB
         UsWbhAIRCVVs8UOAZ9edWJc5mbUcrI0q5W6LTIa5PF/i5WavVPeQaRk1hc6N156FL9hY
         9zPA==
X-Forwarded-Encrypted: i=1; AJvYcCUg14L7I0Bq60ldTBp1lYWXy7sld0Nktq6DT9mEP+yEruuzofmlmtE2MZbCuhq+TVZ8HLtcsJn601IYnQrG@vger.kernel.org
X-Gm-Message-State: AOJu0YzHsGqcOJ1Rh2VfHg89j9Eag1YFkjyBmJxEN00zkQg9pyIXNSJ0
	YZDXpFF5w4rNOuhnY+PCfyAAW7At1KlwsWyU3ibCXJXgN6srnnjL3MUbHMipSNDfHnPlO0/fnF/
	35UbdwiDNEQLUgFwcFezptuFITkn+Ob9zpQT3TnAx6aczVV/0aa80vRLLbZ/+lZa4tdCG
X-Gm-Gg: ASbGncsVBNZ5OST4vnrfgJG5EuGR6DiMZ+h1239dQuzUdgIC6MO9uCreSGQwyYcn9MU
	u1M/h0kSSDJoY2Huv56F7SzvG0CvkURGzNM/6NZ0jojfg/JLt6Nifd8VYQGnwexuRaLwjaLApN8
	BHJ80jHbgro/1N9vk1RJeAIp33oE0Ll/+y+qjfoXegE558tsnu1cWkec1AA0+piSk0icgCVNKSh
	9lkMNCSjxwtPhck83krvjqIp13/QAhq9y7Ut0hT2BzeJrqmWTv6Cy/o0feaT9Kfd8knpL40QIbt
	TANwX8N2tvGfGJZS4+KT0rmJr5KSzQ4zo0jIT8Hq0q3k/fnCHA3xilRUHneJRwqrIlg3xF2zECK
	/G2vQCNWaR3lF
X-Received: by 2002:a05:622a:1899:b0:4e8:971d:10 with SMTP id d75a77b69052e-4e89d209944mr206517451cf.12.1761043210300;
        Tue, 21 Oct 2025 03:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSGENTASX4ZCUyVauFbu72tSoTDiq9c99JISaWvIGYxlRh8iPGVUjzGg07n0JZACEeGKQgWA==
X-Received: by 2002:a05:622a:1899:b0:4e8:971d:10 with SMTP id d75a77b69052e-4e89d209944mr206517211cf.12.1761043209826;
        Tue, 21 Oct 2025 03:40:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/4] ASoC: qcom: sdm845: make use of common helpers
Date: Tue, 21 Oct 2025 11:40:01 +0100
Message-ID: <20251021104002.249745-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX172U8mkJda7O
 S6IZbjhbCKUS/RR0/0ZaITw2dQe48aZRmC5nLwTLChRkUW8hCL3rh9KRaI5iIn37MiTY0aLcGKb
 R+5lavZMUglLKCcv3GFq/IZRmXaePbZUA7N6PvLFZUQu230Qd4+iwAvnW2T3gaPcYhbLwkGGutf
 5OnZzXFpCHnnQhNvMPUa71G3LwWKXYycYdzYJmwj6HYdnydHzylRmcR0ITIrzwWkTHuHXkrDOq7
 a7X+AEf3b+bWR8su1QKrEKSb5fWFZv28+f2R8b3L3G3t55pV1e27nSOIySD/R7KS3fKw8ftk0mG
 SPwxE7f1bE8djbTD8+rxLE1OILLUtEm5b9AqfXH4nwds1TlqNEzuyALE95r+lxQeZrsII2bF/z7
 uV7sVjI0qUIwEXQUB5teaOx8ahphww==
X-Proofpoint-GUID: 5KyAw3ylz9A8t4Ag2BzHsDWlIH6vtOOa
X-Proofpoint-ORIG-GUID: 5KyAw3ylz9A8t4Ag2BzHsDWlIH6vtOOa
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f7630b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=5b0IN9Hzzi15MECZVvAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

sdm845 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sdm845
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdm845.c | 53 +++--------------------------------------
 1 file changed, 3 insertions(+), 50 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index a233b80049ee..e18a8e44f2db 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -40,7 +40,6 @@ struct sdm845_snd_data {
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
-	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 };
 
 static struct snd_soc_jack_pin sdm845_jack_pins[] = {
@@ -62,18 +61,11 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
-	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
-	struct sdw_stream_runtime *sruntime;
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0, i;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		sruntime = snd_soc_dai_get_stream(codec_dai,
-						  substream->stream);
-		if (sruntime != ERR_PTR(-ENOTSUPP))
-			pdata->sruntime[cpu_dai->id] = sruntime;
-
 		ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 
@@ -430,7 +422,6 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -471,8 +462,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	data->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
+	qcom_snd_sdw_shutdown(substream);
 }
 
 static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
@@ -480,38 +470,8 @@ static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	int ret;
-
-	if (!sruntime)
-		return 0;
-
-	if (data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
 
-	ret = sdw_prepare_stream(sruntime);
-	if (ret)
-		return ret;
-
-	/**
-	 * NOTE: there is a strict hw requirement about the ordering of port
-	 * enables and actual WSA881x PA enable. PA enable should only happen
-	 * after soundwire ports are enabled if not DC on the line is
-	 * accumulated resulting in Click/Pop Noise
-	 * PA enable/mute are handled as part of codec DAPM and digital mute.
-	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
-		return ret;
-	}
-	data->stream_prepared[cpu_dai->id] = true;
-
-	return ret;
+	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
@@ -519,15 +479,8 @@ static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-
-	if (sruntime && data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
 
-	return 0;
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static const struct snd_soc_ops sdm845_be_ops = {
-- 
2.51.0


