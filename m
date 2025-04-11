Return-Path: <linux-arm-msm+bounces-53972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8BA85860
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882A61895E5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F8727CB39;
	Fri, 11 Apr 2025 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkXp4lQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA7CEEB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365061; cv=none; b=Jf7JSgOELxdZpIwEgIb8d695W18Ksf7e8qP5AC1l9CP4v0ofA33y6SnedyTi/ydyD0pyipX+ZFWCQ3oTC6leau5FSFtWZ+VL2mNMdKtzm1tHOhQ8/Fqky/ejjhE7LRyb5sRw4mjLHjqfSfR8c3A21WQy8Mmx53nwEWR1oYQ0764=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365061; c=relaxed/simple;
	bh=OAmrXv4fKRP5dEicBxan4R+MR4jNBF0kOR7k+RwWr/I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dq9v2jRbnPRDs3yWLVwfwRAE9D0Ny/c3UqF+rlHrmMynuNb2T8Qq8JSG8cpI1kDAObHDEn7QGJYD62gpADf1TA1DDSROgzG97TBCqhAVOyxhMvy3Y9TGFTcQEXLEugiIitnd04hKbWlX6A00/IY8xR8aVQZDxZ1UC/bT3jA+XpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkXp4lQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B64l1v031905
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xypb37583HRw96ug/EnY88BmozjS7Dp9msK
	YYRNCohs=; b=YkXp4lQVnEckwZKUrz7BzTdTNqAiGWYGdu540G8yVUOaaJtwnNG
	fqCfZ+DHm/rrh4P1AY0V/foKLrhXhewIxZ23HiMKiJcD88vGPdYZAMeZ4/3KB0KX
	5oz25LsQRfTrkPQH4eV7SqhHayweE0A522WgGaTV1vya4it0NHQ+HHEAe1Z78P71
	BwaVswH3nGVu12d7yNR8Fa9ej99EFcccbs5qmY1ErnyFooBRqhLjEEuJGqzHC9Ng
	QYBSYT9mNRevgd2Yxhbk152eWfEyvSWuDZWr9R4gEzFphFka2Xb8v3bs2StR4Dga
	kWV8ioLjKXhOjafMwNjrC/jQGOxEH1icHGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmhw3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:50:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227e2faab6dso16277235ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 02:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365058; x=1744969858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xypb37583HRw96ug/EnY88BmozjS7Dp9msKYYRNCohs=;
        b=kTTB1nYgJGqN8Me/4nKxlxkhzJBDQ9I8W3aetXGCBIPv2bW4v3nPBJ5JUZXAzcXpm6
         ucI/FM0Okjtas8w6e4Stlqsok6Uw65Ksmv1QzT7TFno/C8IA9EK2b92H36n7gzsQojZ+
         4LuyNLsY2L7YM574Jk9FxA4T14nU0KEbLEPO9ENOgrt4LEc+acnsSdQMDXM2T6Rh4AeI
         TsRds8QrLKP3osDy1q4qmLcncoZfBLI792gbKk3JRsFJLdA/VgmhqOXUONK+Uq6oNm5S
         5Ru/LNb2WWCqRLUf2PZ1Lmg5iXoChZROJ/IC/O6KlTT866CnNeutvFsrJbLPHV5n8FK6
         UNMA==
X-Gm-Message-State: AOJu0YxobpIajl8szREiigR79lU4paN+J1vo6x2gwUQkiCZxG7RMA4mS
	4s2VMLeprcyc4VraNHQHHRZeyqwrKcix+870dAyLA3yDcvxSKBErg1qab5Qn8upl+H8hp5xckVK
	/f0iLuAmxejth4gXTWGzArCxH+hkPLuHn5FpYUpCVD5WeaNTaoNkN7rIz1/6Dtphr
X-Gm-Gg: ASbGnctiFX7tVjqDCT4A2d+ib7cbEd/K0X5CVveniYnvG7vhTLWKAWcwzAewgScloLG
	VrrpN60gRhrFn4X5XAs6i4bcKhCcKuNQ8m5SfRr5Ypof/llPKap4ojgMJOMQfpi62hYx5QlvTTe
	c41r9Jb4hkwmxa2zvz1S1kb2hc6DQzDB8OJy9rvi+MiGktf0exTicEO72sO+tfhQzm1N1mNu9rO
	kaHLA7D3RgpTJh6HbvE1LGMBW/fIiiUhe0m0KloME9x+/nQtGM7JTZi3mMDSEQiryDdhb8IV0mG
	6Y3HNyBxqB/o8gD7hp+PqAvCF63ZL5p5RQnUF2U=
X-Received: by 2002:a17:903:3c6d:b0:21f:768:cced with SMTP id d9443c01a7336-22bea495845mr28140055ad.8.1744365058287;
        Fri, 11 Apr 2025 02:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHhJwwebyAoVQn1/4i+u0YKkxKHiwCVGMq2ulrgX68bMl80txEhHqJIkYaBSrTqmcan3XRBQ==
X-Received: by 2002:a17:903:3c6d:b0:21f:768:cced with SMTP id d9443c01a7336-22bea495845mr28139795ad.8.1744365057840;
        Fri, 11 Apr 2025 02:50:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b87b9fsm45010875ad.54.2025.04.11.02.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:50:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] soc: qcom: socinfo: Add support for new fields in revision 20
Date: Fri, 11 Apr 2025 15:20:23 +0530
Message-Id: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nQ76E-yldh6zk3KhRlK3a1sM4AYmAWnM
X-Proofpoint-ORIG-GUID: nQ76E-yldh6zk3KhRlK3a1sM4AYmAWnM
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8e603 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110061

Add support for socinfo version 20. Version 20 adds a new
package ID, which is used to tune temperature thresholds on
devices which might be able to withstand higher temperatures.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18d7f1be9093..e56fb778e1cf 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -607,6 +607,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 20):
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


