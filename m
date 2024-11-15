Return-Path: <linux-arm-msm+bounces-38095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 556BF9CFADD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 00:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8527B2B2EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A623117BB32;
	Fri, 15 Nov 2024 22:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N2jqwH+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6418E351;
	Fri, 15 Nov 2024 22:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731711125; cv=none; b=lfcJzlWX5tkhgXlNnpqY4o942+Q7NGziPe0MkxKduWNkzhxknTc+/hkxH1sV3d41hVRis1NjfGuopIENiAT74eq5pKD1zPyx4MfMMFt/7dzNljfMVhB960Frd94GpLnew45qsF/teTrBywz/lwQg5bGC6zPuQWnxPhAaRzGweCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731711125; c=relaxed/simple;
	bh=qwc3wHa/nC5D3ytFiLfrQW50el14wIHK2k5Jv8Yp8+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMuMcZw9b9QA61mBcoSV+yOtBMpaj9iJN1CzLb90a1ibW50uefO1Qcm5IO7YDb+aHs5lER/yO9FdWWPKMy5iyGHJi5+DXdJujZ9PUm285HOeOfd8BYHDLp0vHQjRTAODvZ9n5njfs/s1+22KuXtG8gfkGHxiUxh9pdQivN0bqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N2jqwH+m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFIBxYB017084;
	Fri, 15 Nov 2024 22:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lFzZwEo3JbDOX6WSbyrP/IX6NI1tQfO7eRy
	2XsygRpI=; b=N2jqwH+mObpO05dovFFmcq0/PhqJmqaZvJpVPYFiCUSyBHROZzv
	L/+L+8KLdhuCwefSwkrbm4Xduo11wa/wrgkd/9ICCAklJxde9QTACV7Bazoums11
	0R9ST0W1oUZ8zGWPyTYvmUDON4+oza7/jsuo6LuLpg2lXudYndHQ+qnmgIhUF1Yw
	0uXxeHir2w4SPQKr9qR25Ro8l0f7G6vqyDres8Um3v45PIVnd8WURQKtQYc8731I
	6IaefczQNSooWf1fOrERq1cpBKz9j3rnmVCtrRqwOtJ6jOxYNs7PMDUEtVbLvbdh
	R2/Eb7v6sHIrieZtFrIQVk/B9bGZmme21gw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wm75vj95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:52:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFMpvkO020279;
	Fri, 15 Nov 2024 22:51:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tn65de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:57 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AFMpuZg020253;
	Fri, 15 Nov 2024 22:51:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AFMpuoG020246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:56 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id CF6625A1; Sat, 16 Nov 2024 04:21:55 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v2 0/5] arm64: qcom: Add support for QCS9075 boards
Date: Sat, 16 Nov 2024 04:21:47 +0530
Message-ID: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-GUID: J_ZTtfXJcjOHyX0TVXKM5pAYBYPBoBgW
X-Proofpoint-ORIG-GUID: J_ZTtfXJcjOHyX0TVXKM5pAYBYPBoBgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150192

This series:

Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
without safety monitorng feature of SAfetyIsLand subsystem.
This subsystem continues to supports other features like built-in
self-test, error-detection, reset-handling, etc.

Changelog:

v2:
  - Remove unused dp nodes & update commit for ride vs ride-r3.

v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/

Wasim Nazir (5):
  dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
  soc: qcom: socinfo: add QCS9075 SoC ID
  dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
  arm64: dts: qcom: Add support for QCS9075 RB8
  arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3

 .../devicetree/bindings/arm/qcom.yaml         |   9 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 281 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  12 +
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  12 +
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/arm/qcom,ids.h            |   1 +
 7 files changed, 319 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts


base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
--
2.47.0


