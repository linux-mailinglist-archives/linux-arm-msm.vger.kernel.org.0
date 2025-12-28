Return-Path: <linux-arm-msm+bounces-86755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B1BCE5496
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F51D3024D49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C9F2D6400;
	Sun, 28 Dec 2025 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv2gwtYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWyrgb24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405BD2D3A96
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942514; cv=none; b=Y9LU6tjt+YdgzvJz2MAATQjgh/dfwisq6QoUr8ywBJWahX/tz9m9rP6W0wFTkBt0gvBPk9LCRGFX2gHrgGcU+INU+orwrZRkpVlW5nCC0CAo4ExP+saUyt0GH5Xoi7ZZxE982/bUfQeCMOHfYY6u/lsArFN2p0Zwt077H8fgI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942514; c=relaxed/simple;
	bh=y1SVtonrqm+Vkemj18tTHMsAczaNy4uKaP+Hxds9BuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/wJNPk3s/oLRbdjrupxs8WOoVN+5nhb6FNMXazwBUIhiNJ/WZizHte19UpuB8UyjeyQakw3l9fouDEFXwPMZcyBdmEIycbTmm3fMZ5k8Wt9perDq7DQO4Gt1fSyTmDpdZOuQA67o1Cofoh0+pvoMWYb/61IMwaj7UYKDKY7OlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv2gwtYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWyrgb24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSEut5F3317890
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=; b=Tv2gwtYhe9LuT/vl
	Ms24ndeqFrDVwYDolDRONk7c6Ce4NYzZY8Odkhnhs4DIf3Pim/yu/lou2Jp0JKmZ
	2yaxQGEz/r6vwzHWz6ytkOIi+qi4rvffeaGBLT9ADJwpNFjeXTK258jJB/lGrWUO
	30uFqgIcU/KBgho1EeT4RkrkVk+lH0gpB532i8rnllVykUX5Zv9/bZdk5MgHm5Ma
	vp/lyrEguZzkTs56kUHRgtkxJ0wMJbxrGtZ0Wc3bb02VnB8kJwRh46BV06xX3Yrw
	3wC3Sgxa5rU8a9wwL2/VCOBu2tZcI0QZ7gZl2F5HGIgDaRYYWdclCS/IsA3UYs0O
	BgSO0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wtgay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so228099191cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942509; x=1767547309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
        b=OWyrgb24XyTN2WAhh6ZlT9/g/0PUyVPGFPOjf7l86MS+qY1YXC3Q6jimjHtnCl7ucu
         Wn0FFbEZ3VDTGD7x+4GSFA3wjk48MO1e9c6ZF7EO4FUox1sWFvt5BMZwFMrn+ZH3sQSK
         +w5cMTFfQUlywobUghshch9SsQZEG7b8AzjBD/iosfPux9l9Z0Zo49WVpQdO2nE2nWCb
         i/qaH460I4uJBZL6HBXzrK2itU6Qu6Uvqh4+wm96sjqMxFAFVd7NrTWyWy/kBCV/h5dJ
         WMGkeHfCUH+rhpDujApbmq0ihFFKjeiB9+LX2iUhsC2YfqZU7lweBgdqvlrdWGPMX7Du
         aLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942509; x=1767547309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
        b=RHV7XfI0OgotqZooJ5k6kGu80fdobr7lCsj7ke+2Rm78Hz6Xlf33tRSkn6I4CPfZWJ
         h74H78Az8TsQFr2pnUK6VhaQqYEGD2MIgpYpO24bx/9ikXIF4ObaEydhfFPB02J3V219
         1rpkqcVrmEdRzANqudWLliuGoS76I1RSqzsnF6+/PkgjMkcJ34ZV6jkx502mDtD2cZL+
         Vp37hjXQBnuRMbwnMuOI0XflcyctVDwmq/prFAOTcCPIIyKP7oxgnGs0oYqow6rxDtHj
         2Dsh8jC5PNmmLJeJmsHN6NTR8t4yVArktHpHSq4NL588SZNcC6DDbtymyMQaINwU43yv
         ynYw==
X-Forwarded-Encrypted: i=1; AJvYcCUicBPVQtSRpqhhqC5K2WiFRDPCidz/BNRiipNaY+cE662IPiZaIsfD83J48/2L0OVMUuJW12hi8yV9BW4/@vger.kernel.org
X-Gm-Message-State: AOJu0YzU9VwVeNH5wE6sDP9P+7GcopTeSZqD6T0afwOmGbKhYDSFy/hz
	i88y92d7OQldxGbHiqOFfF1wLm1DBdx4PmPlGmfWCqE0da4qA9zIZShux1S9d8XnePkrxXuOfD5
	CmIbJZkRIU24HGfa9qPOllqY3ms1IwwhsMzb+OQfoIN1ZhqlEh/ZqqkbjaQY8zhciE+9S
