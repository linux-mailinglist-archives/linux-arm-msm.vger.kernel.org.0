Return-Path: <linux-arm-msm+bounces-52405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124EA6E459
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B59141653E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0A11C8629;
	Mon, 24 Mar 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PEKsSUsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8251F199FAB;
	Mon, 24 Mar 2025 20:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848190; cv=none; b=EbQERWpCRulFistWw1tm7YiF2o16FdyS8Mkct4ih+d1g21EVzPB91Dy20NYQlavV9wfYb9wPXdhhectUR5e4tLGTDP0OFApRihJXNBRzI9oricOgQ0/E9lqNqgNEXFux3I0DapVXi6RqVE9rt0v/TX5fxKrUhvpjo36LMlfF+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848190; c=relaxed/simple;
	bh=7vceHzDAOfmQ9IMrIPKf2PC48f4XbvQNl2rsiq/Fjkc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JGDON076/1raOZmsWf4z3ybusHhiDlElYxhC6UEpq9ZR9dprKv22attTpX706djfgXvtRKlVdEg2L+a7GQhHZtVLKuEnYgYx8b4ma5v+VoNY9tCHPJARB89UEGhZ5LSoA0KPs3JFNkmn+eg9kLuP/mVP1yP57Qh+HlnSEBHovlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PEKsSUsz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OJFGjq015777;
	Mon, 24 Mar 2025 20:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52hmL9nRtcbv1nC27v3Mxh
	bd9WAadn5RdblOk7BfgMU=; b=PEKsSUszrTG0rGowxkyAAWgywp7DL79HC142Zg
	0Rgo4J8RAvog16ilb/dLsnNM8blQaYIwkyyMQYAylabLDcjSbfIUVV8Sj+rDvYol
	NAYrfV9mDOIULsHpsQ1fOKSCw/+cwE1x8H7pRrFdiKHbtBXN/jsFIBGWJou+GrEk
	jwYFHleeajzv+3Ew2nEAfJBIaYhiD8AN7zvbvCfyKUHh0ruM4DFbmkWHDP+uOMae
	pZ8QNEtmw1oD/mi7mBKc3wR4szagfK7UOSnW0yUkT6Gu0vhSuCjP1avbDVZznHul
	UVXV3guUrjj+MbA8AGQ7UQLgGtysbptU6l0qk85bDyYo4KDQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wdhnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:29:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OKTg5Q021471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:29:43 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Mar 2025 13:29:42 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v3 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Mon, 24 Mar 2025 13:29:36 -0700
Message-ID: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDA4WcC/23NywrCMBCF4VcpWRvJ1baufA+RkqSjHehFkxqU0
 nc3LYIIXf4H5puJBPAIgRyziXiIGHDoU8hdRlxj+htQrFMTwYRmnOU0dEWuWdW2zlWdCSN4ao2
 RNShlmbQkHd49XPG1oudL6gbDOPj3+iPyZf1yXG5xkVNGtSxKWwoQdW5Ojyc67N3eDR1ZwCh+i
 GRqExEJMaCAl6rU6gD/yDzPH+nrdWT7AAAA
X-Change-ID: 20250107-sm8750_llcc_master-baa3de44b03b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742848182; l=1727;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=7vceHzDAOfmQ9IMrIPKf2PC48f4XbvQNl2rsiq/Fjkc=;
 b=oignf92cgrQgROUL4q/lzGl+WqeaxXyGRae21mdSMmNF9hOzp1avXavXggPeg6PxCa9xTIyfd
 OtYre/N0WqDDkchyG7t9YyjpND64pqvsYyZKE36rxhXfnGpKOW9cLim
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _hIV_EgSegC0w5bHqzex0fSdOq_inq1S
X-Proofpoint-ORIG-GUID: _hIV_EgSegC0w5bHqzex0fSdOq_inq1S
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e1c0b8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LjbSQkOYX1iDu3uAMKwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=553
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240144

Add documentation and functionality for LLCC v6 used on
the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
and supports slice IDs over 31, so new functionality is necessary
to program and use LLCC v6.

---
Changes in v3:
- Removed some unused variables.
- Added parent/child grouping features to v6
- Updated cache data table with up-to-date configurations
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com

Changes in v2:
- moved v6 offsets into cfg struct
- reverse xmas-treed variable declarations & removed unused
- removed unneeded skip_llcc_cfg branch in v6
- updated some macros to use BITS, GENMASK, FIELD_PREP
- moved LLCC_* definitions to appropriate patch
- updated sm8750 slice data struct to match updated standard
- fixed style on dt node
- note: did not add cleanup patch to use bitfields
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com

---
Melody Olvera (4):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750
      arm64: dts: qcom: sm8750: Add LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  18 +
 drivers/soc/qcom/llcc-qcom.c                       | 496 ++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 4 files changed, 520 insertions(+), 4 deletions(-)
---
base-commit: 882a18c2c14fc79adb30fe57a9758283aa20efaa
change-id: 20250107-sm8750_llcc_master-baa3de44b03b

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


