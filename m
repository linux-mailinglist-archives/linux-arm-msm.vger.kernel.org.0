Return-Path: <linux-arm-msm+bounces-47401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0160EA2E88B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900391623F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898911CAA64;
	Mon, 10 Feb 2025 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hBkaZMdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C81E1C36;
	Mon, 10 Feb 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181786; cv=none; b=lWMQMFrLkn3adoudykNDtn4RkyHu45x9Cw/0BXoL38m3hsaLCik5m8OiBZBzwtTdjvTvqdsm6EkZ2oDm6zPlxcBi9NC4zJQJ2o582+m+RuLnsiC7+sC3buQlxI8VqbvW0sxTG8GpP5OkP6YUbS4FjHAzSz56Ex0sTIwzevTsaYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181786; c=relaxed/simple;
	bh=Vl7CYpPKWjPlphD0cTwlIw32L5/caGHj9VS8wq3Zrks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XGmwro4OVUb4GaGq1s0mbi+z7KQVyZcrEdwI34cSonq6Acjq/GjLzeoE6++4H6p5duS34x8vdjRfsB1WWe7XuIENCdUKKgDwghDJM3v/YeHVFAQzVkIGNC7dqLJbzofWv/haTjGg7ErXrGQn21dPr8ForqDa7Y3j5pJrqVwlews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hBkaZMdZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A8esAJ006164;
	Mon, 10 Feb 2025 10:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xzhBDGZU8rg
	1LGotryfUoD70f6sS8G30bKU0B7m5h5s=; b=hBkaZMdZ+hbQiX5JbmPQ5/8aZ+H
	GwAJsu7MzIP5FIMtuHLcp3p7syQ3QrA4GrRMtt668ZdSMu9ILuia4pBpqNmnqboM
	k1DeSY6zvOgcK9v2hUjbZdmWaywxEUCMqWw77MUwGfUAFCqJDuFNhFbsR7EIdAwJ
	KxraI5571iCj6+qxtJaTGgYtdtbugo97HJJenc1oYlTofTFOC52LGlj62bAwdU57
	kqEMl8CsVFqlE354NSOAOkB1lgguM4t+2QkKah1ZCQXGBKNEOliUMSUW+CRAWAcr
	H14XeVHcxtbzJvP6MtIzdiSLB1xd0OfMX8KDaHcVvq2rtjgmIJGlA/TW5Sw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mr8fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:50 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA2mTq012156;
	Mon, 10 Feb 2025 10:02:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkj1hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:48 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51AA2lha012151;
	Mon, 10 Feb 2025 10:02:47 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51AA2lJC012150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:47 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id BE5B540BF7; Mon, 10 Feb 2025 18:02:46 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Keoseong Park <keosung.park@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes
Date: Mon, 10 Feb 2025 18:02:11 +0800
Message-Id: <20250210100212.855127-9-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: yN9U9HwjFErnxI9kEP28W1ak-O7Gyx1E
X-Proofpoint-ORIG-GUID: yN9U9HwjFErnxI9kEP28W1ak-O7Gyx1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100084

Add UFS driver sysfs attributes clkscale_enable, clkgate_enable and
clkgate_delay_ms to this doucment.

Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
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


