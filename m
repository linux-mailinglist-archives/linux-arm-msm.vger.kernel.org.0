Return-Path: <linux-arm-msm+bounces-65239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C9B075BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7ED188A0A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F642F5332;
	Wed, 16 Jul 2025 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBCud2yJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9F2F5316
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669218; cv=none; b=FmueDARvt4m0NbI/v5dw1GjTljLS+S3FGlmiLtMZJrMIIAerx3QI6sZwPgM+Lh5ryEXLuTwDwLJFgI4R/fadYxDXXqIDBZWlAuUtwUb52eDgDPNWCL+oQvnAoX2siHRyBcyUxdGz3S0r3Wmb0JkkCZH5gDUk0jaYLmkySMfZOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669218; c=relaxed/simple;
	bh=yibIyJ86F2/IfQa5SjS5WXhbpmt6CUibLHc0JVss7P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEX1B+2ilMnni44LHblPGvJr5L1r9CRe7Hx8run+K6hnJARiGraG7LIzG9ZgCuvR6T7yyRhTbiGHznW6F1ZFFfFEAtTCJQIVKpIdpOrVKj6IuvAXjDkW1j27AwitrIhoDyt6MJS1bmbE43AweARGQ82jDigqdjFff3xJgYiKXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBCud2yJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5khI4008226
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jlH8rAJGwAT
	ewu+6bBhjIOTX5MRWqExEs1wQ0VHGYQg=; b=LBCud2yJs6PttBRPX/0Z/vKFZmh
	pIPsaxpF4ZeDmtn8Nuc1Ith5r92KW4n55TnXrSV3R2Ed+OxOydupPuNz8blfYdGi
	BXqFxYNC/epuhRq8nvBqfNRQWfOBB00th5fagKj7DRn/paeK1yJj9s6Kov56MgYr
	zRZLE7Ktb9Irrk/fy4EwGBp5pSHcDcnWH7GWmRougNOnNAXhFLw7+95xqIbD6xQ7
	vLi6LwmhLaA6HOpTchCNBmokFDCAWkHZmab1ROWhX65Ft969VUCult9veAD1UvX1
	w5gUwX28TV97mVJXToCH6t+4jTmAToCcbqYcrEyfvtv4rKu+8UzANHbKAeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5v2ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:33:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e33af599bcso294378585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669215; x=1753274015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlH8rAJGwATewu+6bBhjIOTX5MRWqExEs1wQ0VHGYQg=;
        b=wgVfwG3HZAez5U0F0CKZA1wiT2URpeXsgYHK+rWIo+zZRAaa95PbDmaJa3iOtQ+ODu
         qykCbldgXzNUNUa2NkzIWddVG3F9+6ojuF/mqKKeKR4lhiYjBUypZVtx0G9Gs3qPlj1P
         nCvmtNwWSPu/m3rrFJucxEdbA7fuUL+IhvT68r9Npqumptmu5F5VC9tZ5V5QYc1Blyd7
         ZL2mEh7fgvtkzTzj2BwqdniXx32CQ5FQMM6U2ElUKC+M4UUrZkIEcPR0Da9Vjtrq9Zq7
         lIxz5UJDmda6t3vD6aoHx9TYnAg6Kp93VJywUL3QWKy9zGXvcOuCRGQUltjtLzNfSXt/
         /rRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVeTy+YjmHoGrMFMJ4PVqLIot8C72fAFVg1+psY+KuH13B3YO9OItFTyAAd9essNGsAwx1zH0pGVZ8aXQk@vger.kernel.org
X-Gm-Message-State: AOJu0YwyjlvsWCtl9AIPAntiuZKdXJuQmsXyJh+Go8w47ctBXpP601Vs
	Z4tzU9YrRw2PbebdDMoFIb2q068T9YIT9lRHz/3sNNm7Aleg3z6hOADCiBk08++SIYivETKyhWi
	4q5/tfAk/T6ZNBFep6bIs7mSceIN0qQGx5fXlGULa3ANTOOmW7msHV8pf4Unr9G9ONeyN
