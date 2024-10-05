Return-Path: <linux-arm-msm+bounces-33172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D969914ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 08:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BADF428400D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 06:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199D785947;
	Sat,  5 Oct 2024 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FePy3OCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E00560DCF;
	Sat,  5 Oct 2024 06:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110645; cv=none; b=CwTwA0w8ZxASs++U88xNztizY/yJIjMnIayjZkzNgXsXqEn7I0uM+7fdsb75IbBlX/d68xwvU2o+nXUe5/BP5WfmBD2sXNzoOMoy5nzob2nx4RWuR0fzTPgB9gKvrQcPyU5H3ePvqAurV6ZQnPQHTGayLxE1+t0N/gwqv01F+bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110645; c=relaxed/simple;
	bh=J2+Tm5bVxB08Iu9FWgYSku7VUYMapKi+gu8t+OX1KMc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mExDkAizPxNBhV/aqLBdYvGetmOT8Hwyopl3cvYFPSYQFJ2Nlex2/40TIc1CYt0V0n4xVydSS1BNC2wFJBZ113+LYjUs5FfiHDFqFnNkuMVP9Pkcr9hTwb6ewi1OvQ80tU9qEJhBbicIPMeYMJE9WkzHpWrb5gYnyYSdY4iXrbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FePy3OCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4955tR4I018621;
	Sat, 5 Oct 2024 06:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NIpqyTOKFWauQpK8u0q21D
	LUH04Agr1/9L3AzYagR8M=; b=FePy3OCA38tk/+kqAVBtxkz81Gk92KqJq2RrhD
	rqru5UUAZg3NOhcOkG06Ar3t+QcaVReOHujSAnc7hRRq58Uev5Mw7qs38IfYVslK
	xpwLmNiXmpxLvrpvtv0oc7hN6UHXo+nHOobMBTrjdWJfkfazPZfyGocSTh0vhcdj
	TM8Bdo/Am9m1JKl1lY3LZ2qeOPtJlXmZJyeFjVlkxWwag8ispnnKo/gMdfUcjvXN
	duh+EXc/Hi1XDd8iAG/vFst0+3zg1AA/Ud6gnBAI6ML/x3rFzzUhjKtgRqI7ruep
	eaiG9PskivaGiPgDNb7Wd/2D1/ZfEGWKUEPsus/M+UURQD6A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xu683ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 06:43:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4956hbXm009868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 06:43:37 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 23:43:32 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rdwivedi@quicinc.com>
Subject: [PATCH V1 0/3] Add support for multiple ICE algorithms
Date: Sat, 5 Oct 2024 12:13:04 +0530
Message-ID: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zPAZxZ5DC8pBMYJwUR2JR9uyELrNSvyq
X-Proofpoint-ORIG-GUID: zPAZxZ5DC8pBMYJwUR2JR9uyELrNSvyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050045

Add support for ICE algorithms for Qualcomm UFS V5.0 and above,
which uses a pool of crypto cores for TX stream (UFS Write – 
Encryption) and RX stream (UFS Read – Decryption).

Using these algorithms, crypto cores can be dynamically allocated
to either RX stream or TX stream based on algorithm selected.
Qualcomm UFS controller supports three ICE algorithms:
Floor based algorithm, Static Algorithm and Instantaneous algorithm
to share crypto cores between TX and RX stream.

Floor Based allocation is selected by default after power On or Reset.

Ram Kumar Dwivedi (3):
  dt-bindings: ufs: qcom: Document ice configuration table
  arm64: dts: qcom: sm8650: Add ICE algorithm entries
  scsi: ufs: qcom: Add support for multiple ICE algorithms

 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  24 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  19 ++
 drivers/ufs/host/ufs-qcom.c                   | 232 ++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h                   |  38 ++-
 4 files changed, 312 insertions(+), 1 deletion(-)

-- 
2.46.0


