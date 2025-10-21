Return-Path: <linux-arm-msm+bounces-78156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65582BF64EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C16F1884D41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A446333724;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtaWd8R4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99333342F;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761047588; cv=none; b=CTtXwyqAv80OAeI6yW+lDw+YFyYohdMV4CJh6iyNaT435Qt5vK/IWgRcEL1uRb8jSArEs2GLbcnuHbr6D/A0FzEq3ISn4mfdZUhgsQrGMPMBJrizCBLE55R3Orc6oYq41zD386a2DNnEuQkMDNvGTWOt/795HCnhOGcgAAmw/U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761047588; c=relaxed/simple;
	bh=0ZOyYOwg/QtwEkA51L4dZelWZkCwJZ5UZfBiyAr5WcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhCGgBoE8kl7Zn8N3U7BgOfdwrWSRMCs/Qv8Qyg+UUDoiRGayN01a5lpPQb//L7RGh5SebH4UWhmC2VTRwd3P3IJsz3vNhfviybkqJiDNC5xAiqfiTVeUiBRpZd8fwdpyvtOT+K+tFUki3XQcUovFh+v00qjKcm4JPUv0YnIBls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtaWd8R4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27317C2BCB6;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047588;
	bh=0ZOyYOwg/QtwEkA51L4dZelWZkCwJZ5UZfBiyAr5WcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CtaWd8R4mDZEMU4TSlGrMuImTlWNhvFeF8x5qZhAN1xOBPZV8YCx1t8PaWsL3IKnc
	 OIqOlre1iDAM8OXMjQX5gKidoWSBpJozEbvtF/0hqNvCTlXv2qrdzmp1aBY/eYQJx3
	 Vr7rW7XSQTjcCddGOK672rQhbjqV2qnHNcZPuvjlINal+JBPha/94e/LuNHi9WsxvY
	 ApsIyQm0J4wp5ZMZ0TAeLkZnMJvSynAEiped5EnGKT+dDb9ZNB3LsPBM8xMJlmzH/y
	 pyVqq3fxhlURDnXckNzeLBd3F98Maq1P9eyZhrZATTpOJu7/LlehCF1ZP9ePSQrtIg
	 N3a04Q4RUAOAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCBFCCD1B9;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:07 +0200
Subject: [PATCH v4 7/7] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=c5fkR2jWk5YkcniO/SxqMzx6Ew0swnPogltZcHFgTB8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93QiJGeCP+WQuzYRJI4TdEzwLRxRfVymzu3Yy
 cuKKbXLmCSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IgAKCRBgAj/E00kg
 clZmEADEDrhcdx28UjTgVPkdnxtUE00Vgeygf8rFA5JPmVtgqJ/0bAE7X0IJJekrhjppGEngSlL
 H2TwD14xpMLAdFV+wu4oFEtudEJXFyeI156Ze2AkBWH6Tc1XHjWgh89KJjsZKmTA9IAY8gd2S3t
 hJ3xgLrQFXMOtaGu7MoI7rrKUU43o3LoHRXg+CF0FHq1K2ck4nXWaqy9sQtJ2pc+zLHTSFud2na
 UC90C2/VxwoVaRugoeTBwCwLwAZM/TxNXjBiNjYlV0Gv7JIiNCp8tKavFcyC6ZCB+T7Af+8SJPv
 pDLLitGYpppyGdi28MAT+juOy/jhKAmI7EAV72gQETQQsiUH1nliO0ENssGwphfhQmOUwijAWKg
 YNrKCRjtLqUai9y0t2TOUGNpyegyj1LCuy5DWzLNTdpwCKIXew7yvVjcr+v3dAUryGYnba6dzI+
 witeJRPxU77NiCLYb7aTd7RqBwH2V+JSb/lsc4WEOVREszMvLmxwew8ATVGXbfH0PJtsSLG9o0R
 1J3+QrJ9hAsgsGwM7zUBfCecb+vNajXCCh5x7HHKHwk8R0VlqEqokY3CGaXYsLXxnY2YBZMhCH9
 4Fwt1ALHkk/zI7OlRa/I/AcCQCUnRXpDtWytxzbAvBiHm1/eX+nBJaRmXwDBYqPugKA3ATLqjjn
 zbk/08wWYl0x0jg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Samsung S6E3FC2X01 DDIC isn't Simple DSI panel.

This panel has three supplies, while panel-simple-dsi is limited to one.
There is no user of this compatible, nor the compatible make sense.
Remove it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791ccf..ac2db8cf5eb76 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -56,8 +56,6 @@ properties:
       - panasonic,vvx10f034n00
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
-        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-      - samsung,s6e3fc2x01
         # Samsung sofef00 1080x2280 AMOLED panel
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
@@ -80,7 +78,6 @@ allOf:
       properties:
         compatible:
           enum:
-            - samsung,s6e3fc2x01
             - samsung,sofef00
     then:
       properties:

-- 
2.51.0



