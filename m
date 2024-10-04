Return-Path: <linux-arm-msm+bounces-33082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46898FE6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 10:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6372815E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 08:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E4C13790B;
	Fri,  4 Oct 2024 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F33xiuW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE417758;
	Fri,  4 Oct 2024 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728029056; cv=none; b=rpcwJwRawsrXLm5vM4KwqtHBXAWdz8ZmpTsNUuaLZ0wQfvsBjhk/ppez6LN974BuGCFH9orMbyEosYd56yIwyfBseD27hOfMUUFjphka8W880kPqm/bo0QH3zc2pnqaI0TcAn91rlVI3hYEEKTRERCQWcQefNIxixhLqz61YRgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728029056; c=relaxed/simple;
	bh=h65RflRz+Xc0XBbJWFdolvGQoCRw+HnI0KTHw3iymG0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ScAHWETJufpwvaZUia6k4jBTMAPq9gDfp4+U1ge2AlJNaeBh43b65OJdVB5THj9H1NFK2+/L71zbp/tkosxzjOdF8S5I/jf6sVrJuGTVV8Rz7L/ajCh/eCylUpae8USpI9mNh1yaSkoLkjMmYi2IcyGQXtO3Yqs/1dAl2BjA71c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F33xiuW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493HxVmg032513;
	Fri, 4 Oct 2024 08:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fPzENCrFbQEL+3tzaioQaX
	RGXU639jL92m3bGnqv5aQ=; b=F33xiuW1MVJGZOWNdP05XFDxsqFVaP7/wqreHg
	sEMPAxnsb6qhGXNxiYOfboqHQPAGFdj8Wl55QvUZ88+4sCtur+3fEBfrCzLeFL9s
	8tMG7qm6HImi/CP/+Bk3bc7MkdTuuhHnmDFk7a2hhKoG1t5NcgOvlbEML/2q7nBP
	9Xjfj3Xnj7RgQbCn3dz5JRgtbr0b4ZHUWOIPkS68eL5DT+ZSyOzbgTAiYqAJsl+z
	W+5n0rvGbq2W2n5RQO1FTmi8eT2DUxH7FtFWx4tvOir21FieU9kHuBIGmVA7H6QI
	+RW9kTlvm4jPhF5y0WJkRZ8L9FMc1H1sO9b/upqGjFMsq6Nw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f1e77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 08:03:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49483t7o021626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 08:03:55 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 01:03:48 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v6 0/7] Add NSS clock controller support for IPQ9574
Date: Fri, 4 Oct 2024 13:33:25 +0530
Message-ID: <20241004080332.853503-1-quic_mmanikan@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PyY0lqtlkLSgrmBQ-hSQRsmFdCvSznSr
X-Proofpoint-ORIG-GUID: PyY0lqtlkLSgrmBQ-hSQRsmFdCvSznSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=901 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040057

Add bindings, driver and devicetree node for networking sub system clock 
controller on IPQ9574. Also add support for NSS Huayra type alpha PLL
and add support for gpll0_out_aux clock which serves as the parent for 
some nss clocks.

Changes in V6:
	- Detailed change logs are added to the respective patches.

V5 can be found at:
https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/

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
  arm64: dts: qcom: ipq9574: Add nsscc node
  arm64: defconfig: Build NSS Clock Controller driver for IPQ9574

 .../bindings/clock/qcom,ipq9574-nsscc.yaml    |   74 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   23 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   11 +
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/gcc-ipq9574.c                |   15 +
 drivers/clk/qcom/nsscc-ipq9574.c              | 3084 +++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h  |    1 +
 .../dt-bindings/clock/qcom,ipq9574-nsscc.h    |  152 +
 .../dt-bindings/reset/qcom,ipq9574-nsscc.h    |  134 +
 12 files changed, 3504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h

-- 
2.34.1


