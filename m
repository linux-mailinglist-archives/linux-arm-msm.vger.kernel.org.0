Return-Path: <linux-arm-msm+bounces-39989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E29E11CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49C0BB210EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF0715EFA1;
	Tue,  3 Dec 2024 03:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ifYRLAeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B52905;
	Tue,  3 Dec 2024 03:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733196747; cv=none; b=j4lLDR7I2RpcHORfK4QBaNDgxPCQS1B2NrUaM4edsP9R1Jz8KOUYDEppeB/raGh2m54tBohPVCBIEo3pzBOiF+vPEiHqZ0FRiiVvjY51vOOmtBUqHYSlHL5hUOSaR9dKivxZCyCMCKQgrI2cC/LEi8oOoGDa49OTg/ngWcdjGow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733196747; c=relaxed/simple;
	bh=Dnz2MIm8SmWMs9ZGfYdkV/nwuzJYw4mTki88O/spmUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jTqf4WqY+SbvGcM8enPvsqMY1VzhC9QF5Nu4W137S4Po72XQHG3QoXEc+hqfyuY8b1R8etjXLtNieHVLANhRLqd2t8rdkjNSvj03FVn1OHPJnP9wVve0lvz13+5atGs6d3RCmL3YpDlJTQU1zktqxwPWdLfZkKc3twrPrkIq8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ifYRLAeG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JKN7L012144;
	Tue, 3 Dec 2024 03:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF32fOsHN9zSwDtan+OuWrXodpgcdAaDEa9ofc8VbT0=; b=ifYRLAeGo0inIguu
	QE8cdEHWW55roKYlngjICkkpFd5t0FTzqgdphJT4dnKnRwwcaJL5MaS7c1TzkvEB
	Px6O2jANe9VQTVYGouRY1ksJayAYgFqU0kOhsOL+tI4UFUBDwkyLApGRQZ938LPQ
	XMInaATAl145Srht6u09ruaTLcDlB42sNul1/i6FZP3N6yRDH6Rq8pb2xHD6z755
	14bCaFfg2oCDJaNCiMmtJdGLLMpqhMhg8JJrFleoj/ehUsM1dckRnqX/ULuyVNpU
	YFOhcFkdcKQw5bOdGQp6zons+C4sbsXkElwurv3XiMOs56NG+FT6AUIRXOFKHu8q
	qioH7A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437v07pkv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 03:32:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B33WEpe028939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 03:32:14 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 19:32:13 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 19:31:40 -0800
Subject: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733196732; l=971;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=Dnz2MIm8SmWMs9ZGfYdkV/nwuzJYw4mTki88O/spmUw=;
 b=fqZT9W7Mik5Wi2cKmF8qOSQhMZ+BebmG1BvsGr/fBkDjZQEDwzcv5pFFcoVfY3JdJzBWQDe/a
 51H+KHLRDMvAC3gppwBjA8mGVgHWll5BHNeoLl39p1Kk9Vmhh5bfaAD
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8EQ0XUzDO3hQ9K60D7hJXxgTB-yjxsVg
X-Proofpoint-GUID: 8EQ0XUzDO3hQ9K60D7hJXxgTB-yjxsVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=928 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030028

Document the assigned-clock-parents better for the DP controller node
to indicate its functionality better.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 35ae2630c2b3..9fe2bf0484d8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -72,8 +72,8 @@ properties:
 
   assigned-clock-parents:
     items:
-      - description: phy 0 parent
-      - description: phy 1 parent
+      - description: Link clock PLL output provided by PHY block
+      - description: Stream 0 pixel clock PLL output provided by PHY block
 
   phys:
     maxItems: 1

-- 
2.34.1


