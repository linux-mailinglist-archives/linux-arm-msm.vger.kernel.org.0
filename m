Return-Path: <linux-arm-msm+bounces-75405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D367BA6B25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 10:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75273189537F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 08:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800352BEFFF;
	Sun, 28 Sep 2025 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxJ3zEoX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09ED2BEFEB
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047907; cv=none; b=t4AQU2mZmdfMmzEb4dox06EaP4hBGCStvpB+XUSlQpul5/O4IGt7qEiPS1uXL0Ku1LDcuP+pyla3KXqsVQDezfFxDKRLPtO64Pi69DD8qsoO0rDWZadzoFHagvjt1DWcTxf8ZIxC+YKGKoapdV0Ce/JL/Af/oHv+oEd1iiZ0q6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047907; c=relaxed/simple;
	bh=RSyQmL3DOBdLluC0mSQhrTNOeUIpwQM2CI/HP9Sdsjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jWWekTYEHfv1V7hRS9E4F6/KRiIJkdUJo1ez5XOTX7BB+E38qhpU+4OAP1rtFTy3+w+WFxBKAO97u6s+9szdcdt0SzyBYpCtBeHNe4RbDFEE7OUJEpzB24PB8GLlXPrUDOAmvMLhipRtzHRlD17s/GAU8Pj9uey+oiPYsmNaC0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxJ3zEoX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5SCRC028721
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdzGoFZ5vldYBAKIaUfbr5FtLEdMR0eBXKVSBRB4ksQ=; b=LxJ3zEoXn4xTjN3G
	SQH4Vtq2q0AsIs+qTuvPQ+dRa/vm1wAOkFOy8SYuUba1RRiZu53ndc4LUm2AVtdv
	n4qwjBfmAWnaOEZN0QmdmGgfjDOvAPbwJXkZRM7yyVZp/fionxLbgmuJI9AXSQSM
	o/vfLBOWBuovDrfa8f2CA0yGZ6Wu7fu6kekGx+SivxQa/3gvF92NWMT58OoWFzdD
	AQIx1nnwrYx9VaZiLJxv76sowzdWM3G+W3i9sGI8TMizpb+YlIeMld32g0picEUu
	hOskKdtredV8Cij2Aax/PMmfy96lqLYQAt8o5CRSSF57u63xnU3u08xZfmwen3KO
	h4xrnQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxjdp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df80d0d4aaso28965721cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 01:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047902; x=1759652702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdzGoFZ5vldYBAKIaUfbr5FtLEdMR0eBXKVSBRB4ksQ=;
        b=E/bwfvye6Hv2nQ2TRD26XAMOMJHHOotXz4DZ3jI2itK6xkrm1pB4UUx2RZ86Rj9Azj
         f639hYFvrLUXMEoIvTdovjYYXEgy+OMwbRUA56oiGuL/Ej/pyns/lCxzWxQYLCAOte82
         qxV1oGDfW/s5HATWjm6z/LzkKqssm2ylZAm8df0zQ6t4eEJBSH2TpYfZDWe5EdevTObp
         BD21xkDmc/oR00yR+cMMUSKRwyRQdhfnP1rLGgIoVyq/i4OYklxShlc9Uqb8m/QvNsvk
         BSt+nbL/wGGKuDsD1yv/VjEDaraUqDNmrJg8l/CUjDKZphdKbbeppRhLPuz6bRdrwBw9
         jb8g==
X-Forwarded-Encrypted: i=1; AJvYcCXZwq/yCQsKyZcyMYnrqjsD8+i90QX9s/8yeZ+d06o8MGi8sQZ8Mj2huufXL3yonUZvEjSghsLQLXCmOvoF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zT+CkO4c0JJLXcyTKVjQxnqC/AC5EKt3QTSUY09d/cDrVX+o
	Rrpj3L5xijBxPetbkLcNRiDkB/zBqCG5Uib4kO10zsYgTlT9p4/vcobX3Zx4TucmDIPMAPHR1nm
	oawz32eqL0XqxYc/Qo7CC1OJN5XuBoXGzZUSWVGp+qXV4Hq0NykTHOzL8aTpPsQhIrRnp
