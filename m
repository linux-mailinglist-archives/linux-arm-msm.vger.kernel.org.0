Return-Path: <linux-arm-msm+bounces-23310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF78090F93D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 00:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BEC01F22534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663BD15CD6B;
	Wed, 19 Jun 2024 22:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dP53bnEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20E15B120;
	Wed, 19 Jun 2024 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718836930; cv=none; b=UtWcDXji60s9YYaGnc0g+tfmVrtqrwzkRd/+irGro+gnBVYxp5BIpu7z+0s5KMeXnlEr1gRNMhvBBsg8ckqgP66cHQ3UgYABkhVsOLU0HDb+SI08m3ik8cLNEa7vWDNXRuRoZZQ2IMpBeVnlOnh+IDT7O14Rq8qca82vuE3lV1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718836930; c=relaxed/simple;
	bh=YPzj8FNvn9PIkkLqsi7U0ixMRxCsXFpKp+uqe6sEN4Y=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=DRI7MlHDcEzmSJehM+alPfza/i9txA0ZovawEsMm6zIPuHGROklpNRpAWWiQPPI2684TAqrC/USUVaRsTnAR2ZME9fqT179KdpHDOydAPHezngMDC71iUFsPDWZ7r6LgYddKp9EytCJImXBe/lw7D47mFtgNT/JqnOEPMZyLnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dP53bnEC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JMSbqT000798;
	Wed, 19 Jun 2024 22:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q+DA7nGMbtR85qmRiSaDRV
	FmBpxccTmZEx4PUkZBQJU=; b=dP53bnECNuAvygQUTJa2WQggsjSxEY+c1eSQcn
	LPiDrxkVhv94ydFi+wcBkClcwRJzch0vShprU+CX28uy6M4HJhjuzS8pBdXWCFJW
	ln5/5TLtPQZgcKS6EayA403Bexqv2zdFcQ2F/ls0yDhmpo3muwL1Igka2nyW3prr
	0fpGEppMYltVEo/uz7U1RsKoUS+8Gyaxo/NJne0tz+vj2UG2b3ZbXhGYBY0qW7TE
	6g15dPjgsixQUAQezY/y7QcTVb3woJG9fIZ/oP1Y3MfVn/J4EDPomU2ZrSb+pnWD
	W89JxI0/8Cwj/9JhIAoFThorG6NpYX770yQOqQn3lUuECeVw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujag2uxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:41:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JMfejb016899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:41:40 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 15:41:37 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Subject: [PATCH 0/3] Add interconnect support for qcom_ethqos driver.
Date: Wed, 19 Jun 2024 15:41:28 -0700
Message-ID: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhec2YC/x3MQQqAIBBA0avErBNUykVXiZCaxppFWhoVSHdPW
 r7F/xkSRaYEXZUh0sWJgy9QdQW4jn4hwXMxaKkbaZQUjGin217hZL9YF8Nm6VyPkITSrkVDc2N
 QQ+n3SI6f/90P7/sBUNzuoGsAAAA=
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
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eTIDUZyjsesc0dkCo1tXursk5a8OPZvQ
X-Proofpoint-ORIG-GUID: eTIDUZyjsesc0dkCo1tXursk5a8OPZvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190171

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Sagar Cheluvegowda (3):
      net: stmmac: Add interconnect support in qcom-ethqos driver
      net: stmmac: Bring down the clocks to lower frequencies when mac link goes down
      dt-bindings: net: qcom: ethernet: Add interconnect properties

 .../devicetree/bindings/net/qcom,ethqos.yaml          |  8 ++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  3 +++
 3 files changed, 30 insertions(+)
---
base-commit: 8a92980606e3585d72d510a03b59906e96755b8a
change-id: 20240610-icc_bw_voting_from_ethqos-12f5c6ed46c2

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


