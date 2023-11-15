Return-Path: <linux-arm-msm+bounces-656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 445777EBBB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 04:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8BDFB20ABA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 03:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B5A65A;
	Wed, 15 Nov 2023 03:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gs8BLC7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A75647;
	Wed, 15 Nov 2023 03:25:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE93D7;
	Tue, 14 Nov 2023 19:25:48 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF0uCEm031736;
	Wed, 15 Nov 2023 03:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=jiJeHE6vmSVdvNxPKAV5CLnIy4ElhFMjXwkrK4vFcsM=;
 b=Gs8BLC7s5EUQHtOTQS6bf/EzG/4iCAVooxhgWHUywR2lUfEs0KpkmnnA+IrOtkMtBaxB
 VCklYss6cd+tSqhgNFKJX9dALtYCATFm47LmLW3SW0P+8icEkDEwVRHdI0qXdnAjByYb
 f9FEJZcxiXx4DHV2Rb6IVmdpvRJblabkfNSg+obtiThQ2lnFwflu5GXmHRTqPyCkl192
 hFHITZYBmY9GFS2XvJBG9t9Txee0rbCw50rSeWFdgOPsm6Ev4z4rUtmKzw3UW/N/+vCJ
 ikA4wDQ5e1zyOumIP/SEO7Qwt/quyX+tKZYw4UBZPd8Eeo3bYpJVuUOdsBugnxdPrN9Q Xg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucg2u8sgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:25:31 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF3PV3Z028891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:25:31 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 14 Nov 2023 19:25:26 -0800
From: Luo Jie <quic_luoj@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH 0/9] add MDIO changes on ipq5332 platform
Date: Wed, 15 Nov 2023 11:25:06 +0800
Message-ID: <20231115032515.4249-1-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CZTZLJ7n4VJv1BY1SMPZeiVOnsJgiEUZ
X-Proofpoint-GUID: CZTZLJ7n4VJv1BY1SMPZeiVOnsJgiEUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_01,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311150027

For IPQ5332 platform, there are two MAC PCSs, and qca8084 is
connected with one of them, qca8084 supports to customize the
MDIO address by configuring security register, which also
includes GCC module configurable.

1. To provide the clock to the ethernet, the CMN clock needs to
be initialized for selecting reference clock and enable the
output clock.

2. GCC uniphy AHB/SYS clocks need to be configured and the 
ethernet LDO needs be enabled to make the GPIO reset of phy
taking effect.

3. The MDIO address of qca8084 PHY can be programed with any
customized value by configuring the security register which
is accessed by the special MDIO sequence.

4. Before the qca8084 PHY probeable by MDIO bus, the related
clocks and reset sequence should be completed.

5. Add the example MDIO device tree node for IPQ5018.

Luo Jie (9):
  net: mdio: ipq4019: increase eth_ldo_rdy for ipq5332 platform
  net: mdio: ipq4019: Enable the clocks for ipq5332 platform
  net: mdio: ipq4019: Enable GPIO reset for ipq5332 platform
  net: mdio: ipq4019: configure CMN PLL clock for ipq5332
  net: mdio: ipq4019: support MDIO clock frequency divider
  net: mdio: ipq4019: Support qca8084 switch register access
  net: mdio: ipq4019: program phy address when "fixup" defined
  net: mdio: ipq4019: add qca8084 configurations
  dt-bindings: net: ipq4019-mdio: Document ipq5332 platform

 .../bindings/net/qcom,ipq4019-mdio.yaml       | 138 ++++-
 drivers/net/mdio/mdio-ipq4019.c               | 557 +++++++++++++++++-
 2 files changed, 656 insertions(+), 39 deletions(-)


base-commit: bc962b35b139dd52319e6fc0f4bab00593bf38c9
-- 
2.42.0


