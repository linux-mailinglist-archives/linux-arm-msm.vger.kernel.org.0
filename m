Return-Path: <linux-arm-msm+bounces-3336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBA6803B37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 18:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 782C7280F98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 17:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1383A28E2C;
	Mon,  4 Dec 2023 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R6JbpvDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DF583;
	Mon,  4 Dec 2023 09:13:51 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4H3wqx012133;
	Mon, 4 Dec 2023 17:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=A2PqbRe2hdgG+2bzb8Ox+aMtx/2cW4uLxpdVFW4eCcM=;
 b=R6JbpvDzaYKJVV/S5hXsde/tRW8fQu3WaVXbaWCTJRc9b3UDQ/TM+ARS6to9bbXwaSgt
 LKWf/NzZzs5ntIkNBsJvoM8y9Y6p2uRmuc75PxsloFTdeTNR0M18QhIbf0if00OyEDfn
 sDlvOGnHlBJ4JZ9UjQhXl7wYjmepLE8bHhOUcpO/QdOf+66XWnqj19MlqPb6UpLzuQiy
 Hf24Q+GmYz2hpki4RKr6GZ65ur8EmjeqLKYatkLjJxUGuh9LOxAM347HoBmNyrG1aKhm
 lkQIZjcXfDF2WWT4jHBRrHQofdUM8h0JWmDPxb8ODZz5x9uVN/cFgZE69jpfFOXuy/r5 1w== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3usju700kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Dec 2023 17:13:39 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4GEgf2005371;
	Mon, 4 Dec 2023 17:13:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3uqu15vrfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Dec 2023 17:13:38 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B4HDYEs003824;
	Mon, 4 Dec 2023 17:13:34 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3uqu15vr02-1;
	Mon, 04 Dec 2023 17:13:34 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH next] drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
Date: Mon,  4 Dec 2023 09:13:14 -0800
Message-ID: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_16,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040132
X-Proofpoint-ORIG-GUID: HbMF7UAXWfmh0B826Bgqdyl9huvMmy4E
X-Proofpoint-GUID: HbMF7UAXWfmh0B826Bgqdyl9huvMmy4E

When pm_runtime_resume_and_get() fails, unlock before returning.

Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis with Smatch. Only compile tested.
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 61b7103498a7..b57ff6c3215d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -569,6 +569,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
+		mutex_unlock(&dp->event_mutex);
 		return ret;
 	}
 
-- 
2.39.3


