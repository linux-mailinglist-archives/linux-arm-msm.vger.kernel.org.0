Return-Path: <linux-arm-msm+bounces-69810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12618B2CCA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F711BC39B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE7633CE9B;
	Tue, 19 Aug 2025 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktGvIxX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3032254C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629867; cv=none; b=RisVShvJtQBqGjsF0f/ZANubPlXp6JItVmZWP1S3nHm2rAOpI+l6EfdXZoTDY2WIqbMjG64XyOiKV6Kuu4sXhLzHRAp3tC4WF/CtUfUHJkafE6BE9epeSxSUeKndv0zrjdhdCWnahmYsZV/wxOR4ggqnXyw6yXWm8gjnVcUpIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629867; c=relaxed/simple;
	bh=6MDUGd2gCI/EsaEXrxZU0j17Xf9/Klm/EGghvRMYY3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VK6yq9MwJ7oKXpEPz4VJJHUCXmB9W+fHN1y2oKAHLsnhwbp2upRd36jLepr/uF6Czx1jw3jHCR7zQlFO3tVuRTvUqxUPdUuMT8EOIhCmVNl07DTVcEsQyOWAPTJ/Xnop/Rz8L/YZFmO88IlIqver2NBAgbR0MiV2bHr22Pjxmtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktGvIxX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH7m6o032373
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=; b=ktGvIxX3+a+kMRf3
	gz/jHRN9U197zjqXpZZ7YZ8G+x/JlXuA2fiSGoRmVgL7WZb6sYQpsm+zrEXvx+hy
	mnspKlHaAJSf+g1dWF3F5cooM9VxiR5yIhQQKfiShIkwmbwV+P0wkbhOPTE3U/Rv
	chQFJUKlx64hG3evIoUM7dFV2TUcd4oW3K7W65bIcDh8yc8dWRW64TgMfRCs1d1x
	DHzm9L3VH+uZzolr8RvK7qsjGhLQPkMbQrIs9r44Ne6FsvkyN8R6YWcLskzKIhGQ
	6dwqZ5RIt41yeqgg+vrBAOTJmkAasRsoJPMBue8blwIb28pTz4uGPnemmA6YF1zR
	Kf0+jQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uhqag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88de16c0so129310976d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629864; x=1756234664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=;
        b=dOHxvHMG2Kf2FPGDOIfUW+uRbn1DDXsh1uxCp3LbgM0sdJW8+m4cPN3cmmDR5ro7pO
         pTG7+ZZSM5aX0Q34ErzAsKzt43MgHEDd/fYpoCEeAXWb6jOt+JeutC8V19687hRZuZw7
         MLansmAaSog+tcrmffX4eYDtPhU8MoRr/QoBpxcfNzqVOukI2uQzTTO2RNQ0bduXXipj
         kmhgNinpVgoiFsah7BA6RMXt5cFdPWJ7rcsgVeK/y89cCKRq3hUTVEVIea5VTFFQ1yYP
         8ifA7+bVji3mN/YJkaxrmr+wQ2Q3v0YJMdiTlgkAkdTs5XivIHITeUEKR+Zc0FX5UC9W
         ZmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkhlPNnA5AgOI8TsU76rVuAJtXtteS69nCogcBiAlF4G6xRM1JEgkHEyIbslvri+jxydO7fsyqADnwpz8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yye2Zfl6Dcv86kU/H4ZtOcL4Syp0F3m9nRHL1cBpsNa5QyeepzU
	mt0YN6J/1x5+xOGW6ihGaU0bX9450FeBs+NYp4jAKjUCVwR1vNGhYJEfLqkqhsEWBvGVSE5I+eh
	chkGh/p+4oGb43naWUUBj7huqQk2ILtf7xcWfXQTkNIjnfAHQYSJozUZM+hTLPg7zldE5
