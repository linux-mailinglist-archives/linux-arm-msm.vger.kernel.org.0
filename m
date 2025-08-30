Return-Path: <linux-arm-msm+bounces-71262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0CDB3C61D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 02:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6A80A2496D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 00:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171FF3595D;
	Sat, 30 Aug 2025 00:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o12dTTKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4C282F5
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513387; cv=none; b=mUeE6fA2ahU8MeAHmXp0UJSfarXsLmpgCzLH7Zo3/Fz7dUXtqdT73/w4E/QwiLCGxLdEutxZ9qeCqBqixBzJo9wnOCeMA1EdJBXxkcdDO+cL+T+EOZrX5UwL8Opnv6s0ZKpuX02Dyqjj9Oxlsz+8xXYkaYWvGZuroDgXbc/N4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513387; c=relaxed/simple;
	bh=j2WFIoiYZY4mvy1n1cE7iNg5twCtSflR486EGLADOXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMURuAHnzAuNrq2c3yK6waioBQLf7FngpRStqMOo7EJFAwnqEecyo0tLKje1DHdy4Lmx+xk3WlIWbN/mCL2PhDuXqT5ZlnsR/DGm6+BGIyV1jbRQQBAFynGENyJ4ztq37m/zjD0MC2aqyRxR8KkLAWS3cBtvPhmwp57Cjo5o6PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o12dTTKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TNCCkR026861
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IN6pTMVXIP/HlenGwHRNNU
	K4pAbKppfkJLc5GQ+V4dk=; b=o12dTTKNN6jLOc/Zc9GjC8QFtOr6OY4ayJtqWF
	61qJNUDD+dOZ47GtKiiRoD+XQgjX9sMYPTblN1Zf4TxXQPGKppJKHrOs6KB5DY4L
	fx6Ijclr9LavmQFUfv/1GFOE70+UWHBbODZ7SaRI74d1o/bo7XvlidvgiF/bXv8T
	9hxDjVEg1zj7O0Usu1c5UiOuwELRndortQVlB4HmuwKPFbVIjVt4zagVjBshNMLa
	4RKRTer1RKfWedqgaZ1QnifY5NpK/agukFqwcCeZxZy0TwZ2xvKdKS8IrUO9ZBMy
	Tf/gnj+b4515XWSkMIRArLIBJzhHhG3p0ZCfMdYfwT3dr2fA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w35ds9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b1292b00cfso28219221cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 17:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513383; x=1757118183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN6pTMVXIP/HlenGwHRNNUK4pAbKppfkJLc5GQ+V4dk=;
        b=Z+LT9EjkySHZd6pBSqEiWMvj7ssp7ddg63Ey2fKy0FNj2DnHUWjTvnnF2NWfz2k+td
         W9rVQm6JnRQX/d1lZ5QNaWrnyKitJWRYg5II4v+Gnb5jvzlrH2A92bhhiWY6NI/E7vm/
         9/pIStTY/hw6aPj+jO+wyekA9g8px0j5SjgRCuAdKlALC7oTSzoHtgXqP4oRP365Na2A
         08KHdInuIBIMla+8eRciF5LRQpBAAkkSUfMZSeqEh/W9K0vGJTyz0LO+f3LXzrLoEh1a
         m3p0gPUT9geykWG53VW7Hrd3iL5bdKQ5gJObzkLszVrRWOEyvgvkLg0e1fT9Rnm+bzRg
         0Zvg==
X-Forwarded-Encrypted: i=1; AJvYcCXx6fBbVlheB1WVGKlndhIlj/lffWxbjiWvsDtX9HFyPYBrwcuJzWBboSzFQvFHJ0CIbvA8SchFvA9kV3h/@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQ4bZMrtqGIrJvzaU6Bo7d7+ctCdbz4Cojg4HWHRv2icOPxoz
	TFMooy9wGE1Xo045El88vOZoUmSdnhjjCBVrF2RJxYGzOOrt3oEXUKIUox2uze134/PI7FV8+dg
	i9K3hl33c2+aaexlFD8rIRHwmsTCWcZohcJppoe9gphW1Mv890QVMWcql09jpotXvido/
X-Gm-Gg: ASbGncvOhF+kAWlUxl18DkQ0nyTDTaIhII1k2AtfKtkPyzk9U4R0epZPrJmcgZunzLr
	vVZQzRLATREI35TMnhLO6eKxTFMeuS/QOTgHsXMr/Wi875XWGWLzddsZFdSkkCUGXEAateC6SHK
	QUyXkyjojULYXW9AtP13Q4caWKGfYD1IEn+H/U17emYyvGC2i8RZwIK/L93+KR0OS7kn/u5+/ju
	GbFlqC0E0K6/JQiyY8ZZgTSDwo1QH7Wg3e2M3rDD7rpqyJm3o/zusr8HDtEL1oz19sg208t+33H
	DnftnI7pgdHMDwEShb9iQcG9gu27bFnvvzv01i10di2IEeg5R5VbLtsNRgKklA7N+W23Idnbdjl
	o7KiUfSwQxT5LsAt1PjL0cZchB+LKJoL7fqqiUM/GM8l9nJLXFXn7
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr6340751cf.28.1756513383049;
        Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9LDaqfPkXcTKRcfc1aA44E7iMFC4s0jpuyP6SEvxDgqx16wPnVQjbJmp4eKUiP/CaJNa52g==
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr6340331cf.28.1756513382427;
        Fri, 29 Aug 2025 17:23:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Sat, 30 Aug 2025 03:22:56 +0300
