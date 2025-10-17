Return-Path: <linux-arm-msm+bounces-77718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4881BE74FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B83091AA09D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9742D4B68;
	Fri, 17 Oct 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2w0ov/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2F2D3EC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691390; cv=none; b=jU2p5LH2U0ob0Ib9z/wQbXt8t+SYOuKmOTRnsOIvdlCvs5Sm6auz/ejuvdTL9zNQFnyLckgPMaY/04Pxkwo3wRg5eRc1nyjjXuRIsTnFh1/J0611FhD57H4DhQaQ1Y6i+p2tOxBzM0OhPZxFgGROT0DaEEaF7MqQd2AJ07JCqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691390; c=relaxed/simple;
	bh=UOMDuytwV5b0FWFmJzLikQVcSaE25eP4RAV2dWnOfww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhDkvzYfGLEIWeOhs06tVvOlkM9MzgQlqRUGpqRufvj5f4pP5U55AVoLoT0oj2XNyXs+qKqInKYZUIvfnxRkzFeXqHRqGK0DF87/j6784PcIfRDj4/UfOlEf5owIR0/f8xX/g1EiHj2J31gnrtUTIU5HPnVtSkKJy6Hw7tJc0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2w0ov/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7vLro020546
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IRPASGCwKLk
	EyaUY/ExfpyqCkRwquY7kf3u//UZGcCA=; b=E2w0ov/OpoeALdj9/AORL6KicqO
	Xjj0RR1g2dWTA09mXMW/5gypmUh6v7JSLfS2iP+w2bGqMWEiMxzbpXYVt8/idCk3
	SC7myjvPKN1pmijmccEhgUA3b6ffb5JW+Gv0G9lKR9JDpUYygcl4i/WnrHKbOynF
	QUJmOnKeaAitD6pC4ndtmCwX4WI15bIU4vVFkGaOw/bOc7T+LFGgNsZ6tQFgFTdS
	Qtke5N1iA73FS73nMeFkXYcMKqePqy2W+a5JAkORuR4fweloIuhLBpaR0JpKU+C5
	q4nAQmvu8s/M5Tz7iAGIdjDcAb0i3aDiPDQlHEHa52rg1vl4l8WAntSTCWQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpmyf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78e45d71f05so50858946d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691387; x=1761296187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRPASGCwKLkEyaUY/ExfpyqCkRwquY7kf3u//UZGcCA=;
        b=gAS69kQRUF/8lfndJItItQrH7OqcKf5u5KfJg1scWT+XXiUjzQFGkFEMJzDa6Oy8A7
         tnAk7FuiulqmgR3iksoMplovMfuF3fYKKaLZSgfaSaqH9e5Fqgmd1mh9CYlUTgyv9jOe
         SQGmFGmdXjOn0WRrBI7SMRlRch1k/vHToHUhfxATWLxqmqxUPoWufZ9PNGQzTCoymNjJ
         E3lJC9RkR+qerSKQz+eQcdddVTtQVzmyqeK7lk4YE88dVD+/s10+qW8qmyawKXjkQ2hh
         RzkU4aHQP6fd7f70jU/6OSbbj/dztPJVZVIZ8S8LJ5fITjoTGuD59r3v5ODm8bRULCRn
         JPdg==
X-Forwarded-Encrypted: i=1; AJvYcCWwJIKP9UJdrW4wfflRZOLqnn8JsB3Ld3aq4l7wevPOIW4lVNZMTm/5Y/BgjWNtTDTRhVziD0QOVYOm8zIC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1tGjrRdwI91xF6bmpWLRNi/LmuCAPGRcjJoRKidf4OCJB4SCH
	0uJAzfnGpHb6anviRsDbTgg8/iQKhwjXzTZaa+dsaNrNXY0RGZNgGVXmzy/P08/vnSJVKh3eOBm
	bLBzxZ1wwx1dCo0t0tLGcaN09ojn1d/PXhiVfyMUpM2u8ue8CVKzeWOF4bdOiA6Dryi9m
X-Gm-Gg: ASbGncs3VZr8g3r9VPdnpOMxe69+mLBqUqXUvbxpnIY/aiF/Ab1H+J12jaMk9Pez8E5
	85iXnJR7F5ZdpiTDC3vHl6Ss9ByrRDfbwMgDVqaKz6lNYTg19YmOfFEzMH3CZ3F8P9vwviq+xNA
	/e/xUjh3VtpERkfdTHUalL95MTZ0V+9vypJlYROV4pSAeB1GSTKsMzL2P02u0tFNUMF84jYx9wQ
	IuFQOmbmRKneUAJhgzVEu9db8HamB/dD0JvFUNxsUJUEl2TVQO4g495z7SajK5CiNor9S21DMlX
	iw6FPjcyHh6RuoMZMfBbUwCd8hFg13mti5rzkDQ8jbEsYNHy1+5oKIIgMMjYqn9yXu+NCv7hnmb
	S6LElrM3UkG7r
