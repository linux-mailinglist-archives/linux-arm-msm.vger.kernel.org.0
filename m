Return-Path: <linux-arm-msm+bounces-57252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B3AAFAFF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D84B39C100F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5576A22A4F1;
	Thu,  8 May 2025 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4jUZa9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913F22A1C5
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710012; cv=none; b=gUM/qd/um9/8bsnmzGHDFEA1m+WnCAoglUWOTHK3fjCYTJea/mFiNPKQ+6e4/ZeA3+pxj8iWmfHoKxymUxnCy0jJRS2Ys7EHxnsJvHXKMXTrXUH5GvNdV2DxBOBce8lmXQCqoxX9R3WxFYcfo2kS2kGEE3cI2dpf0wG1X4c5U2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710012; c=relaxed/simple;
	bh=39lKtowy3pICwEKF1R5izU3l8zKwnzcqGSa95Y+dwBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBwQ7Y9PuBdRHBKx8h4KcphfB5Xs9LtkPWjzLUSupbb8ccmancV+mHC2jR8HLkREuMoPq1dDcftfMDrm9CrC9kjmAq+ap60SX+HX7ZTNZZ++u1BZpheCu1r+o1891Ax0dGR1Panu+k2+hpMJqhtBmCgm2I9xaAJyvxxMbdi2+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4jUZa9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cs62H008448
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8KZayw8bWAE
	pG6U2eryKSIHbza6t1WgC9YVOFUXwkQU=; b=M4jUZa9uXkIJ2lrYhWVbfr+WSjy
	0CNNpI8oy+aQeWWLgfnox2qhiDwbDvb7z7g9SU0kA+Qw4FEflXBPlvfiezP7l4gj
	aA0cgcAXeaYpJwifGhA5aaxUtJjjP+XLgoPsKO6N/loqiJz9PQcsbk/rex5Jow9K
	VQEigBrGYYebw2X8F73ZsKz8xjNwga2al6nYXzVc28pB5KMxldIViK7BwmgrQtyj
	Ac4Q3fpsATvGCkF+wvT+VnSIATTUeAEFHIG9EtslKPyuq3zQVjuzZXvfu3chrbQx
	Wxf+4Aj1FnPOEkl3SWcc10llCdqbifHhT++C1Fm7Q+liJZPRPMQzivixVTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59dxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:13:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3082946f829so1704839a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710008; x=1747314808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KZayw8bWAEpG6U2eryKSIHbza6t1WgC9YVOFUXwkQU=;
        b=bFTj+L51ejLfpXZKWhL43aVoUYT64dQZFGUjFuvN689UhxeVY4lQkMligKuf/QQ4ao
         /rE9OQ+IMDYMSIrSEA5QeKsbj6fILpQjOIx+24oUxZO6+9cYJPzIxQnU6SdH0c82YZk/
         gQ0aT9TQXLD3kjoEK59mu6uZ47LJdLwmpZ0dfFmW6axGeBp3Z145vBhFFEEhUsDc8A7G
         vjTwzSY+xeifAaV2ywnRcsSt68JnWMVbIfyg+W9kl56D/+O0mAl3w0ZAAMnYUTrdnimH
         YEObPH51CaCcdkSbL8GbGDW77d6JZ8xqi+tFoTbVi4Ww++bUtEAuDMfVtUEhI5EG8wbE
         mM3g==
X-Gm-Message-State: AOJu0Yz57XSt1NwowsW3LatIMZocbDJ9bGy3AK/KhJEoCcXuG+1ah4aG
	0yEnfl25NHO8yYJokByhdRoN10X0BrGxX5FFNi6bvJccZG2p2EWfrZyHUH+V4SUJ3Y9OcbD0k96
	vzkrGMxl1Ui2cPqJSpdYL7rwRiyyONHe/51aGz4VFevyKT8O2otdzr0a1mXb3aLSd
X-Gm-Gg: ASbGnctnXdsffHVDaQ/lzk6dy4FmZnIGvTx5MwO8zDxLxbTXYR3efcXsdxKMuH2xrwE
	GQJPqFybhdTZF5eOS/dTl40gc+7VkrViCuhshrZx7YiD5kMZ2ojxuOXzJKsEOyotF3UB+NvPet3
	pyTMUOMuN5r5RFaZwWuA+df2Cobohzqvgvu/YTpni52pJU5rfsXabhnEnzlBRIHD3M+AD9PM/xV
	aOWhfqh5ctU6JYuKRO/prn1xjVBpGUaztjlmd8xY6cox10uhM2f7/3nB8syNqikkp9BGWfpdJHk
	VgHe3VizBq0lGyK0VW6rbogt7JMEGOuHfwDV5UE=
X-Received: by 2002:a17:90b:1d09:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-30aac257b1dmr11703284a91.35.1746710008011;
        Thu, 08 May 2025 06:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTtDjE8pqu0/foquZITAqO1yInYezn2eYa5QWjI3Q9Gl6jLwwLSljPRQBSd0OVvMo4aimzyA==
X-Received: by 2002:a17:90b:1d09:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-30aac257b1dmr11703215a91.35.1746710007390;
        Thu, 08 May 2025 06:13:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2e499sm2135477a91.16.2025.05.08.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:13:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 2/3] soc: qcom: socinfo: Add support for new fields in revision 21
Date: Thu,  8 May 2025 18:42:57 +0530
Message-Id: <20250508131258.1605086-2-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cadf9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fWnH3FF9zq_3SJvIIGCXbtMfnnzjOhaD
X-Proofpoint-ORIG-GUID: fWnH3FF9zq_3SJvIIGCXbtMfnnzjOhaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX3Na2x0PbNiNZ
 7h7E52qvnUN5jL2tLBN10TJrf6JG48bFjVNi9yNPNlwf+ZrTjUDmEgtnzM3S2Q04FRDSMyEm6v8
 TUJKsWcP0YNpMYjsDTRiYRUChVd9HGPEsH5ecrbCjJyalogCFt0KH8mL6ooxHqb7vR1Blw0NkT+
 JLF3nT6OiFFPYhGZ673SHe7WKuFmQkVqJztX+cuBCqd4/cli6DTzFOAySDVnI9PQ51rfF6ffqvJ
 ka2IIg43CCkAvBwqMt1dyHa1YyKHz1ygYtYaumePGoUlW/KOVNZyfZCJWPuJL1HSyxDunzkkRFb
 epgEtxRvk1Q/Pf5RQlMmXfX/+mLZEr5tCXFtS3g26dYck6f6Hr+b315L9XFf6tcdyPs4wky+MfS
 d9VI9mVlu0pyT2PYJJ9u/iXsjRLqWRGKLv5IF8Df2o0ddY9EOVtjyDUVE0NISVuwuRGqfNFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080111

Add the subpartfeature offset field to the socinfo structure
which came for version 21 of socinfo structure.

Subpart_feat_offset is subpart like camera, display, etc.,
and its internal feature available on a bin.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3:
 - Removed debugfs entry as per comment from [Dmitry B].

Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com/
 - Added debugfs entry and described more about the field in commit.

 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 9a92c9c5713e..55acae79ec3a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 21):
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


