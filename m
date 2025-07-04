Return-Path: <linux-arm-msm+bounces-63700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2FAF923F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 14:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF3191CA4066
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 12:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7C22D9489;
	Fri,  4 Jul 2025 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YnasVS1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424562D781C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631166; cv=none; b=r7b2/mpy9NrF2OZwrxzqIS0P4iJVte+A98OsG51JAo3z52GRvSHgeNMym/MfHHRGzAl1EX+ct9G7v3TldLyHFWOSwPzwe8YJMnRy+Ke0wDVNMJXlqe9+3L/dA2xrwmrjPQPtTyAiDL/7dvzE6qwXHf8T8V4rcevpolD+dRB86Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631166; c=relaxed/simple;
	bh=o9u2dqXMA63RaFVVOvAQy9JJ5LYOfZOsQ79yZPELfUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FchFH362STkdnUkMGEa0AfBLf1nEhXRos3Pr/unYy4RD27OTNYNCU9X9YcpxzxFmOEkM4rEcZexPueLJLU8zcdwqEG6Qzeu9+fQhbousB76HdtsyYVpTZg5E+RuW2n9AIeFQw9Yz7GNOcAtR0aPMbDwmNJDt9ZFd/k6ZEbi9sgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YnasVS1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648X5Th025373
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=68AQ8v60eaG
	OMLqf/fYh4D5Zw4475DJhwIDnQ+LXSAo=; b=YnasVS1dGaZfs0Rsxdm2aJ5yxt5
	MWZa9J4tbba0l3wpwtQuHcRLkgHG4mc5XwhrJDYI3NShX8EjdCkNm3CktSPVuvP0
	C4htBcoyCaUarZZR6+v7W+63PorhNEekSmaXpYm2z4WcAzzU5JFUFz1ojg+NlRbf
	y62UdxB+moPLyxR66RQKj9YhULsoLrvNnxvwDuo1v6+No7yc83bqQon9lGcpElqc
	3qCpnNRSm7Ul5m3t1k3ngqW2DRKd11fX90thJPpKhlRq3RAN1Ot4a9q8GPP6+Aea
	ihGJWsQn+43fUNH69vopjLWZv1MFZJJJu6wOP+hS860nvPdNzM+meeH/AiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650y0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 12:12:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0aa9cdecdso65743385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 05:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631163; x=1752235963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68AQ8v60eaGOMLqf/fYh4D5Zw4475DJhwIDnQ+LXSAo=;
        b=asQ0FpFsA26+n/bLyE0vPjLL0oHYSjooPEI7SXgF31I8NrowwGc+9PGBuGp4qaGIUz
         c760DchOZU9+4izm/u3GcUsH3NlBY0iIGvmanDa4UBsJ+d1/ZthW/LSZsN3SqHqA3ZWy
         9iQIiAkuybzUT3qt1wEHxX13yFZqvGapRGrNEnvbp55qdl4LFm3OWW57XSTMRXjouKID
         IIMUmTGGen7JgQ/LKJ4Q5FQlpKJYHklbbNnT+MDoewDj00KqY44oq6OECMmmdqbIJtsc
         wJMC3T3zAo0cXqRwiLCLF5PLVY5GNnOyrDq7pJVxRadD/A/uqFDBoLZUL7nKNazwVufi
         uzfw==
X-Forwarded-Encrypted: i=1; AJvYcCVJY+u/vIrvrgGgDcsyBFB9ua2YRgsuWE6ERsJe2xyq50As3aVtamSs0BuD1EDOfYhYzu4KGS2fFnMFg5ON@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/oJ5AiedGJOZDMziDsgZJgxfY1Wqz27IulZClZnOb27VesSvY
	p9F5E5CJiYFSlaYEDFwgkSqLrSevcsWlOES92QAMLZvYx/viR6hhHoUcq65eYsLJ79wQVQUphPC
	+yworQSrBlFjXj9aTE4EXysBM7DT/tkKVaX0xasu7o5g/aReYgMtGlWI8UGBuXF0ViVmBUEGdwp
	71
X-Gm-Gg: ASbGncuaBvek8Vy6JptE6F9Nhl3YxZKF/ByAgYosUM9UdnYToZ/o7zABjI9v0Dh3U05
	jfK75YPcj/zWwvs8fCY1Kuj2fXlFTyv1EPi/gARmlyJK775mZKu9hdeCrgAxDoR9etNjJV9ZoZ+
	kyIYetSf5Js4d5svZqQbHakrR3kRwGo1vG0fuOk2bYIeT9wPaDChmJO2gHvWl5E5/qc6scgCST7
	gRYGJFuW6YRWBVz1VGpP9bX++Px7MEY/4C9sr/eU8f5+SOQIAFVb+G0hTiT1qIGxSYH1TbsPx3Z
	/P/uuccVcLLLiTkiKurKXh6KoLYa5ANmaModYHCdBmfEOiN6Fv9MZxs=
