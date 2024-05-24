Return-Path: <linux-arm-msm+bounces-20388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6C8CE5BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA3A1C218A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02E686651;
	Fri, 24 May 2024 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KZtz3wQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A8EC7;
	Fri, 24 May 2024 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556075; cv=none; b=Tp7kHzFSGzcd9GR2fb2eZAAYcOj0d8xtrM0yuTjppqZKsfLmYs9ak3rMyiTjmQUufHem2EVIgfXZSIDkrk1rb3VHXnQjmdo1+mWw1kzXJifIPgZbdWfDWCXY8aQcaOL3Ur6RvNGtOcyDbjpvOYqJi6xYoHFJ5dmCVZJNUGTI6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556075; c=relaxed/simple;
	bh=TScj16aYBU/dFZmtqlRlmPuiHXlARRs6kdsS8e3kWXo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=skM+xo5NK8DEZ6idVYee2wBaGBYszLAG+4dlu3rQnAVrZrhHUFd3Yak5abuiIJ8+ay5Tb1Dz6Dh4RycMe+dX2HSj99AhH2Qp55D+EM2qs3RQ7N+rZZ2XRYe7Xg7ljPoAOKCCKHkGTWpY82piESzrBh5iGinlEeNghkcZMZsqq94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KZtz3wQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9ujiA004129;
	Fri, 24 May 2024 13:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=1SjAWjxwhCpY
	IAunb2rlZu0shKtos6jUMCY+koqFFxM=; b=KZtz3wQNB6pRdqzXl8DfIj0xYnTY
	GJOk4ngnvRFY9oAPFrVq/gcseiUsH3v4Dod23V4exXiSe/atY+CwZdIxak2zwVNJ
	3U9nW5RVRyeSWLADCzRD0zG0bdLYIa9HkqGFsICGmL9zCrckqzlCQ/xR5g+DrjZH
	Ij/eJUoIYZtBd2r92ufQIB7VHt8vcnAYGI1NJEYl2GaYpxO8KVu3oOxif3LoC1cL
	ljp+2NiFxodZmego+zbYJSq4kvz5qxxvpDTb/Wg3392JntQA2lZC84+aY+KwBziX
	Chn4WR2Ie53gb70zLOwAA47pkKYCLxBHt7gzGyBEZo7eJ3TYz+pbXdUGoA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8j2gtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:07:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44OD779I013837;
	Fri, 24 May 2024 13:07:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3y9qgsns5p-1;
	Fri, 24 May 2024 13:07:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44OD77nC013832;
	Fri, 24 May 2024 13:07:07 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com [10.147.246.35])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 44OD77X5013831;
	Fri, 24 May 2024 13:07:07 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
	id 1D4595006A4; Fri, 24 May 2024 18:37:06 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com
Subject: [PATCH net-next 0/2] net: stmmac: Add 2500BASEX support for integrated PCS
Date: Fri, 24 May 2024 18:36:51 +0530
Message-Id: <20240524130653.30666-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NQZ76c2JKnYk2lTbokweHnzvtyTnhbRf
X-Proofpoint-ORIG-GUID: NQZ76c2JKnYk2lTbokweHnzvtyTnhbRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1011 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405240090
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Qcom mac supports both SGMII and 2500BASEX with integrated PCS.
Add changes to enable 2500BASEX along woth SGMII.

Sneh Shah (2):
  net: stmmac: Add support for multiple phy interface for integrated PCS
  net: stmmac: dwmac-qcom-ethqos: Enable support for 2500BASEX

 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  3 +++
 include/linux/stmmac.h                                |  1 +
 3 files changed, 15 insertions(+)

-- 
2.17.1


