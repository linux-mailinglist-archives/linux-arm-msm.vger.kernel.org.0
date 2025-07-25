Return-Path: <linux-arm-msm+bounces-66683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 940AEB11BF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6638F5A557E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338912D781F;
	Fri, 25 Jul 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDGqPA26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE58F2E265A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438157; cv=none; b=S47G2FsxAqYDKEfnPOt3Kg6q0NXpd2FB78gYrD5LWbV7Dwc0oNZvwz0V6iVqcb+8C9MqSk9jxipm62AnoD+QwTHgcIUe/HtThx4X450258quX2jjgCupu4SXXlyevizTn09GFwqtT17Kt3IYJsvPkeKgEmh6wqYJKSySaWv28bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438157; c=relaxed/simple;
	bh=fAvEZEfnC0duLlCPJAnL8vIZOsPr1irgS62lUUcRRg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cFTT6ZEH/oE9J4zacLMKhPI5UzpD4ECCv92vcufNwuV7jQ/4S2C2ZCn2a+yb3BCQtUPHArv86uWpcPtWV3A9I8rgG3iMGUFyqm9PhRzaObvJ3Vw3Mll5yfqRWS2dmMtuOC6sFGniOhKu+pZUiuCRpN3p7dhmxjqbvDJ1n9O66OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDGqPA26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9TErC028127
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DhH78wvVJne
	tmIHm7XhAnpQBOngftYw35LXwtkDO8nI=; b=dDGqPA264qfjWe05++5irJPMsf7
	/7H0+Xmci3J3XTMBFvqsFXljfhVWyOdvyhJ0WLZbQ0Qoq58CHXIJUu1mtlBI5TJA
	TkZIgX3fqVQencKXO9IvnkLswiwohQc8O5eEq9R6Ax8VYQdllqh4Bs+dQ0mOnijY
	My3IBJgTXwOSYDOvHwrTMU2e9Ivh3zqAVoqZ6xFAhPHQBaFH6oW2m7GTYwKiUS7G
	R+8RU7IEEhtn/ove6BE9cySDHd3Os96zPVB+NokU5+u/loxQh8Y2eo4PUzhOYYOq
	91rZEUeuDandHHsZJZZaHNzEZUAMNx4Uy7c60lIJYZ1j1hnSXOn/Qrv+C8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u1p0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:09:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d70d67so19977335ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438135; x=1754042935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhH78wvVJnetmIHm7XhAnpQBOngftYw35LXwtkDO8nI=;
        b=gFnC92zwAsUB0FdYoHjK3fVIKFcXpIjCwTUdMVTgVu2BClUUqdPQWn0nMpp76FGJlJ
         TvBqezQ/JOBJIG2JmWG48siABYnxK8AIPTzwwGNc/Erh458601hf2A9i7fIaFtNe7e3l
         gsvp3pvEolYj7LrLfXunVhzYhfCddgRhLhwPg1tKTnpVH1kU4+TI0g5MpdCB9wa9vl2U
         pH1/srDYrHxHL6MTvXiPEKFFfu7w4uKkb7ZWRxB0xXp7isf8XASifG4t4SADJTLcbIvY
         MegLKOY/XeDpuHr4CPfAi3YyYmGJ8bxrME07QXtybPw4NcPx7nU605Mm105vYg2Ht51P
         m7Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUwM91+r8rf6EpnQiDcT0avwLJOHuaqmxwnG8/7PBZnteOfIU5cxZ9lEhaigxBNApvzjnsUkSqSZxWO93o7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7mZxAtP0Y35bGOqxmg/RbGJaZFLVqV1/1o0joPbfhMK5RDREl
	SHAo4RFhhfHkIXC6ptcnbIPUcv8udjW4Nqlyub31FuIo+z9mmyg0JzvsbYuQ/G9sWD8sVnKGMJV
	eAHyk51uaj+2aavSqh/4qPWG5fsTClPLms0JNIJjpQebXn79swSpUDPAHScPqVHD0NEWm