X-Gm-Gg: AY/fxX5m7R3XaM+54XmG0TWgrfpnvDTP13+O1uQFBkpyZd3dy/4qqw33qnVUspd6vGU
	Rjp2RsisMd1CxcSpalwdZw0nNYKOHtwTsgcmDPpPwqMzt3liMN+FUnxR0AexhyaPWo0QH3SOV9+
	bEC8DZQDn6/iO1RxKXnmyqf8javlML6CEsDBF4qL+aXVfcmuWXb9otHQMdykYoJ2yPJjARJ+MXi
	tIr81gkURcBl4goQFdOWgVeLS2bzo3nvcvYtSagj3bgc4H6NXQTVwAn67bmv8Sy/tJruoC+rSnB
	rcHRAiGwl5nYb1RRW12To4HvAYAFv5SQpNxpJnNxyzDl4laQqeYsYS9INRp9tQSARegYkSpBixh
	2Y9WAWN+zOYH1Dlk6x+eqpql1I42bg2YcLK3ytPOKQrx6HXlaYkBl4urVsHmsgtVFDqqRtgZRVO
	41IXZn28a+mxP7MatgPxMokSI=
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id d75a77b69052e-4f4abcf6bd4mr375254171cf.30.1766942509440;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEFrvQBeWUWGNN3K4NBz/4O0OOqfjaG3q3yoWI/L8raTZ69fCS8BqISuUrv8qLP6Fu5J6f5g==
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id d75a77b69052e-4f4abcf6bd4mr375253831cf.30.1766942509004;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:37 +0200
Subject: [PATCH v4 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-5-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y1SVtonrqm+Vkemj18tTHMsAczaNy4uKaP+Hxds9BuY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZgulKVA3M8710WTzVthwCt77+n/UqL+imglvP1WFdvU
 tLLKu5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkezUHw3y7U6W/2AzlY/ga
 czVnPbq2vnf5299Hzepef3uYO7m4ILF8Xvi89I8fTDLiL9jZ7msSvvcteEb+PRnLiywNT65wSjd
 9WTeTf62lRYW4XqEY+45Kz0s7luTnK05+bSO9I7brv3u4i0bg35NH9VqXHJhjoel9Z9p/rWeb67
 +tzj3Zfe1rrcfTwmPrWIX7fvmruEtodQk2Nex6ergx8JPxukwBbtX6s44LXyZtNJSUcMnwsNxXM
 +uVmOy66LWbXgetvPBps3TSps/7bZiFLkc++/Gr7uvXasdZuzsrzVMv650XsZ1VEmztkizw/8mT
 /bwfuevOfPPw4n9Sa1EW36xWF3eYq/xlwsvVkVcsC03SAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfXzrvd1ITcHFr+
 cvFGkcqoggxI3fYzv4z+MqTSQjSNVO4k7uNXRWUonJGQmKxX86UTT6XZlbiCEJuMC5WPfAPWalx
 i/JRMy+tXWcrlCvcxUKM72J6neMcP7FeflCbgdy/NAa7ZNWQVv4M+kuS5JkobDDNkZjvg+PVY4i
 NEuJNqVbAvrea2qvMONN6dNo5QYakGcXlmEoCuubMruaMReHlAFZjfNP743uqDduuk7glWwuEFC
 tANtadqkMAK3S4+qaHvsUNsYh26lHggoDW8WEIaiLJXWjE5e3vt/RNUDFuZEtU+Y99vg4axy1OQ
 Vt04eYRH9iD8zLIHvO3dikCH7rOoXEltMM3ZMUJoAx8JGGUNrQPqWjJ78eojH0v7rLKfpPnb8PL
 4HxeEFbkZbUJ4kRRSxNlxp8X2kIRZrOxGDA21YYHWFVzm9d9VFM3pJ5LvTQANLixRezceJ8q9gF
 zten6drZbdj8iDnJqDw==
X-Proofpoint-ORIG-GUID: yvdUbYx8yfb_xddTOtlQbvgTF5du_RAy
X-Proofpoint-GUID: yvdUbYx8yfb_xddTOtlQbvgTF5du_RAy
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6951672e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae2..64cea20d00b3 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3


