Return-Path: <linux-arm-msm+bounces-69823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCBB2CDEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B9277A7847
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31508273D73;
	Tue, 19 Aug 2025 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFhDYcXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8375830E858
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635587; cv=none; b=M2LcvymcxdvReI7Byv77bc1bSwsCxqKWmVQK0byi8Yg7Vn8zqYAQpZy9Rgz+iEVOPMQoCUDJ8Ks6uns8trpuM4XNTPbkzhBZaCzHQrPHTyNSAtnY35f2sJOVGzpZ8nu8+u1ikXKX6dw1+DFah+uKOJIQzxy3EK9YFu03Wrowg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635587; c=relaxed/simple;
	bh=Aa58E9QetYLLT5CJBrAOu0YiguU4bRwcPCV4OnIkTHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z41SWLInCmA6gKltqmuEt5axjpLeBBYcmiaDKgQyZvDtDVbmkdKgdyb8F2Gh6bVyps8aHotZPYGpxzCsHo5MMZG2/57Hdnwcf3XC/MPs6XKD0m08wtFYeULlnwQLy8I6MfwU5Od/hjEkdAXE9cLkAzfPQFvhB7lVlGglaeUq1Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFhDYcXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHWx3c030306
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u36+WUg3Mc3swJSKHYkMll
	irkkX6BUSLAF6TGZRcL4s=; b=AFhDYcXl/vxBRjQ0K9Ksh5w0QZ4HO+/ItwLv75
	CwkSAmzB5RuPhPksRO2s+t8zfojqHFAAPGEWXmu2jrr2LhUy3u1+SAla07zV6P47
	d4Ol7dpYnEzFsvTZVrw02sAJ0w7yfzi6qngeZxDQ00BgIfAJMPrsTJgT5zNss8Wb
	O7hkGmMG7S6YbytnlTvcP9+8GgPHU1oLDndI+eBTU3CVJl6BHREau3FtehmhSaip
	cU6HXgjMgiCRm7jO25/QwmksiRcDW59j01+g7NvrPOUL/UBrlnQUskThbJhxxvrS
	6Dfg7p8PWVRN4NspUFzTJHcAnryupN+bAtcrLrYyN8/QOVrA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunx4kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a927f4090so131305436d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635583; x=1756240383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u36+WUg3Mc3swJSKHYkMllirkkX6BUSLAF6TGZRcL4s=;
        b=K77EN3A630bXEBSq87NIiT7RfkQ4qriCn/qbDXrVWb/be1xuVPn7a3JF0zsFpJwEgp
         AC0BAcujwuIV/bResDkZEmTmihHjmAuHSMKl0xZ6y0Vp6Aa1BPGU3RZ+vgP+4BKmcWox
         HifFXSl4wNM5ZIp7qt7VYxc5DJWCD71T5mjikQkysX+GTU/u0FEa6GMOYwHMSpc6TA9N
         krcA22qIY2qPOJywv1PPVC7ybg/rqb++bmia5SNI3rRxPIjNxCpt6hpLadxxRMYp81jr
         wofcJnzQ30E3X7srwK8vbtXMx4UZHG/aeome65UXIrWZgSKxjOc3Hu1JEdroUBc1Sro4
         wbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfnlOxbCuUSINgP300ZD3S8JsXoped6OWkJOj5eJ8mmqa+9RjKmWxUqjWpSbr50MfI7MlaykYsV3NmoQ5o@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVFZRTw+lxHAZTw7yC5pubbyK54lGyMrXa7lfudA54Awo/qHG
	TDR9UnW/cjALusGAXpObglaFj0u/o0sEP92vRSXIN9VfAkp9+FT6lmeFG3bZ1z3fEdDXDtxfdHw
	FHBz0zkaq09hMmqOpbTGBV7fv5bWwz9rsLk5AFmJIOlKaHXdWtx7svXnL8Rornh2BDkMd
X-Gm-Gg: ASbGncvZo7loWQbtCVA5efAI2t1cF0PLFbfUMtGJE0C4dfZtZVrTkvQ101gND0SpEkU
	1v1XDXvL0KNVyuZ+zlW8t76ii9r2vPQGBtLV6ITe3oYdpHbi4nN2ZvgUU/ijmTqFIkRmQtaeMR9
	sct1L36DYtqVW+5rHA+4VJCDjrKye/3hWO15DrtY4czteg3f1wVEccexEs+RJZuwiUNG6SR4A3o
	aWjFkdYHiZjVKZMkw11/5Ju+b2FPtNP9Eo4EAnGl7KMofqALFzW54g51O67LSvxWheS+kVyTCgP
	DIGQwfPYCUPVk6jS3Xfu2jVs0jz3Q8QRnfMGmUVbLIBsa3QBsIXrLI46j3svbfRvJpd9Xl6JHnc
	Q7pwgDuvwhsAcad6smfZ0jAAklcqt4APB+jq/HoCi6IbQQaH4gRg2
