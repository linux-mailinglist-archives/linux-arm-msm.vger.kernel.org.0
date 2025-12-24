Return-Path: <linux-arm-msm+bounces-86438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D774CDB043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF3083005FC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1CE21C175;
	Wed, 24 Dec 2025 01:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy1JAWIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmCB9PrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F31DEFE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538210; cv=none; b=seglfJ7V18LqLJrGN9ZMsaVoy/VH6+bxViNtLxB5StX02EswShL8P78g2hkKZr8C0PDHBwls1P60Taw5BYJJ0hhl/eBtiUN8LClfXYQyx4jJH+dm7rLdkk+VdUIgMnTzhxCUWWY4BkEuTLPFIF9Vk7hjzgxe8GwqBTSrZ1JbDes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538210; c=relaxed/simple;
	bh=8Tzjobm822RrqnHK47PTxRb1kubRyL6ECDVZddDDmG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IgCPVaKkCNZMDaydMy2N+bOhCWs0BvYC0PFUGiUs6dByweJv9yXHvFOKnNZ9BplUBpqLSX9fEsf7W+04UndNSQafBXuO9i7Or2Awplgzr5b5cv9yDkorbPd+YP7ZL2lIUApi53dVuS9l109ZsOdHUmVELgMa9dhWFrrdMmnRv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qy1JAWIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmCB9PrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNMOA5I1792509
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qy1p7dz4KTgtjDJxH7zF/s
	/gw1hKlABNOIK2uPdIh+s=; b=Qy1JAWIw5RxuLOv5JvoPQDQ3fp2u1Bt3JcmncW
	eKmUgS6Ym8+vieeKqVJzLTpZZSTHiDCrqEvyKQDTe1lZ6YKVl7Im6YwwtdaUHVuI
	vm5KPTtIZT9tBcv9JEaiAtWz37t7lchbtbti2t6D+xYTMPA6v/6W4QAKUHXQMuG8
	7NUFdw/gT45rzolt2V9zL7KnSFGWM7MwjyvYjLh/xseR1yTYTCCLhrPY2Re961RN
	+2DeqPhnzjcP6Mako0ao8Db3AJO5qxu9UsjuM1ICh7xNMIJHbRtAek5E43CbeYnY
	YpcwpAXRwKi5kKtEG2XRunwQSnQXi3OEnVOXNFWJnTmXyMPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9csxkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso144835806d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538207; x=1767143007; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qy1p7dz4KTgtjDJxH7zF/s/gw1hKlABNOIK2uPdIh+s=;
        b=gmCB9PrYL3CKo4isNahy6QzoWJ7T8a1/myjim+gZmX1yzPe71TfrsTQ2daiWCsrds+
         7hF0TETvXrEvbrrs41jtJ3ei7GjpKetUHY4tMD8wZhRtC7THRUKn3sPpPI7r7XZK46AX
         xGv0mOXZ37cNPvkbKBAGSMto31hAjJIKGiWY0D0blnnEXZVSBlAUR6TiW3ivNiCQrwAa
         mBp0uplVMXDgzicLICRfgEhX9AIcC21w/QL1PEdw98HBEaWwy/cxV9G/OcQgcEIi9ZC8
         yR57UwOuzjP1aUs8LwteytBCFFSP6qiZaylE8V6XBomyzR2krGeb8mi9UA3S5pAsEU1E
         HbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538207; x=1767143007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy1p7dz4KTgtjDJxH7zF/s/gw1hKlABNOIK2uPdIh+s=;
        b=GShB/8Cq9D4cRpyl1oui4cMooN0zR5S1h/7UOzTIz0Oc2/Fn0uC3WzX0EiIyya267N
         uvL9G9Tuoo6jB/iKWzHTfo9nqBRltprIrc/pbpOl1nPOBQbNdgwTv7u1MzzDW32zwmv5
         rjuGx29p6uCYzS88u2qi8MKJt2FZ/uNDCKgtzv+fFpUjlXk6Uf1jj8rheJWXokW8hSuT
         YDnp+3CjKLFvq5F7t83H71gJAg4Tnyos1mausegsR+pEXzeTrT2rqoaorPHMKZazWT7K
         OJjRvQjSQ9DRpRgyPsc6OjvvVCbqeH6synIlSCtJg+/HTpAcmNIsxcNLNRjOex/539wA
         zAeA==
X-Forwarded-Encrypted: i=1; AJvYcCWZkPwEdEyKVAspjj9a1uO6cUP/Rj/9uk4GwuqfZSUNZnMngeX2YdOY6URjJJNBIn1KHHScsOzmJKgSDgAG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzk539MZQ65FclkARu67GB5mBW/ix0ect2TNSSpQGkfiyY4I44
	8bsbkNXgQuhNHBAfKGphyswHiqE5GPn4aWSXEwij4jKd54zMF/STa/lSdBD2UJqRZ9YjC8LU/KX
	Zze4fGIaK+3SFpxhM42JgOfMPtZYDdy/WbukcOcrUg2B7PMbkFOn147Ec5ITIqWaQO0ku
