Return-Path: <linux-arm-msm+bounces-25647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AE492BAEE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244001F23DAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2749815E5B8;
	Tue,  9 Jul 2024 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qb7GNLqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AC158875;
	Tue,  9 Jul 2024 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720531346; cv=none; b=ctA9TDqy0WnkLrp/z8ewzIU5FdnoqSCv4KB9igr4BDap/A3po/mQC8OdGHh+1A/yarLcJfx7mlfPwu3ggkyOqCptKqqX+0DXuzlKlvbIT7qgzLIKdcNQavDRziPWSRKd4Qn4J9z9JmBqBgjnanYWQxjeLv25MfA11oSjoR2m91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720531346; c=relaxed/simple;
	bh=HEASiKPSPtg13I9P5dYAi8cuOPmYVj/NPlTdIjHwVR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=JK2yUZTZe3sGB1cKtrshO7b/BFH7S0OO+wmLepbU1tOhMCrMw3lFRajeSVBosulsDBfkJXRCMxRr5AF7N7qkIw9F7Rp6y1j5u1HilObQNszPBCxPqE5L8jNukTuL63dih/8kD1Wo1jN8tzRcEn/YA9QA2XjlpBqmI6iGvfne2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qb7GNLqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AuxDW003975;
	Tue, 9 Jul 2024 13:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mpHNdLs5eaYP3RcZR0Xin6
	ZXRPo5V3fv6faRwsn8Keg=; b=Qb7GNLqzITH4ArEGuCDAuXXGWQz5XSbijdIdVe
	5GKEVK24H+sylTRQ6VsjbzKUTvnKW11sH2d0twBbLMm7hQUP8c/k0coOt/pcvXkk
	jbSYydbVMJM2B1yP7xNhkOL2IXjQ0ST3kUV0UyMYppnbG+v+4+4HUO7VHUN/KoRF
	Z/8prE6DQsV43nY/DjlX9vtEES12jB8KPYFgCFCDmWZ/X9Oqfvi5ydNK50zhAviD
	XkBHxS3Blb8qIjjvnrGmrXgMeSuTIQI9ZAKODNjrYTnK7oW5/YrFgBM3FGDNmiGU
	IQth5SHlxF7AePMoGcOWmauMuREr6u1ija3Q/cXJEl1gjNtA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmpp24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:22:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469DM5gH000512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:22:05 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:21:59 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:21:44 +0800
Subject: [PATCH v2] dt-bindings: ufs: qcom: document QCS9100 UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_ufshc_compatible-v2-1-c6e6bcd0c494@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGc5jWYC/zXNQQqDMBCF4atI1o2MUYl21XsUCXaMOlATTaK0i
 HdvFLr83uL9O/PakfbsnuzM6Y08WRMhbgnDsTWD5tRFMwGiAAk17yyukzZBLejrDECtvR9RoZ3
 mNtDrrXmHhazrEqtcViz+zE739LkazyZ6JB+s+17JLTvX/3sOoqxKSEUmBUDFM76shCpoM/Ste
 Zwgg2lsseY4jh9SaGp/vQAAAA==
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720531318; l=2624;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=HEASiKPSPtg13I9P5dYAi8cuOPmYVj/NPlTdIjHwVR8=;
 b=pwpj3ZKwTM2Vr5kFle/xVRFaVW4rE6bye/7r46kD9Naqa0Zwg4ZIHxA5RUrX645L3LQji/JME
 N6Gedg297WSAlmum+syp2Jrzq8etR0nxv8GktLRnFqsQlXsyapDaE6o
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6rxM2h7tKac86sGIC_ph5Wq7YDAsZ_Ez
X-Proofpoint-ORIG-GUID: 6rxM2h7tKac86sGIC_ph5Wq7YDAsZ_Ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_03,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=974
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090085

Document the compatible string for the UFS found on QCS9100.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-ufshc" to describe non-SCMI
based UFS.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 25a5edeea164..baee567fbcd6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,msm8994-ufshc
           - qcom,msm8996-ufshc
           - qcom,msm8998-ufshc
+          - qcom,qcs9100-ufshc
           - qcom,sa8775p-ufshc
           - qcom,sc7180-ufshc
           - qcom,sc7280-ufshc
@@ -146,6 +147,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-ufshc
+              - qcom,qcs9100-ufshc
               - qcom,sa8775p-ufshc
               - qcom,sc7280-ufshc
               - qcom,sc8180x-ufshc

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_ufshc_compatible-dc47995c8378

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


