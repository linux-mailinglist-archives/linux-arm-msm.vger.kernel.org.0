Return-Path: <linux-arm-msm+bounces-72765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94473B4FAA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39CAE344CB3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCB632CF76;
	Tue,  9 Sep 2025 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHrWVNew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8BC338F58
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420436; cv=none; b=fc7QThC2E8xVGL21K4BRlDYqvsbifUdKNEFSHjwcSnJRE8UG+pfHEZ2WtREdsfR+N1VBTLThYCTSRIRU7KanQ2t/3TQfpBrS3AkQ98AXDPgDAstDsHvI3L4yIG8TCQ4KrbcQKoGGQZqKMx5W7yIKq2pLBN4lEWnxUnGAfQHjc/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420436; c=relaxed/simple;
	bh=SVUoWsmSq4cUO/z4U/2qlZs54P0s1u7ZOQr9dToLxZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKCyVLC70JgT/+Gj70Nl3zG87FZdezcqBRcMwBGr6U0hVJmRF/ym5whyoEzZLt0ar0S7hyk2CVEMM8BLI5vDB1GnVJaW73omsdCpTinI8snt37OvTfllQlyylIalcZY8FBgQP35cEtMmp81o2LcKigZB62Vqhac/YFtdwJaj6WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHrWVNew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LVcL031532
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/aX4MrtepdT
	dnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=; b=KHrWVNewg7+jycfasOPcvIYs7ZL
	SVSzNIkUD+vyP4qVuLHjN/Mgcl2lvvxv9jv9ZzqfgojXlkPr+n8P1RHRl9b6cjFt
	LOVfZSTzqhl9jnFX42lww7ztGKzFWSWGqxhS3iotnjWavmHgfCQC0q9KO54MsRva
	dQFvCP6vbV+9PBnMtL1jx/6vdVHNmFW9aeW39cNC//UPSXPyu0ktT+knncHb5VZp
	xFVyC3Bo0+phjzuuQWVmL1NeAwzeWCmQo902hd8M8NLl4r6tBA/FQEcaoJEbRfZ+
	PHczTnDKR2pTN9Dk3I7i8qd0dQUA6UDW/pWfY9M+yyoVwxoLLnYrQFYWjrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws8927-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b60dd9634dso54091171cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420432; x=1758025232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aX4MrtepdTdnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=;
        b=vSVzZiFWNrblfq6A9fB6pvy9XH3B/jWGEIHYifTPd9Dp4Tp763VkP97fgKEnZ3CUoi
         any/5mJrMS023Gx9K8Tao9WDe352fXyta6a+BW6qcR81FLCDufiboku6h/77UosOMN/Z
         NNyB+wua989ymAKCsr+ULTJlH1yp0k+ES68xcHft8lz6CJtjisNluBRpCe7LAre0Hc2v
         NbhVM/A/FONWbDGO5xjUpVOy2as90/SOqdIIYmzZSK/uUJju1eOQQpgo0p7CO8N49Gs/
         XL1V43/1kiCoXytPrysDhH9YoIDSt2FsmHPApzKDost/zg47C9eGHN+mpfqXRKNKK2Bm
         nkGA==
X-Forwarded-Encrypted: i=1; AJvYcCVAHSmVAmjfFj5D48vI9kitCitPazppOhNEINewS4lRIM8x/VkN6HADj2sa+GcQ2zIp0mtPuDqWHY7xwj+b@vger.kernel.org
X-Gm-Message-State: AOJu0YyGVweRCarmW3cQOG1iuKAgaqdw4mN30ihvTfqsqWrCkoyQk9ag
	NWDP6yqi/y7egHNscYhOzfgGZ5VOPDY0Auzo50psECZIHZHKm8EkRSJ5cZPRySG9ImYy5RUuXVw
	LWd43h0K2q1mI4tECndmb0e8rKuCrIRbR5tEQwVoVXv/R/Zr5Yyg9yVTX+EKAmuFV5f5j
X-Gm-Gg: ASbGncsxPrtp451ngY78OKm8BokD8dH3Z10f987VeY2hBiYExj5ZLgHDYaCa4EFY6eP
	DGkiW0rulu7I1Pp8NfzQdP/39fUffFndGFeW3sbyUrWUahx0uvXzMo2oeNA35QLSVe/MOaaluJZ
	canGpHHdGE+v+4iVPPREwU1DO3wuabsgOwMBe5ACJi8DeqvmsutzoqsAYHHKY9xVr6VBtUkc2mu
	PgQG7Rt03Q9fXjIKMvbvt4sqRcRBIeda8lspH5L5IHA/9WNXwhSo6uspPcOOiHdstjLyih8+83b
	cRXsTTHOtwvgAPR0M+ZwesEUwWILEjm7rfqeundkXbqCrbfnF7jYQg==
X-Received: by 2002:a05:622a:1b92:b0:4b5:d639:e111 with SMTP id d75a77b69052e-4b5f849014emr114086521cf.72.1757420432266;
        Tue, 09 Sep 2025 05:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD1H4F2A9zCRDLPBwKwDxTxZrMciTCyU2vqs0hTpRNN1jnEO8an9hAxmLMO14UhV4DIucfwg==
X-Received: by 2002:a05:622a:1b92:b0:4b5:d639:e111 with SMTP id d75a77b69052e-4b5f849014emr114086231cf.72.1757420431636;
        Tue, 09 Sep 2025 05:20:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 12/13] ASoC: codecs: wcd938x: get regmap directly
Date: Tue,  9 Sep 2025 13:19:53 +0100
Message-ID: <20250909121954.225833-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bKYtAJ7-LZe4TnzKS1b8_d4gigMZyeAx
X-Proofpoint-GUID: bKYtAJ7-LZe4TnzKS1b8_d4gigMZyeAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX06wNqQ4TRxo6
 i+w0cylV3P9NXFr8fCHbs2kUSlQu/ple8Xn5Iw+FqyshIPgQNKhAwbYGX1ReMyTuEvxOcBBCtyC
 kNP79PE1pDM8hPxWMLl6QZ+fAMn/Myi/t5rm22FlzL1wMTda2wp8z78kEJMpfAak6OHO8dy34/l
 3WfYZm9opyw2Q8868mqIt6B0JUmWn+QArnLaGryqXeiZU2XQTmlY/U/OzYX2iGfkadcCXbb/3Cf
 +npZM4033+oTeNdLJccuTKR0LxJ3guoSQtn9jJdhl8dTWiSc/X+LKVGLBfSbQOItG1FPZNLHuJS
 43ik9BF4wADgf2mk+tesjnJ5/KpYULUY+7pS6EoO7piJBbCbi6OiOXrZsp6UWAelIb1lecBfcvB
 3lIanlpF
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c01b91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

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