X-Gm-Gg: ASbGncvWTMdlG4VhuYBAtu9jQKgh4+zPJKmP77RIb45DbbHeBPAXv2nK4Bo6iTueyUl
	VQ3Jgjf+wgaTWti/2CNih2wwLDodfizINb74nInt2B5awyWDQBOE3Ui9oDLO71+RC7Yj/wuwlhd
	fSCaxkp29maovRT/+fUl+1Tsl3oyoNyzgDnUqWxwYQ79Ar5BW0Z/tGwHspGdsr/UvkTGvuTqV64
	+e3FBq5RYy/xrBKdVM5+lBaSA9dL/CLDhGbqYOqW4TtXGq/53Pl/lDx7rXrZzGTTw1LXVlFSzSd
	WE3kKgM7/pIqAWpncos1GdK85NamqNfDYrqisAcTcyJ2qICPFKz9wvYYmfeTXPn3AtPcROWhfrU
	7PQH0duYDRlL4foQ5c5k=
X-Received: by 2002:a17:902:da48:b0:237:ec18:ead7 with SMTP id d9443c01a7336-23fb31252c5mr25667045ad.24.1753438134641;
        Fri, 25 Jul 2025 03:08:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFemnJCAQcuNiBKQLUNas6+SmLXLoOyi8PGRh2U3ofwYuo4JSUJBC494RK9BYtmkiq21Zv5ig==
X-Received: by 2002:a17:902:da48:b0:237:ec18:ead7 with SMTP id d9443c01a7336-23fb31252c5mr25666385ad.24.1753438134050;
        Fri, 25 Jul 2025 03:08:54 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:53 -0700 (PDT)
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
Subject: [PATCH v4 09/10] coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
Date: Fri, 25 Jul 2025 18:08:05 +0800
Message-Id: <20250725100806.1157-10-jie.gan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NiBTYWx0ZWRfX1iJVku1mGcMC
 p5wsc4eO2PrAQl0Qv+9Lv/JoXyNVpi/aNu9OLxvN1weESb3oTKEjuuAqbG53zXHoN1TWM0H6TCS
 0O92FtYkFvCQ2XCanKBtjEur7BCPt+M41wuwQDNLiTbg7x3+hz3TYWFO3xFfyCBzmZy1L/Z2Iv0
 lbxHsfSz6m5rUWp9UVOO4kuVnQtvp671cmLkfJ5zWkD3gQlSvEpDcxW3ejLgBTFBZiRtYxcaaEW
 HMB5d8xFOeAYF+LewNAaBKcGrucX+K1hTDx0sWv07VYgWfQb0QcSE1tYWft0+iImQidTnJDAdmR
 emm/IweSenveBYZt8ymyq7PKmPayHyJvPBwfbm+sOIV+IEWZzIOnJfUXCqHuMLVlZPWieDsftFF
 s5eGzyVSudHxLQBa7yjgkKtaPcYLvkxw1UmKfDHnw5uUoSkAyO/xJeG1TxLAJe0LGklQZB1U
X-Proofpoint-ORIG-GUID: hVOhADVwyM7820AGcyDZKVNjDCp1F_LX
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=688357c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Zpm-vmsZ5HaS-asNi4kA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hVOhADVwyM7820AGcyDZKVNjDCp1F_LX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250086

Add code logic to invoke byte-cntr's read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 48 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index f668047c5df4..671ae4542f6a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,15 +228,41 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+static const struct tmc_read_ops *tmc_qcom_byte_cntr_in_use(struct tmc_drvdata *drvdata,
+							    bool *in_use)
+{
+	struct tmc_read_ops *byte_cntr_read_ops;
+	struct coresight_device *helper;
+
+	helper = coresight_get_helper(drvdata->csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (helper)
+		*in_use = helper_ops(helper)->qcom_byte_cntr_in_use(drvdata->csdev,
+								    (void **)&byte_cntr_read_ops);
+
+	if (*in_use)
+		return byte_cntr_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_read_ops *byte_cntr_read_ops;
+	bool in_use = false;
 	int ret = 0;
 
+	byte_cntr_read_ops = tmc_qcom_byte_cntr_in_use(drvdata, &in_use);
+	if (in_use) {
+		ret = byte_cntr_read_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->read_ops)
 		ret = drvdata->read_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +271,22 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_read_ops *byte_cntr_read_ops;
+	bool in_use = false;
 	int ret = 0;
 
+	byte_cntr_read_ops = tmc_qcom_byte_cntr_in_use(drvdata, &in_use);
+	if (in_use) {
+		ret = byte_cntr_read_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->read_ops)
 		ret = drvdata->read_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +312,13 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_read_ops *byte_cntr_read_ops;
+	bool in_use = false;
+
+	byte_cntr_read_ops = tmc_qcom_byte_cntr_in_use(drvdata, &in_use);
+	if (in_use)
+		return byte_cntr_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->read_ops)
 		return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +342,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
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


