Return-Path: <linux-arm-msm+bounces-39253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5DD9DA2C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3A5DB24DC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 07:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B581E14D717;
	Wed, 27 Nov 2024 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NETeNtWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66314D708;
	Wed, 27 Nov 2024 07:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732691264; cv=none; b=MMQirGELoKNwZAM047hEM5R3ZWjWpyyh9tB/EuG2SvmwOzximyX9JCz9M3HternttCE5pOv6fkC45DflARDhthoEITfjFM2iWdS1gth+dHh8Oo2NizCb44XazCncCCejmTELGhOwazwbsOHVvlVI3RWXxRYZ5XG1Zud7E0/cIhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732691264; c=relaxed/simple;
	bh=vykObhy7SIQbT5qv+Kxq8q050LQS3tGJTn9cExzwOzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B37yMOeZD3gSYcZIO3D/ZV5NeXGsRS+ibC9sbJ6m0my5NtdhwmmZ9JH7JbM0hr4S6wED7AVs4U5+QQVjFh/GlENV/+HGnJCYvPn3MkRaYNl9iRuOJdIW80G9ftRzwFSwb18L/a0Mchf4NX+Yhh2e9OPi/vjezjaHuWkZDjBVPFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NETeNtWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLZBg007384;
	Wed, 27 Nov 2024 07:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxO1PzpURTkMdFel9lZUGfPw0tdqdKzva1PYhPPmThs=; b=NETeNtWf/cjEiMvi
	B997mrym/nTPaqArZGlgUfncAHzwm41kA2zA7CUDqhkrKiNp2gD0UrYOBpK/qpQL
	rm4aw9Y2bytHrkKDaasv2PR3guVW4Z+FneWCuuip+KMZWEOr4xPYl2yeJkf1Wldo
	odjwrUWu+AxE/NKMaAJEIpoEFwtoV/Bfj2DnPzU7z65EChLcT0MglcDm9TcMrsgX
	ODPkk7vlikR2A0Sqm+KDHj6RDxKcrQDMcwff/NQKyA9ol3Ws6rJx2liMaFyctp+h
	XcwK+6hdI4xoTC3+299pIAZruf3lmuN2t2FmBmMDS2bQkFhou8NK4maXmo3jBkkm
	CohzaQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435cmqtw04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 07:07:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR77Ra7027906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 07:07:27 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 23:07:22 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 27 Nov 2024 15:05:02 +0800
Subject: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
In-Reply-To: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732691226; l=845;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=vykObhy7SIQbT5qv+Kxq8q050LQS3tGJTn9cExzwOzU=;
 b=3YhFbdcYHagqvmeot43OlQee+9jm13i6CDIzxoa6BPXpbM5hw7KOd65wZ72eBPNTghnuT8mPo
 nz2ktgDUig5C+FGvcoeOs3/9yFGf2B8y33DGa9GfVIbr6g590EvJAwA
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8Ic6gOmNo-UPxNhGZvIGXzMal4gd2sk5
X-Proofpoint-ORIG-GUID: 8Ic6gOmNo-UPxNhGZvIGXzMal4gd2sk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270056

Document the DPU for Qualcomm QCS8300 platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..631181df2bcf2752679be4de0dee74e15e2c66c2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,x1e80100-dpu

-- 
2.34.1


