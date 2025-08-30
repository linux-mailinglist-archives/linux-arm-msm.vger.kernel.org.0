Return-Path: <linux-arm-msm+bounces-71269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B183EB3C641
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 02:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FE6A273A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 00:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC041DDC0B;
	Sat, 30 Aug 2025 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7uh6kBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9C81C4A10
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513400; cv=none; b=NVrrsEgGCnksvhACzZ6Sp4MaUKC0cbWWe5kkpulPGipShSnr4FAumy0uQPWqP4VICDNdtKjkPItKx/64PN482ov53i6qvdnJGLiUS/sJsY0//ZansSi8L33gnBzhbuSJLg0PsgqEhW7DKs8pQAiw33b48Va+3CaRF10kGMnPyi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513400; c=relaxed/simple;
	bh=ECUd39xCRDayMF07yZPid7frZVCtdwJ1DNCpnou818A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqYIVNXbXHZdoiu+6cQ1qEn/c7OSjBt2ToO+GmvpVpzT9exlvbKxTmXQyqZNYhSXZrubDwGqb3yoRfgJ+nbeanD8BTqjVeyETY2F6WEnTBqKzyJu1yPomi/YibGtePrjrf1DuxqCXg/QPlTtYZl/yKUX9st9zehOhCRN+eiRV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7uh6kBb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TNU20l003554
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nf0+abWmGCJST77+Ob/lOwCJuYhA6HECShYvSo7oZM=; b=D7uh6kBbblxZW9vJ
	AQO8arjsTAUfNxLenI3aVXaXtb+11BbgrmB1CsxpHrPwQdS43XAwfzIrKq+kezth
	j0GQ7nGhM7SpUqwR2cPX+XWfVbC24Ib5B7YwoYmATkzJY4gh8J1rwzi3aFyH9Ix+
	tAJCELg4AuWIOal/7AXKBIFsw1i4bmBWQMFMxyji7h6Ae+XVjBEjjf29BpO64YmQ
	6Wxm2TSFNric0wtJAfepyQebNkRovHAZTKwmgsL8J3FPhz7g9m5WwjFRN1Y+peAo
	YCMJZg046hFPxkrKymnymtVULik4qmEuSipYKoKOjpZlJYnHLEzCUmqqjwjldwBz
	WVeqDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k546j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2f7851326so70910201cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 17:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513397; x=1757118197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nf0+abWmGCJST77+Ob/lOwCJuYhA6HECShYvSo7oZM=;
        b=bBliRir8rBUEj9QePI2wD6TyZwD7i9Z5kXQx2f2IqEBTSgynM93Pg8uxhsp7SxO7Ia
         bfgyJYPz4z48bjFjtFX6toiLb3i/o5ShAugTNv32CSIMAYQmQyUfqoXFL52lV1RM2ILE
         33Ku9jtibZL9PLwwWN9hd8gDSpYtCkMIFmxPO6U+xZr2ym8r6M+rNDvLgNQUyC/z+jkC
         BDz+lkZVupWD6QVv8MRn/GZV+DrB/AC3BZ2daWFVjET/ZsFDexcrY58ZDpTWVl5tdWK4
         sLDDj+kHhsA9fPDhJHwzlyZljsIRJoeoiQgex+dh0aGGPbhwXC5LuAECVRI0xtoaWjsf
         3PkA==
X-Forwarded-Encrypted: i=1; AJvYcCXmTq2b9oQOnHKEaZWlsN9sHbz2W5SydZdhIIuw5a+CyaK8hm4EdSZYVwJGmn5e5HROSx3Jnfq0Tjoj2KMA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp9eaaC8+uuranjT/8ZazYwWvQp1Z/k+vEdOoyWJPW4RFvtVhz
	aW2BE1LjL/7MCwWFnFomEz+weXkZcQaeR8M83CcRzkp+N5KPj9So/CLjlBdaU4KrggM8M4Ue/ve
	jXcWZkyfPcuvhi6lJn9KOQwefTtd3cXAKWQxV/RlRexj8UDxRKI+aPc8EWXtEf3kkMxED
