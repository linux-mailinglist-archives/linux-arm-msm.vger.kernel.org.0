Return-Path: <linux-arm-msm+bounces-66678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EFFB11BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB4D35A3D3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F782E8DE5;
	Fri, 25 Jul 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HluR3SDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEF32E7658
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438115; cv=none; b=eXoXpU0r7QGrRsUDUhq3RUPumjOhQ33TIiHI1mKguc8OxebGnzpNP9Xl8ZvIn8UxPAKRko/N0FwW/BKsyz2Ttclc14ndDqvExAXryhmRcje0QLl4a6MV8e5/+tf+1+hB3SafInEosRmFTo0KV5MsIKNU/+C1LcGE+9rCDn0hqTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438115; c=relaxed/simple;
	bh=ZyHMvwBUF1pkw7TFx7KinmvBHACKhGKFo+vYI2gFjpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=llbbq1P5EPh02mI1xtzq3+9h/fLC6JLElzHcoLWyR6Vg4YPvPqNX2fa3d+9dKGbz0RBZS/CUMypdBTvrA/2CK3gfdfNThOgNUBeWn/v/BJP8FcYL1M3v2hcDcGm4xEDyw2V5tmW7qDZpLY2mKEWsdPK7A5hopHTPtXHVipMb3vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HluR3SDN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P88cPW007981
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2YqOEgeLutS
	X9CVrpfaHefC+VimpWLWmNeizWKJy0PM=; b=HluR3SDNJWRBzEi0txvIu96SH43
	eH3L0CjTahw9/r6tkys2e8YoDzF1hOgQxI92V1SobmDf7/b9DUUZ5+3PPtRGSC4R
	5n9WsM4YWCwLxhqDrcwS7k3NQuK/QCMSs1/3PRkee2Akw/I8dkuEcEGQMKm7lp/M
	WMlDy6JnzjDYgYCx54faUfqxXnCLRVyKL1HxnJjMusY/j46fqta0zh1FIPhtIQSS
	aYrbVOUhaUcUqYTkGX2emBzyb2uNH/TPiXcUWIw8uh6VAUmesY97fVPABLQlH9t7
	ox7+4mP+BcgpE6I8GtdqU8MLKlXBXeMGUqJZdc7EySpMx9nRIccij+mXGOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4846590b0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2354ba59eb6so31750905ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438112; x=1754042912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YqOEgeLutSX9CVrpfaHefC+VimpWLWmNeizWKJy0PM=;
        b=ZZlrQ2HQUY8VwJDOngdRNbB+rEnQd43PFjbB0DtCsQ6Ov9Y1FIHPUygixykshi6AcO
         m3Pv/einc7c8NYz1kRl09PNHmEeEkQKJiotbDKGdFCjKscYLGVwHVRrV3G0sCF/z6Lb5
         svGuead3tTeWjaM5ZUSlNRkwIj8jm2/oZUDYoshhUL/1puqqZfUzvqAfrmLyOuarxV5o
         EQcUrDXDGLHhJc0+I6SH8r52hIBEomGBi9/wnzCu68YtqTRlWC+zzvqWeRNo/nMjiSdX
         AkUXFZMNlffuZqvcxFbCKt4DN8o062KfrPVPsukayiyyUx2JrjCeufLNUgpCvcSw3mQR
         O3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWuURckPbHd0A+/6DpDTeyGdx8YJRuTCn6cek0P5fodehzusy2h41eth2FesFW8kax6ILqz02bm6m1UfePg@vger.kernel.org
X-Gm-Message-State: AOJu0YwTX0fz7iPS9UOWO5Xd5ALQhVApDHBKEZhNnRY2TtImPEdI6w1z
	khDE8AQv0gz0YG6fhgtl1Crr+yOPdGSXAErWXsuxUVyiJbiuvDqjqPu7mECgBX9Ya6LBSpQNlhQ
	9qQ6MZWT99kEiyDTwEdyTZHmf86HfP5uKjaxGkYu5EFWafxIVImRr0m0scyYgPGAUx2Rd
