Return-Path: <linux-arm-msm+bounces-72815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4A7B50040
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E1F4E62AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BE63570A8;
	Tue,  9 Sep 2025 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6TqS0/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7953568FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429558; cv=none; b=iIqlVauEPMgqGqm+DlBzqrXjgGGmrABRrfm4avotY2KCyOh/YxvEyCm1oD8V+/FNQnV3LZKnZX0WZAdzZVeCAKM7SP+7ogygWdf4ud+V5NruGVZrW3hLv4sj2MLy3VH1DuaSskqul71j/mMcfd8PxANSJ1jK4609eIaAJJZEg38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429558; c=relaxed/simple;
	bh=HjpahnDv4iWzcOH6N/sbIkmNRnbCe4ETkSttnmvYk9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OxANYPOz8+UqCbDGhzLdOY8f2v+YSsaKNkQIaQPOF7yK6WrrQmy+GeldtpHvsmi86l+0XYRmxlEr4/xnlJZPS2ZWnUaSUM+QKk/yQVv5uP1dQH8dCrfT22ASVuEPSt1ClrWOoM3bX7Abi7L9ZrGH7iOuCmmrq1mUHm5uWmZYjKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6TqS0/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSGN031513
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ujv5iDRR/UPV1fz0cyEkNiBZUtwrZ71AsQeEvESnh8=; b=e6TqS0/ssnGW24VL
	j8HX5wKhyBO4sXU9zUir2ZnJHrVMlNS9axjvKQUU5CtMNGYCXedC6vV84tyvOIA+
	JK0QHyo5ulNlBcwusOcfhes5nCG28AB4L+FdQ0RfNAo9VUvdV8n9d5pxvH+T2jPQ
	fywkM9O728VyETuFjOtXkcS67+njKXk9bb9i7prOjA+2W8ChQvUb6xKCmiN1jP/A
	N/a8zlM9PCHCdc1I4WO3ax+fjXcGUWD1zOmIOrgbQfpVHzoO7vQe5TBdR/GGV039
	ilu/g+4fG7gVnFTOsM5UHbqO/miyayN87A9dvsx9NtJtLcfYOynsX+WZEbNsFQ+O
	G/d05g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws8puv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:52:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71fe8dd89c6so133513426d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429554; x=1758034354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ujv5iDRR/UPV1fz0cyEkNiBZUtwrZ71AsQeEvESnh8=;
        b=IxaPBCx7pc+iiJCizoll/Fl6uS3UHhu0pjgdTBENIKnpvmG0o6AHZPDX3RbPi1LRB7
         PT849OV/Ge/b9kxi1EuqoR9+U91r+NPt0rBmcfhYe7ursJSKWUPFNx/AT5bNnUUz5fcC
         EgIDlH20CoyhlTquCkkv7NmTgsc4uNbzMoq5AC75BmpTur5vGr9BpEeI+XGG3/VKk+5o
         EZfzElLN+iA221q6mPQCRJXmkrZfF5FcMoeBWZsW72ltS7Ly+Z+mkBB9N+nsKWwcaJ+Z
         HcWsf82jxhtq699Q/lti33v4B0ez9foq0g/W4Nc3L7vo9GseFqYWVbx4IRlsmaCrKvAU
         +3tA==
X-Forwarded-Encrypted: i=1; AJvYcCWqwlNiUNnwvJMpHsSiiuTQvlKUQH2FZbnT8UbV13lIpUTgNLAyfbodNRltVikVtBPsxg+25aFfcSNV1ivw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7n0ZycTE9YD0gutzoGhbQIU4GCRMQpcvYSWhzdbM8CvUHIz1P
	vgaGc4gs5RCMC391OGS0bEDsG41fRM4QvncKaWhmn3o+5f9ULKqSDK1l2gspi/ult/DVh2Lbtui
	ZKHKdest64MAIRy1Hy6rBtW5n5PxDy+Or7CkgeyPu0vxVHV0aSuUGC0UZAByBN/xEE0CB
X-Gm-Gg: ASbGncuw/DK1MHkKzq/LHzYCAZneU1A8lvhateUpUIWG0UhDuT8uuoa100YFVwdg9HL
	cQkBBCXi5FKzSU5ksS0JWEettH72Huo04wIyPNCuOii0F+TFEKUAR9gCtS+EQ4XG9wy3k27hXFX
	/WkqA+vEdXgMdSWbI/So6MyC3jB5ryE//eReytNQRtgl0wcIJW+8aBS2XM/L8d7g3B2qmHOGzPN
	K59TyyQuyA4HCsC/lMNT8zDtudQaGc7EiwlHxlws0xOGXSZh1Btbe41DP2e1bNtoScNIl9QRjET
	EHrBybpcms6adSb+XutRDHTNVn/wUE5w9OAUFjhCeu2OorIbu8tb/uSsUCjeCipXAqpHSSWijAm
	hjp2Pt3OiejJc9mAzNoDWv8qr5th98uWGVDnSZCFSdCt/k8C2X8CD
X-Received: by 2002:a05:6214:48c:b0:70f:a42b:1b60 with SMTP id 6a1803df08f44-739313a7cbemr151871986d6.19.1757429552592;
        Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDve4l6s2YkUOUAaxLOpnngg8qoLHCn/KPCMWaHyS1kbKSqT06T75VdGjHUIigW6oRqgflOA==
X-Received: by 2002:a05:6214:48c:b0:70f:a42b:1b60 with SMTP id 6a1803df08f44-739313a7cbemr151871436d6.19.1757429552086;
        Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:05 +0300
Subject: [PATCH v4 07/10] drm/rockchip: rk3066: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-7-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HjpahnDv4iWzcOH6N/sbIkmNRnbCe4ETkSttnmvYk9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8bgkGL4BPgsdX7XjtFIfmizuOXrBZvFf/Oq
 7lX1p+1YEyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1VsPB/4iLFY+wAG/K17zLiP4t3HSa+MqZcXP5RqO4a07Z/ru4qsPjYHy3ln/Unz6WWtPUuxNx1G
 wC1tqMHE4jiYFw1S2EgG8AvPre4CoyRzfdUgObhEzKFXnQw/ykVIDEfhRDa5WEWOwilzd/fuaFI
 dS962/TSUBWayf/8939BWRGiFgvjZWtP9QZXMfAOx/19jbhCudCNqXC5rMsqIs6Mf1mOjK7vaB3
 jBj3G75QXeNwLmJR0vKiteTYq8y/JCicP/FVXezBdGf23AznSXJFG12fj6irgs8H3H02MFBoKWU
 kzOW/5U6TFokImtAkLdGpgoG+/2BrclzIiqxM7qKl+sHWghC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZSuxJEHSOURb1u1xXTVA1RRq_2z_ULG2
X-Proofpoint-GUID: ZSuxJEHSOURb1u1xXTVA1RRq_2z_ULG2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7Hwg0cFTT4lD
 Q9G56bVk6Nq5AfcY6tZyWdGtEJuxMFWW+qAhUniRfj8g/uZBG1PlEaYaVdBueAJidBEE39sN2QA
 m2cmkzu5+CG9/a0usvZIKP9bP/PvUDcbGZfbfMxh6s5Q7hlGIUr9rCjSop043/la1IpvKtKq79w
 pr9PoTpwoaXch7boUz1BXI2f2Zlnc7WiPYcr1U9RVtowSc//tl7PG2lFZzgZyfmxfoQ3gfNhHkB
 9XlYmGSxdA1dXNp2XD3fzNUP0sn4LnMOAsd6zBhpHaULJ1pnJfawD7j9dYN82oZ8RQUFYhjgLYA
 mDUzEHjODrkIpLPjCISEBRWyQyZJ0sxLBkN65JbxsoNYGcy3T5ZkJJDFE64WCcjFoHD7sz5ICa9
 ptS05I2u
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c03f33 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=jPQHZD_Wlk31EOZy1E4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..6ac854c0fe4d155b351821782a6d8bbd550de656 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -164,7 +164,7 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
@@ -182,7 +182,7 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
@@ -696,6 +696,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.3


