Return-Path: <linux-arm-msm+bounces-86338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 345BDCD945C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF4423036592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 12:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E71331A76;
	Tue, 23 Dec 2025 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGKEpw1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOuu+ELL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB6D330B1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493223; cv=none; b=NXGnEa/dNosAB068p8MDfhlUI1xaw38jbVnndrte8HXoZGKxp+fcv1PK56sqBE8APn2QtZ5Xz9GkknTI7ufEMszvuHNS5jMGz2YlOE7jMsD+226wzqHzqUZlvkgBzr+SRpsA5QC+inIzILDyxp3V66BdUvAVWisjfIgZRO5UsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493223; c=relaxed/simple;
	bh=AcGPqCWKgBzSZimwRr9Kq6y6axuAf7en3TupNWxPnWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lQTBIBKRLcbT71SJ5MVct+yFDiOAB5mQYuUCI/J96w/3Di8IHYMpcv8pszfSNN1quHvS+3n3P2hGqyk/bPLvV5rzhkzWtHplpNebJnoZ99LqdYdm0GLeaS9ygvxhSop+c1feO+4GJKHjCoY1V9jFQMTcL8zsK86mxSSyPOqaQmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGKEpw1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOuu+ELL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8goVP2748768
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aJeWDrsJmM7
	h8GVo/zbYa3yLTl64bgseizzIEc5t4fw=; b=AGKEpw1KZFkafed2GXAwy3zhr2i
	epTWGGqoF4lqzKz7mtNF7HdvCik1spZrnRzUy/FHRys/VaDRNRz2CiUcsE4XVQW6
	4V+GAkTqZUep7SflFYlK52NbM03iWqclQHOvnxjWhfeZG+smzjtCQiAAfB9o6Pjl
	gHGu3WyvkCEElYTadtzT+9AnaNJdXJ71eGLS3GRQGbCJsWaU4f7YT9ie5Lah84Kd
	AyF/ji79tfryXmLFebXVlCHUiAEr/iwhwJWUT9aI6q2FjUw2G9e03S/hfVTouUTt
	bBNvpnV7S62r5xCKlCMsXeHWpHiTg8KUu6p1DHCb9Pxg8dQATEzXqa8CIaA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ct2xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34eb6589ed2so2962733a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493220; x=1767098020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJeWDrsJmM7h8GVo/zbYa3yLTl64bgseizzIEc5t4fw=;
        b=dOuu+ELLFzcJJy9tXdR+yDFPaMDEgSu7kXkTvKn0nKxH//KJ386EE3CLGwo4lUWutO
         fvGnGRplntiO8WYZ0cTwp/jfVAZDVClJobTOmppXriq+ruo25rhNIThw0njaLhXEO3b2
         JwQ3uJ2KyN5Wnqx0cmaPM7eWPZdXajSw8je7Ap6Y13Imm8z7BF3unOwJbMFBVVVvJGEm
         drRPUaerl6ct5O0yO9EsjnKep7AL4+S3cWFBi2y35A/No0LnDdoI0RR3Ns87tFMhFyAk
         EB7hRW6t/4U9O9T9398GZr+lhaOGNnEknlaA/nmnWVsE/es3MITqA0y0o57pdkjWo3/6
         MVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493220; x=1767098020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aJeWDrsJmM7h8GVo/zbYa3yLTl64bgseizzIEc5t4fw=;
        b=KCnGe9YmNt76NyE4QmISouvSA+1b9MApq1oXNezN8AStEB1MRsexU6ZaMVPLc86knD
         SmnCTh4o+BTFur1hpBXUQT+sp8khsXkkOchr9TfrStIyJxM0j1sB0gHiPxpYwfZhrNrN
         kuRyTKVlDdxrx/E+206olItzuguKX7OLHJnZUm+9i+YMtMXCnQ0LBB5zB1y7L6thqyZQ
         Sfp2rquDgON7ooVvmVARH4/16Xw0UkrcbdpDDnXJ37YFm89Uy3VS9o0DQne+XFca6EdO
         YY7K21OflQtG5xtvunvCY57B9toTxug+tu12Sggz2BochaT/hX2FV5/RoQ8suKWd+esB
         MnXg==
X-Gm-Message-State: AOJu0Yzs1qS6k9HquDgKfGCXzyZttKCNszaqmOshM4zZRbBwv0Qdju4v
	8oDxPJMMsoRnhJqReZlHobyuHTlIGpGaNH4EqKS7ffuNwki3clONm0dLymdYJz2R/ZSL/9DM+/i
	RjyPfUXqmdM5wycsXebXVqwKWnxmc3J8iOM3Z6ZOEHyOI2aarvzatMWcNX6GtczGhJT3e
