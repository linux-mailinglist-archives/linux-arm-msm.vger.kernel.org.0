Return-Path: <linux-arm-msm+bounces-24301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C69391845B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167771F285BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2CA188CCB;
	Wed, 26 Jun 2024 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oJTHQzoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA3B187323;
	Wed, 26 Jun 2024 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412414; cv=none; b=HzVfsq5glpHEzI4xGTz7En7Ep4GkPxhR+bIBFB8+SCvWAv8ISGlnGC6D3JiB2POuWYVWoakLVBH0gdeiZKyY/CwyKJU4EgFqgJS/7OqzMMI8olcDoathYLHwZ3cTMM1dG5exNW5tgH8SZ5mv8bL8BUWluR+jN0Gr5f7u+whjkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412414; c=relaxed/simple;
	bh=+53iBaNneJUrnJLXQopSACioG062JSDnqGOyOiIkLoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JtKWHi3xWP/x0u4IvOKjwmHOkJi7JrGm66vqWOlIDPbLA5E6Mc8fCdgficnu9M+fWtLTWwZ1SGWwKuNzeHlClsS5OvN30BX4CNgr2gdpocR7X02wdtlRXShA4BtZWoQ4KJyjlVKINgXHQ25H0y62PBKaw2xpwTHPTTk1ZPksv7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oJTHQzoj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfODj022641;
	Wed, 26 Jun 2024 14:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nQIsFrxbQIhS4BAJsQwJzwW+7/FvXlB51hL
	xw1bN31o=; b=oJTHQzojjOYH4Zfzx126Ph1KVREOS7FdeMOgzUGWZb9+D/TfZrC
	dtY6ThEda+TNkf06tmgD1jt/nFfqAQJx8KqGxuyIqMkAkARM+7PS5BZDHse8TrZy
	dWyZUDa6pc/jVIpjD4uKPent5X0p/kLENvlyeoGj7hl4v3MnMPDBc0SyjWnBxjou
	wKj2dXklTbv/31JxzRI6UrRYLxzzPP7lyv98eHNfvAECk4OOGe8vn/QxNl5Uu/Io
	v83UrxDCHUqf4XVELVB7HuxOlwe2ZXEvDDY4sES4OKNJw43wnqFu0NVDBy71Nm33
	kLUlj9yFG73c3vDypmC+75oAh/0gIipH68A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9hcgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45QEUA8O023377;
	Wed, 26 Jun 2024 14:33:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ywqpkv29c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:03 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45QEX3Qf025794;
	Wed, 26 Jun 2024 14:33:03 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45QEX3fr025793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:03 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id 8295340FB3; Wed, 26 Jun 2024 20:03:02 +0530 (+0530)
From: Devi Priya <quic_devipriy@quicinc.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konrad.dybcio@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
        nfraprado@collabora.com, u-kumar1@ti.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V5 0/7] Add NSS clock controller support for IPQ9574
Date: Wed, 26 Jun 2024 20:02:55 +0530
Message-Id: <20240626143302.810632-1-quic_devipriy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: bfMj7uiVpEwpqRE50g9WKrvhGYSPU_r0
X-Proofpoint-GUID: bfMj7uiVpEwpqRE50g9WKrvhGYSPU_r0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=896 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260107

Add bindings, driver and devicetree node for networking sub system clock 
controller on IPQ9574. Also add support for NSS Huayra type alpha PLL and
add support for gpll0_out_aux clock which serves as the parent for 
some nss clocks.

This series depends on the below patch series which adds support for
Interconnect driver
https://lore.kernel.org/linux-arm-msm/20240430064214.2030013-1-quic_varada@quicinc.com/

Changes in V5:
	- Detailed change logs are added to the respective patches.

V4 can be found at:
https://lore.kernel.org/linux-arm-msm/20240625070536.3043630-1-quic_devipriy@quicinc.com/

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20240129051104.1855487-1-quic_devipriy@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20230825091234.32713-1-quic_devipriy@quicinc.com/

Devi Priya (7):
  clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
  dt-bindings: clock: gcc-ipq9574: Add definition for GPLL0_OUT_AUX
  clk: qcom: gcc-ipq9574: Add support for gpll0_out_aux clock
  dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions
  clk: qcom: Add NSS clock Controller driver for IPQ9574
  arm64: dts: qcom: ipq9574: Add support for nsscc node
  arm64: defconfig: Build NSS Clock Controller driver for IPQ9574

 .../bindings/clock/qcom,ipq9574-nsscc.yaml    |   74 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   41 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   11 +
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/gcc-ipq9574.c                |   15 +
 drivers/clk/qcom/nsscc-ipq9574.c              | 3096 +++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |    1 +
 .../dt-bindings/clock/qcom,ipq9574-nsscc.h    |  152 +
 .../dt-bindings/reset/qcom,ipq9574-nsscc.h    |  134 +
 12 files changed, 3534 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h

-- 
2.34.1


