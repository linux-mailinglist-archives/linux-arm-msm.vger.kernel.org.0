Return-Path: <linux-arm-msm+bounces-45452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4BAA15569
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2B071677E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546961A3056;
	Fri, 17 Jan 2025 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WHfpfH7e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52101A08AB;
	Fri, 17 Jan 2025 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133810; cv=none; b=I3qBRM6CQLWFd1y6CVGjMYAONgVbuWRywF1DRjDsJj5YWvbFoiaRzqyBxijuvsxGbhB5tAVeVGMx0weNFcOw2Jzi0zEgSxu1Q+gQg6Jznw35WYoC10WvnLzJtbG5SAOXlFj3Hf4jonED81gKmJn74HFsMFBL6/W6Mn6Rb+n3sQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133810; c=relaxed/simple;
	bh=+KhjX7dxF2SlpuIB6i35tSqjbM16sWx5iOvFBYbdCXE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XG96rJ/tFfX0eslEG2/dLMfII22Iax/3rqndyviFGE429DAZBePYVWmPsUvfBp5XZNHr1VbaAbGq4QKr+gRHH9lwxi2A8OAUrDu5qAwkKk3XdOl9Tv6gtBgFrJfBXWUGTBroQKXB6gYrWXD6CLKEyLEMUS3QEhQVif3wiI9gFq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WHfpfH7e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HC8igd006187;
	Fri, 17 Jan 2025 17:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZdyZ7SA63gjTv9VIk8QvcU
	sgPcWewcFyWZUKLCGCn8I=; b=WHfpfH7e8mDIdFd5JsJoQNd7rGUVTwMQ46PQ8N
	veH+m/wfm+9AUcydcgSesSbqe4JQ+shz5aSQ4xNkWbNsNnfSCY8nMO9fVU7yAKoP
	Q9quPib1Wy1EvroW1H6dxxMSHMoPXQkwoUhYv34RJMLJj3TD/iMKIjpOJJoBFayu
	58gYFmB5koyyBAGN1Uq7043m+vjhG0r668lCgI9JwV8X/mxMNnv0LRBW79Vn5wNL
	55MGAxrbe0wrky084/iCD7JKWXNTvREgImlCPZtehqXAC8oxzPQGrx9buLh83Ykx
	Ilbv7t2cQ3PRJv/TECYcPtAt42WV7IwrMlp6282J/yD5b5yA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447py0grc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:10:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HH9xpP030418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:09:59 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 Jan 2025 09:09:57 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH v2 0/7] accel/qaic: Initial AIC200 support
Date: Fri, 17 Jan 2025 10:09:36 -0700
Message-ID: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SY9SijRCak-g9_6qeOek30r5d73Ylvls
X-Proofpoint-GUID: SY9SijRCak-g9_6qeOek30r5d73Ylvls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170134

Initial support to the driver to boot up AIC200. AIC200 uses BHIe
without BHI, which is something that the MHI bus has not supported until
now. While the MHI changes are listed first to facilitate cross-tree
merging, they are not needed until the last change in the series.

Also, AIC200 is a different product from AIC100 with MSI-X, different
BARs, and different MHI configuration so we finally need some
infrastructure in the driver to be able to handle product differences.
This is expected to evolve more over time.

v2:
-Remove inline on mhi_fw_load_error_dump() and shorten stack variable
lines
-Simplify kcalloc from mhi_alloc_bhi_buffer()
-Inline mhi_firmware_copy_bhi() and drop the function
-Fix spelling of MHI/BHIe in commit text of patch 2
-Drop MHI_FW_LOAD_UNKNOWN
-Simplify mhi_fw_load_type_get()
-Rename mhi_send_image_bhi() to mhi_load_image_bhi()
-Rename mhi_send_image_bhie() to mhi_load_image_bhie()
-Adjust the order of mhi_cntrl init in qaic_mhi_register_controller()

Jeffrey Hugo (2):
  accel/qaic: Add config structs for supported cards
  accel/qaic: Add AIC200 support

Matthew Leung (2):
  bus: mhi: host: Refactor BHI/BHIe based firmware loading
  bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL

Youssef Samir (3):
  accel/qaic: Allocate an exact number of MSIs
  accel/qaic: Add support for MSI-X
  accel/qaic: Mask out SR-IOV PCI resources

 drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
 drivers/accel/qaic/mhi_controller.h |   2 +-
 drivers/accel/qaic/qaic.h           |  14 +-
 drivers/accel/qaic/qaic_drv.c       |  97 +++++---
 drivers/accel/qaic/qaic_timesync.c  |   2 +-
 drivers/accel/qaic/sahara.c         |  39 ++-
 drivers/bus/mhi/host/boot.c         | 203 ++++++++++++----
 drivers/bus/mhi/host/init.c         |   2 +-
 drivers/bus/mhi/host/internal.h     |   7 +
 9 files changed, 620 insertions(+), 106 deletions(-)

-- 
2.34.1


