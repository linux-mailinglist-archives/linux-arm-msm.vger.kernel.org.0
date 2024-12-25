Return-Path: <linux-arm-msm+bounces-43289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766529FC4A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 11:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32D371883C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 10:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C35A1946CC;
	Wed, 25 Dec 2024 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="psZ3Q6Bp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AA1514DC;
	Wed, 25 Dec 2024 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735121212; cv=none; b=tRQc/5LJK/qlDT76SJR3gkBx9+Saohpc7v7YrtET3NQKO3xwR7BRUrYKlnWPpPozsUKmxl7OYCz4dHCqX+zbPssJRWYWLuIYpT/3SlckNy0xmotDIYyYqN2+ftZMfjTGJPv5UrJjykqqW47zjUKqdq+N4ecBMP1+sKDxH9tFK7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735121212; c=relaxed/simple;
	bh=f4f7ARMlWhlpRFbU4x466pXEEjcg7byTRF8Uoa1RfNg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=leoJZBqWkElowfdZGZqBdmxRDvPk429W6XhCcPf7tjL5iHMY7N54oozwldkShmdQMk0+B1VdcWTtdTav4qh4HeuNVG27qV+vEkdk5fNgJ73b8LBwx/HrLqo8CsGzX7hjDhUNVcBiE2jBaSRhgvKgoA+N0jXG18X9rsNrriIRn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=psZ3Q6Bp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3jmvv002072;
	Wed, 25 Dec 2024 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jCNY+zimnSJ7Ce2KOi5p8S
	48fxznVf5JS4dSLG7cL8w=; b=psZ3Q6BpUOz8QchhRK2pnFsPcqpN/QcnBBGd8J
	8ptswlI1OGqm0BB6qMGC7G9WZ+cZjWJ9dz8rpFr5ZhopHW18+lZhaUuVcQb0dnrR
	wh1zeSU4/zLxN/Dk0AtPHnuno8HVnu9H/lB51W74av3tY19AOlljAt+DH6pUP8H+
	XeOijCm0e0KLtoCN2eQAZuuUcJcNwHwZR7GqRDUyVCxM/rzuT5w7+Ms2FgoE4gpl
	fN4mlZg+3PkwioO4Sna9ptqUjwhGPFD9yhUuq+nPandZiLKM3T5gqbvCJIsqhaXG
	MPOAhZIQrYw3jgxw2WZUpd46U+VRmD6pbiwhroe2C5ci4rAA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rad81kfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPA6NVK003065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:23 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:06:17 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH 0/3] Support tuning the RX sampling swap of the MAC.
Date: Wed, 25 Dec 2024 18:04:44 +0800
Message-ID: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/Ya2cC/4XPTWrDMBAF4KsYrauikWRZCqX0AjlBKUHWT6OF7
 URyTErI3Su7CXUQtMtheN+buaDkYnAJbaoLim4KKQx9HuCpQmav+0+Hg80zooRyoNDgdDochjj
 ugHRASIdBUKYUCK+Bopw6ROfDeRHfP/Lc6uRwG3Vv9rPzG9/m+PaWiO54ytXjTwx1LiW9VG+ql
 6UZQGI7pt3RJAE1nigm2AnaKso1M619y3kTevNshu4V3Wvz0IVxU/XuPOL7B2i+ah/SOMSv5e2
 JLaW3vSo+nNhcZrTW1oKQnK3L5q6/k55LkOAVAykekvMdE191U1YKPAtUKVsD9cwyWgr1WuClU
 GehrXXbEK0AmC8FsRbqUhBZYPkEr7kQXpBSaP4RmixYLgU3qvFaNqUg/xFkFgRhrfLCUe3so3C
 9Xr8BUW/9XcoCAAA=
X-Change-ID: 20241217-support_10m100m-16239916fa12
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735121177; l=1991;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=f4f7ARMlWhlpRFbU4x466pXEEjcg7byTRF8Uoa1RfNg=;
 b=o6Tg2iuLPSZ6w+JpprK5l0oOkTcWrG9T4e205hRObgP5E+mLwnJ6QXXuu6mVGgiSLr4saWwlu
 X+kTv0o/4ASDETOvKxLt4nWMraV6cUMssZF3r7jzxpE5NUIky2ZOZv0
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f9nbTWuatCW1y9Zwj7J-kJx9UympFpPb
X-Proofpoint-ORIG-GUID: f9nbTWuatCW1y9Zwj7J-kJx9UympFpPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=449 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412250088

The Ethernet MAC requires precise sampling times at Rx, but signals on the
Rx side after transmission on the board may vary due to different hardware
layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
occasion between the rising edge and falling edge of the clock to meet the
sampling requirements. Consequently, the configuration of this bit in the
Ethernet MAC can vary between boards, even if they are of the same version.
It should be adjustable rather than simply determined by the version. For
example, the MAC version is less than 3, but it needs to enable this bit.
Therefore, this patch set introduces a new flag for each board to control
whether to open it.
The dependency patch set detailed below has introduced and enabled an
Ethernet node that supports 1G speed on qcs615. The current patch set now
allows tuning of the MAC's RX swap, thereby supporting 10M and 100M speeds.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com/

---
Yijie Yang (3):
      dt-bindings: net: stmmac: Tune rx sampling occasion
      net: stmmac: qcom-ethqos: Enable RX programmable swap on qcs615
      arm64: dts: qcom: qcs615-ride: Enable RX programmable swap on qcs615-ride

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  6 ++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 36 ++++++++++++----------
 3 files changed, 27 insertions(+), 16 deletions(-)
---
base-commit: 532900dbb7c1be5c9e6aab322d9af3a583888f25
change-id: 20241217-support_10m100m-16239916fa12
prerequisite-message-id: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
prerequisite-patch-id: ab55582f3bfce00f051fddd75bb66b2ef5e0677d
prerequisite-patch-id: 514acd303f0ef816ff6e61e59ecbaaff7f1b06ec

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


