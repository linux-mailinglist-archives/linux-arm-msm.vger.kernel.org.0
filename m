Return-Path: <linux-arm-msm+bounces-38165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BC9D0971
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35F05B21132
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932CA1465A5;
	Mon, 18 Nov 2024 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KbPe1YiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC31C6B8;
	Mon, 18 Nov 2024 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731910721; cv=none; b=GH3JXDNH8duaE7OuYhBDbhqzqitCs6ilBe9uxeBtXz6PUQJGq7UyUkQZe/d0KTtqRgIv4d2QbenPgxO8Ow+66XLplEwmMx3R7RKMh/ZaiU7xtOo7Xgm6ODtigm1CwVvzG2i2WhQ9lJ2c4oOnqorNS/07c6Z/mLgCujSq0IupKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731910721; c=relaxed/simple;
	bh=Zm9tehsSs7BLjNfhUeRO8pHHmppIjYVtYgtpVwgrIP4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Wp7lW0IFLMM4pJYi8IsFYNqTjp+iUtUPDlVux70i1fjKrEJu+SqD8Ba27ceHHACdLKYFfAiE+T5WrnfbzGK+XzAiH/MwOxEklyAQkv7CRw3mZtC954wXN+u4SY6TVNtxqlCTGq2SSuhbRO9bnXhJn3+/Hd6Xfiy7+1Qu4z2YNo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KbPe1YiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5SF22003568;
	Mon, 18 Nov 2024 06:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CpCdAQqS4w3V1Exr745zFN
	JoIIAlh+Y7MPwMKhJZx18=; b=KbPe1YiTWzVvfqMQPhhVrLEgdhB3b3+QrBaUI3
	9Uu3iTaACIm2p4oenpp6zfL0YSA3Fssodw9gn4DfVHyMMAYISp4nvJvJzAmjzg6j
	gsLhbZxrDuZKdiF9Qxegbf8lpFPh6cOGgcQa/BPrJKN5X+cbPJU4J5TvvziTu4nd
	/dQ7Jj8nS+0XVtAzO6e2SwZL2YmlLK7O7EUP/DmL+yqfS+K2Tqh7E10Ta2udNi5U
	JsXt1HwZXpoRXcmep3yEDtXQsiX25aE+GxL8x+K5UuHKjZBg4p1TfBwtz91BUcBZ
	szgmMGBJmQaYtSNB1WIVqajadCbbn25q4BMovMCQyB9DOUDA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv9ujqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:18:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6IBjN014966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:18:12 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:18:04 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH 0/3] Add standalone ethernet MAC entries for qcs615
Date: Mon, 18 Nov 2024 14:16:49 +0800
Message-ID: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLbOmcC/1WOyw6CMBREf4V0bU1fyGPlfxgXpVykC4q22GAI/
 +7lodHZTTJnZiYSwFsIpEwm4iHaYHuHhh8SYlrtbkBtjZ4IJhRH0WBa6DTNCp5mWcEEa1KC4bu
 Hxo5r0eWKvtIBaOW1M+2Cb9Qe9PB44tCwpbeo6bvODmXiYBzoNsZysjS1Ngy9f60PI1+J/Yz4n
 ImcMqpUfspSXeWFqs84YKwzR6xdS6L4BeUXFAhKcdKNVKnUuvkH53l+A/If+s8hAQAA
X-Change-ID: 20241111-schema-7915779020f5
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_jingyw@quicinc.com>,
        <quic_jsuraj@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731910683; l=824;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=Zm9tehsSs7BLjNfhUeRO8pHHmppIjYVtYgtpVwgrIP4=;
 b=4WX46OMtEAR1pPzx/Y36ezeXe0o/tfSt3fX7rS2RoXdlQD+kvx0bcmg6YudNXySJ1bdQJKPnD
 Oy9KbJMqD9TBJUqYOil9GB6sUDLz7YLJDmU3UPUxNMCj4WzU9wHLPco
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GfrKfr-53M1u1xTlWARFwCoWmY_EveUL
X-Proofpoint-GUID: GfrKfr-53M1u1xTlWARFwCoWmY_EveUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=635 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180051

Add separate EMAC entries for qcs615 since its core version is 2.3.1,
compared to sm8150's 2.1.2.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
Yijie Yang (3):
      dt-bindings: net: qcom,ethqos: revise description for qcs615
      dt-bindings: net: snps,dwmac: add description for qcs615
      net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
 Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 4 deletions(-)
---
base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
change-id: 20241111-schema-7915779020f5

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


