Return-Path: <linux-arm-msm+bounces-20924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A78D346C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A341C24143
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308D01802B4;
	Wed, 29 May 2024 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gZdFvDAn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76F17F39D;
	Wed, 29 May 2024 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716978002; cv=none; b=RQon2TyRb3UMkAuM4MeLKG+LBnE0AG19uVyydh+AGt73mmQsoplv5BkjHSe/slAEUBCwOdVLbiQ1HEq8XNzcgla8T8hiA5wIPr+c/b3FRydAXp+iu+c14VuYWhCvEaUMo0AbX7OPnkeb8yYSlLN+nTJeQt3JU0lAProVaus6Y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716978002; c=relaxed/simple;
	bh=baA8DneawXk9Bi5DFUbXvJg0gUgakKcPMXdysr5Xxlg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oWFawYVo22LNZk/wUu1YPpiQllvn8kVI6DVnB2HOBJrbZOk7faZm3UkOW6YZp7wZo6lTzNOjZ/a7OadUOjbxmXQGsOnBl9ALVK/aFKt21qZgtqMoCl7og55+rKfuf+1QVMzvGENqskD2wnqC6KY5iTfL1daEHFmlTRkOj2+g9Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gZdFvDAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T0LNtl013246;
	Wed, 29 May 2024 10:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r/vT4C/a4IS97z84ETCjoX
	tkce7reUL5qL+ZHzsNHqE=; b=gZdFvDAnZA7WHAYpXDEYv9kWFcid67UNKK2BG/
	LQy5hYTbBqLPNo0vYQGUH4QTP5T/SkGMa3jWWOPPFEWGEuUiZmHN5NxTb/PorJMI
	3jqn+xw6gm+1XTfIEp0l8hE4vGL5aHpwJ2AQW93R5RnSzaKEZZouPV2R28QSIE/A
	ln5G6//aroT6Y5AN1Nus/WjzeRyTdLWwugeY0DitOspEszbcsdm1MBelw3sj2zgP
	6mvcbgQDdzS8+tFHgP5VrMUgMkyXRsSKSHVZiRE7Z4aDlvAPV7YSaicQcsMHO/v7
	ts/fS5Ltl2tNHHCEsaATmUnK4GOxs1x+cR1hfEBg/UGPetEQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h8m4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:19:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAJnaN013339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:19:49 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:19:44 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 0/2] arm64: qcom: sa8775p: Add IMEM and PIL info region
Date: Wed, 29 May 2024 18:19:27 +0800
Message-ID: <20240529101929.3167610-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NudA4Hczc0OXjKUbfK8vNYsjAAoMcCNC
X-Proofpoint-ORIG-GUID: NudA4Hczc0OXjKUbfK8vNYsjAAoMcCNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=655 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290069

Add IMEM and PIL info region for the SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---

Tengfei Fan (2):
  dt-bindings: soc: qcom: add qcom,sa8775p-imem compatible
  arm64: dts: qcom: sa8775p: Add IMEM and PIL info region

 .../devicetree/bindings/sram/qcom,imem.yaml       |  1 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi             | 15 +++++++++++++++
 2 files changed, 16 insertions(+)


base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
-- 
2.25.1