Message-Id: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBEsmgC/3XQwW7DIAwG4FeJOM8dISM0Oe09ph1oMK2lElZMo
 1RR372kVaUd2gvyj+wPi0UwJkIWfbWIhBMxxbGE5qMSw8GOewRyJQsllZbbWoNLAY4UKAONPvp
 kAzKg2SpvjW+aVooy+pfQ03xnf35LPhDnmC73V6Z6vX2C7WtwqkFC64baOO2lwe47Mm9OZ3scY
 gibcojVndR/q3tjqWIZ3WnnrPryO/fCuj6WTng6ly/Ij83FzjLC2kS5r1Y7EA+fzwJGnHMZvd4
 ASbw2h0UBAAA=
X-Change-ID: 20250815-drm-limit-infoframes-e782fa7f3360
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j2WFIoiYZY4mvy1n1cE7iNg5twCtSflR486EGLADOXY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjU90bIF/CWwFMn6YjwNwwP4vc6O+nHPJdM
 peW29wEpNmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1bynCACiJto6tHqy6NRaMI9XSFtJjDhGG9NxaK8XYGS50rbbkRizcc6WRtsCcNv0x4E8tURgw5d
 xD/LGzTuMjBl03KdrIc1pxIl9YB6IabYmi8V1oapcB9mFf6Z9cA6B/nRxe1rZEppabTUE5N3/Ln
 AQC0I6KKebn5PuPQtJLUovBxSXnu1nIugsl8CK4KZ7Fp+0IPpKcpLvGQgm/eGjdw8scPgD/i8tm
 FDGJHbs8XR1rv3RDvp4P5QgCynMvltkRCGGPQCspMHPNY+A8PoH05xLW86JnIQ4B6Rrb8wy9Yrk
 jKR550siSDIxvPLD7lP43sT32WfeM+BVoBY2Ceq2X/kh56h6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b24468 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9umpI5-D6xKxpy0QfyMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX7za/GlPOHMcF
 jTeD0mUUjOg3QDKpeolWfXcEJdQHj8/8McEeGbNDrMDNyBY4aBICCrJGZfaTdrdSDtjo4YQjTR4
 SefamsGswAZ8St4l7x5Og4E3sYfOsU16s7DBXsVHnqK2T9MC3xLt74+vL8+XSjhJFBd1R+zlgbq
 sPlLlpaRpoCScAAiCuNSp5J9oVYybk4XkTPWnIOTeKDVPsTRf/A3GOp9wNONasitSulZsgFdQIZ
 +j6nVFiEsTpk0S+JqG8eo3MoRmEcX1a4xfJ0eeiBs6M5g02usB3Pi6gu9v7a2FYPQMrIadj4ohN
 rJOTW1M8hjy0aasLSpN6Rwt/vpYZiMImDeh/1YhMxYByWLjTAnyvkGAixQoK6yrpXtSxmlR0qVD
 hoouO7Ib
X-Proofpoint-GUID: 8iDBMkbznqC-6xROKbu427S0L6Fur_3p
X-Proofpoint-ORIG-GUID: 8iDBMkbznqC-6xROKbu427S0L6Fur_3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
a model of ignoring the unsupported Infoframes, but it's a bigger
problem for the userspace: we end up having files in debugfs which do
mot match what is being sent on the wire.

Sort that out, making sure that all interfaces are consistent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed supported infoframes initialization (Liu Ying)
- Implemented separate flags for DRM-generated InfoFrames and
  hardware-generated ones
- Warn if required InfoFrames are not supported by the driver (Maxime)
- Changed drivers to error out if the DRM framework requires the
  unsupported InfoFrame (Maxime)
- Implemented DRM_BRIDGE_OP_HDMI and DRM_BRIDGE_OP_HDMI_AUDIO for
  Lontium lt9611uxc bridge.
- Link to v2: https://lore.kernel.org/r/20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com

Changes in v2:
- Corrected whitespace / newline issues & other small syntax fixes (Liu
  Ying)
- Added audio to the list of InfoFrames supported by the VC4 driver (Liu
  Ying)
- Changed drm_dbg_kms() to drm_warn_once() in the Audio InfoFrame update
  code (Liu Ying)
- Corrected subject for ITE IT6263 patch (Liu Ying)
- Added patch, dropping default list of InfoFrames in
  drm_bridge_connector.
- Link to v1: https://lore.kernel.org/r/20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6263: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes
      drm/display: bridge_connector: drop default list for HDMI Infoframes
      drm/connector: verify that HDMI connectors support necessary InfoFrames
      drm/display: hdmi-audio: warn if HDMI connector doesn't support Audio IF
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  10 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         | 130 +++++++++------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   7 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   2 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |  12 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  53 ++++++++-
 drivers/gpu/drm/drm_connector.c                    |  17 +++
 drivers/gpu/drm/drm_debugfs.c                      |  16 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   8 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   6 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   5 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   4 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  49 ++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   9 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   6 +
 include/drm/drm_bridge.h                           |  14 +++
 include/drm/drm_connector.h                        |  39 +++++++
 19 files changed, 306 insertions(+), 103 deletions(-)
---
base-commit: f4028ef65dc4fe9010bcc017597fe0fea6479097
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry


