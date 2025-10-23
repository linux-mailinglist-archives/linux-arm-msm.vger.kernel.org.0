Return-Path: <linux-arm-msm+bounces-78540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6AC00786
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 927D7342A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1C530E82A;
	Thu, 23 Oct 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDO9t2yh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996730C603
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215176; cv=none; b=H7okuJ864lnDpX+9rMyJZnaL3/CeNarIFKvnHbOI8aFcQt+7mOWa127Iy+7/7F3gBlI2duysOYDVTPdZ2dBowlAvvxMkvhEa/O7RvQQ4MTgDVvkV3eMfDPFFT83hrZ39Qx9iJYLYSJ/8Vpn1nBn9Qw5cA/luzodEiEtEhfaghXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215176; c=relaxed/simple;
	bh=yBNFWfi7nb0NEEgHL4lbgPtCESQBjN8cUW0xWV+hUrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqcKKBDtY97ZoN+DpfCtrj9NQSBzeUzlDziyiiqq6xfZHmIlkC8W2V7f88b3+QEZKEA/h1GTvuyrhTyXZnYVetg/13Iv8ZBCx8ZjbfF5OrU71xdtF5ighwS+VP/bSNADWYp2WK8x/ueiUB6YciUoQpKyClfvhyXORxEuGs+J+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDO9t2yh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N9137s024900
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nDvlp40m+Ni
	viZ7Prwo/9bXT1BrtIsyNq1nV9QUwJU8=; b=dDO9t2yhoTDMVFCW+mn8OSfyqXp
	xIdNp9640vYTcXOYyx6ab9I/NSNxUQP8hUsaOQBSQGOn1rz9tXoQB2Z+0L4olJez
	yTZmCn9cJkbBn5zS+wWOUHlInJ4erMbnP5R1Gf5rZ/70FT83UuSageEkyT7rXgj5
	yfZm2GB4P8HpmAMAm5mXB2exFnPaH/eUxeTuQquyBJcil3KwBOz8c8fRT/IBeksG
	CRK6j/wK+XkZzDNoKBcjgZHVWSz7n8xCT9fYPH73kyBD7pDUmnjEfNESlNDpgNVt
	9F2eEczoYsrZjrDap/oHK1yWlYaeH3gTs6LuACxIu5GDRvCq8oQTxOvvfqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0nxmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8984d8833so30657141cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215172; x=1761819972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDvlp40m+NiviZ7Prwo/9bXT1BrtIsyNq1nV9QUwJU8=;
        b=OvGdvwU9oXlgnqJkLOyzQb5K/8dAX63dVHRcBxo9JIBhAO4ll/udW34VNUktvXrgrz
         5Xr+AQg1bXIGCitxNzYgciH4uN1h45Oax8SkmLu3ixgRG4wpTuliFgfr6zqPa1MIIEK5
         YuzET/VHckAd9lF9YELmhyLDbjRlGsWLVS4ZzQKenXyE/Xtlv3ok8lebcj5rRgVRT9uE
         xK1dnUVIi3Ri3jZSHL6XqZsGBTpcyl/0gLoU0dCx4ag0KTiSOmGXKIlhAUshJVDgzVEQ
         dGLPpMG+Y/BuPxftgaXvosbdGBc9QeVJt+mpRKmSyV2u2Ul36FRcWEGDs0gtJApDfrQa
         z1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWlhrBzkoSaCsIiRLmpbm1Kf5+83/Oa3oKlNgq5xLOHtEv/Z195py6uh5AaTNr6YlXrmKJjVJxIWZi59h/g@vger.kernel.org
X-Gm-Message-State: AOJu0YwNXB3kHXeO/BSSIcYGE5jhkzrug68d7cK52bcn0p30fTssm4vi
	dqEEtv6Rb0tmxmbJSRbnSZNeTOo0dfN5T9UI6DiG1XeIQYbxlSIVmrcl0WVctoebZsu9CDFEn4T
	GgPYG/Hqq4VcaGAbExRRhIp2k3KCoVqRPyqKrNh7OQNUmk4EJd8YVdBYde85FAO7CvPIe
X-Gm-Gg: ASbGncs1mcRImWuFbZo6XQoNHUOtH89wm/P/tPVpmjL9EtH1/bUkMW8jUu/n1GfB3eD
	fnV7Ahs2uyOneZXJrbHD9WnxJQ1REEnWsE/CD7LZ5BVoegO1tYPIkrflxVJqKRfIQpxeY9Bm4Z4
	oZOyP8EG6ZKw2OkMcOJB7N+Z56X/lIlu8zSsYl6A5qQGk7vDITAu6xU8ELy1NizdgvWaRuGctZC
	/FLAsy7K/gnl5IUC620fSVqDjzNYl/QBjCkXH5+g3zayC413zZt89FoY6DGNHCi9tP7mT2rE++O
	QDR3N6xjmqGjU64x414siDNUFP+UcPwtzHsm2E5GisV+SY0/mm7oFULwGejYEZIYCk6Fl4X5au4
	hseEQZACCo0ZJ
X-Received: by 2002:a05:622a:138b:b0:4e6:f8b8:50f7 with SMTP id d75a77b69052e-4e89d33642bmr329289551cf.44.1761215171851;
        Thu, 23 Oct 2025 03:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO3GrQVUuEv9NnqplDFxqKgL+KC3Vx8puoDERmcPhpNTD+7RpwHEoz9azTtHB75fZgXP5pTQ==
X-Received: by 2002:a05:622a:138b:b0:4e6:f8b8:50f7 with SMTP id d75a77b69052e-4e89d33642bmr329289291cf.44.1761215171349;
        Thu, 23 Oct 2025 03:26:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 13/20] ASoc: qcom: q6afe: Use automatic cleanup of kfree()
Date: Thu, 23 Oct 2025 11:24:37 +0100
Message-ID: <20251023102444.88158-14-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX2wDO2cic9h8t
 0wZ2+Gpjb3IlECQKrW6bwietHcSBgUyQtPXLKdzTTE0Mxh0mTDEVst4rPQPciiBeOHzcbRkTrAj
 YllikYUvBHtHlZn3phZBPYj2DED2oWmrUHXeg6HL4gyV67s9CmwNN8l7bvn5pTPvT/UAK2BSHQD
 c0GcvFwNcA6LTRdMWmJV7Ew9+JUyRZg1/YNFsWJgUJocfj1bxEakhVydq9xLd2dl8cyeT2FtgUx
 yJ80iCM/i5DwrqXMuCMwEaQtyskrHHRnzumtiQP+2CzNoQT7oivTiMcMM7AIN17yfr7jMBkot89
 20ghnJ5vc0QNbBwh8hrhp2XSaVInsFOmP74nHs1WA/vXnFKlYaATuNjQ8R2Ibctr1w3ZMQIQDP6
 WuBc2guVlSeXMrms0H+M8slTxLmoqA==
X-Proofpoint-ORIG-GUID: jdeVp2PT9_w69EKQP6wOPImB6hXEaBFJ
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fa02c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=92AZDs2nESXm7HPk3LYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jdeVp2PT9_w69EKQP6wOPImB6hXEaBFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 41 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 7b59d514b432..56f85f1c2425 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1077,11 +1077,9 @@ static int q6afe_set_param(struct q6afe *afe, struct q6afe_port *port,
 	struct afe_svc_cmd_set_param *param;
 	struct afe_port_param_data_v2 *pdata;
 	struct apr_pkt *pkt;
-	int ret, pkt_size;
-	void *p, *pl;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int ret, pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
+	void *pl;
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1112,7 +1110,6 @@ static int q6afe_set_param(struct q6afe *afe, struct q6afe_port *port,
 	if (ret)
 		dev_err(afe->dev, "AFE set params failed %d\n", ret);
 
-	kfree(pkt);
 	return ret;
 }
 
@@ -1131,11 +1128,9 @@ static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 	struct q6afe *afe = port->afe;
 	struct apr_pkt *pkt;
 	u16 port_id = port->id;
-	int ret, pkt_size;
-	void *p, *pl;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int ret, pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
+	void *pl;
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1168,7 +1163,6 @@ static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
 		       port_id, ret);
 
-	kfree(pkt);
 	return ret;
 }
 
@@ -1285,7 +1279,7 @@ int q6afe_port_stop(struct q6afe_port *port)
 	int port_id = port->id;
 	int ret = 0;
 	int index, pkt_size;
-	void *p;
+	void *p __free(kfree) = NULL;
 
 	index = port->token;
 	if (index < 0 || index >= AFE_PORT_MAX) {
@@ -1316,7 +1310,6 @@ int q6afe_port_stop(struct q6afe_port *port)
 	if (ret)
 		dev_err(afe->dev, "AFE close failed %d\n", ret);
 
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6afe_port_stop);
@@ -1676,7 +1669,7 @@ int q6afe_port_start(struct q6afe_port *port)
 	int ret, param_id = port->cfg_type;
 	struct apr_pkt *pkt;
 	int pkt_size;
-	void *p;
+	void *p __free(kfree) = NULL;
 
 	ret  = q6afe_port_set_param_v2(port, &port->port_cfg, param_id,
 				       AFE_MODULE_AUDIO_DEV_INTERFACE,
@@ -1722,7 +1715,6 @@ int q6afe_port_start(struct q6afe_port *port)
 		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
 			port_id, ret);
 
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6afe_port_start);
@@ -1845,11 +1837,8 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	struct afe_cmd_remote_lpass_core_hw_devote_request *vote_cfg;
 	struct apr_pkt *pkt;
 	int ret = 0;
-	int pkt_size;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1871,7 +1860,6 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	if (ret < 0)
 		dev_err(afe->dev, "AFE failed to unvote (%d)\n", hw_block_id);
 
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL(q6afe_unvote_lpass_core_hw);
@@ -1883,11 +1871,8 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	struct afe_cmd_remote_lpass_core_hw_vote_request *vote_cfg;
 	struct apr_pkt *pkt;
 	int ret = 0;
-	int pkt_size;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1911,8 +1896,6 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	if (ret)
 		dev_err(afe->dev, "AFE failed to vote (%d)\n", hw_block_id);
 
-
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL(q6afe_vote_lpass_core_hw);
-- 
2.51.0


