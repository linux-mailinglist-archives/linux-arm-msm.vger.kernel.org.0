Return-Path: <linux-arm-msm+bounces-72432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3AB47AE9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 13:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291CF3B7F1E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ADD260588;
	Sun,  7 Sep 2025 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiWZKGoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE42698A2
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244144; cv=none; b=oCL+AEuq3tCKPS1w7qCM0+6q1WdaT3OdXOdivSwyT5bwolsPBYzTrQaeEMiq/YbXORnL+G8VuEYbJQX0RLz8K/bQMVsPeVCYOdtDtchjH+hXOYydcj0sH7B+TsZLN7M7ixYAENum0bmsRzv1aAy+zQA9n1rR6Cnk9iQQX/PjbCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244144; c=relaxed/simple;
	bh=HmXyaDzSyYWKVyfOvvK8VoaY3HzpzmVHwTfs57fRK7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KB+P3dBeWsDs5R54nXziW6Zmj6Dy5sn83pOnthIjSTMzHBmNJPZ/+RX8r90fyu5ewWqF5tsYnrl4UPczpEJ55IhsbhmXcvH9yEHJ0dWac/ic2XPwHP6yDHKOJ6bpxH0mfb8lUlxjwvKBqA8i2TJb9NFNiBOERu99FACtqujQEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiWZKGoZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879WBQ3027661
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 11:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oOmSsAnlxpq
	Orq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=; b=ZiWZKGoZV1M9lcxhq7xwPmnzXWm
	K5E6Y6nzy2QXnZqcL1ems66aetcXk7Xnyl9BJWoJkMkU6U4ug4IZI2i5rBkj4KaV
	GTvytP9+/+shMep1OVjIVoky85AUdTWiDVteag0/+WS9FAU+RmfYl8nf9jBzvMkg
	htpTuJlaYYzw1ohugwKb3yH1ponqHyFkUC5gxO/DSQtFv/H88e59PlE2cnrE2JdU
	Cd7Ky8ax8VHhasmzo3AWCsUzxY5BwGCMinnfjhsS96xhsrKUqDZlHgSBWoLf1H1m
	yOEY1a/nzOwOPAJ1wL1cAikrpdSt9/cGetER+KPK+6r4FRdBPzeYKoDMwyQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1va0wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:22:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-728f554de59so102379676d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 04:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244141; x=1757848941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmSsAnlxpqOrq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=;
        b=sbX907Q96aRadLkmQR2jvWBdS+wE2PbN8BB7pDtgSb8X54+uRRFsyt+KtUUBwH6MCo
         VBkSdvNBRfdG2YEcprAh8mnwBXNBuwGKgWGkOo/Cm7Zp/0YQU+5TOOofVNNXfGROSw3X
         /yfJXSWIVdzCIp/3CKobpIdEDavzJS1mJwhYRvptsO7vScdBiVKstiKstPz8mQhwkblx
         GZ1AqG05V6XLRiJcDb75BWOJ27Yb86NY52YmG09Zt1SHzvt2pabLIW2g/WG1E1XdCkwt
         adGi+gEv0vB6QFn/BuXA673nLcNFztT18wKoh21RNMBqdwIH+2ejy5o706N/6DlTNYiU
         94aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSruF55o+nmy0dj2rxi3Q7LfAu6nZpRb0uGQvn3HzvgWS/Gn0X/Sq3ENOc363eFscNVX+iBHoIxvygabsg@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLRtkS4+nUsb/p43ruX/ka4oM6FvbFJrXLszeGgXlBzHXz0UH
	9EqEDnpkOU6O9uZSbr0sw26V5VH+VyLMLFN7F1yG8V8RNXahsMA8JPxijlp0RtprYMAtdZvLizx
	oJp/2TNcERQRpmmwMzHB09V9HxAyiusEjXfGklCzU29KFz8btD8NK7CBc7a/r5AHMIQV9
X-Gm-Gg: ASbGncsGcacIw/ry8iNXcVG8hVXLpUr7kHD7KcqUOOmkUIYoTVfJIXqvnb0N1gkGZWY
	iNrCQtp8Gugld0Ud/1q2LS0U108ouDyAlf4B5ALPF3Q7sCXnD5l+FzbgoUH0lUml/cthJtie6WN
	OLyMtBQf5j0nTm/BlVEOe/JyENgv3TLCPzYds3T00F8vaXxqAMNQ0DXUEtJvdnl+n1s6V7O6YMC
	rdy7NVKXVou7IXDkJiC+mVDBE4bZ8uxL4Vet5HS1Nqid4p9GI5lGMSyDfMJZ9eG0UYwiVHAsR26
	fXkMbPiPIkD1QxLAIHaYXpM6UOvrAlfPizxZgblH3XqLi3Ox3x0qYQ==
X-Received: by 2002:ad4:5ba8:0:b0:70d:ff7a:34de with SMTP id 6a1803df08f44-7393ca9adbdmr60235026d6.33.1757244141309;
        Sun, 07 Sep 2025 04:22:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbwMJmgf1oVOVVeL0AGbEaug+ceP0L8sBb/2UOe/KEvnQmT3R8vUXM1gRsJI54zSTpmJ5N3A==
X-Received: by 2002:ad4:5ba8:0:b0:70d:ff7a:34de with SMTP id 6a1803df08f44-7393ca9adbdmr60234756d6.33.1757244140888;
        Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 13/13] ASoC: codecs: wcd937x: get regmap directly
Date: Sun,  7 Sep 2025 12:22:00 +0100
Message-ID: <20250907112201.259405-14-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tyaD8N3PeM91g7W6VgignXwc4HUcDtc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX9gWIL3ZQYjHL
 06fHw7yp+pHHJEIqu9Xr+G3gg0LHGFxoXJ99H598SYed3HYcTeZgf9OGCCQovceTN9B5xpjCb8y
 wd3pf405iwB3jY/cMudQZsoVcnR1PIP9YOn2w8uNqXs/e7SQWW+vSAKke3F/4nUaWU+ih0Cvlwg
 4t18lv4UYWd7j36dsyOQwb1shDu7ppEj1eqle65avZRj3yBnpx27J9E8/l3h2pQ6Y/R6sNUXEje
 M3vM/YJudpTpnOcDB+SH035ymuwii4RCTVekc0Hr7dG+plqUP6LywhYJYP4SgRFgVaEzk51Ffqi
 jlGl65jPvaXyZZEhnkOYUTvUr8He+qxjTio3SInK1+nKM2MEtOmV+RabkjdT7IRdxsJka6pD8S8
 Gebath1F
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68bd6aee cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tyaD8N3PeM91g7W6VgignXwc4HUcDtc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 4c040e3862f4..421ec7a2d6bd 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2790,7 +2790,7 @@ static int wcd937x_bind(struct device *dev)
 		return -EINVAL;
 	}
 
-	wcd937x->regmap = dev_get_regmap(&wcd937x->tx_sdw_dev->dev, NULL);
+	wcd937x->regmap = wcd937x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd937x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		return -EINVAL;
-- 
2.50.0


