Return-Path: <linux-arm-msm+bounces-87939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88939CFF98B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F2583326FFD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8343F35502F;
	Wed,  7 Jan 2026 18:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5wQoHxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpNmsol0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD0352F88
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809708; cv=none; b=QFpByh4G0180ZICERA7+b2L73YzohcqYpaGVX4tWsKX+/Ee6YzXniTE67FyfLZDGccE23aXXNWyhtEw+MjPEXAN/b48optoHkbvxB44cBr5Sj0JhE7JkbUA8/vgjjK9cKxJ/+fVepeYeZGKF3xDbZJXiIrGnibImClUtO7W/E6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809708; c=relaxed/simple;
	bh=gX9SpOCO0/7Ulc3hkcD6g/xnQUwnJ/+8R4Xg744u4yE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kWZFWhOQDw4c9HVsVdQiwqYF6TICsImE88gPFhZ6CFdv8soTAHMRgynp9ts5XKCjB04sEJrK9HaCz7HIITR54QWkLnJ4eq1gwKoqwwAPZTgMJvkU2ElPxP/SKzaXV3NPnZURCMwiW/JaFcr/u9qsOdhgq2Oz8igTKwGSfCzxA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5wQoHxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpNmsol0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H3w583050003
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=46Gg+PyoOePNZTavJ/f0dI
	NF0Iy1zt9yuv/JMI3KZdo=; b=b5wQoHxQp3wYlAg6T+W2ikXEJPzoXy45ScOMWL
	Q0FCIVPJi5unHLjJ+z2qvG8nBQruKD4DJNosWNMZ/5uESj9hgoxtjNSkYEelFqtK
	jKSFs1ELv/tt5/gSAJEFs3y2c7NtES/da07XjZg2B8SiW0/PNFp+JbEefb4W/ffp
	LHxHntJXzkTwqwLWI5L/jigaHDy+wkmTdC4IeBf80PEsrvb6e+gikjoEsdUc+Q0Q
	vzeoY4mw2nfmC9HLfCLr5JKIj6YRRHIRrJOu0dmZmszoKjExas1vrDa7SZX71Ody
	FArH61t983BFcy70sZShIPcP1Ppvfvm6GrWKMLnvCE8QoNzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhujeg8gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:15:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e235d4d2so911623185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809704; x=1768414504; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46Gg+PyoOePNZTavJ/f0dINF0Iy1zt9yuv/JMI3KZdo=;
        b=CpNmsol0YDxklK1/VPFoHW+IquhHvhfzPqC6Eh+6gIrmaN8gpoCtAaK3NT6xgWEDCt
         TzJI+0A2FgW7QXHoq3ymOKo25XmLmhYs7LVabQm7xXwD6WT3dEyAQ9EyGbi18aav27dW
         NXQBzksb6+m6BzYvd3tYtTUJH0FcgB+sKWO3pkhtKZl41ZI/HiwfnA7lkSoEh8kvxec/
         KK3ZFipT9vjzyy4G38Z1tbqPjA6P/EUJJkDPhRscJ+3YvUykYsUSAp6NkxUT4TqW/oy4
         amA50lL0y4H8QeCpJt3toTCYdgv2BHwvI4SI30plnyUZND+nSkB/jPOHZn3jiXeni5gW
         Pu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809704; x=1768414504;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Gg+PyoOePNZTavJ/f0dINF0Iy1zt9yuv/JMI3KZdo=;
        b=urjskVU1fdgJJYYFTVXqmfP8ClH3+iEuJ9fBnGG8J2R8ItnXJ7bUVJNvGScdrpVEoI
         2r06nvZrlVJaP0IWTxa6/pD9RccAetltR0oIZ3FWHrod4cGyA+UVMG3srEWesBkxAR/S
         iKp8izbPoKEQUOxXkd7ta9dFHXM182ux/QT7lsUDDAfTnaU2idBr7oADjy26GMQJm1TZ
         QOizYBqOPjekO+0iqpLI0FHlGTNPcG2yDyH0J3AXQjP4hT6eRvGOyu/ETK3YpxBzEl6H
         8+QfXJlUus07NouKOVqquB/WCr5yTTapf0HAvl3UsF907DB4ASEYBaeCZ7OSStjnbCzZ
         c5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvyqqKcBwGxn1/PI5N+BIuihTRprix/RYzH9HVTAuRy9tYVEDIO/wMIKI41OiLcFuYZ4daUdzbmeMKoIP+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy7g+YFXzwSP1oh7IrfGz89x7/Ow31I/EscMXEG5wInC0KICMu
	OCjowaOqnf2W3Sj5zK3eeRkpSjx+6WvHnO9wCiTd8R1bbsudwn1uYEbIDImiI6Jd6EAzs75R7qN
	Pw9xPgFJLZdIlN6lM5jqrMd/1Snzq92Bb/Aq7K0BAkbWVQtOk1OCcr0dWT6N8ZYpQ38vc
