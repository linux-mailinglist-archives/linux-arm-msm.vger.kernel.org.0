Return-Path: <linux-arm-msm+bounces-69807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC59B2CC9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 671B07B7490
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9C6326D62;
	Tue, 19 Aug 2025 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzFJ13Mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB030322C86
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629862; cv=none; b=Ho/49wNDRXwfWcKWf0LDi2Rmx8LikQdK0UQwM+kz0JwaBFlZZKhwVS1U+FcyZGfbF1uFk6d2LsIpUWvFZz8FgJL8/twQAHoAXoK06PEdbdUuqappVQndDVjL4CeZ6etLFm34iy9TlxwvrM7JZgdiUBTB6+OJ+uN061NS2ugizsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629862; c=relaxed/simple;
	bh=ics5UJu435PTkR3N2XAnDPkmPWB0LL/sCgBg7ErLZlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7y7h1qywyKZDb7hCAYuxZucANNZfdHw7N7bm/pWSWST4qpA4uHSCqwG8Bli9CyEdZsUK8pmoq7Ggy1m/dKRjNUqFyxt+l8NhsFX3yNbRra7qViwuQdDc5QI2GGWgx2ozniRo7UmZtMGqs948PXZGuAK5KLv715QGcbBqYuTG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzFJ13Mh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHS2Be023341
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=; b=NzFJ13MhLvh6Bnun
	6DKGWugHWCVVrx8FpY/hRr8H1/ooMbiRryBJkFoSclfqlDk91UnqsGfiNXDhNija
	m2dBRb9dm3qR781HHpFFOnQKhQSA6O4ymbUb322SP3N86Lj7hKKOrw4Kayv1/CZ4
	d5sTz240KODEl/jAlbTygJaarMMgDohV6MrBxXBV4mMJ/PslzOhTMVEsVl343ujB
	TYvn7n80AL4Bxcmq1mHhKjg8KGNiSeaahC1cYLRb6z4unbAiAvEUVsaUt+csbqLG
	mnjCA6a7AD2M4pR2hNlAM5tABWKXAoQcRosMgKLT5HrxqRZoh7YC8PV//NhjIYNV
	X7Vhmw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vmmjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f57f950so121855686d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629859; x=1756234659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=;
        b=tm5/rlBJj/U5s29tGrf8J6E2Kzl/ACIhlKipHEcey0NYn/wj6xQdRUsAFPNh/97ga8
         leIggTmcvuDcJEONn7qT3AUnovFnPASFY8Q1aRGrKfgS+yH1ph36HSzrhTqzJAs+w/FK
         zGpJLWRujqK+cz6wCrpQUPVmyqualYoWMuj+mr1lvXCVnJ/jF5KhIHppLKx0nZxdtkkd
         DZJkHoO+WOuOZpgklL1XzdLVzjHCc/PKdhk1smYzSZIX8ROoTtHFaoHb76rQwc1psHWk
         rWyb8mu4sQGhoeM+HTs2AbLVgKHR2ji9/KD6KOs6rgGeW+Khf3y4pBr3cy19z5gZbftC
         LAqw==
X-Forwarded-Encrypted: i=1; AJvYcCXS9IcxYhvl2DBWz7zNtSBcYXcORTsR6M3YWPL3YIIpC2UL5+22CJQ2cRpRAY4sMVEbHcXPZeCcpgSqXCJW@vger.kernel.org
X-Gm-Message-State: AOJu0YzEKbk5T9Bi8XqfmkUhNnuPVFFs2f0+DGZIRbbyC/glhIrTwpCT
	5723kw0tOETV74Vhf2/wuWoHeenRsHSDlPyb35w8RpfN0dCey/WmuRMZenHCenbfRZKkWjD5YQS
	R6QGMWTRoVlhi/HqNksc9lfzUvJzXKq6AaQlqynE2wputeawACA2Cn9iu5D+y849rdkyc
