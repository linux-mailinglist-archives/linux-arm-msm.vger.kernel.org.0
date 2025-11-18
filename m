Return-Path: <linux-arm-msm+bounces-82271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D8C691ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 667874F131D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63AB3570D5;
	Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unSph2id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C923570B8;
	Tue, 18 Nov 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465445; cv=none; b=a56mMxIX1VwltKjlv8ZpmTL0KP+nQ39UwU+NHVCsEshBZAack6QIIZgzX5PmXeWpDIpMXA7Gt8M+Z8EoNcKIK39WOq35XYHG4BOPwYNPm/KACLcs+NFWfFqQ4XKsnUTZaFGFPikeHdYZ8zsPjFR11iYysqqD62+4V8PAJNNObiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465445; c=relaxed/simple;
	bh=Nn/edi8RqD+VO7nxTYObHDtKorWy8GLRG5Rx1vx4iNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLD861Uye2n5tG4MFIpF6Bm/xQ7CJGCmPLpNkgeB+BQI1Yp5Bcv7tTJesVfZCMrF1k2JIdwydtIRuJ17CaDUj4CLSttaeg6UOFkNOvMYnI8W6QRZ3M9t1UIIBhDeYrQiILVnF4Dmz27I6QzhPpFk8o6fTxiYGCUVWDlS3MRXwBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unSph2id; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 453FAC19421;
	Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763465444;
	bh=Nn/edi8RqD+VO7nxTYObHDtKorWy8GLRG5Rx1vx4iNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=unSph2idFkUjafH1Rak53X6EsCzlgl7dmL42GUBuJV6ivWEa6WyA0E4LFk9oWhJZ0
	 0Coh079ChhBo5E+ikNw9ro28qpoG7VILXDsqWRYzts8PImKvYSsfcf+e5t1ytbS+8z
	 RGAhTX82blurWlqaI24AujCnIAeQpllOqp80zBINLNoeb0+W1MpIfVIfZo+BhBzbtJ
	 WT5Cxddm9H2oljBjk5qrqRHqcZccxo6yJEWvfVstAc+3iJdStKlSZ6qEYIJZrRGaAC
	 QCzSWiS9a06BvVyAu07Hxyr1hPH/bwNBRPe9ohl6JUYDZDuXvziNCzzH6oh8eu+yPI
	 PmINYYUuSHHTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFE6CED62B;
	Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:40 +0100
Subject: [PATCH v3 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-5-317a2b400d8a@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=InL4IEJK9SCfpvLnrH751SzB3QvgsZ1MDVnoJ5xWIq0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjgYbn0WPWPCSGgCqAi80SoSxWT3vZwegAVa
 OXROI5fxDiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 cs05D/4oJJX22556aW4MvjAKcBubbkD6X06QIGWjSeo5Nr9LdeIfakO56jEXd918axdJD/qg5kx
 cJKmfnmeQdFSSilK51YTcviXAjTmXHmYqn94jU42AuYGfhcPjA0PpND+n8dFa95n/++GUL4ufRD
 4I/odGbC+cRw1p1YeIf7xCh0rS0O3ma8UdMWhqPX1Hd8BtEyN7ZzA/rE2GSgO+qD/30SNNOI/4p
 9K9jerDo83mdhc9g+CzXqFgU5pTgY8Fe5afYbTB9pg3nCPwOetcytpHM7hX0bRJXQZctoj9oQ7z
 ZHAhEgrVVfIWn7Lj/Oexdb8sEN2unpSLrItDNFKvZzOd3T08F5AYRbNpfKeOY/k0I6XZz9O3KYh
 t0A1NBGFgn/Lfd1BCPqg908Z65RlqxhMYWV4HNgRRUtVhBtSqlOxu4RY2mVKGmjGA2evxdeEPxn
 fXCmIUxuHbux6TocNwEbJRMfnp64dNNgyyO2dr6ooIgsQRho3VvLS3ijKHeNrZJIv3gZV2KboV+
 T1vj7y6oKDRvob8GqRX2/sOiw+tkR2s0nU4jDx+VICk4Jd5zN4tixNBi7vXj7yu5eXJQ7wmSWx9
 uZBdeq5gNHOdW7bLFLAfyvEnIc2iPQusJ2e0NGfKyXySQ1dxj6oWeBiyWig3G1xwRaBW7LbD+Uc
 Hbj4I8BllB3gA6A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The drm_panel_remove should take care of disable/unprepare. Remove the
manual call from the sw43408_remove function.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index e5a8a9bb8d15c..d8481bdafd6dd 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -319,10 +319,6 @@ static void sw43408_remove(struct mipi_dsi_device *dsi)
 	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = sw43408_unprepare(&ctx->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);

-- 
2.51.0



