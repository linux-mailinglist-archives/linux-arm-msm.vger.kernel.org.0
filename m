Return-Path: <linux-arm-msm+bounces-29702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F238961CB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 05:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A56791F26461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 03:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE5513B287;
	Wed, 28 Aug 2024 03:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WEq8Fya0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EC1CF93;
	Wed, 28 Aug 2024 03:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724814339; cv=none; b=JEdbdT5FYrVETy85tbpSwijgJeHhf81ty2konEa9J41P7F4yP+jmfuLcfpFJobl0uitTp8lcLuynHR08vAzBjToCoz6b0sK0VRUFsRpWmTqlfobg5q4g2GxrAB6r2E1Z1CszG9iSrLGDI115qEKTmE4IH3xsU2UzHTzes0A1Dvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724814339; c=relaxed/simple;
	bh=mwFzlyXkFczvz7aFZ0it4KOVJRcvpA2nTxfcQp7D/II=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K7r6yOqH/1c/N3G6kkW6d7ud/IABTkpbNmKK/FpspjLV1qKIA2gUICB3VNONunx5ADw6A1BdZX4Iee/nydNFxf/CAGf5vrlAMU+njrdzB7JpTT8CO3huuGR8+wWad5yr8j4Kq7lX0TLBp0fAcTDi0YkpOEm/C/OM5PNldZPzZXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WEq8Fya0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaQnl018490;
	Wed, 28 Aug 2024 03:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NOeFEQi0RR2umqHfZSjJZK
	Yppp2n6pp1cxthS39Aibc=; b=WEq8Fya0Ba2vGjzG9lpKOLfLy7eGRATaB6h7EE
	Fp1y43fthZMgmIF9AwIV8BlSdfcznbPBfY8TpDok9bFYY7AyuAckFoLCjypMUs96
	MUxj1q3qk8+xhsNOVG6HkxUqPSUtTBupt11DAaq69my40N4cgQSdTlrDbDfr9xmJ
	dVJqXpUOV8CGMtuQ6WHTM/AWpMhgQ1gVsvRflamjFz5+cTQG0+z7IBqbayCy8mcp
	3/LNaUtYaY/CbcLW/0fC63995mPhEEu8cV39aIR/ftgTrrDymkIFAOedFMLPlg0w
	qjMebQIj0/mmdMEot67IQ5ZFCT+c+EojwWHcTL+1UEat+0xw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv08h51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 03:05:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S35VEC022871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 03:05:31 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 20:05:28 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mathieu.poirier@linaro.org>,
        <bartosz.golaszewski@linaro.or>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>
Subject: [PATCH 0/2] remoteproc: qcom: Introduce DSP support for QCS8300
Date: Wed, 28 Aug 2024 11:05:09 +0800
Message-ID: <20240828030511.443605-1-quic_jingyw@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ewV09LvD3_bNumwYnBI70tNeZgj8TBG0
X-Proofpoint-ORIG-GUID: ewV09LvD3_bNumwYnBI70tNeZgj8TBG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=725 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280019

Add the bindings and driver changes for DSP support on the QCS8300
platform in order to enable the ADSP, CDSP and GPDSP remoteproc to
boot.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Jingyi Wang (2):
  dt-bindings: remoteproc: qcom,sa8775p-pas: Document QCS8300 remoteproc
  remoteproc: qcom: pas: Add QCS8300 remoteproc support

 .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 22 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            | 55 +++++++++++++++++++
 2 files changed, 77 insertions(+)

-- 
base-commit: 6f923748057a4f6aa187e0d5b22990d633a48d12
2.25.1


