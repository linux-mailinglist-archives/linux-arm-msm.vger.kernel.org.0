Return-Path: <linux-arm-msm+bounces-80368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7A1C332BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2326418C30C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6A233CE83;
	Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzHmzXed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BE311C1E;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=B8x8eMhExZQvOM8Z6D+vL7BQQO0DOfh2CJ1/05zrnz3D2wplVslpxF7VTJj60o/b20HphrO56G3e9CwD+5R/WfHkbeNLQTmq2J6FH4r+G723H44Kxz0Y3wMsJZQJydG2WWYRiaz6oOs+N+QQemCgEL/dqxBWhw33/lOK9HBN9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=tPw8QQtkgQ/ubzRfXEkVGYixKgB6MJOxqmk7tX3ogMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2PgKpKfLyjHPZI2yBF/dd7uerTzssZu9IAbRkH4shlLHVtRq7VLdRVbuBhUYUc8LbKvv6RygdcbkdbLekngeJgzFkG1pk+CC2oQhBzTxiAIrRwA4BSdWb5XHWGO+XNyL+nrpJX7swBMRH/dhgRwgT5F+sk+3nd49li/Qm7Qklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzHmzXed; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15A0CC116B1;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294575;
	bh=tPw8QQtkgQ/ubzRfXEkVGYixKgB6MJOxqmk7tX3ogMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DzHmzXedMuO81RjbAynWr2b6TupVquttktUSNQry65OsF0IC6aUuzLxVb8NTu26zS
	 pUXhuX5kc8b3L7oGN/wJDLc2XCPlpnf0s3dg/8EMSUuyly0VqGJ5eSMB57rMouwFXJ
	 DEnao42SljziSu0/NGCATHN1B8pkfYrm0NfL8wPz2/poajO25sTijUjJc7TPxtSFLT
	 opp8lNYgiAJJS7xR3PlLe1BKSVyoW3HeaS92H+u0YRfQFl5KR6CKk5amwqQI0q4SMH
	 46wQdmFSctm4SA1GXczpxLYhjkdStbCMcOasW2A9dWU2f/9T6fVyZy2PMoKVf10xvr
	 JENzKYbBaf9wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDE7CCFA07;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:17 +0100
Subject: [PATCH 09/12] drm/panel: sofef00: Name of compatible should
 correspond to the panel used
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-9-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Q1+rieBGQ6VeDwGqVLQ0Szo7yx1/bCpLNjnwi01dWXI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnssjt1R0WlC9R9CBT7rMfF1j9rawbA1vgPw5
 uF09VOMmhWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 ciIjEACdLKpaSOqpuNGJ6mcYFlJ/2DUTm7OCUG17xINWOVjF0L1sPhuNVtoA0DHr4P+0yAp56is
 kHxWCa6Mq3ggsm37Oz0NSg5U4M+7+PpUycKv4EMIBuThrGtKeTR+Pnq1UbcjPfQKuYFCQduC7Jq
 d8XeGsC+rb2FDqmhbF5CRzUZWbhs0XoAFh1wJb4TUNAzJ1pI1WAcbDyQnVUA0ISyV69ceVq6Yqd
 tqGRCj5UKf5RRUQh2HwIHDclrvH52UiWXYuRcSAEyPAGKpK+94wrWDDVX4WA7yTHWyGUBjveY+i
 Toy/fRW5vXowSJSYPE2gxDCWL3cLw4vIWorLpRqboJ6PIUHR7RRyRTUajRaETtJ8r6AyjIjxA55
 CPXvbsPFbeWqiuam7PZTTPomDAw7e+xHSES4rkPOGE7oq/f7X3ot/gSKgvHCsDEfMUnK9dIzAqb
 dlupjSQ19/upqeygiGnbZ00TvaW4oiTF+NY51R5UPOuqxg7oYAWuWd3D1TngiGfKZQ2ogbubbOg
 xHVowEPtSQXM/JpBA5tEKDa32c9dA7fA7s9xet1eKixQLMxssoT1ukkh6zbXD1knL340Yw0DsQv
 rHEj7kkL+tiTVWEvzPZdtsQ3sESa3lZrZoWDQp51pWpYcD9OdfUbyFeVZ09YO3fwg9twNYrO8Rn
 cdiSK2g2Wcwn94g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

At this moment we support only AMS628NW01 panel.

Adapt also the internal driver structures to reflect the name.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index d1e5340d7e337..7947adf908772 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -141,7 +141,7 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static const struct drm_display_mode enchilada_panel_mode = {
+static const struct drm_display_mode ams628nw01_panel_mode = {
 	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 112,
@@ -159,7 +159,7 @@ static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &enchilada_panel_mode);
+	mode = drm_mode_duplicate(connector->dev, &ams628nw01_panel_mode);
 	if (!mode)
 		return -ENOMEM;
 
@@ -274,7 +274,9 @@ static void sofef00_panel_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id sofef00_panel_of_match[] = {
+	/* legacy compatible */
 	{ .compatible = "samsung,sofef00" },
+	{ .compatible = "samsung,sofef00-ams628nw01" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);

-- 
2.51.0



