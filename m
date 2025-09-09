Return-Path: <linux-arm-msm+bounces-72766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A205B4FAAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16A161C26E8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6FA33A032;
	Tue,  9 Sep 2025 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5DXRPLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B78A1428E7
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420436; cv=none; b=QSCf3EU4wZ16Me5j0VNrYB4CFuJPVjxlrnNR2A4p/uBgkDDsuD8YCbwggtDMvq4ZLivBlkzDn0y7/7BVWQ2SzpO9clPpXrAfDJNwZozC/xVpn9bQ/yrMKbseRknwbSmJacNJzmrzlS53vOHsae8oUjrPQbh1B8MqtWzbLhHkBjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420436; c=relaxed/simple;
	bh=HmXyaDzSyYWKVyfOvvK8VoaY3HzpzmVHwTfs57fRK7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGk+1pr4M2WmNHG8Y3NK3qOepUcsps+Psr68TJ1FZRRqM2CSZEQJVL01RxeFC1x6F9fIg9GcosWrxxMTs9Bu7aRJZOigXuvulibGlA5BZNZtK9e7aeLgeV84qF9mFfTSX/nCzjkYzhFwUw+p2nNkyxHh4wE3H9sTIvdkRQ6u/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5DXRPLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRfq020418
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oOmSsAnlxpq
	Orq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=; b=L5DXRPLR3OjN03nOD4GLtIgaS39
	nT4AGl02owqfL3J/mWro2xbldiKRy3NSTUyfZgLpEIpmua/k83vVaUpeBG+ooH2o
	AO7l4+EdesubTiRFpws8aumc89Ke/0M7oM/CYYQPFWIk3revcqzNtq20VvJX8KFX
	YeIBpTmiYEtLOOGAiER4Bobx+LGgyAxc9G7hP9nZ5fpVP+55QQmAUOnmVj5rw4Ot
	bSCnOdNkObennWUhMB3nORsSYfXFgSHh4uQnlLyxqfWqLVlQUOXiIPF5fDSQMyyf
	CaRwnrRKUEf3M08r2/TC2tF2/yQrF5Ki5bvKOP6QtcCSszxUyxN9NHzwBOQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a82sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7211f13bc24so116799646d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420433; x=1758025233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmSsAnlxpqOrq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=;
        b=VtBgsQ0oFYv1abjKzUm0BK/E7TeysI8YbKYAwYvCIyuB6Ogqep+h0wk0iMo01WoF53
         HcUOi95As3zUN+5doUq+Zp9fN60I4VAcLnwGJyBApyNifRlGQXzPQpEX+/RECWHkj5lg
         iYVnLZ4QUE46dHQIeEvxGlgVK4KktKmzKDQ8F89KsqCzdOSS7RH4hk8Z2HGHtqYx7Dym
         +fa16DyyeIlFwMejtuN9g0nT9aDLcRRDZx1LD1hejuEaWkhHwhfAtNKwk8C2GhqUhwql
         QEkL7iSqBKLQR5A9rCVUWOupFjNAXv85kFDk4Yi7J1SHxGIAWDbHY1brXDKJt6DCwKrW
         nQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdblAMVa9jT1woTJ5rtgf+Je8Y9wJo/zahMZgdmJvPO7jsNW7eHiv545K1xyUaccvFzlVSaAvlgTTa53aZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYoegxIPPJdKUsObg6EtvfLcdx6vcF0ndSndTgyqTHRroySe6
	6L+bOMiFiZxjxU7CE/Gv8gzk8xBfuZTELXm5U6yIriu2ym77xalD2oIt6S3MKlgZ+5jZ1Uk5VVR
	E9AxKpzfCBqAl2bEm8BUgpmh12k+hBA0PBqBhR4QdEsMX/XgRjYQYR6uCB9aYwj9sfGHl
X-Gm-Gg: ASbGnct8d/IJ10LzPsr8xPDO0GFW7stCgwxwAMc2R6D/2PbeRnX4RpYEhvmhhMXOvHc
	P1f88qKm9w1IOPEP4OuFEKSmC8bgrhL/+q4/tzNrt/VO4o235P0sfkbcwQdrZ6jshftB/idqAx4
	8bnTO9RbucnSVgCMRjodiGyCiVTKCB/YbdECfGX5+zF86k3BtH8c9KYNjzcIYFSZE0IcqxFSfkM
	/Ng+6GWkXDojBx1febTNn1YRd0PYASeNmtF7iOAcT3csAofdm+GaJq75LAJfy1AxJhzGeQVF7J1
	w5ivRJKAmDg5D2ddnpOxewv1YTK4nHv28u02Q4PIPzw/UETyPOyLkQ==
X-Received: by 2002:ad4:5cec:0:b0:728:7749:26e4 with SMTP id 6a1803df08f44-7394276ffa4mr117056716d6.57.1757420433252;
        Tue, 09 Sep 2025 05:20:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGXF+ftxU8ZDSlhD2HodezUk/i4BybgQlaMQPM/WXTVJmY4zEZIOZUrPopisD1hK+pGViISw==
X-Received: by 2002:ad4:5cec:0:b0:728:7749:26e4 with SMTP id 6a1803df08f44-7394276ffa4mr117056186d6.57.1757420432633;
        Tue, 09 Sep 2025 05:20:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 13/13] ASoC: codecs: wcd937x: get regmap directly
Date: Tue,  9 Sep 2025 13:19:54 +0100
Message-ID: <20250909121954.225833-14-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c01b92 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: shrfXnkfMAld4wPg1CFYWf6eMWwONYdO
X-Proofpoint-ORIG-GUID: shrfXnkfMAld4wPg1CFYWf6eMWwONYdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX3He7Md3GBmGB
 ofBkoNFdiUfOUsrh3z8YH1bkeqxA/GXn2i5cJmWomy6i1t7ECDW7Ue0M/mEXMjQ4pDbyjnn+d36
 IMcMclg3EFOGRN0gkIJNrPhpjmlx/SpnmeeWVjvzJMLCb1LSGQm78YzAANClLyq4ycIwMyOTLqT
 yg9+KX7U0peaqLBqTdvqUSRZLX0zQmTZpAxw3qb4f7Ut9MjAXxNcOjhTAibY1DrD5hBEoG4lGB1
 hsnODT5ITph9/GuBKbTwcgqH3OsWUod0/Ds85NK9VgxAotoCLC4InFuthw/EcFPR8Rt5I1Dme0c
 PiEeOGvr/HUPD4JiKE2CBKPsN1S1N0qpD4QmEAIrdQASFMEG3NAag+abDzHPV0x8gyRqUZn2hSD
 XRxHsNZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

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


