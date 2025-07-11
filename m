Return-Path: <linux-arm-msm+bounces-64550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0588B01A3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 535C47B76B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1B728725D;
	Fri, 11 Jul 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pkscwszf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4497EA920
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752231795; cv=none; b=Uut1gC66fzKRb+XqVfXV7Q1qLVwzPNzEagnBeboYBNwNhQAjZQutJ/KfSMA4sm+SeP2nH0UyIgPs3++JySktKpV30qivRgwCACIB1aIlhcYOeUAwhKSWM6oFcMIZ9bVNfxrptBgvgBhtAzpFXHD8aEJLZaKG9oyZU07VDJNJU38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752231795; c=relaxed/simple;
	bh=BHQtfj7pgtyPHgq1LJMellEr8B+k05wx+dKEVu5VrUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j5piD5gpH0hg6wBSsPPNAcC3XBsVlNFMCu93qKr9R8VIrQFyoyWQZqC/ABr8eDBanrHTOgTMWOxPtzBha53oj+luWCAQ6/GDi4ZG/A+zs9/SwpSADlO4zc+v8nTwcRS+4SN7FnQR+LXb3ZwlomDEmOew+arYnQ1gxhF69WW6R4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pkscwszf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XS2U031220
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=069tja+lXC6HN/MWKBoEA5
	Mvyzs8gI54C/BfhuxYQAQ=; b=pkscwszfqadDTE1UegMLq6DHfsU08rSDoBl7B/
	T0jGvvawLrd3NqyCfFek6IJgVNLbJbrEg8x5PXnLTTFEMQBk5IkXJpFNrh7/PxN9
	+/tWaa4jh7hUA3VAh19x+4naY1AC9zRSAkW3KlZFobI0MwNTxMx7mf4tMEebIn3L
	gAkJnGK3DeS31kWpxbunwhQtftN08PalrRIJ785XO3kCfR3j7fHIc47+9A8VVmGk
	1w9L8LgJbI2JEALWCuGMoJLSTkEM+n0A6KBafoZNm0uFErYgGyCUxXndVA8r2quG
	JlCYKPoSsFjnodaRMIobn4s1UaEUy0a3ie37VOH9LHgq+cig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbercve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:03:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so1649120a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 04:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752231791; x=1752836591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=069tja+lXC6HN/MWKBoEA5Mvyzs8gI54C/BfhuxYQAQ=;
        b=KAiFAHe5pij6f3uN3vBKc1R+RpcNSp7YTD46ygsCCkFMuDA46SaYCfluWpyZHcnM8Q
         k/2ynzCKC8m8nViGX2ojzAITX/6YPhUV2tAaQcwUgIBrtZ8rbkhBZyGn8ZFGEeLsTz4Y
         E4Ymatvy56sftqdZWmsAmUMoKbIYpMoVjVIGPQLpgZYFGiYaV7xM6zeFAs/wu53D/QVZ
         gkB1lReRQgu+kZ7Ry/SPwq5P0Y7SqFlwXYAgOS6rwGz4OCVxEPt0OKFjAktSKwhsb/Gz
         yFm9UVMfutf2K74yF1eQwxDde8mapHt3oc3kJYu9c42esZEDC8nSsi+CSv7S0Emmb65u
         4Asg==
X-Gm-Message-State: AOJu0Yz1fqKMu1uACMWhNWtW8zDeF0d5JLGGm2/eyvIWb/QFZf1BXi7K
	mQRbfsl2wEUG74XrUPDSITXtVS/Jeq5+mhwD9BOiNHEcy5x++RLFs6uWxipuBr++cTcwIzRoncF
	8LCNTxyaBa0iiJCeH0RJLEm+fzeYkaQW2ono/Gn/x3fSDDReN9MfB/mHPZVVA9tp8Y8gbCp7m5o
	c8
X-Gm-Gg: ASbGnctB3b23KHVG9oN7NOhE8hY6FakLElszCU6bX0V0MemdGKhujED0Ar9hiBXN2GP
	tLZ2rNPaY5LEs0aMMIHPIlgGSSjnA7mIFwDZKyHgTShTCkAxNZg623YviGNqS21cVTtSynSahl7
	vbjQhXWFH8nhTWgmFWZBbBxtkrzVasU4FJ7qtmorFKMH3CvOpwqJc7NiBCkGyV9/NkGHv0J1Sjv
	JzAeMr0rE6pM6wZrVOoUSr3q9yjIJT/X/J+XxKaCFNAI4mNcwPNueUEisIzf4EHpGNFHplywdYv
	dP4tKrLRjcGqQXVvQ/6DVBD0V9YHi0scM5kfQDwx06N/w1gb+DrREWonj2tYrtXdcrVV7RGREX0
	jNHt6oefPWPHOg2vsdi7gT0pGKUIH/tugvwQtccpqicIx25OiYKCyMxzrgtnsztGypOh+qm8+LT
	4=
X-Received: by 2002:a17:90a:fc44:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-31c4cd158bamr3859060a91.35.1752231791363;
        Fri, 11 Jul 2025 04:03:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYr7N8GJzEJcBkBd1R3pb1hOZYzeTwsHOoGn3TJWcYZbpgdQRuBgBqdo3m9J7JgwKDnw8EjQ==
X-Received: by 2002:a17:90a:fc44:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-31c4cd158bamr3859024a91.35.1752231790926;
        Fri, 11 Jul 2025 04:03:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c301eb975sm7942160a91.46.2025.07.11.04.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:03:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 16:33:06 +0530
Subject: [PATCH] soc: qcom: socinfo: Add support to retrieve APPSBL build
 details
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGnvcGgC/x2MWwqAIBAArxL7naCVFV0lQsy2WughK0Qg3T3rc
 2BmIgRkwgBdFoHxokDnkUDlGbjVHgsKmhJDIQstG6WE9T6Mm3G8mwv500U9lbJyrVa2nSGFnnG
 m+5/2w/O8FVGgmmQAAAA=
X-Change-ID: 20250711-appsbl_crm_version-6d304c851a8f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752231788; l=1328;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=BHQtfj7pgtyPHgq1LJMellEr8B+k05wx+dKEVu5VrUQ=;
 b=hOFxXFWRcLckklQbrYaheVxcsr3B88bXGTS5/aHoeoCVEKm4urcAs+lzy/GI9AA0JTxY5r0d4
 u7eAgKj5HcvDiHI6mudO3ibm/5N3+8xEmj//na7Mln6/chl4ongCpRq
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3OCBTYWx0ZWRfX2EtVgRiwH9bA
 vpdS3wXdqqKPokl0y6c6KBmggvl/5hskSa0WRxVgOtNzLIr+JOLkdmYCQ236bn2XLSrNW2oUzwG
 B3WjomOdvfOWNkI5aDoqJtDnFRqCSJZmukYrvIUh0Tcs1RXZbdEbMB0dk6Uh//v3mhaG84fE4pl
 F4fI5ePt83lGJqI8QLiFV/J64z1s/Aim8HONBGwOKGtgw20v/ufN+2dakl988zNbuPUezI4E5Q0
 tDF0O1qHDz2JGykdfgTziEIk0juCOAH8SP+FGXZCy+JDzHfVaB98cKvve1vo+acS3cNdG2/tnUB
 m6DDtCSM48xmwEJWHpQ1bGI96FX8qiu40CB4l/hjVf/+s2HT8Ks8iIIzc89LiQHy9LgQHgAmIz1
 DFJKF1moX8j1JFEZLT31yBvNbqTMaFh7nTS9NMpE0RBNdYGdgG/Zy2Qs+ZgzM8OJzqf/3HLP
X-Proofpoint-GUID: WGoXM0cd65BSrU_xeYuoo7hxbKg42YW3
X-Proofpoint-ORIG-GUID: WGoXM0cd65BSrU_xeYuoo7hxbKg42YW3
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6870ef71 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0tr5gUXQH48V7W0Z41EA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=814 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110078

Add support to retrieve APPS (Application Processor Subsystem) Bootloader
image details from SMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 391380820f082d8daa5c764d5f3c44e6240e18a2..dc8796ce5fe252cd03e98cd420c72760bb707197 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -38,6 +38,7 @@
 #define SMEM_IMAGE_TABLE_BOOT_INDEX     0
 #define SMEM_IMAGE_TABLE_TZ_INDEX       1
 #define SMEM_IMAGE_TABLE_RPM_INDEX      3
+#define SMEM_IMAGE_TABLE_APPSBL_INDEX	9
 #define SMEM_IMAGE_TABLE_APPS_INDEX     10
 #define SMEM_IMAGE_TABLE_MPSS_INDEX     11
 #define SMEM_IMAGE_TABLE_ADSP_INDEX     12
@@ -56,6 +57,7 @@
  */
 static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_ADSP_INDEX] = "adsp",
+	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
 	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
 	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
 	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",

---
base-commit: a62b7a37e6fcf4a675b1548e7c168b96ec836442
change-id: 20250711-appsbl_crm_version-6d304c851a8f

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


