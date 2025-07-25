Return-Path: <linux-arm-msm+bounces-66676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E084CB11BCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F9C5871C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6B32E172B;
	Fri, 25 Jul 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxEHMxWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E56B2DC32B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438108; cv=none; b=iOstDQLhNGi0A5RbU7xDn/m+ivTBQaBTbD+RgywmlY7+6X3vlqczy/SJE5/ORe/qcuIrVoAt91QrEUaKGEAJAjSnnyoOBGMjEC7CWPAha8zUCopek5bt8+i59kRDsmfX44ATVs1hacR4JIuI0Z8KnpCfbm9tPVt0kGYVwJ/XIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438108; c=relaxed/simple;
	bh=MlUhyGdVnh8kU2bXiSAS0ogGhDUv6OxnQL7AC037lgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IYW+5CqlwFxSf6TRI02ZVL62bYgCnx7xIe8kFGayJu8a5uv83dI8hhtKS/EUXR53lpqlHQ4/QW3Z6coiWl+8N5P2o8xShuLoWG/AhE7oFkvix5RbcGvMRQBBxQNb+9SaRHoSlvN7RUuVTxjxVYZmKqhCeRyjjoejU/iNK+Kp6O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxEHMxWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8tPqT026751
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iwVty+8EPpT
	8rhXCALbF9loLMkW446LKfXLUZrsgr4I=; b=CxEHMxWse1WCK9wBxDV9iQM7wTg
	VFNZogTvcgdq/U31WLQ3dyK2D4QIfI5f4hr+u7hewdXFstQgGieekWtU5b+GzGae
	Vu32wjNnI5jEjl2cj4oLoJd9n7gp7/Vtx0sTpvut3bR8seBrMtOM4WmLQoNizGBG
	zF6DZxUzkcqGhkEsM5Uys/xeVCTJUlfW78p6V/Q3DrKDwqVtSXo4jNH6vBdpHp3s
	mZylXggVW7z5Di3FT4Utg/09a1JnNMeXtl7gqnkTBA/pnuQvBJohzi8ZoQ5XeOM8
	yNuIOYbFVs9TH3j2ezsUMbR7WyT7WDSP7m8Sm+ONG8dwrarFvcgeXgS1ZZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u1nxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3f33295703so2626794a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438102; x=1754042902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwVty+8EPpT8rhXCALbF9loLMkW446LKfXLUZrsgr4I=;
        b=uYpZEMaaD/guF4PeoEp0NMei+ZsBUDS9Rxbwn6UsVb19m3KjHvbL8zpJ5VcvBpVBGe
         9sS8Dgz033TDp4uMhbUmyt8HUttsx2rLi0ONTb6UAjmHW3tjcUZC9VY1e5dAZICWIOCY
         mAhol9G9wJR4Uim239Ndf7wyUfjTppiesNiyin6FwlcQgy8uZnDZD5plvxUpbFiCYEAB
         ZBCg4LKRVKA0JSh6zmsauSqtpq5REIhpMFmTFahaL93MW74jJUUCxAx2DgBrjUaWwa2n
         UtQ1mLzCzHoDbpouBUqjx6Iq+Ki6IgDVdOESXslQwfKEfiMlR3BaEMndUpFuElzH4GXw
         l26A==
X-Forwarded-Encrypted: i=1; AJvYcCUyxwdvKrxw7Ku0DeEkEGVYuMdtSoNDliq3mc120r4rIecu2YiJ39VgfUMD0Y4BPd1iNRFl1WY+h51GL9Q+@vger.kernel.org
X-Gm-Message-State: AOJu0YzskJmY06WhZ8hg12OY4iz+t3CTUPOnZio8jGwW23EXsD6Ni1Cu
	YTT2zJlJrDQql27Iind5n8CH7iNyb9w1Yk5Amifmm26ehU0I5iUrUfLGkK3hQc75EprmjUatr2e
	9NUN0jEL5npQ4sMgqjFDuziSLA9/PkayBaszlpNovaR6lS5mpBCu3hArVC5a0HB+zm1Hy
