Return-Path: <linux-arm-msm+bounces-60619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38889AD1DAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE806188E156
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD1F25A2B2;
	Mon,  9 Jun 2025 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dmiekhGk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAAA25FA00;
	Mon,  9 Jun 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471877; cv=none; b=P4644PgiZlupjSInodsi8jB6OfirmWNq7itE7JV7gwwt6k3LTDGH+q5LB+StJBOiRFPZeCLalMeGHo/8suzx59EZZG7TZtVc59Mqbbcm/waqIJoIer1nBZh/j2gGZtVKdhn585qr+jz4FIguYxbLwpJ6JuENkalzE+OWzePdHkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471877; c=relaxed/simple;
	bh=d9/wPHpDliTqdzyaW3x1tYvhrcyQvEPi6yux1MBsvs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C1iSZWqIprBtESiUV6OAqBMmkXUQyWM9/enRPfq6vezybKTxiiuuYjMNxRi7NNMkIVvpmJS9FlxgSa9Om+8lL3nN+NSWkNOywFwq7lGHnm6n+S2LZ0TyMoTebvlqOPSfCar4bJEPuzSP3PcXgu9okmkyvfyE1hDybR1Qmh8WTWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dmiekhGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55993tLD011063;
	Mon, 9 Jun 2025 12:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNFodeKGNiKxoa4K62PDx8voA18dBjziG8/2jYacmv0=; b=dmiekhGkVLCq1+7G
	QDx/DeDOwRv14ZuZOolHtzfqv3fRrqyPeSde3vwEqN+qKMWhxBV4BSSm6gZ0QDkg
	iZrPXmyHCingVK7PWwoEUfGKGCA6H+Wjqw93sMKBwnbRxjewoqvmnDHmYb2XehXz
	L9BHlt27xd9a2WfcwNKRDebrZSGMYZPQudK0tmITIP5PfLO3uueFZMZtOQgcouAc
	4ITqN6AaczWIIWSReInSk5YdP2K/BCzMk1odk9zWuOVN91F05xNCoUFLcuouGPAm
	UoGPTTG24N2WhrAKShWNmvEm87RVzSQLvdYz9wwbRE64st4gaCHvNQXqhuEFsczY
	lhjy+A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxpahm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 12:24:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COST1022339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 12:24:28 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:24 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:45 +0800
Subject: [PATCH v2 26/38] drm/msm/dp: skip reading the EDID for MST cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Yongxing
 Mou" <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471760; l=1052;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=Mp7UNlITaGg+wir2pzaGMKw/DHb+TRr6yrNf/gMUfOI=;
 b=ModbyMm+YOLZG+O8YwVoe7wwYiMLAs7GMGqaMQ1Z7d5B9um6B/IUJt/iaQNYFcWS9R124q4qS
 9otGFlKHCEKAkbx/Q4RCwvhvzaRdefEkS4UYuSrj8IWFLz92IhFXvHU
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qR6ZLHqFw4iM47NNChGEBFHddlvkegwx
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846d27d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=a3mUzBo2FLGOTCIFHJAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qR6ZLHqFw4iM47NNChGEBFHddlvkegwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX3b+DRHtgvWBX
 0X5Tfos6hnEKaDYsdycqHd4t88UK5xukisnPVShp7YjynR6gDPWgx7j0V26SIUfoiqoPZRuaW41
 qMc/uUb7D35RaD5BJpEkGxpMc5ymTKHdSpyJiXdGou5QJbUwTmHueZohs3Ew6kYCnLJZOymAqUS
 7aNIufvCkrkYogFyI86Lug0fRNk7Ldm49mTo3oUtZc/QGybj6o3Xw1ipH/I1Pz7HULpTmI/m4vE
 RzX2Q4RTdj+KpejI5zb2A6Mojy85rauHACJHrYDZXy6J+61dwy+TvZynxtE9Ep7ZDQ9pRDsfEiZ
 RvfhEYedyV8rNovEJ/U0vf7zxucY59xsvu1C0oRrKrtOXsUsQjasBLExbPoVpdUMMvao1tEya7c
 8l6XMrnD8zwg5PiQKoD6BEjRMuARpobMqXxK+zzjOfr4nYs5V1REbocqcYi+4v51i42uA7uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=984 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For MST cases, EDID is handled through AUX sideband messaging.
Skip the EDID read during hotplug handle for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 88cae0ca66015377e59bee757462edeae5ae91bf..b1b025d1d356046f8f9e3d243fc774185df24318 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -438,9 +438,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	rc = msm_dp_panel_read_edid(dp->panel, connector);
-	if (rc)
-		goto end;
+	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
+		rc = msm_dp_panel_read_edid(dp->panel, connector);
+		if (rc)
+			goto end;
+	}
 
 	msm_dp_link_process_request(dp->link);
 

-- 
2.34.1


