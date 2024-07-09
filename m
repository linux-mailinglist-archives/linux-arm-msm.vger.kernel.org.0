Return-Path: <linux-arm-msm+bounces-25553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D0C92B088
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 08:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D763DB208B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 06:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F6213C802;
	Tue,  9 Jul 2024 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YsqmCYI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CCE139CEF;
	Tue,  9 Jul 2024 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507793; cv=none; b=GgKfXtd0yOwPaEGOS4wlQIchl9Gku35sKqoo8B67G53iUtk14JRqxGxRfIITT0LToCFy1VAcFc0zXYpCtWJgCdtN7YEarTGSUWshlfqKrah1p8bIJ8jSrDNtPLyR5bRnkIbWtH92PJXWdyYJ2xa+8rE/MAfui+Yr1U3I4cMb7Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507793; c=relaxed/simple;
	bh=eAJZO8VqIeM3ZCD26TNDGfhdnssipGbvH3HVWHeuYhM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OfER56DPTgSy3MV6TU4PYp0+kpFcJSW4cwE50qpGpO5EMVTo0KGly+FnbSPTgf1ADN6gR8THY0BCMfvw+LpaOcY/0SnFsLw0jyDhRCesQZ80qGGbo/tWr5jZOqgs/jxBiO0CihCkGYqqT/ucNgkUAZ+Uvi+oqVROL+N/JqamCek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YsqmCYI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4692h9H4021878;
	Tue, 9 Jul 2024 06:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MVJBzv8BrQY+trYbZfn1AF
	xfcozwDiGsLtFJrpRlxNg=; b=YsqmCYI/UMY2J9RO1a1qZSOGJZSf3Na4c1dszz
	KTEIPq6s3HrfsMdNotYxjPS+3ELu0j1BCoGGnnIL8CH0vlREcCiAqj7ro8LrmEfm
	oUCSU6kO1Z3wRuuV3+TpC6oz0756JJ/IyEBiSC92prUj56n7eHEqw7vw//R5gxXV
	x59Ux5guD36bWE36AI1rRNOAAapM2KKMMl2FEcTicovI9EVjq4/FDms/BpQR3XZo
	IgX6nllvxgSslZNuyZT/h3UcQ+oU6dhbljdpl7Yl2KNSV3CotDsOZNUwzNElN5BO
	6sw1MlY2LllMD7MwAgfp4kvR5W0/w6icNDJWcKxJppJ81W7A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t5rxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 06:49:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4696nlXS006003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 06:49:47 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 23:49:43 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v4 0/5] Add MPSS remoteproc support for SDX75
Date: Tue, 9 Jul 2024 12:19:19 +0530
Message-ID: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qptHEOUfivvD7_jSSOOAM9NLjcUHPP7D
X-Proofpoint-ORIG-GUID: qptHEOUfivvD7_jSSOOAM9NLjcUHPP7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=789 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090044

Add modem support to SDX75 using the PAS remoteproc driver.
Also, add qlink_logging memory region and split MPSS DSM
region into 2 separate regions.

These patches were co-authored by Rohit Agarwal while at
Qualcomm.

Changes in v4:
 - Updated commit message for reserved memory updation for mpss to add
   the motivation behind the change.
 - Link to v3: https://lore.kernel.org/all/20240618131342.103995-1-quic_nainmeht@quicinc.com/

Changes in v3:
 - Updated commit message for reserved memory updation for mpss.
 - Link to v2: https://lore.kernel.org/all/20240617093428.3616194-1-quic_nainmeht@quicinc.com/

Changes in v2:
 - Added missing binding for SDX75 to allOf constraints.
 - Updated reserved memory node names to remove underscores.
 - Link to v1: https://lore.kernel.org/all/20240606143858.4026-1-quic_nainmeht@quicinc.com/

Naina Mehta (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
  remoteproc: qcom: pas: Add SDX75 remoteproc support
  arm64: dts: qcom: sdx75: update reserved memory regions for mpss
  arm64: dts: qcom: sdx75: Add remoteproc node
  arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  3 +
 arch/arm64/boot/dts/qcom/sdx75-idp.dts        |  6 ++
 arch/arm64/boot/dts/qcom/sdx75.dtsi           | 65 +++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c            |  1 +
 4 files changed, 71 insertions(+), 4 deletions(-)

-- 
2.34.1


