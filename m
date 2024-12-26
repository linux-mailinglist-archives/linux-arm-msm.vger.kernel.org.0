Return-Path: <linux-arm-msm+bounces-43348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A46779FCA12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 10:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B40B47A146A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 09:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB561D515A;
	Thu, 26 Dec 2024 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FsQKA9cj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF61D47CB;
	Thu, 26 Dec 2024 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735206216; cv=none; b=t4cn8suGjfC4mtiNIDytYIZg35goH3aCVNoM+rBGkAHBDk6z4DmjugHLYagk8nPcY+RG94Ahm2BJtZrf2oYT5Gn9OgvNHZoboOfz7jwQeKuDXB+cbfy2CtXEzRuGsvKLY+LJ4MuiET1bZpXL0D4s8cy9Zoh+E2pucRS/moN9nu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735206216; c=relaxed/simple;
	bh=DD9f/pxBaA5lpQDMCeQMO7K0yfbKo340OjDtEBMvrjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TuhzBnKPX4jqlsFNSLv1t2LPobIyeO6WfEzuxDx1b66S4nXR8TiLHorRoHuLhlrjNF2jvhfLJq57Z1s/0as7N0xR6cmEzPr+Yh1HzoydKn2GeiGS82X2AbeeWrwUP43S3Hi6S9qRJR6cVMl84tAKYmQdvncGg7B1JVokmf9fGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FsQKA9cj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ1vUTI001815;
	Thu, 26 Dec 2024 09:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aqin8eZgkwlGsDIypOgclpH+LJp+6tC+z6nDZOOSLtY=; b=FsQKA9cj/WqZZ5SN
	DKtQ/CyIdS4F8RUJlDwXtkTLsMsdmWPPojgqc8gjg8NipTd4InRW5+oJ8W66hznh
	naYYzwBfJgTQ8Fse0B/X1blJr6uZAaRVlqJoyt9tV8V48TEuaTLHl11+xFHZl4aL
	4aMVoGHNhoKYljkuVPzs4LejW2SQxG4G0p8GsH9YBQV6YgOyy1o6rRCXwhb0eTWN
	oukfOSQ8dyFiWsylbqIz6pzCiPiOFmt60CqlmomNqWdRWuV6ota/UFyahxavymtF
	6YZaBcbBiqxXKZy+5nsT9PAEajAVdrvUUrwPjr1UdGWW2r5JYHHWSSqvWoaYqw5H
	tE/6Mw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rwxja6d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:43:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ9hM9u004745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:43:22 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 01:43:16 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Thu, 26 Dec 2024 17:40:46 +0800
Subject: [PATCH v2 2/5] dt-bindings: display: msm: dp-controller: document
 QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241226-mdssdt_qcs8300-v2-2-acba0db533ce@quicinc.com>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
In-Reply-To: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
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
        <linux-phy@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735206180; l=1078;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=DD9f/pxBaA5lpQDMCeQMO7K0yfbKo340OjDtEBMvrjE=;
 b=tgmBjq9vYz5hg+en9R90aK6papWI7fatAfxqXJd0KtFw2H7+nOVYfKuWZxzJ2Bz6JFt52dOHr
 lyUNBaSvfAuCYpQjxzucsTbYvaSZS2EVhdZIvgz0hab1dG6N2teumXE
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SJu3R86SBOkk7adHwudvpjuhHU8_dkx7
X-Proofpoint-GUID: SJu3R86SBOkk7adHwudvpjuhHU8_dkx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260085

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 platform.QCS8300 only support one DisplayPort
controller and have the same base offset with sm8650, so we reuse
the sm8650 DisplayPort driver.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a212f335d5ffae545d2e5bacec95299ca45e8405..863ef967e48789d3ca4e5a8a2f198dad4e8ae321 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -36,6 +36,10 @@ properties:
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