X-Gm-Gg: ASbGncsM7GC5F/C4wUoCkS91+q3yXerGr/mozsXetQS1ESVeevl1GVsXy+Zf/zJQrw6
	A2tkryPjVNoN/gWeqIrAGfQuXZ7+6eP6NrDWNTxx2HUJkLV7C8bb+HO6hElLNmhK+4VhX9qx5a9
	96/Dxuu9wuS3XZa3lBaV798ikjcsM4a+mFtNreOHxkW8fzAoJK0O0JsGT88kwBWIpf1edYtk2+b
	da3823Hm5QrFJBTx4UK0vPDAm8XTA7SPo87Rs+ksfAdAhIbx4XItWRqMXEliF5Y6E4fezHidePn
	hHTaqYXU7Lt/BxPZmrTZ3izPkYztx4DJJtpjz8go7/MtqAKymp1w8VDNMXpFTtqp2yv53CLqnWn
	tR5iwLxAH8GwXmXqPKQA=
X-Received: by 2002:a17:902:db0f:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23fb2fd1baemr22233045ad.4.1753438111492;
        Fri, 25 Jul 2025 03:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOLZD8/aDWH2qNW5NVOA0ligfQYzNPA7Lh5E8L4mgDT12NfGE3Hpw1sW1jO1CVrShjGA/02Q==
X-Received: by 2002:a17:902:db0f:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23fb2fd1baemr22232445ad.4.1753438111056;
        Fri, 25 Jul 2025 03:08:31 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:30 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 04/10] coresight: tmc: add create/delete functions for etr_buf_node
Date: Fri, 25 Jul 2025 18:08:00 +0800
Message-Id: <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ye4Bo0gBgVWNKupOp3yjrqm4oNVlnWih
X-Proofpoint-GUID: ye4Bo0gBgVWNKupOp3yjrqm4oNVlnWih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX2hB4IiZ2RENz
 G/OXNKEU2GggKdYq0utR7KGr6scRL7cqGPe8KJhiJuPXI1hRL5zM7IYINQQi4FGRrw9a59sil5A
 tJV5+0REvUjHGhMwSuOIuhwbUR6p9fBiUhGwUoObtDdVmtJbGlMO2ot+HaPrnD9mgayToO31Xni
 y+p8+8/b6+OEnDML97n2I+kwTuJqFoXNVyuBC1ghWVuolbd4FvnAyvWjLZJnpy0TniC63jT+9aG
 gtjqUtPHX/XGNp+JjlCa90bJqTT0l+c3NZYrgGC7NX8fcl663d0qxSmxggYzuil8kspPys3fzgm
 alpVBRRZSIK72ED17cdE0rzSNa6WGJQ7jMw2Gfi+2R/NDOPwTF0aX+CAOo2rUdVzTi8jTPkwrlt
 nRcqFANXe9pbuwV2LwJUeJevg3CnBDPQLjTdh2KirVWcJwCpL8M2XnReQDE8k6uBpfSdNado
X-Authority-Analysis: v=2.4 cv=Vo8jA/2n c=1 sm=1 tr=0 ts=688357a0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ILCX3kR9VMWRWyEhewYA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250085

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 65 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
 2 files changed, 67 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..e8ecb3e087ab 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,71 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+ * tmc_create_etr_buf_node - create a node to store the alloc_buf and
+ * insert the node to the etr_buf_list. Create a new buffer if the
+ * alloc_buf is NULL.
+ * @drvdata:	driver data of the TMC device.
+ * @alloc_buf:	the buffer that is inserted to the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
+{
+	struct etr_buf_node *sysfs_buf_node;
+	struct etr_buf *sysfs_buf;
+
+	if (!alloc_buf) {
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf))
+			return PTR_ERR(sysfs_buf);
+	} else
+		sysfs_buf = alloc_buf;
+
+	sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+	if (IS_ERR(sysfs_buf_node)) {
+		if (!alloc_buf)
+			tmc_free_etr_buf(sysfs_buf);
+		return PTR_ERR(sysfs_buf_node);
+	}
+
+	sysfs_buf_node->sysfs_buf = sysfs_buf;
+	sysfs_buf_node->reading = false;
+	if (!alloc_buf)
+		sysfs_buf_node->is_free = true;
+	else
+		sysfs_buf_node->is_free = false;
+	list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_node);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 52ee5f8efe8c..3cb8ba9f88f5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -461,5 +461,7 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf);
 
 #endif
-- 
2.34.1


