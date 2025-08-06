Return-Path: <linux-arm-msm+bounces-67854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9DEB1C10C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA099184131
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 07:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A04217723;
	Wed,  6 Aug 2025 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L/oC5+ig"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C797C215F42;
	Wed,  6 Aug 2025 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754464363; cv=none; b=i+PiVwXr/Dd6FwE5CDhWXAADQk1aOnq93FXeTU76J8aFVkG3ESuzsOtIOFGTMPuzsocyXgAg1GrmrPXYbFeai1nFTjIrDlI5Upqq1Kdpr34LB86UFyxj/khUbMfpPassC3fOqYtBl6k0kYNdvS7+DoChpoIYLlJPNgq42bJBSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754464363; c=relaxed/simple;
	bh=HOhLqE3PH2eqYxtjyzeyg+aWHr26gX+uuAOpxvYRSoI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=V+nlvPOTonYQvzplFMYERbm2MTCaY6eP7ACuQ2sNTyCvBnz8nXV/aHXavrHvm0brOI2oNRoTXy6W/feYBDZ7oVtasJSJCuV2/tkKff1FOdhvJnWpbW/hbsx5um7GeMFvwK0C3GUEjWwvG5m3lcGkrSJXQS6eXd99Rh1em84tWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L/oC5+ig; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761emkB012368;
	Wed, 6 Aug 2025 07:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OTZWqs9MqyIKemFPBvRsMr
	4yGpBK3hIIOm/BkGe7TdQ=; b=L/oC5+igkLIQzqb2XjSquYJyD5YtPnIBYRDsCG
	6PyKeyVO7EhR4TvqIpdmi74E04TSWr22m2O744Su1krxrwlWzF+OAY4p9R+SNuc0
	aD10n/Z6jkWe0wMpSlMDxXAv+PV90+AC6rt2oRHWT8ezzmJhbd2k1iTgaYwq8WrB
	OLF4Rzg0H1vvLfaeWCF1R8sgLTXwgZK8SXqrc3Kx3zu7ggMjS06b5PniKf5k4CJB
	/ZMaxdIhuxR4I5Z13QdG4sYcMH7Svr5PnYPMgpv98Mg076LjHee1PLT7Op1h9ZWN
	Z+JaN3+5B9snCXGUrk1BvwbDHBLwb+PnitiBdTe0Qs/f8Aiw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2sux5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 07:12:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5767CZpq001992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 07:12:35 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 00:12:33 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v5 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Date: Wed, 6 Aug 2025 15:12:02 +0800
Message-ID: <20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEwAk2gC/42SyWrDMBBAf8X4XAXtkkMp+Y9SgpZRIqjtxHJMQ
 8i/V3LatCY99KDDDLw3my51giFCqtfVpR5giin2XQ7EU1W7vel2gKLPcU0x5YRSgfyYtkeXNMM
 Ycc9p02CpGJZ1Jg4DhPgx217fbvEAx1OWjrdk3UJKZpauq+fsFJgQhvzhsD8Xa1OsE0EEaU5Vo
 x0AKL3JChc7t3J9+1LqPFo0lqj1Kfnx3twkEUbeOqKMtlqa8A+NIio3s23TuLWx87HbJTSx7FH
 UAdZUC4XZpk9pdTyZ9+xp7zJrEqCSieO6yssC3ADn3HpqsTQAjSeBBVCWEeaUoT4Qa+uypX1MY
 z+c5xNMdF7Tn9ueaG6EUGEsJYoqbX8PVFr4ouQjBU57HqwUzpoFVepP7LtmuQZf0mV4n7POCeA
 mNI80/6HzP1jSPNMCqPckvyD9kr5er59GwQBtgAIAAA==
