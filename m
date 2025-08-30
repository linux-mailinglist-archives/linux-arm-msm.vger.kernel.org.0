Return-Path: <linux-arm-msm+bounces-71263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B7B3C627
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 02:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 410A07BDA05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 00:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AF578F4F;
	Sat, 30 Aug 2025 00:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCtz4gtJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39289481B1
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513389; cv=none; b=oumHaB4ABwvqG8aN3QTyOCXWACeOpZtpJQOw09hD5Zpcq+CoyAA+BZzJeTI+CxCHtsueXRkE1NFuo56WDGThhwH2hJjgoAbn3qt+2jlM5jnj1ctdw24fbTKAY3bT0mpy0oVOA23JdzKUdWovLXeQSIBbabkzDCphXcTfTtXOQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513389; c=relaxed/simple;
	bh=q7eYf8+3RQX7ESv2tHgdRnLYQ1j/MZwxzLEz7NwM9XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+Aseq559TZY3bPo5YUUc5oNJuwIRSGTFHsvj+mS4hRHmCFZOXDEl3QF+g5LGUMs582i5aP9ovF1f1zP7DUTngcNDmlwuaG/5oyMEmBkMGd86ccdw9/wqgD8wyfMzlH8j2nc0fKcMrWVFRvB+nBJ1NjwhiT17/snxrjbtXOF8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCtz4gtJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U0GVrh019879
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EC24O8coXPxIicmmvFhXHG7RuMMbE2/IeNTru9ezMlw=; b=DCtz4gtJxTkhOa/5
	bgoi8G8kCfWOYQZKf1bnpFYsbO7z1XE+zqrSI8B1k5OLYGFCp92I5Syd9vprgipI
	WapoLgN84xInkHmir17aYOfrY2PnHdsalVYFR0FtH3CtFLu3tZuIfJ5qGPRHbyTV
	ISI+UZF5EnPNhifJjO3IO7DokPGK7/gx3+t0htTE1Rl2NG9zKd5dfwrNTdjIcdTV
	KxrfBkuz0j1e9CMYXZWifYtN2BCfmwAlv4CVWPEZLbAc82r8Gwtn5GR0DfNiHsLW
	wt8l93QTnd4VVRgCZxA74sRRDpCo46WJfwQQUOxKeUhTBmqpi+0psjJBjcnNfJG2
	VDn1zg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se1746gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2f7851326so70907861cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 17:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513386; x=1757118186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC24O8coXPxIicmmvFhXHG7RuMMbE2/IeNTru9ezMlw=;
        b=TvPxbpo9VHAVxHFtcNRQqx8jh8a/5iU6wWbkfyoseRJGMeMiv/FhyFPHpUxn9TEsyt
         1EXANsatvtE1lag8aR4RjaLYk7C1AMLlnmINkvZcvvntBaL43LAtKHnrGGTt9hoB4fAL
         v3LgaWUjgya+M93OatYIrYUJ2NuxPAe6W3XqKB4o7yG6Z67YgiGPyGODnra0X8Q/moBD
         9QJEqBfW7YBcsR7UPVgH9ttPq78iwOY59qvBTwWtRGWU2oeEQhcx4qb/Qz87MdT+ozaK
         csPHQPcMXHYWCczre5IDX6p5JNqgTCcLAprrIt8I2Yl7Su+VPzzZsxi5zwG1Fu907nC8
         ajCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTni78t6pLZtaXiD6PiREh1zyhoLITrxCwi/PkX/7EvSpCriDfsfdAeftnQfhhUvuY39cGlxKviNGc+GQZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/DdXkSlUC67rwsTc0qfsMbfwbEzFMrvzN3r4iI/ob1Bu6Iy5/
	MvExrdtL5cTvL6MC/NPLT6OUDCQq4ykdT/SEoDnWhVpqa0KxWQhnhsyasPgb1IOgJc6XonT35zi
	D2lstPSUsjmj2qmtJtJFS0OkBp2NWq+qNpHxVxLzHo968B6C9tmooD0GxBOKQCnq7VPxe