X-Gm-Gg: ASbGncv+La5XyEJcThg6ba/txpl8N+JjOCa9oK2OQR3s6wuGcIxVF3kmLjwieGMg+Q9
	Sdoz5/I4AvpkvO1rkJKJ9S1MC+ryK46T+R0Rad++Nggd/PKsMvmxumlr+nlDcWkF1SDcJUjZ//G
	dlHwXAuALPiFruvkPEexYO5XQs1g1yviDASFWg88zap9I04k7cWaeLXgDypdzVX2XlnIVMZ6EAV
	0K0Wjq6WVVy8JdMX5poygUIAVYF5zlhSpu4eZ8KgvWTd0MVrhB9Rz7TUucppbRnxUl76Ze43u8m
	5IHdVWUiEB6FzqzWThX5dD+VReS0VwzEOL7/YiCU1mfSpndrNGHlNJbHgPeet1Rk85Fen46N9ST
	07wLhYbc2cdtD5KUI7EhZn2MZq+nVBWWo54UYo0F4y4pNM30wuQi3
X-Received: by 2002:ad4:4ea3:0:b0:707:a430:e01b with SMTP id 6a1803df08f44-70d76f864camr1093006d6.3.1755629858888;
        Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/O/W7rZNwwvVUGg1YhZMXZwis1OZ4X2shsfzNvq0AeHMh3ORjwG9eDWtEMthq/2S8G4RA+g==
X-Received: by 2002:ad4:4ea3:0:b0:707:a430:e01b with SMTP id 6a1803df08f44-70d76f864camr1092586d6.3.1755629858342;
        Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:31 +0300
Subject: [PATCH v2 2/8] drm/bridge: adv7511: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-2-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ics5UJu435PTkR3N2XAnDPkmPWB0LL/sCgBg7ErLZlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkbp/0MMomngf1L19CchYk3PLIvKZT5b3Sqc
 f6uAOG3abKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJGwAKCRCLPIo+Aiko
 1R2QB/9n5FpX6DEBpD5aLDh4BlYRZz+O8I9IOmTSO5TVq+bDT1D5c2WLxzQ4Td4kBMk1+Uu5p72
 3Qxf+QIPoHmANeB/F9CQXl2GSb8D+EPFfAiTZGjv68fM99RgbuaegsAu0O68QJolHhicnH3oG//
 neaovHBHmAtObPBED/kl3uRy0BlRcx0hhOyLx9xzbQ4SBmRlJibWr9zwLUyZea7P7ab+Qm2p0zL
 McKbULlvp0OUS8K+3ajdL40S0JMbYFxygrjTMdABv1d7mveJyp3GI8I9mLJjT4KrSEvy7TxCTDj
 BbL1/CutAHVSKCOEN5VVNxy02M5cuXz0Umc8l126pp2h81O4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX/vLzr/re7POa
 f/Qx8nFrqFWMnAZSYZtYB+kEc7V4FzYK/M3Ngh3MvOBKlaVfZJTO55kaviMLTywY9/0HNl1FACb
 bmIe+pkDGEscAnW7uUX0bGfvZz13BQd3Cs1iTx7YEvqMh3SsfFXdajXd3m5jxJR1YzPk2/jdhn2
 foues5WlIA+U374HMs2ibwgquBEDd8ZgDiUZxhwWXQk/XIPQZPKEQNF27+yVXkC1KFuDQUGVO8E
 UtxZq6Czo3X8RBCLoGAkXUhYOzocpNWCx3n1nKD8rjeMP2QUTGzcJcjzlXea1xkKqRP/4lAVpcy
 UDFGy0hne82S6ok+gcu9hs0BQMOGXRs9P6Kp7NiPN5TCKN1TplUz0QEn171kSy4Xmo7P7NXSur+
 csKPFXf9
X-Proofpoint-GUID: 7kRj-k-txiN1IecN4iAKZTHIAzan34Us
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a4c923 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BPUVXzEUzielt3HhGKsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 7kRj-k-txiN1IecN4iAKZTHIAzan34Us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Audio infoframe is handled separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 00d6417c177b430cb1a81118800588b90c692018..a9b2757d7a2cda1064cbc564cdded429056dde0a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1269,6 +1269,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.2