X-Gm-Gg: ASbGncsryHqlnuj2iAoqfyLLcedExsl89WOwbSvoDn5oP+uNtJws4u27vQ7V7shCOLi
	0Dfw7+E3SdN3ac7w7F9m/rxMIj6IEwsmsz6XI5RlrFJ/vZTTIk5I5un8/rSBhA+iVDam41bX9D9
	HfbSZsmSwNumRAhiY/x00CUFW5QbLnFmRl21NWVsZj1X2R40qgXMqMzMtL9csViZVnPrRRRW4Uf
	ZKlN1PIGSA1uCAihW/1h+Oh64dBiBNuO42zTFSSnaSwnfSZI47lSkhRS9/36HUOCEhc5OzEfRb2
	JgmeuSI3kKBNgi7urZ+7zhT9/ITTbDBuhMOvmE4HoVk1IxQ7e1lNRQ==
X-Received: by 2002:a05:620a:a20c:b0:7e3:44e1:be4b with SMTP id af79cd13be357-7e344e1c048mr266094085a.31.1752669214499;
        Wed, 16 Jul 2025 05:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQGAK+k/pm+VAAiYbieT5s9SCZyiLFMahx58ymhGKiZvECv6WJDXL9w1xmtshVD5BdvFTvNg==
X-Received: by 2002:a05:620a:a20c:b0:7e3:44e1:be4b with SMTP id af79cd13be357-7e344e1c048mr266090085a.31.1752669213998;
        Wed, 16 Jul 2025 05:33:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c739sm19453335e9.32.2025.07.16.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:33:31 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/5] ASoC: codecs: wcd939x: move to using dev_get_regmap
Date: Wed, 16 Jul 2025 13:33:22 +0100
Message-ID: <20250716123323.5831-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68779c20 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZenZftWH51yG1dFpGBgA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OYG225oaQoDbDB3_SqR_nNdzjxwIpjDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDExMiBTYWx0ZWRfXyVADY69WcbvI
 OF3EfIh65xMviolvhln5LanYPaGhPWTlzbz3tEvfqcGTttoKFI+R8q387wySs6ZI6Y6sZBVhah+
 Env0XJC+Upp9QYkED9PHzKPFxJ7LxMhZQmV/cJUQQbTempQLs6nm3xhtnwDGIHrNCooxVdWrEHT
 x8/VFQm89MzF2VEmCFl1J5IMVQgpwnB7K2h7MYphla0tZCz9Z53l8becPRfkRD4KDASLI9PXQ73
 tGwwpVAm0W39/J/vFgsTfOiGXvEzl6Y929qJyoc9XEBy8UDZQsFbX0E34vH0U/CZgHatJ/rlf98
 B9FANop5mur50F6AFrhjEcgSXH1nIhvVYLK9H8es2273PR5vSjh8xmJitzRmXNonsdG3eWP3u/Z
 3wpP92qwbXjytYw2Q7ksGE9I+sq6+7ZboUo8fpOnlVbdfXXAM5rdIEEa7KczOIqTrGyWSrVn
X-Proofpoint-ORIG-GUID: OYG225oaQoDbDB3_SqR_nNdzjxwIpjDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=733 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160112

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Ffor some reason we ended up with a boiler plate for dev_get_regmap in
wcd939x codec and started exporting a symbol for this. Remove this
redundant wrapper and direclty use dev_get_regmap from device pointer..

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd939x-sdw.c | 9 ---------
 sound/soc/codecs/wcd939x.c     | 6 +++---
 sound/soc/codecs/wcd939x.h     | 6 ------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index df71d7777b71..2b0aa2108f33 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -186,15 +186,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
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
index 6bbdfa426365..18ccdba18291 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3373,10 +3373,10 @@ static int wcd939x_bind(struct device *dev)
 	}
 
 	/* Get regmap from TX SoundWire device */
-	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
-	if (IS_ERR(wcd939x->regmap)) {
+	wcd939x->regmap = dev_get_regmap(wcd939x->txdev, NULL);
+	if (!wcd939x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
-		ret = PTR_ERR(wcd939x->regmap);
+		ret = -ENODEV;
 		goto err_remove_rx_link;
 	}
 
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 0ee0fbb49ff9..eba8205cdd0d 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -919,8 +919,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
 static inline int wcd939x_sdw_free(struct wcd939x_sdw_priv *wcd,
@@ -945,10 +943,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
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