X-Gm-Gg: ASbGncvJJE4PwoHZDQTcT1cYK5se904Ojrfz24E5kvjzIoA8bzErVlpv3ibNyt6sWph
	GjsTHxCXoLKZyyvDSifpQimbvowrZ87k+jMcz6P2+gparEo3n7lkK90lsSw0DJapJYsCsIACq8B
	lr6JP5gZOH7zmSxViX2dc6aqD1l4ht5bIMU33R9FQ3qF8Ab0jI7mgtOsP88gn59DpDSW8yaQ3WP
	jP6J12tFN0ArUFjEfPZFN4TPMaYPVQOminEhFXO75Oc2akiv3bFBaNzsEXSo8WXxRzKX1UPeVE+
	z7HVn9/fEI7a6YVX8BMYRqBdM9vrhxnxpRgJ07k9tdy6DOVepi/Lp1Z4u1sPBE32FR67TEpP0gx
	TuyKH1EJuXl0b4q/ZqNupx5cWxE7Du3+pG/hJRs/IRcLLGJ3f3vJ9
X-Received: by 2002:ac8:5884:0:b0:4b0:aa5b:7c6d with SMTP id d75a77b69052e-4b31d8450b2mr7951161cf.16.1756513386119;
        Fri, 29 Aug 2025 17:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJMWSIAIjCYp1lT9McTj9bQ133h50tPHm6nwV01Yh4DnXv2EmLSxcQOP/1n5kMYt9GTSTzJA==
X-Received: by 2002:ac8:5884:0:b0:4b0:aa5b:7c6d with SMTP id d75a77b69052e-4b31d8450b2mr7950821cf.16.1756513385504;
        Fri, 29 Aug 2025 17:23:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:22:58 +0300
Subject: [PATCH v3 02/11] drm/bridge: adv7511: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q7eYf8+3RQX7ESv2tHgdRnLYQ1j/MZwxzLEz7NwM9XM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjIMzK+I5pUhzNv/gzIuu0qrnQQAgGGLA/8
 sqWoDGr3RmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1X46B/4ttG1//Uf3yzHz2UVvm8cP5B96gro5PvEoK3vjNCYja8hOZmVu6v9GW5CkmnOb+3jEy/A
 F3O2JkCE9qbaSinFwCxDG2IviHDn3R2MSLm0Oz38JU3THj1JqiqN9tkLVzqGWianYbVicOFDWLw
 ffgaoAshYzXH5V7xc09KzxsPqxBXnlpZraDTgrv8ahuF/tN7ra1jWUyA/Xa06DhQLj0cQZ/mOdT
 NVO7QobdWHWByEfRjFJEbZhhBnXbOVtNPRvwF3NyvPQcEcFZGp+KzxZI3EoIkBu34mYwHoNE+d9
 BT4naoD0RmK4tSKFUCczE4M+TIsdHkuH61/HLPB/sDlW+nSz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZNzjjuvvDYFBJ0OGUGIfVO4xtSsQcP1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX6p6KLeXIeOXt
 Et3NPFTEf1kU4hOdpIWsCBrjsL51H/izU+TPQdO51npLTGJgDGdklV/1f73gRo1RrmUymmVwU3n
 0TkEn6LFhuwAtLjJclLuH7mwTW548Uj0thElgsK830rxt155hFTXUsZ0NR/4iYXGmGHRUNwM1sa
 EC4KuPsSQv4jhIVw0U5Ht54bdL1er9xL4mIAOwI3YieF+1sGn2xYpOFE/VaaD6ffnQ9U8sL9SKS
 nK3RYEfpC/onjKFfAkKR54/XHYKb1bnJ1HGItMLaIAc+hoKerS3DeihDtsmU76tyv40asj6fqHq
 xt0aS/Lh335jwVP9cJNha0psDGwNZQuzMvpoR6WjzfVPeALwtODuUHXjIcASvAEcQURIWiumW/k
 H5N9iLvB
X-Proofpoint-ORIG-GUID: ZNzjjuvvDYFBJ0OGUGIfVO4xtSsQcP1y
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b2446b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=4euzTov2hVyL0VtTdw4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Audio infoframe is handled separately.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545ed270665e692b12c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -1299,6 +1299,12 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
+	adv7511->bridge.autogenerated_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.2


