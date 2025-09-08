Return-Path: <linux-arm-msm+bounces-72462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6467B48272
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF5F3BE079
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 02:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A506513D512;
	Mon,  8 Sep 2025 02:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtMcVncC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097861F4192
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 02:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296989; cv=none; b=NT7hI3OlXq4KQbK271DHfDibUzHFb2tQx8IPrC/Vy7InDIbEB75KTkypyHMYlzDM5ZiN3lijpkb7ORp04wp0QDIV5iwaN0sLvFV/OPH+OrpctDxz1w/nxrn4wGYFSRzMFrthpxzIlpp3nhBwM/Fu9gFjaizSvTlt21TaT1foHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296989; c=relaxed/simple;
	bh=gqGZH6Yi8iA2PurHK4Hr0SugFLFi+Qumto7o2U0LAyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rL7EGqA4sHyhgiMDz6+8AMBDt5YEu0PM8R2IyBPcpZ7Fjk9rpQBNiU6Eb+AtkhbNlXRPzuMBMQHUPiKt/WyMYm6HF/H0vDhAorG21oa+a7BicqpQhdm9h44zeGCdmy+d3WrnKE7OKQx2pMfHmwnqc0Hct7L8O/fF8m+59F8GFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtMcVncC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587L0GKu008077
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 02:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjr9DFWK5BGmewZSGkQ2VZUQYos6n8eGabCZvgYjzHQ=; b=EtMcVncCuQL8y/WJ
	o0FTjzDv3u6BrzQ0/O8i0v1KHYAblscqm8FseYbrHfwUkF/AR5oIVZM16SL7djWm
	QGV6SY4TYVrVPbxzAcwfJdwvi5t5PwZ/xf9P1lObTdMT6ZcMf7h/IXntbYuB2Sp+
	7R07Gs2pMgEp6ZZHszAgS3nWg5jT/kFWQ6Z+Dvd2GAy2/KNVccWwDrNiiw5Fq+uh
	IKlvTZHRq/pHFqjICRpnIcnEGdQviWEZ3fRzhisKO2g+zgl0zVxhfUjg6tLnwmX0
	pukYhdfLpdeOyKaWDfUH+8fXUJLa2vemYCcWiciI2u9mYFzzmf7xFyKOcNiuJfw/
	SDZ7WQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d63aw7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:03:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e60221fso7584145b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 19:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296986; x=1757901786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjr9DFWK5BGmewZSGkQ2VZUQYos6n8eGabCZvgYjzHQ=;
        b=NQgvHD4x6R8Nh4sljC6dvlby3f6NnmrXnxk0a+bXBUCpgTp4DPniBeEo8Zy2yW+SPt
         0lh0/cwy93Uf3eDJFBQ2LQiC/n77rQKg0CF2zq5cLV0z7ZmRL8fw3Ejzrle0gU/kJNv/
         p8feQvFyAzL5VrMfQCqw8Foq1R1UmdY793j/8EDtoeHl2EIe7wKOcwcAcjS6oXpU/HBm
         ONNnfJY7ryo9y/LYw4UeekmR++/Ejbpeu7f4KRFDHZDu4dRfAkjO1t4o29tlZI5yXyaa
         3zmxxzs8ZOkUWetr9a0I0MEoWYquhHKvyg9TV8oYDtT0V9SUKUydJVvRPUosPRbEZ4MO
         aVEw==
X-Forwarded-Encrypted: i=1; AJvYcCXMD5y0k8s+EJOw8N8xydC9UqlT59BVaGzmCZKZyqb0swiz4QgmbFxrfNZJ0ytbwabck/sdxXZrNoamYbnS@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhKzDgtRpyDgvsapB54oC7GHrgy3H9kvN+mJ+LXdH06ng/shk
	krgshrR8xnw/Ya93gvMoabxDjQQdjcnZH57svoVJWCoZaHotCX5uKQuPCp3QkxW3OpNOBxWqA4w
	Z1Y0FXTQ/rnTSvkgf2ST1zQlNVqEduPFBVRwRrsxcAwK7yPV9Yn9dTmdfrFMens7cdLoo
