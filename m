Return-Path: <linux-arm-msm+bounces-66675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18342B11BC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA9104E530E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7AC2DA76C;
	Fri, 25 Jul 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNJKMEb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813822DC322
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438103; cv=none; b=GrPcYzIvTD9lrSEV41ST2XAal/Iu8wLJfhTTPF6eyOcEnWhbOnpRljKxFdEpfnSvCL/g+6Nud8w69/KGhevLPrhQ0MSoq7yXT/hsO/w/vYJYuIEnqvQCZL7QIuiyucLufimJERABEZbEhRszgF54ajdyLB4ZmOyZVI0ogNWE22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438103; c=relaxed/simple;
	bh=yn1QIuKySDexmchd65JrgRCHP2kQE2kNc+u+Py2NP8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k73wleT6QiVfAP2zrl02KXzY/PcH4N/idZgTEFiV8QzFaFucFCpWS5pvKIA6tCrITaox/O7jaQ0xKOIU/K+6opPR8vvoFwQJ3Dk11mZRylC66O6zd8HVA1rZfezo5FZ/MltXLOH0N4ukn2MYqE5FnUiw0JGeVUr6oMTJldHKT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNJKMEb3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9Nt20015755
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQSm3zvoXYx
	xsOZ9zUxxblStkpQCRCtAS9aiINsQKeM=; b=YNJKMEb34iL64fQ1J0XRQRZP3lV
	P+cuxrHw8wkky7k2ghef9lrh5qd2HR6RqzvhEsoCodZQxM+6iORpReT3gl3LHPWx
	KXDbulYZQBLP+EHrQh88u9g4NznCKjN/2jTT/mtdQ6Lsg0NNh4cyHUjbDTUFlp6+
	p/hK2mDfRjgGmEO39xc6CU+YQBYP5YdL+FuN8WGosBK/F0KePv/+1fAyMhsMI3BP
	uMUYW0SMOheZ0CQNTpvzyfNLKzHNGMAw2v8AOtYcCUMfsQKL9nqBhfyRhOhB//XR
	qg2+vo5+yH4z0yQv0MsaZFD89NvTjG+LVXbm4TWPXCuYLh5kEXleLoZhJmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w501nnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235196dfc50so21345945ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438098; x=1754042898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQSm3zvoXYxxsOZ9zUxxblStkpQCRCtAS9aiINsQKeM=;
        b=h0sCirydBEMcM8c2EQBxvaBavWS+73XE8pUX0/jpaVCu0g0mTPOqpvIy21BM7GLaAI
         ROhJz1Ve4iEdTG1eijRVVFfWmU5vdsq0uYCBe/dUmZmLHZD0ZOBoB8UfxWEc5ygvTDFS
         H0C3DV51Azo1jGD9fCIVljpQrfLrnXa8E92XCraNmRVhCBQUBuqJGz+OKdLWzMdML5So
         dCmRzlCT/Nc7BENCeSFLcLfLeHVGn2NRBpRMBhahJNomrK1yzrRDOBien4NE3o+r8N8q
         2/1mGbxhMvG/Ut9lsFr3BMWAzfWL8hgzAOL3wfONUeTqU0AGeiQBiBH4Dto3tiTjqpEQ
         Z9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX9lGrbIlTxS7ewBBjsQhEkReQGVAq6AODhLQJ+0uSowASTdbQ2YZC3O1IG8SXneS6Ibr8bnu5iKGCl55x@vger.kernel.org
X-Gm-Message-State: AOJu0YxjAjHwCRn46m1XKQ8+MeTBP6X0FPUNB64YH3cxgMNXoxqB82dF
	QhalJplTGsTlAWGmdWApCZQW6nvFukYuVMQL+l3w/4+jlUUcj4ma/U4c7vmcMIB6Wqj9p4M+SdU
	hMjpxq+gtPUBEzjfOScfwT4t8DAaDRViSxMmRyijrxiD3Ikagd0bYBUAJ34wDHHDv2AGd
X-Gm-Gg: ASbGnctfl0YstuTQJus+tfgJzrWaElVah560bPKqAKKlkS3jwdX62EF3Mw1xp5ZMST3
	CDPO4yOjvvhFnVA/tE/0EEsPkaRDuCxTvrHnkf12MAvG4YBl0eYXTXyk0ly21s6r+fDkfYnalGE
	Z0/8oK1jwgiQKlkb2PjPw9kMKrxHK/shAqAn77Z2THw6PfTbbyGbe89dWThRhzibQeR846a6dki
	XKZm9LVUiPylc9rjSu9TYDU6zmYdDzTtQL2iIdZ8kmm6lJAb3kKrKJjgSDYdg619sWWd8nQuP4/
	IjlIsOIrF94K3ykm9Wd8WOXaMKFWgMcPHX1qJS4a1eRrv2tZbZB6kb+l5L+uojPP7G83H5V1GZj
	01GkOlT11JwQDaQ6UFr4=
X-Received: by 2002:a17:902:ef09:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23fb2acfed9mr21632225ad.11.1753438098006;
        Fri, 25 Jul 2025 03:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGueJ9+UVphua6IFcLHYOrZC6BjRhw5clhGAM6ie7Z8MXkNXHXuyioPE834TkUegaSIl4MtsA==
X-Received: by 2002:a17:902:ef09:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23fb2acfed9mr21631535ad.11.1753438097427;
        Fri, 25 Jul 2025 03:08:17 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:16 -0700 (PDT)
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
Subject: [PATCH v4 01/10] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Fri, 25 Jul 2025 18:07:57 +0800
Message-Id: <20250725100806.1157-2-jie.gan@oss.qualcomm.com>
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
X-Proofpoint-GUID: AZk13p8jqRytsX-NJwRo46FpBbm-TFS4
X-Proofpoint-ORIG-GUID: AZk13p8jqRytsX-NJwRo46FpBbm-TFS4
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=68835794 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfXza8W2NGql2L8
 ll0Ca40pJ1NP3i2vncPUfqvPtyaiWd/Rdg2aRTXrGr55LEgZY+b2KIiWLYPatbqVipGKG1jeVRk
 FZWTL8hJixNLyAmzjVEHZKnuuBx2osMK/W6BVkvRvN0jdBk6C3k7+wvh44lWgc6pm6EDW6NAMrf
 wurZOck0LNcZFAMpcqXDcSlYR8qB8IXly7kqVmplWFItdnv9N0qG3jrpcBivpewCsTBapuPL4yV
 jO4R1FBc+BesyEWOIhvbd1hRNPIsjIrr9xeMZRuP/MTmlDEwDprxdIzNSO/rP/itXZRgl3oyeeh
 c+hvjKezS+sFWTxCiwKpxLrJe+4TOF2t3ZjsCxPW/VWJDvFjHLtTJ1BvFeFOd3BSvnaezNJH7pK
 LOqcRiIC19PrqRYgs7YW8YvxEBi0gqMX0Qmj3iMTSuCBP0a6rHT3V5E3B+VWyEbTB+YAthUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 1accd7cbd54b..042c4fa39e55 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port_dest: get the in-port number of the dest device
+ * that is connected to the src device.
+ *
+ * @src: csdev of the source device.
+ * @dest: csdev of the destination device.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest)
+{
+	struct coresight_platform_data *pdata = dest->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == src)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port_dest);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..3bdedf041390 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port_dest(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..e51b22b8ebde 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