X-Gm-Gg: ASbGncsMjQ41vAS1pIBgl+BdZ7RChfYYvr1aRebXijGVGXC6psl7kxlYL+I6oexUS77
	Zpk89FtLdej4Z8pqKyTJG7mmLas5KAlynv7qXPgacACme9wtpr9c2Gd2dIi2AqmiOjpWluPVVT1
	kpArEP4f017m+/y3P+PtdSrwDaFTMjM9B1v5QjpphU41J7P6NsM5hN7ytM0rRHgXrFirUukZDrK
	t3wf4pdxgYgQBvBktjecRCKt+TuqfBflm9IUXFV2vuADOhBP15/sDkr4DqeUUnZ4RL558hFODuG
	zqTJQ/wHnYp4cpWpN8XzVeof9DOnd4ndInzVeDTe6FLjM59wmKdhDA2a+8tbFkCP6F/dI7+e2Gg
	TQYSAgXewaVrKuP+TQLPu9QyKkyk7k/0+gnf7MBb2JU2Uv4Gm88lt
X-Received: by 2002:ac8:5893:0:b0:4b2:967f:cb4b with SMTP id d75a77b69052e-4b31dcce3aemr6287421cf.63.1756513395140;
        Fri, 29 Aug 2025 17:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOls7IHK5n71gLOims9R5oXNm30OZQlHiNW3nK6iLa1qZum2ksrrXODlblb3ZuRNvP5SOgkg==
X-Received: by 2002:ac8:5893:0:b0:4b2:967f:cb4b with SMTP id d75a77b69052e-4b31dcce3aemr6287201cf.63.1756513394655;
        Fri, 29 Aug 2025 17:23:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:02 +0300
Subject: [PATCH v3 06/11] drm/msm: hdmi: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-6-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECUd39xCRDayMF07yZPid7frZVCtdwJ1DNCpnou818A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRkadcPsIT5VtZsPUIxt4c7DuFRHVG0R9qPC
 e+hnmDKZ1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1XJoB/9uSIvkAkBHEdynP5Np4TmqF25QxdIHnyZDZRd2oMA6beg+0p2vmu4j8T7iBPLH6wuOfv6
 yuy3KGzqXY92I/wemcHThKBJhM3F9irEXV+pLwba1BFZ1tX4k9erRi846J49Ao7zWeEP/xfmaPz
 81ispd03TPnsUvWwua6/x85ON05f4ECTHRc4+QUmjqTUB5Do+4aS6kfHip8DmrVdpbiYpQEZcDY
 dyZgO9lEnPsSGc+YkPsQmyKeuNdrMSHxmoExrCm2VBYq9CaceiwABEYUbvXFk4YlFDv3aa3E0R6
 LB4x461C04PK5YUvWfKCdrT6vT5Mwb5jFjWe5xU7iIbWVh5W
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b24476 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=QemjF6U71Mh5n78GOpwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX37EPze/31mk6
 FbaloO2sCLRXeLdzWleLTK0valmXk2uU+XdaKyDwoM2L9L3OgIBofSGQqbN708uPxHjBN+FBEqS
 JYToAmneepkoFM78onfvtdLtAuDqoMo8/gcv9GHvyseu00ZsHXwj83BCeNjcYe+PR7R7YS32gjS
 JOut7gHHtTXL6Q5teAl2LERpPnGaAYeSvuQcM0ac0XHK+xnX8asmLotPx/LRbP5As3rHilmar9k
 0Jq9K250SnhamHFhkOm/piYEcIC5UJwKzAXma+PphcWFRFOJLrCjxHSxaEZPnocELlKVCJAqYcK
 mDrjZBi+zhPCcag40Wx+njdXrxWcSyf3peifrWuwttX2kgRnWiSR5Q9h7+rb52fuAkyJOWtioQi
 XaJnetzf
X-Proofpoint-ORIG-GUID: 36AEysDYp7mW2YjTJ2r3vMStkU0-Kxg3
X-Proofpoint-GUID: 36AEysDYp7mW2YjTJ2r3vMStkU0-Kxg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..9dddc0e47de462212d42f3ff1012a073b98e3a96 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -249,6 +249,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -274,7 +275,7 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -498,6 +499,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2


