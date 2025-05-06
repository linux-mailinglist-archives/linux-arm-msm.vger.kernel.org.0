Return-Path: <linux-arm-msm+bounces-56986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB24AACB36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4E50983A32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2C52857E9;
	Tue,  6 May 2025 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dwAu3ThQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DFE285418;
	Tue,  6 May 2025 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549469; cv=none; b=ckVfd+JCe/uO5yEcEpD93Aj8Xu9Aouj90/iun0tclf4TxdYZdcYXShuuW7uCy4ZzHTeVHxA0C3K6LfzzMhCRCoMnThWO/G/v4KYaAl/4gQQirituVzzgHp5UF2xskvf5nY5QDbQU+DP+88wV/omwfIKeahystCJ7mK4k0tk/SaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549469; c=relaxed/simple;
	bh=dlaDVNVarITlY9CYIWm0GSWderQfXvYxZsIOs6wia88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDGG9Q6NWZ0txNf2C7QDGhvdr8yHdqjVFTWkt7TSn6kpoinVsw0ajhur/SZsVPfqEm8563sbImwymR68OssaQU5+E8wfICdXWGSGMzT8PM8QgSwqVi22wlbufZAD3lHBBzyNpBs3esPHViLrqck5v6r92Cr6MhBvwfKOGU7tVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dwAu3ThQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546G3YnG010387;
	Tue, 6 May 2025 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mOEqEL4uaUy
	DR2OeHXNRNTwUy+KjE/sWX+Qe7xUCJ3Q=; b=dwAu3ThQS2hILih5ZWz1bZa+I1B
	msTvApnO6WFf7u8DtIO5AFM5AO0gUU/XH92Ube3TiQ+S69VC856X7kaHO75dRXeP
	gClb5xdiVVopF2pLJ839+CL4kfukH9h/w+sCaXxHDWyGKi2M6zQW+2Fz3CZCLVhF
	xUNZCh3Z6adP0ZC6vT3RACF5uaW+qDmBk1HfCPnWoXSIng8buJ50C28afk/b2Et0
	kmWBd1HkMH7nEQq/TRXCEwswWsQrE7j4UwoNeUgY3mltsrdtQP4xqiOFUbuWcDE2
	f+8fbK8WlftJXlU5xMKnFIRuSo4OEQu0kF6ucUECSjd+OxglVBgdKlqOO0Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1g3ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 16:37:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 546Gb8jj003106;
	Tue, 6 May 2025 16:37:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kx4mc-1;
	Tue, 06 May 2025 16:37:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 546GbAdj003125;
	Tue, 6 May 2025 16:37:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 546GbAIg003123;
	Tue, 06 May 2025 16:37:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id CC0C45015A9; Tue,  6 May 2025 22:07:09 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 2/3] scsi: ufs: pltfrm: Add parsing support for disable LPM property
Date: Tue,  6 May 2025 22:07:04 +0530
Message-ID: <20250506163705.31518-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EzuMJVBkfzIl8xuKhqOW5jr8rC7X5i7m
X-Proofpoint-ORIG-GUID: EzuMJVBkfzIl8xuKhqOW5jr8rC7X5i7m
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681a3aba cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=UmUAYFU6QPnZDoKYRGwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE1NyBTYWx0ZWRfX01uvkH428Wb1
 p3laDn0FB50M3ykr8PJjV9q5ZVEs74SfJhx/acYABGB9Kkv4g14/8GYGmmJ3WQU0ILJjxIssWF4
 MbWdOOgtGYzm9Gxo+A6TKkg5B5XErxfbh82tfhjT8wmZS0HWiRQvbJT0CO8KD+XmgTXaJGOHKra
 8BoqZMpZ1mjhho3o8Uv9xTtSDHMjt/bxJbnSPpIb0vOrYkk6z7nHwi63R60YI7CWXPX1D7zDmlG
 g54VCIvDtU8ghM9gYCZojVz1rctE2eMfVuobSxRaU/uQcGv3ohiHsP96X3jn2TRsRJl5Lq3XrZv
 Fky2GnYXJUfpSZ2XafzqFp/di0oELmgFc4AHsGdLGNRUXYxiSOfY5TiGMQVBkHgrHrWxg8nNU14
 JvzX92hKz8HWpcJiO5o6CDwEpA1GiAlzhh+QHVYp2pxfWqsXpzBMRKGNTkygCrbwAoVen7cM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060157

There are emulation FPGA platforms or other platforms where UFS low
power mode is either unsupported or power efficiency is not a critical
requirement.

Add support for parsing disable LPM property from device tree . The
disable lpm support in devicetree is added through the "disable-lpm"
property for such platforms.

Disabling LPM ensure stable operation and compatibility with these
environments, where power management features might interfere with
performance or functionality.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufshcd-pltfrm.c | 13 +++++++++++++
 include/ufs/ufshcd.h             |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index ffe5d1d2b215..deed658fedad 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -210,6 +210,17 @@ static void ufshcd_init_lanes_per_dir(struct ufs_hba *hba)
 	}
 }

+/**
+ * ufshcd_parse_lpm_support - read from DT whether LPM modes should be disabled.
+ * @hba: host controller instance
+ */
+static void ufshcd_parse_lpm_support(struct ufs_hba *hba)
+{
+	struct device *dev = hba->dev;
+
+	hba->disable_lpm = of_property_read_bool(dev->of_node, "disable-lpm");
+}
+
 /**
  * ufshcd_parse_clock_min_max_freq  - Parse MIN and MAX clocks freq
  * @hba: per adapter instance
@@ -495,6 +506,8 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,

 	ufshcd_init_lanes_per_dir(hba);

+	ufshcd_parse_lpm_support(hba);
+
 	err = ufshcd_parse_operating_points(hba);
 	if (err) {
 		dev_err(dev, "%s: OPP parse failed %d\n", __func__, err);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index e928ed0265ff..5a3daed1f086 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1143,6 +1143,7 @@ struct ufs_hba {
 	int critical_health_count;
 	atomic_t dev_lvl_exception_count;
 	u64 dev_lvl_exception_id;
+	bool disable_lpm;
 };

 /**
--
2.48.1


