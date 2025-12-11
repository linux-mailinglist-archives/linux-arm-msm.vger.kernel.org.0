Return-Path: <linux-arm-msm+bounces-84983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5DCB4D88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DE6E3013554
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B172877DC;
	Thu, 11 Dec 2025 06:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTkJrmAr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3u14t3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20B227FD54
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433510; cv=none; b=TyJsaQUD+LiHOdZKdDjI6tTJ8uWSNy0yUuJXzcTLRdNyrPmuptdNRXuDpW9rzTIqjkEIEsxXeui6EbMXkqrWBcuz9d/cewVHR18IvHQwAmXi6H3SvWzTFCgrhs85QKaDvVxyTun22bzgZj1MG9dn+gRX34mn5H8Tp1jSyHXKMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433510; c=relaxed/simple;
	bh=DQTHwrw5ZG2QGJ8ed13ET3tSu6napM1SixB2aelNLzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlwRUxNMUGIESUNgwrXLVGM89lrfz1RDZ8Smg6hZRt+10neRCl0wvRxo2ohfywTdneZTkjky/r0KfOqwc7e1wu1ezm0zrplY91hUA4ZEqt8N4w/CB/4kINkNp07TF3qJvDFlsaIw+zeLiQkrJoGQEU0WctevO6yDIdP5EBA/AEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTkJrmAr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3u14t3r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPs8x3736573
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=; b=HTkJrmArXClaos7w
	JjNQ7XvcPeP15C4UtLIUu/Qe209BOCYhpdXS5z8zcKMZG1JHkeu/5sXDKKpFSyYB
	VWtNOeFGNA0h1qM2m9XthzunymYW1lJ8vh7NB5lhOSOM1H+k6GJcLrJoC7xKGepe
	iQZnu0vzw26jXpHIwo4FKW1DcL0pKEzLc0c5ruRAZxzod7LESH93B9st97j4ot35
	9Lo6n3gorcTQdu3rfAhMxxJO/EuYZgzB/SLpiGcI0PBjM1BplMWZZBpCjKJhLlHy
	sKhUcL85vynIU30/H649kOL0VdSsfAjbSJ2XTtKHJ6qwv5z45CIFyfa562TpXB9Q
	Iklxfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0psbbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29557f43d56so9002295ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433506; x=1766038306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=;
        b=S3u14t3rfAeY2nmJJbzgx8v9VDkbr6YIwxl8EjoCpOiveOqpNkYZvB+r3+DEgFBct6
         kxj/AXbeIffgkCEJDZgeu91EJIqui7SMmcKhFC5z1m197FnL7dkZ40EcfBEHgyNWAkvq
         b5JMdPaZY1pbUxrEIIckTaJsyoHGZ3CqJmVVaOka8jSub74/H7giebqzyys8+EBlp0Qh
         IS8yl6WFstWOjwLhaF3+NDC3SqJ+Ioq0JXyGk0R6s9hAvswfppA56ulN09S7LSSuG0ry
         VO2A2CQU6BjHdV79bp+Sc+wmgC9GRs8rhWI3fMi2JLa1j8I2r0LRPcWo6kAG/YsQbs2a
         1nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433506; x=1766038306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=;
        b=NiFSVGQ/Bm4m4F1pAv0QQwsPMXYuq20KfHERIv1A1hS8OcasUN+4u89ux9JBjh5e5X
         at+kFpb/zwohjNtHTvuhF0WlwO24UzeG3RYxGIhZUPLzrUzd5WvXfBId8SLAkT5fnAg9
         lg0unOhDMroOR6N4qUviHfeaVTkb12xHsXybJRd9gevdtkDxiOqNUpSttW982EKj97bD
         vKNVgIckuK8zc3l25ZkrtjZVnaYLsmqfjeSGK/0UYZRf+X9nn8rn3watdBQCchaeEhEu
         7/PWRenEApho3LuaDS8BFAcptCeS6JjggLHqoSVhNBukRlp17lJOw3gN9F+nmo7NwD4j
         m9yA==
