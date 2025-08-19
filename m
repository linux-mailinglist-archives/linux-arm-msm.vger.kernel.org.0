Return-Path: <linux-arm-msm+bounces-69814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB4B2CCB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 21:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC907B996C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFC9343209;
	Tue, 19 Aug 2025 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjfZLcpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06444342CB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629873; cv=none; b=PHXkdF/mYgcQvaSmc4xML7vq7qHO7wEnyUUo7N6FEquST7Jx2kSFeAKwnuZNy+nSiRyte6Iw5TfiMHTiS89HkRO/Fe5pU2rJLeZKVqVDkt5RYCjiC/FzYCkiV5iqf7hKH7P7Ni6Cx9lUxrjN9XHTgvtalDipvEaUWn18aAc6FK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629873; c=relaxed/simple;
	bh=7deMFPHaCP1tEuAyd0wqGDyMbbgXRm8M3x+yrKhIoqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gV5dueAvbwxHpUjHJURLvIFVWkKLo0XPoMydP7xM4s1jfFokGRpJf6OaS4IJCDPa5i/7JilUv88sZHO1SCa4KJAVTRdAIY9mymv1HcHZiPnJ9HqOk+gjUOjYzWdH9YA/h850OM253SnDnZ6garJswBz/+gPkq4uT7sfmmryCVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjfZLcpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHOEl7001874
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GwwcuTSdQf0vvJ25qV2FXPYXtLSGO4QcuUbd1Q+beKM=; b=cjfZLcpa8g0ZiqHC
	za6eFtectx3dKHteVvIWF8BgkDa79oOPaudQEWmqVCwkJGUEvUQNoPIPRmWTF6Fu
	bBQYe694VLPDEk57j30y9ygejpQHTYmeKORc/hHvmeeLaSKZdws+5SnJXJXTIg/T
	7eJZqrCGe/BaRVynTOMv3kTFuHC6aT+MGyH1L0Uf5GRn8Ky2W3TBnl4d8uxaD08R
	nFsSK23dqsamvItlmud5LPV/FrgWTSeLxTGHf5EMFpn7H3W75oIkXxFtxChEhpjo
	SN4JDvPaGuSEOWmDHAlycxa6De74o6ORg+BcdAdWmpsiEJaAiCnxEbiv2HQMT2q7
	iGu1cQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh079n4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a927f4090so129308856d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629870; x=1756234670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwwcuTSdQf0vvJ25qV2FXPYXtLSGO4QcuUbd1Q+beKM=;
        b=JSVSqU1LSxdYAqObesQRKKUNubWpycHXs+0Z2y0Jzs9k7KRLkZ7SmKQp2thnG5U38o
         5q8V6l6Aot5q3xeGB7Pr6Vta3SKuBEkwyEJqkeUsW0u9TqQSqg+0VmBZHTBbABGbExt7
         RQX5omZhv8WLX4JHYJ+0hrQ64NlmTGe6SxseAvaJG6l9VHmAlfvyvt+3zeSOXlLNd/2F
         hOjY6ly1kZLOzMrTDoEPYZ7vMQt4Pf8WijJ2pP+pihw4ljV+d3UKvRSvf6Dk8C03iqbR
         /5tp7DVc6uGoPNrySK6mkclmza2fDQ3Ade+KwwrQe3MwVUHk3WO1ZTowVlOxo/8EZawm
         q8gw==
X-Forwarded-Encrypted: i=1; AJvYcCXAN39lMoLyS8//l6lB31o9Md1oxLgl6hBtj1XVO0GeHuTyCKcufVlx6u4wQw+N9C9ZvCRR14vxIsjTckJ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzMEaY51iYzx4zbpJ5xSO5pWcHGOj7arNrQpr0N1n0pERIHJFiv
	wgeJIE+wy5iB+BTYkCOx4HpwObUcOKrpzJPE928WQRBKz2BpijqSMKxoKidiGF6b5NxI2AMJaJo
	83T4E1ONKV9Zk+UO2O1EZ3iajIzNDZTt5f8UZeitmCMjeWN+3DCgk34hiX8JhHnbgq7yh
