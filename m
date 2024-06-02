Return-Path: <linux-arm-msm+bounces-21402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E248D74FB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 13:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED2BC1F21441
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 11:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE3D38F97;
	Sun,  2 Jun 2024 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YmrbmibJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8538DF2;
	Sun,  2 Jun 2024 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717328717; cv=none; b=TnuGAr7eCgHY4PC0Dd24yIug/Ta8P8MZdts2/F4XYcjxChGkstpZMRRJnvR2t+34KSt6BewETFJuaabzZvOcqOAMbasMtNm+ZP60muNiKxFbc53C0vhnG1OE6m+nHfIajZwKsUTZEms1e/qgWnrZZaIpxKTh21sY10gh3RcFSzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717328717; c=relaxed/simple;
	bh=wPCp7HcMegI7VYgSk7MAXbnf/xHxgUKglji2mKcI6Kw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VKd/kjziDJPHG8pIhCjE+EASO29/LvcHPv8ILRLI2wa0R0iJ8XPRTLP8sRvClloHSNMFUKaBMWGLkVJ3X4r+1bP5IWKWPb6OGqFzuGLKTa5OER2qeBsKKGHkkJ/AX/3tnKcpkO49rSggI6MJmEcr7oZjjEyvULpW5rdCOhyeYbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YmrbmibJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4529f5qY024902;
	Sun, 2 Jun 2024 11:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7t2NXDyp026l3fKwmbHkyS
	+wMjUw8rpzuC3VGniDBXQ=; b=YmrbmibJL1rpECYRoMhYizQh7xFGaGPe9n7xI5
	GNXd+cUibS5irc01BILKo/IHCKAofyZjoPipFvikotcTxsnWnqYKRLi6JM9d7wpr
	SjbkcfGAPxFPXAnDHYop+vQRhKYUDJhALv+q6ZygV97OdKPj3hosWphgdslgNMii
	tqQYXlnDmnLw/Kn2RStkW0q8MBX8gX6ulINimdyqSrK6UoQpeeVxYvG+bsKcPEq0
	DBRnOI+lO8Viic0KybOtZ8hpI1wlgA420F7yoaZJluPQWPAt6XXby6FUj4XLbyjV
	3IzbKbiYEPJs2Abthavcs8VMHbP0jH2CDGuueoLCP+4I6DJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5t1xgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Jun 2024 11:45:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 452Bj94k029818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 2 Jun 2024 11:45:09 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Jun 2024 04:45:04 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Subject: [PATCH V4 0/8] Add support for videocc and camcc on SM8650
Date: Sun, 2 Jun 2024 17:14:31 +0530
Message-ID: <20240602114439.1611-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: WP_O0fU9f4MAOc1qSntMVDrr74YSkdRC
X-Proofpoint-GUID: WP_O0fU9f4MAOc1qSntMVDrr74YSkdRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_19,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406020099

Add support for video and camera clock controllers on Qualcomm SM8650
platform.

Changes in V4:
[PATCH 1/8]: Updated commit text. Replaced :: with : in SM8450 videocc
             YAML file as Krzysztof's comment in V3
[PATCH 5/8]: Replaced :: with : in SM8450 camcc YAML file. Updated commit
             text and dropped Fixes tag as per Johan's comments in V3
Added R-By tags received till V3

Changes in V3:
[PATCH 1/8]: Split incorrect header file name in SM8450 videocc bindings
             into a separate patch and added fixes tag
[PATCH 2/8]: Added new header file for SM8650 videocc to define the extra clocks
             and resets on top of SM8450 videocc bindings, Dropped Krzysztof
             R-By tag due to these changes
[PATCH 3/8]: Updated SM8550 videocc driver to use new SM8650 videocc header file,
             added Dmitry and Konrad R-By tags
[PATCH 4/8]: Updated offset variable name to sleep_clk_offset in probe and added
             Dmitry R-By tag
[PATCH 5/8]: This patch is newly added to fix the incorrect order for SC8280XP
             camcc header file in bindings
[PATCH 6/8]: Fixed the incorrect alphabetical order for SM8650 camcc compatible
             and header files, added Krzysztof R-By tag and Vladimir Acked-By tags
[PATCH 7/8]: No changes, added R-By tags received till V2 series
[PATCH 8/8]: Dropped required-opps property in videocc and camcc nodes and
             updated DT file to use new SM8650 videocc header file, added Vladimir R-By tag

Changes in V2:
 - Updated commit text for videocc dt-bindings patch as Krzysztof suggested
 - Moved videocc XO clk ares to a separate patch and added fixes tag as per
   review comments
 - Inverted the logic in videocc probe to add new SM8650 specific videocc
   clocks based on SM8650 compatible string as Dmitry suggested
 - Used module_platform_driver() for SM8650 camcc driver
 - Updated driver name from cam_cc-sm8650 to camcc-sm8650 as Bryan suggested
 - Used qcom_branch_set_clk_en() helper to enable clocks in camcc sm8650 probe
 - Added Krzysztof and Bryan Reviewed-by tags to dt-bindings and camcc patches
   received in V1

Previous series:
V3: https://lore.kernel.org/all/20240430142757.16872-1-quic_jkona@quicinc.com/
V2 RESEND: https://lore.kernel.org/all/20240321092529.13362-1-quic_jkona@quicinc.com/
V2: https://lore.kernel.org/all/20240220135121.22578-1-quic_jkona@quicinc.com/
V1: https://lore.kernel.org/linux-kernel/20240206113145.31096-1-quic_jkona@quicinc.com/T/

Jagadeesh Kona (8):
  dt-bindings: clock: qcom: Update SM8450 videocc header file name
  dt-bindings: clock: qcom: Add SM8650 video clock controller
  clk: qcom: videocc-sm8550: Add support for videocc XO clk ares
  clk: qcom: videocc-sm8550: Add SM8650 video clock controller
  dt-bindings: clock: qcom: Update the order of SC8280XP camcc header
  dt-bindings: clock: qcom: Add SM8650 camera clock controller
  clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver
  arm64: dts: qcom: sm8650: Add video and camera clock controllers

 .../bindings/clock/qcom,sm8450-camcc.yaml     |    7 +-
 .../bindings/clock/qcom,sm8450-videocc.yaml   |    6 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   26 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8650.c               | 3591 +++++++++++++++++
 drivers/clk/qcom/videocc-sm8550.c             |  156 +-
 include/dt-bindings/clock/qcom,sm8650-camcc.h |  195 +
 .../dt-bindings/clock/qcom,sm8650-videocc.h   |   23 +
 9 files changed, 4005 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/qcom/camcc-sm8650.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-videocc.h

-- 
2.43.0


