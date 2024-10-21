Return-Path: <linux-arm-msm+bounces-35308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 266829A940B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 01:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C86284845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B481FF03E;
	Mon, 21 Oct 2024 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LYZ78ie8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA41E2829;
	Mon, 21 Oct 2024 23:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729552901; cv=none; b=qbUFNs1FOBSD4m3yY6s0uUWMRcKqMwcZ0tx/mgsroVBmLdrj+J0L5f3ngXZGTya0+1fCxZ65PDPyqz489G86FAK+d08x21IpUNH3+4uZUjCbP90OP8rQvrrrDizlYdjNUitr1+gi93zLnL0RUqTbFcgoxHWBpqR7pHN1lN/Z0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729552901; c=relaxed/simple;
	bh=qLAHAGWwx1EyHlCU82+HfqGleQMAN6nmqr/6/t8gkWQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QZ7cdqpHX5FaYisWZaAh2whxU9iTTfC7UY+erPtRxDjlFBJuJu+dibEy/gu2jYrA3Q67qQ7bHqBFtlaTS/9ESxkFJ/8iEoz/xZlj4VyrpM7+dszgJ6EN3OEl4c0QxhUGFIYiTFr0VCbG8PITCp1enJriSJko6SDEjkkhxvjdjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LYZ78ie8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LGh4Yh014396;
	Mon, 21 Oct 2024 23:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwdkKmbWHi/GTyj4f9klPvq1JOTEXdIyuOfYS9WJ8S8=; b=LYZ78ie8PgGJQtxl
	+0+bo8ofGn83D6udRI8dAa9eMEEcb4xyq6Y/Bbx1fZyyOwIhuxRiyF74/3Yv/y2j
	O9rfK0nSlKgqYGsWTWAVO41o1IiEigdjErNogFemYrD//W7JZTv4Lfa+uMcj1Ulh
	d/WvJSNi/+bwy7JGN6LfhE3nVFhbqwPVXH9Gfo627/Fn//JCH0+67nAT8hSFdy3+
	ffFIao+MbQDH/bhZFN7tyZKInNJ2j26DxREC5Cof78i7IlN9w6n/juw+FkaITUng
	QnYIs4kNci/SCzpBtK7UzbyI19IpGgrLgItyg+Jer2DZChpFTQGMfTOBCQWaTkRT
	ZSH3dw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd2eq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LNLRAR018075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:27 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:21:26 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document sm8750 SoC and boards
Date: Mon, 21 Oct 2024 16:21:10 -0700
Message-ID: <20241021232114.2636083-2-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021232114.2636083-1-quic_molvera@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
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
X-Proofpoint-ORIG-GUID: yWLijf_KE36684agR1mCz99CpN1E89gO
X-Proofpoint-GUID: yWLijf_KE36684agR1mCz99CpN1E89gO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210164

Document the SM8750 SoC binding and the boards which use it.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0d451082570e..552c0f725dac 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -82,6 +82,7 @@ description: |
         sm8450
         sm8550
         sm8650
+        sm8750
         x1e80100
 
   There are many devices in the list below that run the standard ChromeOS
@@ -1050,6 +1051,12 @@ properties:
               - qcom,sm8650-qrd
           - const: qcom,sm8650
 
+      - items:
+          - enum:
+              - qcom,sm8750-mtp
+              - qcom,sm8750-qrd
+          - const: qcom,sm8750
+
       - items:
           - enum:
               - lenovo,thinkpad-t14s
-- 
2.46.1


