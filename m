Return-Path: <linux-arm-msm+bounces-46706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63361A253FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2207B1881B13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28FA1FCF44;
	Mon,  3 Feb 2025 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jt2hs9t2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B51FCF43;
	Mon,  3 Feb 2025 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570338; cv=none; b=Qnpiyz0YfA5ptDh2umJ9Hlx25c+R0OQUH5tDBdqBjJqgW/w+1o+tyqJLHrIabrFjEzAmwNNKe+ZtkmcxsK/29bYPkP5eo+iYKUQDNHH1UNgAJ0SVTJG0j7LsT6XJFQB5/EcjvQjEk9w0QvUVp8FMFzE72osUyB52FlXe91i1wD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570338; c=relaxed/simple;
	bh=hoAlfo9AMj/vm7RvYVcsJVY1Q94MIn2P6P3cxrunh+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nm27Hvw4t7rITv7kuM6BMy8XuES8xIPLJ6llUOClHtXtFoB6EMBFWltGbNZriJRagOJtWCk8JXE2KCw5oiG4wTMjj8+Qis4OLBPI6ev6TgTqxT6LMQKmo7/ohIicUoCAR0I2xsv4HVrL1AjoB3fe1d54EOJ8g7CydHlB8w/wxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jt2hs9t2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512MKKoW006815;
	Mon, 3 Feb 2025 08:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TauhzT/Zj8d
	caaXq+j1dlbBju4KtKskIUPO2zNPE54k=; b=jt2hs9t20JMr0dCiz2k/YHLwCwi
	UiyrJrvtfxKahxVBDsY+FNqhZ1hUdL5bAKO02kUbhASzhZShauowO8k5V0hwLmrf
	HGArQdca3bbFnAXLOg8arLjZxp38su9i5ZAnPfiz9BZxT/G7CUhwpRKhy8Gp9sY6
	TVUkgDU9CoOdWU0VUlwhS4CSWMxTNzrQeRGaIVEwLiZxy7m8CwSHCZCSitED75d7
	dSIBelME7EXCLSYpxNGKQO5yzSvlLx7xROzF7K+c+mGFQcR0Ts0yDUCy8oOwasnR
	Sq1WOIduLfA1fZVnknOm90i5HSjcDmaiwNqKjpgERDpraRrBFVGyU+dXg9g==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd42924x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:12:02 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138BV9X026176;
	Mon, 3 Feb 2025 08:11:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44hcpkshmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:59 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138BUd0026171;
	Mon, 3 Feb 2025 08:11:59 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5138BwoZ026872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:59 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 0D7D040BFE; Mon,  3 Feb 2025 16:11:58 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Keoseong Park <keosung.park@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes
Date: Mon,  3 Feb 2025 16:11:09 +0800
Message-Id: <20250203081109.1614395-9-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: jpeeSdrlelG7yiWRcCKMUiIK6dfgdc8t
X-Proofpoint-ORIG-GUID: jpeeSdrlelG7yiWRcCKMUiIK6dfgdc8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030065

Add UFS driver sysfs attributes clkscale_enable, clkgate_enable and
clkgate_delay_ms to this doucment.

Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---
v1 -> v2:
It is a new patch be added to this series since v2.

v2 -> v3:
1. Typo fixed for commit message.
2. Improve the grammar of attributes' descriptions.
---
 Documentation/ABI/testing/sysfs-driver-ufs | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
index 5fa6655aee84..9b1e22416346 100644
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
+		This file shows whether the UFS clock scaling is enabled or not.
+		And it can be used to enable/disable the clock scaling by writing
+		1 or 0 to this file.
+
+		The file is read/write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_enable
+What:		/sys/bus/platform/devices/*.ufs/clkgate_enable
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This file shows whether the UFS clock gating is enabled or not.
+		And it can be used to enable/disable the clock gating by writing
+		1 or 0 to this file.
+
+		The file is read/write.
+
+What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_delay_ms
+What:		/sys/bus/platform/devices/*.ufs/clkgate_delay_ms
+Date:		January 2025
+Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
+Description:
+		This file shows and sets the number of milliseconds of idle time
+		before the UFS driver start to perform clock gating. This can
+		prevent the UFS from frequently performing clock gate/ungate.
+
+		The file is read/write.
-- 
2.34.1


