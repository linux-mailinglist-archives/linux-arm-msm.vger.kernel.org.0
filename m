Return-Path: <linux-arm-msm+bounces-57253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD4AAFB01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19BE59C335E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CD322B5B6;
	Thu,  8 May 2025 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ok1YrwKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061322ACFB
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710014; cv=none; b=mkaALBNCGi7WYi1tr+hTDfU64lL+eT8uXCDiR0nIkD5jTOcCqLKhE8kuwmuSBCFg6vbzAOrNnd9bsueJ8wX/3JcGmLAldQqCR0x/5r/0qYgCit2ZW2eiMuXXti6kW5yWoppVoNBqySSyHlrJ0vMBFHsFdh7pr7bNOQn9P+e+uKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710014; c=relaxed/simple;
	bh=L0Moi4f1O1O/7Z3W++9fu2ewfyT3ssNEmDKRTtyM2Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j4Ceu7PWXPStW6IRg+GYBN9dsSnE6yL7tgngXXPH5YnDnkLA9xrCiKGdcnwkk767zRMC0qDq6O9r48Xjy5S0NQk+PWlrIVoex6V8oKXmvqfS96u+NTvkfZZp4b2YJRSqfyVKTGGtOHngshVpdLoEII3OFLeNtudwnqWqqdu1yRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ok1YrwKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484X84K016151
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5gCvBHzV4SX
	gzzgzkWVLKwTim9/9MmKEiaEQq6fbHgs=; b=Ok1YrwKXz/fBAaix62DoKSxQWm8
	TQbddWnZ7Mcy0RWA2noj6kzoXrZ/Br6eOJBWs1OXiyzhCO19pxVGC2WhcjQTekES
	GBL6Y2PlWkE+dF+535tAWG2Qyy3EOLrf35hqNJDHAGOLXTZeoW7oFvAq+Zdw/Orm
	5kuzF5w0OVN9hwzkZUW1ENsvD5A/2i4+RXg1vtjRhRtbuUJCwqphSAZSl1I23wiF
	D0K0eZu6awfADLCtdemdgEfbVEBCbT00nIxEHacckvQbO/AB48HEBH0Kaw4YWx9m
	TcAQUdnYm+7kmU/cOmDSf99jii86lcAHPqIyBxUxFp8tkryEr1dEVIkmgdQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sd2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:13:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ad1e374e2so1084075a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710010; x=1747314810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gCvBHzV4SXgzzgzkWVLKwTim9/9MmKEiaEQq6fbHgs=;
        b=FtB5kahTp1rY0lpv1ZNS2aaTvHaEB1kTwXFUqWmOg6eOnZIayp4U5H662+6uB+0wRM
         TbC9SA50+65Wdq9bc4QElL5WjrbtFmWjZiz7VgP0yMjr1aj6hrnk9Y4Hb/BROt5qXyMc
         bPgwbx8UIGFfD1YTlpAWqxWUXkHlkClzulaaVu5UyzWW0Xw08xPM20iGHgBp0HekdXYl
         lRe4jiZ4vk66czOqctsP3WlRUjSxJMGHaF7zRSaYPdi7fZBgovPCsUI85/YhMon5fHU3
         m7BQkClWZy+yrXwhibJp3rKgBHIkniKDnxyS4Tv1mWIY8njHZwERvXBCigXctsBv+jfo
         qibA==
X-Gm-Message-State: AOJu0YxAZ+0gNfi9g4nIOzKhfYczTWsescXePpDtMYcdQ9pl2XhBy005
	M5J1pFbDwym6xEVTvPmzd9UX/cK+YrzID2PkynuzxKSZd7Hh15FiMqXYe8OCzNtwNu2h5RFajXH
	ib4A6gYdyYZJK+lTUND0xnrp290GC/FTqcXRxQeaMonxDR1u1cYV23ZCyhSXBnSCg
X-Gm-Gg: ASbGnctYIhrm3N31MTTxbnsIJ3hE/+Gb1mTwFcXpxw6/AUxK9dYbojA37IERKWNtPk3
	JNoYvHZZbPChEDtMIPjAlajxfvCtcuOfnIklQrShBmRbk33eltQW1ldJPg6Oh2UojPv6IdC2Tfb
	nH0j68dCfjG9TBHVHE7TaqSdhews7NtK9+c9km36Ob6p8nQmokxHVvU08GpsmEgmeGbu9bHnsvk
	69qhqe08d5f1/VOvQnFuJcCj1RJTCG+g6IENOeK8cvs8F+85tLsr8/45prvMSHXa76wTZanFC8S
	R/QLs9v1wIXBlcY/uE6DIwnZ5jJmbgSRz66lspM=
X-Received: by 2002:a17:90b:4a05:b0:30a:4ce4:5287 with SMTP id 98e67ed59e1d1-30aac093fd4mr13759716a91.0.1746710010072;
        Thu, 08 May 2025 06:13:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeJn4r2vJnVdLAy9QQ6STCGE+MtqmPNGyDNrVcPHKh1skv55MS2gSqEK8DVD8+uVCY1eedVQ==
X-Received: by 2002:a17:90b:4a05:b0:30a:4ce4:5287 with SMTP id 98e67ed59e1d1-30aac093fd4mr13759681a91.0.1746710009717;
        Thu, 08 May 2025 06:13:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2e499sm2135477a91.16.2025.05.08.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:13:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soc: qcom: socinfo: Add support for new fields in revision 22
Date: Thu,  8 May 2025 18:42:58 +0530
Message-Id: <20250508131258.1605086-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LBtARlPoug3b7OVj-iYIRzU4D3_gs1Nf
X-Proofpoint-ORIG-GUID: LBtARlPoug3b7OVj-iYIRzU4D3_gs1Nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX39PNIJAtCZ/m
 GYn73NrHbQppcTeDf8KXbwCvLxn6fcTCdScORc/Huq0JTshTRJFFV9n8rcO5bHd1krJYf6L9MfE
 7LVZLw58i6ijj8jCgUvuvuo6mgIxB/uTfF/iQ8/31V9OCaYIOI13ZWH1L+WnjlYWtNxKsAliVC4
 OejmepZVZAwWmV7JYWy8cKK70Ahc/yV080ZPOABNTkdBQHbjuRxavAOjJbHdeYR6hO+1Egix9bX
 Bq3u12YcpsGC0xrlT/G/BEcWgJQ4gveGa6xnH5jmdOR14lik0ElHagPI//8Q6DVUZUYGQ8EZ64A
 kqIdz09NRp3S6/Pg/Dr8iXrsvDoHfdTTYLCKtT3CvE6VJ6uLE+trxVFrDlu624bp2ioMsPD6Nm2
 CcDPrCV9u/j+v8wIoh2W7rrWVa+jt6l/3fTz77TV3yRvZrkOIdh8lf/WY3WkcTPndgeorcWj
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cadfb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080111

Add the ncluster_cores_array_offset field with socinfo structure
revision 22 which specifies no of cores present in each cluster.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3:
 - Removed debugfs entry as per review comment by [Dmitry B]

Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com/
 - Added debugfs entry.

 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 55acae79ec3a..7ae4c602e3cd 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 22):
 	case SOCINFO_VERSION(0, 21):
 	case SOCINFO_VERSION(0, 20):
 		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 3666870b7988..0c12090311aa 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -86,6 +86,8 @@ struct socinfo {
 	__le32 raw_package_type;
 	/* Version 21 */
 	__le32 nsubpart_feat_array_offset;
+	/* Version 22 */
+	__le32 ncluster_cores_array_offset;
 };
 
 /* Internal feature codes */
-- 
2.34.1


