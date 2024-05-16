Return-Path: <linux-arm-msm+bounces-19912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4058C70A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 05:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B83EA1F22802
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 03:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873AA4411;
	Thu, 16 May 2024 03:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NF3LrcYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C142047;
	Thu, 16 May 2024 03:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715829905; cv=none; b=sWf8IoPmuVoRFeJ0p7qmNsYmEwEamObJT/1IWF38T1dJ6LeGII7cfRu257gJle6vjOmQq49ke/MsvyabZsqVlR7Ot5rEGPyscSykVNDiajwSBW6vEYWYLdt4/usjN4v5L7SGrv4N1mqI/1SSPFZKo/33b1m7MoWFrgX94IJRn60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715829905; c=relaxed/simple;
	bh=0hIBTZRSWGbcD73pLCjtPVfTIDmU4v1U0Xhk66eRnYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FxFZUh0pt3pG2MmDnKYE06o3Udc6YNM3pTtGtuD+SxqCzVYosMns1+lTZXxCHtmY5G/HgmGYeNovKFblQ68+1IiAhGR2JZdN7cpS2diCChXjaoFLRGv1DIsWaXra0Sa6L+i4OSai7MVBISjebNH5uemg7J+9Y0TzPA5OeU0p16k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NF3LrcYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FJY8uS027363;
	Thu, 16 May 2024 03:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=KmE3rY5yTnisogsKxYAM
	e9RKaqQslW34BXya38pYWu8=; b=NF3LrcYbyCmlKnIMzaIVpngUHgyj45QTGBya
	jh/qGsKTlwBw6CF+Zx25LB2/1kRg3g0UmPsY6NoKS3kPaSVV9v7X5DFIXWdTR9VQ
	5zc66J9jivRjFgGNVd1B5l+EtN3P/6TyE7dLTsTPjviH7k81syeHCQ9/WfeNaj1H
	baMJDGCrqYZyFR3yMStnsXGN2v+j3A6uFroZZgkLkwgWIIGELESC2bTrBXfh+1Y3
	gGIQu7gYEPdtDG5fjaF9nlD6VByt0idJTo90SqYXvW6LiDeYqVKfOXcRuSMWiPWV
	qmGjPIbs2XUH/AoNu4IspS5C1+BgJpHwLmUxeXaOZHM/84G25g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvw52p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44G3ObG6032168;
	Thu, 16 May 2024 03:24:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3y4quybhjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:37 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44G3ObFV032144;
	Thu, 16 May 2024 03:24:37 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44G3Ob2Z032139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:37 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id 5F37440FFA; Thu, 16 May 2024 08:54:36 +0530 (+0530)
From: devi priya <quic_devipriy@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, quic_msarkar@quicinc.com,
        quic_qianyu@quicinc.com, abel.vesa@linaro.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V4 0/4] Add support for PCIe PHY in IPQ9574
Date: Thu, 16 May 2024 08:54:32 +0530
Message-Id: <20240516032436.2681828-1-quic_devipriy@quicinc.com>
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
X-Proofpoint-GUID: 0Zj5QkA27A3XAlUHNdfbmkKgo5QvYtHq
X-Proofpoint-ORIG-GUID: 0Zj5QkA27A3XAlUHNdfbmkKgo5QvYtHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=868 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160022

This series adds support for a single-lane and two-lane PCIe PHYs
found on Qualcomm IPQ9574 platform.

[V4]
	Picked up the R-b/A-b tags.
	Split the phy driver and headers to individual patches.
[V3]
	https://lore.kernel.org/linux-arm-msm/20240512082541.1805335-1-quic_devipriy@quicinc.com/
[V2]
	https://lore.kernel.org/linux-arm-msm/20230519085723.15601-1-quic_devipriy@quicinc.com/
[V1]
	https://lore.kernel.org/linux-arm-msm/20230421124150.21190-1-quic_devipriy@quicinc.com/

devi priya (4):
  dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the IPQ9574 QMP PCIe
    PHYs
  phy: qcom-qmp: Add missing offsets for Qserdes PLL registers.
  phy: qcom-qmp: Add missing register definitions for PCS V5
  phy: qcom-qmp-pcie: Add support for IPQ9574 g3x1 and g3x2 PCIEs

 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 309 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |  14 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-pll.h   |   3 +
 4 files changed, 328 insertions(+)

-- 
2.34.1


