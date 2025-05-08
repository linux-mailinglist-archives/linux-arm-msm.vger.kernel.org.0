Return-Path: <linux-arm-msm+bounces-57254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 971EDAAFB03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5DE71C0613E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350AA22AE75;
	Thu,  8 May 2025 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfj5ktEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FE822CBE9
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710019; cv=none; b=j5eKtliNENncBdfUKJuL0H8R0i5hjmaomcoU+aCmgtRBT9OQP2OxD0japJ4TDZG3PEp8QBTBJpVQtB/jrcZ9viRkPQGc1D0aYf68JywGdWf3Ef16vxvQDZj0b24d/p8BAjyBonXA2A2WtU3UrjBIxZ/lTQ4MgvQbkdUUw5I/7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710019; c=relaxed/simple;
	bh=XujGJkZhCSkwHMGSuBJNd55TPO2Z4BJb7HiFfSAi9Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IKAF+5FLff2cbZzejbKYUvvq+4bom/EC0ZckcCfxtNUj5g3HMnHcMUkUzI9L0t5vaCBdJQhjddsQwA65N/0fATrizbxKiqmyqSWjWEYbBM3DoSNwiEptCeDTtYiNLG5kuUvww/GC8W+V55FEs1RGr4K+Aj6MQHraN3KFJf/p/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfj5ktEk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Ck2Dq002323
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TRUWHokJKC7m2iCGbohZyoJjf8FEo8fZCbp
	VE1hpGPY=; b=gfj5ktEkh1JuFJ8KseuLjyjciRAT211YtJPunx+55YzGIF670g4
	CqK0nwyr31guhCWtQDzY9ZcNdgymzM51SgjmQvJ5lkz8eoZb7TG9U/bAk03FHNkP
	jthjNq86zGaJKDBehWcCAVe4zPD0gMW0mxOW7zdE8LA0dHOLuuRp8gBdyWLKdg/K
	VHCOrXU/wEGB7VkAfdpQ9tzVjhP2+zqTuAyiuzxNb3hNtzaIQS5BF03LD/bphOKc
	dDITz5aXJ3b1/MpetI/XRB3DnTiA5E7GzNmDsZnRvo6Jc3UDBVAkhw6LFGOooV6I
	naFEbGqWipfgS3vE+zlJ6k+6IFn6Rp8FQvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59dbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:13:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so141531785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710015; x=1747314815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRUWHokJKC7m2iCGbohZyoJjf8FEo8fZCbpVE1hpGPY=;
        b=XaSiPImwbyvqzMRg0kg4XQJQs864IxN7+TtHybDIh9sc6ua5bBZtKL6Xtpj53bi20H
         PFOOcmbnfNw1IakNR45E+qdJcU19HEqxIfQBzAB/PVdmCQP/BpSFgP8vZDYf5ClatuDl
         /bVynRehUXUiNVonkenQ35hUtKjZw2DWaBshzS9qs7AK2C5TyzURX0DvSE7nudcta0Gz
         w+Ujeku9Bc6EyqTCrPxIes1LK/7CLHpa25h8JAIVOX2PEkgmhPulWKsvV9BL7t11JCbB
         QFZVRbvbTgGWxCRczlNKaTZw1gE6nTp955cD7RXAWgKcOhMr2rczGljuMGZJKAVRZhXR
         h9vw==
X-Gm-Message-State: AOJu0YzvflP0pPgbDuGyE8rtPAOErxk/Yv9QQSXlBErz7HyT82Tq9eJY
	mk6giNizIPi09aRraBR25DxynA6G5xKp2HjNNGwB4YDbOagB4UcM31/lTx8liGmvu7lyrmMNmtf
	R2ANlBmcFIkaxz9MBX08/S+KbJjWUSpT1ujhdHv7GyCDEchCo03LOQBGOUbV3yJepfz74R8im
