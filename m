Return-Path: <linux-arm-msm+bounces-72429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB31EB47AE3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 13:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940F43B6492
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C07261B60;
	Sun,  7 Sep 2025 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvTDF2ZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B67261596
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244141; cv=none; b=KR/hKNJ019foRP4DHOVxkOCe0GID36BpmrsAdtG6RIeTKM3saCCyXJitugTmX6jtLyMjaSnia2Tq2yxudhUsS69/edML98uVtH2dNEqrs0qgsvdEC86IhdLZzILZ2DSPAWixn922JXWY+V7fD6autFy62Ko09Uooy0CKpyt0C5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244141; c=relaxed/simple;
	bh=3K5xmPHboti1L/ErBrejTcSDf/a3Rugqu21m6y+BMzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=borRpSkvKxixYIlh5GMOMoAS3xjO53jP0WbnkZCzIrSRBJker2NOJRXHpF/7qlq0k180RrEcadqt0hH105KrJHzQKb8u8W6XgiiYXbilvFEWMqxPs/QfPHqh3rs4VeUD2e398eNlC2qYeD8jm+w2LITcfjoJd8B48jqlphEubhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvTDF2ZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587AdWde014680
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 11:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lB0PeZTreDY
	Q4uFWa9S5tmFsvOqmEo73wcjiWz8cRXI=; b=KvTDF2ZJcLVrljw7rPebhZAiebp
	nzFJmMMvWd3dc5kxBQG8RL8it8O5t4PaqetQlc2kx5LrRs81Sn/CifmDHNQZK+IZ
	OfFTH+LkAlq5JOHp3eWF7yxGk92AUxIKebjSKu8v9OyiGuGZYPMK4SnXr/XunH89
	67zt0DUxm90G7/ICahQ+pBRTmjKBN4kwFCqauptzq9vA+ST+XOHHURCjMoE8Ww2x
	S72WoTHycHb761y6eiCPEqW7Ry+7GQX8Dt8bIifYn0/B4/vGSO1z7QvD4P4oOczy
	9ohSu8wEbjNYm4c8wUHjy2HAW/WLDa3nmcO1xLn/B8+TKJKnQygb8WsMwiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0j16v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:22:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b345aff439so100288681cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 04:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244138; x=1757848938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lB0PeZTreDYQ4uFWa9S5tmFsvOqmEo73wcjiWz8cRXI=;
        b=Wd9Ar4zstoowYLXQ6uYDVOqGMyK3RbJw7Iv6d2k6mZjT+BhO3fAWEDqW8l4BbPLHdV
         5QSpVvutJMmUkv5HZ5iG4hLedl4Z9N/vVsEI6DviWcc8LLQf07K+WTs6o+IyU68O2Me3
         jXlPvmwWjBKmqpZatTgb912AYoBdwFDAQX8AWr0mQCyXFw9moGat2rGyb4TJbFEQCeG8
         hn2ZadDr7619BoUqOThcn7P/UcSzDWLnLiDhfgBwVpQpzQza6MVGEJZ30+NsF8yleuoY
         wzGT9dRzPm08ZxNHuIPNTGVyZurT5MTP5AIallWPwdHnGuQ1waxnWdPLMpBCBAfCIOuZ
         8Rmw==
X-Forwarded-Encrypted: i=1; AJvYcCUdGKXNfltmOO47/6atGrYEo23JLx3wr+YUQNaP9fx+nkxYz9Ncq5mO6M276q1RQMh/u62UY77qyDNR5Xaq@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrk2xVrVe8X+ZraRJgL2EVCL+ko2dBXV0bfLA9yKc99fcd/Jm
	hnzhq5ozzSZ8H6gGfD5pdkJE7HOQ3hggb5Rr4mx9/mWwz29mapfTWiq0QrxhCN7/2uLWikVBqQa
	P3HuQOoipw+OGjVWER7Xqnx1eLCzbJYY/HkZVDyhB219L24gKjrV3/Kq2OH3RvjM2Oe9q