X-Gm-Gg: AY/fxX5qskmDXFw8wrg1FtO5mTMEInplvFfiooWc6g0H4V0euE8HbR7Dn/gQCm7wNdu
	j+HA5R1JoNybcB2nqAqbDpx7ow+dZ4jaaBW7KmVsYnts5KcfZf8KpzteuZmTw/hU7vgUBfB2tVg
	3OZCHLZplGL94cdHYA9ZbgQKjunf5WXQLbLA2RFvNJHMxMKbLkowfXh5UOI2d42GKbGTiQmwbUW
	uXkSyVyMQUZFtHBxCVLzRSKJlM5jc91SGRXOCQ/PAkGPRiGBMXH6crkriod1kGnpArBCct3Gd+3
	0zPDQLaI+QdyfSw5c1TwM6ntmGngWii5SQvI0qatg+Qb0/3HTaRRHlRPpU9Mnbj1k7EtazDxIF3
	a9K5B2w8FGL8BnGM0k3hCu1BpK1n8FV79a/4gYnN5l56rubib/V/a/ExShjMbfjA/2nRZmlrRAY
	VNMtoJ5N/1lZigb4ehZfcc2d4=
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr442479685a.1.1767809703671;
        Wed, 07 Jan 2026 10:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElQihcW3Tjcl/g47DFZ0X3Xy9yKLqj4E4uU5Naixz+3u8V8AGWXuPSPneKVozlSO90301DfQ==
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr442474185a.1.1767809703041;
        Wed, 07 Jan 2026 10:15:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Wed, 07 Jan 2026 20:14:57 +0200
Message-Id: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGiXmkC/33NwQrCMAyA4VeRnq202eqsJ99DPHRrogG3ajuHI
 nt3Ow/iYXoJ/IF8eYqEkTGJ7eIpIg6cOHQ5yuVCNCfXHVGyzy1AgVEWKnnmlnvJHQWKrsUkQa5
 rW6CxFivrRD68RCS+v9H9IfeJUx/i4/1j0NP2LzdoqeTaVkbr2iuj6l1IaXW9uXMT2naVh5jUA
 b6lzawEk0QbMuRVCbr8IRUfSQOUs1KRpYp80biGkNDPSOM4vgBcyHlyTwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3984;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gX9SpOCO0/7Ulc3hkcD6g/xnQUwnJ/+8R4Xg744u4yE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKjKvSyr21kbkh8HJSdMuDgMW95IRHJ5Zf+6
 v4b7inYl7+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6iowAKCRCLPIo+Aiko
 1TCRB/4x8rn0hPnD2RKVnGj/gtjxhkM5jJjPtq3SxdltJdWN+UeeTrLxrwZv+0hkL7Yeal2G/ZK
 z5CwZoquEq5/Fk0QXvHuBnPtLwzK/L5OicGMVegNDtEBZfdsZiCrfVK556IFooZTd+V5ZDchY9I
 ttBQdoxQZIg8n2A3f1w9JY6oWBoLD1qfRn6NyXZPJVG88WyDtwY9Tva/yAXD/2W4/w2h4/GvgFA
 wdo+/sQdcS2PDnz532CVB1rJR0HPEfXSOC0wZdYeT66tGJrVfvKsAFEwzcLyq20cMSVRdpi19F7
 VJWc8PN+Q4a+46JJIaSDDIOV/nuaqm8XoFehBn8/d7QYqiVI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WKNyn3sR c=1 sm=1 tr=0 ts=695ea2a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cAKecciHRQCNmb6kppMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Lo54zpOtFHjjNt-qMN1cbFCJJpO-5PbI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX4IcqtbuOs/8Z
 tnlMlCH8+prbusIFf2F+d2Vcqy3v4f3TXBRTArkjLO0oPRotq9Q7BgD1dL+BK+PiQsq4pmF7TMG
 HEwduZRdon2drM0uBcq0JkGT73QmosJh3OHB/v5Sat9GG7Bfo7KMEyT5MZwUCqdoJfQ2484B5Cs
 HrbkAxAxGNGzcwY+5mmqu80b06tNd3RxPRJ71WgHx7eG2FwCNY78N3hdWUjcf9GBw+9/uhacHzA
 J+yKa5EpJpJeylAUWQZQHEd70L2X0qvbPFQqZ3vzEUZlaDaYVKSTe7Z5PcTtHoqFkVbQT4boK12
 QTl3qBecWU2c/IpXASuu21WNFpEOMDKZtMiiN6lXeV4LQNQXHOybnviY1d8CsoyLSwnTzQDBENj
 v4LeJ/uswn+B+o5uePNzk/U7chp2NHN0AHJCppwcnn8gnCAtsGIvTU6RLyI0QsFkUZrDtf20mar
 PJeiArcAKvDorKXZ6Fw==
X-Proofpoint-ORIG-GUID: Lo54zpOtFHjjNt-qMN1cbFCJJpO-5PbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

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
Changes in v4:
- Rebased on top of drm-misc-next, moving inno-hdmi to the bridge patch
- Expanded "normal" test description (Maxime)
- Added EDEADLK handling to the tests (Maxime)
- Moved hdmi_update_failures to drm_atomic_helper_connector_hdmi_priv
  (Maxime)
- Link to v3: https://lore.kernel.org/r/20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com

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

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 180 +++---
 drivers/gpu/drm/bridge/inno-hdmi.c                 |  41 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  95 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 143 +++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 110 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c     | 190 +++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  94 +--
 drivers/gpu/drm/drm_connector.c                    |   6 +
 drivers/gpu/drm/drm_debugfs.c                      |   7 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 110 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 195 +++---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  47 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  42 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  19 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 667 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 105 +++-
 include/drm/drm_bridge.h                           | 127 +++-
 include/drm/drm_connector.h                        | 105 +++-
 21 files changed, 1900 insertions(+), 513 deletions(-)
---
base-commit: 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry


