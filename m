Return-Path: <linux-arm-msm+bounces-44097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1AA03BF3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70947165F57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7911B1E47A9;
	Tue,  7 Jan 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c2QO/dBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3A1DED66;
	Tue,  7 Jan 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244834; cv=none; b=jZRmN/pzSK5mVBoDUisisRWPOAqti7z5UP/1Be+Kxr5CXYu/FhGxE4/VyCJpYsEhUKCD587mr4tbUrgcUq7kf/jzTTgwBDLyIBVsZ01/fxQGediNXY0uTdNThhj0M6seHsMPc9osrfdXVcsSQ5p9QfObvF1UodaOv69iI+bTTMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244834; c=relaxed/simple;
	bh=Xy1jW3Oov7gxHYcRL5s77e/vI5cYTUx3HbYQMRM5hY4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MJDsq5D7CC7hv1JBFjbfu8yb0LFB7CbgwGThNp+yX+EQ8EE2rVbGLerao4AYL+gdwbezRTwPFaX30RApy1pEQUgVGs+GY4ps4wWAJcQ1y2KohBHtJWGGQMgf3Gnds2DSrl00hvQdKM0ylp4WJJnVnMhYGFeiLsYOxBWTUKUINWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c2QO/dBK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507A8g2m023536;
	Tue, 7 Jan 2025 10:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qDiDCWBOHkHAXqg7DjK8bn
	RuwDwO/XjS0ACB8azPTos=; b=c2QO/dBK1TnpHHo8ksKa1+bt6BJxRVu7IvmFUG
	nlLsNr+9GNJ9+JQ8+dpJK9iUEVtVNzhMqwB1B/b2gJyMoQWlqa5fJ9GdwwOITcL5
	da1nrY/M7ujLFkS0xcI100VoYbOcLxT3o7pumDIWYD5UnkZu1naxifNsytDRx9rD
	/pD7iR8fGygDbIhvVFeZ6zwluqtL4JwYIXPIdzW4UP8SS38JSGOdOte0KZBi57Wu
	Xhz5gPi+x8HOiaFf2fgYwRqhohoZ7PYtRn4dHuyce2FvDvjIt4JPNJRnkORxacmq
	dzvcyNzmPvHuX2yp6Hqf1/4UDTwyBC+GzzGuNP6wBGKuPMmA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44128nr0eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 10:13:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507ADlFc010613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 10:13:47 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 02:13:42 -0800
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <konradybcio@kernel.org>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
CC: <quic_gokulsri@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3 0/8] Add new driver for WCSS secure PIL loading
Date: Tue, 7 Jan 2025 15:43:12 +0530
Message-ID: <20250107101320.2078139-1-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I2YaJ9xCz4c_WZH9-pQX3Nov4C-1AGFY
X-Proofpoint-ORIG-GUID: I2YaJ9xCz4c_WZH9-pQX3Nov4C-1AGFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=857
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070084

This series depends on Sricharan's tmel-qmp mailbox driver series v2 [1].

- Secure PIL is signed, split firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20241231054900.2144961-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

changes in v3:
	- fixed copyright years and markings based on Jeff's comments.
	- replaced devm_ioremap_wc() with ioremap_wc() in
	  wcss_sec_copy_segment().
	- replaced rproc_alloc() and rproc_add() with their devres
	  counterparts.
	- added mailbox call to tmelcom for secure image authentication
	  as required for IPQ5424. Added ipq5424 APCS comatible required. 
	- added changes to scm call to pass metadata size as equired for
	  IPQ5332.

changes in v2:
	- Removed dependency of this series to q6 clock removal series
	  as recommended by Krzysztof

Gokul Sriram Palanisamy (3):
  dt-bindings: mailbox: qcom: Add IPQ5424 APCS compatible
  mailbox: qcom: Add support for IPQ5424 APCS IPC
  arm64: dts: qcom: ipq5424: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bringup q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
 .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 ++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  80 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 ++-
 drivers/firmware/qcom/qcom_scm.c              |  13 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |   1 +
 drivers/remoteproc/Kconfig                    |  22 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 406 ++++++++++++++++++
 11 files changed, 775 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

-- 
2.34.1


