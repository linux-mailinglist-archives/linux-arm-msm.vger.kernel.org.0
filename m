Return-Path: <linux-arm-msm+bounces-28113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D198D94AFD0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 20:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ADC2281EEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 18:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2063F13DB9B;
	Wed,  7 Aug 2024 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SgbxKxNc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B04770E5;
	Wed,  7 Aug 2024 18:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055563; cv=none; b=B9c8MJzXSi7y9Ir3H25keyTFYMy/bMFAM4X62PtF931l1Dv4D1we+l1T4q+FSi3fAX5QHS1ZUYJmQFAS5ODSbkddfz47qSEDRs8cRUVuTa+iZGIEpYadxeqLtn2N6ukjl2hWu+YNsEI+dSHUOja8E+68Y/s/wSQy9BEhFm7QP8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055563; c=relaxed/simple;
	bh=mAZF9hJBxlL+Q+k497cMEU6Qd8BNtvFVhN451k/8wsM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SRzU2lgQcJZLR812QpI4Ian8sxPoKyHvY2Cw1YDYdF+k3kEWCU+yX7sFV6krytyu6fMzM3xb/MII85BqfLikzOv8xWbYkKE3g3dZuS5iI4EjidZOU/e5fQEAABBMJSJd+BN46YmXwoE5NVHsIKcqG7EE9TxPY87CKS8dm7mPMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SgbxKxNc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477HlfjM007563;
	Wed, 7 Aug 2024 18:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D9LJa+iN7fVtZK95lH10UC
	tEuBWaIx4ZevFAf+8wv0k=; b=SgbxKxNchp1Uot5fLhWD5dq6laImA1WkguIkZL
	lWrNpBWH0kciS3aH48VfDY/L0jqHzeODhfpCIsRkg7WSxFcbp1B5f49kALf+X3A7
	zJ4Pg84H34qy6m43CEaVd6Wu7M+tJzKbg4aLvTm7d3N0QC6gmBJA71pyven57EMg
	lZtHHW9xDKq8je14Om49lJk5dNG1HoXIywfaMlSrKRnO2i56yHE0Zy/gw7g18q1R
	rq20SxkIcEVArHKGhzy/o9imc83BP1tJzaHVGOX3hAKOvRS40HHLRL1KvD8L5ZAf
	hnYJeYW4EYqJLP6af6KB51qa7ZO+d/gJChZ+Hw8K4ZP88u1w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6ur5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 18:32:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477IWZ7I004630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 18:32:35 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 Aug 2024 11:32:34 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v1 0/3] Add compatibles for different eud access modes
Date: Wed, 7 Aug 2024 11:32:01 -0700
Message-ID: <20240807183205.803847-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Jc0T6VvmBWIYgQ-DzQRqmIDiV4L_ECa0
X-Proofpoint-GUID: Jc0T6VvmBWIYgQ-DzQRqmIDiV4L_ECa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=532 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070129

When enabling eud on some devices, a crash can happen when trying to
access mode manager registers, since some devices require that these
be accessed securely. To support this usecase, update the compatible
strings and add driver functionality to distinguish between secure
and non-secure euds and avert these kinds of crashes.

Melody Olvera (3):
  dt-bindings: soc: qcom: eud: Update compatible strings for eud
  usb: misc: qcom_eud: Access mode manager through secure calls
  arm64: dts: qcom: sc7280: Update eud compatible string

 .../bindings/soc/qcom/qcom,eud.yaml           |  6 +--
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
 drivers/usb/misc/qcom_eud.c                   | 53 ++++++++++++++++---
 3 files changed, 51 insertions(+), 10 deletions(-)


base-commit: eec5d86d5bac6b3e972eb9c1898af3c08303c52d
-- 
2.45.2


