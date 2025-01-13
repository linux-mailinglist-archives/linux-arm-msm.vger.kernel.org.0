Return-Path: <linux-arm-msm+bounces-44928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2EA0C3FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5817A3A425F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8915B1F866F;
	Mon, 13 Jan 2025 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FdaOH2X/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4C1C9B62;
	Mon, 13 Jan 2025 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804817; cv=none; b=ZoT5FiyLFkGW7di3le3fFgnh5Gm9lSBRpBacm+IxUenUaDP/1BgyMv8M2dhkZkYGEyouJWUqDFLlI1t0tswL3Ki4zYkPsMgPCD9KMfKxRWBmoGf6k8tkeht74Cq60MnGXNglZAr6WRCGnMVieSJxeFwGDFJ6c92RzxGMnmBAlA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804817; c=relaxed/simple;
	bh=YdXZ74PBdg+TeyOmDdC1/1Ud9A5uBFffCqiZ86sbUPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KskmBy2nCujPzjNzUpSoHot/gVfF5RTf6pesYa6tM2j1/xYnObsBiojJKJtE+x88a0jhelyTkLD6Hbe40W/aPoICYto44cRPBXfmzGEf2q9CzCjOkgJ4uVZ/tO4NcrMzXPLQuSxPvWmDed0ehy3OUO9zunSfSydVNxm1dwflydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FdaOH2X/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DEHYCh010554;
	Mon, 13 Jan 2025 21:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLZZDCWeTLEUzotOcsJ4353D09+yJj+Oq2OmeWFQC/8=; b=FdaOH2X/XnLRHdHU
	iSH0ClPJghuuEbsfME5BSYlzjKW6Waq2HA1d7owd0ENHBdBH7/eKSnXtDxbvCYnq
	yJSOWE+T7BJExOFjJ1hSmxy8b4+18GKH463Jv7eKNFHqMobM/XH0BomUjV8aJHxX
	isF8wLtHa9j7HvljaJut++Qy1vZh13joFCkZ+2uoWgEiM2GlGE60KqNfTO5iAAgn
	Z+NS2wM/TNicTbGDPTKYwvuh/36u+9cgQ4Olm4OGJxIqVHy+SUygwBE+0th2vg/r
	enmddydh9QkDFfadswPvDbATUwNv3UN3XOJzjHEyJDxSYrfqo+rn1TIfHsEcPArw
	Amr7gQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4454fe10v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:46:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLkXjE003105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:46:33 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:46:32 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:46:24 -0800
Subject: [PATCH 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document
 the SM8750 QMP UFS PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_ufs_master-v1-1-b3774120eb8c@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
In-Reply-To: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>,
        "Nitin Rawat" <quic_nitirawa@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736804792; l=1161;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=gOzQv4+eRC9P7wjxsfUOOhaebVaU3cc+/5NZOCDv/Ow=;
 b=fKPjl4SXOqZoumOqTqbvWh8U2kqwQjUpfliG/BKyNjH4V8iEfGODyGvzTn9vJ+RDt3qfIkKeE
 i/Y9jEf0QcwAdsV6y5mJN2aolGkw8NR7rS66y3YCcniKkaf5aK3fZDN
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CyhQPvNKUowv0mfdumMvnGUnLnKjFvsz
X-Proofpoint-GUID: CyhQPvNKUowv0mfdumMvnGUnLnKjFvsz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=897 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130171

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Document the QMP UFS PHY on the SM8750 Platform.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 72bed2933b034ff61a29fafebfa176383086e440..a58370a6a5d389cd0118e7b4650c6ff960bf86fa 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,sm8475-qmp-ufs-phy
           - qcom,sm8550-qmp-ufs-phy
           - qcom,sm8650-qmp-ufs-phy
+          - qcom,sm8750-qmp-ufs-phy
 
   reg:
     maxItems: 1
@@ -111,6 +112,7 @@ allOf:
               - qcom,sm8475-qmp-ufs-phy
               - qcom,sm8550-qmp-ufs-phy
               - qcom,sm8650-qmp-ufs-phy
+              - qcom,sm8750-qmp-ufs-phy
     then:
       properties:
         clocks:

-- 
2.46.1


