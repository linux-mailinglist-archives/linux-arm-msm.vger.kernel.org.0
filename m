Return-Path: <linux-arm-msm+bounces-72458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741CB48268
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B341C3BDF2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 02:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAB31E1E1E;
	Mon,  8 Sep 2025 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QwrBeEeg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D25215F4A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 02:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296970; cv=none; b=tR7DU/J5iha2Z1yHr03DHwNwkhruvZeRNA7W9QxjDcLF6gE2D9TGDcCIlyP3GvR/cZWik8f+Xw8XXdQk3B6stfMCi5QYdgvmFbhIMrpqR6Ff9qVu14S+bcchYtZuWnzM0F5H/nECifFyp93YcouiQ6x4/OMSmrY7vn8cvDXKskk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296970; c=relaxed/simple;
	bh=9ZOyPv6bhMLRODUqaJ5ztJAwxo4d0yjUaaXYVxTCAts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsQlqh27I11CeW2pAj2BOrz6qM2Y5hnOiOYZWCelU5YpJBubt8lFe37QhVtTFpSxFNxDDaHWwUcG5vDe6FE3Kz72MXiYBDhFZeQtFqrrAOUPXNr/vBfNzq6J8NzgsUvARWGb7npp/aQ+d59CIIO6lfWQSCHeAwgrweHNn/PCtVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QwrBeEeg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Hs96x010658
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 02:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa1G+6fQ53tFpugkuIt/tI8SnQtTsLjqcg2Jm4DIfOQ=; b=QwrBeEegAs9RlE3n
	Md82rc2JVOOIPmeqSrHxqcWm/Ou/cYbUrlkMW2/oVBhgPo3loP31DiAhm4J0Ljc5
	TLdCW6k3FAkkDTHMbzK/a0ixRTzpErrs32YeiQVdZi3LzZGVM+Xw8sLdO5aSctOQ
	fXD2iFRexTZSqq3dF7cQLgVaHme9TYK0qPA1n8cqdy/CyoVGelVh3bxGHUiCVb41
	7nHrAoXBnNtmmyjxjqd7r6IHjBSmafSNcs9lYoZV7OdO5ElsCSJ7G7hzLLdUH/FI
	iCANYapDTbmNM53F9IVh3yf8iFMExfhFbv7HmX+m29mwzJm8PIIor0cuEvOHJUPs
	TIYr6A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1vaxta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:02:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7742e89771eso1298494b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 19:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296966; x=1757901766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sa1G+6fQ53tFpugkuIt/tI8SnQtTsLjqcg2Jm4DIfOQ=;
        b=O4VVQs86tuMmdB2Q1q51nhbzczNODeC5Yak0SwOJPIMT6jbPkta3lZHkhbawmg2BqL
         /uk46VluoQf+p7cfbQm/NPFftGOD1ZCPz0DBla5sf0RaVY/2wDRC0dhv+Ccu7P8yfLPV
         PzDBvz4f3KdZ47oqYN8hoDjzO4ug0bhWSZbnb5YhyiMH2vXXTAkZuBWzk+tBxdqfSp07
         rwMCR5CtID95pp05CKbO1yj4I6+KNex5hg8bL7DmmL+x0vP/pCkn7OVcQUowY+WEZAzx
         7KncbHu2VRrQeh1O1taHsfGHPnT5nptMCyM7bkkaH74rY1tZSZ8ALIF0R15ZDjlulMhQ
         KotQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZa5N84IbXiHxyor0NH1DNB4VFCRDX5NIcZ7kPViSRXRY7Rhiymc8H1sK/AYqGUhp54X3YN/R5Oc+NlqEh@vger.kernel.org
X-Gm-Message-State: AOJu0YyQe0Za0nvwTSntuBy8ZvZhng8wikwB/Bzc6L+i0i7JJ89CqRVd
	5wHQWlkGKk9l6q/cMHrZVoCnwBgzg1VLqa1llTMUDYhBU/TJ8abECYlt2Eyc3lM7nyOtpxB94WR
	ow7EoNw/6g50GchBcVdD//F34VB2jWlXz+gRiCkSMNbCLZWUrrBoISvzoedv5JLTc7m9b
