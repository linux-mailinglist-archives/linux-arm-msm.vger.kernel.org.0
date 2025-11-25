Return-Path: <linux-arm-msm+bounces-83323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E72C870EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D2024EA968
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 20:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510DA33EAEC;
	Tue, 25 Nov 2025 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A30MA/mY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1133D6E7;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102581; cv=none; b=OTA0I2EOvlSVTVoVkPuTAtlg2XVTSVOXax3Yfh2VKSW6BbmOMcgg7tjH2ElVX01QNDXBhmp3OhfBzsHEeOyaXt+EdKxXk1ivKxv0Ybfxhe6EXLInCepMKEo7/VpimUY452+vbilL5d0aC4plR1jzQ0AfqEUwkGzkVWD7a41fBu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102581; c=relaxed/simple;
	bh=3uiswC98cz6sIU9BaLM9/2RtNSvT2DFG0NghU1VzrNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brV1CPbNGsXUvLP38k4+9/xxVK/aFDF5g4kASSvC3o80KKELS/XA27O77OMLinJvKcBe6GDJXMx9mwFmmkdh6lD8E33ERP4fPJoNn/Jq4nquX4bMgxWT8Ebwx0iZnzwBsPzjn0wrLtTAXuughJP1euOdOjmi0M5KrBat3Bz9Luc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A30MA/mY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9816BC19421;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764102580;
	bh=3uiswC98cz6sIU9BaLM9/2RtNSvT2DFG0NghU1VzrNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A30MA/mYKxqBniqeNyAvsLKvzgzBS44DZrP7oTf4sE1GtRvbikCUI+f9mw1wc+IaA
	 b6TA2MAYlR6jVPBKahk+AoxdM+ng/7f6CiuAkPBFMJfuKXgmQyC7OfToZPqwWyDjBT
	 ryBbLuoZbDZ1VNF6lxF53tKWqdSn9cK0CGlvG5bSXv6HK3PkIvKgPLdGBGlim9kYNg
	 M2RtIdFPkupl+QpcmnFYqGmDI6nz0xk/Q5mhqNPFuq8Ajn0YyJQpWHaBhHXql7id0H
	 t0gLmQm42FLRMclfQ7LcA0LhaOb+nm/N/PN7awQFSMcOrkQisH8b4vwjuS12+Zth5L
	 uVJA4CjWJCVNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA22D0EE24;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:42 +0100
Subject: [PATCH v4 7/8] drm/panel: sw43408: Improve wording when
 reset-gpios aren't available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-7-3b706f8dcc96@ixit.cz>
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
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=eyxrhAjo3Q3LBCz7245BV72/yNQ0oT9ykg2uQo9OmMs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGyTxgwG8AsET/cblYpmHX7APSrmhsNA85TZ
 rEKxp6ieWSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsgAKCRBgAj/E00kg
 csqZEADEmGJFmvTEMJKBfgf7QkfEJ8QSHlzdoY/CWgcOTODlZoewA+VUHWBjNdwe8u8sT8NXB6L
 WdQMrQbhIUJpagjYk7H6xgWR/d8WOP9iQ3WSFBGphi+s9SaYblfPR0zoypwBLh7BqOJrJQ6Vb8K
 Fly4A6O2BfWY7JBqlTnBfH+fs/jvDc9UYkzbTCWKFjQXD9gaAZ6wRY5q3mbh1xJAbI4BRoCzoxd
 hpBFilesNdkiKyQpOT/xDrd4nfrGb3kUxrU6Pt2SKoKq+gn7HDzBUVtCFtI8Q9WYOMpER257iKQ
 bZMJqcbUn4W9PbZ1upR3C61195GtlwHjgN7L7WJgRB//lzCy9Wc3f+ctG1cE9jqrXkgdNqrkTfW
 oR2su62hd4G1g1MqCrgCHGugzhpUyQNpok0S8bg3lmADlu9DJvRvIkvWOpARmhcdmw/KwKMFGo+
 gJQWnM74c26gHvo0fNFpYm7yPZvEOIenOhlBrlELY/DlUEjPtGhzRRE0czqV/JFQdW783qx+5yD
 8rDSoYcZ7tKchZfmjTWw6CkTPELYYo11uyh4RiNtP4xvx6ST0qB0MKGN2slL2HU64ejVYJJWDTK
 QQaelIyq7/pC8hsDmieswlw756IRx5bYZ+NNcFkRPyBMJeLv1H8yuGgq6ThPWwbhpNg7Eiw2OdB
 ChgH/q3/xEoIeRA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Choose better wording.

Cosmetic: also inline PTR_ERR.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index b147f337a7861..c6384b02ad6e0 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -262,8 +262,8 @@ static int sw43408_add(struct sw43408_panel *ctx)
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio)) {
-		ret = PTR_ERR(ctx->reset_gpio);
-		return dev_err_probe(dev, ret, "cannot get reset gpio\n");
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
 	}
 
 	ret = sw43408_backlight_init(ctx);

-- 
2.51.0



