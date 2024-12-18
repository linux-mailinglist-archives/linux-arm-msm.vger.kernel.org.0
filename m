Return-Path: <linux-arm-msm+bounces-42615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C339F6113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BE8F165970
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 09:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993AE195FEC;
	Wed, 18 Dec 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ekzvcYwH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF73198832;
	Wed, 18 Dec 2024 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513082; cv=none; b=P2l+YplRys36N4ecgvwmzBhxFG+I9dYvwV6eVVzcROwI/jPdYmaXEKLyzAc5nDEhXWHXKZ8fh/pa7LX/FRP7Soj8LWM0edTU5Ot4PO4fI/kvQtJiyxshayHB55cY7TQyH2aEPPMbm5FbukW/yd/IkJcM5u1quDfxyMlakwRR/a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513082; c=relaxed/simple;
	bh=dC3ub2sUHceN2E9h1DkVWy+0DwASS6QIr3DBYCzH97c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T+rKCCC6i8q/uTfD/IuNukZUOsEymFegTEeZql3ikVBTlRQbxaeeaS/O/6De6FkDiYbd7GDgOh0qdsHzCEM7irOkn6FoqhSs1P13AiJVeRR/CngUB56YprdvGOUQdl8BLUU06ZRkg7YBsdNwF3sID9sA3a5gn9bZWO2UPQCJPsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ekzvcYwH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI8YYJl012781;
	Wed, 18 Dec 2024 09:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=QoagERjlRhccKVqcsFtZ3/CeipkX1PtZO1lYtCPZgJw=; b=ek
	zvcYwH/koKja7RzZyAUf5F712bJsyq7BMbqELUkuAyZaAuzMUDcbs99vuAwoaV7j
	MTw724/eBL+TLGdQsSEjjSoXXLn4WZ+zCRbBNcuBmIDMkY6QgmaDLpyAg9QhRovN
	sXRYycm1VLkVMEVTvh7J3wVhV3oHv88pUHblzuBon23ON2hXaT69876EEnADLaIB
	BNtGm+k0ijZEJwUWv9xDNUp8FiqK3HizfmAzDVbWqQZetDNzHpWRIFDN+3m4Oc1K
	KAxcZJVp+QzuNDUQLyZvwpnYU4v72Sum5WpcUpfEJcG0pMC5kCuUgHPOr0OZQNFY
	26WAY20QcxrR61o843yw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ku0p02ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:11:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI9BHiF018410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:11:17 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 01:11:12 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH V2 0/2] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Wed, 18 Dec 2024 14:40:55 +0530
Message-ID: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rc7QOulaSJwtkUbn-5zqNCW6kAClUFWP
X-Proofpoint-GUID: Rc7QOulaSJwtkUbn-5zqNCW6kAClUFWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=845 spamscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180073

With the current DLL sequence stability issues are seen in
HS400 and HS200 mode for data transfers.

Rectify the DLL programming sequence as per latest hardware
programming guide and also incorporate support for HS200 and
HS400 DLL settings using the device tree.

Changes from v1:
1. Addressed Tengfei Fan comment, added missing semicolocon
 in sdhci_msm_host structure.

Sachin Gupta (2):
  mmc: sdhci-msm: Add core_major, minor to msm_host structure
  mmc: sdhci-msm: Rectify DLL programming sequence for SDCC

 drivers/mmc/host/sdhci-msm.c | 378 +++++++++++++++++++++++++++++++++--
 1 file changed, 359 insertions(+), 19 deletions(-)

-- 
2.17.1