X-Gm-Gg: ASbGncsxt3dnkDBTldtX2It7xb334Js4Vv6/4Qcs+9vnOlgfDpplSP7bBAF/etwqOGo
	KQv/WZjsYUvE7YRE+ulM3cq32Wg6kUklgp7h9RU25/kYTJqq+MEJwTlufkj6jfkPiIxYVjQUfFG
	ASsWM3dchIsuoNqx+3fbkP+z8CaQhmWYGNjgs5F8mJdHaZ2J9v0PMwPwVSRQ6/gdmcFg3Flri6i
	Cs28iHekO/il8ANiQ7P44qTq5qTMhFSF8ZQg4Q8fH/EzCN8pdX8H2YJS5+wjKe9o8wOMd4KJwe0
	RnGbHqNTV/YV+Wxz1U2KrCye3I/pH+j5Op1SPyTgouoYwjHFn6/P0ZB4EcLVJ/btYQIsFv8i6KR
	tcXflu4ubI8lDRvVfHgE=
X-Received: by 2002:a17:903:4405:b0:23d:da20:1685 with SMTP id d9443c01a7336-23fb3065804mr23647185ad.4.1753438102579;
        Fri, 25 Jul 2025 03:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGAiBJTC/djKisNS0F0AMBhg//Vc5DrCNPe8BoJTA4OkfqBJrdGCh9t/rTtPqfvIB0yiXT9g==
X-Received: by 2002:a17:903:4405:b0:23d:da20:1685 with SMTP id d9443c01a7336-23fb3065804mr23646345ad.4.1753438101895;
        Fri, 25 Jul 2025 03:08:21 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:21 -0700 (PDT)
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
Subject: [PATCH v4 02/10] coresight: core: add a new API to retrieve the helper device
Date: Fri, 25 Jul 2025 18:07:58 +0800
Message-Id: <20250725100806.1157-3-jie.gan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX1utMspSZrU8m
 zAYR3Q/SCpEdE305TxVfopfcoEvkj0IjgbJZ7MnM6DRtpZP+3pwqIgNoO+vshxao/ZhqcgqiD39
 6Cv/I6tWP0tMdi6lmfOPITzz0oXHyjkLwpZXz/rd+saecHAlNlmlE+FvlYXTUVySxGXE0Z0a1F1
 k0yeWXJdW65tD1yAt2Ptti6o0GkqbGFvwKXlj9rDH/n7RTonmS1i92ZgDNi3ATeYqSYrPuC7x7q
 nhrZiYfIqtMA4H/MfmAYNYuAd/UlKCUjhgtOVBoEMhi4C8XBgWeBOFzlvWARN5RY1+qffd3XA79
 5ThkAnx6piw8cuqYXprlHZLDSd4bgyjIhu1YDYqmD0tMEBYTLVxAF8OcQ/Z3uGbckMbF+UN+dLJ
 R6N6fNwq82labx9GjeQnRumbubHwnZahnoVzohq3kQjltanC8Kg/DwX9W9f41NVXVUseUB7Z
X-Proofpoint-ORIG-GUID: I3AM69quj7ZgTWGszzTyrah_H186h--I
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=6883579a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ViBFXQGRTvhYuEXyb1sA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: I3AM69quj7ZgTWGszzTyrah_H186h--I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250085

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 042c4fa39e55..018b1119c48a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
+	/* protect the connections */
+	mutex_lock(&coresight_mutex);
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type) {
+			mutex_unlock(&coresight_mutex);
+			return helper;
+		}
+	}
+	mutex_unlock(&coresight_mutex);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_in_port_dest: get the in-port number of the dest device
  * that is connected to the src device.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index e51b22b8ebde..f80122827934 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_in_port_dest(struct coresight_device *src,
 			       struct coresight_device *dest);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


