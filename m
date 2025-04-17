Return-Path: <linux-arm-msm+bounces-54639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE3A91CBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A0355A6DDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 12:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD9418E025;
	Thu, 17 Apr 2025 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jFLlJYtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7A94A1D;
	Thu, 17 Apr 2025 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894038; cv=none; b=gNCduksw1FE9q/9ZXSXil09oXmwK1dVO5gN4lSc6DVquA/UEGPqwzcJW1Q9/wH4rtHeKQ8+Q993WFHHkyG88hqoTsDLjEnZH1krdz0nni1IkV5Wj+R+YlG/OavAEKjoeYzYMEV66yjGeQJijZcOvQn+u1/u18Lck3FzU9/X07ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894038; c=relaxed/simple;
	bh=sCqOI5XE9+ReqUv3U5FWLE+xvD/rwXR0ZkP72J/kmb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIuHEdv4/TRo3lmkr5JkhGXPAUkUoYYgIHvBBolUDOzUhOzaYOVhit3h3jQg0lY4Ju3kCmRmfB9pAgUV5pEws76fHHY5Rug0346r5EtK0tXugKIJWlnJI8+y7wvuzuCediwlmp6i9mrJ8nMLpITf1VJOXDs8sBGC6RN1LxX4MBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jFLlJYtt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCHs9s001105;
	Thu, 17 Apr 2025 12:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vQ7WXOZTfi7
	P+sWU72u1AaljQME7uktS2zH73Qsnl+c=; b=jFLlJYtt5PItxSRixmnoOiBs0xa
	YLPLWESbHndfj6+33Mli7k6uuH0jVbiYknpSKSKFw9X96HY3fblKYc5Jp0pkmGyQ
	FO924RFCj6mubmSCKe5NM8kPK2kN+ZtSbyH6w7zQaSsPqz1lVdNXbcDGg99JQ+6s
	tY1bTbeyYXzGNK4DzIPWUK8KIFrm2XiCVU4Y8tmKHfGjluM53Eoj/wEwUqXwbQcv
	9nwszeQTwKnvMpvFcrPodmarlkOwh/+ZZ2tueZ3ef1A4LjWOuj0KkCKUtlB0z75i
	6fvtBL0gcK95En+RuqMQwB3Wp/XIO/W2Crk+u9xigDWFjB6KaprovHXHT+g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpxq0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:46:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCkn1x017634;
	Thu, 17 Apr 2025 12:46:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 462f5drtte-1;
	Thu, 17 Apr 2025 12:46:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53HCknnY017626;
	Thu, 17 Apr 2025 12:46:49 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53HCkmXp017625;
	Thu, 17 Apr 2025 12:46:49 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 53149501598; Thu, 17 Apr 2025 18:16:48 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 2/3] scsi: ufs: pltfrm: Add parsing support for disable LPM property
Date: Thu, 17 Apr 2025 18:16:44 +0530
Message-ID: <20250417124645.24456-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kscapPm-njnpNLT4_UNVGRRAe6MMxTbm
X-Proofpoint-GUID: kscapPm-njnpNLT4_UNVGRRAe6MMxTbm
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=6800f83c cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=6mhbvkD-5ye3TbouBuoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170095

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
 drivers/ufs/host/ufshcd-pltfrm.c | 15 +++++++++++++++
 include/ufs/ufshcd.h             |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index ffe5d1d2b215..764525d9262b 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -210,6 +210,19 @@ static void ufshcd_init_lanes_per_dir(struct ufs_hba *hba)
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
+	if (hba->disable_lpm)
+		dev_info(hba->dev, "UFS LPM is disabled\n");
+}
+
 /**
  * ufshcd_parse_clock_min_max_freq  - Parse MIN and MAX clocks freq
  * @hba: per adapter instance
@@ -495,6 +508,8 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,

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


