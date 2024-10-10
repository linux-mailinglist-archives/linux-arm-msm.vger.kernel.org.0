Return-Path: <linux-arm-msm+bounces-33782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B4D997D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1007A2827C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AB21B3B28;
	Thu, 10 Oct 2024 06:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TDOEX3oS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500053D6B;
	Thu, 10 Oct 2024 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542372; cv=none; b=PPuVolnU8YPptfTZG/V5iHtzs656klJCKXI2pPyqDJSTD6xz71bbDcfezTjeYf+ue/H3zFYOrYRxh0bs6CjS+0wTj34aT1v5Wy5lIPJb5keJ814oomICflWwV4H3YGCT7j2Snt4mUboXP20L1yl1SGV1AbDbJSTPd8+YZwvbB6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542372; c=relaxed/simple;
	bh=Lkhbiqrz0bzQsDsVy+hKfv7OmlW6hcXAZDdZ+4hsAls=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=UduerbImemyJ8aPS8c9YNtaNcLeHmKFqklFdxRLMjp2ryE4+kOMAdoktoagw9Z8pOD1cUoaypvJJ5GgPtHLbrN7H/VZ/mHAT/2aYyn7AacyGraAAQ1KZU0G/abpSu+UWYz9HazTmrIrdE9RJScWJGTXMuLXOqzEYEAc5RiiT4Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TDOEX3oS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bSKt032598;
	Thu, 10 Oct 2024 06:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s/xPRWKdGWDJLQe/T/A9H+
	H/RrofhYC0S+jn7RTF0ak=; b=TDOEX3oSStuLraBeLDRE8guiePjbvjAK3S+XrS
	UuxvinwbLMSTuUana2KIPmBBrVP5klLdkgpDZVBPxiSrPACiU6fliq/p8w0CjXCO
	pj9lu76q4fSi7Un9Siqdiwj2FoFW3kHPiWd3I7FPbooKb6VmrCRI5tVnVf7+T4t8
	EhUGnG5vqMZanQAuBkOt7Y75JIT+xlOaUEnBD5ibuATNSM6XfEDTCzYUDlLcYWUU
	T6J5CfHnw/+3DXkcWFAU7iBUPlBWxD58dTiuNCInpSYjmBSq7sgyGld0rS2pwRx+
	yN6JjM0UcqBTzDMDK5qS2jW8Lq3nw/TiSDxTw+rIMSaWgRyg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7j1vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:39:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A6dKGp009631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:39:20 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 23:39:14 -0700
From: Song Xue <quic_songxue@quicinc.com>
Subject: [PATCH v2 0/2] soc: qcom: llcc: Add LLCC support for the QCS615
 platform
Date: Thu, 10 Oct 2024 14:38:38 +0800
Message-ID: <20241010-add_llcc_support_for_qcs615-v2-0-044432450a75@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG92B2cC/x3NTQ6DIBhF0a00jEvDjwh21H00huAHVBIrCmraG
 Pde6vC8wX07yi4Fl9H9sqPktpBDHAvY9YKgN+PL4WCLESOsooQ02FirhwFA53WaYlq0j0nPkGs
 qcF0r4QUQTjuOSmFKzofPWX+2xX3IS0zf82yj/xVZJoVijce0IYCrTnJsuFSYEibAKCals495D
 RBGuEF8o/Y4jh8vWvpAtgAAAA==
X-Change-ID: 20241009-add_llcc_support_for_qcs615-6685f5c031b3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Song Xue
	<quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728542354; l=935;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=Lkhbiqrz0bzQsDsVy+hKfv7OmlW6hcXAZDdZ+4hsAls=;
 b=on6ynmw8kGPfVnnqKeysRCLsCMSo/UoQ8AhdFI2XogOS9bKI2UqL2fOxEbrRaXttJPKB51R5x
 VgT0nITxDwBBF9sSTnoEDMXSiP442x50RdKk15gzsYbFMtwVJdbMUZn
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I-VVGSrAzxr4CmoMrf54QTg87-UIJiWw
X-Proofpoint-GUID: I-VVGSrAzxr4CmoMrf54QTg87-UIJiWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=937 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100043

The QCS615 platform has LLCC(Last Level Cache Controller) as the system
cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
interface.

Add Bindings and LLCC tables for the QCS615 platform.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
Changes in v2:
- Update the format of the slice configuration setting.
- Link to v1: https://lore.kernel.org/r/d275829f-190c-4b73-a378-1025ca8277ed@quicinc.com

---
Song Xue (2):
      dt-bindings: cache: qcom,llcc: Document the QCS615 LLCC
      soc: qcom: llcc: Add configuration data for QCS615

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 drivers/soc/qcom/llcc-qcom.c                       | 55 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
---
base-commit: b6270c3bca987530eafc6a15f9d54ecd0033e0e3
change-id: 20241009-add_llcc_support_for_qcs615-6685f5c031b3

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


