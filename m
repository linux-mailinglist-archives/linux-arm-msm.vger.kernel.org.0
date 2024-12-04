Return-Path: <linux-arm-msm+bounces-40357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E09E44BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 20:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622FC166213
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B701F03C9;
	Wed,  4 Dec 2024 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VgqN0Jdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC901A8F90;
	Wed,  4 Dec 2024 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341065; cv=none; b=ptzAl/EiBtbvYPDKqHM5qPugpR4poPlInAvgE/hPs+5xOH3PmJfS9TNuRZJEwcebWi3+mLMC/35zsw0wZBwEu3yprnqzo/vbwaZoNIbl1vaCvdQrSor749hMBuFOKf56rzUQlrjwpFaofL/IJJK732MTDE/0q2KxxoHspVrbmQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341065; c=relaxed/simple;
	bh=3gNuKqQWBPykAc61To8hwlYyixyOEwYIB2PnJVmTYA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=O7ahim4XsnRciAk5FYDjA78uGkppnK8EJeQqOzgI02xEd6T5/GMGUEQ2F15UVQP5s8ymFvYLDalKx89M3PXZLb9ANNy02Ygjjq1KJswCZLNPnIosQbUnFrfH/h8Fl0YCn/Uk3MBi6b1NK2PxMUZ4x91JrhmydyTK30Ypv9deVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VgqN0Jdr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4GeuXG006403;
	Wed, 4 Dec 2024 19:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNBu8TXt1195OuQzLj7t3pIwz8cDp6cg/Ifz5cYgJi8=; b=VgqN0JdrNHraK7Wp
	a/v24KC1GJez1zG1K21WobIRETBCF6rSgsYC+N3d0d3DRe86l7buBIvzR60zugFl
	j+//YIEuJmGjXQJNeRc8RJL/UDPVHhFOlGw/SRgvcXzu2LaT9SQSGOyJq1fdy9q3
	4mWX6kzTohY9fnwGBmw3Hvdh6XpJuDatVXdms9viFMahs8d9ldcOEdoI8i5W3YWF
	awmRqxvJI0hdLZMdAcCRyPs6lxx78drEYVPEIU441LmHs/5F6LJB8AywBJ3mcoPV
	KqxZZRASOmYUxvwLnTnlGIEIYoRkmiU/aBM5buhB2S3w6USO0dfu/5vcBtXBO3ja
	RMUvbA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3en9f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 19:37:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4JbdKl022080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 19:37:39 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 11:37:38 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 11:37:13 -0800
Subject: [PATCH v3 1/8] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_clks-v3-1-1a8f31a53a86@quicinc.com>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
In-Reply-To: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733341058; l=919;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=XLcUbRlNUh4TqOMXYTNedieEom2UdQGaT/6eWR55wXA=;
 b=skQ0mFnARCXwXRowOBNJ+qqeZgpRSMndIpUf7kgLXMa49E2NnTCxvDzBi7n/uFFSX+CGqHvd7
 zWJ146uEehLCidRHz2X0Rp8diL0LKN57W/AAa9OQLCoIu8uE8qYOZIb
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hIv_UqYg2z8ouru6ysKlaKx0fUyKHDML
X-Proofpoint-ORIG-GUID: hIv_UqYg2z8ouru6ysKlaKx0fUyKHDML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=796
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040150

From: Taniya Das <quic_tdas@quicinc.com>

Update the documentation for clock rpmh driver on SM8750 SoCs.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a561a306b947a6933e33033f913328e7c74114bf..f39c4e0922cf4c98396afb6d57b7e7ba266da437 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -37,6 +37,7 @@ properties:
       - qcom,sm8450-rpmh-clk
       - qcom,sm8550-rpmh-clk
       - qcom,sm8650-rpmh-clk
+      - qcom,sm8750-rpmh-clk
       - qcom,x1e80100-rpmh-clk
 
   clocks:

-- 
2.46.1


