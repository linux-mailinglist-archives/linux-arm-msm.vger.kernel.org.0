Return-Path: <linux-arm-msm+bounces-115886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HIMcKQczRmqILgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:44:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34B6F56CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:44:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=hwovFDJY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115886-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115886-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B9E13175CC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F6F47DD66;
	Thu,  2 Jul 2026 09:36:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505147CC74
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:36:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984977; cv=none; b=Tj8X5sERLk0vHdnue9nhJTUXYcFT5CIiUBUjcJkrRTXueYtB9hMtMI0HGD3ABAvnjMN8e/skMkRcToX9gIEAOaJ+zzXkqfC3Nz2GJAXIM9Y/Jjmi011X4CKdh8mzDt4WCDXD1FENXkcrN/d12R2jfF90iAGtPttBvTSEuo0fRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984977; c=relaxed/simple;
	bh=f5/dVqkaXjhX6dtp61tSmUjJiQd2J/ejrflXA7Mzdjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShAAGxaAWLZkvfUyrZKk+8CUc869jeWZXngYyrpPBlb8xCynmkvw3DI0ON4USySX6UlZr7gKS7EA2S68aA/3t7KKB4/8p0+0ROA8oHRVrmC6Y8ZLcmdQkN5NvKI1qZ6Pe3bhw2Tk4p0m36lAn+uxT/VGDMknspapckOmxYZAOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwovFDJY; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso7465245e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984974; x=1783589774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oX956Ovy0cEzFC2KbieHkOQE6+VfzcgweLx9ANa2s88=;
        b=hwovFDJYPztBbLcuciNZSpjAolZtqdXK8G+Y3n50nJ4AqHBBgrW1JKnwSl8r1yUiMM
         +SEzjB1LNAmesonN9uEY14Y8jMMClKl5eahch7JR0kgSgO3NNcZNOUNtCabU6LHhl2U5
         cgTsX7M6oc0ODp5QG4P8x3lpzjBPgV3pcGwSzUIwlNzqeu0JYjcUGPTqpYQFK/sCHoYs
         1quFonCBkOTEJFkSPHU1RgiCrAwfwdScERKegltgdvJL65B86R4GUo+2ckQt1ho7Vcyy
         fsqIDGsdMYe1bBygj7Q8O4ky6fFdNFJk5/+bL97SYB64+eK9EXdUcRoXJ7xwo3VWk/Bb
         GqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984974; x=1783589774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oX956Ovy0cEzFC2KbieHkOQE6+VfzcgweLx9ANa2s88=;
        b=eAEFJLkZX01xLrSiR9RgipqeBRHdsNiMYE8j9i87Ab7Qgg9NvKCpjdhjoX4GQRiBwZ
         4ktHTPaZWKc1dzN9x7a4+6QR7G7Z+ryq0F4/FigZpnNfCXIMKEvUnDCSN2rSsDNwq1T6
         Wk7D0k8bolO8774yOue9fSzT1w6Lq6EsGjqiYJXWayYF7XyJJCmU60ZM/CJ+n1pnuIpq
         5yIMMREa4tLyNts0WokuNfPclVT5He2xt52SACLeN2ldwQU7pFuUPxM2e8MfV5a7nkhr
         4jXBeWDXqKuLiRcGfok2qU/fPsx4+m5hF/mZdjv0N1rRYVGA4LDT7HgnsB6vK0LljmyR
         PZKQ==
X-Gm-Message-State: AOJu0YywJUnlhnnPn6JL3H7Twpxr/QStqjeORKpG4UffWETEF7PE2L54
	LYOiki1bJO7LzR8Tf31B4RNf3jAJtYo3PSD7M/578damueI3pdaULxdurtisa8AqABE=
X-Gm-Gg: AfdE7cmhB+Y5k+a4CjphfWJznvtsuDGyQxTvE7TQittvK/NtP+Wz4o40xshYTFEFLPB
	CPcWmpsbJZ0PXQCWcszXhVFUSlnLnew5328NvdetPkePYNyQIbierj+sYCJY3uDkeU4R+dkmrQR
	DA1WODHZk4AEaTcl/jfnyimvDHejAmOlw4VYQb2rwywGlZfZIGN5sSS7owSvTQeCPXlcFay6Uq4
	aVuyF225qBwZ2nezHt/4/ObPNXW6f6F0AUSuMoiU0pqagZE9OSoG2Qn/PnrzQ2mMroBr1jNINzy
	yC5bq4ifxATgaMkQu8yeTST8F1qZQ3j1pW34lPWpJMmNdcs0hixGFYyU7xoY3TfamWhC125qU6q
	l/7gw7sP9xhmUWQDI9GCrD/s3eLYsjNopNN30dfm/MoVSq+jblNU0q0d4NfYdt6wIO5TaNVRlYR
	TU0eREGcFifT1nDUbMlxt8TpziDhQ2qPVqXg==
