Return-Path: <linux-arm-msm+bounces-64150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4CAFE456
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33A1A7B01EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E100728642C;
	Wed,  9 Jul 2025 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TFCqqIFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E7286422;
	Wed,  9 Jul 2025 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053880; cv=none; b=cozxa3yxoQKCYGgd2MFW9BGqw3bP6rDoFR26k6bF3qhqSPNSYILrKyssqTtJvfjq7p1vwoT8iPyL/qiqU3ALE2gfnCnLaFycgdynibIeR3Pnc9LyFoDXGppoN7O/vWkpUiz2Tz/dkiAAvKqFyTKJT5tQRMxDxeM6P3kru/FqFPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053880; c=relaxed/simple;
	bh=R/Mrmbjqz9qW+yKtbzLUEO4ZFUbm43oyzl4LOCvlfNs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ti2Na8XSSEzuiR1rJ38sjWE3L56HYfEhmAS8mRHpZ25U31xLM6elNSHAeqJu081oCIrWmq19fgurBPDzftFWWVDyS5dowhub2UmeSK2UHa5SIz0toYY8nAvztEmQkj3/baRdi4BKXxcy2z4fH9+eR4I8h4hcjw/YJOdFpOA1IDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TFCqqIFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5698J9MQ008236;
	Wed, 9 Jul 2025 09:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pulPunlH2z/XL5p+XMl/BG
	yq43vwvOppJpxb90Jr1sM=; b=TFCqqIFJ1E8Af9D36dr/9gD7lCJe3fYda6+e4t
	sju2oqx0JMXl8yZKp0oo8u48UbfquveLEJrQzie6luGFk8bWlLVgZjceZDCVEen7
	RoCyYyAFICOYdgSZcW/afYosaM1vh3f2Ohz4eJogqwZDrGLdy4guOkRnPHIAj3gy
	U6SS7wDQJJW2qTaLojESZL1xecMHbAG97owEQx9LWVkuEskgGcRyIM2eR69DX813
	jNpOQujb6VD6q/x5fc5/XYvXz899rXnb4f+TfyZbbFUz/KIMUFxXwrD2aZ3yw+gV
	qmIi2ApuZt+S3MIAh1FbqJaZgwlMjsnizIbP00ndvCsckCxQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn3x3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:37:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699brC2024013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:37:53 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:37:48 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH 0/8] Reference the common qcom,gcc.yaml schema
Date: Wed, 9 Jul 2025 15:07:21 +0530
Message-ID: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFE4bmgC/xXLQQqAIBBA0avIrBsYDSm6SrQwG2s2FQoRiHdvW
 n4ev0LhLFxgMhUyP1LkOjVsZyAe4dwZZdMGR87TQCPuMWLmhEleLtgn8t7ZYGm1oM+t9IMu89L
 aB2hcFldfAAAA
X-Change-ID: 20250708-gcc-ref-fixes-3f05521a10b1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        "Srinivas
 Kandagatla" <srini@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686e3872 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=l5o_hXXZbb6RFrwtsEIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ALyzEuW73nZ81luR65ePC4FsCTsBwV7m
X-Proofpoint-ORIG-GUID: ALyzEuW73nZ81luR65ePC4FsCTsBwV7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NiBTYWx0ZWRfX5hEM786uYreh
 o+EIUHcTGoxyTqFHhLJsOJNIZmSWIfWk6tyMFb9l2vibjEDJpwjeU8OabqMLuW2no9B0hzs2JbT
 0m09HknWt9LjwYazBi2N8kyyES+OcURZlhTyrRnCf+Mqo3gUBaqGE0r1Ayowue1PKt+QMhbVk3d
 xJrODKChPHd+Gvae+givrj54exUh9An2CGalVhw1eQM69gAYPuU7MmpiYUjj8Gd076GaVxfevrD
 oWLxZS+DRkLkbEnpuL+TgVPsrdOujLLhhv0nVn8px4c8G6cICKLyAmV7FSjn0QxIoZsNhruFfcl
 vLMZgMPwsv/q6ZF0Tf4ZNbCwK5DpgouRRY8Th9BO069Nem9H23ZIPjoAK++rrj7Yg/KWGilZpln
 IK+Eh9JkwdhSnTHf5rMk2CzXr34VnKPHCkquLyk7Sw2XYOPn+MLCanKJgbbYeAkMIr/TDPkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011
 spamscore=0 suspectscore=0 mlxlogscore=702 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090086

For all the possible Qualcomm clock controller bindings
add qcom,gcc.yaml reference to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Satya Priya Kakitapalli (8):
      dt-bindings: clock: qcom,sm8150-camcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,lcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,mmcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,qcs404-turingcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,qdu1000-ecpricc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sc8280xp-lpasscc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm4450-camcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm4450-dispcc: Reference qcom,gcc.yaml

 .../devicetree/bindings/clock/qcom,lcc.yaml        | 17 +++------------
 .../devicetree/bindings/clock/qcom,mmcc.yaml       | 24 +++-------------------
 .../bindings/clock/qcom,qcs404-turingcc.yaml       | 17 ++++-----------
 .../bindings/clock/qcom,qdu1000-ecpricc.yaml       | 17 ++++-----------
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      | 17 ++++-----------
 .../bindings/clock/qcom,sm4450-camcc.yaml          | 20 ++++--------------
 .../bindings/clock/qcom,sm4450-dispcc.yaml         | 20 ++++--------------
 .../bindings/clock/qcom,sm8150-camcc.yaml          | 20 ++++--------------
 8 files changed, 30 insertions(+), 122 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250708-gcc-ref-fixes-3f05521a10b1

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


