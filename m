Return-Path: <linux-arm-msm+bounces-80306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE6C3123B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 14:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4327C34E22D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 13:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2288B2F998D;
	Tue,  4 Nov 2025 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTIYGCDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ED8jlFSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6E12F3C11
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261770; cv=none; b=n0Q5CHGxwWRqIGJx8wTYe/pxJB3B9JmhCFld7zXhMprgu6K+ll4VKtkbFzzl/cN/F2QstRxs7gnHU57tQUV1M+9KVwagcMTbofXfJrCpCdnWB4R1Gu7m7SIq94LGoXJZTMNGfZw2S8xIgCeWLX6fbVeqQYN/reTfjqJsBCYTdnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261770; c=relaxed/simple;
	bh=Asg/iJSgjm3YQTmWCSn8+JiYS2W2rTC2HwWxNlCxi3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCN3ymSEsx+OkWjvpex7xNE2Csik69agBSBNBipSzjmcR8yqrKNiT2Xgt+A/GLp4SrY3QNmVvNMD6x6eOdHXnm/dfofr1sr8mNR29H5n7VADpfV83RofbGmU+rDjO0+T5MAvvmp+ZKIY05PN5toETiFXckKOU/lslWlJ6WjcFLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTIYGCDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ED8jlFSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Cfb1q1936262
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 13:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d0I41zXVausv5x03E05uNhQb3YiVj1PVmvz
	BDI/6lN8=; b=pTIYGCDz4wvxRohUf9X+tNAzA0yKxKFsz1fM/CLkzQWWdOnkV41
	QLD9yHzUNFZKcDB6/GGaXDcTc1AvSY/POVszZQy6CFOBOz60Sp46VrXv/E/tkQRr
	t7qaH6nhTulD0T9JlTdPp0gJe5TVhIePWUpM8pBAeHDfGZNnf225u5OXnCA9WD5X
	SqTG/axSgjle/p9Ps7rXugWf4e38wogOd5WfY/E1Mnu1GWT0c0u9Vj0bYwZpjzzE
	mt74hMC5KXxI5rryzFcNxcZto5CD7ujeH/EZqzwQ6jrOGD1ob2p63Ml6pY5K8vd+
	Hv/soYJ+Ygxo350K12DdRi+/U1MR4vzTvQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70fhu05v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 13:09:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2954d676f9dso26087275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762261767; x=1762866567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0I41zXVausv5x03E05uNhQb3YiVj1PVmvzBDI/6lN8=;
        b=ED8jlFSyzAa3xbvgojTqPEUjgTo2OA0rt/53Re0kDg6p0i65d2mQlxHy4pjWArWLTQ
         VQZFomejXxi9ODC4E4HJh2vNg9udk/n+biJ3JAkNOY0BImi8ehp6wxOuZWIASX7cHSZq
         TOBvCUm+lDloHBMpkGV9uHKAW7k/SMW69Ijhhj3z86ciPE6MeozjJyXnas5+bFY5ldL+
         OQIaQIgm8jR3rd7wQd6L7uUP682lB76xHnBGIsbDg+NMUjjIKoEdHXW0IArGWENWyp1U
         ibIjWzwnHCPgC9yEPed86ttU2zBLjGbuZ27pEky48T/rcwoilmsRTW1TK4MvLdVPJHdN
         bYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261767; x=1762866567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0I41zXVausv5x03E05uNhQb3YiVj1PVmvzBDI/6lN8=;
        b=KGT+7HiGr5OZfGCmFrC2ZQbk82OrKidyupCMqH+Vese4ou8bQ2nw2bK9GslgxxhdEl
         3vHVB1psclZvKZXn50jW2osXitYgtJBlIqeHn8U0gS8FcbvPEl6D94vFRFTnQg7b7T+k
         sNp59tLZfO4BnKi/Xfw4CxUqH65vBa/jT4iImhStuVGeS2jxot34o6W7dbEHMmPGDZcu
         g6uJLOYm4tGidi2S3v4rdOTQNIbAqLuGlQ88/eKNeWRdjamTuMG7MjyhiMfWH7POaFMd
         FUiHznzL9piDSmlQMJ1+EfNiB+ArnhLnINLi2wIMnQ4t4752ILbpIoZqwYEACr8+Szh2
         12nA==
