Return-Path: <linux-arm-msm+bounces-75359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F4DBA5755
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60BF3381A9C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE017217736;
	Sat, 27 Sep 2025 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZoYnt7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3623A212B3D
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935097; cv=none; b=QLpC1ZLVO4DNKIevvoI9g5rsYlsR48/QvfvGSYWiCK4xni3GcxkDPjuVG9j6gXWcH12aUn9EjqZFuyUYyLVaNfe7LlUjhM4CwxZ0gfoZSotKZhjvXw9Sjcopkj6swzCWoyFzgjrWI5J1dU3eYH/lcaLCxOSGcRoaSH+pRuzCceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935097; c=relaxed/simple;
	bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOCgIDPm6Suzz+0ElJURMGnaI+zM7ewhz8qd1p+SyNV+FAQ6Ler3G9mbXIRaQfQ5eoN8awMc0nd/2UfRWPpeUC6UFI5340hAR2/b6kBaUfwD4OwkW5ziSWqIdHVdwj4tO2LARQlvSzmbarPEbmhEeI6bABi8zhYe1Gjw3NHr6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZoYnt7h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXGQd011449
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=gZoYnt7hLaHJQoqC
	JzECZ9VqglR5tUGGs4UytufnXaEFhcqEIOVgGTs6aK/wVfcTVheCoRVFKMt1Geja
	pCYDwBoVZyNB/MTNWPvGz/JtmJtccddO1DRD4GHyZc3fihkOr3V92U37E8AwS8/V
	pREkBaIAeavpXJuywT1ToGIBhgkw6dNqB57uX3xS8QulE/hETBH5gRJNgOU2HV4C
	9qEBY0P8djpgRXoi8ZjNMXAtP+egDkzAcKHd2dzh8gITc+SEQL1bvZ+muizjnf1Y
	bj1ZCsEGwSy74lxYjUj7FW66XN496M6l4Qf06WrdPR6A7mca74UYrZDzl26JfLzh
	Ld8nkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db324gan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dbd8484abbso33383821cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935094; x=1759539894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=;
        b=d1MAA/l6FVO/QJL3FopKm9ctBu90TRs0+JCdxWDJHmQZJSZ+wbwSPciG2E5Jd1NYn4
         brbXpfw8/+9on7aurjA1DII9NA9bxdZx5ymiEzOOIGFcs8RVTOzATskczsyRByiG/ltm
         wRVFZRFfGvWMOe4A/Ki/01RsMPlZdsvXwsGaAPtA5Vesv+f1DOMsMd14OOBYBcFiu1u5
         j4G6MdyiBB6sBAyu/kqln3MZ0kGnWmUuEPACaL5PrNoYlU9gqz6a1idWI/r/Ag35C4gP
         8ynLLxuU6ID6yE2CVcrpMh8BZxVhnkpB8rs2SGylJKV+akvijJcZSFMICGwgy/4WCIH8
         NC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhwHnkAA4bdeUygGp3Wd2oHeI7zM7HceSAkPQRsNALW1mv78dQYO18crwiyUIfLh/8+ZAZCw8hzJkZVbia@vger.kernel.org
X-Gm-Message-State: AOJu0YyicqunAKaxTTgRGDQ5uSI9HtAi0uVT8kNC9c3UhqW/PPSdDcpQ
	T9lHdjzOvDocF0cvvpiXhdVpszCWSb6zGbhlWPyEdLrv1nq3HVJwmij58be2LO8afHKGoJY31y9
	2OoStBHwvLgbQIrtdRgtJxY2I7/oxvTawzlYIC690jZeuVrReR6ZtUQDNBRinR9c2j/88
X-Gm-Gg: ASbGncuCBxYw6ZUNMD6lefyCVPvDIgLda+bPf+v7Zs1BcYiCBZm8N4gqoi3BTebtCUz
	fCrn5Ozi+cGLQlMEZ1+1WdjU2VYxIEJ4mngxDbAVBduEuDPe+kmEPe0GRzDdyLQHgBfXKlZVKyS
	uxSr3fygQ/aGjqJQXt2PcuK9BO3yqHspt1UB2VdRJHLt5FLy5iMIgcm000qXD1UyuUFiPZ/cZOc
	jrbIs/HGHSR4/xsb4ZwhsL9Xx2KsfFLkmZNIkR2DzJ/RtafavIfiGrKtYZeXEshFef1xZVo2MDs
	oodTlA/4Gecpu/yRKPGvTPN98ByxqFLC9/Ho6pww76MQNGvV1tBQ5Cb4EivaTeAZGzjAIv6G1Du
	T3ok+b1Ob6DKzJw8f9SJk44JDzmJMnBcic5ouI5K6eElj2/3ugxoJ
X-Received: by 2002:ac8:6f0c:0:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4da4b142f90mr128891371cf.52.1758935093972;
        Fri, 26 Sep 2025 18:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCRYZFPLybi3qgiEc4tJcxO1VyFYbxX33ezwhqjsW3+EcQSWcPI5GdH+++nldPjNtBnOGTzw==
X-Received: by 2002:ac8:6f0c:0:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4da4b142f90mr128891121cf.52.1758935093547;
        Fri, 26 Sep 2025 18:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:33 +0300
Subject: [PATCH 4/9] drm/bridge: lontium-lt9611: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-4-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggUzK2RvlXjuBJ58sQp0MZK2qxX9MXwdZgz
 Jxz9w/I116JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1cOFB/4pMZYQgMm5haHVkWCLHoQ9SVONscRZipQty6kqJqyPqWCaV98QNX91eGvhLm45TmM66lW
 UMSazUEX/mcxotqCXzoNpmP8i7D7KtpC1vBVvSDWSgqVuEq1fV1mluRLvnNgiqkwrWc7qQDjVUQ
 bdhwPL5nXbF7LBtbDCZZptQZ6/tJdk3JGtKzlP8oniHvtNyoRiLPZSTuhxFMrVZAgPMHJktdfrz
 j0o9skVk6q910jOxpvy5ZrEXRcgtdZmdXW1d2vY2BUUrt7dTu6TFmybylrGkVpD9i7KJuu/q8YJ
 LD/SCriTfziUQ7jdmHCgSyj7zlO/IZIBF6loTp1XcETV+Ejc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d73837 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Iuf4fpkxB59qu9Bqi9p-ddE1vdqCm2hw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX0hOnOFBSouMt
 blHwz+MCPdU+5zTWsAXrXWsWMo29QAqkk0TTW0o5IrnhlOvXoJiyIwIXLJCnKr5kjQkzgDX5HZM
 ErdMgsOnbwars4yC3PHY3+7AQyIeuxmV8527JAygJDARh4OZRHRVbNOTzwd5OOb4vxCe9WbmgRC
 pU7QbwJZNGqrRHvk4QGQGsy6e/xOSqDrkya71UCiZrFh1BwuxDiqzTBOL6m62mxeegXaD1S6aov
 yHFjwDSxaCwVjqK4oEVsdfzzfuyQIGCHPB4cFMeemm4tLcllFJdpq1EIl6wz5q9mIjdzVk142kY
 N4CikqZcNC1WBT+PdRQP4Vz0u3jt2JoebuxEzM/9RrqCRH3w49l9oLg+hBkiF/iF/MeSfNbUFji
 KotzNYgTQGkpmC4i/LM6u99IbfSp7g==
X-Proofpoint-GUID: Iuf4fpkxB59qu9Bqi9p-ddE1vdqCm2hw
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


