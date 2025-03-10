Return-Path: <linux-arm-msm+bounces-50883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7903AA5A5CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 22:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32681189411B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BCC1E25FA;
	Mon, 10 Mar 2025 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ml2fik4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE36F1E22E9;
	Mon, 10 Mar 2025 21:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641186; cv=none; b=MJBf6Jxk3IWyZEW+kT+2u2kGgSe6ldTM39GgdB3dbGd8Ty7b29ZIOldWNxQwmtsULgBzS9NFO8xB8iHuVVQFjfQ/INepePq3z86/v5lf1eQluEVsjRSGvX8OTF3+YApDPp5fTvyQuabRKbGzz+DPLUiDVKYmez5/mue+LF2l8xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641186; c=relaxed/simple;
	bh=hcUiz3N63DAeb6G8U7Zwr9NHM1rpXGXDIG5fA5OuPRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ptnGqKWnaJOmgAqi3c0y9IDM5mwEV6dy2Ue76nMh+GTORK4Dn13sF9zBMCJrQQpRl99PK6wA6tLuwkTSG+vdhDyGiCIWeUnNCk3mXQD2uQPVrCrRghIG8Yqt/EFXXm0pWz8Ioec7MujdlTb/mrZpIToYiYpTcd0I3VyqJD5pOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ml2fik4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AL2tk2025411;
	Mon, 10 Mar 2025 21:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLpARsczquAdLgsj/FcLjU2y3YWSnAoledfDtctwhsg=; b=Ml2fik4nhG+gXZem
	nfWJG3fdryXpsJoIhi0d8ORtxMpaCpvS4+uc1w2Gmzt8hJNC49atmb+IERDire6G
	XFKD8/0H/DQCAW1Fe3s/miNA7HI3Wy1bEaUAJoWmOrLXIAnKkiMeuTaYZJJsSSkR
	oxoyPVTYE23HbKe5dImUJ6BSMayUiobdtmQnnI5Tz9DfKFvjEz2++R2V01fYug9/
	w0RnE6ZLCoxNQ8o1cFyqoV5mcIqtEcdfThYAr1s4/iTTrUGAGTFmP+ziEG+0Hsan
	XZ7r6Hz0dT78essfha9Mlm72H8oWjIcXSBUD+SQm3jXa0qpf71dfwAqAfGHXw+a2
	cwTYjA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6x70r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:12:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52ALCgIn030237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 21:12:42 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 14:12:41 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 10 Mar 2025 14:12:29 -0700
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 document the SM8750 QMP UFS PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sm8750_ufs_master-v2-1-0dfdd6823161@quicinc.com>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
In-Reply-To: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
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
        <linux-scsi@vger.kernel.org>, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741641161; l=1168;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=FQqqjK3cWy3/ddUGwo9sBTHtWsUxwLsugXCLdQnUKNQ=;
 b=LEumYJ4R7zaF6pPuYW7ctD6FUcesvM+YmpZf7Cpatzg/vM+xFlwXYdLuQaaUkQXn4ko7lSZjB
 di1m8pQAPyQDKZl/6P3Ddz3BoT8NlU0kq1eQ5qZuJVKRUA8hnbCy38g
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cf55ca cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=BahsdhlD1VgbZ89a8f0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nxhSjuovW1WqG2JFloeljvg4C6hN8kn1
X-Proofpoint-ORIG-GUID: nxhSjuovW1WqG2JFloeljvg4C6hN8kn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=898 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100162

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Document the QMP UFS PHY on the SM8750 Platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
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


