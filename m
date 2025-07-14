Return-Path: <linux-arm-msm+bounces-64754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03120B03721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7ED3ABE2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B0A22A7E8;
	Mon, 14 Jul 2025 06:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfS+iyOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F9229B2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474691; cv=none; b=T0WX1k9ymeymuwQYdx2ZXA4tALsUUtrVN/8uqKdbg8k0pX4y+D7xowhoXY0fvDZQRdmq2a0Z4scSdmgqWhF2wiS2l492lcorolliovSrl8oQPW3mDNIhAryvwRS52a4WjB42YbYgf/xF8FWldgkgDEuecyr9BNJ1r34MSEjkmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474691; c=relaxed/simple;
	bh=1b7rvw56Mctvyg+F2hGGn2xKS9+q2PZD+8BFDtHftYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCYKqLprf7cQiW/GsDAi6K9/DlNqpaGbAkheCde9kpCehTxt79gkKBuLK1hIiFF5aGRo1sF9Kg9twN7lPhWqH488Vke+iMUX54DJ/bRYeKmYYyq40LvL9qjsyVHGF80cVcJ90kH8nq+7Gno+46hkqjmDfY+am1EPy6sD7wh831c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfS+iyOE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E0M3M2032291
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AXLNn+wjGkg
	SdDfX67QxF5l/RNz39oJDxLQvREZpRME=; b=HfS+iyOEMqpMEBJv0AV3xStaduT
	YXA1i+SJdLVUuV14+/JitLchm+N2q9ujnayRhe77pye5mmQ/FvvMomfTGKCUyyQU
	5A+jBSG0EDpwpDVWLunZ1iv5UPsZzIYY+t+Z1+9HyTEV+Q+t11sekxG7s/IyhL/H
	dxCUA7tLA49Lgd15cvf80ifat5mhYnQgph2wAuWFtBIaUq3JIQ3ITcHzkfa1jCAx
	q7xevMOvM8O3NCJk093NwAuTMeF7IMwrR+ULKXTyPrcv28k+vR1WAWtwnmdp1K9C
	uhspC7et9g7/uviuUvkBZfcD47tCBxE4a8THkjEWhQ9TlEAbYw9O03qLuIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut3eub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-237e6963f70so62460355ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474687; x=1753079487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXLNn+wjGkgSdDfX67QxF5l/RNz39oJDxLQvREZpRME=;
        b=ZGDgqP8NHUtuTKsg9LRf2tne95Nxa7O1S7sU4iMwkjNYv3Vc96Lco5y7+qlzfRf/UH
         x7GsBHAW3rWpWWXA/oz3Nic1+Nk8TcQHwFCeyWR8mNp2FXXro3DJ11VJtfoR0tXiNuM8
         YNQx2VJLHwqBjieCYwqeNNkzmbxP1GPIKNl3kR1YMqCzQFMPJJ71p6dCvpPICFEJ+vjY
         msxgI4H4G+VmutOVXdgCsJi4X5AiQnBMv4jpqDxZwiyC54xhpQJXV7TSYamyBnp5jqM5
         /Bnp48aGcaIvnXq8kuA3o9qeU2gaq96vkxqZ6Fn0PUy5zw/NpCDFZyaUIAZmgxF9/dha
         6dWw==
X-Forwarded-Encrypted: i=1; AJvYcCUQgvETbIhr6YKK+fFiLxxhsX4BM/ldHCnlTDvV665a/YTR+VerAlkahvrkQIUVoyfwPc+d6ni984rnwE5Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4o96/5dMQFVIXfqYVPaTcJaeUUw/EJXhAOk7XF6GErifg3Y/V
	s8aR+HG23B+/fVtsCD5P3v5+fyJlRJV2u5BFyM0NYWyo7fRS6oAnnAe4yKg8x6FHFpa6yrhcV3d
	2r0hV0MXB9fUsNZSjQwiPcF2688GrQmbgtbesm/FtEWZE4t+PbX97sIRD82/gIT4h5AwY
