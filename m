Return-Path: <linux-arm-msm+bounces-28455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A40951583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 09:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB1D28A1F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 07:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DB013BC0C;
	Wed, 14 Aug 2024 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="etfzT6gL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707E613AA27;
	Wed, 14 Aug 2024 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723620517; cv=none; b=Fsqg2vztqIoj44ATpAt05dyHcE9t6ggOUAkMrSal/9BZg5CjRr0Yw+zsosH+ZAz7W4wP0Od+CqvRksOC6tP6swOSSs3yffnAIHTuOQ2nDjTDcY74ibAL79VLTybQ8rFi5jCE/SYYjySrC9utAkdveSM3Q81a7HZ1PrJqW9tQNBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723620517; c=relaxed/simple;
	bh=xypQVDQnu8LFNed9fT7ASMCIdcgOxKSt6yGlspSMaq4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j4RdlvDUrhTH/w84sGAVUcbJkaUS2kg5dCVT6hnWNwstjd2/kyFyUehOMygXgH9rtAivlRXigyjaJTQUWwbAooNhNLBZqFqKIH4ERS44qFKJEMdiGDEMimPvkgR12sCG1OR3RKz9ZES5bilusEAphlvyxxuYF3eGP36cFkrPmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=etfzT6gL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNGPY0001557;
	Wed, 14 Aug 2024 07:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xhfPutqjdHvVO0RTAnZHQ6
	KJttjnCbMtr1zURQtK7OY=; b=etfzT6gLkDMxzBlOOYKcmSVlfm+ZH74CgqJh+B
	Bcg1IENS/rkOJULNvltUeH7HN1MUZJ8Lxrc+ZkwQ6/WiEoAXoWIjPafCniWgxvIy
	T46HtJp6o7Gnaera+P6f+ws8ScPW6wAc18dvnjmHdWPV2oICOMPzfw3NkEUHkWex
	/Llfx3QnCMJVVoQeBk9EcJAnbE6LB43iR2V2dZq1Os4wUfxCLMwpgH1JsNW+kyHp
	c8O2aDZRal1XvJJgW4UaNImkblBBsf6wrc+CMwo1nF3UkElF8k7CYipWZy4PgUDh
	dOjhAu8TBC7q03mCYxdKlMwyPcv+VltlA3ACAe9xe+cwo67w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410437ugnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E7SU0I012879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:28:30 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 00:28:27 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>
Subject: [PATCH 0/3] soc: qcom: socinfo: Add QCS8275/QCS8300 SoC ID
Date: Wed, 14 Aug 2024 15:28:03 +0800
Message-ID: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eZEE5nlZV0efuzZnBt9ox19HectoIhgr
X-Proofpoint-GUID: eZEE5nlZV0efuzZnBt9ox19HectoIhgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 mlxlogscore=556 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140051

Add support for socinfo for qualcomm QCS8275/QCS8300 SoC. QCS8300
is an Industrial Safe version SoC while QCS8275 is an Industrial
Non-Safe version.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Jingyi Wang (3):
  dt-bindings: arm: qcom: document QCS8275/QCS8300 SoC and reference
    board
  dt-bindings: arm: qcom,ids: add SoC ID for QCS8275/QCS8300
  soc: qcom: socinfo: add QCS8275/QCS8300 SoC ID

 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 drivers/soc/qcom/socinfo.c                      | 2 ++
 include/dt-bindings/arm/qcom,ids.h              | 2 ++
 3 files changed, 12 insertions(+)

-- 
base-commit: 320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
2.25.1


