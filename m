Return-Path: <linux-arm-msm+bounces-72338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E454FB45CE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8064F1CC427C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8DE30214E;
	Fri,  5 Sep 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjY//Ajo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E72535FC13
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087095; cv=none; b=LkvGOVAOLLjSO1zKP9FSG+1qfqwX0O0KfRN3+EAhF/wVMZ3hnuwYLN5AhwxWqmZkhHHX0osiyINRRlI9XJQ75qGcwCrqy1bKmb1au1xa5Nv9fKE2+/klrYnnxffnPAm3vh1J2HOso0SxdH1OIh7QNDt8/na8eKc9TFzaLkkWwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087095; c=relaxed/simple;
	bh=/U9W3w4dsWi5IE5LjHFEmTpr8qAztaXo6eOJbgusxX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCrRYGBkFffykN9dSwv9YxtUPu4ppv/kE1wwJopRSnHW8czH2ZUmsusN0XeX0l/vNCvVrYUn1IHoli90VDYb/Viura7lAjrbBEAD9Z35w78AJHCKtil1f+RSsmYmTzqukt+xQ0MPUrrh+wlI3BJ7jdn+8uPUuNSjvW1WQjwAlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjY//Ajo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857Ak5F007841
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LsCJ17/WHR/
	P2iA3/0CFtxLbSANoJEOEN/h40JqWb6g=; b=HjY//Ajor+K/hp0gZpYsBs/g62J
	JpYUd55yBAjbWpkzmDjo/ddA67RvUOh/egBlasYdSAqFfRVzMh1eLQ5dGP1Mdk2e
	EMaqi+g+hUYlqXqYNSR4UFeLoVsdE5LLdTR0Voh3MMHgTo/J8U40ZlwjSceaA5j5
	tsAp+IX8wyGGRQq7udkjHPrT76FFSRtDYZwh58DA7mt0Sy88A0cNFf5joSnb5YoW
	hFg9B90uG6m8q1P5tsUCaNPQK2xwbHkGy20yoJujTpCrm7KFhXjumoia0nvpEHHg
	SBI9RCX8dtZvjMx/vx11kVpRLa8kamYtCCNGmeTivvQpdFvEFUdwxVH4ujg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura93fx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e9b60ce6so25724251cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087092; x=1757691892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsCJ17/WHR/P2iA3/0CFtxLbSANoJEOEN/h40JqWb6g=;
        b=BzbFH8Xx7whZFP6eextSSr9KL8eS2cN1935vgxDPCUHlLynATLtPoABwu3vVuc+Z8t
         tv8HAXiSXb5rPK141Wyp5vJ5tjRx719oR/R7czf7g1QhBzMYLHz4kkVPoYiWaHheagx7
         +zSlnZir31MFhaXfE3lyEBlVTp+nS6EkZZSDLTKQU8iJC1NWmzZdgIyAH7PAbuewK44f
         hqzK+yQ2Xmni3xVw7T24YarK//PyhVBDazI/eL0Ezbekt2AfMVjUVUoIEh1eYCcQrl6x
         ARdDgJ3J4Txq5yp9KyXtY9RCpqfYtRHotbOxK4KbxioEZjuwl9M7JL59hgzdpvgc6p2z
         RPLA==
X-Forwarded-Encrypted: i=1; AJvYcCXdBHjehxBURB2IZcv/+u1b2bX/bLa3wQR3kiYlKkZi2YSCV2Dc3XykvYvE8ZhHA5pcPuTNVzWu7spMVLjX@vger.kernel.org
X-Gm-Message-State: AOJu0YzUEogb89Q9Mw/JufEupD2709X7LDFOFdk+Zh+8DqiOP4iThFK7
	xxyDQtSFyqJ9lTTjiLhO+Wg0472A5pRyt0ghl6oWs0h5dzbTB1oeI4nctysjeXPM37AvPNofcVr
	ycVMq2AZFpt8uO298nhcgdC21x3JIaexd1CJYEXQJC3Q6XNQ8oPu/LiueCVbnDCmE6Ttw
X-Gm-Gg: ASbGnct+7evE0TyoGZI2rX1fOdkfPbnXetIdrdCYgVFg1Vs2/Xeq8PoLAaoslCrWXcu
	fRaiTZ7pllowLVRIX9ZtlFtBSIfvzqVYB7go8iYvbYWDKr4xh/61J6KotdhQvMS+IhWrVC1kydd
	3b+UtF/uxwBoUtPHCEwl7Ff9iXc+Vxpu80wmmF6MlK2mfsJrkLwymCo6U9F3OM1uD0hc5ephHVA
	bNE7yiuWsWnlOhTRw8f4TjSFil400RWV0wkmkkXw5mPIRP1EKFLMG6ETdHHXCNhTf051IvEXckO
	TGVL1HzZdEf4rAVI0p/nGnxLpMFEjvE0TjCDQ5ONYwg4yzDKOEUgbQ==
X-Received: by 2002:a05:622a:1f0a:b0:4b0:7d41:df7a with SMTP id d75a77b69052e-4b31db65fa6mr319517471cf.56.1757087091505;
        Fri, 05 Sep 2025 08:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdhep6GikAkazf0l6t8i2x3f5Z70bfCZ3Bnt13gdUl0CJAAIC5jV9yr7/tdMQ8sW4u617haQ==
X-Received: by 2002:a05:622a:1f0a:b0:4b0:7d41:df7a with SMTP id d75a77b69052e-4b31db65fa6mr319517011cf.56.1757087090929;
        Fri, 05 Sep 2025 08:44:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 11/12] ASoC: codecs: wcd938x: get regmap directly
Date: Fri,  5 Sep 2025 16:44:29 +0100
Message-ID: <20250905154430.12268-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -vVR42FK_CxHSrNaLKty084zFZ9_V_sg
X-Proofpoint-GUID: -vVR42FK_CxHSrNaLKty084zFZ9_V_sg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX0oh5EZGj3Wyh
 cT7BvWmy4aYuI+aIOWSncxWiGqtLDjlxBsArIRt8nZmy2+tEX9I2R2nSK6MONweESfcExPLwhX0
 x6+mlyR0NPOaV+bbxGDj44pj/7eEE9CfLiOH6mRJDqDNF4ZDF4QB9/qZHyl97mQzRU5tOpz/+3A
 02zhkFCQyFC7qBIJoGw6YCzQVUdNVBLNMFJ/mGrXx6GcqQOR0lQVZaWqxSb3TaV9S244QxxibF4
 DXenFbCCrDX+DQky/A7n3iMwUd1Le4AMsZ+fkyRr0QqZ+I3Um1uLyLmkxPBkPTRP9dM7CgoUExf
 3znLw+tT2HOrH/dsnIAJXO60B5cq6Kej7Z+eiZpF8Hi4rzvIxFqwsXwJ4rmMnnhHyLr4Y2AQke8
 OtduVzP7
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68bb0574 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


