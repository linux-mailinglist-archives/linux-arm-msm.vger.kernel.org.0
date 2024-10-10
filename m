Return-Path: <linux-arm-msm+bounces-33760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E5997AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A51E1C238A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF4019307D;
	Thu, 10 Oct 2024 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f2TvG1ur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6DA192D67;
	Thu, 10 Oct 2024 02:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728529074; cv=none; b=QVVhXA9GlGSXZfutXi2lJk+w+MccgQdmhgRrnrqvSM5VbfVrvWtb0dcVjdUv4tIgGvOMM0ewrHfV6/N9BoWM7C7NQuRG7afJ5dkW5YRjMZRvckCSKfuI9JqcsfBHVlND4QXq2snOPh54avlQHd6Fw+bWnMxG1QHPpWUvdSBM4yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728529074; c=relaxed/simple;
	bh=m7Bbo/AoSujN0dJyC7QeXs3whFvV/mdKBsYCBamtpTk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=gmRte0FLt+xdEqaUQtErQC3k8zmh/+6vNRTVZlfsH6/HkOTpdZDKjL1SfUDyA4H2rrn/NhdXWD9nZGsPGAUXSqJWwVBvSrX/pLZiMXADzoLVd58CbMfyIvm6Z4FkTdQGZxBSHXEzyqfg418AFNCtOpu/6ashdpRBxhHyO+fp9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f2TvG1ur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1b0GR022719;
	Thu, 10 Oct 2024 02:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9k0R1YI6C4CmFwHgSqnO8Q
	z8A2nkJvbW5mr9xlvTL3s=; b=f2TvG1urvDHsqOZpYdXhwx8WML2X2X5AWR8SSJ
	XncHM5gU/OsnvCzD0MvS/SQU8Nr+lfkeVSKJdC9EA6krgqZ4tmkwAgsis2kvIDct
	tmge8EKmhGpFsMuVrB5oZ3jifMkWhMhIWLA4xSplXRw8tnB4aeFQJtDaOhBvPE6k
	SbL/y/z4h8os6JAMSOmmW8yzVurgpuOuY9k+RjTKUP6N5qnUOTEPwyBiOedrlPXQ
	TzR+7oASexSZ23FHjKLXNxKQF3BoMVm5Wo6pqx0s1DE8xsjMqclzVISizrVziX6y
	xhjnCsvI8xg0ptQzlwdHXM00m25gX4AcDChJPMSGL0bc38ew==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndyg187-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A2vVKN017493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:31 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:57:27 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH 0/5] Enable ethernet for qcs8300
Date: Thu, 10 Oct 2024 10:57:14 +0800
Message-ID: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItCB2cC/03MTQqDMBBA4auEWRuYpBWDVyki+RnNbKLNlCKId
 2/aVZff4r0ThCqTwKhOqPRm4a00mE5BzL6spDk1g0V7N2hQp5fMzyjuhqjDEt2Qku/N0EMr9ko
 LH7/bY2oOXkiH6kvM38dfCtf1AcjMn097AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728529046; l=1383;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=m7Bbo/AoSujN0dJyC7QeXs3whFvV/mdKBsYCBamtpTk=;
 b=+KApfqeyUMrY3HXOPYO4mWxg1TdSYi4+5R4oOcz6IreTUqWXpG9IH3/dRfL1vrQCnprysZrdg
 vGPrKDRASMMDEZLeM0XFsdjN4kMHoPnGkwxf/J6etQiXo4GVH947Zsj
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P8n8Rj5pyTt0ujlhwgnqT5K3Z1y3Vs8b
X-Proofpoint-ORIG-GUID: P8n8Rj5pyTt0ujlhwgnqT5K3Z1y3Vs8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=526 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100018

Add dts nodes to enable ethernet interface on qcs8300-ride and
Rev 2 platforms.
The EMAC, SerDes and EPHY version are the same as those in sa8775p.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
https://lore.kernel.org/all/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com/

---
Yijie Yang (5):
      dt-bindings: arm: qcom: add qcs8300-ride Rev 2
      arm64: dts: qcom: qcs8300: add the first 1Gb ethernet
      arm64: dts: qcom: qcs8300-ride: enable ethernet0
      arm64: dts: qcom: move common parts for qcs8300-ride variants into a .dtsi
      arm64: dts: qcom: qcs8300-ride-r2: add new board file

 Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts    |  33 +++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts       | 267 ++---------------
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtsi      | 364 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi           |  43 +++
 6 files changed, 458 insertions(+), 251 deletions(-)
---
base-commit: 41d815847be394bd5741faf6a3c1a7adb9f17066
change-id: 20241010-dts_qcs8300-bfc87dda5175

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


