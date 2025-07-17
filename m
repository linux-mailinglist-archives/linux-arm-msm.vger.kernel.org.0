Return-Path: <linux-arm-msm+bounces-65378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D175B08515
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 08:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F0D37AF44C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D801215767;
	Thu, 17 Jul 2025 06:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KPKC40fJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCEA202987;
	Thu, 17 Jul 2025 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752734364; cv=none; b=BuViWp4rwojlpVheZrufaidluPx3HztYzpTXrIpNSzHP3ZMVc+1CQroY+X7DkrfOBTllFePrbFIznR2me41v1LlPaechZtx78zIuKguGhEp4TG4ODppuJZKmbVlebpO/ylmeX5280ubTeVWneWcG9DR1Ur2i1fockCu/B2/0g3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752734364; c=relaxed/simple;
	bh=tj7j8zNEiQgoRq74whAa+oF+avtK+ncXdiSBOyLALKw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QAITmjH4LZ28o9umBq3MHYyWUoWdLT0suN7OsNntdj2uaE/j0t7i8WPOtq32Q+puZy1afjUuaLZNhXQm/g1UJnPCGG67l9nRpqguYvT8VV0zbqL4snSAJsJbBjFJspPLryg5Xho8j4zOhWTJiMb22X/Y+ena93A6wIWgLmw61qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KPKC40fJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5PRHe021567;
	Thu, 17 Jul 2025 06:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=21hR7bKhLUcpuZcmQzimVs
	k50DDrxVw8v80Xp2031tU=; b=KPKC40fJZ2pvmAxl4SkBhVtM1J3DyBwAZ0N1HG
	XeKknspfS5nP6e9q3FO1Ga2qZqzk5ApLRQVap+IKrq2ksuXfvMXP/SACckT1qs89
	Un8cc4VrZa4CqZvAprzMCChmvMCGRt7Cx7bglvnms2js+wnEg5agb8w65JD5SKKz
	ErKWz78sLxfeBlmOx4TZA6V+eAhRiS+82CALDFrbGLIUclm5+M1eEKjue6xv+gW2
	xN3WLdSe4ktxW/teA/8dRdrab89mmY1/iL3UDgJg0YdjVuJ/d1WM5qORClmf5z+i
	/TodCHBvY++Yt4S0KT+mtl5u4c5dzY5Awfw+QWml9RVPQKRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8ed7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H6dEpV032244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 06:39:15 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 23:39:10 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v2 0/4] Reference the common qcom,gcc.yaml schema
Date: Thu, 17 Jul 2025 12:08:32 +0530
Message-ID: <20250717-gcc-ref-fixes-v2-0-a2a571d2be28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGiaeGgC/12MMQ7CMAxFr1J5xsgJCgUm7oE6tI7TeqCFBCpQl
 buTIrEwvv/13gJJokqCU7VAlFmTTmMBu6mAh3bsBdUXBkvWUU0H7JkxSsCgL0m4C+ScNa2hzkB
 xbuVaj6JcmsKDpscU39/8bNb1Vzr+lWaDhCzee6F9XbvufH8q68hbnq7Q5Jw/UWg9D6wAAAA=
X-Change-ID: 20250708-gcc-ref-fixes-3f05521a10b1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA1NiBTYWx0ZWRfX9bfuVFhj1BCq
 ltXvCg9csQE94fc7pkAIqd1dEC1twcc6EtCgcmJOEPX2pI8HJg8P0z722Gl8YwqwKjVlJ1bUlCy
 Tj5O5XjifEeVfLFXhLRo5Z5IIy2TXi3i9XEZqOLFl17JuZt8X27e1pHci0/vhwwufTsXg4bQ9R8
 Q/MjKKiM8+4S+U7qjy5Ze7ZBPiWLT/+q9wIMbZcV8ZZar0BQV+dazjDF9lOtR114qrehNw4KtgY
 CDCJRz0ThYcc45XEGhwERxRZHb/NrvtLuEa4LdKmHWLLQOxKpCDTDO6R23gmMK9xLf989U9kguR
 yZQVhD4aa+o5mT7R2Rg7YkJMKgEDU/s0cxF3HPIav4z/LNdHQ8pilkc2FwERkgQ+P7WrFHKdpu5
 rCLNeRvhUK3NY5zrkugrHP7iJGSiYb4pf5n8wceC+KDFUpvGP5CVH73m/XL7xHE5coDEHP33
X-Proofpoint-ORIG-GUID: cn3y1hVdNI0cD56Zg9_NaXGhRe-Ey4jA
X-Proofpoint-GUID: cn3y1hVdNI0cD56Zg9_NaXGhRe-Ey4jA
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68789a94 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=Z5aUh8xi8MX_VlDgfTAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=829 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170056

For all the possible Qualcomm clock controller bindings
add qcom,gcc.yaml reference to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v2:
- Drop the patches which didn't have the power-domain-cells.
- Add Krzysztof's Suggested-by tag to all the patches.
- Drop the Reviewed-by tag given on 1st patch as the series got NAK.
- Link to v1: https://lore.kernel.org/r/20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com

---
Satya Priya Kakitapalli (4):
      dt-bindings: clock: qcom,sm8150-camcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,mmcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm4450-camcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm4450-dispcc: Reference qcom,gcc.yaml

 .../devicetree/bindings/clock/qcom,mmcc.yaml       | 24 +++-------------------
 .../bindings/clock/qcom,sm4450-camcc.yaml          | 20 ++++--------------
 .../bindings/clock/qcom,sm4450-dispcc.yaml         | 20 ++++--------------
 .../bindings/clock/qcom,sm8150-camcc.yaml          | 20 ++++--------------
 4 files changed, 15 insertions(+), 69 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250708-gcc-ref-fixes-3f05521a10b1

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


