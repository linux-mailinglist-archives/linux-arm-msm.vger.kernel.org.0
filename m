Return-Path: <linux-arm-msm+bounces-75406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A229BA6B34
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 10:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1F93AE98E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 08:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A930E2BE7DB;
	Sun, 28 Sep 2025 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIz9ldXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3322BFC7B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047911; cv=none; b=uLnRUBCiFAs5RF1RmEv7FPeuQ4ukFKvcTcQm1lQbYqiov3o6llm395pVZjCMlAFaCxw/OcmLFuwne9Fln9HB7pmXxu4oTPqBnHvXKe0EBqu4Dx//tvvylfyAau67DWYd9zrsoVb7l9eH1W6lEqnFhGs+2KVj2CWGeVNZm9q/bmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047911; c=relaxed/simple;
	bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrkSTk+RxeBAjiS4NTO7zMYb+eqiEWZO5ndNOAbxoJnAbjq4DF4D2Wrr+KxcPCarVWk94FtYfE+vfqyWHkwbqEzt6vM1j8F4rSl8EvmOWZx6+u3EHHlbFhvqD6l+AR8Xm2eB/GWCL0uXH+7BeC/HlMI8Em5etA2jQ3GnG6UFSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIz9ldXK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S506oQ003538
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=ZIz9ldXKvoza1vyG
	ANGsG35rbrWvSDEKBZx4T/x4TOfq6xaMBz23GKsPXm2lmhuonqnh8t9C3QEBtdi5
	Y5ehokjmfi0VWgmUS7ZGZsHiDt80n8wihAudBicKlSKLXgqSvtIq0eIDddewkvV1
	/oGw1x9XiikZ9SpykzOG7FBfsfT0ScdLYie1l0/YZDRMBIqATBGhXyNt7VxZR8VJ
	+GqUrM6iUCgAcTqlN5IwB6FUL6hamlb07036I7Z/jO+6eRmpCZrxfa7ntn1biLPG
	TsNjal6N2ANv5GbZHg8s7cDTDh36ltat/Lc1AmwgyX97gGMoiA8VfdT5UHCfak37
	wKCitA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mtrbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d7f90350f3so81161151cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 01:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047908; x=1759652708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=;
        b=sYsABVDSuufYevhXHLjgeunnMN35cqeSk3iu8PCyvVwnBj/vS5TA0ddYvsIp5k/Rb0
         PR/Nxn9+ls8fxfH00KEYbrHYCc5KyJx0UVu/WLcWDmj2dp0r1uPI+sTWtl78CbKQvL6S
         /DVv8erC3YKiornomVR9w4VPOJuA8Y2XHVaITJmkYExzp+7B1v9n3+Fdsijg5ewghYLx
         SdqSjXFdHj15tAk7RbBhR+mXuP+sb0opcLmjyzNrsDxeVpI0FO+flA4DX9Mv4SVGQs0C
         QNzOMvuc4QpdpxbpYKiyah/q9mV5+gWttNkXp6trA1L/aRsjmuEFWzZ2VfYtrBJbrzbp
         N95Q==
X-Forwarded-Encrypted: i=1; AJvYcCX998s8+BAAblQ7ka+c2YJ8qdTXn7u2i6vaFRMXGTrKDQCdTy+EvKFTLrJQ+0ANKonZzDDGNjvbaMPx+yel@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6TAw1bPu2BiMZW12YVN3CYRz76zvQxkp5C8tk1eyvd49p+c1E
	mTfyPAL0J6EbezDRVDkyh+tL3qYRyEmZe4PfI0WU6RGtT9D7b+W5G0pd1MDGA4NC+CG3NCqfSGN
	otaXd/ashDwE+EIwDWksQWXwN1YeXvkO/UzKieGEmndB4G2RW2/N93sB6CmrV7G3WWksI
