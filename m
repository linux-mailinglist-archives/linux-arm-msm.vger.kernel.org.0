Return-Path: <linux-arm-msm+bounces-14320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD887E32F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55AA51F21022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 05:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679BA2135B;
	Mon, 18 Mar 2024 05:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X0rSvZIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C8B1E4AE;
	Mon, 18 Mar 2024 05:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710740216; cv=none; b=pUpV1forVJe+vZ9bXEltB0k20bcgeoCFpmn7Ul9o57YJ3HXXYsRPV2MMbYQsIWSN+vvrNTrtUIwp8weeHnFamUHQRgDL+AUH01K0nZsUUfdciRP8mBLQACr+yHqURlAlQicRxD00w7KxkrNS8sKxlvMYXZIwN/cnI+VgEyzolOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710740216; c=relaxed/simple;
	bh=dq8murMgb7jHt9HQ8Hv9x6VCtfKOXGHnBtwV3f9Bz30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsqrxYYJI7J2MpgiO1Xe2Hwry8xB7vX9vckDZ9g4mFHPPAKbzzUMfe7N5G2rkIdayc3B9hJGhkwH3APLGSPOPwPPfxhaGJtncUEfD07VBIT6oSweFKstnBId3V/UQbURi6bRiMTsgLW63euZFPolxmalZmkKTe7rJzEGqQRuI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X0rSvZIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I5S3D1005770;
	Mon, 18 Mar 2024 05:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=X8nzsaq24ZwMIacPuSpD
	JQpVKb9EP4G+56WR5o0DjGw=; b=X0rSvZIhMnkyhEdFThQ+CisFnq3sedVJ0DjN
	F754zeRURCtBHoN5wcvJjW1VXbaz8u+imwDnJfg31Px2x51lIQgVMqMdD6DVdA5X
	jK7oReTNauwm9jpBUttCSQqkycDYMiPlmxH5Wqsp2sFghLwhca27gh/r+4thHtEO
	XDKKeoGLEuuoWWRUihnNTWW6bU1h+05qlx8ybGhAaPfLkNGpzpbrQh7ZkToEHinQ
	5rCCbBXb6GOmRVfY+wO31sGfnp6g9gALd3rlo1TtEbyHOVx/3LwIWoW8iBb+tpr2
	5eWPUc0sVmMTaiNCYPgDD81TqCUYvK6mb2zYxdb54Z2ghBAASw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wwxtds48q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:36:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42I5ao10031300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:36:50 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 22:36:46 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/8] dt-bindings: clock: qcom: Add compatible for QCM6490 boards
Date: Mon, 18 Mar 2024 11:05:48 +0530
Message-ID: <20240318053555.20405-2-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240318053555.20405-1-quic_tdas@quicinc.com>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QiI1P50f1ZTtuy-pzEZglXBhyaFOPOZx
X-Proofpoint-ORIG-GUID: QiI1P50f1ZTtuy-pzEZglXBhyaFOPOZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180040

Add the new QCM6490 compatible to support the reset functionality for
Low Power Audio subsystem.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index deee5423d66e..861b41933525 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sc7280-lpassaudiocc
       - qcom,sc7280-lpasscorecc
       - qcom,sc7280-lpasshm
+      - qcom,qcm6490-lpassaudiocc

   power-domains:
     maxItems: 1
--
2.17.1


