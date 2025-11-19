Return-Path: <linux-arm-msm+bounces-82518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071DC6F40C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0EA5D2EE47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B51369214;
	Wed, 19 Nov 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwCLXods"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5766036920F;
	Wed, 19 Nov 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562105; cv=none; b=LitsqMqbbv71+CQQGnora3lrlyPBfAXkm1dUoii4+YA9CMj9u/kj7q4ramFHgHXcQq3txLblsma+2hE0ozfhskQgD0KP0WgNo0+s2awL1UAg16cbEUSBngo7G9s4fgS2qRxUPtPglua8etl0yvhCc3wvBED39pELh0+t7yJjbnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562105; c=relaxed/simple;
	bh=n+MbHJLuqiHoMoKEy+fupno4fvWaPOq/2PFTInr0Jy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bsMM8UYvtV1hYM0Glyo2o4Gb77DLxmqs/9j9dQwZNTMp8Y8jpKzf+3VBKMM/jTUzFvzKsMqPSmfYZLB4MkbWUMvmjPBm60WiIuUtT1cHxqPERXjlBwV/BtYql2pCwR3YomjMrjrtHeZSt5K7fuaDXOJ0vflzovio/i/D/WWBptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwCLXods; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E63EC2BCF5;
	Wed, 19 Nov 2025 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562103;
	bh=n+MbHJLuqiHoMoKEy+fupno4fvWaPOq/2PFTInr0Jy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gwCLXodsyHfmtNp7eq1yhZUMKBugmKMftla83ywsBspR6VBMXRv1+AINc4tkzKFOn
	 Jzl7KrbkXvhpitTDxyn0TQeZjbtZT2k4TSW3fVtWu7MOanxKPUkie9v/Iphf3TUHnx
	 F1UghfDBWVN6zHAHiVf2tkPmJJuMhO7cIvB/teViPp+7s0dUV7jijqEipOWK0b+fNJ
	 apYkmdnjmLUBuTE2qCRkrkrj8znBbL4B6BIvCaIb5G6rEpVove3pPN1nPuoZ798p/E
	 xDQohpy+I1E5WFA+U3coDHuiNK5cGM12ZGNg053DsXHXWOwff+5qg9H2eC/SIjW4m0
	 BQcA0AZtIqKDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34101CF34C6;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:37 +0100
Subject: [PATCH v3 12/12] drm/panel: sofef00: Non-continuous mode and video
 burst are supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-12-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
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
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=aJ/EglBDysKAXREtcXVh/z+Zh6bgaROjs/Vk7ZuGVZs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyUgxKl+tyy/rxnd3ByE1L+Mfe9B9bTkPee
 MJVkwSsUUKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 clwyD/9fUWuyonL8WuG+fTSZT85ZATR6y9QZJHZTGC0Dz0k587dKkHXiq1iJClfNO7LBAWWvjhZ
 UmiHaDU1mM0KZIxo97E301s/ocIacaSvbsGMLx69Z6VPOy00IGZmVVJmrX2708XBfaCWwMJNAXi
 rbynfoy99gZnH/Edzv8cad2wyicOZR2nJHmAvqYYxk61AEc/uBqfwlWLbcfnCqa/TxWWXI7wiYB
 f58nO9XAbsDDNdR/yd7bNW3d17eFwQ3ce0QAINiPzWZvOb/R5JRrHL8rkFtTxxDLcrB8Uk3akSJ
 xR1RB2Wl0eRplxbbwnIT+QyhxiiP5Qkk/75uw/SJ3GG2UswmLTqnFRr4jsdCGI6zxVLLmjguNuT
 yUijUGf7fx45zsdMaraxPq4UqL5tV+Wo+9DL4NEq0FRqxzHM0L8mmiKxkPUVSfSD+08A1Gv5gpb
 lxHifHWXE/Nl7/7oa6GfWZI/5WvoiwcSXsxlFf0BGeRL4HXbXogJpT0/01FpDoudFDPF4DOYa1d
 edFsioFRXFPvCdcW28TphGT60ghR2ObbSWN5yR87ctg2q0xPrysBbWVqg3jWj80bNRK76+NODUV
 8TdyoNJML4CR8ZefQ75Ulh1JF6YESUuu7nP/W/BCViEywHAejH9nazcKGKgE8m7J6b5scRun+I3
 TubsItsGLoGMzxw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The panel supports both modes.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index db9c181695f1d..e00a497a7c961 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -236,7 +236,8 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_LPM;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
 	ctx->panel.prepare_prev_first = true;
 

-- 
2.51.0