X-Gm-Gg: ASbGncvz5DnK6RssZEo/hPRlFXC940IBO9LkWZYlYzsPSecI9fGtYUFhmFDqHOW/SYQ
	fN51DesVEXuoAeWddtz6OuZ4efBUAAHybBqGw/fit0SFecaapaRLQt6mPUtvtMnbEJ0Si+BDcxE
	AxOd5LduJMBpzmIg01VrliV6lpAFvknN9rZqyN4GvBodBxJFFsSJMsxiFWOE+12GD83EUBLo4kN
	SqI3Mc3tHjg9HB7zG6s5bDi/v2EdJyp9CpgRmYZyaN7mBTHzIKzbtQzJ2CWBczf2MCzdzXzo7vK
	pRD7mCP0gycUSNzdsJDWHrQ7WDLGpThwUEK4zgi6ZwIE4mDQhB0slfFoemyTzgLQ2E46uSvZqfj
	CqjZAkF92VrEbQRG/iA219BP4A6fVtLQ+wV6xbZTOqYnKxJmLTTyA
X-Received: by 2002:a05:622a:5b05:b0:4cf:ce43:540e with SMTP id d75a77b69052e-4dacd52b2cbmr147456331cf.27.1759047908262;
        Sun, 28 Sep 2025 01:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN9pzqLrHlVaT4nT/ykEhCfOzipwXQJ0cAoSSpI3n4X55LPnP5fq5+qWz4znjsC4wVWkA+zA==
X-Received: by 2002:a05:622a:5b05:b0:4cf:ce43:540e with SMTP id d75a77b69052e-4dacd52b2cbmr147455941cf.27.1759047907687;
        Sun, 28 Sep 2025 01:25:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:49 +0300
Subject: [PATCH v2 4/9] drm/bridge: lontium-lt9611: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-4-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUy9QW8cx8zEuP/1bnwMnUwSTpxSXwf562q
 iouLsqfJZ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1eqkB/9KIeG/QwkAeQapUIoOZBz8PG1an8ZjgLawL5OLFmRHTAAt/28ma2YWfxkvVXFuHp2gFqB
 6H2nPhVwDQgUsa2WVpeglWwrkYP/1kvjunotI+ERAR+OCw+0OBi2bitZ1wXmSM0IWTuD7DO1Z66
 t5+tIsQQMthkTRVFZfg2Nd/U+zbzV+JEHdzi4IpALFD1O89IF3UwLMzDk+ZYuD4obZXJOW4SSTH
 uG0kMLdfzCJPei04ea9Sqfyotj1bxd2cklXPqxOutI50grHGHYzvKiZ7ak6MxVAojOSlxTtAN+5
 e315w88hSpwX0p8jBaoDtUUgKZyKmjn8DmAEKFJzzOY8eovY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: t2EqHdkMLjpkJks7NE2HlUgDV1bvbNSQ
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68d8f0e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: t2EqHdkMLjpkJks7NE2HlUgDV1bvbNSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX9kweglktsVRG
 B6+TUWNPXdPUzgL1UkzQ5HeEEe9vauNTuwNHxhzJJL5xLyZa33Cmli9T81Q4HCXXGtH9VkfjYzP
 belkjWjqzaxB+ZCi6027pel1E7JmgW5EOL6zR5+CU2tTePqqFGB6bJSLSqzvoXM2j0uyW+GF1V+
 qlpvTXYy6Kbmc7Edx29kAlYDT7RKIsny3mFnXe67v8HE1v5zV2A8BYnNQnP41d+scxwAqIxcLlG
 Bcu0Z/9b+cIKrOO9an5iIKrT5tDJNaOZFQpIe6LMRDHH9uJ5Jf2u8jt1XQ8j3cGupwnljuBBEfo
 IZjYLHUnmtl56I0zSMe3G17tYPGuZr4v/wCjvoJZ4tlN9Ve0GRWUxLAK6zsW0TPqnv0Q6xrZ9Zg
 AETdUSdAVa9WdIUwSuZ2ADYGxMebUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..9c2c9887d2d66968eb1d50544a257d5999bbdded 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -869,9 +869,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -910,9 +908,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -925,6 +921,19 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static enum drm_mode_status
 lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
@@ -993,6 +1002,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_check = lt9611_bridge_atomic_check,
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,

-- 
2.47.3


