Return-Path: <linux-arm-msm+bounces-28808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D6954D83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F2892866C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFD31BE23E;
	Fri, 16 Aug 2024 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="evjN0GS5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754021BE222;
	Fri, 16 Aug 2024 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821495; cv=none; b=X7Sauf5F3mD9LTVJUuqJzjCXCZ976jzgCIrQargR67L6xy80j+4rW2NFFEbTArZViqUrN969LpJWhysv7Zn6Q0bfFyHq0qnRAPE9AuXCh/r7sOzWuMP5gCQX6UzBifBQNufagI4RFkv5tGiw0nh6nOpp+GclVZIZ5ZUq2R8iRBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821495; c=relaxed/simple;
	bh=qObo8kHXnInQBzlR/cNjrltsirAPTB/xtD1p434BQx0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=DHLLI2/IMgH1KIjiGgOw45u+b0gZx6zy9O423dtW23DN/1FRjLGtIkC6h/oFK4UN0QN/DiZ5nTZ577IByUU2XCqwiE194UiumaT/4m6ftLXfS3rYz3k42pXiVZa8cqADbUMmB+9O/G+Yv4/oSBc6swrxwa8mHLleBga+nBsB1cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=evjN0GS5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GA7pFF025889;
	Fri, 16 Aug 2024 15:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jTIMxHYS5+aU+huatUlsxn
	djwuYPRmu9uAAoauJIt8Y=; b=evjN0GS596ouKXCQTFyZm18gB7qMT2Xggs9w4C
	fdUXDTvsxGIJ5Hz2/qtawMSLZx9/rclo1E+JKUxc02hxrgPLcURM+JgvTosivqvv
	XXNyFcYlNyLHAnwfj8gE3L9hIltAA8qv37yW6rmHugpLvAFUFU7U37iOhv5ABkkL
	LK4yDp530QZm5+icX3SMxdlrPd9Db5AcxJrEdc3wCT0MViNJ1sUQgZOVyEEBNkFx
	pgGY0Dmu9ziyTGgeqCSFdz7g8vKx+9OkISZ1prpdpxPnb6XvDLUcq02TSFDSYx4P
	Hc5BZiLI8KAf13IE11/xqFu2PTUvv/lPdpQahlAqrp0y0hdQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411s5pj78e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GFHTuf002970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:29 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 08:17:22 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH v2 0/4] perf/dwc_pcie: Fix registration issue in multi PCIe
 controller instances
Date: Fri, 16 Aug 2024 20:47:19 +0530
Message-ID: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9tv2YC/23OTQ6CMBAF4KuQrq2hLVhk5T0MIdAOMosWLD9qC
 Hd3gIUbl+8l871Z2AABYWB5tLAAMw7YeQryFDHTVv4BHC1lJmOZxFoJbl+m7N1UNvjmSstrbdU
 l1Q0wuugDUL1r9+LIAZ4ToeNR/kya2EWZcddiGSY/ogOSuVSZqnVitACbz4JtUIvD2IXP/iVVm
 /T3oVnwmJsq0VakCtJa3mjdoDdn0zlWrOv6BTcd6wfxAAAA
To: Shuai Xue <xueshuai@linux.alibaba.com>,
        Jing Zhang
	<renyu.zj@linux.alibaba.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Yicong
 Yang" <yangyicong@hisilicon.com>,
        Jonathan Cameron
	<Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <quic_vbadigan@quicinc.com>, <quic_nitegupt@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_parass@quicinc.com>, <quic_mrana@quicinc.com>,
        "Krishna chaitanya
 chundru" <quic_krichai@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723821442; l=1813;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=qObo8kHXnInQBzlR/cNjrltsirAPTB/xtD1p434BQx0=;
 b=8Zyxb5PmIxPy7bIIXA0DB7dGfalQ090aGkc3m1IgKgeJW5UcI7riqRNPPYzUnsUDSO558lDAI
 IH8gnAKIHhnDZzWWj3zuP5HwjwjJ8Jr2DPvtAhwRaORcIurOYT2maIi
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4X9q1koEuR8ieOz8Q6o_gmqVNIkMUAnv
X-Proofpoint-ORIG-GUID: 4X9q1koEuR8ieOz8Q6o_gmqVNIkMUAnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_09,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160110

When there are multiple of instances of PCIe controllers, registration
to perf driver fails with this error. This is because of having same
bdf value for devices under two different controllers.

Update the logic to use sbdf which is a unique number in case of
multi instance also.

When the PCIe devices are discovered late, the driver can't find
the PCIe devices and returns in the init without registering with
the bus notifier. Due to that the devices which are discovered late
the driver can't register for this.

Register for bus notifier & driver even if the device is not found in init.

Update the vendor table with QCOM PCIe vendorid to support QCOM devices.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
Changes in v2:
- Use platform dev id for instead of encoding again (Yicong Yang).
- Register for driver always along with bus notifier(Yicong Yang).
- Link to v1: https://lore.kernel.org/r/20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com

---
Krishna chaitanya chundru (4):
      perf/dwc_pcie: Fix registration issue in multi PCIe controller instances
      Documentation: dwc_pcie_pmu: Update bdf to sbdf
      perf/dwc_pcie: Always register for PCIe bus notifier
      perf/dwc_pcie: Add support for QCOM vendor devices

 Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 16 ++++++++--------
 drivers/perf/dwc_pcie_pmu.c                     | 22 +++++++++-------------
 2 files changed, 17 insertions(+), 21 deletions(-)
---
base-commit: b236787b0da563e3bad0dab1b4b9a5bb54eabd39
change-id: 20240731-dwc_pmu_fix-3729bd3657fe
prerequisite-change-id: 20240728-mhi_runtime_pm-2383b74c71ed:v1
prerequisite-patch-id: 90e73ba7ee4538c67f21f7f23ae4d931cb6e9967

Best regards,
-- 
Krishna chaitanya chundru <quic_krichai@quicinc.com>


