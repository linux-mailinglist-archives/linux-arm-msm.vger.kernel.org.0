Return-Path: <linux-arm-msm+bounces-50458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3DA54574
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AF0F16B570
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72AE207E1A;
	Thu,  6 Mar 2025 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XdbymT3R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404718C332;
	Thu,  6 Mar 2025 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251359; cv=none; b=BOYq9bC8LGz4/2peWIkCx8dPk1oD9FSWb9s0ZnYwPXS5wZuVsdGndQv7cgJyXsCQkGBk30tMyXCcajPXJC7Jp8NNmGj1JSyB51zkV63zM7m3qf25dkfnmNzJWWfwaOSrWLxr52YFV8VGW7iyhUarxlcjpwV2WZIbNUOguqFQV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251359; c=relaxed/simple;
	bh=rrplMA1giUPvnYCIMBGB2ORNGAM++kqE4ZHmtlRdcZY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VkkvmXkNVah7q+NfjmhBunr/OHwHz7UP1oek3PJWkxj218yLESTxGqp/Ug5ypfAgRNzBSg7+6ctC6h7VsYJNB7xgdiTUBVD+zuQmIv1kesFRxj9AfTcwIM3k+cfNoIdDw4esc37aNR9PaFT6CRNY1Nhbnnvx9JcnL5N3UAMWPgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XdbymT3R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267mM60005500;
	Thu, 6 Mar 2025 08:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qWvgnqqBfBjTQ891TH+pRi
	yRqi6nw6mqD8qLl3N27qo=; b=XdbymT3RiN/uOLsutE63PUdfRTtbwJZ/JO9D9v
	tNIcZEdrIy4pD99JEADcVMw5K6bV2xxm318J+Da3YYI4NIA4a3fpHThsIB1Jvv9E
	ulMdnAszPXY/U4nXTHjZnRkPbcpNaKjY0CYWUVTUIBihqpP/NtU5KEsU5HO5/Rw0
	JCXtNB6RPAnvHJh/lqknb4gLpEfHCM/zRaCS0Qy1+KTL2gTCErLAan+y20G9ipmr
	qd76gg9n+RBLYKucdomU2d6v9K65pBpertb7ETarABt8qChLX9Na5S3HLrrl/7NQ
	Id9s3WAN24cNStXfLze1+CNqGHPMLq93lc05x3jmiEN+2VXQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx85yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:55:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268tqEo032645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:55:52 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:55:47 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
Date: Thu, 6 Mar 2025 14:25:32 +0530
Message-ID: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARjyWcC/43NQQ6CMBCF4auYWTumbRTBlfcwLHA6wCTQYguNh
 nB3Kydw+b3F/1aIHIQj3A4rBE4SxbsMczwA9Y3rGMVmg1HmoowuMYllT4TTMOC4DLPgZDH5WVy
 HttBnS1xpxVfIhSlwK++9/qize4mzD5/9LOnf+l83aVRILRemrLgx1fP+WoTE0Yn8CPW2bV+2d
 Ea3yAAAAA==
X-Change-ID: 20250218-videocc-pll-multi-pd-voting-d614dce910e7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zjQy09dJM6xidmzX-_NLhR44McM8i8rZ
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c96319 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=xpdHRz03M5ydJ-6NNugA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zjQy09dJM6xidmzX-_NLhR44McM8i8rZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=991
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060067

In some of the recent chipsets, PLLs require more than one power domain
to be kept ON to configure the PLL. But the current code doesn't enable
all the required power domains while configuring the PLLs, this leads
to functional issues due to suboptimal settings of PLLs.

To address this, add support for handling runtime power management,
configuring plls and enabling critical clocks from qcom_cc_really_probe.
The clock controller can specify PLLs, critical clocks, and runtime PM
requirements in the descriptor data. The code in qcom_cc_really_probe()
ensures all necessary power domains are enabled before configuring PLLs
or critical clocks.

This series updates SM8450 & SM8550 videocc drivers to handle rpm,
configure PLLs and enable critical clocks from within qcom_cc_really_probe()
using above support, so video PLLs are configured properly.

This series fixes the below warning reported in SM8550 venus testing due
to video_cc_pll0 not properly getting configured during videocc probe

[   46.535132] Lucid PLL latch failed. Output may be unstable!

The patch adding support to configure the PLLs from common code is
picked from below series and updated it.
https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Changes in v2:
 - Added support to handle rpm, PLL configuration and enable critical
   clocks from qcom_cc_really_probe() in common code as per v1 commments
   from Bryan, Konrad and Dmitry
 - Added patches to configure PLLs from common code
 - Updated the SM8450, SM8550 videocc patches to use the newly
   added support to handle rpm, configure PLLs from common code
 - Split the DT change for each target separately as per
   Dmitry comments
 - Added R-By and A-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com

---
Jagadeesh Kona (7):
      dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
      clk: qcom: common: Manage rpm, configure PLLs & AON clks in really probe
      clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
      clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
      arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
      arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
      arm64: dts: qcom: Add MXC power domain to videocc node on SM8650

Taniya Das (1):
      clk: qcom: common: Add support to configure PLL

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   9 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   3 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   3 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   3 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   2 +
 drivers/clk/qcom/common.c                          | 100 +++++++++++++++++++--
 drivers/clk/qcom/common.h                          |  17 ++++
 drivers/clk/qcom/videocc-sm8450.c                  |  49 +++++-----
 drivers/clk/qcom/videocc-sm8550.c                  |  50 +++++------
 9 files changed, 167 insertions(+), 69 deletions(-)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250218-videocc-pll-multi-pd-voting-d614dce910e7

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


