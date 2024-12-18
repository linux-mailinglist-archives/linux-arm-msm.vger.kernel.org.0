Return-Path: <linux-arm-msm+bounces-42673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC449F65A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 13:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4905B188DD4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B681A23A1;
	Wed, 18 Dec 2024 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GRqO4Fcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA919B5BE;
	Wed, 18 Dec 2024 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524050; cv=none; b=Ic2Hm3MAbhpOp3ISp2i/8n6W9mCv4nidNUB4lRmhlw8mld7pcV2DRHEBADaiLWj3BI0dxqC7DKukK/v1pj1AZ96RgnhGGsRGe+tNE27RfDNzOhMeS8LhWEGGYk+xSYRUpJ8FKFl0iG2LA9Jz8ga3VBLGSgP2H27ReS4ps6Ohvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524050; c=relaxed/simple;
	bh=K3E2eLACGAqTGGR6659v1Qs7a6d6PVxDWRP5izytqsk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GnvYFdRZ8eZBfRUUz/Ew3rx3j9vzGiA8soKYjqXzDX5Km2Y2xKrIV8Ar/H3/GA3tmxQp4sb7d3opcDUNWK6bxC87C/zpPnE/SIXee0v8+umM+4sZhobH0aJYUQhecCPSdmi7RXXD1YbJQfPkTagck7WDLaSgOw+NLKcjsRqRAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GRqO4Fcj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI85W7k008730;
	Wed, 18 Dec 2024 12:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o/v8fEHN1YcIK93S6Dm4s+
	w6dCgoHu2XdLbaiIPtRJc=; b=GRqO4FcjIfCk9Kckz3m4IeH44OpRKtFOdiFIYq
	7NTBMCnD2tgb69N27eQKmW17FEqtKVaj8H+FOk7s8ugba6m1RAVXYudTZTUv4hzr
	9djmmExyFQhfGpkMvMCELhcBFpL+EYifgSQJQgTYo68Q5zVsXI4ePtqBinXx43zD
	9lHKJyMax3Tsb6jW8pJ882vOOZK9fA8inw8rtoTjl80bLjILyUh2WP15RvSGd8mt
	bl/lVp26XfGiZvffipScH419WarrvfrfavuK3b7roja0aWKKunTgfs4a3NOz/UKH
	hUKCHHFOML121tBSImYDGEHtZTB6VzGljXNCzSxXzmgLTs1A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ktk2gncf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 12:14:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BICE3Ra018700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 12:14:03 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 04:13:56 -0800
From: Song Xue <quic_songxue@quicinc.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add DT support for secondary USB
 on QCS615
Date: Wed, 18 Dec 2024 20:12:55 +0800
Message-ID: <20241218-add_usb_host_mode_for_qcs615-v3-0-d9d29fe39a4b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEe8YmcC/5XPwU7EIBDG8VdpOIthgNJ2T76HMQSGwXJocaHba
 DZ9d7F786THj8Nv/txZpZKoskt3Z4X2VFNe21BPHcPZre/EU2ibSSE1SADuQrC36u2c62aXHMj
 GXOwVq4GeG4jkQUbng2CN+CgU0+fJv749dqHrrV3ZHo/Mu0oc87Kk7dJF6cVoIk5RqGkYlNZ9k
 EaYgKYPKCYghFGJyH6sOdUtl6+zfIcT+1vkDlxwCkhqkEK7sX9pRZhWfG4dJ73L/3CycRJ1+3M
 0g1G/uOM4vgEru+SDZQEAAA==
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
        Song Xue <quic_songxue@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734524036; l=1647;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=BLLDvT0EsFEqLg+cJZclCF+z3PmATgR6B3wd1tOdi20=;
 b=BJP4G4OBEHPg2RZuSLcU4FCED7QYOxBY18mFh2Vh6/1iBqvv536m7cHn1dKJiU9+VB6KvAUDq
 jrWd4JwebfgCk9FVyA4vZdEa8bbSVGNZyEjtQM0yFIlnPNPVm5BfCuE
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oIk0e2g0zyALuVqZI6ckhD1x2X-6WsBp
X-Proofpoint-ORIG-GUID: oIk0e2g0zyALuVqZI6ckhD1x2X-6WsBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=968 clxscore=1015
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180098

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
Changes in v3:
- Make a vertical list for clocks property of usb_hsphy_2 node in SOC DT.
- Move GPIO10 node of PM8150 to fixed regulator node to enable high level. 
- Use subject prefixes matching the subsystem for SOC DT and Board DT.
- Link to v2: https://lore.kernel.org/r/20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com

Changes in v2:
- Modified "0" dec to "0x0" hex in reg property. 
- Link to v1: https://lore.kernel.org/r/20241211-add_usb_host_mode_for_qcs615-v1-0-edce37204a85@quicinc.com

---
Krishna Kurapati (2):
      arm64: dts: qcom: qcs615: Add support for secondary USB node on QCS615
      arm64: dts: qcom: qcs615-ride: Enable secondary USB controller on QCS615 Ride

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 36 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 78 ++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)
---
base-commit: f2b086fc9f039773445d2606dc65dc091ec1830f
change-id: 20241211-add_usb_host_mode_for_qcs615-61feb12fabd0

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


