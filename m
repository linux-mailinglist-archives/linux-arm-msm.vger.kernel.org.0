Return-Path: <linux-arm-msm+bounces-86513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48BCDBBF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C3E530480B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C04313E18;
	Wed, 24 Dec 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUVZDb6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktv+RENq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D290A311C1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567235; cv=none; b=iZVt7jekJu2+V0mBwixeoat4r9Hy4+0qprZv5lMh1c6OePuFVnXis7I6pOCm+XkaagGiWXijemtqQwvo2f6nqjmBxuiU6JSHpYrpdK2lzGllWMurR6fZytv/vMt9cVFE3xjKC4+kDtDntV1oJsEFkRC8r/D3oz9JGqlLc8csfgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567235; c=relaxed/simple;
	bh=DQTHwrw5ZG2QGJ8ed13ET3tSu6napM1SixB2aelNLzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R32V2jNrCm0ktdgFxVbbkYH+I/OdbWb9ozhDnGq983YiEV+lsPCBAD+LpzqW3sh5st7Cfrdzg/X9wcTd5rKfYSqrBJhK3I4oeYGaM7MC7CPutrSJfn0305z/wln7eXJb59SeW1gyq4wdWSl4d3nqo9PtiqS68O18zp4foea2r+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUVZDb6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktv+RENq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7Jo2l1246312
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=; b=HUVZDb6sIubFr3ur
	KfOD+Dui0I2bup1HzqpAQ2uG+49BeSS8aas3QyLBKvktk2Kaau8MyZYuOrEWNk8W
	fYELGZoFtpm2wuALGq0lS8NH3ibMcAV9Gnr+krOex+bSwnH1oo8zqf1qCGa8pLGv
	9/s4qC9oND1P7z+JA7XbfpQX7UhkxtbXig7gQbA2oyjP0dsgL6bKbvc9HLN9Si8i
	IcSG4R9E+69BkMoQQDrzDvVutNn+pcFyk9c1Go8Yu9gtGGR9vu03xGdpbEVr37K7
	eSTZnS77eHykS2SfmRWzMLDRxcVAAwv46xvA7lfh+1RXrmcTo26MywkPGwjBcCZl
	cWoraA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cu2jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso82824735ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567232; x=1767172032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=;
        b=ktv+RENqTOlOI7tN9yC38yvNUl0TixEIfRtA6K2WR21iwejyVFWJVA8b9qYzxWDpkA
         BzPR1z7LdBUQtsDqREo/lcA8UxcE2g9MeZisLqm2LOXEyFQlh0HTBA3MgubfSFvsPUNH
         fdVrIfZYKS2PV9ztcaeKb0VjSvQCqV7Ct+bhLj2Dd46ireww+Ex4HsMIb+Rw2VmIhbrv
         bF790pNdTmuvU73DgsANltmYNVdvNOJ4HUARYXCkci7icoNHwhMtgO0pG2GIkW301UiH
         vdhWcgsUbjxyW+4yMfIZrsNKl5JnmyNNcKjKuZKytUEdUzBlqKnn6HOZQ8sSPdqvFjb1
         rz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567232; x=1767172032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=;
        b=vEMw5ifmYLdkn671sZNudgmw8zhMc/uAC+u2/+NXLLfOIoKfnSnBXyqB+nPQ5bYCMs
         mGiczo3tx5qy7k1Kymn78YShGhkkqTHkUMsmR6IMXdSDgo66XKgZmQqNFXQrElrE1N+8
         C01T6pA2XmFOMEatX35+yuy4jFT9t+a2YDBtwvtb+vwpWRe91PqfBj6lkNLa4w/exWT4
         metfOenHBIj9o+TXB9StacwlmslvRWrY/3Y6NvlCXw0yyPM5hzouDnrjf7RzZ7flolO0
         XaHvGjLyxTKEXfbNdxivxTwfEXL7cxB4EOCd/oTnKS4jWgIFmip+ujGC5+8sUyWEG2BX
         VMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoXmw2+RwZ2Mbdqpi90I+PzEIuUZrDe0z8+X9mApGnyfHRya2HTjx5QW9IC3k0GvLH637ax6hmUBaqAdyH@vger.kernel.org
