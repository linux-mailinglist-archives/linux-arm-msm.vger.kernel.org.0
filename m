Return-Path: <linux-arm-msm+bounces-23030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5090D1D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C5C1F27BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1839E1A3BAF;
	Tue, 18 Jun 2024 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XnV/6Ehi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878EE158DC4;
	Tue, 18 Jun 2024 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716455; cv=none; b=Z8Jd+EpZinFjmYAmRJbm02yZ1nQArZruyisPpF/B/hmigQdkCeQbNynuhQkPNJd0iZ4IedwhZJTgsDig6FNrSH26rdwU47Ud+aZlepYMda8K4G3O+1BARyhbNEgm54wmC4U4VLqxfl6SeXYbO2TAcyL3ANFKRj0GbIoH80pkyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716455; c=relaxed/simple;
	bh=3mN8N5xh5Vjx1IqngSkLqMOE5Qz94/m6jZ/R5El4ezM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fKyAmS2ZYwBv+Ue4+LT6onFsPshpt5m3w0tBqhPA4EMqdZPhvnVAEWJdA4QXlprgKah9aSoGyEPdC6wECeokOV2SXyL1wmLRFVxREOHz207oiuwgkCZjFQZ0E3FZIwsA8zh9FfHoA41UYxH1c7YgRRTf/eLSe3tiPlYTTtRnGhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XnV/6Ehi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I7TAEr009655;
	Tue, 18 Jun 2024 13:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GSAf21n65G/pRKdKZTgbj5
	O4mJ2LCEhTn1AIHS6dnf0=; b=XnV/6Ehiexh2rmU5t675L/wkGaWtv7WSkxy7ax
	CmO/a0T8bLftNDbJ/Shr7OTz11t1UUHh/2Jo65V4ztZPrwS0VBIKBg8/EOq4fr7G
	Rr45Qpf+TgSCCx87yfRtO5iyqeRehcqqSYXUYWFYWg2SY+9RcJ7ypXQJnKgUm+eQ
	UWyV3jhih63JK1ytRrWrjB+he1aSIiluGRk9NF+MztQTWXXWSiNgKf3q+q9om4zF
	2aLAN9fKKXpaFbdtzfGWyRHObdmCdTnE/vivTu1OcVF+/YmC9niwlDS6ox0JouZi
	81nNESg5EOdBRtVOgYmB4x0+t3S7vhl7HVYHZg/1Tg4sXADQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytuava50w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 13:14:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IDE9K9028044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 13:14:09 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 06:14:05 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v3 0/5] Add MPSS remoteproc support for SDX75
Date: Tue, 18 Jun 2024 18:43:37 +0530
Message-ID: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: beqtFpalBHaK1Rx805q8quNyIIvTIh9N
X-Proofpoint-ORIG-GUID: beqtFpalBHaK1Rx805q8quNyIIvTIh9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=777
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180098

Add modem support to SDX75 using the PAS remoteproc driver.
Also, add qlink_logging memory region and split MPSS DSM
region into 2 separate regions.

These patches were co-authored by Rohit Agarwal while at
Qualcomm.

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