X-Gm-Gg: ASbGncvk2TT+KiCzfjIpF+DHkJhbab4O2y3eJ9sa/58J3RqFTDCwfT0iZd8jub/4aQz
	1o3S7xyyi+7o0rIdsBq2LtvExldDupaRkGujERatbvX28oiB02FYcrafpYP1jE7vn/zwckAY0Xk
	NMXPQPY4WmGpFIDDu583J+hh0MV7NaTRUQH/OvkrsqSR8ZhRK40OS+MxAXLTFxIj1e306JX1ohB
	I2OM2ucSoO1o8wdKyo0UtQtY6PddRuKogIURsr3ESdlB4h26GJUT5VWaw43pOEK1KTTR9uZNC3V
	Gc7uDYHi7pvqV+ITaP5a3I51oL101tCuXNvvBL1jDbCkyCvyL7cdm3Xnuu6myXZ/SruwgnBh4E4
	/IlYg1b2xBT2z5RUbngZ1N5w52+k=
X-Received: by 2002:a05:6a00:4650:b0:771:e5f3:8840 with SMTP id d2e1a72fcca58-7742e4a0b84mr6365779b3a.13.1757296966312;
        Sun, 07 Sep 2025 19:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy9b5ueRmogyPXkCj4ZLin/RA5hSyK7llchgmHX3Cc/3cKAgWogXXGMxrbrLzv2ZohGQo4mQ==
X-Received: by 2002:a05:6a00:4650:b0:771:e5f3:8840 with SMTP id d2e1a72fcca58-7742e4a0b84mr6365735b3a.13.1757296965814;
        Sun, 07 Sep 2025 19:02:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:56 +0800
Subject: [PATCH v6 4/9] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-4-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=4084;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=9ZOyPv6bhMLRODUqaJ5ztJAwxo4d0yjUaaXYVxTCAts=;
 b=Ext6XQLN/vl2Miak4a6zi3Ok0V3h/UEyTz5zaNVhvOcLYXMtifEtk3eMxF/scd+Y50Uy8GxSf
 KSShG160avQD2blhk4TJzYjiKYrGLH/EM2PNXbqrQAafCaUfoSk3nWR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-ORIG-GUID: lxxzN732VjkXh0VV8hDiRV-xXD0w4iqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX70k44a+WnhqE
 IsbFHWfQsynTh+vktlQcUlKUrFiuja4ZoI0Dc+VYRgBhXqmdehTN+22K2M5+JG7r27kd5r9ZIIV
 A8iVWuOEduhOIVwp+Hte9xXjb+3gSpOjBHcDH4j8uG5xcoP6GY11ebczEXh8nBa7ZM0BOBe12l5
 u2IIUsJnNfF4IiqDpZAwo5gMPwYq63YiMErmBbKAJAApHJV+F6JlWcsv9p2slFwi3+5EkPSWNsI
 NtiGNhK3bCh00omXibnGiQzfPviro2IxgNTy2kqoq1FI1t+xDigS35StRcP5TSHTBMn/+81ijsc
 qMJvW0i+30AnTf9RE/im7KPHiyuwY8dv7bODG2+0W9S9lPaeq8GY5EOcyVjm2HAWysKmERmeqs/
 Whq45mz1
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68be3947 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=iCabL5HRm4xHoUrnq98A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: lxxzN732VjkXh0VV8hDiRV-xXD0w4iqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 94 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  2 +
 2 files changed, 96 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..ed15991b3217 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove the allocated node from the list and free the extra buffer.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
+				drvdata->sysfs_buf = NULL;
+				tmc_free_etr_buf(nd->sysfs_buf);
+				nd->sysfs_buf = NULL;
+			}
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+		if (IS_ERR(new_node)) {
+			ret = PTR_ERR(new_node);
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(new_node);
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 292e25d82b62..ca0cba860d5f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -459,5 +459,7 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