X-Gm-Message-State: AOJu0YyOBpwaBiQf9n6oyosffBcjcQ1xsrQCCzBdxAtGWzEC4EpPvO/S
	nIbQ9w6TrH+BjDNSjZIEnplI5Q2k7D61L4n9Obdl+wyB/serIqoqlhMwDTugaZ4ajPK4RfS9DRz
	EgWwCvUDA/P/A0A2PLu8XxuoXRiGZ/mMdWRnOy9698ULTKgC3y1XKmXsMRGzH8/VYNvHa
X-Gm-Gg: AY/fxX7v2Cpns962icDkFgsTdcU/7iDl1/GtlKKAYvaHg+GHxxaaUsIqruqgaIOsaqM
	a6tTXLrOXlBxTiytCe4srnO6w4Yx7skamnUvZVkS9PtSEpuC2gmA/vIdc+cW41OWEQyYe3G47BI
	wkKK9gKnL14uH+vGe65OUaKEppkHMegRZH/YIrrPdCRRo7vbba7JYS4hUYkKUMvUop8OXVI96QB
	LDdJ5TLu3pSwDbhJijpwLrBPcmgMY6NNnlqk7X7qExVz2b7ZYLftD16X7MYmKb6R+9xNykcH9UF
	iwo64LjI1Wds6k5/ouyrqJ6DuqIdQBzBaEYn0s6GwwYxHxYAHpFcoUlVA2WDxfSBy5b0i4q1cjN
	QARtSvdpwClMWTM2xH6N/FL4XvsfgRudhFeokJkugv0bsGVeFyAfEq86BnkJoPxFfgYtEVDlh
X-Received: by 2002:a17:903:228b:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a2f2735298mr158517375ad.30.1766567231635;
        Wed, 24 Dec 2025 01:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9R4j+4A+H8ctHEtX19Z9Z16cJ9cTeGwAKw7LskVs0+ffbYTqFmG+XNTiuFk9yR0FXsiA20Q==
X-Received: by 2002:a17:903:228b:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a2f2735298mr158516845ad.30.1766567231081;
        Wed, 24 Dec 2025 01:07:11 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:10 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:12 +0800
Subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567215; l=6191;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DQTHwrw5ZG2QGJ8ed13ET3tSu6napM1SixB2aelNLzY=;
 b=YVcHaQwkrn2AAtWFiqYdJr9AiveFl+f25fpc3B8TfSHyb4UoTyTk6ns89oIx1UcuHl2fU+b6/
 qUzSCoXYQs3CI1p8wZN5hXIQ4BaMmSq8XR9n5JvBCbqRgq5I6P8FJrm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 5v-GPVILBTdJWesRYwQ0V2ASHZ_Pm56B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX5lN3SAFvVhws
 1WV39jWWVfMsI84UaHe+D4y0hieOIg4DzSVV4cPbLmf2FqGh1vryd9q8EsReWKF2SF7MnLqUwJB
 QuG34peDTgUEb25S3GYV2+bh3Q2F/OkFYROZOiyr+aaAtBbKVESrqEtMAJtr3bhnn4ufYb4CrTf
 KckCrMR8VSAZQgb8AIEjTC8JERqT8bXvU8Ltef84dAMM0bLPZ4dqWUevi1+7Qpr3+TxP63oIvsQ
 R/vIwlM6z2ESFJUdrnac0xNPdJ1qclkqSy473AxcOImEtpLaJ9KOQwO+N5X9Rl5Jyi7xkuRrZQ7
 HYPpR0XiS3v88XAkBXYjXhLKSKr+Mf51XPS9SUQF+EMuaIPsHEcDjMcw2ULKdLBCKYbhew0gEDC
 wlvoqLuoiAwfXUs8pk0ZYaeGlPf3ZmPQkALHpVZyZCQzRZXMSV04dciaJfBJVfWvuRnVRAklHeN
 TCXYRh7q7Mf0I2aRVgg==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bad40 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5v-GPVILBTdJWesRYwQ0V2ASHZ_Pm56B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240078

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


