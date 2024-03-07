Return-Path: <linux-arm-msm+bounces-13647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD9875B43
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 00:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3A4A283519
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 23:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82D247784;
	Thu,  7 Mar 2024 23:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVPq6sPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E713D971
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709855827; cv=none; b=gZh65+jNuFJ2ED9T7UY244zDCr0WGZgFqSdqnBVTOI2+tHxpr+RrNXhRdkecP/xZD7yzZRqbRUeJZPzCTFBYriBwUTJ/7ip0AyBQI874S4/o3MQPplbBLGbWi3kVp/pDL0gcS21VfB7OxGcsFwFhytoEQIign7hxB3nX9liSlf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709855827; c=relaxed/simple;
	bh=ztKhf09WdcJUt6OCZRpTpvQyv9XZ/QxyJM/CXoCbSWc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b/KtEaFPXO8Mi95/ToGjjcGxKmWPnlwtb+/yXYMtTPLZAHXXXoHIAc+SiALYjeGdxWXqXoPGAwz+g6w/eC/DnY8lc1QtPJzRnEetBynBYCmjaRWdTYkncyhfiTlxBi+Z2cY8OrOooJ4r/Lx+kN3xNU2OYJHSIS2YGRTFLEdXxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVPq6sPS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51321e71673so1625746e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 15:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709855824; x=1710460624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPbMM+ap6bTE3j0dauj5tCzlH9OJzhaDQAkiD6tMHbs=;
        b=MVPq6sPS0ecj8BS8jpMPFYIXSbJP60ypt6bWO86CTPF6sC59Dg1zqmpaA8X4hZL+wg
         pkEZSdmQ3rllS8ZOpoB51QtPpPqOC/LBOFKVG5Y6/zh9ITqmXHUWR8puIlDNwGOwvSA5
         PPzkS2KdqpQFR1AkFgTV0nHualrjCChFlSs+R93bcjxLu0sdGgFihc+G6IcFV8Uvgm38
         5Y1RKH+lYlzy9C2ZkpMr6gmc5qvpLOOIUwm0xHLEg+efG8DxYeUc2/9gUqJEaIQc1V9i
         BLu88TbPQWgo4rTZKTKZ/7p1f7mqts+LpS4KmUD0m7ZdWK3md8F8HVcUntKu5z+jsgh1
         5v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709855824; x=1710460624;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPbMM+ap6bTE3j0dauj5tCzlH9OJzhaDQAkiD6tMHbs=;
        b=MfM3H0E3gvA59hBoKu8TWCbAVhEsnkfE8JC/Cs+SreSEhqotc2M9TP4nVh3sFaeRo6
         sMAzIdZLJOXur9YWSH3tNv6YXqP2GvybmUu1aWXU4RPsC5tAQjIxA99V3ryqOwxxb7Hl
         RtCQ2xocjyvy5IDH8xhERJF2liuk50mHt0Aqox4ZtEXav2HEIXH4X7o35UI+4qlzNjDH
         iUwFfRNe+uAp3cKf++eNGMdt82t8NtxlyVbgzZ1+ISRP58eXqv8VKsQnMvx0SrsDErzT
         OLzY6YLZKYyiw7hdRN+T9C11l46EbJcb73WIqIzG4RJUSJ0zJvYONy1pGwTlS7YSOfgh
         plVg==
X-Forwarded-Encrypted: i=1; AJvYcCU8v1IKPulTU+7viLa5nsGL/yAnRt0Lu4qTywj92phHddvFIx5qB8mod63xOTo79sNqj5o2ulG2SZu8cTbrhBB55X1uDxVKnIVi9p7bAA==
X-Gm-Message-State: AOJu0Yxs9ly9X3LhxrhnOZWkNmjPVK9pZD3lLBkUxYNyVg4/YmB94ifh
	lVDAuDSQ/iAMRExTNw/myWJJHEXx3lAKXIx32QfhibMQGN2MPMqUkqFIgK9ZzAY=
X-Google-Smtp-Source: AGHT+IFRM+RZOhXZOJcCVo33fKD0gUELk60egjTYuOpmUI5+6SBlNnemOhH2nuK2o/Z00lC5KjeX2g==
X-Received: by 2002:a05:6512:ea5:b0:513:57fe:97b7 with SMTP id bi37-20020a0565120ea500b0051357fe97b7mr2864486lfb.38.1709855823699;
        Thu, 07 Mar 2024 15:57:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:57:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 0/6] drm/msm: make use of the HDMI connector
 infrastructure
Date: Fri, 08 Mar 2024 01:56:59 +0200
Message-Id: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEtU6mUC/x2MQQqAIBAAvxJ7TrC0hK5BD+gaHUq32kMaa0QQ/
 T3pOAMzD0RkwghN9gDjRZGCT1DkGdht8isKcomhlKWWShoxM7lkN7eTsMF7tGdgYVCZSmNdF05
 Cag/Ghe7/O0DftTC+7wfy1C6cbAAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ztKhf09WdcJUt6OCZRpTpvQyv9XZ/QxyJM/CXoCbSWc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lRNbA9c3v4rMPfYnKFGcDEGs4HEAIUzV0kTi
 bGknoVXg+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTQAKCRCLPIo+Aiko
 1UjLB/9qhB2lilo2+Mq64d7vpwGM0JmkBDubpjudlUYvH31iTFpUnDR2AMF2VG9FyFWkDGbhevQ
 /zy+2xz59qhtTz90fEB1djyDZJXkEbfMNmH42CaUJkSgU/3lyb9GSOr16bbqhx+t0ffJFXhF1HM
 ssuQux0kYS5SRJJqUmTyd31tWA90CUnz1QcuRURwUW96k0J1MsjKF/l532DRgdfgC4Pqzdhuhbl
 NuwaZV6vQhbJ+gGkCs9txg131YYpaLPrA8/4I/BwFGyKqPcPJROAKkN3Xkwp2pq/dU4qe5QUNua
 nsGH9n30eLVntIYu+uyJOL17UQpt9+aPthiulVqNQbcvi3qk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/bridge: add setup_connector callback
      drm/connector: hdmi: fix Infoframes generation
      drm/connector: hdmi: split setup code of the HDMI connector
      drm/connector: hdmi: add opaque data type
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: make use of the drm_connector_hdmi framework

 drivers/gpu/drm/drm_atomic_state_helper.c |  25 +++----
 drivers/gpu/drm/drm_bridge.c              |  38 ++++++++++
 drivers/gpu/drm/drm_bridge_connector.c    |   8 ++
 drivers/gpu/drm/drm_connector.c           |  67 ++++++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    | 120 +++++++++++++++++++++++++-----
 include/drm/drm_bridge.h                  |  15 ++++
 include/drm/drm_connector.h               |  10 +++
 7 files changed, 230 insertions(+), 53 deletions(-)
---
base-commit: 47dc3e3d3051709acd01143e21d2de2b5322336c
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


