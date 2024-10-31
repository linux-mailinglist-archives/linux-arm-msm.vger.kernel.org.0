Return-Path: <linux-arm-msm+bounces-36523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7809B7518
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 08:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0D00285AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 07:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0688114884D;
	Thu, 31 Oct 2024 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PWPaTihv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B63148FE6;
	Thu, 31 Oct 2024 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358910; cv=none; b=VFJb05UUyTWlepyX/AC/KUvQZDcNQyghyhyOXLfRI2tuz34qrKlQusxr+qMmz/LBkop97ah/SgXYhqb7khDy4MMVsEFTHnP4G+Qm7HrM/ISK3Xz5Q+RnLEwqJ272Os3PQMv0+oTXMW/5k4PjJxGQhtvACUi+QlHR/3E9PWhHkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358910; c=relaxed/simple;
	bh=Yc36R+F/QFHjSKd9rWbz702V1ML/+VDzPdmy9lJkvFc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=DRKeIzFkandj8CGZNYtsvTFX2vQqEX8qCxshSgHCJQj613iE5yKjsTyU+Cr4VBGQ7EHx8loxhlVExggeOIYwqZNQNjsIIepWv5WE+HkPg1zjza7kfZTvUVJyD/n1z7liyXkxI8QQLhKCnAxq0iapwv2tlHYCagfG6X8+21t5A18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PWPaTihv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V0FsOH012752;
	Thu, 31 Oct 2024 07:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e+f+/JR3ajiysqKx3SSgxs
	IG/T4kDf++R6wLUcx38Ko=; b=PWPaTihvf7qCcGDQMWxrEyzdbpP0dbC2oa7Jmg
	XqiiS7oVtSPOEtN6YFmQD4SC0wmqzQ9yid1ixV+ePR/nzAW/HAaF2pd40kOlZgvf
	/T8i+AXDWuQ+QEwj48uYpf80z0YidHQa3PSrVK7Ojq23gshzLxF8LqMPJPpYxFD4
	Jk50mnlPGr6OoIayD2lZX9N7eQ0BBqILmxEXjegbpVJaexZLv9M1BSfZkq1bYUzR
	37rRGJleehCp2A1gfOHzXb0hAEtd+M3QOSj2Wfku3KwCt62DZG9OY6vm+9qpgMO5
	ANJZmOMnE7vIvTn+7gbtAdXUC4oixohdfpj3VIfc5+OGeEqA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ky6r8w79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49V7F1Jk025957
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:01 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 00:14:56 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v3 0/3] soc: qcom: llcc: Add LLCC support for the QCS8300
 platform
Date: Thu, 31 Oct 2024 15:14:35 +0800
Message-ID: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwuI2cC/2WQUWrDMBBEr2L0XQXtSnbsUEruUUqQVnKy4NiJ5
 JqWkLtXtiFg+jkr5vFGD5FC5JDEoXiIGCZOPPQ56LdC0MX25yDZ5yxQoQGlQd4p1VqpU9cRSY3
 WAQUTgiWRK7cYWv5ZcJ9fOV84jUP8XegTzNcFpBqlN6CTjzyFKCeQSiLWVdk436pqf7x/M3FPO
 xquYiZO+KKAArXVmTDXvQHUNj97h9v6czWMIV8Tj6umuIaU7LLzULyvdli+uNzzyLY7+THxyje
 NIaNai9Zs+B/zB/yDgcJKJhsRtLrJ1VLPI21Ztxac8YDHjnsbh90QzwvE2RRkJl55PBQ+UPYpL
 WAdoKGyJdLOO6hhX/p9rbINVWh8nvf8A0UUXF3OAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>,
        <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730358896; l=2383;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=Yc36R+F/QFHjSKd9rWbz702V1ML/+VDzPdmy9lJkvFc=;
 b=+OiVZLY4rmdHdtpCrMHOHeW/idRjBDgtPb6fYQuK5vqB7KNDe0KbJoDo8tdUcqEN1J5hkPfoV
 E4LR16JfgWBCkcDnG8lq74AuvDjKRAA0TCkzeJ5I1zRPsSKEtB+UWZk
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rqzA2jx2yIcw1xyD4Z8yfL8NkvDAp_et
X-Proofpoint-ORIG-GUID: rqzA2jx2yIcw1xyD4Z8yfL8NkvDAp_et
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1011 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=781 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310052

The QCS8300 platform has LLCC(Last Level Cache Controller) as the system
cache controller. Add binding, configuration and device tree node to
support this. There is an errata to get the number of the banks of the
LLCC on QCS8300 platform, hardcode it as a workaround.

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
https://lore.kernel.org/all/20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org/ - Reviewed

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v3:
- patch rebased for using "num_banks" property defined in the config for hardcoding
- Add reviewed-by tag for dt change
- Link to v2: https://lore.kernel.org/r/20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com

Changes in v2:
- Hardcoding instead of adding property in dt node and remove related patches
- Add LLCC deivcetree node
- Add reviewed-by tag for binding change
- Patch rebased for LLCC configuration format change
- Link to v1: https://lore.kernel.org/r/20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com

---
Jingyi Wang (3):
      dt-bindings: cache: qcom,llcc: Document the QCS8300 LLCC
      soc: qcom: llcc: Add LLCC configuration for the QCS8300 platform
      arm64: dts: qcom: qcs8300: Add LLCC support for QCS8300

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 15 +++++
 drivers/soc/qcom/llcc-qcom.c                       | 67 ++++++++++++++++++++++
 3 files changed, 84 insertions(+)
---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241031-qcs8300_llcc-32ab1ce4eeac
prerequisite-message-id: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-message-id: <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>
prerequisite-patch-id: cdb161d351ba3ff4f9e53efaa67eb32b603af435
prerequisite-patch-id: dc04e235391820e4ab04c72ac64fd852e73fade5
prerequisite-patch-id: 6ca6eacd9ceca6d060d23ef95594fb892e51a506

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


