Return-Path: <linux-arm-msm+bounces-52045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17211A69F8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 06:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FBC917F5A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 05:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DA21C5F18;
	Thu, 20 Mar 2025 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WKeSPZHR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F18B665;
	Thu, 20 Mar 2025 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742450126; cv=none; b=UCf1gdl28EDl0rPiFzDgkoXQLZOhG+drA0zRQqYfvNwECIXxejqEvd75icqB2BTTCqrEomp/34nwKBNQ3nKI1HrMgiEr2COpkO3RDAAQA4vLLXdtsrzZEMaBYw+XLvyzjcBKLtBVq1yKToSjfiogfOBmoLS8Zuaf+boscL0knNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742450126; c=relaxed/simple;
	bh=ibxelGpFYvcsGMgDYGSxpnzRQVZuOaq/Q18SykBjlDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YwBFjChWCDs0KQlVFaN3d1/8r/L7ZVagYw+IFo745VI6n//Oh0hTVuqNpXD8Meh67hAlGhUMvgQcJF7ikkt3pGAs5jaIfpKMS08eYCog2+Hyw6ys69p1G0oY/1VtFAah5Tw+1OWUnGQ2x9+Bwo102H3d9/0kv5cp9rInMt0AgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WKeSPZHR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K43L97019418;
	Thu, 20 Mar 2025 05:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=98ppjxfWNpFbfctkdmOJ5sGhNIkR0/DgBgl
	VJBiMLt0=; b=WKeSPZHR1xGv47g0LL0r84Fd8u2dNESx1lKBQaon09v2Xeotv4R
	E2Pbue4IkMpDG5MmI4HyyUVdApHJDopxJ2O+iySJbCiqe3LDG91Ab1FPITSrXX7N
	J3cduPOtjvM3mjZZs7Km0rfyp5wp+8CyBTbULqCBb46BqralFxer+z72SvrxXCJO
	TEvGhikt75Tmac5nTqBSjqMpg+DsAu0sVWAEjh/IYLdjvhqBvsLY2F3UyStlB3b0
	ko0Zam6MsiGFMe47LpYmlTUCZ2DTF6pFVe7m9KFx91TEvrBkiE0nR44gzhgoqHAf
	IrY9DsPNKUDJC+ODY5LOJUx2XrIHY5WyCiw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngg6r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5t844001137;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 45dk9w97c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52K5t8oR001130;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 52K5t7OA001129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id A686340BF8; Thu, 20 Mar 2025 13:55:03 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v1 0/3] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals config for PCIe3
Date: Thu, 20 Mar 2025 13:54:59 +0800
Message-Id: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iK5GldEBxZYqyFOTGGLzZadHVGdOCQRo
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dbadbe cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=oy1NtThjofowiJkyXhQA:9
X-Proofpoint-ORIG-GUID: iK5GldEBxZYqyFOTGGLzZadHVGdOCQRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=702 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200035

The first patch enable the PCI Power Control driver to control the power
state of PCI slots. The second patch add the bus topology of PCIe domain 3
on x1e80100 platform. The third patch add perst, wake and clkreq sideband
signals, and describe the regulators powering the rails of the PCI slots in
the devicetree for PCIe3 controller and PHY device.

Qiang Yu (3):
  arm64: defconfig: enable PCI Power Control for PCIe3
  arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
  arm64: dts: qcom: x1e80100-qcp: Add power control and sideband signals
    for PCIe3

 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  10 ++
 arch/arm64/configs/defconfig              |   1 +
 3 files changed, 130 insertions(+)


base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
-- 
2.34.1


