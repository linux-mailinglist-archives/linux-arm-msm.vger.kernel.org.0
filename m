Return-Path: <linux-arm-msm+bounces-44922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790B4A0C39E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 939E2169747
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E464C1D515D;
	Mon, 13 Jan 2025 21:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oh8YIR19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F50D1D0B8E;
	Mon, 13 Jan 2025 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803609; cv=none; b=jhW1UCNOB5UbYmpOE5zpa/8f5u0E6ih1yKFLAZ/jfhfcxuV/rfWNk6clxnt/ns/KzxZtc5S+wwl0w5U71nrmYCJMfKsfeOjEOn5x2aUV19ukhGlXJ9vjHdGjO3G0BJQ38BKZOQeoltT8BzLhIMHF0UxT+i+X3kZCY4nHt1SxWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803609; c=relaxed/simple;
	bh=pTXmDCLRgngvfvz2pre3rV0JGcId/IVXHc+de2Iwm+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MSiB8uyf2T67xeh6bzezKTfgbDm0jCSPtlhGIViQPkKxcLB7R/dNiDIsvgCm1BfCnjTLNS3Y2c6UirDHv8f3uVdb8+NvLiV9BFSDRtba+bxfbnt+gb32Mp8HIKxwKkWRXGBGRc09b3Ir739XhVFnuCwCcDZ8uuX0z+FPHlLAZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oh8YIR19; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHDgEo014915;
	Mon, 13 Jan 2025 21:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSNcTsmiin2csrm3aTz2jk2xS1Gu0DZ8zmGParClppE=; b=Oh8YIR190/lghXlz
	ZJttYrhHuV+znOOw6Czd23Ed3yXtBKk1ytauT49oDtuHgFTJPrOmO4hYTJRMGTjG
	Jvs9iX0TViTxVb5kebr+tPcc+1nCRK/Mm/pN+uYIAVKjdqznBJw/AfWBidnlLeR1
	1Qp+WhNKbPq0UlqR6eKaXRselHsWCwY9fh8WD++qVl4TzAcbfAd/YtaT+6+DTUys
	0cJErA+k4c++C5wXL5teVZhbRcdSvsJf42djXg/jtHibhZr64rOzfiNLL0tSqj3v
	58Mp1Z1J7sasITVZ3OEA4zulE6nq6M+i5RtT8ewrMEB8lv6ZTRNft0kP7XPEEBDJ
	warVyw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44571yrhgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLQjod008530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:45 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:26:44 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:26:40 -0800
Subject: [PATCH 1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_llcc_master-v1-1-5389b92e2d7a@quicinc.com>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
In-Reply-To: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803604; l=961;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=pTXmDCLRgngvfvz2pre3rV0JGcId/IVXHc+de2Iwm+A=;
 b=Fo86KWHUmtb5G04z/sDgd1JhwlyO1/bhTudCKl36zb6Js7K2aQ/O2JJ3BLSm/Wp44zEfLXZG2
 HBDerNImyrwAuE2vHekrhxbU1bNLpbr6Ul7X6mhGgB45FcMnmbJXSsG
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DH6P1wEePpOAGsJRXzFcQgI-v9tctVkh
X-Proofpoint-ORIG-GUID: DH6P1wEePpOAGsJRXzFcQgI-v9tctVkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=741 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130170

Add documentation for the SM8750 LLCC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index e5effbb4a606b1ba2d9507b6ca72cd1bdff51344..37e3ebd554874f0fbbb8956a718dcb717ee82155 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,sm8450-llcc
       - qcom,sm8550-llcc
       - qcom,sm8650-llcc
+      - qcom,sm8750-llcc
       - qcom,x1e80100-llcc
 
   reg:
@@ -274,6 +275,7 @@ allOf:
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
+              - qcom,sm8750-llcc
     then:
       properties:
         reg:

-- 
2.46.1


