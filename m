Return-Path: <linux-arm-msm+bounces-56985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C896AACB32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D420983562
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71F42857C2;
	Tue,  6 May 2025 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kx3UI59W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A4B285406;
	Tue,  6 May 2025 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549468; cv=none; b=TcylBfL5rpkiH163MDNaJEqS+1D+x1xhvqlpX0TYHzKIvbRhZGs0BDe3SiIbFpZK6lYhA9aLGD8lcXj1Eny2PPxH0R1Xj7slVh/se7Mqj+cv/uqh/1OtZlVGf2RKzY3cgvk5gxiTtbCJpSU+mbSBOnbjueWZek35W8YoE5nwn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549468; c=relaxed/simple;
	bh=rl+VdJnM8U54MEl4WHmsvqizGTzkQ+fz3Py8qHb+n/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7SRN/KduzwKMo644RwvoCCINovtd/MzeutXGX1ZJT+k2SkVxhWbm90fHUZrZXk6/ZLm+J20e03fjd7Pn6qq4Ip38ZAhLwCsyFOoK/w096rf/M+hWpRY0rG8bz+5dLFfOJCB7lxZc5AHpCON2bEJY5lLMpRCGxMbqat0z7NhNsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kx3UI59W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468FFKQ013247;
	Tue, 6 May 2025 16:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AnZXfvO2F4n
	jdN9SKiMeC1UFuBcsq368N5AF4Tbnc1M=; b=Kx3UI59W/cplb8j2ebmjukIrh6j
	zBKZc3N/9oIDp9SEGX2jKmaEo2WfbzBIEB0iJOiiACXlfPEzyCCa3yo/CA+b9DA4
	hXh9RN8HOhi8TcLEq4hS3SBBxLqcz3Zb0vBY2W++arYFU4QegRaiBJyp7DaQ0QIO
	OtLE8kj6aceZEOSjUZuSB3wkulble9J180nyipr9Ud3Nd6wH/ZZyT9I3iysKffT5
	C1DFpHuGix/vXhCf5eMw1oX2+ePKzAyGCfu4BL2S6As+FoSX5qiAjSUEp0+tZwY2
	FNhUMPIpv1TjkcIIwqa+qIjWRs+xieU97R5/S2Ig6hd3foBbWCkSj18U2KA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u42yn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 16:37:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 546GbCIE003142;
	Tue, 6 May 2025 16:37:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kx4mh-1;
	Tue, 06 May 2025 16:37:12 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 546GbBdK003137;
	Tue, 6 May 2025 16:37:12 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 546GbB9D003135;
	Tue, 06 May 2025 16:37:11 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 185885015A9; Tue,  6 May 2025 22:07:11 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 3/3] scsi: ufs: qcom: Add support to disable UFS LPM Feature
Date: Tue,  6 May 2025 22:07:05 +0530
Message-ID: <20250506163705.31518-4-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681a3abb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=xQxKfdDwmO31qOoK2vYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q1ylV7Bx-Ra_HMbSphY1rWezIYfnpAMv
X-Proofpoint-ORIG-GUID: Q1ylV7Bx-Ra_HMbSphY1rWezIYfnpAMv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE1NyBTYWx0ZWRfXzZPgNsenZhX2
 1w/6oZRFvytp8t7yL4dYm1xEPKyk6iFlYUOvXvNV0GpiClmgy8JS0JOy6R66WvD3rm6979YK+td
 htFa1lPb6YjdNkEtVlF8zn+6pCHVIBCCJLvFHX2DynYZ+VHJOpo77DDWQJEOdULslxn6m04Pzb4
 ZGHMm63a2EGjLLDE3thGrvQBQNbzpcBcLLgs3ZJpDvDGkdAzl3kPdAreWwOmohnAaYxgBXOfA3Z
 luWtshlKcViIhAai1FNgUEpvy35NSiXHJcdMcGQ12Oapl8A68XAdkJo0/b4WYIkalDOcxDN7b3+
 i9ErGktb77pAYzsr+8kVZLgKJGX0zrS1B7mnsSrazSVMswZjtNDO75N6AEMnGa1TgBnqTR5M4UI
 wGqfZXVanODrekzsHRKpCwclS1lOyqfwkttZLL7KnTZmw/MFfdUyXVbKZUxTWuSfjWpYqf8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060157

There are emulation FPGA platforms or other platforms where UFS low
power mode is either unsupported or power efficiency is not a critical
requirement.

Disable all low power mode UFS feature based on the "disable-lpm" device
tree property parsed in platform driver.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c0761ccc1381..ad4974c6d08e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1057,12 +1057,15 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)

 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
-	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
-	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
-	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
+	if (!hba->disable_lpm) {
+		hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
+		hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
+		hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
+		hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
+		hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
+	}
+
 	hba->caps |= UFSHCD_CAP_WB_EN;
-	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
-	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;

 	ufs_qcom_set_host_caps(hba);
 }
--
2.48.1


