Return-Path: <linux-arm-msm+bounces-44524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE38A07078
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB78E1885C1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 08:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9C12147E6;
	Thu,  9 Jan 2025 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wb4YXfsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0491FDA;
	Thu,  9 Jan 2025 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413179; cv=none; b=lGSF/IYxCNuXSq1L2X3LyCKGM5GG6gNbI0Li75451u4hk54kgvH8N2oviJUDYtvVF6+lJUPqqydmo/vU4lIFwJKaYTnPrni1Ltrdl/7MA5dh2rdSK8ym1MZFWUgid95IB+vBuYIa/hKR551iwvVIzNMzAHfol02AM7FXEhyZTmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413179; c=relaxed/simple;
	bh=KS1VjAxRQg3CRRKtln5ixibrNRlGZhqRwsa8jyFa/xs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=o5/q+b3Cc9pvmYUn5ajpFXrsoR6uSre53ZThNbCPaVKfLrw4VkXoaThSK7oi/mtS1DHCXcfiGpbunHUVd/hZXm4yX+iY1kqB2vYF91eqXkLJKhkpNCsIX5AQWlwYQ8FCqGTg9yAs/87obfxnSPfoiYJ9h+Wm7yuMbBuqBRuC8/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wb4YXfsQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098wbf1007216;
	Thu, 9 Jan 2025 08:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rz/rmzpthgZXQlGx2R90n1
	ahxgvYFOkuOwt4caxMvG8=; b=Wb4YXfsQj6XLCvdaA0+Zxy+6BO94F6aAzxcG68
	UQXNAbUpNCMPmWi7NyzPSu4LJdFPChNClkBYV8V86LBdt0iOGbgSR8kz74/f5QcH
	x55ij5EZLKygwUTzfBEMv4/C1kHq+d+/Qa6kfnRaDWfp72qfOVa/edaz4Kyz/O22
	Se71x92ZsZOA8dazgAI+ntcMDe2oDkNW9IwKkfdrXT7nuhoJM4uHUyIxhJ4Qr/iq
	GJi7x3kRNrW1i7t8Ra9K0v8PV9iAjEr234n23oeHjKB62Ggtlu8EYUHSxADDhhpN
	IoYsgRWJo7Zyea46EmZSgSU+91Nthw6simG3jiiqWeNo1o1g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442bdxg02e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:59:33 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098xXpA021014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:59:33 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 00:59:27 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Subject: [PATCH v4 0/6] Add support for GPUCC, CAMCC and VIDEOCC on
 Qualcomm QCS8300 platform
Date: Thu, 9 Jan 2025 14:27:43 +0530
Message-ID: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIePf2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDQwNL3cLkYgtjAwPd3FzdgsSS5IzUYt281HLdJEPzJGOLJEszQwsLJaD
 mgqLUtMwKsMHRsbW1AAEu851oAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OHSX5XI_OUj0Rf86w9TRAJH964xXsfFo
X-Proofpoint-ORIG-GUID: OHSX5XI_OUj0Rf86w9TRAJH964xXsfFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090073

This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
QCS8300 platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Changes in v4:
- Updated the commit text as per the comment from Bjorn.
- Fixed the CamCC QDSS clock offset.
- Link to v3: https://lore.kernel.org/all/20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com/

Changes in v3:
- Added new GPUCC and CAMCC binding headers for QCS8300 as per the review comments
- Updated the new bindings header files for GPUCC and CAMCC drivers. 
- Added the R-By tags received in v2.
- Link to v2: https://lore.kernel.org/r/20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com

Changes in v2:
- Updated commit text details in bindings patches as per the review comments.
- Sorted the compatible order and updated comment in VideoCC driver patch as per the review comments.
- Added the R-By tags received in V1.
- Link to v1: https://lore.kernel.org/r/20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>

---
Imran Shaik (6):
      dt-bindings: clock: qcom: Add GPU clocks for QCS8300
      clk: qcom: Add support for GPU Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
      clk: qcom: Add support for Camera Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add QCS8300 video clock controller
      clk: qcom: Add support for Video Clock Controller on QCS8300

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   3 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   6 +-
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   1 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 103 ++++++++++++++++++++-
 drivers/clk/qcom/gpucc-sa8775p.c                   |  49 +++++++++-
 drivers/clk/qcom/videocc-sa8775p.c                 |   8 ++
 include/dt-bindings/clock/qcom,qcs8300-camcc.h     |  16 ++++
 include/dt-bindings/clock/qcom,qcs8300-gpucc.h     |  17 ++++
 8 files changed, 196 insertions(+), 7 deletions(-)
---
base-commit: 4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
change-id: 20250109-qcs8300-mm-patches-new-b17b38b96188

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