X-Gm-Gg: ASbGncsRVolBASDEfQtpvUEDMLR445RDnuZ/1kL0XVjLpdjgEjSngdykd18Y9ClosId
	m5oYDVYuO3CONxnp/sgs+Z8KKfzcsUOU/ZRMSzyodntvvcJvJho5HsyaSdiTrW8ap/LyEDbJJYK
	kztJ+iGG7KIlsGFG6zk15WBVFdJ1q6J2cGsfkv4RHNmwyGp4sUR8y1NgX2Jl2c5lQ2cZG4G60kJ
	2fLw5Yf1E7cVsG7a13pUt562fEWrm2Gb+LKgR1miYkxmY2ZiUprT31cJz6aGIW6ZmKTi9gP/Ue7
	sUbeMuwFHU77+aMDhPEWrI/XWEMBNfWsmRfayE0xHwIshA2EiSjDaGurRClcP2xyWODYhWbt7Df
	GNMGt5u09t/LhVCWKTAMNbHa3/JQ=
X-Received: by 2002:a05:6a00:2ea7:b0:772:615f:b5b1 with SMTP id d2e1a72fcca58-7742de89899mr8693308b3a.18.1757296986159;
        Sun, 07 Sep 2025 19:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAJxGcEdogZyXQSFhs4IFVZ3BGmEZByW5ZZWBmkUd9Gu22s2z4YnUhtcDrdmy9HZyJgb1BlQ==
X-Received: by 2002:a05:6a00:2ea7:b0:772:615f:b5b1 with SMTP id d2e1a72fcca58-7742de89899mr8693225b3a.18.1757296985368;
        Sun, 07 Sep 2025 19:03:05 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:03:05 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:02:00 +0800
Subject: [PATCH v6 8/9] coresight: tmc: integrate byte-cntr's read_ops with
 sysfs file_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-8-1db9e621441a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296941; l=3612;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=gqGZH6Yi8iA2PurHK4Hr0SugFLFi+Qumto7o2U0LAyM=;
 b=rkZkwzh3bZlNzouhvpi4j27HlwAMQmPx/lQCC/2XzkvPU+KvSz1Tf9dJhzWLdQbQgwzS8RzSQ
 JFhe9Q00/zZDLuuMF1J0EKQbLCrPjwFMOwBuv7RMFKBnbIl9o5gx67X
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX2zfpc1Hk0VGA
 8rZnvrsitMjJGvVbP9+7FRtRjvWB+iegHks8oE1guMz9vFW4iHkAKk3ARkpuwlKi/QDiYQy/DaA
 5Gy7lT9X4sKUGpUeFLAUGU5F4NZGqJa3ZlrsMWq//m8m1Nr7G/xMMpra9Bc0CYWrwRTgB+lP1Xt
 1SGhk6mueGrjpXBdWJaIOA3YD2BZTlNlobc3XNvRjaVECqK7qFEqbsWgOrYPx51TsocTEs/ZJIC
 WacdofCmcNBW41R4uVZ6CCxvhoKkVeiPCmh8oCxqpWw3ZG+P+X4UhWYyYrQPFjAi4erJKdE6Zfu
 DUNPwxGkbWUurStqhJSxTmfv0qxqiUxoQzFjX3A89sIgHGOlx4C0KCVUfzG43MHm8FWd+Us55oQ
 qbfb5GOR
X-Proofpoint-GUID: JgIYk12uykFNab2bGiPTUwkeNYLMe68S
X-Proofpoint-ORIG-GUID: JgIYk12uykFNab2bGiPTUwkeNYLMe68S
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68be395b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029

Add code logic to invoke byte-cntr's sysfs_read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index ccb177d953b9..2895a9b431c3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's sysfs_read_ops if in use */
+static const struct sysfs_read_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = coresight_get_helper(drvdata->csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port_dest(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
+
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops)
+		return byte_cntr_sysfs_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->sysfs_ops)
 		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +347,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


