Return-Path: <linux-arm-msm+bounces-22372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDE904B90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA8A285674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B31168C1B;
	Wed, 12 Jun 2024 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hRbiXd1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0F2135A;
	Wed, 12 Jun 2024 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173669; cv=none; b=c74Qbmn8nWOBktu+sRahutG0AhHkqWJWYzbaXBlhjqzdKFgV3YpZH+zVPSqHwuQ9RR4g1w4jKh8rli0Xx2BiRYsWQ6PeGJWVOtJO/f4lu5Sc5o8yg9Znz/DT8WACfO7JBdcVvBrFtMcc9ZgIUoav1AcP8DHmDABDT2LXp9JkFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173669; c=relaxed/simple;
	bh=+A9GFcAujDkjPAGPch4I3x0UGRqwd8uo/OWdfSJJT9w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qTW+G1cr47d4K6kZqaIiZpFZpukh8ZjNkM/Vhpc98jBc+DAt/6nr5cF4SK013Q+NwOXQgefRZHyv7B8/lwEpKnMbMaWs3eUO5TU15DjidK5FbTwIDBBvw1u6aXoUQzpRYdclvd4sINAGx08FTMxqimVj/gSWqUBFUVZ7ZwHtvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hRbiXd1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BHHrcH001183;
	Wed, 12 Jun 2024 06:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DpyxiSWqtMbYoTxVmS3wDw
	i8TsYjLuBNY90uP/vTmTY=; b=hRbiXd1l6Fb6YIEvIHGJc6NRLPux51ifftT7ga
	y4Fsye9P46gvOcVvNqWpmfnA1C66O0agkaFYRW9PyJnyTZGBYUZPdHYR5uhGzT4n
	hTp6sQF0fTRk3/QYjHPNdvyZ5QprtrtXLmJyu4bQ7wdpbISnQ3BRRBCqxoHpf+8y
	6qdM96podqFCFfnnlYaSyl+k5Fgv1SDtzfU/m48PBuR/btpOyku/O6U7iKOAC49n
	JOdogZSZu2ZaXJhl4puYuvNiJDMokDkZWuKLGl8v26FeD3FG6UfPWwBWAu5or0tS
	e7MwfF/yWXwNmc/PoiHTlzoblqh9VhNAnfIbIboCyFn7iX/A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yptuy1crw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:27:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C6RhvY026096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:27:43 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 23:27:39 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Mukesh
 Ojha" <quic_mojha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH 0/2] qdu1000: Fix LLCC reg property
Date: Wed, 12 Jun 2024 11:57:17 +0530
Message-ID: <20240612062719.31724-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xz4cqGHH_j_LyGjSycX7hO3_eTezoD5W
X-Proofpoint-ORIG-GUID: Xz4cqGHH_j_LyGjSycX7hO3_eTezoD5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=685 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120044

The LLCC binding and driver was corrected to handle the stride
varying between platforms. Switch to the new format to obtain
the base address of each LLCC bank from devicetree.

Komal Bajaj (2):
  arm64: dts: qcom: qdu1000: Fix LLCC reg property
  dt-bindings: cache: qcom,llcc: Fix QDU1000 description

 .../devicetree/bindings/cache/qcom,llcc.yaml     |  2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi            | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

--
2.42.0


