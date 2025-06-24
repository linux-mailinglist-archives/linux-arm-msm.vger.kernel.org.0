Return-Path: <linux-arm-msm+bounces-62155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A77AE5C80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED0753AB0F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE8E2522A2;
	Tue, 24 Jun 2025 06:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1Bqo/Tq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3502512EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745126; cv=none; b=GjPRHWXVb2FKuI4kb3ErspOKZpdlbGrGzP0QXHtz/7UyB5rDEh1f4qttyc1pgc4CZ1F8psut4ahZVeblNqjzJdUSfH1ehNj7cCCOTOsbGOsYkLC1BNFpT9irSucQHyFgyLi3I+RPUECz8+xZ4wjW9iRdZ0yUdtClCSsMdB251T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745126; c=relaxed/simple;
	bh=NXbdrziIeuB5pcaSxjAzniV7Y1VF/HCxTAevsWleWaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h5qgd5KoGrafRKQ6aQgYwKPYadX838TWQd24zkfpbmB0i8Epqexbmv7412FfByI7+KzzWmZKAKTGJSAzMWMkwWeRjvZ8iO+B35SQRH+Ui3PxShOsil9Gw+p4gV0hgx+NQQtWgOtSmVXnbJIr/YryYHJRvzRE1YeYf3Wg34n/p/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1Bqo/Tq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGeAf8021706
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pon7MrhUMFa
	eGhGyVgauqCCEFXCkk5I04yNnyLGhKTc=; b=A1Bqo/Tqq9UBD9AlarPJzaoD2Ne
	KU/qTD72PJzjaINh1EPSAlkXyd0OF+rUqA3Sw8/2qHpbVOuz78ZjNobRnXR5RtMc
	bJ0v/Jb4NaJ2jLzCM4ixTLyFe3E8XyRM6Wje0b5U83B6hJSERDt6xRdwRTVY6yTB
	C3Ip8CgEw3NNaVd+1Cd/GzVreZdFFK1Oj2PPbvIOrfasK9WuBY7GGVc1votFZj4E
	nyYaPI7BPSrRSGYkTzb5ITseMz4WL2520mB/bkntpfEu+icGMAMBk3dZ7qkrPq4R
	p+GBsiI6h60gG6QVfFAEDZMZUxRsuf1vi9UqeW3fBJSy4vDJ06xchJEwATA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpu5r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e7550f7bso463725ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745107; x=1751349907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pon7MrhUMFaeGhGyVgauqCCEFXCkk5I04yNnyLGhKTc=;
        b=f34x7I3ip59kgswGNhne6z5aLzt6Ifb6oNGZL6XPhmKfga1tqL4mvHx6E3t6BzCN7D
         CON7mNbK8QKXE/Up2/Hc/y+m/zmrg1lKv4li0R0WaiOCZ7OcmowjHqeKHnbvL5+mqF/4
         DEZysbQJkqyY94bwzvaDoSzAW6ddyI6cU0at9bjJiFily2M6lYS0XA3H6mOM3WoNHeWm
         ao+KgqFPHJvPwIHRDK8iLRzNHHySUwE2JfZ4dIRSibCh7B5BVNf9QGf4uwQFHjcVUYMU
         MT3yntzSFJGSvEYkZ/Qu4byQ9OzTch6/87zprKZfP+tRE8pmz6OxuXMlaGOrFTgujJCf
         kJsw==
X-Forwarded-Encrypted: i=1; AJvYcCVACDcAh4+cgovaxKYkzSkdFfGVIGOeScqnu70Du3D/4DKzqeWMgJd37keBBuKT6Y0vOD+dAGpZaK7ivC4m@vger.kernel.org
X-Gm-Message-State: AOJu0YzTLVLMX7GdEMdvA9hP00v1YhTMDEPwH8j+ftfJCBn49roZzkS7
	aR+3YffA+fZz3CuYF66vDKKQLwZPrS9jQmh+32HewJWqbmtf3d4JnxCHfcXtvK/clnAZ2mNHqXz
	y9ZwKNdvY5dnMkxRVYQxGBwhC0l9tpMQ/A6HxxKN/Q/PATttOhCQ4zs3pxvF8dMh0RL2I
X-Gm-Gg: ASbGncvEvQOyCww85S4j2mMz+/1Yp4tVG0TvUlqUuGdz2NM3SMHxmKQAAjsLoOpqM71
	myVEHB2Q6sZEX3G0yGmEz/vCCDMxEp5pnU8pczmBB1qY+dopatbN7EIvh1e530skB4f9yzfJWgS
	dR1BpJjzMOqwDj+5w4GFJA8bxmsSa3A4mtHfNPoFGQf2OuZWC/1b9pZJvgo6MVpMuLCSaImOULh
	fXojj6pxnx3Zb9koDmXcwKNZm0yU0AmRs9lc6YZatmqw5fHRk66mb0jtdoVkCDcTX5o8sEXuqAm
	QYVJS92W9vbAcpiBtEoZaw6/6CsCpl0VmyovKuGKNyVtVXW5OfDpcrlafDonDIU4AU3EhPFE37y
	eUQ==
X-Received: by 2002:a17:902:da8c:b0:234:986c:66f9 with SMTP id d9443c01a7336-237d983d37fmr250600105ad.22.1750745106924;
        Mon, 23 Jun 2025 23:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyxi/2L5RpxT7jQrCkp0XQD4t5nbonOAsYnD3NIf9AfeQ4K63zfMYh1t30n1bwNRgtIh/QhQ==
X-Received: by 2002:a17:902:da8c:b0:234:986c:66f9 with SMTP id d9443c01a7336-237d983d37fmr250599855ad.22.1750745106562;
        Mon, 23 Jun 2025 23:05:06 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:05 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 05/10] coresight: tmc: add etr_buf_list to store allocated etr_buf
Date: Tue, 24 Jun 2025 14:04:33 +0800
Message-Id: <20250624060438.7469-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a4023 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ORm1qb0EFYpRwVLUulEA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX1GPaOSqRKmxU
 lEZI5ZDPDBcJEyKukchoZOS1yj53TPvdjBr44kJpv4muBdRikg3vDA4gyqaLZMd2sa2sk8wBku5
 oQJPOmN4rzcWLrj5eu5mjOswO1ShBLZHWagZon0EBsOQyfeuDAiH30QeNR6faggwEC9PVKtv+nQ
 bZ9TnTKumQtm/zl4gdrdhyLhJ8l4Zsc7XmAIEPrNrdapB6bPMdVbEc4iEqlCMgTAxWjktkVuirZ
 xdyR6x27Yrvb95TtvwX5o1LYMeeFKGjYEAvIMMKh8vci9LSnk0jTLZryMfUZ5ydV4aiSfR0E+dL
 ooDWQPS7cNmp0Cy7YiXX3baLlQ/SXJv4PJO839jGV7+RpYF+D6Fh8rmzrUgGFD5WOabDUxJuXq6
 9lyaduHM1AB/EQ/Ksd/5M+Mjqoa81SU+GSrlBdYXu1wJJarXbS6ml+7nHxvC9Y7wv0T3E2fj
X-Proofpoint-ORIG-GUID: URNg9tEMNm1LngfYy5s-_CLzJvvF_QoB
X-Proofpoint-GUID: URNg9tEMNm1LngfYy5s-_CLzJvvF_QoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240051

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
index 88afb16bb6be..8531bac79211 100644
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


