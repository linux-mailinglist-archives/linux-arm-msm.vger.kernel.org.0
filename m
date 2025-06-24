Return-Path: <linux-arm-msm+bounces-62166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7AAE5D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 847B1176D49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA51246BA8;
	Tue, 24 Jun 2025 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C6DMZrn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734F657C9F;
	Tue, 24 Jun 2025 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747816; cv=none; b=GF93yEgI10QSaLx9QgSocV5tHrrF3cfG0i/lA/8NK9sGcPskJSvfME/kQIJmh5Y0Z09WVJzvQ4fNvCTUcldD4D1bnzsqdpTPpj6EpglNtdnWIbIVCLbafcywVHZB+jsa2v0jynl/hqGuHecICJ/5qNJq8ivoFnsk4B9aHWjBX0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747816; c=relaxed/simple;
	bh=bYUy5b5AemSX+L8+KqgznKt7mKvggbR0E20A4SGRvPE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FiX2fK5vMzJXsXohUyiB4zcbkYvHx7qbfjBDPA/dVh+1tGT8iRtZ2/D0lT221SHJ71L77f1sD19+FvBv/MdpNE4gfLWjzdfY3qD9tcyChfuiuCKHBN2lqJtpGrV5lsQkDKEZc0zTeNQGnnwv+Of5NTd+vAQS2DxlOVjn61cDqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C6DMZrn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlNv5015342;
	Tue, 24 Jun 2025 06:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=27TTRq7FPFUk8HJAEAoODj
	MXSoPbbkPWOMnJihjRr0Y=; b=C6DMZrn3FCnlIrzc0KQxo8EvpssrhPd380D9X3
	UXa7216zhFgYtEzczI9sbmOA6JMYrAKHS08f6OFYfvTCiBB23465+VmvO6M0Bqix
	UMHZajyb7vLAdqBUgMej6Yn4j3yo7ALj60JnlbbPiToKyUSWAXe4nPGXLb0kup8X
	G6e3w0K6nhMezlhdaNkN8vSMJWXE1EOzrhfsiGRKi65SIuTAcYIutAZkIDfjkV1R
	UBYtLwpNtuF7WwRfJNRPTZXVAM93BbCSKwAE1pflCKkZjPn7uAALL1BqrRLrskUM
	VlJ5QF29L6Ri2UVSIhu2fVsnFkpR0AF6OXXfX71KNkEwkaOA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqhj6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:50:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O6o4vU002382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:50:05 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Jun 2025 23:50:00 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v4 0/2] Enable TSENS and thermal zone for QCS615 SoC
Date: Tue, 24 Jun 2025 12:19:43 +0530
Message-ID: <20250624064945.764245-1-quic_gkohli@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pJpvqKAkktgoUP3isVObT1SHn-nb7-un
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a4a9e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=JfOcGDDDXtGUpYJnmSUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pJpvqKAkktgoUP3isVObT1SHn-nb7-un
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1NyBTYWx0ZWRfX0AVENF6zOWyK
 J1mweZ/XiH/IwUskDJYPJMweQlDPQTLFGSGeKBTtKjG9PLp6M6HnBpuacJA9iztDTT3wHM6IfuV
 Gz0GnMFZzznmR6JOu9RFiQ4xH4VzopbKTO3QYsoyt99PdF/StYHlocQFCAoXNo/8Q3X1ga7U7nm
 fD8ZGGDfab78DWeZttnDpyHDMgm9DVHYw1lu7PYRXrgIl8iIxUo/F2G8h5autwFdX928tF+EVIw
 Si9HcdnokNbE7QOogvVqRwjZ5ghnQLiFSgxec/8q6ruKeJ9Tlotu3tv5+8owMm+cSc3XuBn3slW
 ysE1tk3+kb90kN54TPRnLIR1fvbGo5kEbxaGNTwLtPR10ko1rnZ0KnEQjbs6GNykvh+yqkbAiE0
 ZvVHP4jctTa+zvipuTcOUGfxh5/JZrFtsR7u13Y3ApDtxspJQudHWjbR81JpKPYsIwl/pdoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=922 phishscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240057

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

---
Changes in v4:
- Fix naming of thermal sensor.
- Link to v3: https://lore.kernel.org/linux-devicetree/20250613112402.2203617-1-quic_gkohli@quicinc.com/

Changes in v3:
- Add critical for all trips.
- Link to v2: https://lore.kernel.org/linux-devicetree/cover.1744955863.git.gkohli@qti.qualcomm.com/

Changes in v2:
- Drop the passive trip point and add critical for CPU thermal zones.
- Rearrange the tsens dt node and fix the address part.
- Fix the commit subject with target name.
- Link to v1: https://lore.kernel.org/linux-devicetree/cover.1744292503.git.quic_gkohli@quicinc.com/
---

Gaurav Kohli (2):
  dt-bindings: thermal: tsens: Add QCS615 compatible
  arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)

-- 
2.34.1


