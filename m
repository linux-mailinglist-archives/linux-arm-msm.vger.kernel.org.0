Return-Path: <linux-arm-msm+bounces-55585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD3A9C37B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79D034A352C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9B423815D;
	Fri, 25 Apr 2025 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Miy7kN9Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB82367B4;
	Fri, 25 Apr 2025 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573413; cv=none; b=Z1i2ruk7u5vAK7T9EGHvou30OSWFCypr/PbSP6og/LxjAvo4UgomRDD+yA/HFxR6gqTxxZ9dzAY/c7YHGGTaJDum10YwuFkNvyCbSeEq5zJxVyJJMfiqjQwwLXWJHou5Mfd/T2uhOdeR/affhR5ulmVulG46VRILSiHycLZIB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573413; c=relaxed/simple;
	bh=I5+Z2XuuRDCy00p12MUdRO3AiYRjNv5qY+yQpjN4PSw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G7f2D+ws+aL0gUKpBXgx/3kIgNeIRpLPM37DdGFOC/DKqxWL9FqU7bJfX/TAJKJQd66KPGqHwaqMUiwDcNMspnmZsiTJ80P0/vKe5xy85HgzLA070CLVxk6hnUmVRRgOsGs5Fb4Z6Pas6PjHoEph9oW176Ag6VefrsCrtvhl/5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Miy7kN9Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TBbd018977;
	Fri, 25 Apr 2025 09:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rtUOX80/ltlp7l3zShK1M6bZn4lxsi+XiIW
	vVv0TW+c=; b=Miy7kN9QxhxDIxotLimxT1T29fh37yolFhu+Q9qRn2Ig1UyylN1
	7sBC7HclV4yeL4B/JMtq+DKNGfuow5aTOboFBRMi4B9hE0MWMebR8gzzUWv1qYA7
	Ge6tNp8ojcH/zylcaNb8t49oLcjPZNQ0CGusYsbznlC56Aa7QHAnOya0XaZfkZNX
	By2TB+B0kIUzjKKM31HpDg1qbaipHHtAJ1WtbBBPlgx2wgPlXzYJkeVNMVf3r0uL
	12Gmgozt5cLe0UfmzhGWc1CZfzt2W9GJOFxzc9z57ZX6Tgkt7bwb9GfaofT2m6cm
	ns4VaYk3F5pwWjbbgbXkNEd19CewysEsuig==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh28hx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:02 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9Txjo022129;
	Fri, 25 Apr 2025 09:29:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4644wnf72s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:29:59 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53P9TxMn022122;
	Fri, 25 Apr 2025 09:29:59 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 53P9TxSq022121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:29:59 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id E057240D6C; Fri, 25 Apr 2025 17:29:57 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v2 0/4] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals for PCIe RC
Date: Fri, 25 Apr 2025 17:29:51 +0800
Message-Id: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680b561a cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=4-n6rLelgxkyzdg-Py0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: r63uoIcIo8vJDo1FizADCv02yM4f4dqb
X-Proofpoint-ORIG-GUID: r63uoIcIo8vJDo1FizADCv02yM4f4dqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX7R6Yb3LKeNoi 5sSX6JFZRKr+/obqun0INO96Qjkay+dnTqRwO0CEaw2MR1jkz/IUWD2TFCHvMb6Ub9b9hP9ML2c nC5XhbLPG/WAse+IUbA6aPsQ5KDpuTEzLSt9waTdb9cCTD27zbUGS3i+W3YDkd9yl7ElUn8nO1Q
 5uCITYs7nic0mwv5R8zFlgxGRSZnR7pk3puC6IWWdqT/zWTdM0uFemLnxTLXVVz7552Pk9IYgJc g2Uknix92kM4W+nU2/5pIKiIRWcK4urH+Ou2m4xW8E70zTYaxyFHehzbR/zaIBzNIuSjcuvGEFQ P9zVNZ22FTO6ywI2KfZitsN3IgDk4MY/Ea0KKQkRwhnzQ4ws71Jep1nRMNy1MNdvHfC00T1CuOj
 AcjbSdhf27KvjfdDNghTX9t6d9074AOaAv/sw4cpxbw9eXcn0yp1QlIlZZFqd07MkRypLevG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=816
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

The first patch enables the PCI Power Control driver to control the power
state of PCI slots. The second patch adds the bus topology of PCIe domain 3
on x1e80100 platform. The third patch adds perst, wake and clkreq sideband
signals, and describe the regulators powering the rails of the PCI slots in
the devicetree for PCIe3 controller and PHY device. The fourth patch adds
qref supply for PCIe PHYs.

The patchset has been modified based on comments and suggestions.

Changes in v2:
- Select PCI_PWRCTL_SLOT by ARCH_QCOM in arch/arm64/Kconfig.platforms in
  Patch 1/4.
- Add an empty line before pcie3port node in Patch 2/4.
- Rename regulator-pcie_12v regulator-pcie_3v3_aux and regulator-pcie_3v3
  in Patch 3/4.
- Add Patch 4/4 to describe qref supply of PCIe PHYs.
- Link to v1: https://lore.kernel.org/all/20250320055502.274849-1-quic_wenbyao@quicinc.com/

Qiang Yu (4):
  arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
  arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
  arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP
  arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs

 arch/arm64/Kconfig.platforms              |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 121 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  11 ++
 3 files changed, 133 insertions(+)


base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
prerequisite-patch-id: 8d8c88ca71e145f5f1c5145d9ff3ebe90101aab7
-- 
2.34.1