X-Received: by 2002:a05:6214:2a8b:b0:70d:6de2:50c3 with SMTP id 6a1803df08f44-70d7722ac12mr3783876d6.64.1755635583329;
        Tue, 19 Aug 2025 13:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAnp1senRVBtFPBwRjEhWsmFdCBol2BtP8U6B6xBW6RH43qAjRYF7z+Opwyhnt+adLP/Hnpg==
X-Received: by 2002:a05:6214:2a8b:b0:70d:6de2:50c3 with SMTP id 6a1803df08f44-70d7722ac12mr3783586d6.64.1755635582666;
        Tue, 19 Aug 2025 13:33:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Tue, 19 Aug 2025 23:32:54 +0300
Message-Id: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbfpGgC/3WP0Q7CIAxFf2Xh2Sog29ye/A/jwwZFSdxQYDiz+
 O8yjYmJ+tL0Nr2ntxPx6Ax6UmcTcRiNN7ZPYr3IiDw2/QHBqKQJpzynG8rg2oJy9gzYS6vQQVU
 2VJZ5q3JVkuQ6O9RmfBJ3+6SPxgfrbs8Dkc3T/6zIgMKGi0IUVHBdqq31fnkZmpO0XbdMhczIy
 D8wrPjG8ITRVc4UUqGFrn5g7q+oDi9D+jm88pK28Qjzkgl1plwHnfFy9W6gxzEk6/0B7Q7XzjY
 BAAA=
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aa58E9QetYLLT5CJBrAOu0YiguU4bRwcPCV4OnIkTHU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN97fwBvb/Aik+XkYHZSwBiiuPfEQA1DGz3dJ
 flwtoG76ZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTfewAKCRCLPIo+Aiko
 1YjxB/4paCYzN/KLKPzZ4YPkvDeKzFqHUnCvsWyzuoY816hxdZdIjD0TjuJ70yL9Z8yg9TjelxV
 aJ5Wyezku3fMWBxN2+cusfQUKZM6NTNTCXyuJS2MoP8/NIsExN+7TXlmIz0H6IlO4YcwxA/fjMF
 b4gU1HZFju+y58XOm2/SIV7XDx2hEwWCIbYZS7noxxHgws3tY+QOjjvnSXBVV/PT0mrZriuxIfk
 y/rjbPBSoRg8nYiSNwHEk5QwQqDPMfBapHa8nHZiwSomT8o7u3vnucIdIy5gAsggZcdJEnUf3Hm
 nEgEQ1j1JRxaBTwG65tJWl4khOBj3THsYqNzreWKeZ3h6rSF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Jn8ZCj-5j8u2AqOzhIYjGQQwnf8GVLL3
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4df80 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX4NWgftGuO8b+
 ypCqnJP4gVVSjC28DQFqlIKthHjlA6L6lrgrNfR7ouMGDYH+j2hSwfHBDKmIFzy7NShrrRJXAcy
 mL4zgbm+dU3tO1iuoouYfGdN3FUAy10NsjtSmyYJ6wYrTgmg1BkkXO7ujgkWj7bu9Ta1Q++Kwi4
 9ZVr/+Xpvt+Le/YRvR/4lK4ipjhZeeghBAyQXCPCDyQ84zlB8iO+nANGarNfBAV/R+PFSgFq08F
 /SJT/07iCLP+39SL57f58qEJmspZyS0fyZYwB+4JXQTtvoLuXWFM8dv24oIqlVqrWZkogAGWGcK
 iU6HcrpsYn1Ybh0uOWl+3wE4ZIoNwrsmoxZ+F6yCTRwZvE6JvVBtYRqWAgghyKelYsVahAmJhMW
 ifTb59eu
X-Proofpoint-ORIG-GUID: Jn8ZCj-5j8u2AqOzhIYjGQQwnf8GVLL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm: renesas: rcar-du: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 10 +---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 77 insertions(+), 131 deletions(-)
---
base-commit: c8cea4371e5eca30cda8660aabb337747dabc51d
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry


