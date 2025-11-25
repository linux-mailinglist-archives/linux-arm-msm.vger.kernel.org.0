Return-Path: <linux-arm-msm+bounces-83322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E7C870EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F7814EB97D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 20:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD2933EAE3;
	Tue, 25 Nov 2025 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS3Ap59+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D099C33D6C6;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102580; cv=none; b=Hv78QRZ7beSxSgytWkhP33PYj8VnKk5u4AvgtqRtCd3XWB+fZp7w6JBTL+J39P+4eMSfDK6jipkVCrWwdWPBClsg7CikK/I/WTTU61OqHnP+A7VmFp+U9CyAqhTUdluAY8gvyIarXwJiHp5H8Pm+jrDV6tdqjz2TTsjnZgb0/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102580; c=relaxed/simple;
	bh=ds8zmiqByl0JT2rkSzAv2tIXDa5yQK8Te0qcSwokdKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLTE5NppAQwCm0pQPIOMb7/Kd6oEsg19kKicAe94WJu1Du1eC7xSQZaZKjA5DTrTeD+O8GHAvCDsQPNCSN1ZVqwoLZxvll2xJHNOCpLwTCaJeTTHS0PfsTiRhkihZAaMCEOpUZxnLZBRmRTrg/PfiXmovtm0xFl2Vai0bHaifUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS3Ap59+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75F81C2BCC4;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764102580;
	bh=ds8zmiqByl0JT2rkSzAv2tIXDa5yQK8Te0qcSwokdKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YS3Ap59+Z4qdVHB5VPJhaQP6pcQq1BCQHobh8OxqNAoGVD+3y7SLLWyzf5cDdsGnl
	 n0r3WoEJV8iJHYKzQHEkOHuuBahBJGF4tc8EPTgMofIE177IZaxhQokWEmi/ksnc7Y
	 Q6nfE2a4SyB+zp+MSqdP8m8kFPOA9M42gszUZm/acZnslpGFNRIrKuosb99ja88p8L
	 zv2kLLX3WkhedrUnDbtJtfPWqAJmIXFqUvFP1lxZHPauxge6L4qh/YHG66YGt17kib
	 NCwnwzUfoTIZ9Kz66ode+dO0gUDe2qqoY5yfc5samrA4BzdzKaXG4exf59Fg4WFxRG
	 mvqcSP5B2/FiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682EFD0EE29;
	Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:40 +0100
Subject: [PATCH v4 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-5-3b706f8dcc96@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Y2VpcT0lnlNKMeu4qU9FUOJhj3qUtxUucFEOrKlLOu0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGy29DVW1ZDB4AQrSaDhfvGKsTmJDE2UwIEf
 zWzCqilo9yJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsgAKCRBgAj/E00kg
 csM/EACghuFzOX10G//floun9w+PWksjWHMluIIoxNB1BNjcHZiVDwbXWw0b2DByPunlJjqVL0o
 GaVNW/HLxaOPD+YMtLE/hv4meYeyL/4ttLOj+jfx6qXU4mourc+jQcML48i4UfgnjJeawkFAZTH
 EKDmGsO/NkYlbGpAEw1Oe6wQaRXnAJA/b25ZBFH72SrV7LtoOlPfehE7Q8w/bkKj8ewdpEUEm7z
 fi+PHmJgTGqfBvS2v/vKY7GjUSB2pZuS82lE0Ozqn3wCOxm/euoEyxfy2x0/Cd9WcFWlY4NZskg
 ZVKq0YiZFJowlzgsyjEtzjxenF4CXfY4+5XWLfHwpOyNJlE6NGC7hadWeS3/LXPF4bWgV/2qCFc
 iyyleeG5mKsh9TZXLTnJc5yHkUdqCx3r6Tnltxg7Zwhl6xQicCjLi971GLFOiPIUNUi3dP/v6Ss
 +ThqtrPzXZMTroMUJaoGI5cgIONH0oqJPGaE+q0g6olBH/VYA67unT6MQBxUrM+DditHFbGqc9v
 5mq6a2xYUywoUd+jgH3oxCxdSuWXiyYcDP7ifBpVgNYgWUMd1s67Og6OtlqccM8pw5E6FUiiEu4
 Q3eiucJg0e/sk+lKInzyj25p8jk4zicvNriI/1RcVL/3pVlsL5xv/hN/gKUNq+3BpjKwgR3nZHJ
 rwVCLO9Ui1p1Bnw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The drm_panel_remove should take care of disable/unprepare. Remove the
manual call from the sw43408_remove function.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 20217877e107f..b46599a0b957b 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -318,10 +318,6 @@ static void sw43408_remove(struct mipi_dsi_device *dsi)
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



