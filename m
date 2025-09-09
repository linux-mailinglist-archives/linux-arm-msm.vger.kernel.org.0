Return-Path: <linux-arm-msm+bounces-72811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7168FB5003A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66EA31C28489
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97690352FF3;
	Tue,  9 Sep 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izj5++eI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F41352FCB
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429549; cv=none; b=Tq2d909CNg5jss9LXHD5j0eZu0zPdngr0Uisaj1cgGzs4Hz6xJ8z9HFzxU19sw1tJwMJ7J9rdtgfWQMJUqFZm85lJvEbc6RBivHz946fcoZzLDIMdajmw/WIXNm4DCdNt+Y0GNc1ab4ISQd913rfM4P+aofsXoUlR/hZrRfV9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429549; c=relaxed/simple;
	bh=UHf2bwt1HahWYSjc39yV+lZLDN/VOziYH17k6fxHegA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOpZYQSif84j4oJ1YDQjskjxeHm+mgJIJM7nH2/PU9cs6Q95QeI+k3q0mn9dUQvdeYxk/cyrlJxfnYj0UuN2mAn4RVkW1PNqcxf+vOViVatLITGPe5lBmFG7CbSC6r0mZui0CkDFbMRTWwgT4IH10lj3KjyLjeBoftkZb4CJd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izj5++eI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRWL029818
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=; b=izj5++eI83OeW3j+
	lV+SOwHzoLSPiRWmCo73yMg0KmZZPc8mkwAtdeiIcizeR8nnTYEd2RCNYsY/w0+G
	aAbUTV6DA0kcfHdnH2UDbpkG34PYV22/AuSu/mbo8coycZW4c7NUqKbRO/rnNACl
	CG7leAvrXzxEjqhBJpxcryG0hhQ6J0wl9UHv4aZxALseIugZuSuT/BFqk9fYy0/a
	DXFeOxIGBEunloPcgtLbqavURcRDcM9NqmXGDo54C1b+A+0XornFwhs3rZpw5cXN
	KbV+HL6lCeDkQjbBw4q7CNWJ65kO0fspWQdy/tUmfgh9OsDJrGKnA7mfFSoMJwAx
	elV0Hg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37w209-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:52:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7211f13bc24so119851996d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429544; x=1758034344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=;
        b=CBPs0SpJb5M4mEEftIF+8KMElh0WNvH/xMgQYZRApoHn/trVd2H7njRgh7B0IzYB3e
         Vt2ESn0OgnCJavuDa3PPMVtJxZAcrcN7OBPPHT74S71J0SG8ytOopbd3Mmj50MkoqjFm
         XKtOUAvum2kbjsqsG9ZygMwoQkEGD5Ke5zSXlRTAbMHEEQsxNkF3VMCIE3TDmnFV+96m
         9H1cjtYIlW/ScRyGqnteFrHXunyx00JN5ZH0YoXQHIYq20K158PhCTAb3G4az3mokOwb
         +Bq8PGL4jbV60NUnwx3F2yplQ2IHlb9/Tn7XQZP8r/KeS20tLIv+71vZVh1nIo+Iv23E
         Lrmw==
X-Forwarded-Encrypted: i=1; AJvYcCV+mkzLhNTMa5cSkwmCx64zOU5AZa1gSOh67Wl6dttQLsgda0Ge0F4qJ9nUeIatWkGg9dbxhUNxbyXLX30k@vger.kernel.org
X-Gm-Message-State: AOJu0YwVOhThqqrMeQ4WcqogMcYDHWyDf4yezEETcuwK5BLdXpOySZPw
	4ZjwmmZ7Kz/ul5JO1pamey/M8b7u5aRk1pUjmXHOlT9x2phHm5RZ7Gq5oeDd4JkLlFseq4/IRYy
	wa/cvxYM+zte9SSKEBnT7ZOu5CvpNgPC7/oWniNIfAgfIKcujrRDJr4CkIH0LcF6wOvU4
