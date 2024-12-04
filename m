Return-Path: <linux-arm-msm+bounces-40205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F509E3847
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA894B2B67E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145861B0F0E;
	Wed,  4 Dec 2024 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gmfqu2N5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A6A1B0103;
	Wed,  4 Dec 2024 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309584; cv=none; b=auQCVTslSvYnoQbTFUp0XzxUQ5hfdvFoyLH6rmJSi7EDt4TXiMedLPssIC8SvfCddRR6tFUGtASqiHzPXnHHyP7tNPn45le/PwsmUSauVAFQ+heW4JQbbw3PhmbaOEA7M/IRs2IZ7HWSDggfQuVXYtGkYcFzjR3ZUoqu0xeA/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309584; c=relaxed/simple;
	bh=gu9zVolaNoqhoh34YWfqyKGp1cvXVpem9HXtd0Np0nE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIw4a5XBVweNTiku+jgWB89TYSOvNyWOrtfj9FbqQsI7xJEPNQuFWyGKYG3Ib9RZ+VavR4Iv9qa30LGuKIH12H8oXp/Jih1j/njM0Rq1jqmGXlkZlnBii4bqcyF4ee9c6oRBgJUT27arvRCfwI90ReN3JXWS7yeXerPMcankQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gmfqu2N5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B44BEQU020051;
	Wed, 4 Dec 2024 10:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4A6Y9HvhCtq
	ouJ4cSCdLpXkCUHrUT28yTc4cC4sxQhs=; b=Gmfqu2N5zJ2gKryhJwvtIPLr9wN
	+u1wpvMlhc0EhIJ0UhRwXplTbZHyOr2VzLR7gUCMRuDD7HFvsU5etdZV3Sbqod4D
	XrOV2HUzgeQYwTU8T9xUQiJM4+WJnJA8yb1EdTLoeBmE8o87qz5J8PNLCIVMcc7M
	ASO6h42FMy3MxbGL0sGDqCNPPZWqVxS8ha0KH03AMrNGV/QURoomcSeSfxNNeDyN
	BI5EAhZz2N8Z0WX/fEqhVS9Tu38oyKLW0UQ2sdZSX6FgEy+0iVJtGGXCoYp2dBac
	+NDFCbf1dK1LFbkNSRNsotvvgmGqIhCABNjtixPAWQ4M61rWzgKCvHRx1Lw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3exaw0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:57 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Aqs1J008977;
	Wed, 4 Dec 2024 10:52:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskmrth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:54 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4AqsSX008972;
	Wed, 4 Dec 2024 10:52:54 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B4AqrSO008893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:54 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id E3D7419E4; Wed,  4 Dec 2024 18:52:52 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,qmp-pcie: add optional current load properties
Date: Wed,  4 Dec 2024 18:52:47 +0800
Message-Id: <20241204105249.3544114-2-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7MnpvqgsvsAYFISoTdlQfAIribvmbCgW
X-Proofpoint-GUID: 7MnpvqgsvsAYFISoTdlQfAIribvmbCgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040085

On some platforms, the power supply for PCIe PHY is not able to provide
enough current when it works in LPM mode. Hence, PCIe PHY driver needs to
set current load to vote the regulator to HPM mode.

Document the current load as properties for each power supply PCIe PHY
required, namely vdda-phy-max-microamp, vdda-pll-max-microamp and
vdda-qref-max-microamp, respectively.PCIe PHY driver should parse them to
set appropriate current load during PHY power on.

This three properties are optional and not mandatory for those platforms
that PCIe PHY can still work with power supply.

Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 34d977af9263..0e2715301c54 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -78,10 +78,16 @@ properties:
 
   vdda-phy-supply: true
 
+  vdda-phy-max-microamp: true
+
   vdda-pll-supply: true
 
+  vdda-pll-max-microamp: true
+
   vdda-qref-supply: true
 
+  vdda-qref-max-microamp: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -261,6 +267,7 @@ examples:
 
       vdda-phy-supply = <&vreg_l6d>;
       vdda-pll-supply = <&vreg_l4d>;
+      vdda-pll-max-microamp = <165000>;
 
       #clock-cells = <0>;
       clock-output-names = "pcie_2b_pipe_clk";
@@ -288,6 +295,7 @@ examples:
 
       vdda-phy-supply = <&vreg_l6d>;
       vdda-pll-supply = <&vreg_l4d>;
+      vdda-pll-max-microamp = <165000>;
 
       qcom,4ln-config-sel = <&tcsr 0xa044 0>;
 
-- 
2.34.1


