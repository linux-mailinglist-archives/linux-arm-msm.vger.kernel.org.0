Return-Path: <linux-arm-msm+bounces-21955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C498FF022
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEF0BB2AAD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21DF1990AD;
	Thu,  6 Jun 2024 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AG1g5oic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5031974FE;
	Thu,  6 Jun 2024 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684817; cv=none; b=U6IpN8PNJkb9/LxnzfwtU68ZXGCuYDzJd21g3N9wDwzq7sPEvEweJumY1fN6CZkNPH/iXqqqxzL73rc0SRlYvZ49VDnBjv8tw6J+PpGNCjv5NRUSnBXaVGt+163Qxcrmi1N5Fj678U0WwSzC8gVzDJ/nLVRHmQFuEl41eKiYWyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684817; c=relaxed/simple;
	bh=ZGB3juOxwVTV9EOeSwh34a8EfYqp00QVXUiUxC+Ea5I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nuBVIeoNEDaTUA/chx4ECJs+Bk/x9BTK/S+X3KDDwpxJM1Lhx7mdvwJufsO0bfl2l3zqwEnZagIdq1dwoFbB2NXO+tlK+0PxxNLVCAI7pii80zxOTAWh/vcn9i9S7thjSTAKKDH7vOFcn9gKnHcN98z7s6ZsLZGfbQ5HR4dYowI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AG1g5oic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45699e8M016166;
	Thu, 6 Jun 2024 14:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=VCPJV/VzG/M+IhNnUHL+ziLX+EjaBPDAUVTfhaUS/lA=; b=AG
	1g5oicFc4NZ6QEWNF6Xl2Nf0HGSU3em582cnahrOLMnHwu4LZqqVNcmx23UnngYX
	KGi568hk/+HzkZ1CuqRFYOGKGGy3AbNeUJTgnc0GrJafVBUgOf64LOjTc1GCwSkd
	5lvtnADKP10LgH3JXs4NRKUx1pgE1wBGbJEgpkyhXvAiItiP4keHQNP9gOFHvkuD
	hQhsmMB3EsKG+2l3yqwy94BHT+J2oTuAKMcofBu6U7VWvEhHAaIAhQTnE3F0Y8rT
	UAFh1FEPQ8retAnv8tZYjp1Nx0eByLlGneYw4k7TP6TqygHw3PZUY8oV7Ndmc8C6
	PP5+whaamTQ1C+ko44cA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yka7p8rjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 14:40:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456EeACl009445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 14:40:10 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 07:40:06 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH 0/5] Add MPSS remoteproc support for SDX75
Date: Thu, 6 Jun 2024 20:08:53 +0530
Message-ID: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9PpGwCdiY-hS7m9_aHwm7xl7e4sVnC4q
X-Proofpoint-ORIG-GUID: 9PpGwCdiY-hS7m9_aHwm7xl7e4sVnC4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 mlxlogscore=766 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060106

Add modem support to SDX75 using the PAS remoteproc driver.
Also, add qlink_logging memory region and split MPSS DSM
region into 2 separate regions.

These patches were co-authored by Rohit Agarwal while at
Qualcomm.

Naina Mehta (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
  remoteproc: qcom: pas: Add SDX75 remoteproc support
  arm64: dts: qcom: sdx75: add missing qlink_logging reserved memory for
    mpss
  arm64: dts: qcom: sdx75: Add remoteproc node
  arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  1 +
 arch/arm64/boot/dts/qcom/sdx75-idp.dts        |  6 ++
 arch/arm64/boot/dts/qcom/sdx75.dtsi           | 64 +++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c            |  1 +
 4 files changed, 68 insertions(+), 4 deletions(-)

-- 
2.17.1


