Return-Path: <linux-arm-msm+bounces-46141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E7A1C9BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A455A3A9A89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 15:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4871EEA3C;
	Sun, 26 Jan 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A314vuzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDEA1EEA30;
	Sun, 26 Jan 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903254; cv=none; b=CKmBKIuyO4DdIr/QQWxmIfap5Ucz2Cng6PxzrC5vFW6rLjE567xKzIWMwBjcj+FVUWsAKJZBGhP7/DiuSmkOUPTUAqXCEm1yTjewdN4TVLiTsuLqKSVZCmWqYgqUfXekHsLHSXzWZLy3FyyPcLmLeOghwMRfynD8glmqZ+3m01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903254; c=relaxed/simple;
	bh=4mlVLYchybKNez3qJJsuH3/DFr4KppQ7p3VC8ZQJ0rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oOIOQxfg+OjWwmL1STQPoyiAArS7e8h/3wtEb7h9X/gVagAgS9YFnnA8N7ZrwFRC+UJbdo/jkvYnWbTAPD0rNLzG8IepI6iqz0Br+DdC6GUadc2HiArxnGRyI80jYhHsg3BfAslGBVR24ux2ysRlfiR8LLkvnMLdiErZxOyl0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A314vuzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B334C4CEE2;
	Sun, 26 Jan 2025 14:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903254;
	bh=4mlVLYchybKNez3qJJsuH3/DFr4KppQ7p3VC8ZQJ0rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A314vuzrLi9kC8d2vZdNGc+1YPL9GpDsZdiYhplYiW58ifXMf+b7yIS2hq+vSSN1K
	 Da0mNDkUlD8HYLd2iD0GxeW7PBu7hbs7Pz6IuXaUGZcjbvfA6kr5bIn3pnVnQ04Dbv
	 AhuSZ9LOiutMwVO33q2P40zHX0xrU2BnIFOjeWo3/BMwcmQ2A0OWpsmcAGwfx9grjc
	 NR8bWvaDGAr9kCkNXRbBO8OfvXaltvoWzzwIaHW87OhzWVdecIGNyoOkY+gHd4sEY9
	 25K39JqCU1N5ymWM8A2Xfpg4feYpoEBykqZB3C+y6+92Hobr1HUJM2vF7CdrEn9zr7
	 5fH6JRE0nWg2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	swboyd@chromium.org,
	quic_bjorande@quicinc.com,
	quic_parellan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 19/34] drm/msm/dp: use eld_mutex to protect access to connector->eld
Date: Sun, 26 Jan 2025 09:52:55 -0500
Message-Id: <20250126145310.926311-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 9aad030dc64f6994dc5de7bb81ceca55dbc555c3 ]

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241206-drm-connector-eld-mutex-v2-7-c9bce1ee8bea@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195..0fd5e0abaf078 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -414,8 +414,10 @@ static int msm_dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
+	mutex_lock(&msm_dp_display->connector->eld_mutex);
 	memcpy(buf, msm_dp_display->connector->eld,
 		min(sizeof(msm_dp_display->connector->eld), len));
+	mutex_unlock(&msm_dp_display->connector->eld_mutex);
 
 	return 0;
 }
-- 
2.39.5


