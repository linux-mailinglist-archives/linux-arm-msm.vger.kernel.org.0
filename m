Return-Path: <linux-arm-msm+bounces-72812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0165B5003B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBE764E6651
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372BE352FCB;
	Tue,  9 Sep 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KguWA7JR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98352352FE6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429550; cv=none; b=lxSjHGdX7zmj02g04MIz2lRAhUFBl3JITe5m47dWObPgTjjCiztcY+onSraM8evZSfT1tHJOLlu0Q9/ILmJU6c+hDXscztmMR3tMfbOmqC5O7Nh8tO0zBM+ooR07917s/7OiC9TD2iu0sgL/m6ADptaJlaxdyvfFTsgInV8KxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429550; c=relaxed/simple;
	bh=Aq2mDEHmgp1SiIn37OLqW93okHrHKspB826EOGNpiU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMJlSjil8WG9N86otwLhgcs5lt0pILv9KH+7wOX00MOFHG8ZckCZJYsIDwtP/2/AGdmBAwIQ/da5LTSZ7KMmZCuGjBOWgSzG63vFRmzztEDuAiaEwrdZZ+V/DOjPAxZ8rVk4hmtzyBnW5QnEjUp4W098xjKU23eSPYdnx+VHJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KguWA7JR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQwm029766
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdVSeIKuXTDzsb1f8YtSPNgLNA0VYyyck2+ZYEf3zp4=; b=KguWA7JRiHwdSubP
	gIgUX5U8rJR9evqjY/OTKPWycFLytfleVbA3JGx05fJeSXD3vvydeTWKz22i+pBd
	JuYFQbNhLbrnJZnDJjMkqNtTMOxstH+8A92uqWWw3Vs79nIlSufsK50wv/MGonH7
	MNKOUI/ayf5VG0UijxTtaTt7KxTJ5j0IN3FvF4gW2x0GIiL9jffURHxo+WmeMCWb
	p6kbZqrnQj1H3NOT1ARpzJ5mFYj8KZwPyPUaGB0GXAqEv3FIAOc2cDjtp0OnBZXe
	/rMUikho++7PUVS/Ajssxzic3MbohvRDyedLi1TGyRxB6EWqv75/SrFaYrL0OFqX
	Ws/yFg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37w20n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:52:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-718c2590e94so157521476d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429546; x=1758034346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdVSeIKuXTDzsb1f8YtSPNgLNA0VYyyck2+ZYEf3zp4=;
        b=Keo1jD7FUqinjSDrJcx/MK3DrqAq0N27SeE+MY+gv0vXHIEk+zU/JinDeec5PpSDHt
         8PiDc5ww3AfZxBHPY1Nx3ONsEdoHESKS8623N3+8VVY/KhiGkKdQzUxQVYwxVd29iDWd
         mUw4BmUsSXLcTA4fKSf/az7X61+ivZXRXaqr/Ix9RmLbgadgS0/yY6Ii/tj8h6H3jd+w
         ePK1Q8fUjNRGLZ4WzCdKiP5mv/NGYJetrw4a2q/KL//MtlsC94A9kEL+elIvZjSVPgri
         BGqwmFWi707Bf6IITRNIGJyZPv5mEu0w147qAeVMbKTTBsjt/JqHtuSC9hq4i3FKwL+u
         b/xg==
X-Forwarded-Encrypted: i=1; AJvYcCXFV+l6N3+Xdmh4Mi69o906iKaijFjafoWFaLNaBmIFQ9k2wXQmpQrDbB6Td6gVqRfryPB6D7VfJda7C0ie@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp4DLu9dHIsyu1rdvHfP63OOftX+ZvCkQYffY5naWG8MdK/nOI
	4TxVXOpv5RhEz8+uXzEs8OkNrQjBXleC31qU3AwaszKtJ5ME72Yk0jkkuR+HK+P/u1Oz8RJE3ck
	R+Ad2x4VVkxNbqTpIIohsxpgePk7A+dBvhzqJSVLn9G/LVJLCXK8Xo+z5jd+cap4l70cP
X-Gm-Gg: ASbGncsVWU3etbFLrZnbG0ZEQeuWCNpkuZZIJNX6vPbE3e/UeQEhha6x6QUelcaE3Dm
	VWhp1gbnxKDxwBxvFt/3TxsLGZSm+0F+/EDc4LEJgOuJ9Rfm9RkjZKxmsufYWdJWHBSf3S/+7bd
	V+lJ4pm6ZHPBLdXwurAHjC/PfYqCcCDbNYGYQ4xRzSgbQgpt12CDtL9PLfjcc6PiPSJr0t7tE2z
	wSL6wTHv1pRG9Cnc/jQX4IVbkUN91NZKpj9lgTej+WcCulzsY8c7HD4ya082hJqc6VRgd0bw1r/
	pwrZfMWOSj8CXhkcYO2n1Hnl5KUFu2kdNXL9xiG9yxsmL5l4BJqeEXk7oBisNq8hhJ1bJhWFRK6
	YdPtch0YN6YzGwold2Dotxq+gJnySoelbMfbczSDvwvaSsPif30k4
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-72bbf3fb0b1mr158064556d6.9.1757429545962;
        Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+0czZpNTxq9KgOE3QwkI3s44ERVHWu12W7OPI2XDlhVfpfdH+nJD0CIFl4aY+6gycdCccrw==
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-72bbf3fb0b1mr158063976d6.9.1757429545199;
        Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:03 +0300
Subject: [PATCH v4 05/10] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-5-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aq2mDEHmgp1SiIn37OLqW93okHrHKspB826EOGNpiU8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YBe+mkx4yTHKo7u9dMr8stfj3H6f7aW3MzQnfyHjz6Y
 d670FTJTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxI6J/X+ugGhLp7fzDxHn
 IluFvF35U3R8m2zjXqrUcp+8eGctR8zvKoEMv2huvaqa0C7Gmw8y9KayMcf+b54ZxjJ9U0rci6M
 HOQP7WjLUmt1lLnvpam+r5YpQLJ2Xc31u+95Tl7bdPdhbN5ujXq7RXfdt383Ud3UfbCZtXb/O+C
 b34cavM9/O9Z2vF+Dte+1uS2qCitekI3N5K9f3KzX1h4d9U5ALsLZjvPhW3X7rwx1CC3UX998Ov
 5zOOMFx5oavPjJGdaZuJ914O63uJvJ3lNx85rzc8VzqX9ljM6/n2OsfEI+5E7Xhyq7lFyXrIufZ
 Xc6y/mFx495BzWAPF8GyjP+euh73dzUVJq1vuf97SkUoAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: J5Rk_8UvLTVfofgPD31Og8JV2jbg-12p
X-Proofpoint-GUID: J5Rk_8UvLTVfofgPD31Og8JV2jbg-12p
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c03f2b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=vfAEGMZ_7ZOHtlG3iVcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXwIHQyEk7TsWs
 7N2dBwi5PE5V5obr7gVjLL5WA4mWPcf+sMSyAV7VBABKC8PHnnwKpdMaeKmprH+eDMdDyimK6P6
 O6D6UU9xoht3+ej4hv/c8HSxdyXGk9Q8nb/XopLi6eC5zg2QXgvBEsPau4+/wAqJysnAT6P9OKB
 YONZpOsJzr1hmlFbeKafXKAXIYcHWdcQef/0avSUmRJe7cA3NOx/m+iogqR75vkJ86kslVPfbfD
 2fzv1APVV7o010E5HMs+G8YcMen+wGs+INGkB/Ud15Vv+Md4safBrWnRPwiVT8ZzxJgT2vOYdqQ
 bU1F960KzjsxQFJv0qd9zvpLFAR8fecPPbIBYcbBr0VHoQJ9cUhDp0fhB3kfbq2y8yo+4XOVCO9
 +HS+LQAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a195c479bcaf112f67b6a2f085402d0e33896de 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -936,6 +936,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -961,7 +962,7 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -1084,6 +1085,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM;
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.3


