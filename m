Return-Path: <linux-arm-msm+bounces-55648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A90A9CAF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C2FC3AD9CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13046253957;
	Fri, 25 Apr 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGMB4lZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1076026
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589620; cv=none; b=g/cWe50H+bTRz8xMx0VxeV745b2v4Dd9owVKobBbqCSCVbiChF6UHuOdH28m4i4fObDKRMFpQ7ykBBsRqXdkNyaeHO8wKYWer/qnNxrfp17WUP/INI71RLCjhbFoA08PMZCjXNrAl/iUFyUH5PkTcYdsUgRdsGx8VhfHKzbayD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589620; c=relaxed/simple;
	bh=niGpra8Jkq0c4F0+dPF9q2bhKVjcAH2yAfPH/XKp29M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y/+jsyxohdIb7nlxyuueXhNbqEFqe5DWvmFEOJabKjmwMlgOScqUWo9InvyGdxPRq3/VLFS7kmyuTkFHqdwtQcfdkVaLoAJA6pMMOMCT3cmBFZtr5PDmtQacM7CJbTLD89IbVK0xGWUPWW07dkFGU0YFJzOeuPTsFHUVMa/iBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGMB4lZI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TE21016172
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R8mXcE8GBrKkalZ3E2QfwH4IJLsCVriQeYb
	lZ4B4VhA=; b=QGMB4lZIv8kVafaaZ31L8xGrqVIc3yuKjdNR7PU1ZYX00rJnYZS
	nNg8zkVBc+cW/eeWsaGX/DWM7Ibhetj4lZXCucYsQ3YrGvCHH7nhXgZsYzoafoZb
	rq9i0Hl9gkOcwCUgIVoi65kshcLORX020sVeDGUnRUSmtS0n1QvOpugm1YSkkTbw
	vTcRC64VGx9HVQ+VqsXVaysp7o0Gvv62T3SF+g1vvWYPXFeQISO9QqK++eqWknE3
	3hY3hM9qAR+dYrns312eM4avQrv1Y08zoOrBi9MZkohHEu84KBnajxm/BUSlJ8oT
	h/8Cd/sCa5oBoO1Z1U0UFqsoTJPRSDyK4og==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh098th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-afd1e7f52f7so1488834a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589615; x=1746194415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8mXcE8GBrKkalZ3E2QfwH4IJLsCVriQeYblZ4B4VhA=;
        b=JgqUwtb37XQ4odrUuxM8BytJYPLNeQgWZplIquoRsEMiAxEo0x7w1oCN34GGsE1kmc
         XZAAzV5fR0t4nlYC8kvU+dXO6JB/3PC34lDPZvsUo7C4a97dgeoXqBXrj2b+knep63gm
         GeYczkSD7A1Wux39kgvWCTSCGRquUwRXwaHJ7ToVWGA3RHEgZbZHCJqxkzRTvLrLkUvi
         tSyndl75sb7fACxrZ+2q4wGMFyAoyHbWjufQncMk/Esin34L0AINmt16z2nKm5U92WQe
         zRhie1FemHTgEs/TeX7rSetZZVJcSJF6eaqKWym5t2NYoMcSN1FLKk/g+ieRZUjGrnO2
         LePw==
X-Gm-Message-State: AOJu0Yzbjo7whVxEqAqYgPuGO4jdjzCrsaDPoxiu049hACMrWsNJ6izj
	CIDhevKXkZuFQcnTPciFIaViCya01zSWdOzL+aeGdnWKRctAQ2l/yfLw7naEqjRlVev1HtIBiOM
	j16ft/uwxUURaMHQkIMHAwCVvTgFmnNrS0oMU2WlYs9YuXPI/ZsF6+3GKVigMcyRju8xgXNpa
X-Gm-Gg: ASbGncsV32duFuAf5fkuaOGUUNPdo2Uv8a2+GtlVtKS1Ebibx3oaRqAL/4q283SGG6h
	bsGG+Uq9JCLdGWZDLJ1LKkKvryCYlgAcZdk7AoV9100vnSvl/EoHA/AxTmUDhESwC0l7Hg3aybb
	VS6Zs3XEm3i12i8B3vNiGTlOj1MHYOM6BU7mv284GlxZFBjWbnBIgBYG+8c4p3EQLkQPGjAH9sL
	DsrQh5XR6LtRmIEcZqsBeO6wD4XL/Bm3xwosVV/w48v7DOVZqdIcrKpL8GeDnIziVUGnsnXa/bX
	/UminXsMrac16xNw+B//0+vytuPYZCL/APVRlOY=
X-Received: by 2002:a17:90b:4a46:b0:308:7a70:489a with SMTP id 98e67ed59e1d1-309f7eb2e1amr3532923a91.30.1745589613406;
        Fri, 25 Apr 2025 07:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNNIJYXro2LB2aA33RiU7904xrzr2j5MWTnNc/IjINAQLFzeh1hCAoOroDXwzC71r1iymLPw==
X-Received: by 2002:a17:90b:4a46:b0:308:7a70:489a with SMTP id 98e67ed59e1d1-309f7eb2e1amr3532824a91.30.1745589612552;
        Fri, 25 Apr 2025 07:00:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03ca86sm3470432a91.3.2025.04.25.07.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:00:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in revision 20
Date: Fri, 25 Apr 2025 19:29:44 +0530
Message-Id: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA5OSBTYWx0ZWRfXzBw1I7/aqI9c Psr7isnVTJXmwyiePVvOXeaMUGbsj7+M38Yqivt2wQLxCp3/i25OTeOnifr6sredmbxc1NBnluJ 8f9zj8d2tgdNllFglxjivuQy3SOnqoeD2LV2tDTv1oBvEQdDLcjlXeFRV7zs/3ALdTzHJXPdfeS
 Qo6hphkp3holtjvMoB9CtA/qECRhh+mi3nHZSTbYQBGFuo+DVN0CxdzV01BGFPt+tUYYWFNJOES TDZixft8IKCRIDcR00xEHHQLQaS7NMd0kqY7c4zY0dQSNCzoZQDb9HTe/2OInXQx+KhHafegdWz sYyzrtUFFBQ0Q9a8gGM2ObxGuitmp5nLUDt/yFKUDbnbltH0dm1psYcbUOB79jxZcIFW0dELNAi
 2gYrCPLGPX117hJ3R3jDBRQiuITMRkFOczPGhDj4PNRRLmOHIEPiVlZGAMwfQtPPYTRHiFPW
X-Proofpoint-GUID: 1u3zBYM_meWZdbErow55kpjIlYiiI26a
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b9570 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jD0WNwiO3up7LfJkFJoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 1u3zBYM_meWZdbErow55kpjIlYiiI26a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250099

Add support for socinfo version 20. Version 20 adds a new field
package id and its zeroth bit contain information that can be
can be used to tune temperature thresholds on devices which might
be able to withstand higher temperatures. Zeroth bit value 1 means
that its heat dissipation is better and more relaxed thermal
scheme can be put in place and 0 means a more aggressive scheme
may be needed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added debugfs entry and described more about the field in commit
   text.

 drivers/soc/qcom/socinfo.c       | 5 +++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18d7f1be9093..5800ebf9ceea 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -153,6 +153,7 @@ struct socinfo_params {
 	u32 num_func_clusters;
 	u32 boot_cluster;
 	u32 boot_core;
+	u32 raw_package_type;
 };
 
 struct smem_image_version {
@@ -607,6 +608,10 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 20):
+		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
+		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.raw_package_type);
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


