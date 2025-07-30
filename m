Return-Path: <linux-arm-msm+bounces-67102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F137B15D45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E14C18C3B45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF96D2949F1;
	Wed, 30 Jul 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BlvKlYFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F333273D95;
	Wed, 30 Jul 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869072; cv=none; b=M7MJ7MO6VQOn1i9D2DC6i8c5vQ2bzvMDM8gDMIvd1GFc08KQQe+5yZn2l86MlBEzPwpZIvfuT7vH+PeDGI2htK6FGKbZfbh/FmNi9349gS7YFQhjFpOjqoU5q+/X+xgzttJsLr5PjFlyjcnbxjXthk1ciLT3viQ6WJf+ewQPQGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869072; c=relaxed/simple;
	bh=avsL+F1jXA1BVaHfmtiuEUn6JqqFEdZPj15ArKueTLw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=TBWGib4ahZaboYnRqYka8CNbRqv5+r415aDi4/EPkbplLYh3qGo63xgTAaWGtBcRfm4Ma3il5+u8A9Hz45v6epJURJ2DlaByyXQVpw7j37/T2GKrG0hwFxfOA/915dT8JfrPEZ6jjjBZ3x5ticz/fyv+cGSp4dgA8KuH692K9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BlvKlYFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6Sl2W018742;
	Wed, 30 Jul 2025 09:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cHYbQ79RzYh34AnpKPu7mN
	P7g4VOLZ5uD49m0MOjSGE=; b=BlvKlYFh8Nf3wtaK0015na0x1ocL10tixhl/Pn
	N8lbU1EbM3CnJiKaGg/Eir//DhXFohRpsVPD72aJqpSOid6rI1RsfOHe+mtq1FLb
	XYrx+RUfJZNJSnPpz3WRsD4akRjBEIJvIxQqa11Bw0rjHb5DERkIgNu3SXyqU322
	7K16KruvyPY9l66OyiFk9mlArJGzJPVTEZBbYsWe8pBb6miWFY4KJPjlgn4+iv1O
	A5Ichffnmp0y7pq6yomkAThDZhY7o6+feBlh61JDAqBY6QpoXSz3DmwYWXZWoEpG
	/G4qobqt0l/tV9ethi9+4k1lv6zP73SuHY4X9IX0gCThgDrA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm35ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:51:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9p6Ze018019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:51:06 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 02:50:05 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH v4 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Date: Wed, 30 Jul 2025 17:49:44 +0800
Message-ID: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7qiWgC/42R22rDMBBEf8XouQq62ZJCKfmPUoIu60ZQ24nXM
 Q0h/17JaUND89DHHZizs7NngjAmQLKuzmSEOWEa+jyop4qEnevfgaaYZyKYUFyImsYJt4eARjJ
 GVVTCWtZoyRqSHfsR2vS50F7frvMIh2OGTleRdIDoFui6es7MmnEuadzvd6dCtYU6c8qpUUJbE
 wBAm01GhNSHVRi6l7LnMaWLiHG6hZslZbQJBqxUtW0Y+wdGc53DbDuctj71MfXveOVoEYAZYWr
 N5GZAXB2O7iNzuhvMOwRalDStq1wWMAtKKR+FZ40DsJG3sgXtJZdBOxFb7j0pLe0STsN4Wl4wi
 6Wmh23PIgfhonZecC208b8PKhG+Xc1fFwQTVeubOnh35yr7Z/mzs/So7t3l+JjVEGpQrrX37sv
 l8gU6VUT9QgIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753869004; l=3094;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=avsL+F1jXA1BVaHfmtiuEUn6JqqFEdZPj15ArKueTLw=;
 b=rcuU6MsMiFh5HYEb/j15aHiwJMT+9evyIf8hweq45ZlWw2A1WTV1Gzxc5SO3fWkN9K364gmGi
 QNDJCp+JzjnAbeXPu6LAdsV/266Y7L9l2on2pbaTfNCKyWqKbwA+OeE
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6889eb0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Ki_nu0Frpaj405WCvX8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2OCBTYWx0ZWRfX9Syt4fXPO+YI
 EBwbjzSdxZaxgJI1WH0IUCJ9HzI1vxxxiMbxUhiXra9VBZ/17BaARWKI9VDt5ekkBVZ6QALt900
 zoGVfCr33faeDHNeGMls2zUg8QMRW0YfmIVtFMubah3LdueG+fmXNqqBMt40Ba9rkLuYm3Y6o70
 90YSxj38D/Bx3yKw18AnZ5082gRqwA5p3FXLnOc4g72J5DuEvxniv5S0SfNItAESaabhvgbaisF
 xz0di6gjh6QtzE6xyzDydeYnDWpmnAXQ1JKNvxv/7V71zdPS+UZB5NgBW/inxKqcpDYwPCaQTqa
 HprM4SHgRV9p0H1Q1cYKXfdheoesN0h77P7hKad7X7fYXu4yVqHabXVHNx2SAGy5ROsu5kPTfSx
 Hh8VQb3LqLPes6rcH8miiXI0Wml/xqEW8A8kCxyz3Ld0E0fEDKDXKxTn29bMBfK7Re+7KRVN
X-Proofpoint-ORIG-GUID: n1efP_J7Y_vtUT4ApdXrY9fQRMtDessC
X-Proofpoint-GUID: n1efP_J7Y_vtUT4ApdXrY9fQRMtDessC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=599 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300068

This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
It also enables Display Port on Qualcomm QCS8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This series make top of 3 dt-bindings
https://lore.kernel.org/all/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com/
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
https://lore.kernel.org/all/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com/
---
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
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 216 +++++++++++++++++++++++++++++-
 2 files changed, 257 insertions(+), 1 deletion(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20241225-dts_qcs8300-4d4299067306
prerequisite-message-id: <20250113-dpphy_qcs9300-v1-1-842798ceee78@quicinc.com>
prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
prerequisite-message-id: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
prerequisite-patch-id: b798711c6a9bd9c4f0b692835865235e78cd2adb
prerequisite-patch-id: 146c61567c42bf5268d1005f8e9b307ea2af93d9
prerequisite-patch-id: 3ce5246ad3470d7392df23a52b3c8b8bd1662db6
prerequisite-patch-id: e81de8a09467a49eaeb4af73a0e197e4156ce202
prerequisite-message-id: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
prerequisite-patch-id: 4782272bb7d2403e2f2dbf762586d4570e6b6ba6
prerequisite-patch-id: cfdd5c37d38b2a4f1386af4021ba3920c6d8dcf8
prerequisite-patch-id: c874bf64aec8cb2ff0bc91051620ac771cbeeeea
prerequisite-patch-id: 63defbfb812a2f9c6365a98538421aea374e0e13
prerequisite-patch-id: 0ffa9d544d516d4e14700229a4ab6a9c7751823f

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


