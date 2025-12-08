Return-Path: <linux-arm-msm+bounces-84650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F2CACC08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 10:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D015300C28D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 09:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B481D3161BB;
	Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX+y6vh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD0315776;
	Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186946; cv=none; b=E/E9vqiQEth22/U8GUBUlYhidHtJaeKSeQv3B+O7P3heNOS82AXFjxMVubtWsLR1GkQScz5I0ZxZI84jgpCMgf6Gof+zaOePWhevQd3neY6t+2fs0abT7prYaf07sPKEPHUIReoCdVH+/fDGFuIclEpSWu0K01TOM875Ngy9q8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186946; c=relaxed/simple;
	bh=VU4ncZYAaVV7r9VtJ7Ny0njR6XxnJnIWgd77T2EV1hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2ELnsyPQ/exEOmiPYqPkpzUd+jkhv/EcyZUPg7IhfyG0RGKFapQsLQHzooq2q1osMg5nbtHNb2fKRIoS6CmPVpY7NgcglaXUn/b51xpZ7iITccL9QYTqEpMMqBhS1+xI8yXAh52jhjB6JN3IFQqeA6rG0hBk7y5FS5AJzdxhZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX+y6vh+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1CBBC19423;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765186946;
	bh=VU4ncZYAaVV7r9VtJ7Ny0njR6XxnJnIWgd77T2EV1hM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kX+y6vh+sIpjKq8dwlZcOfMNwdig+6SsF+b/103KoOzAoKPWRTKGgBV0H1Iy4YNBF
	 +Xw94NlbMGZxDoWEP4Vz2ZfM4IqBO646kNdhfXmPIXOVngTBthaCtdWiDLEgbOw36E
	 MbLsYKqnA2Z/lTHVVb6csKUOgqukbPmPKObivx2z9PRtBjV+ikoXEHt3802YHQj6GZ
	 /jeUl7cO0ErNwtwF6m9hoBXpPaSjtwQ80UoN/313YkgWOhX90u0gLo0iwJm+gI7Ztx
	 DqVjhx79rusG/AKAysWKurt1t7SVNyugmd/77oQZDTo9YC+yv3wnDkCvXRyl00qpP7
	 +IlsP5YZwCxXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F7BD3B7DE;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:42:00 +0100
Subject: [PATCH v6 7/8] drm/panel: sw43408: Improve wording when
 reset-gpios aren't available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-7-e9e559d6f412@ixit.cz>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
In-Reply-To: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
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
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dZWtlEK2SHiGGTwbkLjudIbRYRyXhSNsD11k1PpY920=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/LGupKmLwTHUbdE6Mi+rzMOjDQPVev4qCi
 mgH9TAz/uyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 ctjJD/0bKiC9ji2CvVmOnM+ywdGjn+QPwD42c2H6AvGxTEfob7IUszojjuZW03ruHecKGE294zl
 3SBIw5S7sFxHhsMFuD/fz60PJ9CoPesyprWbeh7WAvimi7yRP9W9365CwnOkyBXCW1AozYia/sc
 LVBd8fPJ8qMbuFpvzRPnD76TcyLsQElLEqzJrpDWgEuyTSlUcUJNRYNqPxPuxiN5W34MZ2mfrU6
 nYlCE9Ya2eOYL6CexaA9eCoip9herkSAiALZYUh4YiDsuKXydZTrmrjPzqLQq/kynBm2F1ORTNq
 ksLUHv3pvTFswoCBfIcVX0tGdnkxbd8g6Y9/f4bD2DZDkopv17DbuAqEeivBgj5+8nkPgc5VwIp
 nX+i9dLexMfY+K22SjFNV0cBWgTykTJZ9m0fJpLRmFuKZDFkhPXiwDacq3CF6wLTG0AbFge+oD+
 /gy+UCfY55iJWHioZTiPi3+uwV53l4WHi28oqe3WW7I0lY2zuOa2lFg2tD7gXFt3dwDHquZO9W/
 uq/hd73uVDMIP4PTYL2/tiHHnhTYaELqz90T60mSbASzWO3lZfpygFTrncQ/DoF1an7j9ZOwvhL
 v/nq/gVWMnk+KwHWJaz7JwcFV8D7Hwwk4obpgTR+yiU9D/uTGd/9JWaOl4ogOCQh3gY27FghiAz
 5Hk4PI2REPwmDXQ==
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
index e8a970b53d873..edc7749d98d71 100644
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