X-Gm-Gg: AY/fxX48zyz6QvAq9VVlT+jJQOSTCuJvZ3Pn/cLMEIYcZvN7hBLxTM2llhsKu/jwY7T
	9yycYVOLnlyC4cNBrMNOMIJoZplEO8021rfnKI7uf4YTCWs8EiKnFl0L6CMpG8tE2/Oy1GQxzte
	PMPZpQLY6fvOc7+vn7+9UzwErXGaLglRpYQdcuHCeg+4DlT1KfVFw4Z4I9QzXshryyX9mOh7wMf
	Dk95MUWnZCJ63rjCbTYSKe7AnLbplRe2L3+YJV3rAM/HBDGJfUEmzNE20dYWKeX4fq8P2eGWKL6
	1ImR4gVnvkpdHIyScxuY+i2YkekufdcaSWuJbfhQsIzxUdqJkHoLIU6YB0S0cROY4BFxt7UAwZY
	1TSK9NLXglOk+TiqeRu2Bds2yyPBtdlwLd7NoSoiLZP/L4lTkj+qYXl+b6n2vqGT50u6ZD/TZQt
	PDpNYFVdedQ5Ez2gT/87UwQB4=
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr300845686d6.35.1766538206483;
        Tue, 23 Dec 2025 17:03:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpimNXfH3oYorddWUqgTrbXV1EPp13vtXQqLBq5K7iNXJf5pz619uZUKkotZ/5noUnChRCWA==
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr300844926d6.35.1766538205726;
        Tue, 23 Dec 2025 17:03:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Wed, 24 Dec 2025 03:02:49 +0200
Message-Id: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALk7S2kC/33NwQ6DIAyA4VcxnIcBFJWd9h7LDqhlNhHZwJEtx
 ncfetrB7NLkb9KvCwngEQI5ZwvxEDGgm1IUp4x0g57uQLFPTQQTkilR0xEtzhQn44zXFgIVtGp
 VAVIpqJUm6fDhweB7R6+31AOG2fnP/iPybfuXi5wyWqlact72TLL24kLIny89ds7aPA2yqVH8S
 s2hJDbJNEaanpWClwfSuq5fUggn7AUBAAA=
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3625;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Tzjobm822RrqnHK47PTxRb1kubRyL6ECDVZddDDmG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvXIbwsPmKZGaTML8UxKouye9UbF18LUF9dB
 OPRCcT9gdmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs71wAKCRCLPIo+Aiko
 1TjRB/46NUvByKDGyDwWo/bdFXCvMaCYCrhtMnS2CnzdVUkBWOQJlGAUXoB3wgO8QCfRpICSP2W
 INpd5UxrZkAO42oYeNdfDx9bRfJlcwUtxLc7db6mthobHJmKl+I5N0AfogED8Hvx74hjRSCWqMq
 0grAUH6HRdRV8dnY514V1FOVRkeFgLB3TZG9iUGZb1sBJL0psbTYtrX5Bm08kmyA233ESSy+Yx/
 5TfM2F5sL/SA+jPiyyJQvV2vEMXoBYQGoTe6Lf+FK4s6VRPPxlEqKzNwHl7dibcDXxpHkQxTISf
 uj/97ZaUsT+ooSkpOia7cPAXHcz4hjmR1XSw4mh/qatb3yss
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qMAAQbNQm9gIUREwDvV8-aSnIBcAcWXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX41wzb3NxO/0Q
 /PjH0SyYQA0LZVI8jhTMP2b6Sf2DhVG0ZaPx8ZOVn9FKEkIui9D2mjIGeH9a8dAAFDEp5zivWof
 PMlz9TeORBKperQvnpy/+gT6AjBLPXyQyOoNaXH9wNhZTUDG8t5ycloZN2TmrpMAPjKnKv/7AaD
 Tw7hSrkttvFYnpqIgQjeeMPuB+AXqnEKIj0tPKlqeNtJQQrBqcTkSfVxnKiHeDraOBRIaGtQsdG
 o2IvoeWoaizayy8VMMfO6dAWX3d+jv3mJkQ1z2jm6ijAFdBZUs9LceYPVpXYXNMKbz8ddvwZoml
 M5fbv6dsIGO5K2hUp3wxNtnUN8l+H6NnvuJTiNL0Hk8sEl06fs49RiKJ11e3/M4bzafJX62wpGE
 V8efjvSywX6hamDmXi2gXpX6aZgQgz2f5cNl8hanIBPrLzx3o7KnWJ9e0Cduvkyp9cgTwD7ukfZ
 rTCXu8TOvhdC0jfn3Sg==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b3bdf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cAKecciHRQCNmb6kppMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qMAAQbNQm9gIUREwDvV8-aSnIBcAcWXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- split function interfaces, having a pair of callbacks per each
  InfoFrame type.
- write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
  for unsupported InfoFrames.
- don't create and enable unsupported InfoFrames.
- limit debugfs to provide supported InfoFrames only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Added DRM KUnit tests verifying InfoFrames behaviour (Maxime)
- Reworked the patchset, having per-infoframe callbacks rather than
  extra flags (Maxime)
- Link to v2: https://lore.kernel.org/r/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com

Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: check the infoframes behaviour
      drm/vc4: hdmi: implement clear_infoframe
      drm/sun4i: hdmi_enc: implement clear_infoframe stub
      drm/connector: make clear_infoframe callback mandatory for HDMI connectors
      drm/bridge: refactor HDMI InfoFrame callbacks
      drm/display: hdmi_state_helper: split InfoFrame functions per type
      drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
      drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
      drm/display: bridge_connector: dynamically generate HDMI callbacks
      drm/debug: don't register files for unsupported HDMI InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 180 ++++---
 drivers/gpu/drm/bridge/ite-it6263.c                |  95 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 143 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 110 +++--
 drivers/gpu/drm/display/drm_bridge_connector.c     | 190 +++++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  94 ++--
 drivers/gpu/drm/drm_connector.c                    |   6 +
 drivers/gpu/drm/drm_debugfs.c                      |   7 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 110 +++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 195 ++++----
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  47 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  47 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  42 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  19 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 525 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 105 ++++-
 include/drm/drm_bridge.h                           | 127 ++++-
 include/drm/drm_connector.h                        | 105 +++--
 21 files changed, 1762 insertions(+), 515 deletions(-)
---
base-commit: e05b08d7d0162cf77fff119367fb1a2d5ab3e669
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry


