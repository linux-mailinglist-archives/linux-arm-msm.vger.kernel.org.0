Return-Path: <linux-arm-msm+bounces-39993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 101199E11D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1949164DA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BDB18785C;
	Tue,  3 Dec 2024 03:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QjSEQAOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC011FC3;
	Tue,  3 Dec 2024 03:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733196749; cv=none; b=g+6eYYNYhDKNa/7/IfbK6M8M98suo4KXdNlA+Ak5jcCEy6WtBFNLeOX4s1Hs9TUTphNs8L0xRl9jc/HYIbQndverqrJCSNQf8IeSVh0r21NEDs4vlsV+b09gBRsu9BnBtiLelxVZSip65WAOOjzRkYN38nXMFrDxvxguSVtLPO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733196749; c=relaxed/simple;
	bh=Wc3cnVwQNfQLJ9bbuGhzSSJFTzHRGdE5UAbMwFKKjjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hn7hZK5h0+FShJFl7Nhn6kgZe2l0MGHAtuALynAHSNDv6pv+f92qhXV5XwTKQsqnf8OQf6UIFBfeS6J/jDTdJ7G+nTTP6CMqHUobHeJq5EmQiPBtQoYcMItOTP2vUfOvMD+X29AaIfztvemvqWZc7NEevL70ZpjGxmDfkD2xj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QjSEQAOY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2J7huQ000834;
	Tue, 3 Dec 2024 03:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+/VEcu7485AIiWnGGkcoGwamNFxW5YujbP2wZ4RsSs=; b=QjSEQAOYJklNjhNE
	VPT4y9AKgBl7XbnBBCSxCzuzGnTDW4viJd01mey2LEkJo/7mmbr3acg+fLiC3hrt
	//Wv/4rtJBJ/VxSZe+bXTReeM3ZOqKG7PKGI+lY3Hsh2kiJXj2+vueOeRwBWbdgG
	i0WdOUoqiHXguUKpvR91ZESs6Mg9EiOW2PDSczn8vYP5mluUdyb6oPeWbJpFjuFN
	nKRIFsuRz+0yu4tC17+ms5VhX678nQQGbercnJ4hjG4mDk8A1i9UWO2GuSmUlcMp
	ABqOCd2tPu+WJpDeM8Ed6dgyBOXXG3dSvvhm1a8PknXUSrG93kalTgKb6aReHx42
	oAGl1Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1gerv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 03:32:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B33WDtk003564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 03:32:13 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 19:32:12 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 19:31:39 -0800
Subject: [PATCH 1/4] dt-bindings: display: msm: dp-controller: document
 pixel clock stream
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-dp_mst_bindings-v1-1-9a9a43b0624a@quicinc.com>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
In-Reply-To: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Mahadevan <quic_mahap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733196732; l=1325;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=Wc3cnVwQNfQLJ9bbuGhzSSJFTzHRGdE5UAbMwFKKjjo=;
 b=Bb1l1WQLAjnOWYsL6BUXGEq5O+rUIc6lr8E+cGxLucHIdLXONyE1NpTDF0Y+3VdlwcBg8BKYN
 XObLkYinHcSD2qMxmdTl4tRe71t8IJEmwqG8gTRQDiZYgLpgGHgkE+z
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kurS0t8mD_469EJxwOUNwkGKY6ecwK4y
X-Proofpoint-ORIG-GUID: kurS0t8mD_469EJxwOUNwkGKY6ecwK4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=936 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030028

Display port controller on some MSM chipsets are capable of supporting
multiple streams. In order to distinguish the streams better, describe
the current pixel clock better to emphasize that it drives the stream 0.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a212f335d5ff..35ae2630c2b3 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -55,7 +55,7 @@ properties:
       - description: Display Port AUX clock
       - description: Display Port Link clock
       - description: Link interface clock between DP and PHY
-      - description: Display Port Pixel clock
+      - description: Display Port stream 0 Pixel clock
 
   clock-names:
     items:
@@ -68,7 +68,7 @@ properties:
   assigned-clocks:
     items:
       - description: link clock source
-      - description: pixel clock source
+      - description: stream 0 pixel clock source
 
   assigned-clock-parents:
     items:

-- 
2.34.1


