Return-Path: <linux-arm-msm+bounces-82268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D2C691B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD3AE382161
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E8C3563C8;
	Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T15GzIIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47818355803;
	Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465444; cv=none; b=TvYN+9Wnjq10NUvIOKC+I0ky07lslam9eF7x7w0upU8KrvWYoOX41bIsSsDRPdW0H6K8fLi0qH/YnaJF5sKgbaF+ElGeJ0MK04A9/JRCuxS3+Jxy2wtG4s1fBTrf/MFivbx4SubE1w7SnpKMBYjwx4Oi7ZlKC+swmr58e0aHUNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465444; c=relaxed/simple;
	bh=Jvy04bdhFOpSrKWmAa/V6bG2TAo9p+ugcVVOIX7cwWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsMkjVY01k3bEwppWY+82h24ZJka3BBZTiKhUgpI5FRyA3SXB5V253HE62bsc8omT3g+i37XKb5Kk9GRROz7vju5WKkQ69maX5udzLs2tY2zCpTFEXQlfcq2hwKy9xRBxA3bRwAoTa67PvJSbWnuW66XRbXUCy/FRTe3eM14vYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T15GzIIN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E780C2BCAF;
	Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763465443;
	bh=Jvy04bdhFOpSrKWmAa/V6bG2TAo9p+ugcVVOIX7cwWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T15GzIINkWnScGjazf0hVjQZhF6lksdFd2EzM+PiD1zhO/8Xpo6gC6cV54P9dCSdy
	 GnAaSC8mw6xMdUs7sAW8pcgwYrQyrw3hyrHwmSkBLIai8l2iCYYyzJoiMgWDSkchib
	 fYUQGnZHhhfUDHEbGbCxI+e1VJG992jUl6gAeUDXjQn/lWxRtYPu/UKWu1Gn65pjRq
	 tCpxxnpNqk9aEpYw95C5jocZdPQvLFLj7kUdtDLsVWv0FG7iw/xj6HrXgqaYrr8CiV
	 8NTMJ4w3FFqaupMMcQpyf7W/yXrOxwc4xyYZBo+54FigtgOJ2ZM7xTI7RaDd7JZ9A5
	 ud2ykUW+9WyFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E22CED617;
	Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:38 +0100
Subject: [PATCH v3 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-3-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zdnKJDIMeMRyO+SWDYgfxVtOGiWokm8aDgNXOD3aXMY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjgWqFBlPThDTkfgTV3N4jMym0YwB4V2B+dW
 6PDa8UbHRCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 cqXbD/0RNQIrlcYy/v35U2jD3fu+nnPV67tqnJajTOoTXZLZ/mcaqg/MnDG95MkVC29lhXajD5D
 6E+a28DGo0YtIlZpYxLq2AcrkcVO3zfbN4WLu2eRjjZ42sgE+kQtHOnL+kWX0FnNbf0ZVoiTMnY
 E6Mmn+A/2nBM4BL71ZzqWQZHmD2kt1DYLle17JQAcY3EQWN8Su2sNW6ctvuB5o0yOSnJmRY5uLl
 3O5NIcdDlzk9N+h8ViMTlPLLv5zzcP8t+1ozTyocz/FiY9NjxG9PBTsuoiKUCd3hW+OKVaggGFW
 5307ZvWd3yI+aQD5UY05hNgif72k38Vl8Sk/CfAQIPe0lXpTzWCJ6EC9frJxyeEhnuPefGFhX+9
 d/SyJE0RWM6j+klvEnZvytF44qhCXufuuaXrVReAEu6ylOC3eoyeYI20fAyBoRJPLKXnOeGxrhU
 OPhkXgHmVzcW4PTmaW8p8f3EKF2jhtn6RCkJ4cMQ+R8f5T7NP3wr/dI3D01Fn2A+m3r39CexR0r
 Gj60/U3YiSsbQMKXdc0RSZZ3OYKqiRSe81BYwNX/0rIjrZqtXvAfYPVvppybagDEmeSXUP6Do9z
 JlXL7jks19LwWxzmmgWsLPshA3Bl7osN5AhEYCPnuGBYQI3fzVsRqWpYd8joqBj9uKeGAL5F4zS
 AC8geMn3XdtDJfg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The supported panel is LH546WF1-ED01, add compatible and adjust the
struct name to reflect that.

The standalone compatible lg,sw43408 will continue to work, even thou
there are no users yet.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 46a56ea92ad9f..bd55f6d8f2771 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -149,7 +149,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode sw43408_mode = {
+static const struct drm_display_mode lh546wf1_ed01_mode = {
 	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
 
 	.hdisplay = 1080,
@@ -171,7 +171,7 @@ static const struct drm_display_mode sw43408_mode = {
 static int sw43408_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
-	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
+	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
 }
 
 static int sw43408_backlight_update_status(struct backlight_device *bl)
@@ -214,7 +214,9 @@ static const struct drm_panel_funcs sw43408_funcs = {
 };
 
 static const struct of_device_id sw43408_of_match[] = {
+	/* legacy */
 	{ .compatible = "lg,sw43408", },
+	{ .compatible = "lg,sw43408-lh546wf1-ed01", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sw43408_of_match);

-- 
2.51.0



