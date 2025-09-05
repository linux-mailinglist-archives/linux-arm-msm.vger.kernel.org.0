Return-Path: <linux-arm-msm+bounces-72339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5DFB45CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC17A05A00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F16374266;
	Fri,  5 Sep 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SExit0Tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E93705BA
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087096; cv=none; b=D4LmazzcFBivfK0I+g5s4a4AscqZGAOozG9F3fsygEdpz/S9yslEYsvJVabjOLgkS7wWGKvG/UmvdLA4bLecROPuE87GifWOtkpKKIPf4ECGqpDKV3khTt/gbz+HyVZJCv1SEfje56V/bevLrFFeO729aCBbjL2e1oJj0oszt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087096; c=relaxed/simple;
	bh=/5tS1Na4bhQKzK4q//dUm4k/XvEXFSaGVZ5qLzvaXmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6mSW11VsukgkzysF1v0LNscMH9X8Xf5hkJ48SXQMnFPdLKvL6uajoyfKRr+bL55rJi6M/4dvbbLADiEfuT32C3ix4LPbL1XPtSyJlSzazgg/MVmJJ/gaBKQMRXwN8tyvU7BbXMF1GUPhQDwekq2P+8XjTRy6KgpOX8CPS8ClBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SExit0Tb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856o0iY032207
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mTLagKpBc2r
	L9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=; b=SExit0Tb+n8lSToMlcDLLokZP/u
	nk7QXrzUVMxnKsqKUC51rQgeHqTohoAPqOk1ZIknTxdwxFNQxCq8Tj4DrXGKxuOx
	aiRLouO2APKuJu3DGnLdi+7u1CyKljrzUw20rR0D/y1HA8RXFmCd2VUOf12+DsqX
	/NCC04/Q2NpWWGCVNQ9ZmYkHw06CprVC2ZWuT5FLx3p+xBMrBFWfcg3XoTC6Yjkk
	qUjvYFdjwUbo+0gq5i0l65ffVmvI/hvdaaMExRD04wIcjQmXSOHvzvNjDSIH/HLb
	i56QHD37Ms03boC2uhDB9aU2JWM7wfUJklGbQCAaVsQMpxb3+Q5yTAYZbhQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkrc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-71ff3e1256cso46942516d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087093; x=1757691893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTLagKpBc2rL9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=;
        b=YmA/0W3SrTp+sqGeS8ZAwsjCj3ElFr9LCaOV0dOvUo6BlQh9o0DFFfhrpLmH3Gr/Vw
         EI0CdMQWV0Ol5sWzqQ0hXGD0W2Dalnx2O/ipo3VoP4+X/vIWX3ioh+NI6a/UVrPUTGCm
         uLm+4Oa+hHznpnENydWeCc9B0CB7o6KYHyDOciJNOJalM6tih4eBVKaGqt62RsfP+rXL
         i4hP+OIIbwjZwwo+0nP/jZ75c/HrIHHqCH/usDoqtba9+td92873ma4kgWc8QE/x5Kb5
         YSSGP/U+NApYT/G3+j+HJVAEJnXNJ2sQ42x69XuYVsvHd1mwbWV4/j5DdRvWYPHN+spm
         ojVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpO89VkPU7JayRXmQrrrHlAhaCSkD1+I8ggSyLl69R1c+h5KmEXe40hx/bpwPUMBPtvQ6hme/5W+I6++R1@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3PLuc4BiScH1Xo0kpSE/15qUWRWE27pCCRqcCRN/I4tg6ouZ
	y/EsOnd2QiY69iGGYgb5PeRvrheNiuo1ZJX0cxshxBk1VANqPdy8HcRHK2k2njMOoqDqcSOXqBT
	TyNfrVERB2Ml36BF36y7NWur6+YKq9YdoqMo+5eM/3ymtPIXF5mhPPg4Gt05+Cga2GLeG
X-Gm-Gg: ASbGncsorPQQ1P8WGfTZ91lQ/1RSGjY0B6FXjMzHw/tv0fVIebd6MV+ODHlgOcx4GMh
	d+4AlBs5DDqkxvt+enR5MwU4rs5GEEgaBsS2KtMiWLATkuejwxnRrQ8eF0prlBTBIP1D4BSRBVs
	rLVUEOvEETQ4ezlUcXiJksFlVd8kZj7JEio458utRqSMj9G03g8qd3Ba5yDl0gcs0m04O7uHr6Z
	DMjA3tOsU/wi4U+mKsuWcnO57iPIvLoZiJ95gWXIL62/C3FY6gjlEbbU7xxSiUGPawWmd6ZKlgX
	vP01D7SHoiip4R4/su7sXtPvKZnHc7a+d8mOr/Q9utUupTwqmdpGfg==
X-Received: by 2002:ac8:7d02:0:b0:4b5:ee26:5367 with SMTP id d75a77b69052e-4b5ee265a2emr30882531cf.76.1757087092583;
        Fri, 05 Sep 2025 08:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXM5xYiTB//e6nEVW8d4V0nDzBo53JeNS4CwOwWnvV1IpsnA01PjZg8fUI8yb7yuS5+Sj9g==
X-Received: by 2002:ac8:7d02:0:b0:4b5:ee26:5367 with SMTP id d75a77b69052e-4b5ee265a2emr30882001cf.76.1757087091954;
        Fri, 05 Sep 2025 08:44:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 12/12] ASoC: codecs: wcd937x: get regmap directly
Date: Fri,  5 Sep 2025 16:44:30 +0100
Message-ID: <20250905154430.12268-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: H37iCuwOVMak_Y3QmQASIZDQo4dacWfs
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb0575 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: H37iCuwOVMak_Y3QmQASIZDQo4dacWfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4dskylwEYLXX
 Iw4sEV6v96jEOtB40oDizs4JRWtq/QIO0a85ur4nLOdCicq+RbjT8A72M6z8yaYdmgN95RI9V4+
 BSAk4633H3cRvw5+S0iAcJDapniVjuvseeR3HB/IBngQ2SuIc/f6/QI/ThGxuTuuFN5lPdCz+uw
 BWn8hvzKTcIH98KUwrAhR4QdmGNIjIvlePVRafadkb1OmzbisxpwKW22mGO2GJp33X0UV8ornjm
 OCAGFXyPrnChxCx+V/9cY9vUhik5fNgox7wP1MRV7eKKuQUrlYAX3ltZ/QM8NUP4ei0YAXAkxMb
 aBiX9Q8NMTvFcHt8eoj/lgrWmCoJXgc0ocKib57HID4ix2jxZCPiOamOmDInYF9y/usAVdzMqmU
 Y9nYJhGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 5c8faff3976d..2064d707ab0a 100644
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


