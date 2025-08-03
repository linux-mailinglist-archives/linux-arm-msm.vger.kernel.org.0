Return-Path: <linux-arm-msm+bounces-67586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13128B193E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2A8D7A1BB5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF51E7C1C;
	Sun,  3 Aug 2025 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQCEe4UB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB342BAF7
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Aug 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754222047; cv=none; b=DZZWvF+WctTYj8zH+cHosrJNNKIpkan75+YUYaL6F2Avxk7RgSpQKeyNLoClPiEvg7kthPcSxIgjX2DK4ZEKO3wYxibwoHFCE7YZq/ZJz0ILwHPd4jW2mUeH6p+LbpkwhFEiPA4MXC1OOcfiSgxfjbvy9BLhNwkdST7d/nFwO/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754222047; c=relaxed/simple;
	bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PLqkQmgwYQZewSB2x219z+hlITmJ9Rt++mwZ6ghFQk1pG4tYUpWYjH3uhYMEo6hOsvB7nnw0ZcUxtSF9uhGutmOjYPEKMc/78Dc/Qqn8HHQXGAAwtSPwc+1QOmYNqeyFYEo0ozDOkxYW6xyPoyMeHkI7Vf3qthWhvzQMXuAHW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQCEe4UB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573Bj1nl000530
	for <linux-arm-msm@vger.kernel.org>; Sun, 3 Aug 2025 11:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
	syUcZjDX5f8XV6NFySlbc=; b=iQCEe4UBn+zhy5xKBcGEWlR2jONw9So3CdetpX
	BpfErIOkkwKR3hQkvFA+8niFS1/e73tzuV9Vv5XKDWEnXeM12hoo7HG9ME02InX+
	nrmvch2r0vlubkl96JzBpFqC5ACIvESypeZVz0nNhvjLQp/OQxqKNbFX9/vfWGSH
	vGzTsYCGY3yUN8mg2ZUSQIlIeFCZJkG7yFlYKCHv8UrOgixZah5tM0awNZL4CHzJ
	Hi6h3RlmCX52GZYMlEwaS2CGLcgMjWsb5lRLeR+lmcjWNg68J3xXZbjFZWdfJT/e
	CLr2V27/e1xHmODW/9iIWMjIKcHRfTywKdVxCRasguey/7iQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwj841-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 11:53:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af117ffc70so31995291cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 04:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754222038; x=1754826838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
        b=Y5WDHZz2lzTyzHfaTPakrEbaFAeHhFD1LipDhOg3Crfml/NS64gsB5V6rjujYzGCrt
         Vvwgm4kHHjjdVxTfI7szyDCGhkJzMX1fOUQc0PToZyuhT/2+PZhBWHOsMoT/0T36mzY1
         v1VvILGy2CrY7/UHnmITc+F6Yv4T1WKj/IsmLgbEr77FLX+Aea1CmQdi8PTeQURLdyd1
         7FvizlDgm9gojYT6Rw5czy4qnGnf9TwXPM1Ty9Bm/FYHSRb1j6DDkz10OaG1b3FdvgSz
         7HbgSnUmjbaO4hbbtyECexjULazMQLt/+gVg+0/KA1PEifa9ZLHgx1FOoMea+UvQEIo2
         Xzfw==
X-Forwarded-Encrypted: i=1; AJvYcCUKGKFPY4aXETTPuR1Zu6bpTkgwkvHmK08U2klaVcz1tpkaxhbGvArVXChQ90oPegJ0Pdwb9ScGuspHQ5cQ@vger.kernel.org
X-Gm-Message-State: AOJu0YykniAAbGMl0MLXu+AZ1xAZG/aU6CNTpkuRlafmvgRZV1ezJaZe
	iHjk6vi3/T5PjjwwoLuBSWpcPpdBV4r5v2W0Wl35GMLgoBoq2RjIdipZLDuFXTXHBS9zCfRD3Yz
	hAysZp+AEypkG2Thkk8mjEoYztxVK2L6Xium++IpF2wergGshCiz4RmSOwKQygG0tgbVC
