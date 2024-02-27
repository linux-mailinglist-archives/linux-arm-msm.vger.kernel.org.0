Return-Path: <linux-arm-msm+bounces-12779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 717CD86A226
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 23:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D83D41F2240F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 22:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4287351009;
	Tue, 27 Feb 2024 22:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFnhvRmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3837E14F977
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 22:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071693; cv=none; b=e72q3it3XSxDcsaXZAX8+dkg6ZdELbe4Fpbq8rDAGHPkZ6itimyTYHRkcwpPhDleh0gk87mRh0xnMshkeE5pErJP2BWrjcb1t0rMstS95PDXSiZRlGvbr3t76zAZzWvB5DYzlS550R2xnVKyOPC/kfAZwuHkKpYLV5EmeMOHt4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071693; c=relaxed/simple;
	bh=HVwnkvfCdKmRfyrfIq1ta/A/M2cqgWz/WkEaUOILu4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iQ0CW/vFqfQK6C5mBeiOf0b1BRdbdlfoMstYJ2hELcxAs0ktiKimIYKt0LkkaQKkORhf9e9Bd60Uiw+Oiqn84fjftB5+JAve/ZmwCJU45L6EAlahfGEpJ0JocLMfc/rAkIiY32kV14fiBxjHFrT7VMcVMFe0GtffBM4230xwY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFnhvRmF; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d208be133bso74154411fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 14:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709071689; x=1709676489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQcCMyGhfzH8PgY8TmCUpxm6Vv1tc9M/NiJQlsbF4kI=;
        b=nFnhvRmFow1leDAyZ0SyUQSOuTYRFvYvOtHQuJv7KOCcrmX83uZmRrdVwJv1MN4CTt
         Lyai2+OEx+PwwwgGwueOnuOlUpNx4BuAbOlcm1SRU5se12FxV3Xxcq6N9glr8r3X8x4D
         RLEgznqT5CzfQYUXMRycuRg2sPHloAwz12Rkw7ntBCJ76o3376Zy557NHFI5X8tCojmF
         yWMGIQJDgGZpzFP8WuqyGY5l+gHNhD4tkVDs7LHE+K0ifcNjIPQUsfwnxe0Hy/mYYsHr
         rLo3YduEtEchZ0FEYeUN0HD2ibTUspYz9ot04qq6nHO2Nluyc80SZb7eAUlUUSqXo8VM
         VEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071689; x=1709676489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQcCMyGhfzH8PgY8TmCUpxm6Vv1tc9M/NiJQlsbF4kI=;
        b=NtcKO7WywchGVMuEvUrw+9NC+wzwsJOP/D0dN4q38o39hLW4sD5Ms/zuhs1DLrRIc9
         ZaoRLHIkUHh968QNq6y+Zq7adbsF8IMmT9x8xd50/mMF/nbnO5n7S6HJt1wQhfLEDgPL
         4/YU5DzSpmxrDn9mXI7lDNvqzu/+sKtmILi2P+hWG1VYzPvMRjmzbgv1wZQjKpKDHqO9
         IjUyGKaSjMmfi+fTEvi9F4Aect/VLyF18oCJmEoKp/6uwXCqDtsKZdBrXbjDuvdiSYHc
         9Y+/l9v5Mpyu/FV/a6fxJLpXQhZhpb2pVsBva3PHkWTa/vBkWNeOuWHO/uEyGaRAh+M9
         5kpg==
X-Forwarded-Encrypted: i=1; AJvYcCUERpPAF6hSzKEl3zAJy+DalrZtR2RDLvahlsjx/mIa1CxHUlRhse4lp6hVuix9JyAnbjQx6c78sjRYH2nRmEK4hFYCcXkvRRmv775h+Q==
X-Gm-Message-State: AOJu0YzxV3rwFAG95asf+j0tu2+yuctebwSWGLhq1YDpHK+Fygm1Gj3/
	iLLrFvhAqhkdOb9BupQMj7jzWmrklBA7yu+9bFi+LXQZ1x8/DMaTwc8ZusNhziQ=
X-Google-Smtp-Source: AGHT+IH+yL8luTEsjdTKKoRDh0vC98sjxGym7Upqf/nybKJw0zX+NrxDgIIl50EzB430cRbyTNIPgw==
X-Received: by 2002:a19:f505:0:b0:512:e58c:7bf1 with SMTP id j5-20020a19f505000000b00512e58c7bf1mr7137757lfb.40.1709071689142;
        Tue, 27 Feb 2024 14:08:09 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id d3-20020a0565123d0300b0051317bf8b39sm94466lfv.287.2024.02.27.14.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:08:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes"
Date: Wed, 28 Feb 2024 00:08:08 +0200
Message-Id: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e467e0bde881 ("drm/msm/dp: use
drm_bridge_hpd_notify() to report HPD status changes").

The commit changed the way how the MSM DP driver communicates
HPD-related events to the userspace. The mentioned commit made some of
the HPD events being reported earlier. This way userspace starts poking
around. It interacts in a bad way with the dp_bridge_detect and the
driver's state machine, ending up either with the very long delays
during hotplug detection or even inability of the DP driver to report
the display as connected.

A proper fix will involve redesigning of the HPD handling in the MSM DP
driver. It is underway, but it will be intrusive and can not be thought
about as a simple fix for the issue. Thus, revert the offending commit.

Fixes: e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes")
Link: https://gitlab.freedesktop.org/drm/msm/-/issues/50
Reported-by: Johan Hovold <johan@kernel.org>
Link: https://lore.kernel.org/r/Zd3YPGmrprxv-N-O@hovoldconsulting.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d37d599aec27..4c72124ffb5d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -329,10 +329,26 @@ static const struct component_ops dp_display_comp_ops = {
 	.unbind = dp_display_unbind,
 };
 
+static void dp_display_send_hpd_event(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+	struct drm_connector *connector;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	connector = dp->dp_display.connector;
+	drm_helper_hpd_irq_event(connector->dev);
+}
+
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
-	struct drm_bridge *bridge = dp->dp_display.bridge;
+	if ((hpd && dp->dp_display.link_ready) ||
+			(!hpd && !dp->dp_display.link_ready)) {
+		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
+				(hpd ? "on" : "off"));
+		return 0;
+	}
 
 	/* reset video pattern flag on disconnect */
 	if (!hpd) {
@@ -348,7 +364,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->dp_display.connector_type, hpd);
-	drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
+	dp_display_send_hpd_event(&dp->dp_display);
 
 	return 0;
 }
-- 
2.39.2


