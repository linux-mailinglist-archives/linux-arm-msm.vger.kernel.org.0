Return-Path: <linux-arm-msm+bounces-28052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1CE949F35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 07:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF27288181
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 05:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756DD1922CD;
	Wed,  7 Aug 2024 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZxaMKZHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA747194AF3;
	Wed,  7 Aug 2024 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723008920; cv=none; b=ExObfoiCwEG/IzOsb251atMmeH4Hw9fIFGt0oW47K3ooQWwLLTfCL5T3Q3vGBXmqV1o2E0B7nw3F+1tcmLgAipgYOiPDIlwH8gN9XNcOW59epNCUWqEJg8tP9paCq9AzP0F4EnQHesRxDNJxKtw/ZClNwj6GuyiI7Xl5Q1L6rJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723008920; c=relaxed/simple;
	bh=XxaRfb147WUAGq/iTa0dnyUrGYwHVGmi7LHML9J7s4E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TdJYkgHKJdquPGyagT5SP2ECHFGaUQkUIhNG+gXsvO0nqoCbQxr7brrTOPgVcO3Nig5HZvhIz71qnLefH0QWBnFfHqiuXMOJLRHlUic0Aq+Q6youJbHSRfHBAsaay05LAWebIOOxF8z8lCqQ0gybYUCjJiliAj7B2xSJj2KYxXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZxaMKZHH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476H6RIu007179;
	Wed, 7 Aug 2024 05:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7dA2ZJrxDvaX9bd/oJzXFA
	1HGZ12rQ9T6TmKtmvIJX4=; b=ZxaMKZHHJUxGLTGvMQ2n4D89PhuTcTgNhZ/8bW
	Upod9eBm6IY0u0VKAXddcJWG/b+EILYK+CHCW+Ojcs0DY5/l0ER4LPllai4yBiGk
	TXxxLhOzdft1TpY0bflJ7ZYAJTnUwb4x8t1gWawTZZ7hmXdZzpPWntIyDfevdPaK
	C85KWON373tfXKBczaOdC1PUk5ALLaUiolZql/gSrDbXUseAFxMialYpyzOv9xbI
	5LGXPiXYiAtpgfDJFUmoFN4pU4tcwMn/vVvckzoTh3+y7kc+iv782/VsCRG1644S
	H8afJ7YOG5Lc7nA8tNXl3J/RF87hSiU7Zdue2F1Nn7sYFqJw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6sq5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 05:35:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4775Z5pE018281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 05:35:05 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 Aug 2024 22:35:00 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <quic_depengs@quicinc.com>, <inux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
Subject: [PATCH v1 0/2] Add sm8550 CAMSS core dtsi
Date: Wed, 7 Aug 2024 11:03:58 +0530
Message-ID: <20240807053400.1916581-1-quic_depengs@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HqPOOlSBp6CzIgoDV9JXJDW8k0NmFozS
X-Proofpoint-GUID: HqPOOlSBp6CzIgoDV9JXJDW8k0NmFozS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_02,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=626 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070035

The sm8550 provides Camera SubSystem hardware interface similar to
antecedent parts sdm845 and sm8250, but different interrupt lines,
clocks and other resources are declared.

This dtsi definition has been developed and validated on a AIM300 AIoT
board, the description for this board can be found from below link.
https://lore.kernel.org/lkml/20240618072202.2516025-1-quic_tengfan@quicinc.com/

The driver can be found from below link.
https://lore.kernel.org/all/20240709160656.31146-1-quic_depengs@quicinc.com/

Depeng Shao (2):
  dt-bindings: media: camss: Add qcom,sm8550-camss binding
  arm64: dts: qcom: sm8550: camss: Add CAMSS block definition

 .../bindings/media/qcom,sm8550-camss.yaml     | 517 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 199 +++++++
 2 files changed, 716 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml


base-commit: d4560686726f7a357922f300fc81f5964be8df04
-- 
2.34.1


