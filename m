Return-Path: <linux-arm-msm+bounces-72457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E5DB48261
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726CF189D896
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 02:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25784202C5C;
	Mon,  8 Sep 2025 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+pWz4pJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865BC1DC985
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296965; cv=none; b=CQaEg9sEmdP/7VcwVj90YBulRlrNZr4Ycr2SboAX7rVL5iDbugpH1ZpEYbTJJP3O4gyplp6+XRDhhor4N3+wOA4PkQCg6nGqbKgWWI86p9jvrhyKSnzkS6xoa1Mv25Tk995ALOXFEufjmeN6O1q9TUcJ1HNN0//a8/4+0HUtTOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296965; c=relaxed/simple;
	bh=J8gJ/mYXIto4Pqb6SCiL46R3ybLriqfOejLtEnfdnig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gst3bsdnzA8nWxMeKE6DtQfo9uVAsBL9Q4cm49bLg/2b8P4Zvj97IsC+ijYAk3lS6NDL9+6a4+o5GZks/ThwE3bg5GTRpNqBKt16hvJvxTWN9WsLXg+VTs7DZZk1v6HmKZv0Q4GJQyU70A+LVr4fpA1GAAg34pNh3Y2971RuWPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+pWz4pJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LREJZ006866
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 02:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ge78CRxNCocviT/6Co2pp0hTuCE9iUxm3FJF2+Bl2q0=; b=L+pWz4pJd9z19SHc
	QhZdQRRR/SitNNd1Bq80X7zjU+54Y/LdnCenKR9GmGnIgN638ZU/qyWU6zjjo3ix
	5Hb25F7SbixhEWHOY40xokMsmUl2IcIn/AtljbAogEM93GPxIAsq+ycfQcAPvqmk
	DzMI84D55YAWFmRlBYOEcrR++BJLNPbgKap8W+LuJwC8Ggt7Dm4poxsefz7BKvdV
	NKBOmsi+q3lRJsovq3Y+w4BcBNHmG7QGv99QRAnNoKyeFPfx9VbJ72GKTSo4h9U8
	Xb3vWPHR/YhrtLd3dlXL4DM1phRUI/lqmZwJQLq+GNBysyd2NA623p4dAdhuACLm
	LXfSgQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8awu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:02:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4fb59a89acso3114739a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 19:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296961; x=1757901761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge78CRxNCocviT/6Co2pp0hTuCE9iUxm3FJF2+Bl2q0=;
        b=CkNVWyEXYC36E6rigtQUf8N0nVw62B9matMJthwSJi656nlq1G30f3rXxJ7q4Bb3lm
         daqpA5GPuJatrog/WYqwrhirjRzmuk9EGL47XBzzlv4EnLiGI+hHMSSCCcuGI88uCHQO
         T9l3X1Ry4LU1iISA5nrbVrKFkMfjelNUphUVRZ0FT4rUykmzav+pkZtcv9n9L5FrIM7A
         u3aSweHIhZHbhAv7SM7aIisfijmjZYOaFwg1wNueyV0SxKFexmnSsGZSCVd3CyBS3IdV
         iRQ0JjgGQdmmVSUSuIGJ2wyLXCkvEqItb/NjLdjsXm4Bc+SGdfKnUDfEkeN4UFCSl/Fj
         dEIA==
X-Forwarded-Encrypted: i=1; AJvYcCVvILa/9miBz5DxMM6Di0f6RmZKeKSsP/ABtvxUIMeDSqPqoiBU1oXU5Vg9oe4J6rC4oR81osqRVSc5yD07@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ypftjWYUwbkt7uLrOgJIoBYcm9cINU1o9av9clnQRmthtcLB
	h+Q0bZ3glESPXilt88ChcCtplMPf3Mhdu5eA/O2pCsmm54podEnFRsnA+QrWfc7pjjAntqNNyZT
	cs0rp0SsBd1DFnUnvp/qshGTD+6NFlqUufD34IenCu4t0vxDCwNJMEPKeelbjxdqZjNus
X-Gm-Gg: ASbGncsTf8IRv2yqj/hEDIL3MWxoQ91y46lAfrjcJLmSHpIzzCsRK1F7XVWqRo1/n8F
	xExfop4xiQ9qT0XfkGulq6FSlEFSYspaU8D1q8odZmkwYKDyUhlrYuuAzdBwnN8A+LHlgKegqp8
	QF8uHNYB6Uf8VrphX+50btvIbetdEctpqeUSESS3jOPx5nBEKNWnuimUPcGasADLer65jYRybHd
	/qCWm8pQC90pgi6lL4Mgaylpbo/CcjnXJk4Bk8b8nUhHtwH0vpqlwFcLWRiTfTmqnV9k8VG1DxG
	TQ/Q/mZ1O4KY3GmNVtJ6HXGY46xxQqCFfZ7obOaWzA4hsj/7s8bfanwRRzudNcbraM5unEnigk6
	V0ZMWeZm/drzhqwgWFg6zIJ2uJJg=
X-Received: by 2002:a05:6a20:7f84:b0:246:291:f62f with SMTP id adf61e73a8af0-25345d2ce0fmr8120745637.49.1757296961146;
        Sun, 07 Sep 2025 19:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmxlgXwobw+6sYCcX7nSaiEH9SoZom4Tkgi5DROFCRYnQhezoOJA+JdGnUlTuZvEyeQEn/Eg==
X-Received: by 2002:a05:6a20:7f84:b0:246:291:f62f with SMTP id adf61e73a8af0-25345d2ce0fmr8120706637.49.1757296960626;
        Sun, 07 Sep 2025 19:02:40 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:55 +0800
Subject: [PATCH v6 3/9] coresight: tmc: add etr_buf_list to store allocated
 etr_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=2488;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=J8gJ/mYXIto4Pqb6SCiL46R3ybLriqfOejLtEnfdnig=;
 b=7C7yn707Lsimdprw0DZkaDMCHAqIYdRQAOXnK0GeVx7h8jA1BavXgvNmroqj+Ox8oukZ3q3IE
 b4gs6HH1T8nDbUL+jeKB7WQNVjNywsynjftCQ/HYJnMCIIOvMK2M6Wu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX3ZziTyjzkjnA
 pTjelxRDwQ/ObmV1xJCR/EPuhyZNWDCcSBJM1weZ6zA9rJGZEEkAeOY/LIOF78tb/xKOIxvhywe
 ucw1TTtSetkclEdZTtiZdR3UB3n/WEhrrErjRoEhkc0pyJHgIEYCp9UbazUj7P88JmVs88yqNdU
 yIEF8DrIfmT0P2bN3BdU1dpP7AyQHFhCAB7Ub7Za3zQfh33rP5navE7LiBeM9x2uFatJSLKEVhV
 9NpJXaRVccm+QnWro0YWUit0atXq4JfsLxpwkvIU0oQ1KpPZXh132FXTNZ1gQdHVCduKB+pUA71
 fcKe/AtSuQKtR7VcvFw1NCuknnm/VPlatItA/iwXwqQZUbed/ESPUdJYFH2e51qUEpt/sBsljgO
 OxMPS1Vf
X-Proofpoint-ORIG-GUID: i9Nh9LN4BrQ9AlA37ak-luYgUZrX1r7w
X-Proofpoint-GUID: i9Nh9LN4BrQ9AlA37ak-luYgUZrX1r7w
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be3942 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKaT4joegMVsfAxsIjQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Add a list to store allocated etr_buf.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

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
index 6541a27a018e..292e25d82b62 100644
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
  * @pclk:	APB clock if present, otherwise NULL
@@ -242,6 +255,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -271,6 +286,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


