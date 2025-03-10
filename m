Return-Path: <linux-arm-msm+bounces-50817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7916BA5928B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8E60169D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BCB220696;
	Mon, 10 Mar 2025 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TE1zfHAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87F821E087;
	Mon, 10 Mar 2025 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741605543; cv=none; b=rJCKDUybfklxAx4LyyJW/rEpJpfFMdKCUsrHw1oXvLqwpVd/Sl+muPVqPwMUQ1W5xNYuVkOrMRid7r2yklFGUmvG40+0otixu5bLMGrqpXzeEuphsf7cHSWCueopGDBFgcvc5G3pu4v/+FZzFTehGASp7hVoASTw6mPngLbt7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741605543; c=relaxed/simple;
	bh=5P8SmXtkaKwfANsKyJLc7RIWz9rZPt3aenTCICKBOik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IlytIz92foi9xgjRYH6sIRLDqS5yIDWP8MjOizX7izsBsBRteMgAEst6dWPm5gbJbv7+o4t4shIBgwsK+oPdgt7o13u3vFmQrznB635ZRUJGbalsSSuLLk2YBe1DcH4Gx4/sHsQ7r+PYjkSaCdWXMOP5osXOzaAFp61tGaayWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TE1zfHAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9MrkD015771;
	Mon, 10 Mar 2025 11:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPY11EtbrlKV3A7vtbOV1mGfJ+C0LzjLW4YvJOmb/cg=; b=TE1zfHAgkEk5uDgZ
	sxeWMRXx/mfDCPkEKtbnrgCvRRD7722WkDRh4CP2X6r2g82JBBrdyA+TFVz831lk
	Nd73cGigIia8n1QsOgJ7b4bpYTS1dfGlOvsMaLkXPLDd7Tb+Wje6WZSIKH4lS0Ox
	8u+9tlmsxdYVYTG8macI6Sp464JMgNhLXpRTPee+0HZTT+CDzPrw+xdomWDlz1Lr
	tPc6kqAmY90fYKzaK025BqQNzofU+58mnvRJM1+BJ3VTLNMMEAqaO8/szPLuqYqX
	fR80KnJRBdhm9PFA7f7vXdgknCmQLxKnMxNbeAlDT1qBZnoMrG3+lvTjMDZcT93o
	gaAaLA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f1jvk7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 11:18:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52ABIpK8024703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 11:18:51 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 04:18:47 -0700
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Mon, 10 Mar 2025 16:48:34 +0530
Subject: [PATCH v6 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-b4-branch-gfx-smmu-v6-1-15c60b8abd99@quicinc.com>
References: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
In-Reply-To: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741605522; l=1613;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=5P8SmXtkaKwfANsKyJLc7RIWz9rZPt3aenTCICKBOik=;
 b=TEFHZgfAyLv52FsXYkmgXx6R2R9FWyy0J6h1bQQ/HYTt3cWbk0GdzJHb3HaaPFRdJKwyNDQK7
 XSTG63xBHkBB3SxHd+BXSiPT/yQyyEtHTw2eNhwUQejHZUhdBE55FdY
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ctthk04i c=1 sm=1 tr=0 ts=67ceca9c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=bMHeHVBLoHSL1fJULTUA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VEfHgSuaEQVHSAwS3vnnlkQRHNOTwQKM
X-Proofpoint-GUID: VEfHgSuaEQVHSAwS3vnnlkQRHNOTwQKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=865
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100090

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


