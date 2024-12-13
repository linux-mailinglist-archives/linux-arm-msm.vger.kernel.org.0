Return-Path: <linux-arm-msm+bounces-41989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C39F0AE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A599216A983
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E21DE4E5;
	Fri, 13 Dec 2024 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="azx0H7J2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1A1DE4C5;
	Fri, 13 Dec 2024 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089154; cv=none; b=QRREotsrKMVW0r9LbBqpi1SMBzJK1BMDtB2VpYEVN0fUHC+zkvJSR0efWPKv0IuHF9eooE/IQ068bpQeLoHcBp/Z1icm6Pp3zXlEPCXpkAYRsqetfTkHRA6NYaL6QOjVUk5uVpeu2Kz0mDE4vyti+ECvsfS1q2Z5jVCHoHhzdBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089154; c=relaxed/simple;
	bh=nqhuN5nmLk96g6w2AscQPzA05yCx+NMCQFf14K5tVCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A0sXkSfCcou66jh95UGUA6WGcYOf3iOZjOaHtjgR7yxuJLi01wDeqLAqWaG+HGf62LfUdAVjcraT9GDzH2L1ttUk107XWxnPwxcnx1R1EfUQ08EHKEkpaGH23SnJajnaIfuv4LfsbB5YaZm6bSrqeWv3tLyWR+ttebMXgqMbvvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=azx0H7J2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDADedc006135;
	Fri, 13 Dec 2024 11:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vXi51Q3HFKm40Bj+dd1oZBMpLz5xoIe6bP4nVFqfHI=; b=azx0H7J2KHLzGlo9
	dPKOX7wA/h0uWmIi9INyo09KKhr0zTP2lfRl7Qs8fcmGEvNNazBI6NcB68JvYuzb
	d9DhGHHRAm3sFAmxwVu6cAfa4IZzBMoQPV8VnmiOpcjNmKsOsq/8pTZwQG2mvznr
	wKQZbThE/akwMubVz7o7nQEq92RwjMXefXLS9/WffOolc/fKmOuS2NILoK2E9IMg
	zC3exJd2JvQ85l2yh+iFb2NaU+eq3R6uGnCMGKM1aPvkF15bc2K/r6pzjxeFgAVA
	usT8PG8UmrtLpL19U6i4Vq6KfzwK5Amal16TmnNpUpO2HTzpo/jRMnjGU/mNQVMd
	etca4w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xusxuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:25:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDBPdOX001906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:25:39 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:25:33 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 13 Dec 2024 16:54:57 +0530
Subject: [PATCH RESEND v2 01/26] dt-bindings: qcom,pdc: document QCS615
 Power Domain Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-qcs615-gpu-dt-v2-1-64751d9c3748@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-64751d9c3748@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-0-64751d9c3748@quicinc.com>
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
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734089124; l=927;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=T6dql6UpMdxPeUpGkcjsMFVokgA3HOE3eGechmJBAsk=;
 b=uplikiI7qOvORUKN+OFt2JHap2R0xcbE9pvIgV310g/wtnRYT3N2Aw1573KdP1HNv0rUZ/Crf
 FHhlT2Feh9RAnlVOKHQQh3Q+TmUb/6ihIqLmvwvEmS2qnNvzengVW8R
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sG1_KPY4tbmlgthPfMrsc_QiKnGwclnK
X-Proofpoint-GUID: sG1_KPY4tbmlgthPfMrsc_QiKnGwclnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=895
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130079

From: Lijuan Gao <quic_lijuang@quicinc.com>

Add a compatible for the Power Domain Controller on QCS615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b1ea08a41bb0c369985c5f2d5b4c4644367a88dd..ac7ccd98944157d2b914b04753ed7e4ab08c5187 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc

-- 
2.45.2


