Return-Path: <linux-arm-msm+bounces-38971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C79D7048
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62DE3281AE0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802131D0F5A;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ankNOU+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498D51AD3F6;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732454420; cv=none; b=nZDc7Z0zIdsvTR+VeVuKs9KhiJwIaNZk209TDUjwb5uQlAMzXRp9cZGk+uJfmOVZV7VzVdRyddP39MVKbGaXHzjaC9FOJB7GkFwKACHSLGmIAZ0pbryktMxXQ+P9I/3CdA/6ZUs+ZL1bZqLyvJ5qE2i6IVXKORs5mc38IjupvY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732454420; c=relaxed/simple;
	bh=COLrg2AbV+4KaQRU2Xw2S5L8rp55JjS366Yv/REeB7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Et//n6zTovYp6enaZ8wrWrYaPtdun2Wh3GVBPtmF+ike/anVcGKDvTOkNYHXmrTNgK26+NSWCocSe4qNjzpLzXU+W00P31lbCRQPq1N9plEvuTtrqMuQboSSagJsalCnENcdGHbRaEeSYQ/1++8QTrKc2qZNMy8KD/mNoHDJMr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ankNOU+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBF28C4CED1;
	Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732454420;
	bh=COLrg2AbV+4KaQRU2Xw2S5L8rp55JjS366Yv/REeB7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ankNOU+sNlvPzu7aVcv0Nu1rt1QNXgVfLjuGXSUK+0Q1S0nZjoHzhSp36ytGu5QDj
	 hg1xUjxiTzBXcRjMD4WbYcyiGIFkemDnHDdK7yr1PgkFIBeleapXR3Ay/b98dtKOBi
	 UOrJbzvOobUxOg4Hc1dT0f6+FkVWT3Ntxpb1h7iSsOBCGpopb/7zxRGcavhw3S45J0
	 as/+CzNwvAjdbx9PYKMEabJcmjmaqRYCiXPUSCNzVIshpVF2HbBVFsJesRWxVOJU5U
	 fxXVrenqewtVy9ziGlfTWPpz4eHrBu9F8+TTmWtrHiC0lV6SNB61t7CICoWzIlON9U
	 k12O0E3FreXDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD89FE668B3;
	Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 24 Nov 2024 14:20:16 +0100
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-hp-omnibook-x14-v1-2-e4262f0254fa@oldschoolsolutions.biz>
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
In-Reply-To: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732454418; l=867;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=5Oq4MdNKXVyJJvjmJFPu8lXVv7qb44phd5FkFC6DLHc=;
 b=c1BV0KHilcb39Fjlaivy9pRBPbkrXPTJ7cIkxiZwJZVYVc+U8jilpWaBMB6TjhPWu/qN/IZo8
 2ci2cUXmz9kCmvqqde42vuEO4ydIFYLXIpIeY8BEKSnOw2pjlgwFFPY
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

add "hp,omnibook-x14" as compatible device for QSEECOM

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddcd969..2e148fb7167be 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1769,6 +1769,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },

-- 
2.43.0



