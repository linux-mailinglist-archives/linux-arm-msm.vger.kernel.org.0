Return-Path: <linux-arm-msm+bounces-25692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0C792BDFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A282E1F23D38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7562C19CD03;
	Tue,  9 Jul 2024 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O/KD56rS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7956158856;
	Tue,  9 Jul 2024 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538163; cv=none; b=C0DzB69whSqKuawEYDWonShjks9QcHAqAS1pYfb/7U1pU8ADoXCtI7/Lx1bOWfQXAWNqYRQJYZE/oNoUDJpldGO0mNejN3GlW7Eragbx3ic0G8kAieKA5NZ28CK8vj8aJpbCpu4YL/culwezKw0pmqFwUNJdA+l+fS0oxxocqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538163; c=relaxed/simple;
	bh=78d/it+cRmmB/48I55KB/LarWlDuk5m5hs5mP+nlp0w=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=V9DiLuFmjfDo+PMF82igYXjKCpim77QohCZBYY8f6lc7ns+J2AYMmgXxHBBI6JRcfkAToIib0D+dHkJwBJfpx3Y+9krRe+HqFipGlo9q4F7+zzRJzn4dPIqc5mH6xoJXL5loLzxbsc3ggaDF7DoOEaHCmwHv/ar7MxmOH8Zs0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O/KD56rS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BLMI5021878;
	Tue, 9 Jul 2024 15:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nkEO7Wg76GVNlPj8euMDoi
	du5eeZoz2/dzWlvug6oFQ=; b=O/KD56rSxoFCp7GGdHozz5g4JChburLkWLDh6q
	iPOWKM9oaI0zxVoVPwlA4IfIxQfHvL3sBcJcBhqzt5HMs8DjTygnmzv/h/Q+OmaZ
	t41oHv2tASNFB8SWXkTGi7eMVIC5fPQyFIpvUt9pfQNcvEuae5SP0MTnb+SVK6Mt
	Fp7uR3Ztvb5kvdVf/vUsPDwMofOuoxyU7b1i0KBDm1rHMcAMu/YRD2QjiZS4Vqom
	L4OlThgAxZrHuCUCdZ2DCuuWBgFcwTkQCGRr8gNVX3KtLJADBCpDK6MoUBTTYj/Z
	k/4EqOt8FdFxLzLLQ5UfaV/Oll3jxKfTpC6OzYcgLpKI3YGA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t7279-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:15:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469FFrAh012936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:15:53 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:15:47 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] phy: qcom: Add QCS9100 dwmac sgmii phy compatible
Date: Tue, 9 Jul 2024 23:15:35 +0800
Message-ID: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhUjWYC/zXNSw6CMBSF4a2Qji25LSDgyH0Y0tTbAjeR8iiih
 LB3C4nD/wzOtzFvJ7Ke3aKNTXYhT70LIS8Rw1a7xnIyoZkEmUIOJdfGqBF9KQCU+XQalW86ItU
 Oq8K+G/RMz5fl6dUgiiTNtQYWzobJ1vQ9oUcVuiU/99N6uos41j+RgMyKDGIpcglQcMHHN6Gar
 Wtq7e5HkMM4WKza9/0HM46bMMIAAAA=
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720538147; l=1723;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=78d/it+cRmmB/48I55KB/LarWlDuk5m5hs5mP+nlp0w=;
 b=vRtPIhjOD8JOJBjSM5t7UbyPgWQo4DqpUEdD5NmN/d6EC9OFSiv3E/wteHzLJ4/J5hqziGmse
 jHKJBPgwD0vBHagn7ZGU3Q1jYl4T7f2jZipFPzFI+E6/TAq/wRV7ABS
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bZrVnjKfZWi4-nFlqttkopPEhept4V9I
X-Proofpoint-ORIG-GUID: bZrVnjKfZWi4-nFlqttkopPEhept4V9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=678 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090100

Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

---
Tengfei Fan (2):
      dt-bindings: phy: describe the Qualcomm SGMII PHY for QCS9100
      phy: qcom: add the SGMII SerDes PHY driver support

 .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml        | 5 ++++-
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c                            | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-46dcc1347aa0

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


