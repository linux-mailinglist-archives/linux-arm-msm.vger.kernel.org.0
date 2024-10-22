Return-Path: <linux-arm-msm+bounces-35407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA89AA167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 13:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C895FB21487
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B8019CC05;
	Tue, 22 Oct 2024 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P9hCBgiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2819B3E2;
	Tue, 22 Oct 2024 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597990; cv=none; b=b/3Da6JJ+u13bikpE4mLc+Yz2Zs2Zk/elqp/SxpN9oBOuWkShSrSLtw91QmJS+/GSxuzWPjfM73S6tpelO3TsAZNvvHdpZyEnl9K/uHwraHc30NVcIyqMX5V3NUSytwcupxoC0Kj1zvrVZh/WXlLzjCK+cI8E55/TPTB1NiDQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597990; c=relaxed/simple;
	bh=duAJVB67jB3EfrLJRzMVFOxQlswif5v2gDZx0jk+FsM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=c0K5eHfab+MWLgpk9dTq1hkq+JlMeqKL0ysPdyhF7k+42k4R9w+j5e2kYKUu2Td1OQS488CTOJHWCgFpUm4z5dq5Ok+rEyHiZ0r1diiAmT1khhdP9OoCup2KPdVUL5gXOvdVOkR77w4GG5PYCgwz4Jo7P+FRyTTIEdGQi+5/Aps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P9hCBgiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M9GVf5028852;
	Tue, 22 Oct 2024 11:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TXdrmPBe6s0hz1LeqF03Np
	DafUOgo+GNteZnyVOh8hI=; b=P9hCBgiLACBwTnb8F4fAH7syErn39QxUgi47nm
	OzNcKbrir0Pbovd8j8Uv7c83QHKuiCutZwaLJxJRXcOT1RyWTI9gBQZDPY1lxotA
	jU7gDoFn56rCbmi02u3Ho8vu7rRkkfUJo3M8mt1BJVQMvag5BejQRSF72HSOA34M
	stNqaSf5jHX6qdTYdrpzQGO8X9Bf1JZcPsmGNg/nFVBJax7xARyg2l5gQOFu1ZDa
	J/HEuFmoJ+UVhFlSYydsGHxxQ4iAmTpVJxPF9kgw4s1pWu6A4DmxVHxv/zv6R+LA
	aPDiRpThsIrE+XnFm+PjF51/MGPK490KuyW0RYzGiA4qG3+w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rbg4wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:53:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MBr01c008773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:53:00 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 04:52:56 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v4 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Date: Tue, 22 Oct 2024 17:22:49 +0530
Message-ID: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKSF2cC/32NQQ6CMBBFr0JmbU1bC1pW3sOwwOkoE5VKi42Gc
 HcrLty5fC/5708QKTBFqIsJAiWO7PsMZlUAdm1/JsEuM2ipjbTKigFjpUqBV48X4QInCsJtTXs
 kV9ldaSAv74FO/Fyqh+bLgYZHjo8/2XEcfXgtz0l97P+TpIQUpUKJaDVtWr3PReQe1+hv0Mzz/
 AZIBIqqzQAAAA==
X-Change-ID: 20240919-qcs615-clock-driver-d74abed69854
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sgcEyUoP0qZtF08GddCMrCrMK6wlbg-r
X-Proofpoint-GUID: sgcEyUoP0qZtF08GddCMrCrMK6wlbg-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220076

Add support for Global clock controller(GCC) and the RPMH clock
controller for the Qualcomm QCS615 SoC.

The QCS615 SoC is added as part of the below series.
https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Changes in v4:
- Update the comment in the code where gpll0_out_aux2_div and gpll3_out_aux2_div
are fixed divider clocks and not the PLL output clocks. [Dmitry]
- Link to v3: https://lore.kernel.org/lkml/20241016-qcs615-clock-driver-v3-0-bb5d4135db45@quicinc.com

Changes in v3:
- Update the gcc_pcie_0_aux_clk_src to use clk_rcg2_shared_ops. [Dmitry]
- Remove an extra line [Dmitry]
- Link to v2: https://lore.kernel.org/lkml/20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com

---
Changes in v2:
- Update the compatible in alphabetical order for RPMHCC bindings and driver.
- Remove the extra ":" from the GCC bindings.
- Update the GCC Kconfig for some required configs and move the GCC init
  from module to subsys_initcall().
- Link to v1: https://lore.kernel.org/r/20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com

---
Taniya Das (4):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
      clk: qcom: rpmhcc: Add support for QCS615 Clocks
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      clk: qcom: gcc: Add support for QCS615 GCC clocks

 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   19 +
 drivers/clk/qcom/gcc-qcs615.c                      | 3034 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
 7 files changed, 3334 insertions(+)
---
base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
change-id: 20240919-qcs615-clock-driver-d74abed69854

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


