Return-Path: <linux-arm-msm+bounces-72422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7794BB47AD5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 13:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4582D189EB2F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0662620C3;
	Sun,  7 Sep 2025 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He5UVYVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9218FDAB
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244132; cv=none; b=C0uuH2xN7ShACP+/VkRk3DEAymOYZb8iw3962nIhHt53ow4oSBAgnYGMgf3c31s4cgvQEsh9qkKpI3QlDCn/aPv6lrOYN3jLKBRyV0E5pokmth1L/dbwTT9Ii33vIy7UTI2MQ4AkN2cN+Xvd1d+J4VctEPvzkS3l4jkEmua4Qjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244132; c=relaxed/simple;
	bh=Y67OeXOkwjcW/WgRDCaa4+GVWkV3DnYW2b1CZ9RDeD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sT2PY9zXawCXKeP4qulh14/qHtX7rlIhptbhcJ6OvBL+3vUNMhFQYXoCRIJrU/YKAU+lxVpewQPsOQLI6NVVKW/E8cV4m5EhY2lv1tj2z1yaGhjXl4xKwy9jlSa5v98Q4FIiLDrIkkk6jt+MIN4QQgkF83iMoMEP3VCR2djwWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He5UVYVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jNLI020675
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 11:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jw6p4thKtOG
	Ii/duK9Bwui939to4NPczh9FQMtKLRgs=; b=He5UVYVgzFSPSHyrXkl6dcmoMAq
	yi/iz8se6Vdqr3NKuNZmha2s2KUP3ql+FTZB2nAzdJePQJSPLH3XU/oYEeUb6Pab
	z1PW52eNrSWujywPLV4uDAK2EYtwlrbbcuvKgNVl+8E33cjoUI2a5tXwZvN/bdPG
	WCrGQebyzeLCHQw1F1hFIzVqOZo/Xo4t3xefMMIw4Wwt+mRpcP/jxFcp9J/drTTs
	uJ24rvR4pV/Wyz6yKFnXpJkb+VtYD67Az+tCioDhzqNx/RkxDCY6mUdbxjGl0XzG
	rr0A0SlheOFGe0zMi4LWnsmKC9Tp4cxKF4ds+gFVQA2RdcVu925xuqWD/qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8t3ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:22:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b31ba1392fso111799571cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 04:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244128; x=1757848928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw6p4thKtOGIi/duK9Bwui939to4NPczh9FQMtKLRgs=;
        b=r/e2BdPARr+n0yDWq3YcwHaSu2l+gsF+atZTvTjBOPhMOOYhP+5XgIWyDbvc0KDvw4
         MDdSd/XII/nQb36LeunV5fTWXURk4+JqL49q9P25pcSJ0S6S199fuVU9tug5K6lWndie
         /Oe3p714cOItZnCNqy0NS6tvY74SAheSrLrI4Wc6JAWN3E80Pdc1QqZKb8+sa0DFUnZl
         wq3Ru42J6lkx68givUvJ0ro3hsCd+u0y588urOxSvciprK3qySwrdlYXSL78TLtvhdtb
         a1zoDA8ld+XlYBt0jBqhvURxyjuezeZR6t/VVT3kesseoOlGogRWMLqDs6P7CAqWZQ4R
         13fw==
X-Forwarded-Encrypted: i=1; AJvYcCWAPITPU42wuQQVye9Ov5HkoNl/Bdzwvfw0Z0U9pRBt0ErNqiXVwzlYMXk3Jb0gliGhLcObgLE5f2J8DMF7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YM+f0tXGiYrEbrCe0J8mDqYr6CLQyeBhHkm467ooVWs9tWVM
	ObaY6kChamL9XZUMEcBM+DlcW9vaIo/oO08TM0yvmkXtmgU5EabaZ0BeLBOHw33T1qwqgK4EzJM
	IHm4Cox2H8WC98LmT6MNg3zk6XDvXhc2MlnxAeORR19MxDEyMMe18F2O3VKPD+jFOohRK
X-Gm-Gg: ASbGncvd8IMVjtFcbfmGgdrEy7eFtYoTo4MWWfgIXhQuEQ+AzIHqt+YfpESsPbHvdKF
	+fh59BYaOgT7/U/o5s/Pf1YvAdxuVWZCbBwERTefw55LZQ7MYncdIMjw6ApZh1QGM4FDuWh54vx
	VS5HflQL3pIVA7ojKpLGTRrwp1boK7IdrCSN7zbTGMbbhUl/tmNBOoo4O89e2tNCfPQPbhrwrZD
	uH6XafnfPddZbPliGM/IIvnBxtTyQrRtXHfuLS5etyDHouuqdX0wRDPvcxhCITe/IlALXgtYrdv
	f2Afn2efy+icALvKTOyrUY2nyRq7FL+uGmLRE2WzOvVkB8sevUZAEQ==
X-Received: by 2002:a05:6214:130d:b0:71f:85bf:6386 with SMTP id 6a1803df08f44-739453b8593mr51717186d6.59.1757244127737;
        Sun, 07 Sep 2025 04:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUK7tyWynSX9vOFGSp5aznUiforb8jjvNd8bvncFpn2AcSchHoh7Woa5kC+0D8QEz8w1rZxA==
X-Received: by 2002:a05:6214:130d:b0:71f:85bf:6386 with SMTP id 6a1803df08f44-739453b8593mr51716966d6.59.1757244127332;
        Sun, 07 Sep 2025 04:22:07 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v4 02/13] ASoC: codecs: wcd937x: make stub functions inline
Date: Sun,  7 Sep 2025 12:21:49 +0100
Message-ID: <20250907112201.259405-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bd6ae0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SV47_qJM1wkz75m2VG8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 03NhsuF5RQzVKZe2CKGe98eSw1BpU_cP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8TrYFqYCgXaL
 /F4ijx6shrEkR8IrACXFUbNUlgFem85Hyuh7ZcaAZBZeNATLdxoGwknuC/aTPly0FhUpz5Ig3bb
 HM/yNa3Ghw5ZkN0+Fu5qxqE50h1pqB6Yg6FLdzsmrVhDWhF9Xbi2lUI56JaPXMK3W2kIjNYgx8k
 dp6GHuL3wtPcBUHqHonhR+8PzyJ679oo3zFTFJDNxy0FSCP20hdPFJL102BJD4Xp3ESDKO6X27l
 Yg3n15qHnKxtmdiRrvXPhEFoSPmz8xWIRLn20QYuNxp+32av81jLZ8jg8hebyhlSqBPuSyIGHdH
 CSk+zrdgR9mqinzEbSCweD6U5mZBqoL9tJDgSP/U7jZPnRRUdWoHBTPXjvpbhoYUzDtfpLEY+AZ
 UHI7LImZ
X-Proofpoint-ORIG-GUID: 03NhsuF5RQzVKZe2CKGe98eSw1BpU_cP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

For some reason we ended up with stub functions that are not inline,
this can result in build error if its included multiple places, as we will
be redefining the same function

Fixes: c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 3ab21bb5846e..d20886a2803a 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -552,21 +552,21 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 struct device *wcd937x_sdw_device_get(struct device_node *np);
 
 #else
-int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
 			       struct snd_soc_dai *dai,
 			       void *stream, int direction)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai)
-- 
2.50.0


