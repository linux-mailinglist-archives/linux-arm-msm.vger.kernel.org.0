Return-Path: <linux-arm-msm+bounces-34541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF9C9A00A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 07:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D8B1F2203B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 05:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4FC172777;
	Wed, 16 Oct 2024 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A4kvvB+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF21125DE;
	Wed, 16 Oct 2024 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729056622; cv=none; b=T/yYH5FuwtQfoYodG5T4ADPGLaz3K1cP/Lr+7HqrGxb+O4PmN/iXTCyJNegK0qaQUSUcExfGsc6Ow4XB1GbCVgHA4U3oQO4jb4tz0ZbERWnEv93BzuHUlwPyfBikRY8i0wbSdSuKJ0T4DhXcYOlYvNJMCGWt4nHBq8JI3KSiCL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729056622; c=relaxed/simple;
	bh=XHTrbQJ8VUe6ESdMOUI42SbLo5OZ/7wvH1zZcyN1OYM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=E7iJf8hH+/W+fxpTqIlaDBfOH/LUVfOOVa/JvGXk6tYSU97ZVvtTBgDxr6fTZoxw8E6eaYUrl4vmqp50LjAV7+tZHwCuKtkSWWjLE3feVBZJYGIlDh9CJTRGkmHge2TLFryBkg94TFWy3fv7IrJqKY7WNHiKjOp1zQK0QNvipVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A4kvvB+D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FHTCue007577;
	Wed, 16 Oct 2024 05:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JiZHl7Mw3N447OWTxlaGmD
	HNTQ/+I47i4S0CTqTtEhI=; b=A4kvvB+DW3s7q5BPhUO1p7tzXQzpZkMcCqao4M
	bJbjeR8EeSLgj8e+JZDuitoH8RtmckOdLKExGlXLceTnvv8PoUj1vt81VFWC/7O1
	/fFAo+Cf2ftNNtcviwOjagZwTOXPsd8XWY9o+oqcHm72BP/MtFgyDje6dngTgjav
	zJQW7Bgc8bc+qMpMn/XFYKuKBrcHMM1FCdnrU9gaRXXpYBx9InyYyGdNzcHOJkAO
	D+85I2MDA/LjpVhj1dcjocgO6fcWN0SxFcCPxy7tqTa6AD3rAgqU7diOMwCj9WVS
	315aR8YJdKiGWlhlYDoRJYVzNtSJL67hTodvMk5mw45nci3g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh53a8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:30:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G5UDSW028192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:30:13 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 22:30:08 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v3 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Date: Wed, 16 Oct 2024 10:59:42 +0530
Message-ID: <20241016-qcs615-clock-driver-v3-0-bb5d4135db45@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdPD2cC/32NOw7CMBAFrxJtjZHtfMBU3AOlCOuFrACb2MECR
 bk7JhR0lDPSmzdBpMAUYVdMEChxZO8ylKsCsO/cmQTbzKClrqRRRgwYG1ULvHq8CBs4URB2U3V
 Hso3Z1hXk5T3QiZ9L9dB+OdDwyPHxJ3uOow+v5Tmpj/1/kpSQolYoEY2mstP7XER2uEZ/g3ae5
 zeHP0m9zQAAAA==
X-Change-ID: 20240919-qcs615-clock-driver-d74abed69854
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XDK5732K-Gf5IO3zOOjd7Co5QQWhPjrB
X-Proofpoint-ORIG-GUID: XDK5732K-Gf5IO3zOOjd7Co5QQWhPjrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160034

Add support for Global clock controller(GCC) and the RPMH clock
controller for the Qualcomm QCS615 SoC.

The QCS615 SoC is added as part of the below series.
https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

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