X-Gm-Gg: ASbGncvpNIH/Yvr2dlhBfD2faIM31QiEA1ciJ51e6TMUnJZ0Mi/K8U2xLrtBwRjjzrH
	QoxVNuxghyl4iKgIEzN1I/PwFqVuS0kk3oGk2Pp8msjHeOrDrxr0YmHMYXH11MwoYSO5mR2pCAT
	ihsEk4x4dj8kzYmQyPs9UUPn5EbM4a2S+GPNDbcXDDK8OF6LmUxmLELHlwQaHTv5W6+Zzrhy4aA
	JiOXgt8RtQhQrdEEJgZXjrLMnDDd9XS5vUuvnVS7bcgWAKWkUYJaucfg1ujMqiK7OpNktkPuqkB
	C98T6hcpxWVW5FIOfa4va2y+Mg+y8OAewt/Rhi4KC8n6Rt9ZdH9YwxNeFyzoNi09VJhx2ukRt5r
	dkdkvvqmMqnEBDWVgbhggQuMJx7Ecfw4Lrru784YIWBshK0Grfghg
X-Received: by 2002:a05:6214:1d06:b0:704:7df6:44b4 with SMTP id 6a1803df08f44-70d76ff7ea4mr1292656d6.23.1755629870127;
        Tue, 19 Aug 2025 11:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgeB6BspkJmBzVZghKuKkvMQsrc7yh47pgRmrociqcAQYwZxD4o4UnSWHYlSHwPmGuWLNsBA==
X-Received: by 2002:a05:6214:1d06:b0:704:7df6:44b4 with SMTP id 6a1803df08f44-70d76ff7ea4mr1292266d6.23.1755629869609;
        Tue, 19 Aug 2025 11:57:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:37 +0300
Subject: [PATCH v2 8/8] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-8-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7deMFPHaCP1tEuAyd0wqGDyMbbgXRm8M3x+yrKhIoqg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcfIiZrdP6T1yKBcFmYUYjGemOpooWhlAir
 XvwHx5bmkCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1dK0CACnaQ5P4qzpStTan2KFXA/Co+l8yegd9ipo+oTCj+eykTovOi7mhcG8CZnOFPUnsGb7kQd
 LyZnJQugFjc10kh2vK9lA1XdM4Cf6YI4WK8B7Ve12p3KmEVjnHSYroGza8IHcOF4nVIIrZnfxuo
 weLeMloZjk4ugu8fgJcuYuxcnIpUN8PfaK2EcNwyeJoxv66YrA1H3fQ8A7mfgvlIQDpmbyAhrs4
 3kxvNmJBPnkUKfk2FK+O4X90ktA0eTQdqVfe3mRMeW+YOTxjWtqa0eLtVMjV5QTjc1Dwo9CK2XG
 PqllamKjHCM5PHS0RBut4Mcu0qyvmLtxANCYLQWkCP0lKqND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nLdMdcuGxPugdLlTmaOqP0WBxtY4Dk_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX+3+Os/VYpRo9
 3b3jJOUpWlTg4B5GOzIcL2r/l9txQGAioSyWgBs/w1cMDV0Acbc1Pg8K8Q8taV1gNgQ7JoVcDsU
 n3JddCaXzQ21LVAfPV8by7BrtQzxgitVRKOzRDOLDHnpIXor3CRPUnXwzPvFJtK0AbscK0iRDUk
 A6x6372Fbh2VROsbEnuEZQs8/qNkI1sLLwarwM7ZTxFxtbXCXryxOr5dHsXwMnp8cH7XAhtk95k
 8ShpptDdY/53Zv7pOVZTOzBaNMtwRTy7NMkM1GQLP232Cj/3rToKkf0DfQ0mporpBwQS1fOxNyF
 sKiQM5LeGwsJt+9EvWTBsCjSv6/u7ibJA+yXqeM0b7/emKx1DVgBxy4618FxX2RyD8o2w4vKSW7
 SkVT1YOL
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4c92f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=98uy0pNEvqNMg_-Oa9cA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: nLdMdcuGxPugdLlTmaOqP0WBxtY4Dk_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index b94458d5faa9ae283889fc79496ae323bb4dc88c..047fb6276e9d84de39718cb65de72ba782bfb3a7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -781,12 +781,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->supported_infoframes ? :
-					       DRM_CONNECTOR_INFOFRAME_AUDIO |
-					       DRM_CONNECTOR_INFOFRAME_AVI |
-					       DRM_CONNECTOR_INFOFRAME_DRM |
-					       DRM_CONNECTOR_INFOFRAME_SPD |
-					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->supported_infoframes,
 					       max_bpc);
 		if (ret)
 			return ERR_PTR(ret);

-- 
2.47.2