X-Received: by 2002:ac8:6292:0:b0:4e8:a307:a42b with SMTP id d75a77b69052e-4e8a307aab3mr7543541cf.4.1760691386909;
        Fri, 17 Oct 2025 01:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt2aeEBG2tuomsaj8skDLmIMc21It7yI43sXPDyV3iT1PdQ3O8uYgGBS9IoNvVISB3p2rJGQ==
X-Received: by 2002:ac8:6292:0:b0:4e8:a307:a42b with SMTP id d75a77b69052e-4e8a307aab3mr7543391cf.4.1760691386395;
        Fri, 17 Oct 2025 01:56:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 04/12] ASoc: qcom: q6adm: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:52:59 +0100
Message-ID: <20251017085307.4325-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f204bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=tHfk9jisluZWoJm7kAAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX+4ssO37MOJIh
 zIpiUClAtaXD2/7nc6lEJEM9D/YBDVjZOPneB7IF423aXtk14f5NNMQZe+Qq13PL2qXf70yY2L9
 LD/4xhYrQ8L9k299MJprOksT0asgVUxXrr1NWx0ezLHVguWi+25EjE+aPAE6zUTgONcP3P7Gu5a
 AJEyhzz6qK7ThvK8gzhBoqtvuHQMiBd0Cq34i+x+MpL7xQ2iBpOReTd+wnoBlLfMy8T3C+V+rQb
 50m6btNFWQ7FZoz47wrGkG+AtPOSvWYrEo0k+5SeoGMeQD2yrgV9lSHGPNXOnXQpV8q4RW3MUeK
 sBqrc/1LTW87wHrest08vJVvmr85HbBJQOL3GyhIC8T2AR034WyTvrEM8Pqz6JodSE6Fkhe7zgb
 hjSO22Kl/Hev3dGwQoqHScWMslhkTA==
X-Proofpoint-ORIG-GUID: MG6R_v3BPcsuSGvP-RJApz2R2a91ohTq
X-Proofpoint-GUID: MG6R_v3BPcsuSGvP-RJApz2R2a91ohTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6adm.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 1530e98df165..6477c7875c12 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -325,11 +325,8 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
 	struct q6adm_cmd_device_open_v5 *open;
 	int afe_port = q6afe_get_port_id(port_id);
 	struct apr_pkt *pkt;
-	void *p;
-	int ret, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*open);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int ret, pkt_size = APR_HDR_SIZE + sizeof(*open);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -354,14 +351,9 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
 	ret = q6dsp_map_channels(&open->dev_channel_mapping[0],
 				 channel_mode);
 	if (ret)
-		goto err;
-
-	ret = q6adm_apr_send_copp_pkt(adm, copp, pkt,
-				      ADM_CMDRSP_DEVICE_OPEN_V5);
+		return ret;
 
-err:
-	kfree(pkt);
-	return ret;
+	return q6adm_apr_send_copp_pkt(adm, copp, pkt, ADM_CMDRSP_DEVICE_OPEN_V5);
 }
 
 /**
@@ -464,15 +456,12 @@ int q6adm_matrix_map(struct device *dev, int path,
 	struct q6adm_session_map_node_v5 *node;
 	struct apr_pkt *pkt;
 	uint16_t *copps_list;
-	int pkt_size, ret, i, copp_idx;
-	void *matrix_map;
-	struct q6copp *copp;
-
+	int ret, i, copp_idx;
 	/* Assumes port_ids have already been validated during adm_open */
-	pkt_size = (APR_HDR_SIZE + sizeof(*route) +  sizeof(*node) +
+	struct q6copp *copp;
+	int pkt_size = (APR_HDR_SIZE + sizeof(*route) +  sizeof(*node) +
 		    (sizeof(uint32_t) * payload_map.num_copps));
-
-	matrix_map = kzalloc(pkt_size, GFP_KERNEL);
+	void *matrix_map __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!matrix_map)
 		return -ENOMEM;
 
@@ -510,16 +499,13 @@ int q6adm_matrix_map(struct device *dev, int path,
 		if (port_idx < 0) {
 			dev_err(dev, "Invalid port_id %d\n",
 				payload_map.port_id[i]);
-			kfree(pkt);
 			return -EINVAL;
 		}
 		copp_idx = payload_map.copp_idx[i];
 
 		copp = q6adm_find_copp(adm, port_idx, copp_idx);
-		if (!copp) {
-			kfree(pkt);
+		if (!copp)
 			return -EINVAL;
-		}
 
 		copps_list[i] = copp->id;
 		kref_put(&copp->refcount, q6adm_free_copp);
@@ -552,7 +538,6 @@ int q6adm_matrix_map(struct device *dev, int path,
 
 fail_cmd:
 	mutex_unlock(&adm->lock);
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6adm_matrix_map);
-- 
2.51.0