X-Gm-Gg: ASbGncu2p0Qvthure5b7n0Bjb0GOrL6Ky8wxS5E6ZDPxS7Xkj61KS645p7QJES1E1f1
	oORgIRoGKspDpdFmlaE7dt2gcwfCp6/yxJmtmvjCXJAuQs1wINzRpaucZU0BJ6q9y9HZ4CY/sq5
	ce2ju7gROCAezjAItF0CspTvn5LbXygWy0eypERTftks8hRiu0a5pMi7ITrqa3Y7xYT335r41Xk
	EjArGioA55dMT0n6oHtsIB+XsRycl3igij23S+CGyz+no2QEEJb4fX/zNoPZ5zKUwHlImgkGrMW
	r5wxT7t2ZRiQt7+9AbFwFVKhAAUUSljSUPGEu/an1e+7Vq3YR/ePWBC9MUzgT6fteOzjDFp7AgI
	wC05p5mK5wLSgMz8MWCD74ZqyoiETCRyGyI3CPhaB5ws1EE9IQfIz
X-Received: by 2002:ad4:5bea:0:b0:70d:47a1:cae1 with SMTP id 6a1803df08f44-70d76fe9438mr1113446d6.23.1755629864188;
        Tue, 19 Aug 2025 11:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF43ghZ/MIpeDfbreZXCz6hnP/OCelyHPwjCR6LgbsWovNptiXgvN36/qqCklN5CrzagAqqhg==
X-Received: by 2002:ad4:5bea:0:b0:70d:47a1:cae1 with SMTP id 6a1803df08f44-70d76fe9438mr1113056d6.23.1755629863654;
        Tue, 19 Aug 2025 11:57:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:33 +0300
Subject: [PATCH v2 4/8] drm/bridge: lontium-lt9611: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-4-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6MDUGd2gCI/EsaEXrxZU0j17Xf9/Klm/EGghvRMYY3A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aSkzITQ1nce89WS/Y9MI2V1Mk0SPCPC++fUsMYqvw4v
 GepeXYnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbCHcv+vyLZxnbB1wsbO+xv
 1qo28ix0zo++mb8okuswxyWh/3xVotMKTuYf8z6zjeV1Np8N32v/V9PcMgrOatTnvj/sF8jVbyC
 Yr+dwTFb+3N/bp7jfW6xT/Sq3c0/Xse5fX0qs6ndclFiw9+RtNYmksPWLl/2TX9K2SqclvU/h5q
 FNtS8jTszyL7rlUr/ZNVNMfe4piQT7Lk8uji3H5Xs4V9XPbn94lYfr90v5rEIHdZEvxRlrNsyUs
 nzwwyrYPkkwaZtNT8UT/lMG3vWeEwJDzCw/zJjlUHmoanVT76fl6Q9eXp6kVZ1ff/FOuXldRolj
 qEGp1ane8pidVfIbmfb733k6bVb4ivd9bkcK8/Te1x0HAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a4c929 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: nGVC5T4y_Lrs8BoYDv9PHiy9XnbZrE8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX6Y9mEbVu3iTV
 d6/+y4nOBAK1G7XBs/eTQE6DMy0U076MZGwdW0Y07cJxzZW4ayzBsAi/aZd1MeTm7a+pnbrWSEa
 PTywuyHRZKkGfSlO7enqkpJoey4nBnARLEzWPwBVrrJNCTfKybiPSkfJDnT/yMPqL6OcOkIJwXB
 0fdlPGpMk7iQJ863o/pl5WgNXoeLEj+fnOkvvCBNM8IuYnT/x+zDsTFciHSLf/X+bQe+K0k5x8S
 tFZolVvMe/9TU9INH3ziXO4O8GJw/YHv6IbvgW/yYJs5Yyjf/taGUFL5BjfX9S9UiAAeplYxP+l
 cP6ptTUEg6gs0cN5yyzSxGTad3dqB9uEFNjcZ6dcafBnu3rZ/8j8FrPeJMGJRshE5mqn/8uzy8d
 UC2HYIzS
X-Proofpoint-GUID: nGVC5T4y_Lrs8BoYDv9PHiy9XnbZrE8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..08cb6958b9154dbc516aeb0623a8fb5e4af1df92 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1136,6 +1136,10 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR,
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.2


