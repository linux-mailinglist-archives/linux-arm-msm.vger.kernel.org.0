Return-Path: <linux-arm-msm+bounces-40665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA5E9E65CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A58B283E40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1009F1B87ED;
	Fri,  6 Dec 2024 04:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K6FdZkm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C299B145B27;
	Fri,  6 Dec 2024 04:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459588; cv=none; b=UGe1dMjyaEhqAHi7/49J5sNHa10B9bytguSmKvIh36SWOvKjmQbX6ZMpZ2B57h2fiMIoWlEpuzl8czDDkb8EzBiB9y64v4X6eLLwANaf/3u69w0cPAkiyDJ2eqbn7SRca6SryhD/rV4i6l6dqAk/HXI0Kpj/0+m/ATzbSDF9HoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459588; c=relaxed/simple;
	bh=ImvwGMImz3lnwLhcPOyCx0tG1F03LWYWK/JmOP8dDWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rVazhtlADeiWnJJTr09MkRLaxAHB2/LfS4nkbzusaY6b1MFVjBIXR5nWvZZHZryGTrnL2HjZNttrxUO1AJWdgbVP8uXRjBJEc5q9FEkPWNzWM0s855R5VuR+YsjR/OT3eI5uuUhgWynz6domQgbvTHrnsEsIHPrxszyU/woUfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K6FdZkm3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaedB018663;
	Fri, 6 Dec 2024 04:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zgvnkr0yE9Xd+/JeRT7p0qB4GlkYHOK8Twj9NsYlxo8=; b=K6FdZkm3L+nvf4lS
	uw16ue/0AVh55OjYfFBWDrBoy67G4XyIEN/kCQxqq1fdkhK4953NOjpRqoIK+bmb
	R6mN1HQufY+4qaPM8uTvSXk/Zzt0/L+Ibt7zmwaWFpK4ceitAhWtl5m+UNYHKrJK
	NAPofq5fDbwf5uPcZYtZ9m9UAyDAxwM9+TcZL75tjzxfb2353o1vTZacptZyP0Hm
	aGqfGUbZ3UkPXQsw1G4S2ZkmUvi3qfB1HigFVHuuLU3tQg3aVKb46Mm+Pjt2n5j4
	X+eSIPxYrGkC6gtAFcujYdKxjt0OrcGsV049CDswoHVb736C0HifJ4brZcpuSWH2
	PZRIjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj2a2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WPnA022067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:25 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:25 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:33 -0800
Subject: [PATCH 02/45] drm/msm/dp: disable the opp table request even for
 dp_ctrl_off_link()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-2-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=1246;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=ImvwGMImz3lnwLhcPOyCx0tG1F03LWYWK/JmOP8dDWU=;
 b=+7FhtMNfelvkpW6hKDzVRrP60E+sRHj5ckeUj9Ncsp0BZmIzkZa13200bTTICyooFBtcnOa5J
 Xt671wsHp2MA33ATRlclQT71wQ8CxukEIakXLj9F08YstyzSn1dcZJn
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1S-xlbflonakDVvYxRLcz395c2Ap6_vB
X-Proofpoint-ORIG-GUID: 1S-xlbflonakDVvYxRLcz395c2Ap6_vB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=991 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412060029

dp_ctrl_off_link() was created to handle a case where we received
a cable connect and then get a cable disconnect without the corresponding
dp_display_enable(). For such cases the pixel clock will be off but the
link clock will still be on. dp_ctrl_off_link() handles this case by
turning off the link clock only.

However, the vote removal to the opp table for this case was missed.
Remove the opp table vote in dp_ctrl_off_link().

Fixes: 375a126090b9 ("drm/msm/dp: tear down main link at unplug handle immediately")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a8069f7c4773f087229727dc38c9af0d6d84f863..9c463ae2f8fae916661fef1c7e225f55c1026478 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2070,6 +2070,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
+	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",

-- 
2.34.1


