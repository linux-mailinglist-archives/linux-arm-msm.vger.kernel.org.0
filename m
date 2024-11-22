Return-Path: <linux-arm-msm+bounces-38807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD49D5CA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC70C1F227D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEC31DDC1D;
	Fri, 22 Nov 2024 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jjwvI1kv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3FF1D86E8;
	Fri, 22 Nov 2024 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269549; cv=none; b=nBPC93S0Jz0yZMOAbNKEbz301kIHSuqcmIFR+aLtCX8G1iThny1fNStM+WVGopDZgm5P+wNCGcQpvyHMjcH7pamXNZLIhTsy3mYhoXsF5+e4V68jcfqzuXMrLioj4MukwAxjtRw63i8V1ULWm0+cDqu9Ry4YhpS6469tnrD8aY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269549; c=relaxed/simple;
	bh=/KREo+rNoJMnIc6Ilz/61rwiiGQL29fP9KE58avjWuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rmUu4x4EcJwNV5C2/RXyolvZndm7skJqh8xq7XH10PMsc3ZZ+glareJnPQcR5eEWjZwlUjFywh6PUKPB4AIXGrtOddpkqBAFdMGAO17m7sIWzjpCMHHmeGSS5TaY1C+ZUBI37IfzOOgkUfBCYciiZFmwcJPOHQD3G5st4gA17lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jjwvI1kv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM9jXVu025513;
	Fri, 22 Nov 2024 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Q7/JMkbTLhOucp3qBZjVy23A3Hkp5JsSLNdvXjKc6g=; b=jjwvI1kvyUFjjK+2
	oXPd/KX5cgMsKH6MpfyFSh4/9qCmeUPp+EOSS6jllzgQ6YCliqac2uqos4fmn1O7
	rtZL3Gc5Kr0jpS7rXG0yF737nq6EMoYaNLvIwDo6wYvzFV7zATEoHOep/F7g4szr
	fMxX40LMO+e6iz26bqBfpScTvGufb1JbRyyDKb0XerGJN1ns2qcPKcVxh1mrZNhF
	5xOeFH53JDQqpnE2gdF1HoPYBSHVfJmro9OmRjZXOLBsz9t1rHicHaihu4S9y3Wp
	WC9CVP2+hAru4o7MFqXNuniDWzeLko9ZQtuMjxJHwGjEk/E1igKyfE6zYZtvEgnL
	WStw+g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b1j97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:58:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM9wndg031486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:58:49 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 01:58:42 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Fri, 22 Nov 2024 17:56:44 +0800
Subject: [PATCH v3 1/9] dt-bindings: display/msm: Add SM6150 DSI phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241122-add-display-support-for-qcs615-platform-v3-1-35252e3a51fe@quicinc.com>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>,
        "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732269514; l=870;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=i8C3dJCb1FabMNaJiVo31t18saKHsULJ3o5p6pDXnrM=;
 b=m8ZmiqGyV3EF71YcuNDUfBjWMQJ+o6uV/3KlCC/Y5m0Wvv2wehk4XKe4DGHQ+aqFI7Gic5i/8
 glbQFC5dZyODVg8dXcx6cCJ3LULLG1OWXcTbvJOd1/09PqJS8pisvbS
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FNUQbWQZizpUs1s8FFB0YOcDU988948M
X-Proofpoint-ORIG-GUID: FNUQbWQZizpUs1s8FFB0YOcDU988948M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220084

From: Li Liu <quic_lliu6@quicinc.com>

Add new compatible for SM6150 with dsi_phy_14nm_36mA_regulators

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 52bbe132e6dae57246200757767edcd1c8ec2d77..29bbc2f1c766e69a161cf3c8f97b8dd91dc87961 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,dsi-phy-14nm-660
       - qcom,dsi-phy-14nm-8953
       - qcom,sm6125-dsi-phy-14nm
+      - qcom,sm6150-dsi-phy-14nm
 
   reg:
     items:

-- 
2.34.1


