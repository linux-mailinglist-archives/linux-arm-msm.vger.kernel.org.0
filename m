Return-Path: <linux-arm-msm+bounces-50790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5762DA58EEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE7D188538D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 09:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AAA224224;
	Mon, 10 Mar 2025 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dBU5GcSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C34380;
	Mon, 10 Mar 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597504; cv=none; b=byM3/6Wo+pNsq+Cpeo74MnMbfhh027ICKbBXdDZRRYTcDT2loS8pE3DglHdMwje13iBLMHF3+1jzjHq/ql1K/aez/o6Ak1QaYBHzz9L41h8aSrPNyHvc7rCxM5/sX4NW7pREU6JL+1LpNFxLd0RNcVPpyvXvWQYooFmzGqcbU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597504; c=relaxed/simple;
	bh=9e4H2rOnPYGPDm/9KeG8ykhPaoW+GmadYPr+uX/QnW0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFeeIAX3Z7M0s/d46sAVlnkSnpZDfX1PI9zvCgMiNMA0YTDYZ+eBL8aN+v9QoCSp8QFk9cEoW62ztHI8NSd5geneWQNdh3ii/lc5L9eO35cgD6bmxpLfOglHzMOU4M8foqxiQgReJtjjqo+xBR1L9E45tr4PX6Ek9tKPh/VLPtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dBU5GcSk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529LDiLj013127;
	Mon, 10 Mar 2025 09:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/y3ccLGRS28rbxxS8x8ptTcuQEA4QZ6Z9IHOOS7Jtj0=; b=dBU5GcSkVasDyJxG
	iIXVFoftvoQLIGg0srMZe1xG+kTM5vbY3UXB2Wxl2mVfe+TTFgRc14zO9yveey9k
	AKnnD+xXcxZaz5mfPh8N57mlyqOf/Hg1Yy6TDtPht36kfhyGMlG2yoiGmFiygCq+
	4uRsRb37m/NBw5ths8blzuLpjXgLGVgFirFXJ1T3l4gryx4r7xwfIk0qvzRCdQbR
	2aqduWT90FHfccVxKulXym0pEO6YIpCLtRNXzmjW7LyhUm2oK3N6x+6ZmxCgPSp8
	LhQsr5NHdb2PwcWQWCJmuxegzunvOeJ5Oc7zWQo2bzJOkAQ+bQWvc6ACb2Kc10g8
	gLCtZQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0w4869-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:04:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A94ccn024865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:04:38 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 02:04:33 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v1 1/4] coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
Date: Mon, 10 Mar 2025 17:04:04 +0800
Message-ID: <20250310090407.2069489-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wFn8xYvhJG6QyQN_corUmwD4YwxRiQIf
X-Proofpoint-GUID: wFn8xYvhJG6QyQN_corUmwD4YwxRiQIf
X-Authority-Analysis: v=2.4 cv=MICamNZl c=1 sm=1 tr=0 ts=67ceab27 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=NC6d20HEQiqhJ-MTNCwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=576 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100071

The new functions calculate and return the offset to the write pointer of
the ETR buffer based on whether the memory mode is SG, flat or reserved.
The functions have the RWP offset can directly read data from ETR buffer,
enabling the transfer of data to any required location.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 40 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index eda7cdad0e2b..ec636ab1fd75 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -267,6 +267,46 @@ void tmc_free_sg_table(struct tmc_sg_table *sg_table)
 }
 EXPORT_SYMBOL_GPL(tmc_free_sg_table);
 
+static long tmc_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	return rwp - paddr;
+}
+
+static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	struct etr_sg_table *etr_table = etr_buf->private;
+	struct tmc_sg_table *table = etr_table->sg_table;
+	long w_offset;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	w_offset = tmc_sg_get_data_page_offset(table, rwp);
+
+	return w_offset;
+}
+
+/*
+ * Retrieve the offset to the write pointer of the ETR buffer based on whether
+ * the memory mode is SG, flat or reserved.
+ */
+long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+
+	if (etr_buf->mode == ETR_MODE_ETR_SG)
+		return tmc_sg_get_rwp_offset(drvdata);
+	else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
+		return tmc_flat_resrv_get_rwp_offset(drvdata);
+	else
+		return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(tmc_get_rwp_offset);
+
 /*
  * Alloc pages for the table. Since this will be used by the device,
  * allocate the pages closer to the device (i.e, dev_to_node(dev)
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index b48bc9a01cc0..baedb4dcfc3f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
 
 #endif
-- 
2.34.1


