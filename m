Return-Path: <linux-arm-msm+bounces-14283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE81387D64D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 22:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5405A2832D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 21:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2775813A;
	Fri, 15 Mar 2024 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IHBg+r/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E5457881
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 21:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538669; cv=none; b=twVJR3T6sGoFA6IGFQK8PyY5NZya9Mvn9W+CC6/8/vihqrrvopWBWJW8CRe2slIY19AbHAGj4OB6oTAXKaow3Ivo6t0MSCEtxFhDiMX3/r9Q+u9owENQnXST68KnEDtTkrXxdQh4fOJ4MGA+KZ1pynxuo3Hyp5uUshWS07v1JvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538669; c=relaxed/simple;
	bh=j7l/Wm2Ft+e3LgNffRWN0vGzV11pIV6gqysmAZ2ebYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMhu1oe4oU4MsupIECYpbi5HhI4YksESdF8oLbPSpL0Do86dR264mdW9ddXHzO7kNBPJfXrS8s7PAHOOjT+/LX4GyZE2rSCUPusd28sAntDxkzUtgvTtVUBO/6siQNDPpljdny9iteQKlOlnf9JcJTaPvMMvDjXLVK463XzEMgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IHBg+r/o; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6ccd69ebcso1647075b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 14:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710538666; x=1711143466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz22lebM2rTHwhNkx5aAaX7EA6Wa3wOGuC1PNKA3MCs=;
        b=IHBg+r/oUGxaLys6qlwFNA47SFc2j/1FkFfzxcsEZHFgKJm2+EF7sIiTn98TzGKLrg
         wVMsqkDOPI70Z/bJrVM8zoEYhDnaL3GF1yd53jYxkjebDFwfk5fRcE/uagPTE1p+BRoB
         Bfee85uLs7tByJfW6UQG1/yCiGOW2LaZeQN48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538666; x=1711143466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz22lebM2rTHwhNkx5aAaX7EA6Wa3wOGuC1PNKA3MCs=;
        b=hOh/XEfaYeWteXJOLhJwu4DwabWHgbpXMdAN9mGFxfBlZwaJy+9hpwUkAXFbuo114c
         NEoywOQ+ouzFQSKa3w//i7PNG/TWXJ1ybKHSKXXumEUkeIXsxLO0Xzy4WZG7j7FZR01j
         AmcgxeQZN/fn7jOMChQyqdc5cDdl9vnwtKJYLPEmx+dggF9WsMrXtKDjSkKPrq82dk2S
         DSK7yjt+QRKJYCEbCZAskP4iIN+1SE1oPjusBILfjej4zRlgNSMZeMXYwbyAQnAtVkjG
         8k1d6V7yte94jj8s7Ck5xUxfONRt4T5WRMGNXFcTezALHwGoJLKt2hm16VPttQImrw3v
         Ifow==
X-Forwarded-Encrypted: i=1; AJvYcCUt3R+sSwfFf5C4B6sPLgGbK4ECLqVFWW3bpEzQXp3BHzlanRaYQEnjXSr9s/MRImaxC19ARMuo2tXyfOrV6xWKV5VGkMRu/mN1BVL6MQ==
X-Gm-Message-State: AOJu0YyohbPUwdzDPAbvVOJcYObfv/jkOnjkyPi3Tq7WZ2BosyCQxlVu
	M94l8AreG0qHhw2vgLbxFn88rykjd9ok676ZAoX5pmIfYdfQgLBUB9J25Da6PyMnhfVcCnsSLZA
	=
X-Google-Smtp-Source: AGHT+IHQFsTaKAjTWRRsrq1ZbLWnGQEVyGRFX2DMyF+SJJVN6Bd0rkX5tleEQkFmHdo17KUR5G1ENw==
X-Received: by 2002:a05:6a00:845:b0:6e6:fb34:2568 with SMTP id q5-20020a056a00084500b006e6fb342568mr3035362pfk.0.1710538666024;
        Fri, 15 Mar 2024 14:37:46 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:b23e:e8dc:3df4:aa2a])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b006e6b5e65579sm3837142pfo.106.2024.03.15.14.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:37:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Stephen Boyd <swboyd@chromium.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus => status)
Date: Fri, 15 Mar 2024 14:36:32 -0700
Message-ID: <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315213717.1411017-1-dianders@chromium.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a no-op change to just fix a typo in the name of a static function.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Fix typo in static function (ststus => status)") new for v2.

 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b0f3e2ef5a6b..78e702f66ed2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -494,7 +494,7 @@ static void dp_display_handle_video_request(struct dp_display_private *dp)
 	}
 }
 
-static int dp_display_handle_port_ststus_changed(struct dp_display_private *dp)
+static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
 {
 	int rc = 0;
 
@@ -551,7 +551,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
 					dp->hpd_state, sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = dp_display_handle_port_ststus_changed(dp);
+			rc = dp_display_handle_port_status_changed(dp);
 		else
 			rc = dp_display_handle_irq_hpd(dp);
 	}
-- 
2.44.0.291.gc1ea87d7ee-goog