X-Received: by 2002:a05:620a:60db:b0:7d4:604c:31bd with SMTP id af79cd13be357-7d5df194ae3mr191327185a.56.1751631162908;
        Fri, 04 Jul 2025 05:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpeP/YKEt19gc7LbiS0KHIGJLej38efeNA64KgMlWMA9+emaUbgtub9jJTfI5i9o6+mbpHpA==
X-Received: by 2002:a05:620a:60db:b0:7d4:604c:31bd with SMTP id af79cd13be357-7d5df194ae3mr191324485a.56.1751631162466;
        Fri, 04 Jul 2025 05:12:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:41 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/4] ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
Date: Fri,  4 Jul 2025 13:12:18 +0100
Message-ID: <20250704121218.1225806-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867c53c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WmG1VI7HpiTX60UEcG8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfXyV2Vr8LS9S83
 hUN3XuAtYYCatSRy3OZxpJF8bydhXaLXejOEYaJ7TNOCKpGUhrjSWOEmqH/XNU53UU4oBDoT7Xa
 DhfUpYaS8yc5zkbXv1k9MjJOOhhJL8vDr/Nv3l1E1hx8g7+a/68kLebaNcmfo0bdc2tnSlKOz7Q
 s6hkcvOjGsImgie7J/SJ6KVmbNUh/eMQm2GPTOhuGOUtYjOaZCmTg3Xe6sjGqYTiP40xkgQnXvZ
 IetO9jIhqaOe1gv/S1fAqVSDaMwBt+DXo4dsVCBcnn0s/dQnlWr2IIl01eIobHBO3ctx5sMVDZJ
 IOA0fc3SjwA13KMhn3mxAJIb59xBA/ZdImr23/LSvM5PotyYrgQRJO9M8Jlr8ITKwCyFsbBY+iF
 dvE/o78CQ+EAQJbZvr5xRHYl1J/fUCT7MTzmd65XHj/K5lhlPtcsGSlB8871ZmlDOnNFA6E9
X-Proofpoint-GUID: U3_gnFWa_4lJkBOW9iicg6HCmdCxAYWG
X-Proofpoint-ORIG-GUID: U3_gnFWa_4lJkBOW9iicg6HCmdCxAYWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

use sdw_slave_get_current_bank() helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x-sdw.c | 10 ----------
 sound/soc/codecs/wcd938x.c     |  3 +--
 sound/soc/codecs/wcd938x.h     |  7 -------
 sound/soc/codecs/wcd939x-sdw.c |  7 -------
 sound/soc/codecs/wcd939x.c     |  2 +-
 sound/soc/codecs/wcd939x.h     |  7 -------
 6 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index a7514d716086..8bcd8396f375 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -82,16 +82,6 @@ static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
 	}
 };
 
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	int bank;
-
-	bank  = sdw_read(sdev, SDW_SCP_CTRL);
-
-	return ((bank & 0x40) ? 1 : 0);
-}
-EXPORT_SYMBOL_GPL(wcd938x_swr_get_current_bank);
-
 int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e2cb0758bca7..f8d7bf27a6ed 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1094,8 +1094,7 @@ static int wcd938x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = (wcd938x_swr_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev)) ? 0 : 1;
-	bank = bank ? 0 : 1;
+	bank = sdw_slave_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index dbafcae247f4..54ee56b7fbd6 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -669,9 +669,6 @@ int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev);
-
 #else
 
 static inline int wcd938x_sdw_free(struct wcd938x_sdw_priv *wcd,
@@ -696,9 +693,5 @@ static inline int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
 #endif /* CONFIG_SND_SOC_WCD938X_SDW */
 #endif /* __WCD938X_H__ */
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index e487a1bb0194..477d6cf27d32 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -128,13 +128,6 @@ static struct sdw_dpn_prop wcd939x_tx_dpn_prop[WCD939X_MAX_TX_SWR_PORTS] = {
 	}
 };
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
-			 sdw_read(sdev, SDW_SCP_CTRL));
-}
-EXPORT_SYMBOL_GPL(wcd939x_swr_get_current_bank);
-
 int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 5a56c79a8922..85730ae40c2c 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1017,7 +1017,7 @@ static int wcd939x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = wcd939x_swr_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
+	bank = sdw_slave_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 3f189e5cafd5..e70445b1a4bc 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -930,8 +930,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev);
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
@@ -957,11 +955,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
 {
 	return PTR_ERR(-EINVAL);
-- 
2.49.0


