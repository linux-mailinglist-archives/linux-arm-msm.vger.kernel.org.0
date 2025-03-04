Return-Path: <linux-arm-msm+bounces-50278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05197A4EFC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 22:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F2D97A3C75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 21:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D35E27CB1C;
	Tue,  4 Mar 2025 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FK9QapEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0091027C15E;
	Tue,  4 Mar 2025 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741125483; cv=none; b=ddZjPsLSPkNSxRpfPdQaqtaco1Wu8WRuu10laxbQXrb6oIk1TVyMQuAtSB8eWlcAeTnkK4jZlQbu8qDta6SzeKSCj+Lt/Z9dqbh8bULFqGi1BuZsMduCbRmEf09Xt0NS/Ci9hAIwuz0pNYwJbnopsmL4v2jWDizKao8FEWPhTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741125483; c=relaxed/simple;
	bh=BGucnQA/nifi+dsAtNA0+RmS3arEC5k4hatqtvHdVL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ln3BlFZypY9HBObUvsHvUX/soJQ/v06HuVt3AA/2hl6/fsoUCCo1SCBE0RsypZ9yDCnCTW/AZ5j0TvDQJuX59XEmo9qabQVi8gKkb6DTM9qqT2L9KsbUA1c/WeS9s+ztLtHAFh5j1GEEpX3Usd2Kau6LukAD+HhS7GDdFcboDdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FK9QapEC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524LOwde027370;
	Tue, 4 Mar 2025 21:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9eyWpJjcKKZsjzfL98Ea/THIAJG7x3RiAA7tMYh00x4=; b=FK9QapECEQztG7Qy
	G/biM+Gse/lHmKOC1BCD7cgybnL5kYRcObUgSHBCDNEjcCcAbtiuQIGM+9Kf2WHu
	mw3gfM2xabppaHYLC+uhRwrC8uvV2vvs6OCxDk5ii1bZDIA7HCEfZ6GpczaLfq+R
	uyNwgA3F/2EHd7bxBHS1MLGWwGnHFE80g9lvADHg59U8XMrdRscXezgM5kPvDDUU
	cfQeXZUg2F29RW1RVg2gGrvUR4iEMPD4uEmgiwKJ6KGSfP6QQ0TlV3gDYoCOfAvZ
	Rg+htuH5eAgAvU0crVm3RIBNGTUv6838DPR4xk24x9KHd3YyMj0t8tzQlvZ4+NA5
	GUK9YA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6uk9e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 21:57:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524LvcoQ022607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 21:57:38 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 13:57:37 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Tue, 4 Mar 2025 13:56:36 -0800
Subject: [PATCH v2 3/9] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250304-sm8750_usb_master-v2-3-a698a2e68e06@quicinc.com>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741125455; l=1625;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=3VRlrMRUr6/y8yX0UjIm6ZNcmiF+peDcRBvTXvT0I8A=;
 b=6n2bczcY7IXLBBmFUgFy9jfxXn1iACtrjCAgf4h3fT3BUdjGfJPU/alOeBT3pyL0T3oyPiiJB
 Mpr0iV31/znBBcgmaUEW8HzfAW6HODl3vbK6ERP7h2cs2re8sCDiPlJ
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eYCuPl2cZhKuser9K55Kdh8uDjuWaMDp
X-Authority-Analysis: v=2.4 cv=H40hw/Yi c=1 sm=1 tr=0 ts=67c77752 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=NSUex2eohPAMEdQH8iAA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eYCuPl2cZhKuser9K55Kdh8uDjuWaMDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=877
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040175

From: Wesley Cheng <quic_wcheng@quicinc.com>

SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
to utilize the DWC3 QCOM and DWC3 core framework.  Other than a revision
bump to DWC3 controller rev2.00a, the controller on SM8750 does not add any
additional vendor specific features compared to previous chipsets.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a2b3cf625e5b3962f3acfe93de02f3cae2b6123d..916024b7bd95a11d5cc5495de0fffd3fbdca8318 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
+          - qcom,sm8750-dwc3
           - qcom,x1e80100-dwc3
           - qcom,x1e80100-dwc3-mp
       - const: qcom,dwc3
@@ -354,6 +355,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -495,6 +497,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         interrupts:

-- 
2.46.1


