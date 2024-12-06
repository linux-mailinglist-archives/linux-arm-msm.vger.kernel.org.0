Return-Path: <linux-arm-msm+bounces-40699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 711B29E6645
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0EB16260D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5E420371C;
	Fri,  6 Dec 2024 04:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EXDRtXq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B39201254;
	Fri,  6 Dec 2024 04:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459609; cv=none; b=Zc2zBlnaov5zhTyMsf2oqWwdHUZhSqwrvhwmvUPRmJq6nHm9wsuG+n30NyrWIXx0xfzmg8NrRQnfeWgHmiArHfJCVsX1pSkH3FznmKkrPJipnPHj7XlE7RQGEJml2Gjrfcu8H7FCi9jl+SUZz9VcJ+sYnLMnWN8PFcUBAJieX7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459609; c=relaxed/simple;
	bh=rN647zv6W84eRhUz97WHsR+At9nEyBIYfnS51WLJ7jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I4GFU3TvmOfHKusvFDRhMBCGZNeIfQCdiPZ9DPVPdEdcX+2pGzSBXZItklnSsNI1E1aM3hh0Kolrxs1uxeJOfg6sM8GSc2zQEv+9pZkf0MpcFnQm73pHpHIvhgAAH1oy9AW4Ba97BOc1VD9V5iqNJv0PTMfrpRXT+qDfQvNCabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EXDRtXq9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Jhl8x018707;
	Fri, 6 Dec 2024 04:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6WL7CYtcGkSRcMWK8eQeOpuOSJkVYOWLRQpLoyMjpI=; b=EXDRtXq9khIuzeak
	RilxNDvUbTkrkbZWEmtUWRQywtmMXAB3dvPLvFyKFfiTG0d2qU+6tGZ1utLelzm/
	tsSf2vGlLHKlSu7KhAD8dEY0YQe0x1a2Vk60Fi/z9aE5IlJY36ZGQnnZ3iYVgSHZ
	VXo8oklaR44OwUsOh2sp1eN1Dv6s7WWTceW2ALaxW87xMgXhvM5I0TtcaU8KRxxy
	SrrZY5e21BhqbZhYYn2ZohMCilSf2Weg2joSQxz5oRN2HAO8VvMspCnN2lK3hU8b
	HHJCpy61mzUxjtq3urs/ZCLyR2E17bM9D/b7mOwY0HxMjazrvvaFbxShFPUE0HAr
	YQkwCw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8s0um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wmvj017295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:48 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:47 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:13 -0800
Subject: [PATCH 42/45] drm/msm/dp: mark ST_DISCONNECTED only if all streams
 are disabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-42-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=988;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=rN647zv6W84eRhUz97WHsR+At9nEyBIYfnS51WLJ7jg=;
 b=uYSFmaRUMgE5PAuwpkpjLnP8qqzYBEvmYE0gJ+/qCQzZr7uvlR5QZkQ70gYwnMv86Hc9Q0o8K
 //Jik1ChqhCC52K8lCkLfuhzJSzI97PiBkLidQVV5x3zMZyh+odE089
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S76CIxy_OsMvWadSjs3CgNuW0SyPbz6T
X-Proofpoint-GUID: S76CIxy_OsMvWadSjs3CgNuW0SyPbz6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=746
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060030

HPD state machine assumes only one active stream. Fix it to account
for both while marking the state of the hpd as disconnected.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index caac0cd3ec94e7be1389d8129fbd506998cf77da..528cda1453a85f5f8dd37bb0d2366548016c88e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1890,7 +1890,7 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_
 	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
 
 	state =  msm_dp_display->hpd_state;
-	if (state == ST_DISCONNECT_PENDING) {
+	if (state == ST_DISCONNECT_PENDING && !msm_dp_display->active_stream_cnt) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
 	}

-- 
2.34.1


