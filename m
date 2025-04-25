Return-Path: <linux-arm-msm+bounces-55649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD00A9CAF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244B91BC7AD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6A118E1A;
	Fri, 25 Apr 2025 14:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJV4SNRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC9255E33
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589622; cv=none; b=gwSGcFyojOYYoUUimrQsPsqVUga5tvHGB4htDDRf+QZSqmSkEai9ErqqGOXh2ZTf/o3h6nSqmaaqvxCzL16gEVRskItyWDaejVXMF8ZmCVJTBWSOISNt9B9eqcQIcbRS55eSgIFcV/uIN8kfuxcEhIguPh9jgoZ+y7yfpGYtC3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589622; c=relaxed/simple;
	bh=iwm9OooUWQdoBUOf5u2EIIhp9kjTk0ngHqyqQegt/0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dG8JqzooGxLft1lGD1D1dIl5sBPAD/nztPVJlPbOWY0YTjC35cmzRRnZo5eWxq19FZN1TcPpdKMJ2p4sjlahz8Spi5lckjlCxssTIXE7gDaESqTNYcLqNu7X9N13NuVE2CKq0C5Ld5P1/jxdupfacCra8hIDgylxhAHPST90Ooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJV4SNRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TJHJ015569
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L56NDXjZ8mA
	lJ6/qvpUv5Mw3+Om9ZpLMh5fPpNpp9xM=; b=DJV4SNRlHymLA/7JOtbodkw+sbh
	rfHN2poVg/ulTyjYpj3l5rNG0YEvNPmiP6ZGbMkPaY5uCOD+VhZvz5u4bOYSmgyR
	r7GfBQ0ZIqHpmOVTSiVVtiN39LTRjgLYMlH6nkDBJtUsSQtU39n7d4GuV3/LXiIo
	nYwPPLvXZAr3C9WBZyDMfqBs5Mv8T6p4+hEDqxjs1eduf1vx7SKg20Yp7AffY+tH
	5fEF3nPIVCwQvKf0ybqhtD3EQQOGFZbfHskXkXLRXL+IfCEopG/mgR48AeoyeDX7
	SEkHm3pc4B6YxSvdNtj7+LYd1ru/HxzYbFIDxX4iPCTVVSDLh/ShjaoYnVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3h5cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30872785c3cso3593685a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589620; x=1746194420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L56NDXjZ8mAlJ6/qvpUv5Mw3+Om9ZpLMh5fPpNpp9xM=;
        b=GbbWL8VKgtTxfrtLk/VqUSXf4eDHrD1LFmrYPiJPxxkGgT6TMWCW2wxSM0yhqbdQwV
         m5ip4IMaZ3a+ySorShi8T9/fQdGPzzsxlgXqnRN/JdOkNuorXsSMPA99RQty0viaILbG
         nPbofHHoUBO3gvTeNULNFMrCTcuJT3ZABtTil6IDSBvN6QwVT2oTFtxeLkW6/WdwqU9w
         fYyz0vB0D7lcapEz5JeeMC9YTSISzzDwfSHYlWvRIaZS0X0rinjPxxArD4bHYteCPa4X
         1yd0O4vF+iwT5SZpvrWsshdMDuIy2gOGgUXfv3uyzBE4ZlCVNwQGXJBL4DsAloVsgUKF
         5saQ==
X-Gm-Message-State: AOJu0YzaKmgeo+WG/uM/kvnUcf7/0a9i0N/SXWsjguSgJG3CpEUZNGFB
	syuz4wR43+m4Z8y4/AqptHXy2ysYaxV3rofywGBLgJsXwXIv5xYwF2vZtWytg5D9YMbCyxOGTgM
	DDy8PVg+yrzQuCw5DtxWiqLgiQwf4kNtM58bfh9nc/rmsztUB7QN2bZoPrIev9sBP
