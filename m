Return-Path: <linux-arm-msm+bounces-38958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB269D6D67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 11:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E937B2129F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 10:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C3218870B;
	Sun, 24 Nov 2024 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXx4j1on"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB86155C8C;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442469; cv=none; b=mxdeCt/d6DeC/y264/1dimjIZtCoQf7L0sJ2OreffIxLCTwAw/7N9bGiXMuny3B87nuyBSKNO+JsQwZWZb+Ld5GXzMwd+7i8W+bwk0mirjnXuRHr2aeez85jwQwCJ+S0eA0jtxqZtE653Njecjp5JU6eosGyfW+VJeGHl4pzoOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442469; c=relaxed/simple;
	bh=63XROWs9Cl54JcUeUjSOu7n05NSvAswmnctcj5Q6Gf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUcqV6o3A7TfF6LxilLR4O197ZD17nAAGWz0QrR3KgG6ehkgQUeTQyzlps+a2FTUkhsHO+lLBo1IYMAiGqVGXUHc+fksxzTKu7Bl5kyuDaT6kP+bzuzF5dNvJFrgmP4x4gx9MNA5lzPTMeTV/eS9S4kGicUru+AitdPxqh9H0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXx4j1on; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A877C4CED1;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732442469;
	bh=63XROWs9Cl54JcUeUjSOu7n05NSvAswmnctcj5Q6Gf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AXx4j1ono4YYOaeIBMRcl7e9ABTI/imQPu+y0oCmca7iZs5N+QxqpLxj6ei+xUFax
	 bc+GcdaOYQUKt9jIXYoQGAcyFXEgtEmPk4sv3eIVfVuUxnZt67UuLT/PCDX46Ez6T9
	 Fv4/hIvVUyo0UfZ8RIB+MRq6e+IHgClNGCaPmfuL57icQX+/raxHk2jYNUzNFhYGr/
	 AoMwKVoDklSVedwRS5mt5kthiUKYA/sDbHLHDgFAkzB5dd1xZ7+PG7Dk57tj4F0Gd/
	 TpkSewRabTP79wHiYXuosokrdhkyAYRt/YgVUgOoWxqEUgVNcH10t74ZmSvVjiy3nr
	 duRF9xrVGLaLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475E8E66894;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 24 Nov 2024 11:00:57 +0100
Subject: [PATCH v3 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
In-Reply-To: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732442467; l=1104;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=s4yKTNvJO3mx17xZFU/LK3Mq9NKRmsc9/ZsIIVmQu0M=;
 b=88PqRHIQd2UVupflLuSHUweEBp1Hb+Lq+/bPNq7X4rXbCptbDK1wS/Jf0FPZHbk3tfMUHujEQ
 e+xTT+oTmnSCZdpaH/LpacKKAX57gq1u7PsK2scdH3YIgccOhb4b+r2
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
It is similar to the ATNA33xc20 except it is larger and has a different
resolution.

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



