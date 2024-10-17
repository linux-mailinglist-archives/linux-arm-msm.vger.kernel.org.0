Return-Path: <linux-arm-msm+bounces-34688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A709A19A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 06:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9CB22879AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 04:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503917DA73;
	Thu, 17 Oct 2024 04:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T41cO075"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A22487BF;
	Thu, 17 Oct 2024 04:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729139037; cv=none; b=KW+QnLhKX2m1BPIotD3yrxfiSQ8pIlTOwJjVi1IZAjhZOx4+x92uOVjdpT0UIgRcVaYn5FUunpCLZKgmFkA3U7zCD1iAOkEORk5FX+tQyYZD7WezXekuFm2aHOaT3ANWclM69rKNSxYfmoAvbNQNLQpr9B4v547w97GY+Xefj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729139037; c=relaxed/simple;
	bh=LXiMc445BOYtvHxbcRuffWDg6gqPWOIif7UCCCHA4Y8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZXfXJaNS2czzot3IQzqchDfiDTRS9kPTHd/dCtgNPhioHuhnOso4kQ7/N302hQWxIgHl17rTzO5f9RqCX+xytLnEy/O2litFZzIotPqd4vlmO9R9LAMxklMcajUwBKdhZG0NfhfF1rFYj3CixqDbJ+IJsPZe7YlditreI03wRuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T41cO075; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H0N9nr010224;
	Thu, 17 Oct 2024 04:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nsGiqOGRtHAx5CaZ1Icwl7
	KnYHotsWjzGfffnFggC0U=; b=T41cO075PnAJ2FUUuzSx2PibGa+77PqpkK71Yr
	0g70E5i9F7p+jSmGSMOkD7g98Zw1ahal/T0NMaQrNThLCrGKo2wG3g4dtASoJsg8
	O51bJGMqkIocOksGWUvHGFaFh6lKJG2fLNq82i5i2hu1kFxCwXYZqFlqNFhkTtFY
	8ooDYyfjEJgqLijccwwnfOnuUHqc96VIuDoEFuwvVuVdKJsDfqunCWwxkTe3Lja5
	i5E7tlmexmsWgk7hm8tWLQsxEaH7e/bP4XawSvIIJdNjb6r7THqQiojfAQQRvtt6
	UJxhEfLpMKaRcj9SQhJYwwzV4fOmSIzEbCXb0y86DKSYpwbw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ar050ggv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:23:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H4NaaM019426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 04:23:36 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 21:23:29 -0700
From: Xin Liu <quic_liuxin@quicinc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
Subject: [PATCH v1 0/4] Enable UFS on QCS615
Date: Thu, 17 Oct 2024 12:22:56 +0800
Message-ID: <20241017042300.872963-1-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8Fu7MJ7BqXGfQ1Z8xPhDmlnS-0AxJvZr
X-Proofpoint-ORIG-GUID: 8Fu7MJ7BqXGfQ1Z8xPhDmlnS-0AxJvZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170029

From: Sayali Lokhande <quic_sayalil@quicinc.com>	
	
Add UFS support to the QCS615 Ride platform. The UFS host controller and
QMP UFS PHY hardware of QCS615 are derived from SM6115. Include the
relevant binding documents accordingly. Additionally, configure UFS-related
clock, power, and interconnect settings in the device tree.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/

Xin Liu (4):
  dt-bindings: phy: Add QMP UFS PHY comptible for QCS615
  dt-bindings: ufs: qcom: Add UFS Host Controller for QCS615
  arm64: dts: qcom: qcs615: add UFS node
  arm64: dts: qcom: qcs615-ride: Enable UFS node

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 45 ++++++-----
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  2 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      | 16 ++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 74 +++++++++++++++++++
 4 files changed, 117 insertions(+), 20 deletions(-)
---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8

-- 
2.34.1


