Return-Path: <linux-arm-msm+bounces-72814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B31B5003F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DCB25E54AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ADA35691D;
	Tue,  9 Sep 2025 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlhjBKE6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424203568F3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429557; cv=none; b=SGSOXVnBY9kOG+1aVHUQsto0wIntujS2Y1OoZRD3kE2n73D597h1L8Aaz3z6+jgGmILeY+/N0Wr6cEQH/X03eyyn85mSllWPaHVWmIMu1wZ7C/tu1/MGticOSaAkcWTCkYsyl02cW4jlhZV+W8RPZxfJqXxsF0jGg8GhdKzibHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429557; c=relaxed/simple;
	bh=SH5p1NXLdtPpRbZHLxmXRUJRNEhWUgJZ/FZhGKys6U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9Jhge3ZkHDDqQijzZLLwqQA2nNOe2NcqbN88nTTRV00LI5O2QfO8ZKJGgcJJtW5eyoD3zxbxdhm6oE93wPAi+LdpJcyX5sfPXblAlwtP2ueYGjL/8nt1SvmBbiTef3ILwW3+JgFPdtxerhPlUQBykn2RgCMAUewrlC/r20tEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlhjBKE6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M127002266
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AqxjcA7v9kQUHsW1dWHX4LPd+nTqAg1ssnBO5hXevIc=; b=DlhjBKE6vXrJs7eF
	/Ui+StvzdUKZ5fYxSLyNpcJxGo+zkaXklrif3Nr7+EgoHdEfNgbCcj3VRKDSBngm
	NwGtpxq1eUc5oJyMJcVnhydxdcWM9UCv01QJWRMHrAJnWGYd+tQ3KTqQoZlCv1KO
	L3HlGgYLVuvx5i/B62w6ulRsPYaK/4BxjsXISYjXwg0T/wwdC96XrP3jptrwWy2M
	aIBLZGVh7YhQ4mQeenJdK661KOiQ4sToqjxDOZy48fj/i1bpTZ/Tb94+xt+Psdss
	oYgcc+CsvngX7nnMSzqby8cYWdZahm3SUZ/vAccW19867zrbmO9G6Xtr+IRV9tiS
	MOoJ0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0e0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:52:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-807056330b6so686968785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429554; x=1758034354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqxjcA7v9kQUHsW1dWHX4LPd+nTqAg1ssnBO5hXevIc=;
        b=MXmUUSNtKZPh5RJaQpb+JLy3mmYmCx3IRJO1Kq3LNyjj5I4P0fTTNuUnLgiCYJ2U2v
         NZ3Ioz1MHYCKJrDVwRCd+n40ZHEeOv65YXE5YI1a28KJ+pKXk+6mbQsUcIrZMyH6coun
         Ehs4Czge5o/5+jYybfuyYuIDoHLI1NT2rT/kbSY/kT3yVTlJrHZ5pE2Pzx+V6pLB+EbZ
         RQnDViL4B6VrUq+vP81gvVL7SyMa1/upT6hZ46citxtWCe4QZgR28NWj+bWeFQSJ+Ko9
         bv3HqwXGVqWZTtdobpcBQP/Vocfdpp2N09LmrN0aAEhMNtIO616kAr0oTJPGd7PE07L/
         OFfw==
X-Forwarded-Encrypted: i=1; AJvYcCUaAv4GCL/kxBw2dsXOOMGR/LWWlJ+pTSwQiiLK3AVesO5SG9euiDkswP5rrk1msPsAaMgu7iDZViJ8oCII@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0X0tVWO4FnCtX7q0rPWKLSP7NFGSaAFR1L5xIAJfVBYTHoE02
	KxQLTnb3j6+IlPn0xOT/uSHhp7BptM1+omMH1s7ce2wOUaIgQJ3O9ZE3XjPbshH3B/opHrD5pJ8
	DTFIQR3P6r1btV5jcllx4DZtMFWAMM7l96T94INWtAkwpJzr94YgZwLiz0vjOTg8lt4xt
