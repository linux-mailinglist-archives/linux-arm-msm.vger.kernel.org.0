Return-Path: <linux-arm-msm+bounces-75357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CFBA5739
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9B3D381721
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964511EB1A4;
	Sat, 27 Sep 2025 01:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iB0NPyKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4D1E5714
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935091; cv=none; b=JrnIJpEwYjiyBap8TpwXz3jLZ09oU7ev+GR/i+J2fQa1ROiUCV2iRYi2O2AkDAHa1hnaupl8vDTf9CoO44h8WtBeKNodUYGhhrF5O1feJJX9GnWSc0u141wavXbyhlakxfXIXVoHD6kQJpqb0SqkFDBsRn9VXZAfO8hcjqo7Eew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935091; c=relaxed/simple;
	bh=GDJs9stizfNvb2WVbvQCEr8SONIYHFgwY7yHLMQGSzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9oNV53aggHwFGGwbA9fNRk46Wjn7Zcw8olXg+yKSmyBO9wdlw2ANevrRetIfIhrEcOZ8+sdGQv7eZDydDhN1UfKaiirKYq4tjr8MiJvhXVEhS3zaucr12TYNnwjKVxRFhCYC6yraNjuyB8QjYY2Foi08VsXZ5bwuDRHOBbT3k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iB0NPyKz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXGQc011449
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHBvbs6wVCtvxZAx2wHIzn0cwgfPtQSReWo4Noc9O+4=; b=iB0NPyKzQp9RO4/b
	NiUXUNjL95SnD6VCYC2k7DHEXwm+tErDbCYYEpxZk1PGBnrfOt59d7H6g7nRmYoL
	BmNhvjHiVdK5EQ7VMkDkLu1MFx3iMTtnUVcyOjXHy1S1KceI/8/zJim9fzkkXSxz
	9Heb2J2vhyGp3HaFE35jg+nhzBles9TZ809gOX4xZ62XfO5nweoxK6mZfHlQTqiS
	/8Lk0vJn/Ovja2ENhnXLkTeWkzfbe1jQpc93dZ4Q9ZYgM5WfpYG2XXPGl8/pHH7Q
	Lf/dfoi9jcixGh95tqcKkkTLSvfxoF/n/ARMhqiz3JCqI2kGNEAlPKuBWewgPWAf
	miLiaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db324ga0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de53348322so35845971cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935085; x=1759539885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHBvbs6wVCtvxZAx2wHIzn0cwgfPtQSReWo4Noc9O+4=;
        b=haQT2C+OiymxabXRTw5f1C+rzD1798+h+vZ2R6zv2JLBx4JMrBwDKDooAnXRn/Aaai
         T8UwgCPQzQpdIZQ8qLuY36dcAx3x2SIwpEMYTwg3CqwH8dC1Z4mm1jDdxSmzKs4GrS+R
         dT2D3bSQ9pwLaLK8MSE4c+a+Ku9T19TeOROWRSCVJpb0lkzGAt/wPPQdJUE+nQMMwJ1w
         RNKfk3JD7l+44nSn8SOC66urcEumHvjqDCgVF9F/y9/g6z43hX+Z9WUqY5OH292WvPFc
         94Q3tu+eF4z9LxygF1GLYX3WNwseXOEA6yzsJztrfaT1kXUdqa1SNiPonmlxRISVNjot
         j23Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYZWPnw5PSLGNAA2ocj7Mlt5O3v4lWpGlQDCBiLY4abrm2XSzYsnsJNtFzB2qgYgiTOAq9zmIE7MiFq8yx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1146M5ilD/upLLQkNIa//EhbyEB0d6dGs1Lx+v/km0xCL8BuE
	NXyj7KF3qsfJSHsaB5jo3ASfAsevWDB4AopxZEPr6hTrXVjEG0BHKVnG2BMR1hDLobrT2Uq63yH
	w/OE9URQADnOlMnZ3FG6MpaPNHL/2ZyCei3x7uViJtdwJBy6OHSPQWrl9z02QGRrmRter
X-Gm-Gg: ASbGncupMPREeV3Okay490oZ/ZvpkO1aCjFUgabXnVjcQKS3vU/9PRxr+90ctSG2ztp
	Wz2ihpvKEpBMO3kSHWpvjwegjIIizeVzzOAtSpmlwrKpVW/lt9Zl1zs7m32dXKInOYbOoPrqtPD
	mfF/5hNOrJ8g3yJzoykg2WfRCpDqNu0zKmW7qkJE5uHlQOxYzBtZxGREhcj1LGC99HPew6VYfiM
	qw34VTXJhzJeyjRdLolMOYZnmzDWzTC6qVtIkkAeDOlbCaohNOwvF7Flt7nbtlMwF4LknzRGoeY
	7bz3TRyiUQmghSt8x6yj2PhLpwgW0dT41p8DN6dcxB0anlHenQwHjU5zz6EDEY2a8t8vJO/Duqr
	2jT/XWOHdkvT2+1uHroH/y6DmcM3IFeofHJRKGqtiQzJghbl4kWN1
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr141708501cf.54.1758935085226;
        Fri, 26 Sep 2025 18:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDgxekAFYTmTTqmCZefeEPl+nSUzBiwY3LbANe6dbEILxpaj8AQRwYb+0/9qkitC+FpZtBTQ==
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr141708011cf.54.1758935084695;
        Fri, 26 Sep 2025 18:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:31 +0300
Subject: [PATCH 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-2-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
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
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GDJs9stizfNvb2WVbvQCEr8SONIYHFgwY7yHLMQGSzY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C4WwP9P/BahfUM7J/q38y+eoSdQLBoWi9c1+S95+v
 sn2RUOjk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT4f3B/k9v8b97bhIf9U8U
 rWn0L+vfdMc+z9ONLZFtWkd73NlfAtP52OZ9fr5zUayhl/rpazf/lhyvCPNVZLlvN2eaaEvRF7t
 M/RtdPk8PKW1gqT8RmhWS+fDiynlZNom/N/mnfeTKCb/hO+Ovzualbg1512M7InnKQ/p+9Qde6G
 vR8O0/s95ngpGb24U5mc0Vz67N2jhbrCcgpqDGsn7ZwbCKYleeUzyFj/lDhBTmSYZ5q75Wjt3Kf
 Vk1o2NBbWNF/IerWYqvNVZvzdWLWtXKv+is/+R5LVFN5o8X7kjexSmg+/brZ5PqSs5HffbavMEZ
 q1zs5186cY/dRH661Msb39SCc6bVOgZ0nkowVN1rOv0iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d73831 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4_nZXx6ZIrfqYwrHcfbCexIuTKwi_-UD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX7H3ES0FVobaq
 I3sjoH4qOWnpf+Df2iatkwZ/iBukYZ4hZn7SvxretdyakLdIIdHBHXDBWSnHVDUWws5+y/tfmj6
 tFUSGdB6CBh+Zy0QW3oMZ3vFGpiGHpNpfMY4frXvF0q7ZBMT5eNg9A6hC7AyohRYE9W/6Pb5RG6
 M9UNagKVAcDvM+KryP44Dc7puDY0Z20UHdmch8S3GIJ/VmnrI5kh+Zf6tTFdrTxWRUhYdGZB31Y
 3pTC+XZsWNN4PVFvotk+v+NMODTrhQ9ejbnK3/LqV6QE2wO/JRXQAD7DcFf4s909PyRo2cP2Hht
 CLlaJcwX6i77U0aHZCDJcaevlM7QB65JmowZi9K7ZLnxr/dVS10//Jj2tXkmEMEGWydYlV29NU5
 7REHyL82ITYFa+V64e/3VSwxTm0WJg==
X-Proofpoint-GUID: 4_nZXx6ZIrfqYwrHcfbCexIuTKwi_-UD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..452265c2d81269e158c83850279a3a58302faf03 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -906,8 +906,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -966,19 +965,32 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int adv7511_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
 
+	.atomic_check = adv7511_bridge_atomic_check,
 	.atomic_enable = adv7511_bridge_atomic_enable,
 	.atomic_disable = adv7511_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

-- 
2.47.3


