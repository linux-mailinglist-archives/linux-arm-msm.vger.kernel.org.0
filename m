Return-Path: <linux-arm-msm+bounces-3402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861068049C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 07:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06711B20A94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 06:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B81D531;
	Tue,  5 Dec 2023 06:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HvwOIf8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492D1C3;
	Mon,  4 Dec 2023 22:10:57 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B55JgeP027966;
	Tue, 5 Dec 2023 06:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=at1+xe4phxK+MdHVJ5zcS+DBk1A3GkNxsprxbjDuf0w=;
 b=HvwOIf8q37itqwnh8nW56z0SvNS2yTd0cAT0AjakVOSQ6j9+MplP5jw0ujBdmGPq3Xnc
 wdI1+atd6KG5DurxptofJHCTjJmo2tL/ViPSs7mWYOuaH8Du+UZ59GfwoVA2mYSlJ3sS
 j/65q0PCDrscH1a6riP67UqFqD7+AKdp8YksG3LXWSodLsNgkiVRmbaBozDOviRtEbEv
 YZYo31Z8fYK0sVYVUWFkKa9D+UtCgH267GTHV8Gihv51sF3BYZRz0eCNLVwgOyAjsI31
 jC+p7x0zpvdVsonf9RkQZ/uLqFSCDXCD7ciiTHEoJykh7Unh+TEkCHNp8/FzGWzq/a6f Rg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usghcsv0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 06:10:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B56ASVs002993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Dec 2023 06:10:28 GMT
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 22:10:22 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <quic_tdas@quicinc.com>,
        <quic_rjendra@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <neil.armstrong@linaro.org>,
        <abel.vesa@linaro.org>, <quic_tsoni@quicinc.com>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH V3 0/4] clk: qcom: Introduce clocks drivers for X1E80100
Date: Tue, 5 Dec 2023 11:39:58 +0530
Message-ID: <20231205061002.30759-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QtXztzxuLG0ZsbxQ1kZ3us6brGjAHNtT
X-Proofpoint-GUID: QtXztzxuLG0ZsbxQ1kZ3us6brGjAHNtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_03,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=694 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312050050

This series adds initial clock support for the Qualcomm X1E80100 platform,
aka Snapdragon X Elite.

Our v1 post of the patchsets adding support for Snapdragon X Elite SoC had
the part number sc8380xp which is now updated to the new part number x1e80100
based on the new branding scheme and refers to the exact same SoC.

V3:
* Rename gcc config to CLK_X1E80100_GCC [Krzysztof/Abel/Bryan].
* Pickup Rbs.

v2:
* Update the part number from sc8380xp to x1e80100.
* Use shared ops in the x1e80100 gcc driver [Bryan].
* Inline clock names [Konrad]
* Fix Kconfig [Krzysztof]
* Pick-up Rbs from the list.

Dependencies: None
Release Link: https://www.qualcomm.com/news/releases/2023/10/qualcomm-unleashes-snapdragon-x-elite--the-ai-super-charged-plat

Rajendra Nayak (4):
  dt-bindings: clock: qcom: Add X1E80100 GCC clocks
  clk: qcom: Add Global Clock controller (GCC) driver for X1E80100
  dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for X1E80100
  clk: qcom: rpmh: Add support for X1E80100 rpmh clocks

 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml     |   72 +
 drivers/clk/qcom/Kconfig                      |   10 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   26 +
 drivers/clk/qcom/gcc-x1e80100.c               | 6807 +++++++++++++++++
 include/dt-bindings/clock/qcom,x1e80100-gcc.h |  485 ++
 7 files changed, 7402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-x1e80100.c
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-gcc.h

-- 
2.17.1


