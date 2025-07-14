Return-Path: <linux-arm-msm+bounces-64757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A7B0372A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9E533B9624
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F70622F76E;
	Mon, 14 Jul 2025 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIAP/AVi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9422F772
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474706; cv=none; b=XAgqZMXleMivlgvnKzeomrtncXT/04b8GgsPscsZGVLDvDp6HccCF8ork53FurxiMiTsRF7LlRcG83ykQOfw4vn8+hcGsI/0SEqqp2Y3I3fLVY3rT32KFjJJDg83atoKTPNj+1eTu9yyWpix1k5w+OxGZM3jAFTrbNoo1+yIirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474706; c=relaxed/simple;
	bh=Anj3jVW9a+Pa1dgOxWLH7M4Crke2Y/IpR115q+9YWQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WGpZ27NUM5UPH6ZnXAUXaA4aIGymD8ie3eNy+w8jGuV4zl8TTIeht9m1jfGQVHCkEGnBUG2xz6ZdwkscL24/f3/B7RDc2iBD9sttF7MmrBM0K/Yzg5YLK9LhhtdL0esEoRkr1Tfv5M+SNDFca+gfexufAdDPx8n5d6o6cXSLqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIAP/AVi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNA3A4032297
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CaPwqYvTVd6
	rYAiU/xir9maSYh3Xig6TJw800PT+f8A=; b=CIAP/AVibwwaQKo/HPypRB6/1v9
	Bcwr0AVerASWL8pYyylS9NYngBOCCqsyfnOiJdHeaHgCHkpKN1fAVHViHTkdhfab
	0Tl96Rxt3rYN+NxBz3P83rTqVNP4kf1uPrOcix/nQ6yXWOTzfSOnsEmO2zgPvvaR
	4Mfa4kF0S7xqb3TUl2txRsld+0E6TMZSWQAgUeOFe8Q+WX15skVXYGWTUVnBk/l9
	XnGuQnUVUFiic4qi3H24Djcibm5xgo0tec0og9EPHyU2Q/hll1aLz1omOUPf/lMX
	GPZYbkSnmp2/Vs/H1E7jbUe50JP6B9CvuGpNccrpaCJteyfAOgMMvtblfMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbbf9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235089528a0so43657085ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474703; x=1753079503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaPwqYvTVd6rYAiU/xir9maSYh3Xig6TJw800PT+f8A=;
        b=IzlyIZnRwoWW7EEhawxy3MB5eLrk9hqP6dTxCMTWBWZwL5mEfjLJ4tHPpWPSXRAHho
         Cf+ovtQmaygZWQME9/csHK/rlodllM6Di9zEKm+sGSs1zBiY4eQ0kpoZsVK4wGGZ6dkH
         zLx1W1sClughYKqWkHrOSG8B1r3AIlorYavgJgc7Pv3oJgDCuSIC2eIui66K7H5YmPmZ
         FkoN4RanrHRo4t94xlkpRKan/Nt55lh4qQTF2kuvi23rr3PLpJF+LRA8dnqrk4/bxkWZ
         jOtkl/SVZqxWSWhhbbt6cyRgJjGHlmc2bNvAff2L4bIboUp9Qah6NGZd7lmQiBcSLNZn
         GzYg==
X-Forwarded-Encrypted: i=1; AJvYcCVWOLO6Yyjp4qm+Ns1fNKu3Ge2g9159apiYGcLnd5S0ZdF5yplqpzbDASymt/6NvAMMDaVW97GydJhSdfRL@vger.kernel.org
X-Gm-Message-State: AOJu0Yygfl6hM+oVkDKfC2aQ4hgkcMzRROMlKnzZpK7A0E0Fi9HXxMGk
	vbIPVUlDhfgY0d5vOtu4ICC5cMIWO20+9j8JFyFM9Z7F5UctlVxVI+Y1HLXMPXK+5l8eZ6P0ams
	eVXjw1KFURGfANwasE/w3o3J83zs0XMZwuoItvUgoXoxlo5zXUnllHSLl/Tjf4iEIinl4
X-Gm-Gg: ASbGncvFzvDBUA9dOQY1I4r1iwpojCijWAmL3uralYjF/9Cnai2yVjqv3NjsMJUVkNm
	75kmYU1E6mZZCYA6e9MM62KGqo6LfN3gs2KssU6Wo1c5N0lxbyG52BVlIOyKQWDhS9D3KUl55ZN
	yI/Xr8JZsnhNsOGQX8oo+ZQJI9Rm9+yvmeFhbifiWBbiZGmYb62xw/UwDjTDq9xsW9hfu29H1Ph
	8X9Dg8K6utOkwIPCH5hH6ksEOcc/2gcHZBw80JCtp/2ErBRM/tfLGaWu9m57z3o80xjLfGNbYRM
	7iGlPJ5KaJ9YMaSOEylXmqicWL0FGJkCbBN+JGIbXXZI2A3nWrqQlCnVCe9p/W85027zlMjI2Ju
	qu1+pkJ5rIP+mIALklGVq
X-Received: by 2002:a17:903:5c8:b0:23d:d290:705 with SMTP id d9443c01a7336-23dedd025ddmr105838885ad.3.1752474702537;
        Sun, 13 Jul 2025 23:31:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIkykQ3WqecYjDRbZoeEMeEsOtdC8V/Wbi6Wo9FUj1R+TiKBYdYSUZ6wn5yvJawhfA1R2lWg==
X-Received: by 2002:a17:903:5c8:b0:23d:d290:705 with SMTP id d9443c01a7336-23dedd025ddmr105838615ad.3.1752474702091;
        Sun, 13 Jul 2025 23:31:42 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:41 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 05/10] coresight: tmc: add etr_buf_list to store allocated etr_buf
Date: Mon, 14 Jul 2025 14:31:04 +0800
Message-Id: <20250714063109.591-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX7Qj2i7Dnbe5D
 EdO4EPoJPckZJuCVksRJxYqYFup0BwWmuQCZ1gUy6BzjzaDCmB4T3AcAihemfNPaPyYxB86SBbh
 ruaOF9Nl1Jvilc8O+VgmVihTURa0WewmBG94m/7eo0V6GbdqWrH7fWGQvogycBEJOQp71i2w/VU
 kfnXdU6wmYBL2tmR9QadCoROAPe/52O2hGv3DM5ChPxdm/sjwRtx07nAUlALmfJ5oiOBcuTlky4
 MtRj/w1phOkgmyZ2y3NSHw1lVrW7TDhmmVG/P+nTQ/6lqQBYu8TKtE/cwep8BPzCauV+pA4/Vfn
 qG2KBeuY7YKO/gqZUZXUS5OupaFlC97r35YlqyB8bjy6ayW5fE6wKU2rnkG5WxLW90ztn7L/NNj
 n8ik+aoN03XCLk6TYjUprAFUqBNP8v8d1OS/xLCuT2KiRhyYehlsJaKaVJXoesaWjQf3e8xu
X-Proofpoint-GUID: z5Hy6jfUEk5yUnIVzCrkysnXY_P6Btm0
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874a44f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ORm1qb0EFYpRwVLUulEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: z5Hy6jfUEk5yUnIVzCrkysnXY_P6Btm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037

Add a list to store allocated etr_buf.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
 drivers/hwtracing/coresight/coresight-tmc.h   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index be964656be93..4d249af93097 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..f6b05639aeca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,21 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates whether the buffer is reading.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	bool			reading;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @pclk:	APB clock if present, otherwise NULL
@@ -242,6 +257,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node:  Available buffer for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -271,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
-- 
2.34.1


