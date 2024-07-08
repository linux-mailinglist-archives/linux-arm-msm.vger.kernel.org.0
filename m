Return-Path: <linux-arm-msm+bounces-25528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE45592AB3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 23:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB9141C219B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 21:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E5B6F2E0;
	Mon,  8 Jul 2024 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ydg49n5i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F192746D;
	Mon,  8 Jul 2024 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720474245; cv=none; b=BdOhHCV/nV/H+sFxTSursXLQje65StSq4D7H0F2dFNrD7615uHeSc1x8hDEF0Aic3OrOFc+/vIieBTHiOfR+6wnDQmTUIFMJnsBeyA45QumpxfYq9TzXFZJTcoBfYbFgVITXbBV4ck2WXHxpxAkCImzPGtY9R/rfygifMXptBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720474245; c=relaxed/simple;
	bh=duozjZXMWWvq5tYkbpTynS/FuQA3cC8dbUZBNsR0puk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pZAS/Ywh98d8Bat4IYCB3gDjMYDRlwsfibIFyjz+6r9cA3bbJVwcISj6wfzEaXEgMeKssmB09e0wgWgpSe3Mb9RRIPzgqtHE6uHkuQiHPAS89SO8qxSOw9DVBegiEih1BFGfitUa1WYybc2p+s7dEty537jrZ/u543guLDthqEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ydg49n5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468B1fTC007224;
	Mon, 8 Jul 2024 21:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L6cEO64TKdDlNc083+GDhR
	JFbcXjfXusz+trKqJlFRU=; b=Ydg49n5iAkp7OW3/p0HYQCp60GHSewIXYZxwHc
	Y4Pbpo7LfNzrkXecSa03h3fO/CRpOWw+DG9PLbeZahJ+471MHqee2PyYUw1Z5hJG
	+phc3EnYQ1drvCzdR0ARH3/0fQwJwlSr5+zqAJSCqItJ5RbN0KzHN+RSdNpPl1jw
	OZN2GWL985YM+Q2ZIYlskyqj1cnbc2cl6AwOBO1GGHGuzEUPX7kfy3K0aVQRHnXY
	btI6yY9V1Opt+HuJ1ZwCd5o0egz2vQ7audjHC/yMEs0tZObTkeA7g6aCMIvdlh6/
	fW07HG6+kzz7S1hz5a3BTbdOdMv3u6SsavCeorngS5JL73Eg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmms8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 21:30:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468LUI0u017962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 21:30:18 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 14:30:14 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Subject: [PATCH v4 0/2] Add interconnect support for stmmac driver.
Date: Mon, 8 Jul 2024 14:29:59 -0700
Message-ID: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdajGYC/33NwWrDMAzG8VcpPs9DVhw32WnvMUpwVbnRoXFrZ
 +5GybvPLYxtDHL8f6CfbipzEs7qZXNTiYtkiVMN+7RRNPrpyFoOtRUCWnAGtBAN++tQ4izTcQg
 pngaex0vM2mBoyfHBOkJV78+Jg3w87Ldd7VHyHNPn41Ux9/Vb7VfUYjRoZwz2ttt32PLr5V1IJ
 nqmeFJ3t+AvC9s1C6vF3m8p9OAgwH+r+bG20KxZTbW60BvbeXLgm7/WsixfpyKkVFwBAAA=
To: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Russell King <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <kernel@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
        Andrew Lunn
	<andrew@lunn.ch>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p_fTsgHqrwjyrVdqsaQvV_rEG8Z20c_C
X-Proofpoint-ORIG-GUID: p_fTsgHqrwjyrVdqsaQvV_rEG8Z20c_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080159

Interconnect is a software framework to access NOC bus topology
of the system, this framework is designed to provide a standard
kernel interface to control the settings of the interconnects on
an SoC.
The interconnect support is now being added to the stmmac driver
so that any vendors who wants to use this feature can just
define corresponging dtsi properties according to their
NOC bus topologies.

here is a patch series which is enabling interconnect support
for ethernet node of SA8775P
https://lore.kernel.org/all/20240708-icc_bw_voting_emac_dtsi-v1-1-4b091b3150c0@quicinc.com/ 

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Changes in v4:
- Add reference to the series which is enabling interconnect-properties defined in this series
- Link to v3: https://lore.kernel.org/r/20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com

Changes in v3:
- Drop the patch:
	[PATCH v2 3/3] net: stmmac: Bring down the clocks to lower frequencies when mac link goes down.
- Modify the dt-bindings property names from "axi" and "ahb" to "mac-mem" and
  "cpu-mac" respectively.
- Link to v2: https://lore.kernel.org/r/20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com

Changes in v2:
- Edit the cover letter to give a big picture of this change.
- Move the interconnect changes from ethqos driver to stmmac driver.
- Reorder the the patches to place bindings patch on the top.
- Remove "_icc_path" redundant string from the "interconnect-names" property.
- Link to v1: https://lore.kernel.org/r/20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com

---
Sagar Cheluvegowda (2):
      dt-bindings: net: qcom: ethernet: Add interconnect properties
      net: stmmac: Add interconnect support

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h           |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c  | 12 ++++++++++++
 include/linux/stmmac.h                                 |  2 ++
 5 files changed, 31 insertions(+)
---
base-commit: 8a92980606e3585d72d510a03b59906e96755b8a
change-id: 20240610-icc_bw_voting_from_ethqos-12f5c6ed46c2

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