X-Gm-Gg: ASbGncv5wyJryFDx+798v47uq/KyrWrHIT6jw/IODRWZSfpxh48s2ZIGhgMwDXfgszI
	+FijyiCsYGECoLyxKTxmuYLO0jv9ZxoL836RlyUi6yzXDDW8NQfO4qigIDrKeZNFUDckOGpx1ag
	eC+ZPucf+pqPwZ8vl+6/uxe4NJPZgJO22jrCzgyGpWKr3ny//0xXA593DenbqHqqciPVWZhu6TQ
	nMx+tqbRtXrK3VupHSD2BniwzFe0zEtsbrdG5sINYEy6BsjsY85efD2pvhP4vwhssbgz3qO0Rbz
	0Y18E1Ub6AU4eHo5ZBxOUiLNsxdENwjSIJro0do4tKkertCpleN4Qw==
X-Received: by 2002:a05:6214:409:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-73921a43c71mr54310336d6.6.1757244137732;
        Sun, 07 Sep 2025 04:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5eBODkSZVURMQjCWR3pl6xanbPUigNJP388aG1AvYCAc5ryRdK1uW5UH1WPpUVEq9eQbSMA==
X-Received: by 2002:a05:6214:409:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-73921a43c71mr54310126d6.6.1757244137322;
        Sun, 07 Sep 2025 04:22:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 10/13] ASoC: codecs: wcd939x: get regmap directly
Date: Sun,  7 Sep 2025 12:21:57 +0100
Message-ID: <20250907112201.259405-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mNdm-YLoawrpU02NyU-tBw09mWD7E5kp
X-Proofpoint-GUID: mNdm-YLoawrpU02NyU-tBw09mWD7E5kp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9fjhv8ll2Yrv
 qGIPPN5FqWcBWv65BvTp/KKkm/4Odp/VVsCJzmuPlFrhjmr/VHeYec/3p+lLrSuLsY6iQXDBFfm
 BK9Km/XcBtrZJbOrEHqacXOm20bkppG7hUR1NQQUDyRjOTWwVXBXSnoWMcGrr17c/aQVaQWyGMr
 fl6j0Qgvt1a9vdXXEe6Pyey7CmTdMl1Xgf093xNpwOYzDDanbs0q07qC+HFYziE4E6PL9nqH9vh
 imzCaVN0HGnyJ4LW7h0fqz/QZjlUrd31PlXieKrebCCi5yknUhacjncn9bXo7f+8BvtORpTe4n1
 QV7gRMB8yMjTyAmqECEU7PpeF3cjK1EAE6yrdZcLeyvAVyuEEzKAoXK+SxC4dZ/YPN2pKGZ9Zdx
 Rz60/2hN
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bd6aea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jWMDT5uzmWzhJut3sAYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

for some reason we ended up with a boiler plate for dev_get_regmap in
wcd939x codec and started exporting a symbol for this. Remove this
redundant wrapper and direclty get regmap.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd939x-sdw.c | 9 ---------
 sound/soc/codecs/wcd939x.c     | 6 +++---
 sound/soc/codecs/wcd939x.h     | 6 ------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 6aecad2a28aa..38da706d80be 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -187,15 +187,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
 }
 EXPORT_SYMBOL_GPL(wcd939x_sdw_set_sdw_stream);
 
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
-{
-	if (wcd->regmap)
-		return wcd->regmap;
-
-	return ERR_PTR(-EINVAL);
-}
-EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);
-
 static int wcd9390_update_status(struct sdw_slave *slave,
 				 enum sdw_slave_status status)
 {
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index a414cd99b946..e74e6f013131 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3374,10 +3374,10 @@ static int wcd939x_bind(struct device *dev)
 	}
 
 	/* Get regmap from TX SoundWire device */
-	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
-	if (IS_ERR(wcd939x->regmap)) {
+	wcd939x->regmap = wcd939x->sdw_priv[AIF1_CAP]->regmap;
+	if (!wcd939x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
-		ret = PTR_ERR(wcd939x->regmap);
+		ret = -ENODEV;
 		goto err_remove_rx_link;
 	}
 
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index ca6353222ea0..6bd2366587a8 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -918,8 +918,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
 static inline int wcd939x_sdw_free(struct wcd939x_sdw_priv *wcd,
@@ -944,10 +942,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
-{
-	return PTR_ERR(-EINVAL);
-}
 #endif /* CONFIG_SND_SOC_WCD939X_SDW */
 
 #endif /* __WCD939X_H__ */
-- 
2.50.0


