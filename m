Return-Path: <linux-arm-msm+bounces-39739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A495C9DF2CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 20:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43A48B21301
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 19:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68F61AA7A9;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsqIfThv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726401AA1DC;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732993738; cv=none; b=sFm9YO6gMyeu7cABnEJNQVmjefllZIRbb1X0cgVD4PrpHezwqmBQZj45YxFpQBsLrYukBTTTo4MWYC8NELibvIup2kcyOJvy6n2NvW+DiZhtd2jFz7qm9RCB/L4i2eFVft55v/3QMhWcQc7LWsFeY2ZiCgHX3o9I9tgUsSTnAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732993738; c=relaxed/simple;
	bh=UP3uAuEyN+fS1KPwCsp/qLmO2/LWPK4Z2KzNa1ayggA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAWhwxrQHh4gD1x8H0BlW/N5KgAOlf9xl9hFzEJGa2f1t+OwZDDXbJAn0PF/g7mkuoJNaNG659/RJ38a6C7Gh32xpBl5qRTaKw7fhsUMrvSg1OfyIlOBt/ZhoxAqPomHtSSRrHtLLUr/oN0hjdq7AJ8xRe/Kl2ONPNhKNTOcd8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsqIfThv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02B77C4CEDD;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732993738;
	bh=UP3uAuEyN+fS1KPwCsp/qLmO2/LWPK4Z2KzNa1ayggA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BsqIfThv/fpXtBR0Io8eZqmJ1jZghWJCSJ77DEmTCVSFdPyzij6V+jRB6fUTaVGKs
	 Fmuhe6SOPHPnswNYH+HqNZgvYN4HRhatrxH4y/jL7hzh/+7RrthQ8EUq7bRixLHuuP
	 XJUjAxWeqhiJ+OlCpfX9wNTYKiVLwRB0uIzFAC8GElgdywwnPUC17tY6BkFHt+PzU1
	 AJb6LXS3xY6t1AQcxsgWfxHTE0m0Jxlqjej7U3vZObyQbwT2Mk9W9xDcr440TAI/dP
	 9TtzEI9T5kdHupsYKyNll+ldEwq+xu4R5Z61c1iHm3G7DkWG+A24qNirYoIuC5c7wS
	 AmLhr8gJDtwkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E388AD73610;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 30 Nov 2024 20:08:54 +0100
Subject: [PATCH v2 3/4] drm/panel-edp: Add unknown BOE panel for HP
 Omnibook X14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hp-omnibook-x14-v2-3-72227bc6bbf4@oldschoolsolutions.biz>
References: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
In-Reply-To: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732993736; l=1635;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=iL7DMtHFbxAUIu5T3NccEsTftcpTXU3a6x7x4LX1jD8=;
 b=RF0XvyFvYWJEdQgWfmDpbfZz+Ix6DxQNOOk6rmSefj5e0Sd7WPOjIp0fK8/eJ9wxe5jTh5Eo+
 ogDv1GslgN9Ah696sXJ6nUixoJLeMEHUGQdOGTUsGrdMLJmVRtTU2cZ
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Seems to be like NV140DRM-N61 but with touch. Haven't disassembled
the lid to look.

Due to lack of information, use the delay_200_500_e200 timings like
many other BOE panels do for now.

The raw EDID of the panel is:

00 ff ff ff ff ff ff 00 09 e5 93 0c 00 00 00 00
25 21 01 04 a5 1e 13 78 03 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 a4 57 c0 dc 80 78 78 50 30 20
f6 0c 2e bc 10 00 00 1a 6d 3a c0 dc 80 78 78 50
30 20 f6 0c 2e bc 10 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 0d 36 ff 0a 3c 96 0f 09 15 96 00 00 00 01 8b

There are no timings in it, sadly.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 8566e9cf2f82a..77c48528108f4 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1913,6 +1913,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 

-- 
2.43.0



