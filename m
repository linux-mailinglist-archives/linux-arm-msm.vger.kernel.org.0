Return-Path: <linux-arm-msm+bounces-72755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB8B4FA91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34AA41C26E27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D553375DB;
	Tue,  9 Sep 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NM/0uNpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776633314AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420424; cv=none; b=BXtnJzyGTTTieVFBO+Ox+iuZWTDfKj9DD7DdSLgesZ0cCU2yltHrQamfeSDe24/UfEdTDVE9TJJJDUILN+UExMWA7u+joQZtez+Ss89v0znq+1cnb6q3j6kof15IAfPHe+WLjQqB7boiMHnJr+Syf5dP83kVGi2hY4Ltz913NdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420424; c=relaxed/simple;
	bh=Y67OeXOkwjcW/WgRDCaa4+GVWkV3DnYW2b1CZ9RDeD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5zKvmyT3BZ8DyTkLAN8d5QkOm9iGr3LatbZpDgyr/YEf+MIWm5T6Jvh4l6D/VE8swP2re4NWNTytsB+CPqTBITx+lBvDYHwwt9R7t7MY8ZkMEMkoALYCjjpyJ0FbVtMzB3r43kcdgLB7KGp9S8Nid4s2tpUlGbkgCNrBOqCr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NM/0uNpC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LUVY020161
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jw6p4thKtOG
	Ii/duK9Bwui939to4NPczh9FQMtKLRgs=; b=NM/0uNpC3/AvOA/+o2UUeWz9DE3
	qGNRxtIu5eVS51f7SXII0au7YsKGpQDZ12aHkEzr4JUKQMHUDnFpdp4y2Efu5FGF
	SBGgX7D+sI5NdtbfJ3ZkZCMXfNmnTp4ocjBo29oYZ7YeaOHWj2K+HRhTweakkcO5
	b18o9w1IYhg7o88sp/F5Fw8ZNVQNVoZPumop4RQEMYPU3GDyaR3BfjtUF3u0UVG7
	+yrFiUte/kcX/BZtCP468JO49X14N4IPyK0uYhIg4QyD5hP6Xuj7ll5nWJwep5bk
	/7mR3Q3fTkXv/tz6RY/5KL1eFK94w9JTLqNSTJCqrKkbr0WzMwq3Xdy1TQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc246ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so104790461cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420420; x=1758025220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw6p4thKtOGIi/duK9Bwui939to4NPczh9FQMtKLRgs=;
        b=pEDQ0ZkUE6osgF6CG6YUli5XUC3oKZtyZnwLrI8hc6YRrZ8rr7bo5UZcwsg0C5Wypx
         AphI/NZSrCzeDNtcS7OA4uVwJA4Oxjh8X8n5QIskI101MVlTgF7ghWSI/jIkbDXamVYN
         Au4cT/s+crMZwZrMFHPuFTWOZU8zeAIRxVS5goCPtTrm8XOOQg/ICKs1m4C50/SI/W7o
         koPRqLA+DyzUiYHycK8fvKq0f5iVUtmKjs31/7szoLBcP9qINb7+/Uw5F5PbOZMllRxN
         7FHZcZsSn5CC9zCbWF9C2CgoXYgWxnqCxfT6OJEmIrHFC2J7yln/0i4nWIRCLSqkmw58
         69aw==
X-Forwarded-Encrypted: i=1; AJvYcCVCJkihufl6HUSfVvasvmjGlSmX4YQmzYykpZftDdTCUPrJemI4Oi3L0rOiicGcBznbGpygj2462NTx5anN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4bcSGMm7snVGmQxZwVowyWVTSRDvMPJca8WJ8OjZTCxizrqcr
	O7lJ2rUCEPHUbusaNENOpBUgQQE6U2Iu4M1vt8gopniS9gs5J47qz1zb1oQR2FMhTgF4pSbstMw
	XYe/bwg/LhARUU6FYqWYXoAwU00KlPz0W67SfWsyv7lFPgck27Ia4968zdbyLC9Uqn/Al
X-Gm-Gg: ASbGncvyAkdot2ngP0haFjg7tslDHAyumSbUsyMvNOrri3u/ckkaNzabvy1k0G1bHAr
	B4PvCiX0JSQwMlfyFM2jwOdVJIhPJo5zcggpdrpdS9hgCZheVuAgupZWW7ic55ILbQxilu1Y6oU
	7v3vuh4uiiI/yzeNElfyaOiLzJaNVkLaKsyvbX4fNQqqZ2Xl/+iTQ6H8VbFI9ioQ/5qy3/duu7v
	LCOcMf8INK942OezCrCPLJQLH2MJRRgCTDU5jhF7KktRUpmW14tKDdXZ/oGNf/RXcWO/ZEOHOMj
	N1K9Vm4wzH497Tdj7d7TuQbn/wW7umSiTkkhjUooHvBrIA5ZgElhxQ==
X-Received: by 2002:a05:622a:18a1:b0:4b2:fb0b:1122 with SMTP id d75a77b69052e-4b5f84bb472mr113320391cf.79.1757420419866;
        Tue, 09 Sep 2025 05:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIyTDywxBfjStYv8GV4OQGPpf5h39STdyrIcnbnoLBGmrnUb4Pm8UjcwFoNGfdUV9syMdXzw==
X-Received: by 2002:a05:622a:18a1:b0:4b2:fb0b:1122 with SMTP id d75a77b69052e-4b5f84bb472mr113317241cf.79.1757420419064;
        Tue, 09 Sep 2025 05:20:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v5 02/13] ASoC: codecs: wcd937x: make stub functions inline
Date: Tue,  9 Sep 2025 13:19:43 +0100
Message-ID: <20250909121954.225833-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c01b85 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SV47_qJM1wkz75m2VG8A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: D3LkSdKVpiH2GXXZS-79OQvcvaaGHOFt
X-Proofpoint-GUID: D3LkSdKVpiH2GXXZS-79OQvcvaaGHOFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX4Se7lpEhKYsP
 2f63YfLZ9pl9r0smiOCl0seIItYh6hn1nZK42/WYt7AEDjboA8XAxoQ0LZeTCK4aluSPQa5vIRo
 k4kwhuVwTycqfQhHkuH4IMmbN+LQVM1y+7WAtcI+wcpdxEMba0PvdJxVup1sbmRmfOJL3e+eIeq
 rGoQk3ak372Olh2lR1CK8bLkQd+mrHKoNpSukVzExZ2Wvuf9lcJnKw1+09hFtJFRXApTR9JSaiJ
 dJdJubGF84KdJDHYljhJgb1A22YEzG+l6o+noxhBxDPIr4B0uoxPKA1y3UASGmLHM7GmbmX551K
 Ns1mj1fv7kn5KXXT9dXNxvydww/jYxc9LhWMu/dKGH+jH7eewGJ8SVwdpcN7uDY2dIPG56u43b+
 z+DAZko2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

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


