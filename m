Return-Path: <linux-arm-msm+bounces-62843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7510AEBC73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86EF556217C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C90D2EAB6E;
	Fri, 27 Jun 2025 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of4iI84/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5992D2E9ED4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039504; cv=none; b=sELRxLoD2MXzZ0Uzwd0kARvaGwVrXCsL6BCaZgtD2OYLZN4YeNBG4u8+noo5D7tp6IuDJomHUGD/FK4FHtP20l1DMOxAo0kXtLQ+nA/wG8FK/voGUkl+0wgsvKyUn5RpM2vtBilNTp+sG76tBI4DERaA6Yyyle0ukTmH1Co0ydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039504; c=relaxed/simple;
	bh=VszKiwE03t1FNDyd3+/PG4rNfxJCf7hH5fFaj1c3B+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/uqi6BTIFmgOjLmrwYivt7fPRJXuQk43geUFLUH0zJCYSMJs2N3ei5C+3dUYyALrlcKYE7CC1ZKfncR4k7Z1lpSvqkhxjDVzgNpX9mEd74bHI9EMtdD/KnboKfzh4sGGMSDO5Yf0OqVGbCCi2FBSZDWRiOwpiDylGOYDJrDIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of4iI84/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBjQ6k028972
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mxfmtrvq+gi
	LYyamC8Jt+iTgA2yVNVmMcYpWvKggyC0=; b=Of4iI84/gzV90+ks43um52HnGk9
	ZFqFw4iI54qVqlQhGWmPZc7bWzwXek8tLS5hPpssQnPsRDikmKMqHNdiMPQejx1s
	+Wbbl0WnF2oHptagJffCAdehOzN2RhVsfFdRCZxFinLb9w5m7YDM5JjrMFB4FYpH
	ZQ1izbsATDD0mnqYZWsIQtFWH+OYfDNets+BBlRSuKgdIGL1yUJe/0hDx1gDzKCk
	8a5Szf6h/3wg8hyjRMAxcu9dQERn4tcDU2oOZDRcNeDt3c42bBqJCHwB99wTv1C9
	7zTN1RFJ9+qixDBsvdILW/4xLtWJhEqC7PfdW0m6V44+aETg6RNnmO7Cw3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa50nm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d4133a2081so320677485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039500; x=1751644300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mxfmtrvq+giLYyamC8Jt+iTgA2yVNVmMcYpWvKggyC0=;
        b=MnhW7mr39BAQ6Q5ZCCP9uOrnErUu5DbsvdficQcznQT9WgjEs7wXpbT8r5OLi8pa8w
         1zqh/8NOVIk7TOQ0UFZKK4ibooSbHhJCjkCzjHS9xUECYDTn5qD4QC2zNnvNdyw9Y29H
         Ovoj0/EsF33YPZ19PhNOIQVcwCPs76+j539sXdwu+f3Ky1xvZAk6PSUaUPEyIK5RNVDq
         vR/NltqgYO3AIjdh11AGaNnj+0xpMZxm4um6ZLFQdyyaRA334yWAB3dE+Bd6Pfv9oRdk
         1SdSB7rRr5e2DqZzta70bh5KXOMCHkiIqV/6RfmXwK0EboVDHcQ0/ht7D9gGBxFegI3a
         YeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpMu63k+5G+G6JFB7kGMXPCORmLsMZb8NfIgvRymWjU7SHMdpW6yQ2+xAn9V5f3ZbJq4H0Fo5c6SAS0DDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7nP2nY2HtjVIDJu9XAAlwUBMI4yWdou6pjc1jovrIGXwjY5F
	TMSNld+yXeLQt2uZWHx2LW/HeBdnA56Doe2pwRF9FVvLkCEBlLR5kxStR1iAsF04AD8MdFV0Cif
	oEwBkTufHS+b5uXILqQMpay0ZpcjSCGacNQERlUKGR2MVK1vQrosehsPF+NHCfbyVosfe
X-Gm-Gg: ASbGncsvKIw/dvYCchPTqDuFmx58qDzJuW8a+BGVNEOg4TWBYlTvP68OJtP8psCJkz2
	fMy4mJ8t7vSF6ULjTPgCzXv0HU3EmN0sx98vWYMCbEbuJJJDl45d+JENtmbSyppX2yUclHHqq8k
	/JZLUQl+VZsWz0vbxRGQBsYzBmN2sDUSQF9oK854oGZPQn+mYQ1BlnkgaOS3hkNSsjgNClgQZ6i
	1O/VHVQ1+dZ1H8pH3ZSyVw/tSFIN+lkSY5EM0KJFuEAsNeUCBDd1ix1g0QmrdptxNgcRRROO7dC
	3Gfs34pUKq8zi9ricLEX0bsF1wIwiJdzJSJD0vgyKcHmx8huYpgHK3M=
X-Received: by 2002:a05:620a:4547:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d44385e947mr497082085a.0.1751039500191;
        Fri, 27 Jun 2025 08:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+PxZlXtSSHqqv60AqWQfGMamHBF1e3cuJ6Z+/HPHmbzZbS06rUYAe0pTdNDgxbScKp+W+FQ==
X-Received: by 2002:a05:620a:4547:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d44385e947mr497078485a.0.1751039499757;
        Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
Date: Fri, 27 Jun 2025 16:51:03 +0100
Message-ID: <20250627155103.441547-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ebe0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WmG1VI7HpiTX60UEcG8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tD0Fy_Ve8iCKC3Jy4ds9n6GwMkkjHTM0
X-Proofpoint-ORIG-GUID: tD0Fy_Ve8iCKC3Jy4ds9n6GwMkkjHTM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX7dJ0j+Dr1jmH
 2OlKbT2PzHXH8ehMOkWgT42tFd/hU93XDXiNIBb/ClyJYaMSYi3Q/nZRFvU82Oe3bqxqhQz8XT3
 ZoXtmwV7yecR5gONUlGW+oJq77Ch2Ok8c5mfZbmZtYB+c0nmgmQWBhFddFaEEUBtD4ZWCBbJIbw
 0cLBxqDT9g8Hea0sgrGhK6sG56IA6fucGKYied4cEZl6t+ofabXXNYOo/dPggr9QZGSPIIAZ22h
 LE2a7JDSKhR0Un0tZLgVj6HvPkoxRoefFFjPhWuqpmaxH4TkNicSqlc9Eeh/5O6QY8JW83E6EPZ
 D6pzoJHAcRx1V/d8wMoVhQDqBe8vD1AqCyuuFOqP78rrYcKUcyjZNSozh3tV+UfkQSQDM1nsM5t
 JcS9ZMzvXyRxrycMgyoZ7aSmnn7ieRcfxYVSv0mKv/l7XAYGHH2EJF3RRQ3aNbpTFFfd1Uk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270129

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
index b4a0b66b34df..9e411d906354 100644
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
index 7c345217298d..7e1e99b22cb8 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1097,8 +1097,7 @@ static int wcd938x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
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
index 0727af4789cb..f59bda0ad089 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1014,7 +1014,7 @@ static int wcd939x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
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