X-Received: by 2002:a05:600c:3b8d:b0:490:d32b:39c3 with SMTP id 5b1f17b1804b1-493c2b15ee4mr86442375e9.6.1782984973882;
        Thu, 02 Jul 2026 02:36:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bf11eba5sm80524765e9.0.2026.07.02.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:36:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:36:10 +0200
Subject: [PATCH v3 2/2] drm/panel: visionox-vtdr6130: switch to devm panel
 calls and drop remove
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-vtdr6130-dsc-v3-2-db881a3fc026@linaro.org>
References: <20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=f5/dVqkaXjhX6dtp61tSmUjJiQd2J/ejrflXA7Mzdjg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjEK8oIWq0Oo/YkU20Lwe77u8bNp/y+X3TwXt24o
 augNc62JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYxCgAKCRB33NvayMhJ0VQ/EA
 DBdOBslSavV4v5JfWC4z6QH9IdPIwjq2jnSGJrLffk2sxQLd919D2nBmHjoGaP3nTisa1zZDIj8YNA
 dVeTMHy5jQt5XyVZ1A54+JIoJRiRMr3l0eL3zFPNhhPSCz0pRJqUZEgNslPZi8eMXSQ8ASTA8/bR6A
 IEn9u0LZmIhDOKrVrp4O+WujEXUPZAmK46Nu/xahmhqm6tf3wfugymz3U4AC6dIX6WDy30b0hyVWhK
 EdivzBlGEbBxXSflsFNtBo2GIxX6VmfAMJvYmpvXoHd8DcScNp3q7HigmpImfL2kAX1zU8nMdmW2yD
 yYM1Pt81eJSPsLCRpAu4bHYiGgTXt1i+Us6gwQvOBBmwJ4wyVnVLRXnDewf28cTRyOzP3NAUYaTHrT
 4OOB7dnFsVd+7/+qrn0xCUQ+kBcEQ+haHr6K5BwzN9KOf0boGpPpwS9Ut0Lh4Ra21VWeRy+x9XqO/M
 ZrgaZseJPkwdW3xRrImNZjefzY2d/ZXgb3xnK/7Pr2+qFsQkcTrCfaPzYz+aVa+VBt6bFZgK6OEV+l
 sY/qMy9A28D/6UtYHDgiJ6bo2iIA70/MWAAVFqCdJGfmC48HzN3ndW00t61OxMdcI/FnUBH5HcFsr6
 pdWEvumGxxA0dA+aC6/RNgoofjZI07ZrKrtbRsOUA3q77wV31hFCv7OdRWeQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115886-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F34B6F56CE

Switch to devm_drm_panel_add() and devm_mipi_dsi_attach() and drop
the remove() callback.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 0cdcdbbc766d..6733e0e1d061 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -298,28 +298,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
 				     "Failed to create backlight\n");
 
-	drm_panel_add(&ctx->panel);
-
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
-		drm_panel_remove(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
 		return ret;
-	}
-
-	return 0;
-}
-
-static void visionox_vtdr6130_remove(struct mipi_dsi_device *dsi)
-{
-	struct visionox_vtdr6130 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
 
-	drm_panel_remove(&ctx->panel);
+	return devm_mipi_dsi_attach(dev, dsi);
 }
 
 static const struct of_device_id visionox_vtdr6130_of_match[] = {
@@ -330,7 +313,6 @@ MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
 
 static struct mipi_dsi_driver visionox_vtdr6130_driver = {
 	.probe = visionox_vtdr6130_probe,
-	.remove = visionox_vtdr6130_remove,
 	.driver = {
 		.name = "panel-visionox-vtdr6130",
 		.of_match_table = visionox_vtdr6130_of_match,

-- 
2.34.1