X-Gm-Gg: ASbGncuTpEbx5mgtpp5l9TIO+i/+nhkKo/YU7sLphzQb7JLb6axzCNamBiGmvkwzNkN
	JDGtNNquCLgcgZzYumTEoTpAbRZFcTPOmyAbIcNpSQTfsRxdldI373CzKoNI/2NpRDz3cfmtTrl
	A9xudInvacexAYOQb9qXa7PcmmMShT4KYXqfmvloc8lCKV/82jY7O98DRBugocMovJlW/zaTA9F
	awyXTWQwI1cM2oS9/EFUTI0hAT6kxZ38P0knpNnSJyJri3aiswH67qRp4iN3UprHmhHoBnFprj7
	fctV0/YxynReaBJ5HpbQZ3iUlX2Fxa+CDV7ZABjUKyhaL49Y5vIkIXy2d8pQDQncA9zLuavIUoE
	eTwjedMamLmsOdMx/vtqK
X-Received: by 2002:a17:902:f990:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-23dede8c3femr140606945ad.38.1752474687320;
        Sun, 13 Jul 2025 23:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhuRWB8qDraxlgUCSzGpQ7hJwWY5emhcB3nOzVNA1nN8Z3RmdDgtgMiAQImDA3RGWg7WXXIw==
X-Received: by 2002:a17:902:f990:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-23dede8c3femr140606595ad.38.1752474686921;
        Sun, 13 Jul 2025 23:31:26 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:26 -0700 (PDT)
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
Subject: [PATCH v3 RESEND 02/10] coresight: core: add a new API to retrieve the helper device
Date: Mon, 14 Jul 2025 14:31:01 +0800
Message-Id: <20250714063109.591-3-jie.gan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6874a440 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Bv2r1u00ER1ubdDhqu4A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: NMKLZmHTAG_fO1-Xde3Fm10PGyNCqIMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX50eCv68i+DBx
 0zTsUZJSh3yYhyedBEeKkFxkLxv5ocYho8BWkxZmQQ1DvnSX14vNGITFfceT/hpuPLB6E6CQYwW
 mEaZHhPGwZtxCtSltKvQEH4I3bc1ze1Q2Yx5028RTuswc9qTvb7DUbEbji+ErOn8fi+BKrAYv0q
 jrospMrU9nGsoF/R4S2seELK6XuzBiSJv/PU5RbTn3Uq2zTSyFrLhrVAUecB9XiXKEJF+KCHjkR
 vJUVO/M8o7ZTIFBg2xwz/sCbo3JzwRnCilsY6ZexTKaG4ljcVt9U5MyBfTgnw3mdr+y0CLqNyro
 zG5RJgZly2TXy5BVZp8c5SHILXhmf9RY+cdr1nyX+oiZuDUaeKvuGQN2nStjd/6ZOG18tj/2OVy
 fR5wQOPX7Ud4cK6XQG0Fbd3J+wkPuQn16L9p0o4GPN2Um0/NLyhCnUJxlIrS/Qg11QFUzA53
X-Proofpoint-ORIG-GUID: NMKLZmHTAG_fO1-Xde3Fm10PGyNCqIMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5297a5ff7921..76e10c36a8a1 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_helper: find the helper device of the assigned csdev.
+ *
+ * @csdev: The csdev the helper device is conntected to.
+ * @type:  helper_subtype of the expected helper device.
+ *
+ * Retrieve the helper device for the specific csdev based on its
+ * helper_subtype.
+ *
+ * Return: the helper's csdev upon success or NULL for fail.
+ */
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type)
+{
+	int i;
+	struct coresight_device *helper;
+
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type)
+			return helper;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_port_helper: get the in-port number of the helper device
  * that is connected to the csdev.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 07a5f03de81d..5b912eb60401 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_port_helper(struct coresight_device *csdev,
 			      struct coresight_device *helper);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


