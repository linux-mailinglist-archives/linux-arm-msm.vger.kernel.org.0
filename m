Return-Path: <linux-arm-msm+bounces-83318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3AC870D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14683B2F7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 20:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E578A33D6ED;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rx9YTvrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0E33CE8A;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102580; cv=none; b=LqcqVwwyMOon9sDY63Qsncby4M/fdvkns665A/9EhqXIbkRwOd6tl9B4S4O8kVGSfdLhKCL2B+RbQCdKpT8g2UIW0+TvPknQJxkAd87U0mydVbgkd5msW3puplysHfKeqkVcINR0pWWxLvZVk6XkRFa322THEI8IUuNzNzSOeFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102580; c=relaxed/simple;
	bh=xmOtbEbdnDZUK8n8UPV79lS8HJNc9fONfq/FhvbrZXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kq7oNqZ+3dJHJlNE4R2Q1U1WKigzrQVIeycqD4MrwMPjajv/m1BD1Bhayfk/+AGLmQk1L1my0ZKYkNpo7FlQCElDkGoSioXkBfv3pvE/rfT79U75vaTzWfMr7IY1mIP52CQfrEHvDTjg1M8WbUeYtCIzkeDUURjw09zTZ+n/MGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rx9YTvrc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E3BDC116B1;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764102580;
	bh=xmOtbEbdnDZUK8n8UPV79lS8HJNc9fONfq/FhvbrZXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rx9YTvrcFRkXn8Pb9zlPixzc2NOKkqj1uZIftYNshh9evio+1MMJwt3yVNW/aiDWk
	 bkuqoCeYG1HbqTBexCeAIUe6n09r99Gfag6KDfEmx8Mnwc+bQzHUDA+NJIzKCg39Q/
	 31M9Qhl/MletXnU8wnftkjd/WdO7/MKZEc/WqRwhQc3UAdQ+6xdLNMjTmqakkhbIer
	 9awsBVtF0+3L4JLhX4ZP6d8iyEBhcrFkrenW/z+aBzZW3BnXh6QhkmYq2CmnZJ/Xxs
	 4zJr/26x+NfiM0pAwIEdmy7H0228B7KHcyCm7QU6vRDO4q/cjD5cAro5obYG9VQD+z
	 lGULRcq4jQzow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD32D0EE24;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:38 +0100
Subject: [PATCH v4 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-3-3b706f8dcc96@ixit.cz>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
In-Reply-To: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9TAk0DAPWxZVYTBz3bFgNgm0xGew8ziZCJQS5XGU65g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGxRm6sRwZPo41Mwxyodut3ZK3FkRghiKnCj
 Bz8/Dg7lIqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsQAKCRBgAj/E00kg
 ckEKEACl9YEzwbH/NPMBTBmhqqST4/0mcBKw0oU2FxWl5UP35HBdt/cuj99YzuZv5UOaqwrQcaQ
 F2G60gHfObfkf7VTJKnKnl9iEEGbEEtslgkCCKiFnoCNP3Rrq6YSRC8cZy/RP6t2ee3f9SE7xsa
 Bu+/4njAMjkJgdn4RC52J7/GTamfr5obbRQlCVn7lEDmkwPKcTeybpyyBhl3l1MYyefuzvYRXNs
 HM64dP3YFCOVkrMSOKsG3HegrzySIhE+0Ufcb7JoPAibjMOGucNNV5PJBY0lHx3ow4K0Jw4pZZP
 J9P8j1ZqggAJsw8/32SfZ+PXPs0uZwocVX4opQBNKDBKLdG2MRT2BOsGVnppGxjcDLGdut5BIKH
 3OUML8BViKjwH5fqbdc4YvlmBe4ZrTLUJej6VZIrHTSVcvplVCkWht3dNzHUO8YrvpLu5o5pSF6
 YxNTnZ0tlCW1nPcON5j0e4vjmQpCKa3UAMx7edxy16DOAnwjqYWlP0EDbbhxMKPEf7ta//7gM6t
 qnuwCJ7B2BhHNLumKm/zPCVN5CJ1MzCUyqwLpnFkWX5pEW2h0GqkUfF/xjuTgXffvbnvyIstP0U
 mRXrIEXmjbX4TZlVhD1J/Xi4tC49q4yQkfF1rToVtUBdjBHiMi+6lxPHSj1NBBsMPE39sA0+7/j
 rSjpl6WXO5wWNng==
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
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 46a56ea92ad9f..dcca7873acf8e 100644
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
@@ -214,7 +214,8 @@ static const struct drm_panel_funcs sw43408_funcs = {
 };
 
 static const struct of_device_id sw43408_of_match[] = {
-	{ .compatible = "lg,sw43408", },
+	{ .compatible = "lg,sw43408", }, /* legacy */
+	{ .compatible = "lg,sw43408-lh546wf1-ed01", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sw43408_of_match);

-- 
2.51.0