X-Change-ID: 20241225-dts_qcs8300-4d4299067306
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754464351; l=3472;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=HOhLqE3PH2eqYxtjyzeyg+aWHr26gX+uuAOpxvYRSoI=;
 b=pMAn50tpc9bEOpE0c3XN6kzPKzT0oiYRImSuHKzAWPTEHblAyYyamk7zWbQCxkF7zCg8/1ub1
 Hdf3oIhNcJlDOpFQ4LEg+ndHvbjlcmXYjVj3TmSLamnylOajhqQHLnt
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68930064 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Ki_nu0Frpaj405WCvX8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mFe0B9KZk8VNT-YsUGnYo29za1NaOVzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX5AhHbRj7jAIK
 tf94tQ65X7Eho1I+Zc6M1bJv7z7itdvvfxLiTyHwEEXnn0B9YXBLZHmWBH0PkleQhr4IKua2m/K
 FIjDziMf3M61YWOIwAw8L8SJ64uB3WIqVm4TZs7Mfy7FLG+DDq9T+jZ8AOMA9zsW4JwSyuvYUD9
 yQ+IQeNczd40xWYBzTeGS4bMkplfV4gzI7qekynNsVh2Y1aj3bp4Ld+P+B1I2nhWFl9g3JZusMW
 ipSyctCfVzhaXVxBdWcomPosj7/Qerf+Mb7o/IoEiUv1lxt0SRgjcc7+eIy0yL/ANhVTDd/boEW
 05BGwFvqRzghQ4Ahs7yqcR+fHhpnIBYY5sGMiWGXmIX/x7FEUR4KRwqI8Y8Hol0KeTfs++HHsaj
 cJlkDM79
X-Proofpoint-GUID: mFe0B9KZk8VNT-YsUGnYo29za1NaOVzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
It also enables Display Port on Qualcomm QCS8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This series make top of 3 dt-bindings
https://lore.kernel.org/all/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com/
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
https://lore.kernel.org/all/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com/
---
Changes in v5: Fixed review comments from Konrad.
- Use interrupts-extended to introduce interruptions.
- Sort the dp_hot_plug_det node by pin number.
- Link to v4: https://lore.kernel.org/r/20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com

Changes in v4:Fixed review comments from Krzysztof.
- Add the 4 pixel stream register regions and the correspondings clocks of the DP controller.
- Change DP controlller compatible to qcs8300-dp.
- Rebase to next-20250717.
- Link to v3: https://lore.kernel.org/r/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com

Changes in v3:Fixed review comments from Konrad, Dmitry.
- Correct the Power-domain for DP PHY should be
  RPMHPD_MX.[Dmitry][Konrad]
- Correct the interconnects path for mdp and align the property order
  with x1e80100.dtsi.[Konrad]
- Rebase the patch to latest code base and update the dependencies in
  the cover letter.
- Link to v2: https://lore.kernel.org/r/20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com

Changes in v2:Fixed review comments from Konrad, Dmitry and Krzysztof.
- Reuse eDP PHY and DPU of SA8775 Platform.[Dmitry][Krzysztof]
- Reuse DisplayPort controller of SM8650.[Dmitry]
- Correct the regs length, format issues and power-domains.[Konrad]
- Integrate the dt changes of DPU and DP together.
- Link to v1: https://lore.kernel.org/all/20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com/
~

---
Yongxing Mou (2):
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
      arm64: dts: qcom: qcs8300-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  42 ++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 215 +++++++++++++++++++++++++++++-
 2 files changed, 256 insertions(+), 1 deletion(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20241225-dts_qcs8300-4d4299067306
prerequisite-message-id: <20250113-dpphy_qcs9300-v1-1-842798ceee78@quicinc.com>
prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
prerequisite-message-id: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
prerequisite-patch-id: 59af38ff68afe283dccd4295951153e59e512bfc
prerequisite-patch-id: 8bfdc32738e6cc937a71dd9a4e4fa23b5289e105
prerequisite-patch-id: 69e200a46a6742648379c1ae426cfba7edc064b8
prerequisite-patch-id: 465ab53516efbbe38f85409e7ccb3793b05402c6
prerequisite-patch-id: f664581f48278298bc3501eecf637d1eb16dbf9e
prerequisite-patch-id: 533900187c99bef436792ea43d79fff5bbc5412c
prerequisite-message-id: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
prerequisite-patch-id: 4782272bb7d2403e2f2dbf762586d4570e6b6ba6
prerequisite-patch-id: cfdd5c37d38b2a4f1386af4021ba3920c6d8dcf8
prerequisite-patch-id: c874bf64aec8cb2ff0bc91051620ac771cbeeeea
prerequisite-patch-id: 63defbfb812a2f9c6365a98538421aea374e0e13
prerequisite-patch-id: 0ffa9d544d516d4e14700229a4ab6a9c7751823f

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


