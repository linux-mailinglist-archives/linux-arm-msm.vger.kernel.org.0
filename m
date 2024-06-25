Return-Path: <linux-arm-msm+bounces-24183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF89174F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 01:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 689651F222BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33791180A70;
	Tue, 25 Jun 2024 23:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QrOzCNjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF5143C6A;
	Tue, 25 Jun 2024 23:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719359419; cv=none; b=Ot/RR/CYKdmIb4qxex7QTnmWq/iVC0seUgVb8ho6aEuzPpPBDL8gwc0heGjmkVOCJeDq+7vSgWijzvwk1qqXtu45vRvJC3vI+gQpZM4womDlLZ9UbcepAQ59VhWGAMj/hRsmKOux193IeSCd+E9YSGF9Q5VhL/drf3OvazPOlUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719359419; c=relaxed/simple;
	bh=yES+VPAH82IUwHmv3gf1EViSEQ496g2PQRhK5X1i8cg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=RNVpErze0w8NYCmyfO2zJuW1owdkIJb2Dyd/qU89zhuFXNUGaZjSK0awfOIKAoazMUNXS+RyykmHLu9DhfgFpXkNA3X9NdnJD3UEU7xC0tdoQZvDo+9pSVrZt1aQbejY5ntfsX0dxh1luk77gMnlC6n40xRLORU4GsGCEC/YKso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QrOzCNjv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHGKC2031378;
	Tue, 25 Jun 2024 23:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZReGCd3q1cbsvv2+fAwVSA
	Pbb85R6I8ay6duJwilStk=; b=QrOzCNjvO9qlLb4xdoIHEy8DYZeHjOkrQ/TsZx
	vo1gpJddpeLuILP2niql3EImThmtsxTUqkkGuTNTvIIWyB7Xmqaca7s1sV28VVuf
	IeGTgmwFtDxGKkkMr3NMPwkdR7n37KhP4kmAT6qZpZ0Rpw32snb4bi3/yArPnlym
	ql9uHoAkIzi/nCvGCbuW+c5v3LpTnccKSdahlIt5z89SW3LA5bq6IQxuDwyP2P4f
	4c6mYIEqVX2imPVBkkGByhDbroxEtR0pDeNpRv5972GWcArNefXiQ73Go9nQTVtj
	z2akMArl0Yk/rYAuOl6vem6yynjsk+akC913uCn8jdSmiSdg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv7sp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 23:49:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PNngfL002707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 23:49:42 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 16:49:39 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Subject: [PATCH v2 0/3] Add interconnect support for stmmac driver.
Date: Tue, 25 Jun 2024 16:49:27 -0700
Message-ID: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdXe2YC/32NQQ6CMBBFr2JmbU3bQAOuvIchjQwDzIJWWqwaw
 t2tJG5dvpf891eIFJginA8rBEoc2bsM+ngAHG9uIMFdZtBSF9IoKRjRtk+b/MJusH3wk6VlnH0
 USvclGuoKgxry/h6o59fevjaZR46LD+/9Kqmv/VXrP9WkhBRGKV0XVVvpki7zg5EdntBP0Gzb9
 gH7S7c4xAAAAA==
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
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zBdbnyQ8Y_AdX6CP8hDT6cRBc0lB7ykA
X-Proofpoint-ORIG-GUID: zBdbnyQ8Y_AdX6CP8hDT6cRBc0lB7ykA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_18,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250177

Interconnect is a software framework to access NOC bus topology
of the system, this framework is designed to provide a standard
kernel interface to control the settings of the interconnects on
an SoC.
The interconnect support is now being added to the stmmac driver
so that any vendors who wants to use this feature can just
define corresponging dtsi properties according to their
NOC bus topologies. 

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Changes in v2:
- Edit the cover letter to give a big picture of this change.
- Move the interconnect changes from ethqos driver to stmmac driver.
- Reorder the the patches to place bindings patch on the top.
- Remove "_icc_path" redundant string from the "interconnect-names" property.
- Link to v1: https://lore.kernel.org/r/20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com

---
Sagar Cheluvegowda (3):
      dt-bindings: net: qcom: ethernet: Add interconnect properties
      net: stmmac: Add interconnect support
      net: stmmac: Bring down the clocks to lower frequencies when mac link goes down

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h           |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      | 16 ++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c  | 12 ++++++++++++
 include/linux/stmmac.h                                 |  2 ++
 5 files changed, 39 insertions(+)
---
base-commit: 8a92980606e3585d72d510a03b59906e96755b8a
change-id: 20240610-icc_bw_voting_from_ethqos-12f5c6ed46c2

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


