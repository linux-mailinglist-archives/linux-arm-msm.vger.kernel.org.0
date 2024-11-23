Return-Path: <linux-arm-msm+bounces-38918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7F9D6918
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 13:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2FC281C94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 12:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE9A199FD3;
	Sat, 23 Nov 2024 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU91tfGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B96186284;
	Sat, 23 Nov 2024 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732366739; cv=none; b=F5wFJBb4EY8nTb0ZVljZXdnhHI6CyTPJECTfCo+BvHpWThGPSRGrbgJ0JgO2Q+zl3DPaMJJzwEZh5YZyQSHp++xGFxJT032RPJIcVQwMKodWpYhlS6/5un3NrUQu0b93+UHfJezGnFXLl+U5dJLWdFRu8eZVo5ZSLsvtdMgc8t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732366739; c=relaxed/simple;
	bh=E4I3y7xqOaJT9A85WU9bzFuhEDIjkVR1pOZnZP8SlLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBi627onHrRKHEnwtDwaZmfFzitMZJLNEZqSfrXMNS1BdXc6YBB3seEhhCzPya6OlxqQYuJnvNvBFKIhK4RcRHlhMmi/jEXAE2XXNUcpBlFh3zUrQaiyKqdgI+3aZ6kkUvah7EX+pazH3b3WEd0z+hML9+Vw/7kny4YCB4tx8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU91tfGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC4C2C4CED1;
	Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732366739;
	bh=E4I3y7xqOaJT9A85WU9bzFuhEDIjkVR1pOZnZP8SlLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IU91tfGjujXXaaxeYFd3zJekCTMT1lgvFFgPnimAOoJOhOCQJmAyqnB8/MZDQc24Y
	 AnQuXPqiwA7iQ/H+EZUuHgE7Kfvt90JROxvN9e22kGrkR0MaJY4bRT2BkcOztcW57n
	 LOEwZxSNAdFCAN8Vd7OvrDAsLb/mtmGPZvj9HWmlpwnT7qadX9yFLNCdYy2bTHAdZy
	 GwxYI0Am76K6UOGrXuANPYkJUU87Y9nEsC+kVUvlx+qQ/BdQiq5p5B1ZLZ2aMYGHyS
	 OV5cEuYG7y2qKLlA1bUWXAyGmN5ECc5WeI8KCcCQYLIGadB6pI6R4/mooCbPEAgmM2
	 XzXcnejfZOmLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FC1E6ADF8;
	Sat, 23 Nov 2024 12:58:58 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 23 Nov 2024 13:58:53 +0100
Subject: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-asus_qcom_display-v2-1-a0bff8576024@hotmail.com>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
In-Reply-To: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732366736; l=1104;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=IsotGGeS1hNHslMt3hu9mke2nzQXlgG9kOU5FgNZHkA=;
 b=7HyBJc9C5ACP1cDu8GhGgm91hamcZCsDBMMQXxeaRdJcZz4C/BeenyWQ3lTMAHtdKpjWp1YnG
 7TeOpBcZb3TAPonv2fPXlooRkw8uQ/7gpZ8tC9S5lJY+l15zdD9Ko/G
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
It is similar to the ATNA33xc20 except it is larger
and has a different resolution.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 032f783eefc4508df35da10e53ca20ff8b1b9bdf..684c2896d2387077cf2d91cc5a025e0838c0f536 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -23,6 +23,8 @@ properties:
               - samsung,atna45af01
               # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
               - samsung,atna45dc02
+              # Samsung 15.6" 3K (2880x1620 pixels) eDP AMOLED panel
+              - samsung,atna56ac03
           - const: samsung,atna33xc20
 
   enable-gpios: true

-- 
2.47.0



