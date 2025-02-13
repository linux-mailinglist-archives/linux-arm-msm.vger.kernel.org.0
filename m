Return-Path: <linux-arm-msm+bounces-47865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8263A3398F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B151A7A4D68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D186E20E717;
	Thu, 13 Feb 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nmb/QxB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3332620B7F3;
	Thu, 13 Feb 2025 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433684; cv=none; b=XL6yKxYw9B+Eqra+GvCTU4MJYE20ydWE2PJUNczru8o86pqjfmJ9UL95XZAtN+TBL9eODPSef0H6YqU8jrPjCbQn5+EKGyAGUU1rSpvo5LlSGXmu63F9h0TbrbTrY/5LD7Gzw7hekut0ul4uersXbt+Iw5D6yDkUH0SZVExidgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433684; c=relaxed/simple;
	bh=2HK6VWx6yAUzF3Tt49auVHEajJ0MfgYz8UUqOM9LsWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MJDmOOmkjPBS+sVcJzUC2o/0+bTF6VY63ygTYjsAON22tTNbNPFGapeCUl8FhkaVrj7U6Vy45JLo5Kx+RahTLr3XS+aqT0BRj5g8snQJmdFpOOWt+poasIQYHC7DLefSSoWDy41W9Equ1ksPk9cD4e4Lp2n1k/DUePx82PX4tXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nmb/QxB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7E0GM012216;
	Thu, 13 Feb 2025 08:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zeNKoNUXWN7
	q38WKulb9c2j79Cq4wy2sVXGqubIieEY=; b=Nmb/QxB+pQOpGBRpXD/KTG6H/Dd
	VLaBIeWXJhuCMwbV+wD9C8YNBaVdBUWVcv5Zlp6M6ulXoZc5cPHXbCazj6gRTJNJ
	NRY+gzfUJWRyrF6slB0q/Pq8t7EsExyfiN6b9cprmAl7U3ycEsHjz9AhDDN6vfVs
	XPL9auzZGvJMZwaillzO4UGt1EaBKnJQnQcHnjVUFETdtH+vK0OaBLUwAmFR8TdW
	SVMyJ53zLAorM5IZ7wcpvqhgYlW2mrzCk72k3q/8a50/yWdL1YTdA7T961Z97K6V
	H/fbjT7bSWFaUrOkjVRCJ9tee0UNoV50H0BBd4inFVE8LfHXbn6eNQkIQWg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc5u83g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:01:02 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51D80mnJ031719;
	Thu, 13 Feb 2025 08:00:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkyak7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:59 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51D80xIq032213;
	Thu, 13 Feb 2025 08:00:59 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51D80wKI032212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:59 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id F016840C04; Thu, 13 Feb 2025 16:00:57 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        peter.wang@mediatek.com, quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Keoseong Park <keosung.park@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes
Date: Thu, 13 Feb 2025 16:00:08 +0800
Message-Id: <20250213080008.2984807-9-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: ltfJGUWqJY3Ek81kOMh5sfRhD7Km-p8n
X-Proofpoint-ORIG-GUID: ltfJGUWqJY3Ek81kOMh5sfRhD7Km-p8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502130060

Add UFS driver sysfs attributes clkscale_enable, clkgate_enable and
clkgate_delay_ms to this document.

Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
---
v1 -> v2:
It is a new patch be added to this series since v2.

v2 -> v3:
1. Typo fixed for commit message.
2. Improve the grammar of attributes' descriptions.

V3 -> v4:
The use of words is more standardized.
---
 Documentation/ABI/testing/sysfs-driver-ufs | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
index 5fa6655aee84..da8d1437d3f4 100644
--- a/Documentation/ABI/testing/sysfs-driver-ufs
+++ b/Documentation/ABI/testing/sysfs-driver-ufs
@@ -1559,3 +1559,36 @@ Description:
 		Symbol - HCMID. This file shows the UFSHCD manufacturer id.
 		The Manufacturer ID is defined by JEDEC in JEDEC-JEP106.
 		The file is read only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkscale_enable
+What:		/sys/bus/platform/devices/*.ufs/clkscale_enable
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This attribute shows whether the UFS clock scaling is enabled or not.
+		And it can be used to enable/disable the clock scaling by writing
+		1 or 0 to this attribute.
+
+		The attribute is read/write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_enable
+What:		/sys/bus/platform/devices/*.ufs/clkgate_enable
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This attribute shows whether the UFS clock gating is enabled or not.
+		And it can be used to enable/disable the clock gating by writing
+		1 or 0 to this attribute.
+
+		The attribute is read/write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_delay_ms
+What:		/sys/bus/platform/devices/*.ufs/clkgate_delay_ms
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This attribute shows and sets the number of milliseconds of idle time
+		before the UFS driver starts to perform clock gating. This can
+		prevent the UFS from frequently performing clock gating/ungating.
+
+		The attribute is read/write.
-- 
2.34.1


