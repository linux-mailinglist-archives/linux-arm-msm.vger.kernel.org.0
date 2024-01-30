Return-Path: <linux-arm-msm+bounces-9028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F0C842455
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 13:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B9821C23E83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 12:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A23C67E80;
	Tue, 30 Jan 2024 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NdS6Hii+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521167E75;
	Tue, 30 Jan 2024 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706616229; cv=none; b=WXPDUCob5ouaw7vDv/dbNOpUOD6gSDOQIp2FBofQPC/F42vmwh5G2IHzTzBMr311fNeDNxn2U5QMmXo1mW106Pn755XGH0qnyoNa7+rAfCjG57ZIDQzsCrVw5u64uxfRaS/rTFjPKBT2nruCO+doNfDZX9ZxFpwRimwhDGrybzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706616229; c=relaxed/simple;
	bh=wvYLYxHa+d1krZ/psgdrnxGHXm1WuZZV6nqRtagnve0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=krmkSBDhocJKDa9QivSu5nm2XINV6pR6/TWS48XohQvDXxQskCMwBhg06YqYnYX/eK2E3NBYp6J7oJ2NW0PTVryyY7a4PM9YXz55xZWvA8l06xKf3/Mtp3WScqRQsi5SkmRDJdK27AVROdS/yYTRut3nqOVQmFSk7pcz8HKMXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NdS6Hii+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40UBkjH8023065;
	Tue, 30 Jan 2024 12:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=3MxKqvo
	5I+D+3YnS5rRz5UulxwzwdT+6LwQsMyL+GhY=; b=NdS6Hii+LCttJ8I2uzjuTXT
	2NyzqDBCNwipSx+jm01bSQIyCLg6HXssuRFX6odQmFXgiGuvd3J81Q/8GR9Fs+s5
	JMkEysvQw9OqDmjbN2zD6tVOOQRb/hl7U31xR3LTc0+iCEFCtGxiRsMR4tZBQ/Qb
	mkN7krPwjSR6qOA9PZE7snnMtiUQfZbxY3MJxY8R4M/t98NDNTYwUhp5GtCvOgbe
	LbTYb7MF15q+hUnJjEw+hAx6Muet1Nr3fTc/JKObqOu0NplztLSJ1VwDFsofi37d
	iVkFfAorbtX8cOWtyabZlhiMLJlotD148J3F0F5sqBmgiqp7R4YjibXik2J6LXg=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxwwv8cqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 12:03:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UC3WYB014182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 12:03:32 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 30 Jan 2024 04:03:22 -0800
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Jose
 Abreu" <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>, Rob Herring
	<robh@kernel.org>
CC: <kernel@quicinc.com>
Subject: [PATCH net-next v12 0/3] Ethernet common fault IRQ support
Date: Tue, 30 Jan 2024 17:33:03 +0530
Message-ID: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tVvWKgPuBr02Jr2C6FhZB61d6HjbV0YD
X-Proofpoint-ORIG-GUID: tVvWKgPuBr02Jr2C6FhZB61d6HjbV0YD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_05,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxlogscore=889 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300088

Changes since v12:
- Update correct sender email

Changes since v11:
- Update debug message print

Changes since v10:
- Update commit message

Changes since v9:
- prevent race condition of safety IRQ handling

Changes since v8:
- Use shared IRQ for sfty
- update error message

Changes since v7:
- Add support of common sfty irq on stmmac_request_irq_multi_msi.
- Remove uncecessary blank line.

Changes since v6:
- use name sfty_irq instead of safety_common_irq.

Changes since v5:
- Add description of ECC, DPP, FSM

Changes since v4:
- Fix DT_CHECKER warning
- use name safety for the IRQ.

Suraj Jaiswal (3):
  dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for
    sa8775p
  arm64: dts: qcom: sa8775p: enable safety IRQ
  net: stmmac: Add driver support for common safety IRQ

 .../devicetree/bindings/net/qcom,ethqos.yaml  |  9 ++--
 .../devicetree/bindings/net/snps,dwmac.yaml   |  6 ++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 10 +++--
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 41 ++++++++++++++++++-
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++++
 7 files changed, 67 insertions(+), 11 deletions(-)

-- 
2.25.1


