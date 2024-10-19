Return-Path: <linux-arm-msm+bounces-35111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4E9A4F39
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F2A61F218E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D39188A0C;
	Sat, 19 Oct 2024 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LV+M1HyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8317DE2D;
	Sat, 19 Oct 2024 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352323; cv=none; b=AmQAJZnG+6NZBVDBOtxgTB6o4ZOil/a9GT+FtJNDmgYvOqgYSy9mOO+HqPzcNNm32Wsx2yvVhzaU73V3HLJsz/8EK2QcIlKhgg6lLR1o7/L8/8VJw+zk8wi+4ixnjlj+9axNGPYlCsbEl34A2Ay1sHfiegUhCs+BIBtEsLH/xBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352323; c=relaxed/simple;
	bh=vzTHbLrxrlJ7ao3FVTJJ6R3Ei7cWFCwzGyhEd8SBJcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=P1XfLkbXWWCcJ0Zyd8szK9Q+HWX2ziYy9PyBHmqPcPt3bCwRI4ZSSxNrS/NbJGhp+8zqAKWfhCV03xctyYZBGQtNN4KQPpzxSw6nw1pG3HzepB3uDJXt86r5YS/C0AodyeniE2AJrCEw8dreIq4ystmPJLZMNwHUowr/ygr6FbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LV+M1HyW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49JDtZte016337;
	Sat, 19 Oct 2024 15:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXMYXoRqxxbUxxntgHhYjmOnELZxflAgQn0ucIuLG/A=; b=LV+M1HyWEur1dd/g
	RXYhive1umXMXGNgzjnAkrQUda/EMWjbRrWqWqKtydPDzvMj28FTeVRJ13OOxMdh
	Ds7LxRcsySN/cGs4a2uT1JlYYETAQGr7q8P17ujO3y3mMn5jkCgfNKNcpcIsEhGG
	2tSuJB1orupelk5ShfahrwLi68EFYe2enpUybgj3pTCmkJbYWDIZuEuwkV6QebvN
	xvVDeNB1l//XlpaBdya1pg8j7ikktubtPctPkb4AyWPP6D9AV2/kUELHbeTeTcDw
	8nDwOYyaTHTbRw0rAqU8PjBfruFTcW9EFdLfChHuSGbhHw8meTAN/7LChRVI9kLh
	seDaVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tsgs2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:38:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49JFcF5w024927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:38:15 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 19 Oct 2024 08:38:08 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Date: Sat, 19 Oct 2024 20:46:36 +0530
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
Message-ID: <20241019-patchv3_1-v4-2-a95d8f0eae37@quicinc.com>
References: <20241019-patchv3_1-v4-0-a95d8f0eae37@quicinc.com>
In-Reply-To: <20241019-patchv3_1-v4-0-a95d8f0eae37@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729352274; l=816;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=vzTHbLrxrlJ7ao3FVTJJ6R3Ei7cWFCwzGyhEd8SBJcU=;
 b=IGKeawFE6UIiOt4YunqGJ5/btLmvuBPDSCQ+RQv+a5s7iAlw/DdHOpBe0R2YAq4jwyX4nUq+6
 aXohb/O1kamBLvQOAUa7x0NV6ULJEK+LJC6XTUAFnIj17nrg2Tave/C
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E5O9fIZvfbKus_WfjXGgE-2rsOSJiXKr
X-Proofpoint-ORIG-GUID: E5O9fIZvfbKus_WfjXGgE-2rsOSJiXKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxlogscore=993 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190112

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


