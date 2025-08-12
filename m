Return-Path: <linux-arm-msm+bounces-68695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53158B2219C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA86416D0A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8F12E974C;
	Tue, 12 Aug 2025 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a848246D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172092E973F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987883; cv=none; b=HFtgT3j41jIPTTY7ojt9PKPZLFvQwG/50ESs8FAmhsaD6y+LBYamLeEA/ojaSxe9it5TWtme7xfTtGkgpF6kVQXO6wusPnLOqWmSgfyM6RJLGi62BfYKBqoIPIzckKPe5/sjBiT21Hqqkn8t/LEY3oQU0oAV0xwXDC1U7J1cNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987883; c=relaxed/simple;
	bh=GOPjgHWxv1KwRPxnlny046bCIvHx4fvw/23iFRXh6tA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tt4HaXXtGPQJW1JJVWLozwas5OitSSr21I7+Rhzo1ykhgvLCi5loIgzA7S2gw8aeSQGhVcdubRzT1KuYPo+gDrgGg0s3NAklzy3Oq3YjO81phkd5lIUvvKIeD/D/fxO9J4ZqwxTRz/92A0a4rff8ejlxxYz0a+pabU84fKX7t+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a848246D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4sLW7029604
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nfhiX1ygP2A
	vXXrs0gcWYMD2ZsFc5ZoIj7fNw/kuGXI=; b=a848246DTWrr8GBfTijf6OIzLAI
	HTGVIOm9ZWPzxG9azZHVn6sXBR28x0/U7pScZwW0t6U9fopH9vRS6BvJOLIm4K9o
	zSFoN+rwtXwSDowODTuZd61v3jO3VkgS7SSiNpTe+gm8zkMVKyWmotgOlnycazmt
	nvqKKwSccD8kJP6s2bGcAhoZdnI6u3Xo8ju6VEax8NDfsq8cGb0TKWM6xpvwdkIk
	uVmrquZa99DPS08LBiUfA8pA7O5K9L63pemdNdCmxaTH9eJ2DciVT0bopDqffzmC
	7Wctb8Pc62rlpiGTJ8THL40wP93NU5oKO4ZyiE4p5M1Q1N8CZrlLwWkemSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqkfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b321087b1cdso8000269a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987880; x=1755592680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfhiX1ygP2AvXXrs0gcWYMD2ZsFc5ZoIj7fNw/kuGXI=;
        b=edepcQBRwumz4+VdhmiFpyr6nEaovvpM/x4lygGqIW3tn3GUBqMhonBmqfTrB3Gd+k
         xikzSeurXX5359JkItb/39RmFXf8HnJSGg/tRufxWk3nd1pXDYUtNiiVXKp9Skyh+goC
         tLTlXRabV6R/uYsT8H4c5CK5JCPzlRLkWo/0wC+FEzcpzdZ63ecusG+B6jneI5krbJRb
         wPpGJ2gFkCLBLFH2rUUnWw/fdZ6uRGLwH21cmxOxR+3vx3uJFeBMn8jHrWZhSBCDTZk+
         c7oOX+Rx/y41gkMErmCZKx8CiRdLUz78qkBKjHT+6mK6fp6N3yuqzC/8f9MKWkzwK8Pf
         pR9g==
X-Forwarded-Encrypted: i=1; AJvYcCVeG43yYbaykQdKI/xUUPK64PyLcc8EIP3/mxV2AxTreKIVRsf/IdzD5VO49QHVS12qxxBCQoi/t0cHiPB6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/csCJJ5eFpavhbdDTpWWX0sKHloycCrfMhuCfOBELyL9Z3rpg
	sudLBfnDq/1cOGT23C1yB0ESaVsEb+wVZDZZTYdZpGLcdwH2tj4zyUzBVn/5IpUP9v3ZsuVcrvA
	2aXx0CwQNlOU864tjKxisvkLhFluo6X9i1sJLC/jclfDON+pTUe3/EfaNYM1zdC6x+6sZ
X-Gm-Gg: ASbGncu/5JE6p9Y3zxe7K7ZM0iQOZV4qteFIxDHXA7pvsDknmvspZcYHO38baRA2LRV
	Hnssqsqg/yMD9mjOjPBrFILkHv1uerevjn9T7b0RsbdRiT3Nk+UxMIeOMyuqXGr6pqqxiHXv79f
	kseBLrrK5NtlBdbbtSPRYR59ah6fXn77Xn7SzVx+pUgj1A1uxse1tKfJ732vt0YHCXsKtfVXSwl
	0z2UaXDzC9LhcHrnNucK2gHYaa+eazJ9HTSETajUuH/PNI3vANeI8hLP7Yzpw1rdFUMHy9zWqAs
	JqNzSl/6gbxezECigmhqaRm/+5gShe06AHetRlii1lZDP+4cfzzFvlBsV0fLbu1ps89KoO7T/VW
	tfQPL/MoeEoKMfwpj014=
X-Received: by 2002:a17:902:fc4c:b0:242:9bca:863c with SMTP id d9443c01a7336-242fc38a0f1mr34907625ad.54.1754987880436;
        Tue, 12 Aug 2025 01:38:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGnaHE1ZpiwMNn4UsN08f5Kfog+omLIJ5L0j2dBUjCm2KGFIcXRJMShYCrtbagzF0cmN8OXg==
X-Received: by 2002:a17:902:fc4c:b0:242:9bca:863c with SMTP id d9443c01a7336-242fc38a0f1mr34907345ad.54.1754987879947;
        Tue, 12 Aug 2025 01:37:59 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 4/9] coresight: tmc: add create/clean functions for etr_buf_list
Date: Tue, 12 Aug 2025 16:37:26 +0800
Message-Id: <20250812083731.549-5-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689afd69 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=HgEQyz239O5rJIWi_rYA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: QhB0KhGvhGCx7M8ENRjrr9IvXld2t1kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXxQe2iicjOV2Q
 c4RDDz29DK9jBY8mgz4npw4wSbUXVICcQwrQJU6q4/0XV3uwUypmtVWLxt3aj/upQKQEEVXrKpd
 mdbPRfCqjpOP/ARuNfHCJHRgq13P9Sh997N/b3fjjD9OzsuZI42MOmrOnrODbHfa8UM3hffOHRb
 GhB1ge9S3V+5X1aHx8ipUEydUUIg1JtvSVJ6qcXpnthJELRuCaFda+Z8Aggtw9CmeIdbHpK+k9f
 uWWjKL0CNtungYZi/Y4DE2vLjshs+HefHHdGf5PWTru9SCWSigN7gQ8GfbEMoQp37P3JniBpzyW
 1az4EAkaQnMTTDOokmB/HH9IAva+PnIFmrRPfPuR1XWa1Gp82/7i45DtvGh09gytQ1D6Sh/5mgP
 Sodc0/Ga
X-Proofpoint-GUID: QhB0KhGvhGCx7M8ENRjrr9IvXld2t1kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 94 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
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


