Return-Path: <linux-arm-msm+bounces-72456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 941FFB4825D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E3B4189BA0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 02:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34121F151C;
	Mon,  8 Sep 2025 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAbt/Bc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE321EA7EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 02:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296959; cv=none; b=f1t1u7YIFQ2p/C1rewe0863wuAREvig8ZI4+O9/xiiIiD0E4jvfmuWX3V2WMR3udtebVXz84NvdFzk7uajXndbQbP5bHwmAuD2q3ghUq1g7Lid7Bf9lYCYPgFZlcFlec4kmbLE8JspEtJlSqgHP6TfdHtSC14uyQWV/ci058U3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296959; c=relaxed/simple;
	bh=QFpFMOUZf/2SBDLxhrsEj1Eto2xysYNZ7RxKlu5EyYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DEFP0LcKPDPhTQ4++Snewae/ycOc7Zp7RUOW1mUbqbOwYI6NJt6tDANOoeZI05BggnIzul6MnlcCoU/vxp+0NsGrxWcdeaboo5zX6qbIP7P4lTji094TUXwBuS6b2QrkqQiMaGt8W9WZNpv3jvwL/f/jknr41ye882e6eJxD1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAbt/Bc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MJL9b031748
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 02:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmrEmFTMxg84eXRvylgPXjTGj2u1nEfxmypzMMZc/rM=; b=SAbt/Bc2JoIaPY45
	59j0UsyvnCnYOylZEbH2gVACRNpOPn+Tj0yk8AuBs9qpG/tgFtNpjQhTFvIdte2b
	OFuME9rCEkfqQp3bRQiR1cpy/4Rw5I4bee29vRnMm11R7YdwBceeR2DQ6aKm/n78
	BJWDW/XS72Gz1xG7ofwGyT4sj3FceVqPV8Bao0F7SOyCK+lbY5r0HJjJ2hL7Fox7
	Y7GylWa2V+3O7W9kvxUrAmOORulAB3EBskwYknoB07jfE4CJA/Hy0c2UwDIVGfnB
	2/zXAUGasCYRnEoZfyTp4A9H/6MiruSYRKNWTYKVS94ZKkreuoOJuKy9WSvwNoLq
	1oz67A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a2tr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:02:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-772248bb841so6997964b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 19:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296956; x=1757901756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmrEmFTMxg84eXRvylgPXjTGj2u1nEfxmypzMMZc/rM=;
        b=N5wlFa2kVTlJlt+ovNrt7UrSjEFMKrUJhM9CHMYTHALlL72jGHoSXuVlSU03DNyyaq
         0EnlCjVytISHH5Z3dhuYl2dEXwOPmMeF/8RAzyvEnsVCeT1t8S4G376/F3Ca08mHsMJU
         ip+q1Pw9a4I4dGTvnBsXV4L//evMii8ny3DhTDiBgUT+VvIoaM6UNdukk61AhRL2PiM5
         q0vWUgRPDo601HVp2uBolEliiELQTJV/e8jAq/ZEuRv2mTvCMzx03IrpfvjzZdQDc0/y
         im+kUMA+kzU/mOXPbSyoi9Zr7LKYVfkEgXHL3JeVG+i1FqdGwF3Ki7lLIvWwLOqnHTai
         bq4w==
X-Forwarded-Encrypted: i=1; AJvYcCVFzEHq7XA8/a/XTDUCZNqnfL1oMy8ABqqhrrC+vj9J/0F1cYutouApJMJkWhG1en37xOKcd/SK+HTEKRLM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ZuaqLGoGwlmgCh2leMcjBSb0eom5LBsD3w3qBSyW7+VXPf/B
	bRgg1s7dlvQ8J6wjXdaccFU8C7BtVuTPaqWqovz32uh3p+GdQWJBOHNGoVOKNphcbO+TDM+lUYz
	F81eiSZhMUNpvoJWfWBLLIpBtpGfhun+EqXvnuAwBY1bQDvxIiWfUk/KMj40qpwRQ6ePb
X-Gm-Gg: ASbGncvb1160Z7t/aqzimwIOqwLxKNRpxwLQej4XG8pWjMJeExB0UQzmWV/VammNplr
	1aKtOp0fEYK7jhW850O57cT1jkU4DM3ufhs4AfmgdNyC+7ldGPuNEmf2RElRE9NR1ygs/GEAizw
	T9CEISIrIagKcobcnU5oboY85ZPrOij1lLgZmFWCcND8HdnqG9ZqHZoUdZelLeNhwviKrQzpS67
	gLNDdXwY+2fULVaksZ54wO9fAMGUWuqoOq6emmFUnCLEYffU4moPkWYqXqhcd4ZyLiwpamtQb+z
	UN1sRD+1K/Xr/jbc66s78+XVWlHxbYNLEmV9bXNZfY66HxjLjA4gMwUJyW68CtObIIIs1yn0GrB
	6hkSy4fR+ZMFMq6gFPX9zA/F/w0E=
X-Received: by 2002:a05:6a20:939e:b0:243:78a:82a7 with SMTP id adf61e73a8af0-25345579b43mr7587413637.47.1757296956471;
        Sun, 07 Sep 2025 19:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpz91qpajdyoSqIcc47npMEE1FkO9LwTqg9ZWKouQV8RyNp0nC1V+LGbeoE3r4URiIgPkNgw==
X-Received: by 2002:a05:6a20:939e:b0:243:78a:82a7 with SMTP id adf61e73a8af0-25345579b43mr7587375637.47.1757296955935;
        Sun, 07 Sep 2025 19:02:35 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:35 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:54 +0800
Subject: [PATCH v6 2/9] coresight: core: add a new API to retrieve the
 helper device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-2-1db9e621441a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=2649;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=QFpFMOUZf/2SBDLxhrsEj1Eto2xysYNZ7RxKlu5EyYo=;
 b=bi+tUi3A8/0GEEoeIWtWZ7na0uNDvTr9BROFOck5sTnvMXnTbiYnJxMCb3pPyOarEUn1dR8Kj
 rl4N7CvjIGgDyH59hczXqMiQtklb4wJquhOR2XH0lTt3flB7xAbZl2K
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68be393d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WErVAGsNQcrMbPXGsVkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HFfp0SDNm5IbKCLFQWsqRshemS5VIZDJ
X-Proofpoint-ORIG-GUID: HFfp0SDNm5IbKCLFQWsqRshemS5VIZDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX5vaMIJP61uK9
 38n1mpGUBCJo+Tm23vb1g9P/ViWtAMou04MI4UrepCH/BK1ErjHKlSzAjd2HRBgwK7FBreO7ria
 szvOtAytnroxowgAeuj53gxAJQOpQRZIcqxcool5uBq1MQwlddNMHPrxhVH2XLJjZ+Rvy/Vw8DZ
 /7QDjFgysKw0dUZ2VDnGKQaUKJu7dUeOwR8usrvjzaSye/m1MJE/qizjYoR0C+NFB9aB615Hcn3
 4ekgMFBrKtOzgid9Cb5nkaYgsizaGEbhvWLNJXENu9f7Cgg0tsgZ+Jmn5DE00BU5rBWibn+MwP+
 gThOSBoqCxWuhSE8u3QCqYMp9cTI3rs+PPf2MDxfaqzfRowyg19ZN2tImSemxcnOQD39j27w1QG
 ua2ai4X8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++++
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


