Return-Path: <linux-arm-msm+bounces-45792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D53A18F1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159B23AA3C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9B21F7914;
	Wed, 22 Jan 2025 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jH+a12yx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8F0136A;
	Wed, 22 Jan 2025 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540232; cv=none; b=ODlpCdSwn5iCpVRN2dTuppWanOgA1KW784wrtNbkkVszkTwfEP2KJVtQnido1RDjfWRfal97D2f71iaXembO9SX9puQbDfE7IRBTsXRKCe+imFkisoEJF+FysrQcbAvhFYStckPt3+K1ofjherHGrVwnsvMNdj9h7FQGLCZH36I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540232; c=relaxed/simple;
	bh=TCVisUNh95ZTwFEMtbgOCS1jQeNW6d+f9M9FX1Tu/wI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BWA4HlnORZWjKO2C5jcFO8jixObpYft40glaxe8QhvYSTCf08/0mb5Vg2+wSAK05EzwoIT2elcxrK1tUG57L4Zdfq2qHqXBRP8mEOuJLtiHnzCGvu7GNDxNt+GAxWbwvB+w/kq6hGpOF3Q5aCfYFr1mNKdWR7UWCeZQdO/xprjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jH+a12yx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9Cqcs011278;
	Wed, 22 Jan 2025 10:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5m9cbx3Gw2/
	NbMkcGthNIJpUeU2PsUOEwk/8A//Z5wk=; b=jH+a12yxoXg0rXSjf6FJwrYmXf/
	6qA/GmkvOMRoqoOlaZoGw+uJDBUeBU4eF7KDyAGbcrNYTFFqL2aKUgKpwr43R1NX
	ZrbhfKPsCxFEv/z3eDEKlXgvi9qyIZ90JTH6ypxeiQhe5EWzbhVjEc2cXjMsBKYo
	2w8UpL17mHh+/YTkfb8VyjbXf4XwS+e0WIaqqEzNjiADQFCjbijYeZ3QPM7rbSzt
	gZoFB9fC1G2yt0113E4Vb1Fw1AaxN0hQTB/ZCNH4bOC0m7CS/WS5jaMclxmtvBs7
	3bf98F0QffAwcBYjE0r/L1o+U5X/tunYNZKi12Z1oNl8O7Sa6mU93q91hIA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44awuh04a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:38 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA33Vv006901;
	Wed, 22 Jan 2025 10:03:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4485cm3b9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:35 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA3ZJr007456;
	Wed, 22 Jan 2025 10:03:35 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50MA3YBF007455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:35 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id B70E440CE9; Wed, 22 Jan 2025 18:03:33 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Keoseong Park <keosung.park@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes
Date: Wed, 22 Jan 2025 18:02:14 +0800
Message-Id: <20250122100214.489749-9-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: Piz8SoCIMtIZQLd_r-JflvH8T8WcOKtC
X-Proofpoint-ORIG-GUID: Piz8SoCIMtIZQLd_r-JflvH8T8WcOKtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=909 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220073

Add UFS driver sysfs addributes clkscale_enable, clkgate_enable and
clkgate_delay_ms to this doucment.

Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---
v1 -> v2:
It is a new patch be added to this series since v2.
---
 Documentation/ABI/testing/sysfs-driver-ufs | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
index 5fa6655aee84..7f60821c29ca 100644
--- a/Documentation/ABI/testing/sysfs-driver-ufs
+++ b/Documentation/ABI/testing/sysfs-driver-ufs
@@ -1559,3 +1559,34 @@ Description:
 		Symbol - HCMID. This file shows the UFSHCD manufacturer id.
 		The Manufacturer ID is defined by JEDEC in JEDEC-JEP106.
 		The file is read only.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkscale_enable
+What:		/sys/bus/platform/devices/*.ufs/clkscale_enable
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This file shows the status of UFS clock scaling enablement
+		and it can be used to enable/disable clock scaling.
+
+		The file is read write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_enable
+What:		/sys/bus/platform/devices/*.ufs/clkgate_enable
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This file shows the status of UFS clock gating enablement
+		and it can be used to enable/disable clock gating.
+
+		The file is read write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_delay_ms
+What:		/sys/bus/platform/devices/*.ufs/clkgate_delay_ms
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This file shows and sets the number of milliseconds of idle
+		time before the UFS driver start to do clock gating. This can
+		prevent the UFS from frequently performing clock gate/ungate.
+
+		The file is read write.
-- 
2.34.1