X-Gm-Gg: ASbGnctAHdakMVBVduc5C0UT5cFC+QtPZusxTxKgyDM9aBTm1G+Zsv1AyyS3bflfkXS
	ckCC269YS0AsDEw5jcElB1p7XvI3KjdpLr6VqxyRa7b0f79Rd+r2SB5N/WEl83WvCsnPIJfPUmn
	VXa4XuwfA5KO8kZxO1UNaKpivTRfW2cg3DZrdi1vOP23IdOVSraqzGEt3P6lz0QDbXRLULvd2Re
	qW+GSQNl1K0w0jjzlZcXBDSoaMkn54SXPeEpnvH9cTeaXmsD6p4+sD44v2F4Gn2LrkOo1+ZFND0
	ADo3Z37oJW4JpuzhjysRQMFIhBqgCDx0qT1VnGI=
X-Received: by 2002:a17:90b:2741:b0:2ee:c91a:acf7 with SMTP id 98e67ed59e1d1-309f7da6d24mr3888289a91.4.1745589619327;
        Fri, 25 Apr 2025 07:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFCSNNtmOBy+P5uUCdKDMn9Fo4idNZgKB+hc+w6SvdLeW3ph4TVq5Qbg8kdN818kgFjZdmfA==
X-Received: by 2002:a17:90b:2741:b0:2ee:c91a:acf7 with SMTP id 98e67ed59e1d1-309f7da6d24mr3888205a91.4.1745589618573;
        Fri, 25 Apr 2025 07:00:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03ca86sm3470432a91.3.2025.04.25.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:00:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in revision 21
Date: Fri, 25 Apr 2025 19:29:45 +0530
Message-Id: <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ruGIfrqb7FlnTmipSVrTeIGLqnCiJFX2
X-Proofpoint-GUID: ruGIfrqb7FlnTmipSVrTeIGLqnCiJFX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA5OSBTYWx0ZWRfXw/UADScXzEWW IQlXyKNddFG2Y6fpEkb3EDigL+JjoY07SmNYVkd4gvmAMsOID07r6soHUJLjxAdi/haAoU9ZoEG e4B6lY2g1lpRxjB3YgDqrjb8CqwxOatllR07DE3QfuVxNcqriRxgU98s7Agxy4wsqugFE31YyIY
 Whc3wU9miYmT3bXXwYN3hLSdwn/i8w6g3EUIaSHLxE7cY8w0F41P8wFTArJ6CT7BU3BRgK4bfQ9 HagZ7G4TrXdaL2DGpYKXELqY3Wol1gtfX6MKfj8K0IOAAQXOis1+8s+2wuU3k1HP+PWhv29zBOX 482ZNOVTXl06B/SAUmt2rUqE687zLFvAafj8QNdvALx5p1aOoWm3SDkLg7lstw+SMjAlld2yyj8
 R97OjkqykiY/GspGLUvbc8H96Afr7e9GGrstGGPhspVB+TeoWua4/mrxFHZaXcBHs2YO9Pw9
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b9574 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KzwQcsJEF2YzTSYNgzkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250099

Add the subpartfeature offset field to the socinfo structure
which came for version 21 of socinfo structure.

Subpart_feat_offset is subpart like camera, display, etc.,
and its internal feature available on a bin.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added debugfs entry and described more about the field in commit.

 drivers/soc/qcom/socinfo.c       | 6 ++++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 5800ebf9ceea..bac1485f1b27 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -154,6 +154,7 @@ struct socinfo_params {
 	u32 boot_cluster;
 	u32 boot_core;
 	u32 raw_package_type;
+	u32 nsubpart_feat_array_offset;
 };
 
 struct smem_image_version {
@@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 21):
+		qcom_socinfo->info.nsubpart_feat_array_offset =
+				   __le32_to_cpu(info->nsubpart_feat_array_offset);
+		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.nsubpart_feat_array_offset);
 	case SOCINFO_VERSION(0, 20):
 		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
 		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index c4dae173cc30..3666870b7988 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -84,6 +84,8 @@ struct socinfo {
 	__le32 boot_core;
 	/* Version 20 */
 	__le32 raw_package_type;
+	/* Version 21 */
+	__le32 nsubpart_feat_array_offset;
 };
 
 /* Internal feature codes */
-- 
2.34.1


