Return-Path: <linux-arm-msm+bounces-47511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933AA30296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 05:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C056F1889A1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 04:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B5B1DF997;
	Tue, 11 Feb 2025 04:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AnzXdFzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A81DF749;
	Tue, 11 Feb 2025 04:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739249196; cv=none; b=eDTGyRY3KltHNOCQcB2CmJ1KBN6Crz4b0q0ED/YOZKzvrMZAbhgQ2x2TcXLcVmRTkwkZqROiKQ3TBdFetP581oHuJZRlWn321dw3JiqUB26Yc5LtKBMXx7ADVAdsT2JReqmtvoEVIacO5+dav8uzQTcApZ2HwG1wfSpBa7NADWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739249196; c=relaxed/simple;
	bh=5P8SmXtkaKwfANsKyJLc7RIWz9rZPt3aenTCICKBOik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kwAnPF8DV4dlhpK0FpITx9GwfqKW7oB7h2uVOsU9suCeoLQibqCMZ8tffDqol1GurSB5EHJ1fiNhP5EzURzJLyZBJPAQfyrBsbbOeejaOc6A87bd5B+o8UkbOISgyLt7URYmRrRXFmZrsC6xziRiNcEnbFnjw4H69+q3x70M6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AnzXdFzi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHUrbo006164;
	Tue, 11 Feb 2025 04:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPY11EtbrlKV3A7vtbOV1mGfJ+C0LzjLW4YvJOmb/cg=; b=AnzXdFzi5NZ4Pfr4
	cAi4xH1kqOQyE4NpdUmAYFHb9VrqP7Kz5qpCaX9ESDFWsVMmqxU6xDr2Q7QcZwB5
	VITDwNFUxv0WHf2nY032x03TriLZ/tlrkxY9Nk7rKhAKcWKNvtvGzWr8tO6/MSvt
	HRb7j4/KdrdIooVfLmo39WR7HYTngKxIzyxmCUb82cOkkG15ZNUNqoV7WbeIRgSW
	cyY2o4DkapGCJvWWsyR3Wp7QooPbZneCTcIceSTIty2JYcg+yNDUUBVTd5DQYKcf
	+tpN+4dzPBfnbtfMJKAWDluEA0lAZtIc52CST3YWCwSgtzUtsDDpTkfKGyB7TDBr
	d5/sQQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mtv32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B4kMwH031521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:22 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Feb 2025 20:46:18 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Tue, 11 Feb 2025 10:15:53 +0530
Subject: [PATCH v5 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250211-b4-branch-gfx-smmu-v5-1-ff0bcb6a3c51@quicinc.com>
References: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
In-Reply-To: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739249174; l=1613;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=5P8SmXtkaKwfANsKyJLc7RIWz9rZPt3aenTCICKBOik=;
 b=Go41TzEgCcwWeKNYk2Ha7FZv1RfZbZI80rsL+9EWU97KFnivhjfuSLhFw1CRJ62qKdVjxzM8s
 JJdgXvOpnp6A0Bv8ws/SpvePoy81y0oIHF/eK3/q5IJB0I9ZXExQG54
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EI5W39Pvx3ryehm4d_BRfWSY29irLA-M
X-Proofpoint-ORIG-GUID: EI5W39Pvx3ryehm4d_BRfWSY29irLA-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=861 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110026

Add the compatible for Qualcomm QCS8300 GPU SMMU. Add the compatible
in the list of clocks required by the GPU SMMU and remove it from the
list of disallowed clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 032fdc27127bffd689ffc23630c9978c4460b336..7b9d5507d6ccd6b845a57eeae59fe80ba75cc652 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -90,6 +90,7 @@ properties:
           - enum:
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
+              - qcom,qcs8300-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sar2130p-smmu-500
@@ -397,6 +398,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8280xp-smmu-500
@@ -581,7 +583,6 @@ allOf:
               - cavium,smmu-v2
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
-              - qcom,qcs8300-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sc7180-smmu-500

-- 
2.34.1