X-Gm-Gg: ASbGncvbDJcp2UeA6D1Qm9S6Js6IHabjBlIE6cNGYGKPI/OsPFK2brv/0aKAR69zoWR
	8RW6ai0C+hwqrMSWgZdPdotuWk4veveRbNYPzMN1F57v0ZytYYTlVon1/+182oG588QjipB0jnV
	ROVkz39e76l/IXkv3Y5EQXhZxA7CQY3BZ0JZH41AEDoxtSvQXFv8bVjcL6H7nUT8wh5IfvJJoEh
	ij5lGO9hHmd5a6wCseREumyAinfQnrRV9FtP9Jq15vOADtVNkS4Y06QQi6DitNYyZ6pdeVqUh/N
	Z9fAa+78xcIZnSDUg9CNmNVujVwYoAwT0XhgS5TZG4iQZR7m1wcosfJEHhMGVdw26mOiqyo8DhD
	D8TAek1bcRFM+mucYc5GHr7bEwrYSEuIk64zsyP7ntTQ4q34O10uG
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id 6a1803df08f44-74112df7c16mr114471336d6.43.1757429544073;
        Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3qcUmc5HWgaItJBSMTFOPrjz9C1oV8lSQudH4aunMS3xSVXsDfkPrjvpJJ3ZzD90MSTY/GQ==
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id 6a1803df08f44-74112df7c16mr114470966d6.43.1757429543548;
        Tue, 09 Sep 2025 07:52:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:02 +0300
Subject: [PATCH v4 04/10] drm/bridge: lontium-lt9611: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-4-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UHf2bwt1HahWYSjc39yV+lZLDN/VOziYH17k6fxHegA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YBe6mOiGmmn935q5ct0cr/1pS1u83FZ5P13mkK/k89p
 azua//tZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEAuTZ/2fxTphaase6a52x
 1oaTii/vV/TfvytiaMfGldjbGWgZYH9IRNfivDu7klVbM69V5pWcToEHezsZP0/Ke8Hklx9XWGF
 U1DXfrp+78se8z+v/SU+zv7VzBWOSMmtrQ39OtLml+TUW0xclu5P0Rbnfbeq4Ulpy75r6FrNT//
 V2rdsewHFOepogxx6zj3PP9zLlhZXMUJPPvBa6tJz147wmyy5XQ0OHuEkCc+5a2om/3/Z4sXH5r
 pczrnzn1GcPfpmruPKrveGz0mcMv9qvrWzr/V4kzrPWtsBw+oHIu9LLN15OlGXwdD8mHFBWveqM
 UK1S4KQ6xZUsB/Y/zVnW88I622/h77iPW1/HpF8J5NsMAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FKc3NwVc3KIuT3oXWU5HycwNm-rttBL6
X-Proofpoint-GUID: FKc3NwVc3KIuT3oXWU5HycwNm-rttBL6
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c03f29 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX+wFyX6a9iOh+
 2R2gqEbnuQRGymh4XByoMGOwvCAptaJQ6Iet0EjGEItgXAvqThydt1AWkuouMBYnu/MbxJQ3RcD
 BV1D0a40o4CT6+D+p9ZjHTYKJlu64mw7FCBKppigh5RuPYPMWIXGqJWM5k3ZrDIVySHcLYMkPfu
 4CeGJ3kSklU28RpjpJgtCYxcf1NY5sVDBxBop0Oe7sYL8Kx3pFqKg0lv/gl0uZzjZPS7+rZQdVb
 5LYbqmNs71/h3zmXQ2mPeqiNZFJpAcYJvF6I8WoBpG5whEPMNrz6MZP5eUrnE7Nb5pNNbqojEUl
 hoM3uz6lWreN3ge0ZozCrihUOOsBaUYd8nCL64L3yT1kTFFIy36Kd5kzIm7yOsbpZY/NIrr5Toh
 csKlL9Pq
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

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..019114eb343764dbc3da36ab02d53ece11f46adc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -870,8 +870,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -911,8 +910,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -1136,6 +1134,11 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.3


