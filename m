Return-Path: <linux-arm-msm+bounces-69811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5399EB2CCA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA9C61BC364F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BCD340DA1;
	Tue, 19 Aug 2025 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl+mKYka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD533CE8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629869; cv=none; b=de0mYd7/jwqzKfLfif8Uh9DxccPoZr5e22gpxMCo+mIhddvIW8LYsPLVWuFKQani76x56VRb9L0bVCwO+INF4PmFewcs4F87OAN+R6elv17EAhv1uXbiJVpzaOjMs1oJfg5P4xXPUyeWDcWmxR+hnhiIr/v+mWt/ZqC6WP5csZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629869; c=relaxed/simple;
	bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dprGlyJa1wwBbdX2iRz/2PCNr+DjOvEX2q59TbpRyvuAXgOYEx18zUVKDa9biKE4snusGd+62/FpaLrRzsTxbvDiS3VNTX5lzZSOLrPaWYG40qbb5XS/5//MnKLqUUMW6OltQx0JZSq/7tU+f1jOSVYdpb77oBW66ZVUTYLC+TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dl+mKYka; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHVVaE027026
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=dl+mKYkavx9jfaMA
	pxQZjyuWy6ApkP6xIBIp2SMVIRICIp0wxmhV7nhMBIRSvdjopk9vRHt5CYN5D5Df
	gLqKGiedMLp/PZNbePG1dNhpJjmbMK7kCP/AxuSYpD4fXH3A84UzGAUCQdknE074
	/aRuxQLfPQLqG41ItAlcFxxtg7dYd79jkKqtRnTWPXY1cPLux/M7lHq17viN3ikO
	fah3pe4J3EGxoQ028nhZKqBGYXZlQ2dFzNPrmO0NhDDQ2SFgR7aHouiDSu4CY4RK
	PqERRwTfzdyLIeFEGJD2WRq2FNcqPVCrHM3Z2a1a8/x3vKNyHRonQvhoyckHbAy7
	Mf2yGg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyhnba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ba7aa13c3so178090896d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629866; x=1756234666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=;
        b=hlVdYz1kGtYzaUUbAMw1Pe17uVXV7zmO9U2mbijqt0dKZqK3pgUAw4Gpa9+JL8Ze7B
         70W5P5GPaiQe60Hh43bDbdd5xYAb4sZmWZ4e/UGgTw5unw82w3ToSLKeEWbChfUzMhyZ
         bRhk8AhwUikHYlIbpyJL0BJt2oeFzgPOolU3l/Ml8n8oB1LqAI+z3ZkOeZdzxmYneBYm
         /BkNREmYqUctKg34syBKS/o1sfR+c2tmsRuE9YfOWpIZO45NaClzSMa0CpnnOf+Bkq0y
         2ONNlOZAitO3NnZ9XmIotRGmx7/ikHh0h0iohcZT0Qtvcm8ZmlTYiYqDdYb74qW0vQWR
         BoxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGo3fp0ClA46Tpp7LJDhwU087CU0DrAVUsYhGQ6JkyMXbwajlj5LFSRTE8zW0n+U86QorHX5o+VB6JJIj6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2l2hVrxK83+4YoAH2zQeCH7KtlEG/hAPeIroqsG1GzlI5KTIy
	5t13sxNd6Gk/GhAUC7C7M8A9wG5c0NUI334ucYVbKZlFDNN6V7yzaQMvRprRk6X+NlwW02U+UmY
	H4WgXBOpDs9C/JUE+4hjP6FUh5m/9kiypHkIaqJRikkjlfQHw5vgTkFlQhC3/R9yjOL2H
X-Gm-Gg: ASbGncvngaTQYNfbCSgCEpfWWe322yvIKljXVJJfiqnvt08suJlnb0dnW4uiMOo7z5X
	Kdhlz5VZa/KlGM6T2FRyn1TqMu0J9l4bHTgOxs/6ZAfmA0tv6wS3qTXjHmIyKGCB3C+ghtuxnDa
	Ox/jSkvAUXaBe1O+5D3+mzTtYaOTp1Rwd+OYL99+lwXxZycZ5SlkRLwHHHKpVwappH43D1p/EO9
	4gHzjVA7JUa+zlhJRpjAtUxsInBr/SyV4KrK3rYdcMME1J77V5iH7OvxzdTDanRJZiRCljMOl6J
	KPFec5VFE9NRYcAIkCPm9Z4J2cEm/eHlh35KPP9tpdzr5KnIsQmQfVX5D0cHgnZua3pTT+rUgD5
	jS8qIggmfigQiIwZnHLLWgOWycwnF6q2QaZP6D2rYXcG13+um/jnl
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70d76f1b57fmr977696d6.3.1755629865661;
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9lG70O+e1XTcrpB3s7bSU3peWs1FenRfwedIgpf8VBr8B4XQM4LoKEEzgPGJdC9gGNvxDA==
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70d76f1b57fmr977216d6.3.1755629865082;
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:34 +0300
Subject: [PATCH v2 5/8] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-5-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkc6uAxm7Nj8Fu5N7QPKSrbc88k7ZAuyOExK
 KQwTesFW6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1agAB/9o1aDDfIY8MzTByg+veg862UBNIr6XxQEXInLmnD2NrcHjkS2h3H6hWZ6N5ehfnvYt2OB
 IfENqfzAoXBer32q85PKjMZRz2rbnEV3Q5hRMl3Yd+cLZ+Bgggm3SizKnyEUVEsOPG5u5e/UWdF
 VfWw6fncj22N8fWN4il1qeqCWwQpuYq1BbuxcWHT893G7cCwr+tEkLGlXL+RoeEhTZ79FjIOWLj
 nrjOzHE3F9R212pGr8mYVpoQim3b9qZFOAq3qjoZ0iRNLnROElCCvPsDxxdDhCMEznPjF+Lh08I
 s2lsMKsTVzytn+1wHItHP0kXCQgdfhgPAMPhTPoQ6pC3mpbH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: F1eOuS6nykkCw2lUo5CamQC4e_-COysF
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4c92a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oy62-DSxHemnvxnUzX8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: F1eOuS6nykkCw2lUo5CamQC4e_-COysF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX14pmFC960j7T
 dLJSc0vFNyHyaf/VOaDhDxbk9utqj8wl8Uo8BMfBmrE8R7pbvFYM6fvy1fiMFTjd7SDY2bc1VQp
 LMkHzCXdBM4S5e+tyo7T4ZTrMnIE3+75n7280soIjQ47z4HVZuy4nUd6lS/ZvvU8rPFsgjzVLSI
 9TIqOS2EfHvRaXhZ+UgrjImpPRG5JIL2eJFvEbUQCroZuc1wm252I2aMFhX5IBJCTeMKv836vQx
 lqZj0KU3QjNl334bBnTV6KZCXHZB2Ad0cPTZQTEabFnyG8sum+LgoFQ9+5K7yaQjT7oJPrIw+qr
 qeGPZu4tzNl0Eez0UvcFoqyX6GCNdqv00X5KkIc0twhdXNo++PnSJedq22g9xtIYUKAWBcRLfMK
 1E+ZMuw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..b982c2504a3112a77fbc8df9a39236cb8e625ea4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1084,6 +1084,9 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM,
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2