X-Gm-Gg: ASbGncuTDSyXKonuHMKxmbq2nWY5Md7Mo6E9rh7frYsIsioSHVLbPXpF33OtYDnXoXF
	GmYhvU+810EL8n2IowkxjiYxftbaHrxLx6WJUi/yHMKeAlr8N2Zvc/cCgw3Tzu3r9EmfWcP9Vzr
	Gd7aejA28C6JJaYUQXZ2eaYdTvnVDJmPG2noFENCHNZ+vkVV3NQaeuTwdYmFBr9Zg2clOL/J+vy
	BBYNY6xTTYjebSdhSU2wffb/jA4SNII9Kql3pdTIKcXm/fJSNqKkQOwza0C2+wYgeJ6Qh3I+zW+
	MzUqIiGV3SbWzAK4J/bc7mUBN/bh6xoV9WZSHVwlxvVUj+APegOPhl9+44OFvYRdithNHuNXtVD
	QLg2VgYrZ7X0k4sPYuiPinEweNSv/4h2OUsQaCTNw099hLOiI9+Tg
X-Received: by 2002:ac8:5716:0:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4da4d220650mr149549961cf.62.1759047902080;
        Sun, 28 Sep 2025 01:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtFk8H4RKfXlQWtvvLw51nsL8yQliUuZJcfQS6snZsdM39Enms7DNwGsz+hvLT3ZcB+X6JPQ==
X-Received: by 2002:ac8:5716:0:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4da4d220650mr149549611cf.62.1759047901607;
        Sun, 28 Sep 2025 01:25:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:47 +0300
Subject: [PATCH v2 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-2-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RSyQmL3DOBdLluC0mSQhrTNOeUIpwQM2CI/HP9Sdsjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTzUzaZJp29ycMmG2wiJQ8CQv6AiE3Huv86
 QOzLbdX9AWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1bRHB/9ZjQ3i6ODCvlC8kHJqQmp+BMbnjHu7eHQ6dlWCRwTGbec8cJ8pUEOwXVArbsB/tXUek1Q
 HgczeUkd/5Yk6k1Fji2tKIa1Kvje94YIVlPsM0F3BO3kANjvD8z/jeiMrM7drR2iyWyKl+erXzy
 17ORLOpVUUbSI1WqursgSTSOWhhotsqgAbGiZWKjtxK+bhwA3yAFucPTQsInzOhaGtxfkxx1766
 o7UfybNWfhI1RVmA6KLPi84+IKf1vS+nsFU/vjt8C9bKTkS2pO8nDf6a+sLwRIuwjsWXd40lkWv
 kWFbjZS8V0oblNyrBSDE9iBEqUAdfJoQJu4ViT33wChiVcvX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 18o9YZKufdrVGJM2VYLStEYajhh9fudF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfXyh7BGkuan40p
 7SGtiagL3CygLfD4v3hhIrOwYx7C3XfSJ+W545NW5SNeU98jy/kd0mXa0xMkIxJ7VFzZDtZarok
 2u4tKQksmKp0tuk8394Ne+o0WkEIYQoBLcipIu8t3AnTZnDTg6JyTedP16IHTTJzPum5sDLnBzI
 8qd9jeIHiK26JiT6SRsoxXuhQkqnxh5pe5d31kupaKPDe28nVHa7eCzlEJADAjHzBJzx3fX18xo
 jnWWZQXBQ+NrvWfin+K1laGAlh6imo11Hckmk1KNtUpuQANhOkhli8QCY8fwhVyIsItup6qdlWj
 vUmwgmm6bwNtrwAB+f/TMEYssqwDytlcohyikRFwcVwAR0MvUT34Q+AChJbgHzTS8Z8R+rD8fxE
 FGx/XJm1PX0o0ciEbGTONoTQ69sRQQ==
X-Proofpoint-GUID: 18o9YZKufdrVGJM2VYLStEYajhh9fudF
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68d8f0e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..241f02143f59322a814b4b277082637d59be7d5f 100644
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
+			     conn_state->hdmi.infoframes.hdr_drm.set))
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


