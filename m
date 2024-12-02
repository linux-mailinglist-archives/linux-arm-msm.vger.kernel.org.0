Return-Path: <linux-arm-msm+bounces-39950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B50FF9E0D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 21:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8531B16507A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4231DEFCC;
	Mon,  2 Dec 2024 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a9AA9Nqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D21DEFC1;
	Mon,  2 Dec 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733172165; cv=none; b=PE4sRi+F8+L0T2t3hGl/FhgZ9k0d1CqjX4wpsr8HrkxTfkCoxRwYXymR9aSqZPYuELx1CKDa+J9ebcXvWKGdxY1AYjhNv1co0UEzJaAjzCeU/QlB6UCgDEa7wRHrsFo3xtYQs6nX/8cwNoV9J2w9i7Q7xPiQKp5fIwJ2HxnIF5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733172165; c=relaxed/simple;
	bh=jn+N9zwIOsPHht+9CIjwP5bJju34BSnF8zN3S7G1imQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kSivocxOjY+bjst/7vm7m82UVF14n3qK977D4d+qXPV/lSlI1QE744KWyrvfCBaKqHnBSKLgPQ6RMGzI0ajMSiPBBecwVhqHgso1alYnUcp3R+hB/YiwFb68Kk1Eef+looiVuZXIPF5EkRBiNiUiiORd5N2ZaEhJ6e+EnYnyhQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a9AA9Nqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IU6fV030649;
	Mon, 2 Dec 2024 20:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlLdvDlRzxdx5tP7v68vMBpASgo7Y0IjadtFWKOVMbM=; b=a9AA9NqzxjvZK59X
	y2/sFVlMka69A0u3rQZGQxVQ07eMCM8KZWo9RCJjF21vajyq5r6NJoYix2hTaoRc
	CgBPNpOxaiR2QBWMFc4LfaVCIJi8TxIV4oP3jMfBl7Dr09EUSDNap9Bi5u6djTn3
	lj4n+ec8wCIzfhXMAoIoXX0s0zwkutHsnkX3V1JF6fgIxJx9XhY3nvsJWoKnLTQP
	As9S1OhNC27toy7SVTECzKsxXUJy2ZWjLX1MQS2+S7CwvDaTcJ+hB/B2zUN1yEce
	fj28MpzFe/hW4m6LK8nZ8ZrzJkNCBS7VFucdPvTXYXyAqdgBN4w1VaJtWKdMNcS1
	fyHKpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1ge15w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 20:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2KgZ1M019541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 20:42:35 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 12:42:34 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 12:41:58 -0800
Subject: [PATCH 1/3] drm/msm/dp: account for widebus in
 msm_dp_catalog_panel_tpg_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-tpg-v1-1-0fd6b518b914@quicinc.com>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733172154; l=1329;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=jn+N9zwIOsPHht+9CIjwP5bJju34BSnF8zN3S7G1imQ=;
 b=3cKObY/EEQ7Wt+Pxq+KLoA5TrTbhA/vocKACaaY10Z1XzeLCocFPlgRvxKndNgK4RpW0LxIqk
 HfAalffFinmCBGiAiBvIfVM5huvk89Q7QJK4rF4Wu1Ed7wmB1IUSaEo
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N63Ymxed8R_ETFDIoL6dXhi0Z5GWXAXt
X-Proofpoint-ORIG-GUID: N63Ymxed8R_ETFDIoL6dXhi0Z5GWXAXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020174

Adjust the h_active calculation to account for widebus in tpg.

Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b4c8856fb25d..05c8e1996f60 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1011,9 +1011,21 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 	u32 v_sync_width;
 	u32 hsync_ctl;
 	u32 display_hctl;
+	u32 h_sync_width;
+	u32 h_front_porch;
+	u32 h_back_porch;
+	u32 h_active;
+
+	h_active = drm_mode->hdisplay;
+	h_back_porch = drm_mode->htotal - drm_mode->hsync_end;
+	h_sync_width = drm_mode->htotal - (drm_mode->hsync_start + h_back_porch);
+	h_front_porch = drm_mode->hsync_start - drm_mode->hdisplay;
+
+	if (msm_dp_catalog->wide_bus_en)
+		h_active /= 2;
 
 	/* TPG config parameters*/
-	hsync_period = drm_mode->htotal;
+	hsync_period = h_sync_width + h_back_porch + h_active + h_front_porch;
 	vsync_period = drm_mode->vtotal;
 
 	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *

-- 
2.34.1