X-Forwarded-Encrypted: i=1; AJvYcCXegkOSPub2eki/D84QgPh8GCx7RxtXCmk9mceHu1MiTgjAVIwFLfwFaI3hdOVmSag6ZNGCsWHt7Uvy9cOn@vger.kernel.org
X-Gm-Message-State: AOJu0Yznb1SOZmIMnriuKhZC6NRyQBAEwByQJsuUzDuV7eBYXLrDLAd4
	exaSe9QclbL0EtvLfnUKdPyo2oDhDpeWUA8EARG90AfhgnYg4YQrl6zWlxDMDv0V0WmwD8LuW5e
	wcFpej7MMaAAhCPBbsM79EkBDDRkAHqiUx97jbqEIesy7aj+6KcpI2zmqCOeSUReex0kmrUpW7t
	22
X-Gm-Gg: AY/fxX4eviIy2k12hwnd2inV+PqXUJkJsLWr49lsIvEPmKRH1NhMF9aj1rGTBQ7BV2M
	Twf9OXbMTZ+Aqwx1NzJF3qMq8nB/Y8LTKXNkRQG8ydnTFwR+/C9t4UIlOd6y3OKl5ZQ7g4Kk8SX
	TzwNUrT9nBA9YtJPU7kpksnYpC2wB2/5Q5cS3DJhdLFJ3gtM1fcWyVkV0W7U32XvqWgvGuPi2iw
	WHUKCf1G/E+wIovPEtJC1iI2TKh/JlvzcYc4iL8mn30/M8GlQ4mHwEiK86OpH6mrZxqTncnfvLB
	rg8YwY1fq8dEqMbtNnOaztKH16notYT9jVebeifbMucsxn7Z/Ulm5hRnedDZ3A/I9Pz2xseZnw+
	AlUJq4vjkFxzUf6DiwdOgxVqw1yraR8LaTF46eCnTeK+9bW0MKMwYOeQ93JYgxR2ae3W1F0VU
X-Received: by 2002:a17:902:f78a:b0:29e:9407:a8c6 with SMTP id d9443c01a7336-29ec21c39fbmr55048645ad.0.1765433505712;
        Wed, 10 Dec 2025 22:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmhJey7P5OEZrYWh7Wf9CUrfd97GYN8XgIXtdEl7Uj684vfnW3hEsU0thBw5cWALdWdhY73g==
X-Received: by 2002:a17:902:f78a:b0:29e:9407:a8c6 with SMTP id d9443c01a7336-29ec21c39fbmr55048425ad.0.1765433505189;
        Wed, 10 Dec 2025 22:11:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:44 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:42 +0800
Subject: [PATCH v8 3/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-3-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=6191;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DQTHwrw5ZG2QGJ8ed13ET3tSu6napM1SixB2aelNLzY=;
 b=KHUcIR//SRmrw3mm6deFgt+0KSEPsXQ3gzPI5c/pvQ5SC3KRSF/PqAfEsQTtz2AiWcOvmgPp5
 FqXVtMzprI+A6OZK9SX1hmRkFq6IH659oF6mhec6Rh67Sj3zmGYKGd2
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 5Q3K-1n4nGW0hIdEZmY7I5F1vQEcnW4x
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a60a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX/S6ku0tu3Vov
 akixDl/5Hf/RK5+p9uUJDQkn4u9J495I/dfS9MH0Zm8mzdSkiNxel+Huty5NCNaNZVfOrOKPeGT
 2NB6CWd08++23Ec1R1Nxjl73KvRDdc48OTkH6ydi6PwETEAQSp/bonioyhMr585qL2DbYXMOj6F
 uOco908YsUT4LzyAGUeipuPcFmdm3BAqa6clYeexwL3x95PYHbyg8gkUCkhq8ctVL8WpW2AAxIy
 KFNALLvA3e5x/1SMfrNqRe3RJTSvbjBrftXo7kLU6aXOAhINzvasngFGUxQNKxdo2DcGT8b6Oe7
 DRX8JMONbpYqbLNQIN1DMpl86FW3u8hk0izdOycKI2lJhqi9+RmSVb9Tf0NTr+WA8id2DjMCe1e
 WxJQE3iuBxcR9+dCZq3b//oF4hAzHg==
X-Proofpoint-GUID: 5Q3K-1n4nGW0hIdEZmY7I5F1vQEcnW4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 19 +++++
 3 files changed, 114 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..1ea255ffa67c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -840,6 +840,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e0d83ee01b77..2b6ca1f8bed2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1919,6 +1919,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
index 95473d131032..9b3c4e6f0a5e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -243,6 +256,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
@@ -445,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


