Return-Path: <linux-arm-msm+bounces-42607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21D9F5E76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 07:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C5F016B881
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 06:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601E115539A;
	Wed, 18 Dec 2024 06:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gZf+BsCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3C1531E2;
	Wed, 18 Dec 2024 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502344; cv=none; b=e+Z4DFTUHTN5XVFML9yJZpnWPDrWnMOl189mn29DwJoDiWdl9SYoevf51eAP8q9c2YOrBTXd2fFqzzDurJvFFGwqPf/XJzKyKqgmlHhZQlq+PoUVB7Zh5YKWegk0NUPL3xLD+ofB+vs1Y5JhRW+xu+kb+TuXDNNNVT43qBWsEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502344; c=relaxed/simple;
	bh=RgAYK47uqxTVpW1woiu3TRxS30EKFiMnkAbdmC5cttU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A7NW6DZjNEXEn2r0WP4ZUUBbaQ5Sezz8xYlp2tbOLrtP+HmAStrORTsT+MMG56fMDX4n4dYcOCLAxhT9lFLT6RqoySvQTjdzMdukHQvoGnWHfPUsQ+INwy5WQqWcLZx+WKlDCsnaClEA8NVljqrK1h8qTrFa5xc6xLGBUejMWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gZf+BsCE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHKrXZD013626;
	Wed, 18 Dec 2024 06:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=gFihPdfA1m0jqpMuemrCpyZt8YsBJ4lR/8NI2zC6vts=; b=gZ
	f+BsCEHShdm6FD8i/iNoAGd8/1f0zU/2002+474p81Goe1NaCaZRMeDltcLjqGdH
	tdN2c07MPNkUG1CXZsmtxBN7rMSWwAWNP8ne3f/PmnTNUBsjyLnMM38pMqAzLmgt
	sWOHFDnLIhm8YkOuB3HJyj+TPZLB5Qraxh4rTuu14xjfjIb3mckuuOZsZa/Z9SQW
	HpSYFVZOgmkaLs/nXTL2ko/JnK2mBvf7KoL8By8MIpHHygNaVnPyoLNVUbZZrdlW
	5La0YjxpxLtwCDJ+/OHhanIjB8mAYSJjRwqV/bgCsQmg5hwH3itdXP1txNP6xmSv
	CkmjA7zxQ/hzHEz2eBcg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kgr111sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:12:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI6CJT9011679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:12:19 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 22:12:15 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH 0/2] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Wed, 18 Dec 2024 11:41:58 +0530
Message-ID: <20241218061200.3362-1-quic_sachgupt@quicinc.com>
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
X-Proofpoint-GUID: e3QWlPSbZI07A1clAY0IKzV2fu3L8aQP
X-Proofpoint-ORIG-GUID: e3QWlPSbZI07A1clAY0IKzV2fu3L8aQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=834 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412180048

With the current DLL sequence stability issues are seen in
HS400 and HS200 mode for data transfers.

Rectify the DLL programming sequence as per latest hardware
programming guide and also incorporate support for HS200 and
HS400 DLL settings using the device tree.

Sachin Gupta (2):
  mmc: sdhci-msm: Move core_major and core_minor to msm_host structure
  mmc: sdhci-msm: Rectify DLL programming sequence for SDCC

 drivers/mmc/host/sdhci-msm.c | 378 +++++++++++++++++++++++++++++++++--
 1 file changed, 359 insertions(+), 19 deletions(-)

-- 
2.17.1


