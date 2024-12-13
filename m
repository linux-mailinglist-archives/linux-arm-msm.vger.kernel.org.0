Return-Path: <linux-arm-msm+bounces-41965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A87F9F09AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CCC3188AFA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8259D1B87F8;
	Fri, 13 Dec 2024 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Er+DBZvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E131B652B;
	Fri, 13 Dec 2024 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086204; cv=none; b=OzCrqAXNNM+9H5ZAW4c+nixXJdOEwaiTHkMToI5nt25L/dc/rYrQyJHdVArXdqyrCxYIERNseCKiFarjzCjQRNKC6cCB6NSuWdu9s2BjnRSRrtaPLIkepearv2vlYqBtw3G5O3TmnkgebZHlLHltehISee5MCCI9oIXCIeq2K7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086204; c=relaxed/simple;
	bh=LWD0nfYBbnljjOCSl0d3uP61bTzdYLeSApK2Z1wLZbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RdEVXlpU/3Hj0ezDBjx6SecHSrXcD+a7BQNbfekkN59N8hkcAjcVoCaBqx6mJ0L6y7xbfVCXuVk6+C1LQ3Z32NaVeRyShXm9DHo8JPd3ALHTdObd3IBT5yhDd47sXQuo0Q149Nj89bDJUcXe1oditp08DNBnPdpbCORIyDoQ2zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Er+DBZvR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD6MDXF026852;
	Fri, 13 Dec 2024 10:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foAgx5TLjbSDNKdOqPPbOjhtg4j7fEpG6PgeeudxKng=; b=Er+DBZvRgG0+GLbz
	1YZbplsQCGiWjsPMaznmdJQ6gEVrWvYC1HkPfaYYxFBrRdktdNwfHTS9OjFJh+9c
	nEnI7xWoaqbwIFnrxQSCwhlD1Qwq3vZ+t+VBTgDx82Hsv5Vy/Qt72nSVbRiD+Qu2
	+K83/zvU4G6cN/aUbhbJ4Y8YQML+MyCiwPVKEkqWvb3UWf9APc6VVqLCKEGaagWa
	KJsje51L6RJg0uL2IET+BAhLNFUXMEZzNPsZpoU1Mws+zB+MshC6mif/EmLpvKOZ
	+/RKbJGmqFt2RmGsRJpq9gfx6Gq70SzY2libUNbXnFmUNcE3u9qBOvYpmOiQaSZn
	XVimoQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40p1pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:36:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAaU8e013759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:36:30 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:36:23 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 13 Dec 2024 16:05:44 +0530
Subject: [PATCH v2 2/4] dt-bindings: display/msm/gmu: Document RGMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-qcs615-gpu-dt-v2-2-6606c64f03b5@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>,
        <20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com>,
        <20240924143958.25-2-quic_rlaggysh@quicinc.com>,
        <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>,
        <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>,
        <20241122074922.28153-1-quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734086167; l=1547;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=LWD0nfYBbnljjOCSl0d3uP61bTzdYLeSApK2Z1wLZbQ=;
 b=xOUCPQx+pVWa1F9+qg/sCZ1aHSMYv4oSOjMFs9ir9yDarYdPhSOB+4PCbszhwOxlhZoj7sUdJ
 r5h69Py52OqATl+SjxMtr8JNXvOOWobrkxfOZR08CjJ/m5gzRzM8ORJ
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PQdHNA0jpKY7lOA-9IeCeVL6gs35QOn5
X-Proofpoint-ORIG-GUID: PQdHNA0jpKY7lOA-9IeCeVL6gs35QOn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130073

RGMU a.k.a Reduced Graphics Management Unit is a small state machine
with the sole purpose of providing IFPC support. Compared to GMU, it
doesn't manage GPU clock, voltage scaling, bw voting or any other
functionalities. All it does is detect an idle GPU and toggle the
GDSC switch. So it doesn't require iommu & opp table.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d5..6889dda7d4be 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -27,6 +27,7 @@ properties:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
+      - const: qcom,adreno-rgmu
 
   reg:
     minItems: 1
@@ -267,12 +268,14 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-wrapper
+            enum:
+              - qcom,adreno-gmu-wrapper
+              - qcom,adreno-rgmu
     then:
       properties:
         reg:
           items:
-            - description: GMU wrapper register space
+            - description: RGMU/GMU wrapper register space
         reg-names:
           items:
             - const: gmu

-- 
2.45.2