X-Gm-Gg: ASbGncsF4T4SieuyjVNgfHxdQdqV+MJu3Ezhrl0TjCiEqEXGnHwIYlIFxHFHCL29mCe
	F79Aqdd2+3/huYgw4f8FgisglW7wqzM6seBu3WMELfMiWkXaBfRVuVUOm/o+fD9LM+t/E+9N9tf
	RzpjIsQ4W8DKqqpRRQx/JQMbMbva0hSoz4UfHu/QW5nA4yF5BeW7cIRosjUGEA6pR58Nb+p6617
	KhR2oafG6SYhAbW7XwYWj2dTYT1R6AdtYO0gqSILS4wnuIBuufj1ESZnKLBMYxPFnClyWCkJHos
	s1rc/p87g8d1hiEvyJtxxtaElfx7iQPftGYIh90=
X-Received: by 2002:a05:620a:318f:b0:7c0:a70e:b934 with SMTP id af79cd13be357-7caf73760aamr1248318985a.7.1746710015438;
        Thu, 08 May 2025 06:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDrhVc+yGPmNSfozBhPFrM2mPRVmMRXF9BT/DnRW3LWoaMYbKtuFctdQKyEiyRscqYA3Detw==
X-Received: by 2002:a17:90b:1e08:b0:308:65d4:9dda with SMTP id 98e67ed59e1d1-30aac1b49b9mr12384398a91.16.1746710003891;
        Thu, 08 May 2025 06:13:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2e499sm2135477a91.16.2025.05.08.06.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:13:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/3] soc: qcom: socinfo: Add support for new fields in revision 20
Date: Thu,  8 May 2025 18:42:56 +0530
Message-Id: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681cae00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zoRWVKxRGUSOgPgIeVcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5Mqa4A6F5QtSc1e_xcXAeQHZVd7ybc90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMCBTYWx0ZWRfX7SF7bC5bM3xL
 EljmKZRmj2F2MUe2fHg7FV6kudx3dS5AIjOZXTZMAXfN68RQtIp0sursSM2QdRS7XKMWwNuRhMJ
 uxdCyiifO1cHKXbmmM/E+rk2UiuLCng60Oq+RaMgUZfEfX/HCwLN7RZUNmGuofF9FFUwWOhpTy3
 u60iOvqNToyncCj2ijQgNNZPJgO7OvH97rEt2KtT4qOY1adp1wmGrRUSXNCxFg0qB31VU5vrLh0
 Z9u7fTNzxi+NIYjdR6ZyYMHXnYHQIDieqY+AdCYtk7y0RmjimU06iAr9wj86I2KV1IY8NmVBb0w
 SYdITw+TgyWW1P6MTrLos7CRtGv6pBGdBVe8G3A/jGlGjhshhVIB/4Lcp5CIQ9jPl5Ha1k8+99c
 62QaRaxlyNgH5E9Dv4LsU/A+iyn3kHUcgJbrA6KTqSyHBJjnj1icQp4mNr0i3GM7HMUeUVwm
X-Proofpoint-ORIG-GUID: 5Mqa4A6F5QtSc1e_xcXAeQHZVd7ybc90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080110

Add support for socinfo version 20. Version 20 adds a new field
package id and its zeroth bit contain information that can be
can be used to tune temperature thresholds on devices which might
be able to withstand higher temperatures. Zeroth bit value 1 means
that its heat dissipation is better and more relaxed thermal
scheme can be put in place and 0 means a more aggressive scheme
may be needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3:
 - Added Reviewed-by tag.

Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com/
 - Added debugfs entry and described more about the field in commit
   text.


 drivers/soc/qcom/socinfo.c       | 6 ++++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18d7f1be9093..9a92c9c5713e 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -153,6 +153,7 @@ struct socinfo_params {
 	u32 num_func_clusters;
 	u32 boot_cluster;
 	u32 boot_core;
+	u32 raw_package_type;
 };
 
 struct smem_image_version {
@@ -607,6 +608,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 20):
+		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
+		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.raw_package_type);
+		fallthrough;
 	case SOCINFO_VERSION(0, 19):
 		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
 		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 608950443eee..c4dae173cc30 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -82,6 +82,8 @@ struct socinfo {
 	__le32 num_func_clusters;
 	__le32 boot_cluster;
 	__le32 boot_core;
+	/* Version 20 */
+	__le32 raw_package_type;
 };
 
 /* Internal feature codes */
-- 
2.34.1


