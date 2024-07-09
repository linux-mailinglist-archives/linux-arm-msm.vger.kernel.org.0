Return-Path: <linux-arm-msm+bounces-25663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B706292BC9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBFD9B2256A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AE819CD00;
	Tue,  9 Jul 2024 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n0TgL3st"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A09257D;
	Tue,  9 Jul 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534448; cv=none; b=Oy/gd4ght9gZdr6NRPL1cM08Lxt1xFFxofoTWBerBX0WAlJcsl1/+UZrIu7wnl5PX8usRkp7sgFUBZxqSePc1G+ty69G35Om9MfQgyv8y+8TTK7gA4xNqmhGmsoL89u5d56U+7mfL0u+G3ET90xSQ+Mvk8GOnp6UqRWv16ggrsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534448; c=relaxed/simple;
	bh=Mw5x00adUnIjpT8DodMmSlrNRcQFSUqIMX44J0tivsw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ufmOe7ylNe2jWzImXUPprVJ1ZIlIHZyh1YmsRBXTZWSS4OHqudbnPyG4YVvXGnNK4HfX7IYdbFmJRSpI21va62c6VuwDepBc9IkyMN1xvyq4xPuEK5LjWqXc0IF094kyA2wM7Mcad+pZjKK/5rp/4COsEfWu1piJ4LUEMCsk1rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n0TgL3st; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BON6r006674;
	Tue, 9 Jul 2024 14:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CaoST2pmH0+rKjnT4vtfSh
	/+Cyk6rbDR7dh4DEwAvUY=; b=n0TgL3stKVVtv4f+Am+sHjF/JrkP4pa7vi/W6j
	xUun1OCTgeG7hwNXKa9Vch/gvo+pX8rcAGWTd3/mPLfjoy3UM6a+0JrJHN/aRjV9
	zN0DiYFtJD/B++0Fr7PXdM+lXkFHyS9Reqm2NNCSds1Nm4y0KVGOXryQg3UnEn58
	v1OdPP56P2kaz35uSHjZF02UlPCK601aUNgy3J2X9gxHuwjIV5I2U2rxtEtm809I
	epPlWeW52eyKtCjBXv+09BIaz9kPUa9J5sXvj4EJQd88xEQxwRxiiJ241g+Ms8l9
	HthV95BC1IXB0b4MSHZEM/DrRRYe2+K8H0yQk7gocDyGQqng==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn6vup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:13:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EDdYc027290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:13:39 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:13:31 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] net: stmmac: dwmac-qcom-ethqos: Add QCS9100 ethqos
 compatible
Date: Tue, 9 Jul 2024 22:13:16 +0800
Message-ID: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHxFjWYC/zXNQQ6DIBRF0a00jIv5oEbsqPtoDEEE/UkLCtS0M
 e69aNLheYP7NhJNQBPJ7bKRYFaM6F0Gv16InpQbDcUhm3DgFTTQUjUMctGxZQDSpGnxUWr/mlX
 C/mmo7eu+F62wtipJbszBWPyc/UeXPWFMPnzPu5Ud679cAq9FDQVnDQcQlNHljVom40ar3P0AO
 l3kL9Lt+/4DZSQ5e7kAAAA=
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <kernel@quicinc.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720534411; l=1755;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=Mw5x00adUnIjpT8DodMmSlrNRcQFSUqIMX44J0tivsw=;
 b=Dlmhrv55eb8QYhDCsA0jLYoMpuqxItalZicV2Do7X7cQ0L/BYcpZr+LeES9iMy98HabcYIEWn
 Vpqd1Mmgba6DTF+UgNTXQ84wUlNW8YDwj8Q8QQEXl8YwXxkp3ll/jLt
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hqRpyPPU7VmqBgsb72Xc4B8Q0JdtsroC
X-Proofpoint-GUID: hqRpyPPU7VmqBgsb72Xc4B8Q0JdtsroC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=799 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090091

Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

---
Tengfei Fan (2):
      dt-bindings: net: qcom,ethqos: add description for qcs9100
      net: stmmac: dwmac-qcom-ethqos: add support for emac4 on qcs9100 platforms

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml  | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml   | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_ethqos_compatible-fb5bb898ff43

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


