Return-Path: <linux-arm-msm+bounces-23754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8E9139C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 13:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7621C20777
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 11:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66A112FB0B;
	Sun, 23 Jun 2024 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MYlgwp2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B712F37B;
	Sun, 23 Jun 2024 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719140932; cv=none; b=YsAP/NKYPA/0ivetg/ZpsV5robChvLdSlfekBG3u+fKcrrKps8tSna27pBp0Lzum+YCX9ZJSWDqbZfjQsnC7jTSIzIVQCw0OfoD2eU0fGVpGxZMI4UvdB3GuORpNpIUhSPkWA6b/kYZCD1kbeSxkq/153KRqiGNNoqISUwIfef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719140932; c=relaxed/simple;
	bh=nEmNplou6jhFzfiQv4SwtKlt2kJuX/yqDrbYEv6SjnI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhIfNEwePK+n4N6G6E2J3cTlst8UP4IxkKqa5+ip5g3HIyUvlbQXHG/W9eUIzxZNfkXUPDgfxD6ERtsCeF07HY8Nbts/q6WazP6+KAKJEblSicyZ/OLt8Y55fhScYkNfpj2w+3ize7RTm2GDWqfzw6q9juaNPYV/ECH+BnyYRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MYlgwp2M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NAsZh0013182;
	Sun, 23 Jun 2024 11:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2yvllZ0BhIK9COWZkEIBNRx2cwHnXGFlQB6ClG6fZiY=; b=MYlgwp2MmO9wFhYE
	PF+xbFRxTI8DdfvZFRraiM7qkmzMOLoZgADHknIwAbU1F/12r+4o/0VUVquhx8c3
	xQFm4/n62xTMFYkREnQzVdxgPmghz0TGLBcedacFUhaUjP0mv7N/2wYaokzYWcPt
	hMuczdjl07656SxSkyMgzQuLgI++XcUGqYLAvNGlHnYhYmKLEWghLrUSlSjOgTJD
	0qQmVVp9LwkOvUf8S7Wn7AQuiZG7p6cnL6QYxrIrzBqyn65pr2SiwT/SsOtxPsrl
	7y/aqt6Pu00R8uArloY8UF+kKZC+9q8/exYx0SxJytNWHxLI6e8mLCRZtXJzu5XI
	FtGerg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw99jm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 11:08:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45NB8c9E004501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 11:08:38 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 04:08:32 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Sean Paul <sean@poorly.run>, Thomas Zimmermann
	<tzimmermann@suse.de>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] dt-bindings: display/msm/gmu: Add Adreno X185 GMU
Date: Sun, 23 Jun 2024 16:36:28 +0530
Message-ID: <20240623110753.141400-2-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 46LQM_s4dcmDhgDr6cPhP3WoD1CijqWJ
X-Proofpoint-GUID: 46LQM_s4dcmDhgDr6cPhP3WoD1CijqWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406230087

Document Adreno X185 GMU in the dt-binding specification.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b3837368a260..9aa7151fd66f 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -23,6 +23,9 @@ properties:
       - items:
           - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
+      - items:
+          - pattern: '^qcom,adreno-gmu-[x][1-9][0-9][0-9]\.[0-9]$'
+          - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
 
   reg:
@@ -225,6 +228,7 @@ allOf:
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
+              - qcom,adreno-gmu-x185.1
     then:
       properties:
         reg:
-- 
2.45.1


