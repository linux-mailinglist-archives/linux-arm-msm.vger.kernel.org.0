Return-Path: <linux-arm-msm+bounces-28290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D494E5FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 07:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BBADB215A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D83A14C5B8;
	Mon, 12 Aug 2024 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzncJ2rg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAC44D8CE;
	Mon, 12 Aug 2024 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723439617; cv=none; b=XJ7G1o6zvN+J2FsbEid1kMFQJ3SzTryjawYR/+TUL0n7xdvhV+2JMz5/MB2DqTUx55jjSzNzFaoWienV5pUWA0BM5JsgH+ZNpEt9EYGeoDGapflxfSXEkfqEiPTycpyJTKxTTP/mAheFGHjXDQmBm2nsE2Z1pLNAuHr4elQu99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723439617; c=relaxed/simple;
	bh=PrlB5lV3csud9tc83RGsIHdbyk3u4EYyMFF6FY2nDF8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=soBT+9TgHN34Pb4QJxZLRolsRoF6HFZUu9cjUncb/hZHZ5iHNESGN+1BAM5v70Lt+pKPfmnN0VA1OZ/0a9bD1C9dadvGlPVgUOhI0tEpBU1H+IZ3A1x7+vBATRoTxasIbj1oeLLR9gQ6xAMQSz+56MNqaeUinonzsF1XYsBpHSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lzncJ2rg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2ZXVJ027419;
	Mon, 12 Aug 2024 05:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G9oSuebofV5W0fSG4qXmi2
	qDfBSFVgAWnUcuRIkQklQ=; b=lzncJ2rgkCyEiA8oArP9v9Q9lBIKpExe2hicFl
	9w4yPyAly0fLnlA1sv9GWqERC2+Ys+zq+rgrI0jhyrI8XRQ4dBs5RvttJh/32JVw
	nvo+JHZT88nL5kRVwCqdq2JzeljUHEI4cI8XqW/PeF1NAtIEO3PdYYSDysvVOOL4
	033XMm+GMKN+qGEltFwBoUzVeiaFGR4oYOSPDgmPr0+gd8Q+aVbAJPhzCOh7I0xh
	XpdgqTkpofYfv4kVonjoYxq6KAfoGNkJioI4zSsIXzRrCZlIVS4AgIwUAChhXYX1
	TKmAohab3SYQReuZ3Xi/Aa5WB7QbAk+7MD967Wy3UfcDJqxA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1g7tx7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:13:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C5DNvt008853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:13:23 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 22:13:18 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v2 0/5] clk: qcom: gcc-sc8180x: Add DFS support and few
 fixes
Date: Mon, 12 Aug 2024 10:43:00 +0530
Message-ID: <20240812-gcc-sc8180x-fixes-v2-0-8b3eaa5fb856@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyZuWYC/x3LMQqAMAxA0atIZgNtaLF6FXHQGDWLSgMiiHe3O
 D4+/wGTrGLQVQ9kudT02AuoroC3cV8FdS4GchRcQxFXZjROPrkbF73FkJeYWpd8oClC+c4sfyh
 bP7zvB3FeNZxjAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t5daIxo1ljxos10Ia9LRDGJ5CcVLN_rm
X-Proofpoint-ORIG-GUID: t5daIxo1ljxos10Ia9LRDGJ5CcVLN_rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=828 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120038

This series adds the DFS support for GCC QUPv3 RCGS and also adds the
missing GPLL9 support and fixes the sdcc clocks frequency tables.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in V2:
 - Add stable kernel tags and update the commit text for [1/4] patch.
 - Added one more fix in V2, to remove the unused cpuss_ahb_clk and its RCG.

---
Satya Priya Kakitapalli (5):
      clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS on sc8180x
      dt-bindings: clock: qcom: Add GPLL9 support on gcc-sc8180x
      clk: qcom: gcc-sc8180x: Add GPLL9 support
      clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks freq table
      clk: qcom: gcc-sm8150: De-register gcc_cpuss_ahb_clk_src

 drivers/clk/qcom/gcc-sc8180x.c               | 438 ++++++++++++++-------------
 include/dt-bindings/clock/qcom,gcc-sc8180x.h |   1 +
 2 files changed, 232 insertions(+), 207 deletions(-)
---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20240725-gcc-sc8180x-fixes-cf58908142b5

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


