Return-Path: <linux-arm-msm+bounces-59288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE36EAC2F69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 13:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237DFA20208
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 11:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7541E47C7;
	Sat, 24 May 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP6mE52+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62415191F8F;
	Sat, 24 May 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087325; cv=none; b=OMqU0Afd6g+KydCZ3DfDvqafRv6KyZVVehGWvsRIU/l8Rzn/3nK9hUPenk9rkmbFjbtiNR76+olalvAQt2IiiYeW1OjSqAF6LRXpFs1Lk7W8Tl7nEr6pS+lWrUxXRIuUTHSI/6WcJ5OFISbFdzJlkXrLSYn5BAmJGqzF6sgMpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087325; c=relaxed/simple;
	bh=ByKRfmUS7oGlsvSeZn4NcYMz3p4i4dHR18AvjwkAKbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eheMu6ORB4i4ZOv7LImnO/fvXFFm5FmtB391UVFXYudesfFU5DBJVCzFXyjB0IEVwcSbRQ9nu4rjgrsC5u8jB7pR+3wZrt7UaXOCIAe7LLA2QGlSr8tdFDR2CsN2Cj4FWgGAKj6qw8uMgJPykOjwNozpWp0+QSiOXQx2QqPC5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP6mE52+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D710EC4CEE4;
	Sat, 24 May 2025 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748087324;
	bh=ByKRfmUS7oGlsvSeZn4NcYMz3p4i4dHR18AvjwkAKbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aP6mE52+Lg0Oq+vhtaolhX0OOiIqZ5aCeSeTglvvn0Dmels1g7DORR0wlhSZxS3ou
	 1eVy3CZIxxy7uh9I5lVXnxkumOAEJMfQhnE5+UuaXbxJoGftfatajYe5ZzXc1gN97r
	 cKVe+FI2RIWJqP8DiHwRq1YI6RPbPfRqV+l/Ex/UlXZIHtXV7ed5rWaEpus79UnqPa
	 ojz6l94gvRbCw8G36VIkaGSQF/c5emTY4DFLkeUdRW/nhZjWCPaq0GkWWoKLSmmUHx
	 w6lY8U0oaE574/B53XyZkaYCwyHYfc+c/7/dmHx8NKxMWZJfQA3CRi7GKbLfNhV86f
	 x4A0oYr4vzhGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68C4C54F30;
	Sat, 24 May 2025 11:48:44 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 24 May 2025 13:48:37 +0200
Subject: [PATCH v4 2/5] drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748087323; l=1516;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=tHgac9hVQDbAaXNwsVj/n84C1GFybdnTbmVUs8xBXGE=;
 b=1ZjJ7Y5UlZNMsSAGj2MtBsDXfjwkhKrJBOvbM8dvuzOe2b4WF58oG0zya/uSWWB7iD2M2Q/eS
 qusuOrxaDAXBzqLjt0WHiw6J8AJ2RLu8NuRIbKMI5UebZuNB9uo5xNq
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Panel is widely used in 16" laptops, and also in my Thinkbook 16 G7 QOY.

CMN N160JCE-ELL EDID
edid-decode (hex):

00 ff ff ff ff ff ff 00 0d ae 2b 16 00 00 00 00
20 20 01 04 a5 22 16 78 03 28 65 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
a6 00 58 d7 10 00 00 18 35 30 80 a0 70 b0 24 40
30 20 a6 00 58 d7 10 00 00 18 00 00 00 fd 00 28
3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 31 36 30 4a 43 45 2d 45 4c 4c 0a 20 00 95

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 90e8c154a9788ad40e2101fdf39cbd92f2e0773a..ec9622e0a313f4a228618f119e2aaa812f63d5a4 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1973,6 +1973,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N160JCE-ELL"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_p2e200, "MNE007JA1-2"),

-- 
2.48.1



