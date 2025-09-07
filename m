Return-Path: <linux-arm-msm+bounces-72431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE1DB47AE8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 13:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44BAE189EB86
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA6A26A1BE;
	Sun,  7 Sep 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANQaIphG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C6261B98
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244143; cv=none; b=Tjm2nxqgpS1XxEQ62Tj3fFlntgtTkBq7w8C94H3klqUKJX2w74S8QYSl4YrvCb/w+Lws5Xii/vPocngwUEDCo5sQKq4M7/nk6eUEjB1zomPOe/DvSdBG2Mi3uXAEd8JcOoyZPgTazGXU+1O/I0FR6OewY1gLsjV7Q8fNQcZH6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244143; c=relaxed/simple;
	bh=SVUoWsmSq4cUO/z4U/2qlZs54P0s1u7ZOQr9dToLxZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnLxz/S4nXwvrkze4fkymv1XIz/gxheB18WQ1FCMjjbakRJjzG9QcuKXneEow1zJ+TPVmvYBVKbFUFcSpsggobLua0l4fTW2ZMObxRzMWz1wutZxuYrRHpA2dAKiUKp4tP4Ja4MuGeKwKjgWgx21tF7UZdD6jW72DVYzlrDugOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANQaIphG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879xAS5032648
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 11:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/aX4MrtepdT
	dnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=; b=ANQaIphGDLXlfwEXoBiWUWoKv37
	ivh+R26lHsvkef3lGemWHYeKtmQK96nnGgSOt7Q67ulXzxSlNy/yf7F9DKaWLBIV
	ZxDVl0bRj/GLo6c9vLIClidFpmiV1ACdN0ZzhnFhMfSS5J7q9odQHREMF+K4dV+7
	UKeF/S4s1Ckh8dLG3IZCECFziCeE4OPGRdXoQHqqLD46Dsvgk3Mvq0Rv614xrNb8
	WANJFt4mkZBDQJ8XyRiEUvLUcLnQSFC7Aa386DY76YoySHfExI2aa5DB1EyNvtbX
	oBOncpWa0YnoLYwdO7BlkJ51xDnXKAId23M8Pl0gtsUVR4KSY+bTeTP3cLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d639ye7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:22:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72e83eb8cafso47434536d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 04:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244140; x=1757848940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aX4MrtepdTdnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=;
        b=OzArWKe+ReCaIUunilQa0Yoiar9LDGPMsQoXQBRhtoDzrtnqLCWfFEGKBvgd/BPTXu
         VTgkxG6BY7AXnu/+t54J9kRezfe9hGdzM1qGqbF51zCzorGcLhNEsWAl5Q78m5ClRPg3
         zo82MPURTqEK9sqibQbKlh7mYenL6XAlhcguO2wz3R1CuwhSO+sksPAICPp6RwZIN0NP
         +0RdiIPr19t4U3DRIc3YcQnE2qCLP7LgvGAMS2uAHJYEky5e5K932y3GRVQjehAa1xcT
         dAYegFs6thzMwDPE4CHipKw6ReUpp0Onpj6eNjJXbIhkb8IEAB5GZd0YXjQ8T5bg1Sn7
         2oBw==
X-Forwarded-Encrypted: i=1; AJvYcCVTaYvGJFuvDmTGYS68YUz2Bffs6+PCfIezYdOT2x0h75tCjZL2TOFNP4BTUxv/sLUif85DwMcSTLVM7RcF@vger.kernel.org
X-Gm-Message-State: AOJu0YxILipDXOuf8SCkzzH2W7peBnQDvDtXzrc2Uo0lpZA+CpgtnZT8
	/mFsWubIY0rcbjvLCbDgSC63ulkeDluh5j5uyzMqY7eXyDHTzC4nOpOC+k1NpKha4TQlfyKdN/o
	KNblb4pPija5fr0ZUOKaLKn9i4A9lsUVdcPkw7huRcNxKcphtHJ+Q+CI1CFbmCchKPisf
X-Gm-Gg: ASbGncsqrERDCKotDyr2XwnpxqrEMmA9wQQKGmpGvP0NJYeMvrD3v02471p7Fi/ddAE
	eNgEGR73Ixba64QW1rK0MRNYKaPNG1/V7aJc8OISzs8tQLIeKC8Kyf8t2k9s9Mq8iNp8lGPSWQ+
	flOB9U4JjorCN0bR6b3clIy1qNAYQKpIIloQkRGb7qzPmvEJMgW1EgBaJFO2W+k1is8NUjiib+i
	AyutFy7eDfr2xCnmzexXsOuXHs+5f/f/8rx31ehIelUl7E0DG9lbrzM6sm0/HwgJ+KIEYadyxPZ
	qYsMml/wj2tYc6tTD+GyBLeav8wRU5f531GEpAZ0atBopbmT2+bO3g==
X-Received: by 2002:a05:6214:f66:b0:722:970:3af1 with SMTP id 6a1803df08f44-73924e25c64mr48223196d6.22.1757244140094;
        Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsw8nfk2wEUFy1R5sDtoXTxDWWeotu9Ny5Hm1V8/xZCSSNEEcWT8jL2YnaanIb9iQapti2Q==
X-Received: by 2002:a05:6214:f66:b0:722:970:3af1 with SMTP id 6a1803df08f44-73924e25c64mr48222936d6.22.1757244139637;
        Sun, 07 Sep 2025 04:22:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 12/13] ASoC: codecs: wcd938x: get regmap directly
Date: Sun,  7 Sep 2025 12:21:59 +0100
Message-ID: <20250907112201.259405-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX5L5O6+NZf4Bs
 y1qvnTsih6ZMFngjTvjNyGWqxJbQzwfs46WHiNQaS+8cyuYeaKzaEzl6ErPvXuFS/uBrczypLEI
 DeLQrlDkjcv59a96qr4GFDbhKH5kddZXkqee4wSaMKJjKHFWml13Z55zBcYKNUGcHo7A4JXmU4q
 pKG6XPAj2rJX2GGwwEPdTqKlha/AWUjn2OQUu5BHMw/5rZC4XWQvIPqFupXvYJeoZGTnG0owNho
 VIx5ymy11P4yywVPxqsMrNZ3xBJZUtNeKGMKF1rSX2tL6dywgXUZE6XFce+WJVaUwDCHUgIKYra
 MtW9XvRgc2Y+83ESgm1WrJVueu5Bxq9yEnPjkZZNiGLkTcr42B8OVnT70cSB6lSvWDWyBufZTwq
 P6zlNBzk
X-Proofpoint-GUID: L4b0OzyweXVq3D9icZZmA_RlJ4sSH1vD
X-Proofpoint-ORIG-GUID: L4b0OzyweXVq3D9icZZmA_RlJ4sSH1vD
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68bd6aed cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e495f98972f1..e1a4783b984c 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3389,7 +3389,7 @@ static int wcd938x_bind(struct device *dev)
 		goto err_remove_tx_link;
 	}
 
-	wcd938x->regmap = dev_get_regmap(&wcd938x->tx_sdw_dev->dev, NULL);
+	wcd938x->regmap = wcd938x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd938x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		ret = -EINVAL;
-- 
2.50.0


