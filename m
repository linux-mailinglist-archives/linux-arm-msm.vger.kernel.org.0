Return-Path: <linux-arm-msm+bounces-29067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92095816C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EE7B1C23E99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 08:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE5918A931;
	Tue, 20 Aug 2024 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HllBXZ2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4C18E352;
	Tue, 20 Aug 2024 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724144140; cv=none; b=VKi5ObQOrb3LW6S3EveUT5IY4wuLckHxvLlhT5Z+xgjKTuW7EVttAlOgz9WcimOMScrnJARzdFsZA86+awlOQuirOSKINuozbRr8ZH0TqfLG4q0qlT76bf+9dUYrLQdPjuFEqRZMRbMRALlQ7v1pzR3FNjuzpUcULXVNB1XpfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724144140; c=relaxed/simple;
	bh=l2XCm7pRRdLX5SKnPjAmLGFzo/lX8GaP2I6uUuzjPy8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i0LVsIj6hMaD+NaUuP0HMC9zVBywhD+fhluPvnnitSBB9xnONcW12JQ0Q15MzVgiFReOpnVF3KnPrNgaHX88hx4vHPjk+8qCmWZjCLa2pyb11cdlUxJ5+5WkX7JAzOXVLVjfBYq++ouWpvQTRcubHhfTWBmU2ovXfC1dFUibPEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HllBXZ2l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K20HAT019635;
	Tue, 20 Aug 2024 08:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YiP/zfX0G96G1enXnT3Wzq
	YO522E4VQ68j3sddw0oto=; b=HllBXZ2lBXfcM88mK1cRl3udTIyxkWg/y49wVg
	KZcnrB7UrxzVndKin8KonyAyAONebKUpB4r2jobr+KENKHgW2aYNOXELFsfXDe8b
	9tslGXMa9tN5oAjh+fQ+a/7xd7IuVaFKoYI1+gLMWTn86VOaWdAyguSxxdGJhDGl
	7U5JTEkttdreBdr1GoXneMhwrwYGZbk5g0SheUTUdYF+nVXfhQb5ySp36T+wALnh
	FfcEkwwBs4QThTmMQLAnT9gIUvrlgahlylj/7tIbB4LrBME1bmQM3qK0sapco1MU
	YZIoKjvKVOft5kqDsfxKWpv9foMMTG6leLmBVnbY05ah2daw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m32q3s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 08:55:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K8tZ3P000945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 08:55:35 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 01:55:31 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH 0/4] Add new driver for WCSS secure PIL loading
Date: Tue, 20 Aug 2024 14:25:13 +0530
Message-ID: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
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
X-Proofpoint-GUID: MaIN7vwaKy9XDyQR9un5nRuo59Zh91TE
X-Proofpoint-ORIG-GUID: MaIN7vwaKy9XDyQR9un5nRuo59Zh91TE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=587
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200065

This series depends on q6 clock removal series [1].

- Secure PIL is signed, split firmware images which only TrustZone (TZ) can
  authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver [2], instead post a new driver for secure PIL alone.
  This series adds a new secure PIL driver for the same. 

[1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240820055618.267554-1-quic_gokulsri@quicinc.com/

[2] https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

Manikanta Mylavarapu (3):
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bringup q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,wcss-sec-pil.yaml         | 125 ++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  62 +++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  58 +++
 drivers/remoteproc/Kconfig                    |  22 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 360 ++++++++++++++++++
 6 files changed, 628 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

-- 
2.34.1