X-Gm-Gg: ASbGnctoSMWwhnvh5eaJoM/HYMGDUuZo75lG56auo2WyFgP0Eu1vA4gaagdjwUoT+4H
	yM8uQJpJOh57HkD8N7bL8foe1orl1xsVeA11Bp9vXivK4lcM6vBeS19IJHFlDQ4FJWY+dXQi3lh
	VQO707yVXljr5bfPp0lfcPPllaQaY8DG0KzbshqeQ+/9cP5CPjOg1eY5TNNSngH7SY9+IjsN7tC
	5SH+QJRG0v9P7qI9B3T9vH9PYjm+1KxP6whW6hOI7Yfm27hmxhYw9czWeT2/WDC9ca/RPyPEVDD
	Bs0x6x6LzrApjkKoLqSLCJsW8Upq7ftYyPZbVLVxCE4PhYXDB7djjFODKsH38Fc/qdeiaK/QxT6
	8C7c+nJW7bfB4qROohmNO4KvqHej0YSeVnNjUEV40gJYNojY4PG2A
X-Received: by 2002:a05:6214:21e9:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-73924e24079mr131514016d6.16.1757429554145;
        Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELvHh+YLlPgh4Yd5dwaizGOKRDtwIRu4dOckQfLSj453ZKMPo3ZARJmUDs6l5WC0UTNyT2YA==
X-Received: by 2002:a05:6214:21e9:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-73924e24079mr131513396d6.16.1757429553493;
        Tue, 09 Sep 2025 07:52:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:06 +0300
Subject: [PATCH v4 08/10] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-8-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SH5p1NXLdtPpRbZHLxmXRUJRNEhWUgJZ/FZhGKys6U8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8blvrwI5L8dQHSUz/xZ6GHVeuDdbZGULZMV
 WuEhl8+3y6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1TrPB/4iqW/Wm2SYljGHlxILyUx1w3ArHNHCeDStNLT25ZG6XUwvH3rLYMRzQQCcX3XYeP9w7/n
 br7LaRGkE7OOakFZ28SR+/IG8O9407EpzXyWAjNajt3AwRuXMI1ceXUB70WoQYyiQ2p86sx2sD8
 rk96tIGNTj+Qk3LLtNOfFhhU2mKk8vZ+7IJmun34/LLVdMgr6WGEYUI0HHvcXsWauvVUd9QcMXW
 48EwXLxeCxs4iM+SI02SHlOAp3svBZc/AL4f0u89V/Pxi6cQuvVzavQ1SrBcuQHP8kYGG5WVMlS
 yLTVNPBw8cDByk+YH6FlumiErNCqzW648OHti/7E+XtKyrw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VN87qyKFrO56a0i2ZoW1CTI2idbZqAfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX/xReZXypVnEo
 JeOWJz1ERtoIAcoS6jG/NQLItoaT4yE08clYlGbjoJ+NoFklFhjQQqLBxRhhgo03tm7u6eolN3W
 E4Sdbr2yCktNOQWHIFJKIdq9wuL879RpLKEUgfMhVBprCRm9R7/8KplTZXnmT9VkjesCaS1Gp1t
 HZ1Gr3MeXN7O40O1re4HUa+dFJPRwAe5SEA0VmGARP+KtT7w/gzpY1EKUVeQPNjwyJmr3Kth71M
 HhsHihJNCsupcyE+1YgkIkILhkFG3Gaj2/V6++fIzP7+tX1Vq0vuH+tnhahwRC+Cx3IVT2RSuaF
 Unm7MR5iarB5+0TlOR8GBDkDkQ6cArTSnSRMwrPj/QApyPvcTin7+7PwikgWvSVoGkLhePHcE7R
 rCG0gToF
X-Proofpoint-GUID: VN87qyKFrO56a0i2ZoW1CTI2idbZqAfM
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c03f33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=uJ1-o3tuYwvhD5ZCdfEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 55bf5ac53739fda098be69a5c61e4934704ce046..05dc2b61643af5316df431a3cbf53b86139a63e9 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -783,12 +783,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->supported_infoframes ? |
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
2.47.3


