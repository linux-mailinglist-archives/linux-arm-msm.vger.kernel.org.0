Return-Path: <linux-arm-msm+bounces-48376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D39EA39FC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F0483B3E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5364326A1A4;
	Tue, 18 Feb 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hRq1BfKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972226A0DA;
	Tue, 18 Feb 2025 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888840; cv=none; b=YYQpFURAr7kV4QK6y0YhidrIBuveawfmkMHNP0f82q1mNFZUmaZZ/Ct4oKHN9M2mS+ONk+ifpgGcY7U/GpxMNCEeJIfuSPc+QPD1LlkpYpgB3p2JZ509+DdhsU4eBW/JlLzuJ12541FAm0+LYDS3tAPyvY4QsNXe6Lv3RaLdjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888840; c=relaxed/simple;
	bh=QH903NIb9GJyvYyKPIRRFqRFCxhLcmgmnr5XXY1E+CY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rbDemHJdFmFTcs2QxAPr4HJbNIf52iM4zMruvmhGtYdp0mH1GBv+bl/I0Ui3W876ZkANoKSH1BI9xTj7zeQfJqFOIE8GdQHAvFVV9cZ+XZLVQMqsb+hMDUyu/pGG3fyay0uVVFlR6cBlSym3kYmg2qqp9IP9f7xYqWGxVOpkz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hRq1BfKI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IAmPmW020884;
	Tue, 18 Feb 2025 14:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9iwfL+tR5+6OVjLiIJa571
	ZpVFtFKi21lmL2m7+nQz0=; b=hRq1BfKIBzarL8E3t4zsaSaBsLbWg0p0rrHbce
	vcubzs4rPrh1MiDWKJa4856Gq73/0W669++cF+Xs751vZq8zq40c3TvCNtxQ0MVx
	XmieVMPtA3+cgr0zAP2Kc9TBPHyeySdUl+2sGY1ASiHSxzgwtzH/brJeP4l2xw/J
	BdO8LBqxq34DZuOyyRPK1e1Wbwvjv60ZugrrKVvJivyUjpLz8x7jIDZyOzMZPv5H
	xSEwn437/GdGCytR2zqQ28wMz5qtIukCf8PUAhHCTXLbalLOe6kdIEnJxHWgz6tW
	Lw8O6H/KG8rN2iZegMH2+GW1IsrvmwDbyxoTvT9uAvYY61yw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sw530-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IERD4Y012465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:13 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 06:27:09 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH 0/5] clk: qcom: Add support to attach multiple power
 domains in cc probe
Date: Tue, 18 Feb 2025 19:56:45 +0530
Message-ID: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWYtGcC/x3MQQqDMBAAwK/InruQBKu2XykeJLvqQkxCEkNB/
 HtDj3OZCzIn4Qzv7oLEVbIE36AfHdh98RujUDMYZZ7K6AmrEAdrMTqHx+mKYCSsoYjfkAbdk+W
 XVjxCG2LiVb7//TPf9w/GonXMbQAAAA==
X-Change-ID: 20250218-videocc-pll-multi-pd-voting-d614dce910e7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DyjMi4cZoWxtEdqa8PrD4YZOxeKRWxC1
X-Proofpoint-ORIG-GUID: DyjMi4cZoWxtEdqa8PrD4YZOxeKRWxC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=975 phishscore=0 spamscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180108

During boot-up, the PLL configuration might be missed even after
calling pll_configure() from the clock controller probe. This can
happen because the PLL is connected to one or more rails that
are turned off, and the current clock controller code cannot
enable multiple rails during probe. Consequently, the PLL may
be activated with suboptimal settings, causing functional issues.

The support to attach multiple power domains to clock controllers
was recently added in Bryan's series[1] but it currently doesn't
enable all clock controller power domains during probe which are
needed for PLL configuration.

This series adds required support to enable the multiple power
domains during clock controllers probe and adds support to enable
both MMCX & MXC rails during probe for videocc on SM8450, SM8475,
SM8550 and SM8650 platforms to configure the video PLLs properly.

This fixes the below warning reported in SM8550 venus testing due
to video_cc_pll0 not properly getting configured during videocc probe

[   46.535132] Lucid PLL latch failed. Output may be unstable!

[1]: https://lore.kernel.org/all/20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org/ 

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
      clk: qcom: common: Attach clock power domains conditionally
      clk: qcom: videocc: Add support to attach multiple power domains
      arm64: dts: qcom: Add MXC power domain to videocc nodes

Taniya Das (1):
      clk: qcom: common: Add support to attach multiple power domains

 .../bindings/clock/qcom,sm8450-videocc.yaml         |  9 ++++++---
 arch/arm64/boot/dts/qcom/sm8450.dtsi                |  3 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                |  3 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                |  3 ++-
 drivers/clk/qcom/common.c                           | 21 ++++++++++++++++++---
 drivers/clk/qcom/common.h                           |  2 ++
 drivers/clk/qcom/videocc-sm8450.c                   |  4 ++++
 drivers/clk/qcom/videocc-sm8550.c                   |  4 ++++
 8 files changed, 40 insertions(+), 9 deletions(-)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250218-videocc-pll-multi-pd-voting-d614dce910e7

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


