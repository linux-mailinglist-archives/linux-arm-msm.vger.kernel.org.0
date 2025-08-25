Return-Path: <linux-arm-msm+bounces-70690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9CB3435B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E227205F05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74A72FAC02;
	Mon, 25 Aug 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj3zrLUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1342FD7DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131469; cv=none; b=roMpeM/CyKVqK2kRUTI3txBHFZ7Cd/tbVMHeZ85aph8ozTgo9S/ilHTBKW7XRdcaSFOnPc9fYiJ/p0y79BVbpRQfUICf9KGPaCbG23bH64KmBZpfwJYCB66L45NKfsqqFg+lr8sswshp0kUV2AGTvVyXxPqn8bbBbsZ23m0Uuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131469; c=relaxed/simple;
	bh=1oSkEFR+fGQLy7vYpKyqAQAfFHcC8xq1YhHoCdiqFSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Thg2gsvLwUTQM6dOmsNU7NIqVLTIXxUbPsYJJ0IbLouhuhS44TTYpik0pTZ036e5Jptj4rn3woM6FdR7b6YR2N+1lhGULk4sQrviJ9Cfk0bv4ccR1ZmvqSGmuzvvrV/7sIWEIdOeXZ2UpSkYh2NmInNIV2EcQ+b/72WGKbmi5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bj3zrLUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PDNrgh018862
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ZQpVtqMzNy57YEFxSSc+VOVJ/6Kni0tmKKCMTUEH7Q=; b=bj3zrLUBFYMN7pV3
	wy47Ih7DTQvll4qZs1lnzelO5Mul7V4gjrX4Qfin4u2nHCvkhYv4QTa43WC9ipI1
	PW885/v01v1Zpfr4GUixWTk0RSmj8lFzJovVM4pmm+WvUsA/vjE4cFPk6O9UBnRN
	zvXlwUsE2VNzhv4aIn3N/mmvprCUQxNpT9PGq1g5B2+CiZInREjup2FWhtGiNI17
	Sb0CCD/vrNCMhjZpriJnIv8o64nPttynsydz/Fk4iObgCjvhPaTahaRqis0wTycL
	UUycY/QJ8+3wbPgsZrrglsLGiyPokHer3NYxdMq4TJm+hrWG99eED4SK0ZPttnzX
	1PeIDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpnem1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so4622846b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131466; x=1756736266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZQpVtqMzNy57YEFxSSc+VOVJ/6Kni0tmKKCMTUEH7Q=;
        b=aIysmAr15fWfUGZNLf4ZNAkTIKD68ebx8a827bZKHlD/7pbHsdZYA1y2ayDkhphDDn
         gSj3RgA6fcyjv46nopBnvGSEFEyn+EUuH612XJAbTye5y/gOOSzcqj9L/8YHtoSKgWqO
         zHluaENiV5bXkZwGFo0rwdJ8IWjlffSGf9Z2y5bfoKgMckuICecVhvQuxv6tO6mqQJnV
         beRdjF3gylSIROu5ebvCrxLfUISbHjXCLqG+u0cT7ti2vsfaJv/j9hWJos2iy0mBF3Rc
         ttfJbwhORNK9phvzqgac2SLDZIJxlI6aPbX1Xbrw/Roxu9+kGiPbP0KGUtSrkIFYCjfO
         +4MA==
X-Gm-Message-State: AOJu0YwN1gMnpbXMtt7k0bHPZtLeSjrTrDQ9Qkhka7ZeVpADG3JGp4y7
	oWYzIagyURwCVn/FpnD04oU9Vr9gPbfWC1MzQQLOnhBDHdCkK99vnoUFvvFOmC8PeTQxeyEVhGQ
	7pYv0+tUIT0Z7e92Jj7wxHYeVBlYqJdm3ZAp7EtfbGoqqOG3fKKTdhODoEX/rVm22G2g8
X-Gm-Gg: ASbGncurz/MM/BLC/lfp4USSAuet/VQ5SYedSiqaD11oVH/04Dlm0To6wARU394/X0h
	2xOGD2yY4yqKghwpBbII/25SVN2zJC4Q2kMl1ec+JchGBkMJBzRsOT9SYGpS6qitwwGL1yRH9YW
	q+zhz7nsHAO8X/DJb9An7gkDAceKOflfFLYLxDkZ/dV5adRqs5PLcKcElJ+b3dUPafvbXbdyBEz
	ssAXT0In8HGIodLf+hyPjZ1s97LwQLigPrW/BxdMfAR4tGK6tpC3e1t4kmCasJDYyH8v/wksh2+
	MwoYveQpg1HZweq2g2Ny/65QUgCBW+xanB4nUbhBe7zvxciUM3Pf07Gkv9GNru8Xr8TGZDU=
X-Received: by 2002:a05:6a00:4095:b0:771:e434:6c80 with SMTP id d2e1a72fcca58-771e43485c6mr2974438b3a.11.1756131466415;
        Mon, 25 Aug 2025 07:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Jr0mP2nSand5ZXOOfqSwSeW0fpa8FmcZugfpErsaJhDtP/GLcW5jzX9aJVdVBXmre/4Zfg==
X-Received: by 2002:a05:6a00:4095:b0:771:e434:6c80 with SMTP id d2e1a72fcca58-771e43485c6mr2974409b3a.11.1756131465935;
        Mon, 25 Aug 2025 07:17:45 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:55 +0800
Subject: [PATCH v3 09/38] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=3961;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=+g0HjmHzCDQXI6sBnIuFR57IMToALs8q5AH6Jj3XDa8=;
 b=P4vXdvybIYIJKpZ9XXDRsTLNqtzIEdT2hbx4huEOozKqnoR71Rvl44rHeXKIwyyOGxpcx3Ixe
 h/wGlldqGggAaekA/Ok4Ctyo1kOMzDAehF4P9xMsAmnAlVYSd58N788
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac708b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OtQsdMd2eBjxU-v0TgUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8QNAUPGDQFSwud0QFVowIea0mDl9SYkb
X-Proofpoint-ORIG-GUID: 8QNAUPGDQFSwud0QFVowIea0mDl9SYkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+D0BDPKacXS4
 YMMV3Ef/NM1hfdh0bPFc2XH4TK7eTNOUGx47+EkE1PgZuTL/ufx5Nl7isGKC3yv+MF0vEql8+GK
 e1ns1kbyEBcdTGQ40Mq+Op8rZeFjqNsBYruQU0gy9RWZU91VaVME7cmIAqdFpuAe7BVHFPdcmzl
 bJPCHlJj4Gfi4mGbSTu0hqtCqIj2UfUcSOe5j1Ud+8qizw3FqCauU7M9RcQKeqC4qwZ/F7lxK9T
 4i6B+XyHnNzoiRbq+qWbAAFDG0rq4dj+/i2qrnZnSQzJTPmXsd/EJNEhqYgdpQydZPadQJYnB/2
 waaeqeseTllevU7ueOm3PCTQX4bnXSezF6tkdvZZ4N0V6LAMR516q5qsk/Z0N11qQCah3zJRpbr
 U1eVxyEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c0001b93a194821927507028f392877db585fd2c..b25eb2fa2835f660073b5109496ac9f2f4e038d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2186,7 +2186,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2214,7 +2214,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
 	if (ret) {
@@ -2595,7 +2596,7 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2609,7 +2610,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 78406c757eccf95e82f1a9d4437ebdbbc4f8ea46..6ff3e9d9fa6ff0afa325a7a6f72a15009635f340 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,8 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d07bb40f848e0e13a0fa32aa70ffb1621edca159..c5c502e51b94a6ac4b9a893b43eb88e87a0c0d46 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -784,7 +784,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl);
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
@@ -792,7 +793,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.34.1


