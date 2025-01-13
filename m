Return-Path: <linux-arm-msm+bounces-44849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E5A0B091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1323A1226
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9593233135;
	Mon, 13 Jan 2025 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I9TfBw+b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8AC2327AE;
	Mon, 13 Jan 2025 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736755559; cv=none; b=ECP+B8LSnPZ9fBvBKaGxatuv1/v8vbn/Lc8KAwAF2Rv5Cl7JwlC3UXFXE5lc6aJw3vsmFYtuKkagd60QP/kijPE7mtotWq+jFAXl25LXtohdKN5n3Q8ult5tCXLnsFUGrJuKIRHHggtyO6tKDT1ELyI8NSCG5KCRBdXsBChb8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736755559; c=relaxed/simple;
	bh=PrZJWe5jkvnSOe+cw62NYLMo4ZA6BD9ffzq1/UWGszk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=gKDfC10vphtPxo6Ja/qncw1+BXUGJB2+Zjio8aELn44Ra1gLznSczS6Mn3KF+ZUEEj/STcHOywiUT3IrgNU/js7Gd2j4yxBEioMYG1S/hn0hjBtPrG/QIcd3HeIkQTTvA3Y8G4Z2cUWqjdUVHNJlcHdhFEt4L4Lith325HoP99Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I9TfBw+b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNtKZf011894;
	Mon, 13 Jan 2025 08:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dZhNNFatGOfrzOo5PU3sDE
	/wRMQDPpssBs2P4fO//Q8=; b=I9TfBw+bI+8NNejCaYp6386QK1D/j0IoQvE5W6
	730D8oPQ9+ysbA3XmKtA8b1ygfeClVpd7wLfHwH3AD6VQXCF399o1LzilmjT7cOf
	G5CIRuPqbNisrNjRIGTXchXWhsgg+kAVFee75qtQG7K3NLmCLgo0RxBfsRR+jOHk
	1sr4/jgVgXz46+SZ1/Q5ilIJb/z58mCnjLjJvx1LgY/5pMdpuyXiZlxJQ4CPQCdd
	Gwu8N3tuHs2A6ZvLFbRFkPwcPDAfSr6eLVlnFwFbLqkpN7yog04GYrZknqem+i0W
	yhKEQiqbrt/YlZJMQ6yX8Gzcq2+ea+jMrWijU35gCIo/InOw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444f5bhhgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:05:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D85eVn017872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:05:40 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 00:05:33 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v3 0/4] Display enablement changes for Qualcomm QCS8300
 platform
Date: Mon, 13 Jan 2025 16:03:07 +0800
Message-ID: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXIhGcC/22OQW7CMBBFrxJ5jSt7bAcnq96jQigeT4oXScAOE
 Qjl7h0Cm1Zd/pHem/cQhXKiItrqITItqaRp5GF2lcBTN36TTJG3AAVWA1g5xFLifLxg8UYpqXX
 Ye28i1ioIhs6Z+nTbhF+H1850ubJ3fh1F6ApJnIYhzW0FwXvvdO9YYdCSVQGjVdiTbmrHLwkBm
 hjF03VKZZ7yfWtdYJO9s9zfrAUktynE0BtyHptPbsA04gd/fna+wfpfsMPQqRicMUi/wMO6rj/
 suIj/MwEAAA==
X-Change-ID: 20241224-mdssdt_qcs8300-11b7883dc60b
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: Yongxing Mou <quic_yongmou@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736755526; l=2367;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=PrZJWe5jkvnSOe+cw62NYLMo4ZA6BD9ffzq1/UWGszk=;
 b=6SajGJDXa5kKOqyQCiYJ1mzr//8E13JVK2AvG06cZ+ATb2k5TLL1Yl5WXwpRByd2/4uWFdR5n
 PZ+O7vt8Pw9AcHkvzPbVEmRSRxZMbqL1z5sOZTwppKQpq91SB3brWm2
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V07N94WsT0XO4otTeWiFRFzd-F2mr43v
X-Proofpoint-ORIG-GUID: V07N94WsT0XO4otTeWiFRFzd-F2mr43v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130068

This series introduces support to enable the Mobile Display Subsystem (MDSS)
, Display Processing Unit (DPU), DisplayPort controller for the Qualcomm 
QCS8300 target. It includes the addition of the hardware catalog, compatible
string, and their YAML bindings.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
Changes in v3:Fixed review comments from Krzysztof, Dmitry.
- Fix the missing space issue in commit message.[Krzysztof]
- Separate the patch for the phy from this series.[Dmitry]
- Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
- Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com

Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
- Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
- Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
- Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
- Correct formatting errors and remove unnecessary status in MDSS
  bindings.[Krzysztof]
- Add the the necessary information in MDSS changes commit msg.[Dmitry]
- Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
  20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
- Package the DisplayPort controller and eDP PHY bindings document to
  this patch series.
- Collecting MDSS changes reviewd-by Dmitry.
- Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
- Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
- Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
~

---
Yongxing Mou (4):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display: msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      drm/msm: mdss: Add QCS8300 support

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 4 files changed, 268 insertions(+), 4 deletions(-)
---
base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
change-id: 20241224-mdssdt_qcs8300-11b7883dc60b

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


