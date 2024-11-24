Return-Path: <linux-arm-msm+bounces-38972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 569AC9D704A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687DA162629
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC9D1D278A;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqjcMtDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A801ADFF6;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732454420; cv=none; b=HF4/wjbPOI6aEf/9Q/vpi99q/0gXm0QoL91NQrRYgxCtNhWE/OH5s6lwkIMiupXLjRx+z+TaxZFKXiRUGddFgijbX4hcUej65sM6R8nNBRLoWcpnZkWemI73+5WThau5DS+vHSPF4ZgVBzcaFn/bwuevIMe4zELgHMfO7ooFhtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732454420; c=relaxed/simple;
	bh=oCgH7QRWzRZ3wdq5BQA54X8CfWm+ULFJJK7TIso2CN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=slUsIbUdQFloTQWC3hfqJieGzYEaQ2nMKprUOXuSU7TA9xMwB2/shHIPNccfvPCsQB7MpiuCbH9wfm9AqVoXvYU7BWEUl6nSigYchBmuFqUce1PFSlefcWUxVH1o+zFkQVzzZe3HS6Iwweqb++CDjcGjNp8esOlNxJVQLmMrFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqjcMtDJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05D7CC4CED6;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732454420;
	bh=oCgH7QRWzRZ3wdq5BQA54X8CfWm+ULFJJK7TIso2CN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HqjcMtDJQJKq5KpxueIvn8SRp+e+fYFbN9X2oowAMUjl4UnFwvuAK/RIgquYl7856
	 Fn/WJaYNiGG3k7KKPwjQ51SXreMEsl3rRE+hziJCc1dz3607NdV9g4egP6qGsyfN01
	 cYBfdWERyqjc8jPY46YOTh3j/+s2uxgKcaAAC6Z9FUvkZiV6+yFy8lzAjnHVU2M4Tm
	 YF8KtFAx3/vQa5uInwOv7RlZ8cx8iyCHFPRijos0cGzLdzyPMSEvTw9FjzrPBfcdW/
	 jaqxJmwgOTD05MbWxILUG7ViOqPTDoBPNrkTPfjFGgybyl1X3X46lVove0BfOieJHJ
	 evz7B53o2jo8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1DDE66887;
	Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 24 Nov 2024 14:20:17 +0100
Subject: [PATCH 3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook
 X14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-hp-omnibook-x14-v1-3-e4262f0254fa@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732454418; l=1582;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=5Es2IPiTiHKwImBfcnn0D9TGZVQmlGDVDqXaPrWX6wQ=;
 b=mDf9qFkHUBAIyLRMXxd0AsOvw1dd7riZra9npFPTl55F3cv3bdEVHiYQC3YpCFyEAcxXGoHYE
 jIWheBL8AhLCtAuFkGdQDq/KdIsWL89aCLM98u8BPzyktU8qBcKHAld
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

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 8566e9cf2f82a..403679e506fa4 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),

-- 
2.43.0