X-Gm-Gg: ASbGncuFexZA36qjApPX8NWGQmEiOyd/TLPrHeUqHYH0idpxiDr0al+r3jnJrDb2jXC
	cQKPyCsJYT0rKuqgdeP9THVwKD/8HHcRp13GA30gbjQChZ7sHEWQnKEVsB8WidFKBb/KInP1Hzf
	l5CTVdJ4jOjVUgSn7bOqGZDHp5ohk30ZXb5k5C0YqW4oB6JMJ35gGUfTF6KYonndRSzQspwbI2A
	HTVxCEUpbuQxN4Nf3ZWMqWEa6+PoZuLFKidkfvpfCLMGiv4OaJgJy5LSksgn5pWNk79FnI0+0a7
	ae2gxBTjthsMdARla07i4asGvQYTBDxyn1uv9zfdD6X1eNGWou3qnRE8acX9a23zE7Z3ZcWHfDR
	iksvrXHkNpZxxaRbcqhF197YS2q4YjGwRv0Hv/D7RU2ZCdhTliGtJ
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id d75a77b69052e-4af1098c10cmr109506351cf.13.1754222038496;
        Sun, 03 Aug 2025 04:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6F1gC3i9qNqPGQ2+U8UnWuUnVr8S0dL9Kp9yI/T0GmDv1re8BD8ymDZkfYLJgECcFcEOVzg==
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id d75a77b69052e-4af1098c10cmr109505841cf.13.1754222037990;
        Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a6f74sm13281731fa.20.2025.08.03.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Sun, 03 Aug 2025 14:53:50 +0300
Message-Id: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0a/76XO+afzL5QKXQqM/OCzeVVFxIPW+vrJ85d3iq3S2
 mJucD20k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT2e/PwTDZzds4TCJ3dd13
 K9typZKPcnseh78q7kk6VPCsvHrdXva/obn74nxnev78YTf/W9lKiT7Z061Olr38F3aqXL098ep
 pZcXG5eau1/hnKbfeyjl9dIlqhfsHjisb7SvunUiT7pSwm3e7b4afq/J88xIu2+Aeqy9hscq/Kh
 7JX2LNrvM7wf7rYP5pWX6HM3tdNaclzvMIa9S6brW/+Nu73a9+83ewOyybL1ywbbVSiKq24sk2m
 Y9VXCsP5ptdvmrka7avfYLBe+9HRxZOqeQ+umZ228ME37N6ApLPWtL/KPEpb0pvVug+7nae3fJP
 e5O6RbHJtFSzH5GqLmuzovrMw2bVFT6wunHexnRnlqceAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MSBTYWx0ZWRfX1YVRwTfB//i3
 hwynP+JPKBUetNM6i9JSKIUJQR77HqcsQLLe2LvW0YYeqZPhWxi1nJbaPpc6GSRDQ30PYia9tTT
 p5Ln3E+1PUdLkKW0sFRnVuOz17eTjcqH/dulwww+htg114B6Jy3tPSfzAg6kF9fCEtfBqEdlk+K
 noG+dPlU5Abe2sz+uErLDmuJcSdriBB8LzpyKXcRzeHIyjrg8tDS63OP4/Ero4f9gMtyO34OzZc
 ZndbjTym3/71cJURg99i/UpHGfstewGkBMw3dQCz7fb/4nk4z59zaZJHyYHn5Od+5n0QSoNb+mK
 /5Jjt4HdAI75MAi/fyJIJMULmd+rHN+9er7yUSzbLpaNMju4kiBlPmW96AVmk8ZVdOCBqgZ1LpJ
 vOPrpnJ0VpD53hGZ2D7VxnaO9+mDz1z8VGZLNsJjp5ZwCz6w3Sn2fZecyThay4lxGMKxhiQn
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=688f4dd7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZSelDe4fDuBiaoNP2RK5gxUSJRLIPqyT
X-Proofpoint-ORIG-GUID: ZSelDe4fDuBiaoNP2RK5gxUSJRLIPqyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030081

Use DRM HDMI audio helpers in order to implement HDMI audio support for
Lontium LT9611UXC bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
 drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
 include/drm/drm_bridge.h                       |   1 +
 7 files changed, 57 insertions(+), 79 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff

Best regards,
-- 
With best wishes
Dmitry


