Return-Path: <linux-arm-msm+bounces-45537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E8BA165DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 04:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B36171887CA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 03:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54271474A7;
	Mon, 20 Jan 2025 03:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LSCvY790"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B8137C35;
	Mon, 20 Jan 2025 03:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737345107; cv=none; b=RYe5rSC24dtTkPtmvu6iWyMtp87Hp0BNwqaAZGuViuWwQrU3qQaZzVEOINAekZ1TXuTUu5N3zgGgRLrQgsTggp674m5zLiNqoxnb3eye0lE2RQcpvJpEBVaxdu8mqX33l2Q38rWT2ZdOb4LrEWVZWj2zyvy9j71MKBHh6Yf9wp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737345107; c=relaxed/simple;
	bh=WMZvY5lJhEJd/KRjqE5MHTAkIV+gcfxlVveIF0j+GGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fiROMT5wpj08yXazCG27S/bKIHkTEAp5UzUj0a2FQzKeqwspEs3pFTWO/iNCKowiskMegJEUj+e5e5wS9ifjNjytVgmMdpIqISErjpX9wwffIW+6SzTDgN4IAWL3vUJCfMTBzP7ejkH25hUu4ik3BqMF9FTgTcXqWbMtZ0OjIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LSCvY790; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K152Gb032273;
	Mon, 20 Jan 2025 03:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	444nZ169tZ+Tedf8qd/ScLfsd4haVXiFaAKNEXWkQHg=; b=LSCvY7908cDGT/m5
	OAmMRGvT7mGw0r5uLSHUBX8ipYO1MwKL+/pgTlg1tts6455tUM069b/BkyaCsVVA
	PJEzehA9ziVNz4ckBaEMX8iWg8d05FCeImYVN1/U2UqfMQbGzE0OLFlJVmyGtnt3
	I1IdfppKNbAOdQlSiiuk+zFzo/hVW6brp9+qOcLHGG3KKjBZ5+G7eE7La9G0Gucz
	f+VepNgekHrRlUm7S19Ze8aS200NEzC2ZspgipVi2t317YiYPELWT8S+ew5cKVxf
	r2IEfl20BHc2k/FYpt0LskR+WGUcYANwT/cdK8szp6wcRahcSxtVEAx76TWEMxIc
	tsm1/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449cgr090v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 03:51:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K3pRCi010319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 03:51:27 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 19:51:20 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 20 Jan 2025 11:49:19 +0800
Subject: [PATCH v4 2/4] dt-bindings: display/msm: Document the
 dp-controller for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250120-mdssdt_qcs8300-v4-2-1687e7842125@quicinc.com>
References: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
In-Reply-To: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: Yongxing Mou <quic_yongmou@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737345064; l=1145;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=WMZvY5lJhEJd/KRjqE5MHTAkIV+gcfxlVveIF0j+GGI=;
 b=0+L+8fEeRClGszSvhIVsThOFBsV9eyJmASsgzN9ke5gQdu1KbUB26HuPe+L0OyFFSTE0PnIOO
 LndBy19/toQAikjA0N5ljcjUWAqmV/d1mGLVllfAafpHP/tPT+vA30h
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K5y9p-IokYUanIHqwfGtarnM5n9mo7Mh
X-Proofpoint-GUID: K5y9p-IokYUanIHqwfGtarnM5n9mo7Mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501200028

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 platform.QCS8300 only support one DisplayPort
controller and have the same base offset with sm8650, so we reuse
the sm8650 DisplayPort driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..3df6f9e278275d8e19fafb4a397d776e0c606c7c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,qcs8300-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.34.1


