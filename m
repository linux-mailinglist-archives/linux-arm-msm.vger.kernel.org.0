Return-Path: <linux-arm-msm+bounces-41425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3A9EC719
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BD7286ECF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3A31D86FF;
	Wed, 11 Dec 2024 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VzvdaWGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83531D6195;
	Wed, 11 Dec 2024 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905603; cv=none; b=orcEw0vG/szvEAjHo01Cr5Bqzv2NsOCBa7arVlLJhOrCSvhAanyWwQGEikOf9bRurFfG7xtG4ZPFx2MGiPjsjKC7XYCG8J3U/GonzSO7MwfTUAPisdQw6/ozRYFxZoEQBsPQgFsmlpeoL95nM0NQQ8vp03ZdIFElYItEVr/25io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905603; c=relaxed/simple;
	bh=+C0ktBFaUu+8i8cCU0W1NRrmRudoJpJQSz43scp4WUQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=LXGEOcSWWXjuNkRf/eNCQ9+XZUH4c8MjjPTCHVPp0f5faOIZoDC3nvOkvoECp3t1I3JssFtK9IlYWxJHzXdqLpOAwmV3qnKCm5PBBb6T0Pn57FAGQJDWKDhy2MDMiUwO1I8araBmgGznnHz6Ddd+AoImkhtHq4E3pG6zkBjRZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VzvdaWGL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB1Ws17014046;
	Wed, 11 Dec 2024 08:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CVzruM1D6UjpCt3CuXHJvm
	O2KLaQyS3Q2tb/gap8Oy8=; b=VzvdaWGLbmZyGA3rC9mUKd3PaFoVVTNaS85RNx
	nYwQvMjGdTGJRBuR4aaztCmD/CCCtE+jcIQj69CXRXrb/NwmAyD5dja0DlMp8dKW
	65P8c4xveYMJJihRgUu8Wi9dD0HoofuyznRhh32fpW72xBAPSAtQcejWwBlPR556
	REeswPeVkbTQ08x5PiIQjJZlKqTzpqYNUwSQpzJJ/adZQL4qJtWqmTNZW8P0wG2V
	pqw6HFbGxB3ScIWJ73L7uxvVKAG2mceSquTyPzLi/oapvlKmVagTc6cWgHQuOdVz
	dWV1Cp01sPkFX+EH/4ZcdZnztN00CD16JM0lb2NbIBxxe+fA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyaqn6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:26:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB8QbY4023569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:26:37 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 00:26:31 -0800
From: Song Xue <quic_songxue@quicinc.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add DT support for secondary USB
 on QCS615
Date: Wed, 11 Dec 2024 16:26:07 +0800
Message-ID: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ9MWWcC/42OQW6DMBBFr4K8riuPAQNZ9R5VZNkz4+IFOLEJa
 hVx97rkAl2+v3j/PUXhHLmIS/MUmfdYYlor6LdG4OzWL5aRKgutdAcaQDoi+yjezqlsdknENqR
 s71gM9NJAYA86OE9KVMUtc4jfp/7z+uLM90d92V6j8K6wxLQscbs0QXs1moBTUO00DG3X9aSNM
 oSmJ1QTMMLYqiD+XHMsW8o/Z/kOp+x/kTtIJZmQ20Grzo39Ry3CuOJ77RDX4zh+Adm2NI4WAQA
 A
X-Change-ID: 20241211-add_usb_host_mode_for_qcs615-61feb12fabd0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733905591; l=1272;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=EDBHUw3Lql2C9AU2kYmwF5EuvyRjpVT9LuKM/7NNfCE=;
 b=6chMNXiMUhc7AWGpMaCSVITztvm3Xwjdf4wWZQYv5/HbZlpcRu3BV57EQS7Pm/HTkdXL5mSOu
 5E39sZUZZHcDltdc7geJJdYgMrBz36mol9T3D45uHpOztpnuDG45tyE
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yb6wS9blr17TZW9cpvWqXnCAtCKNCnsK
X-Proofpoint-ORIG-GUID: yb6wS9blr17TZW9cpvWqXnCAtCKNCnsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=866 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110063

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

These series aim at enabling secondary USB on QCS615. The secondary
controller is High Speed capable and has a QUSB2 Phy.

Base DT Support has been added and is enabled on Ride Platform. The
secondary controller is enabled in host mode.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
Dependencies:
Link to bindings and driver changes:
https://lore.kernel.org/all/20241017130701.3301785-1-quic_kriskura@quicinc.com/

PMIC DT:
https://lore.kernel.org/all/20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com/

---
Changes in v2:
- Modified "0" dec to "0x0" hex in reg property. 
- Link to v1: https://lore.kernel.org/r/20241211-add_usb_host_mode_for_qcs615-v1-0-edce37204a85@quicinc.com

---
Krishna Kurapati (2):
      arm64: dts: qcom: Add support for secondary USB node on QCS615
      arm64: dts: qcom: Enable secondary USB controller on QCS615 Ride

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 76 ++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
---
base-commit: f2b086fc9f039773445d2606dc65dc091ec1830f
change-id: 20241211-add_usb_host_mode_for_qcs615-61feb12fabd0

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


