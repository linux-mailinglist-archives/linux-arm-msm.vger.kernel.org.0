Return-Path: <linux-arm-msm+bounces-49757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14019A48984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142F918866D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51ED8271297;
	Thu, 27 Feb 2025 20:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="koaBa5/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD126FA77;
	Thu, 27 Feb 2025 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740686946; cv=none; b=n5H+jXEYa6vXcilO2CFlns6bo1VujfV3u3DnuhSuO/LAxftRyBvXhxHl+C/tHL1h4g+NNQgZ01fHhklF032Kh/lWOyjZX/yXv6fKbu4Ixk8kpmzSbqiou4pzquBMZTlD7B7o3pOdNg/ZlsgZmmw9Bv2yqbfFGEL2chF3EJ3uGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740686946; c=relaxed/simple;
	bh=p6/ejIMAtHX+vgHsuYL7A7FgcViJs+GWPq+L50lkmS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lRiRlFQ2/PKiD7kKzfCRjvtlBUdcjcDwP+x+/YMP2li8H4b+z/Y4dal4m1Qt5TCv4liCirVBuff4X78UmXuU3bHKkqNTOQAkewhuhkyxob0WzV/P705TV2Pw0uHa+yWPWKrDKCXzAZQKwYF/RBhxau+EfzIeZMpNAUAFOorxMEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=koaBa5/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9esw8005921;
	Thu, 27 Feb 2025 20:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJiZ+rie80rnqQq6KjuPpSE1AEOeqKU7peBCvgrsEjU=; b=koaBa5/MoV0oV9x1
	KTrSByTkvKFh6wrK5Z73J3HKrt/LMvUJfr1mNqD5pe+NN6XZpyhvsKttNapXKSiK
	TxvJEjzrRZ5UwRy3FKemtKLVierfH+J/W1JLTrXoI+w2xu/FR2uBDQ091jrYXHdd
	UxsW7g7b3uokKRyjMe/YMokuyicg0KpJkTSsnQ9NhhJ66UxxVC1Gf/8jjmZuvdi2
	cqGSL8XeLtnhJC8En3/4R8dzQYKoFnvjlLQDs5EGMl4ucVOu/vcrmi1zHSVTEuKF
	6bkr/HC8xOO/0bgLDRHSgrVA7qX6N2YU6xv6OS8aF6ua5+bO33XJtVgwjN6eDKOw
	CnDqQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452nmqstnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:08:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RK8rbQ025834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:08:53 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 12:08:47 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 28 Feb 2025 01:37:52 +0530
Subject: [PATCH v2 4/6] dt-bindings: display/msm/gmu: Add Adreno 623 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-a623-gpu-support-v2-4-aea654ecc1d3@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
In-Reply-To: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740686902; l=953;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=DfKMnOhxIUd2ol9EHjfohXtXuDCE8+Jjlx2WR1J14qM=;
 b=eZX/H+XOueV7yGWO8WdZ3VBvRB+qiaM8avYmDDfrUswdDd6qE7eNcY5FJYtN5zg8xzmUnD87W
 9+05QqrTt93CUBT/EvBZJi5e1zVSXiqyeYQ0LeeSTelKBilsdkW82Lt
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wXXJfrZKSXCL-V6EJmg2uDqIaW_74Dzy
X-Proofpoint-ORIG-GUID: wXXJfrZKSXCL-V6EJmg2uDqIaW_74Dzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270149

From: Jie Zhang <quic_jiezh@quicinc.com>

Document Adreno 623 GMU in the dt-binding specification.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab884e2364293ed4e79ddfec35b3c5f4d14ae853..4392aa7a4ffe2492d69a21e067be1f42e00016d8 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -123,6 +123,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-623.0
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
               - qcom,adreno-gmu-663.0

-- 
2.48.1


