Return-Path: <linux-arm-msm+bounces-33708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB224996E1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18A571C21A67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B4C19DF5F;
	Wed,  9 Oct 2024 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ns0Um4kN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6149E126BF1;
	Wed,  9 Oct 2024 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484477; cv=none; b=PiMXw99ECauUj5mQ8q1zWyFkmfmwDpt5UhgVoDR0E7Ru1T4noUR8QLT7HHhajfRx3qdxcdcYcb2RWc3IkP0I18bfvzdf2ci3ns7D0dS450XplHQzo2lWgu/hs5VDDiM3TPQGW76yagRxCVuK0pGvrMYoVIbPTlJO6sDNQaIkx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484477; c=relaxed/simple;
	bh=vzTHbLrxrlJ7ao3FVTJJ6R3Ei7cWFCwzGyhEd8SBJcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Vm6lfOqUul8gXBMJ6R7z7WZ5VH1sZkHtWAyclRHaZ8uG9dkDinjPZFdR1Sj2DOge7ebPiztAXXJ3dd7Cke7TOBRdM5Asx5i/KjKACP79kbRu+0FnWusnLMk59NNhqTd42fxHclopnWT5l7efEeV99KW8pNlYrPyfyK+ULh5H6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ns0Um4kN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499A4g9Y018408;
	Wed, 9 Oct 2024 14:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXMYXoRqxxbUxxntgHhYjmOnELZxflAgQn0ucIuLG/A=; b=Ns0Um4kNno/Sl18y
	xQfNl9Xy6dxZkc2u4HxbBCWAKUvDgpVBVKBUBTvIk1R4R6aB7+SMOUf6CBU5tPk+
	CLeKfHq3bemABObQE1RnOwOERJFRpLCldx/uwTdJG1JNqs3Ie8eOpsNka0KcNNPN
	IXfXvAsd2dhWBYzLyF/v1KNvmUJQGZCWzqfB0+SIwxrPW8DIEh61mlnCY6FUGgc1
	r1cDO57SppIspIilbWKc4C006A92Ig9Tv7Uhtwj1pzZAOI3UQrBjP4m2Lc6JlKMi
	Stfp0X+IF1vfMZAqvmEm2RBCJ+TmBpc3fONY9j+l98HLJm3CJkPACcmLWnnZF+V+
	7ZVycQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qtnas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 14:34:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EYNux018626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 14:34:23 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 07:34:17 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Date: Wed, 9 Oct 2024 20:02:02 +0530
Subject: [PATCH v4 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241009-patchv3_1-v4-2-cd683a9ca554@quicinc.com>
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
In-Reply-To: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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
        Mahadevan <quic_mahap@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jayaprakash Madisetty <quic_jmadiset@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728484443; l=816;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=vzTHbLrxrlJ7ao3FVTJJ6R3Ei7cWFCwzGyhEd8SBJcU=;
 b=Q0xvxQ7h4PXNh6KRJzFcrr/63CBZivGh3sv8oxQQTOshhmSXBaa14dry0uxrZgxjwiVpcm46s
 F+4HiCVuTVSDe/ga29K1UYGFT8IYQWH0cewNJSembaoiflvjerN8PBK
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jERfuxDj4nxEgk7r-yCeCBgAb4ACXOj4
X-Proofpoint-ORIG-GUID: jERfuxDj4nxEgk7r-yCeCBgAb4ACXOj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410090089

Document the DPU for Qualcomm SA8775P platform.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index c4087cc5abbdd44885a6755e1facda767a16f35d..01cf79bd754b491349c52c5aef49ba06e835d0bf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,x1e80100-dpu
 

-- 
2.34.1