X-Gm-Gg: AY/fxX7MHzZAsI9qmct76ISAQSWzlL2MikPSdlYRNaPa4SuCWVCsveLklWoF3J/gkpy
	ajWtl/GzgF8liaS6mgG3pp2A4YcYwIJHNHvesgqG0oP0UWNMvxd5Yz8YdAxvNSr99azRpeEJ2Vq
	wjj+sz4YQUeA9pqTYxQnj8og5vjD6GM3rgP6rTSNClXO6+MBjTldKk8hpIPfpOi8AmgdA/c6LWg
	KvJ1XtgrFMhUQlMfv6auSF/OPWijNKKTFP6eNen+xPXf5tOJxykthn7+lS/gvISqDPmRgBScVJB
	/vtCvGQA6sJ7BHmEcYSqfdO3o1ijFVL4AIXAPw0v2pRB6gX6KA2MNjqdEJbqj28EJ098RZaFbVW
	11HisGAN/nFu3NR8pF1eqZ4LjuVYl9EJv4PD0bQg=
X-Received: by 2002:a17:90b:528c:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-34e921448e6mr11963349a91.15.1766493220335;
        Tue, 23 Dec 2025 04:33:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJSNGoeRutcypLSL7mWdpEabMVVV+h3dkYDu76DTg8oaDcFoVDASetaBzlP041YJCOO9SPbQ==
X-Received: by 2002:a17:90b:528c:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-34e921448e6mr11963313a91.15.1766493219634;
        Tue, 23 Dec 2025 04:33:39 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b39dfsm12936044a91.8.2025.12.23.04.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:33:39 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
Date: Tue, 23 Dec 2025 18:02:21 +0530
Message-Id: <20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfX+LPB/Sz54uMB
 OC01ms5hojZV4bsfv9pnjIvqWikxO4HanDTQZjd/dnKZBOqZIQLLByhvEg+cdD2lvpNcU6jqlxd
 3jSmOPAKKMMP3YtSQO77XgHQXeJJa9J+sKT0VhELwqNcL1O8HWzALlAATyki6ke3O+EfW/0Xho3
 02KwMdq7G1NxdSckJFp1OPYv8u8JGV7IOud0RLUemIlj7b9Bf9C6D9Kj5fg4VTBEu1N6zV9s+tv
 02569tT070P4uu8/RY979Kmd89tWdlV4tjrjbKX+Tz7fJZXRzYSCeeolWHlkNMvyVXgDGiEoTOp
 P1nQIRW3nSdsV5EUpzV9yL9+ZwUOPD4J8Zhi/7rgRtIdVF9DysKImpTYaKkxCpjtbO63DHt3Fio
 Es6/kIvdgrQc7b7ONAiolTTylQbJuvwlEf7aZMVjm8etiM/XpJC/3fJQbrQu1fQ/QdaXI4dTqSz
 VVdMK1V8EA/R8AtfJDg==
X-Proofpoint-ORIG-GUID: M7OhWEpKlPbYC2HRQsS0iHPCfgbfD9Zw
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a8c25 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=DVrfE4CxleAVZt4rZOIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: M7OhWEpKlPbYC2HRQsS0iHPCfgbfD9Zw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230102

From: Casey Connolly <casey.connolly@linaro.org>

Generalise the qcom,bam-dmux child node support by probing all
remoteproc children with of_platform_populate(). This will be used to
enable support for devices which are best represented as subnodes of the
remoteproc, such as those representing QMI clients.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/remoteproc/qcom_q6v5.c     | 4 ++++
 drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..a02839c7ed8c 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
+#include <linux/of_platform.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/interconnect.h>
@@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
 				     "failed to acquire interconnect path\n");
 
+	of_platform_populate(q6v5->dev->of_node, NULL, NULL, q6v5->dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_init);
@@ -361,6 +364,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_init);
  */
 void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5)
 {
+	of_platform_depopulate(q6v5->dev);
 	qmp_put(q6v5->qmp);
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_deinit);
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 91940977ca89..d40565c1cc62 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -238,7 +238,6 @@ struct q6v5 {
 	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
-	struct platform_device *bam_dmux;
 	bool need_mem_protection;
 	bool has_alt_reset;
 	bool has_mba_logs;
@@ -2029,7 +2028,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 static int q6v5_probe(struct platform_device *pdev)
 {
 	const struct rproc_hexagon_res *desc;
-	struct device_node *node;
 	struct q6v5 *qproc;
 	struct rproc *rproc;
 	const char *mba_image;
@@ -2163,10 +2161,6 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_sysmon_subdev;
 
-	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
-	qproc->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
-	of_node_put(node);
-
 	return 0;
 
 remove_sysmon_subdev:
@@ -2186,8 +2180,6 @@ static void q6v5_remove(struct platform_device *pdev)
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = qproc->rproc;
 
-	if (qproc->bam_dmux)
-		of_platform_device_destroy(&qproc->bam_dmux->dev, NULL);
 	rproc_del(rproc);
 
 	qcom_q6v5_deinit(&qproc->q6v5);
-- 
2.34.1