X-Gm-Message-State: AOJu0YwTsBYRogLAEDbbLSmKo4oJcYZdxdy+B4RdVWNKYMKZ8MyAGGKy
	zWsnVOihaMPdkgNYObWw2z6oxkmClevd+7W+IufQnjddzcK9Jskozgg5shc7O+bNOOuJKD8VLRQ
	soytXe5FH2IFyjPKd78/4CI0oyb+PNEFP5G2MeLF/MR6MbdXylFN/K5n+ULeYJqOqnziD
X-Gm-Gg: ASbGnctKGrAJ0kWOZKib/GC7q9ucaNPd2XstoGkuDmSdE6nci+nZMBhuKzDySPoaEhF
	SNN60bYWLpgDlBMFsuJVdRQ4xn3bhSIro/XZ81LEpSC4hyPIyBCBwhCRMnaGpcbvQC6kE/cB3Ho
	DXzpcaDo4HyHmzYji2Ec/TuJkiWqHOQTUmiM27ntrF9u2/PWLVdmfZzQTTJ7XcjuJItaGhZzXbz
	ogkopsAexq+hncdy3ZyYzeITCqdVZDfLXnRWe3SuYiMcUCiDbX5J8qD8/ZW38+8keegr238qLU8
	2+jXUuGjtj4WKtvfdSvGF3s5R1CgK7cV4bt8//Wb+6PqlbD36TnfBKO/ptEce5F7aNB7Bl9lgF9
	EKabVRM1emg5RYF0tWojZwte32A==
X-Received: by 2002:a17:902:f60d:b0:295:ed6:4625 with SMTP id d9443c01a7336-2951a477a1cmr218785785ad.47.1762261764909;
        Tue, 04 Nov 2025 05:09:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhX8EMTM4gxgs+EOabroVGqDSuGRkIfqyGoxq9BUvt95tGdZNhjuQqp//BMHsw57uSUC7kqQ==
X-Received: by 2002:a17:902:f60d:b0:295:ed6:4625 with SMTP id d9443c01a7336-2951a477a1cmr218785145ad.47.1762261764237;
        Tue, 04 Nov 2025 05:09:24 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998c3esm27105855ad.41.2025.11.04.05.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:23 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 1/2] soc: qcom: socinfo: Add support for new fields in revision 20
Date: Tue,  4 Nov 2025 18:39:05 +0530
Message-ID: <20251104130906.167666-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwOSBTYWx0ZWRfX9CkVaFEbvV4y
 dBagAfFEDwCN9ONxu+4HVcIbsZ/YI5mDD1MrnIi7GjazYPM/R1+XoujK0ye4IDaHmZFY6KyHXnC
 xb9RboUVrVaEYSbx+H+5o1dx3C4ZGs8TVJy2+Q19yZb30eFMVuDgIrSyB3QMB8Ovda3S3+2ZMda
 Fsd2kzDfnHWwpOlOagW6XJfpbQ9exzIq9By95n8U5qq67KDxy0O0TdBvecNaDTxz7HQydYylTfp
 BqclCHVyAUL6YBZ+XYaw9aW5pKEQjbJH8n5Ox6TcSf2KYkxas49QvVjNL88V4kLalLWnuk5mvqJ
 zuwV/jk4VKqXoAhchoCHQnjqf/myHXrxOAVnM5aC9vP508lvrLGYj59xVCrRVIefvDJPdO+H7VH
 mYpAbnM1J74dkKcoipDpFx+jIvSdgw==
X-Proofpoint-ORIG-GUID: BZBe3oH3t4Ko0PmvSRJxuVCa8qqqi_nj
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=6909fb07 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zoRWVKxRGUSOgPgIeVcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: BZBe3oH3t4Ko0PmvSRJxuVCa8qqqi_nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040109

Add support for socinfo version 20. Version 20 adds a new field
package id and its zeroth bit contain information that can be
can be used to tune temperature thresholds on devices which might
be able to withstand higher temperatures. Zeroth bit value 1 means
that its heat dissipation is better and more relaxed thermal
scheme can be put in place and 0 means a more aggressive scheme
may be needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v4:
- Added Rb tag.
- Rebased it.

 drivers/soc/qcom/socinfo.c       | 6 ++++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 4fd09e2bfd02..77d0b8062208 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -195,6 +195,7 @@ struct socinfo_params {
 	u32 num_func_clusters;
 	u32 boot_cluster;
 	u32 boot_core;
+	u32 raw_package_type;
 };
 
 struct smem_image_version {
@@ -656,6 +657,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
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
2.50.1


