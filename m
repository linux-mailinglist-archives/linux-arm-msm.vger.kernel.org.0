Return-Path: <linux-arm-msm+bounces-35125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2DB9A4F7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1CF285162
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8131719006F;
	Sat, 19 Oct 2024 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FO4gEZJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E3118FDD0;
	Sat, 19 Oct 2024 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352773; cv=none; b=hbHoGB9/AZfOFp5ZGX7WG1+g46hWjUKnhyGPYGk3gBCEFGP3DUVb1KU9qfVmCWPvCJv6OXh69H0aQWyjV34ypPZSzqBBGenLjANqFB2mLeB9wZwKNoEmn7XyS+9Lo39EPclEQNkIaPlcsQloEEVBoBZcy2o4k7q4tUtfKvf9DXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352773; c=relaxed/simple;
	bh=vzTHbLrxrlJ7ao3FVTJJ6R3Ei7cWFCwzGyhEd8SBJcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gMLb+o3Y39nibkeDQA3b9aKn1KpsaZQwuaapUPtY1LJiuzIUoc5fzDNZTVqHS1X/13x7sCr6j/cum/dnA9woSj1Ro6GmVOrUYfYYTT0Z6m1XjpSXWWdfQpLF1c5VMmx6Xwkv70BkDLioc2cnqlkxOYrC6pJW92koLgTF/HBIHQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FO4gEZJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49JDpCm2006457;
	Sat, 19 Oct 2024 15:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXMYXoRqxxbUxxntgHhYjmOnELZxflAgQn0ucIuLG/A=; b=FO4gEZJMUMnX1g05
	bd/kokurTr054c4DKRPQBBexZ6SkxVnjpJZYxInNt2FHMYPMHu6GGJ4YpJQuLd0r
	CUt5J90p6yu12xWC4NprDGYNsL59FR2dSuvsFUUGKJpCPiUfMJzjNtwAABqf2cVY
	THjSnd919HRArTLwjq7R6n6suDBV3WBog9pP2gW3oqATiCpiv+xZAyvOjt27Buxh
	V+/iQFG2TWTIPn/KgelsSRrtgOnRxGW2jpn8lzdekUPV6lfv4tZ+Z1hhAvlmc+KW
	+eiP5YXhpr4IJ1Yq4JiS9Ql/+tJEkL1qlLyke4WUzeApLvHSyIyOv7LtWMyLQFHM
	Jd8zYw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6ts8t01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:45:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49JFjwu9018595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 15:45:58 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 19 Oct 2024 08:45:51 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Date: Sat, 19 Oct 2024 21:14:54 +0530
Subject: [PATCH v5 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241019-patchv3_1-v5-2-d2fb72c9a845@quicinc.com>
References: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
In-Reply-To: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729352737; l=816;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=vzTHbLrxrlJ7ao3FVTJJ6R3Ei7cWFCwzGyhEd8SBJcU=;
 b=QBnUfJo/N8cJ0b9ZGfH8Iqe4h1lM7QomeKh3NjZenkWb6nmRKFb9fmVReXLzoBKqBFTkhg9bz
 CzFMtVTEDO8Cw1Le32YXbjY0PLpqCWhH5l274RTFzKS27LC7Ntq738E
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B6XJXleTyorf5SWPA1uJl6mtHCZvJgyQ
X-Proofpoint-ORIG-GUID: B6XJXleTyorf5SWPA1uJl6mtHCZvJgyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=993 malwarescore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190114

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


