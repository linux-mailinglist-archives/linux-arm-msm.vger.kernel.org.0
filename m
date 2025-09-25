Return-Path: <linux-arm-msm+bounces-75034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F4B9E399
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4C11BC44FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C42B2D738F;
	Thu, 25 Sep 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9NRyU0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5227EC80;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791572; cv=none; b=NCbFqvDFjY1HuCu8YE7AcvZJvFuvyUK451BqLRWQDh1vv17zJziU+KeMBrOGKuW7zp0w9rNVLFLtIz20w/1PFqNSbdG6PVKA3jtuSm8ici+zvTC6wDFAUM+YF+/O3/XhluuhiyLALnO77saISGTlhUp7gOa/YAbhQIAu9XFSf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791572; c=relaxed/simple;
	bh=5R8R5f0ursL/DIBYZarwNAvHNaxusNp93mHQOMj+1JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ie9Hc+JTxoeuEOUHkHMMeyZAHKwvDm1rNevl1eKEfOXEd4kvYEJIl4l7Jv3kVvhusSxIjF8XTbpdtaLYGwuZyFaIhjg9o2MmbMc+cJJQAkVEuI4cAjqEDGmfJlBHYgDO4dd20lqm5KnF0OcPMmFtTupPdFDyXglts53927izTvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9NRyU0A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 908BBC4CEF7;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758791571;
	bh=5R8R5f0ursL/DIBYZarwNAvHNaxusNp93mHQOMj+1JM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B9NRyU0AmgD07acLnmDZ6vI+oHhDQ0dLMdfxbFKQ09PNvez2ll9kGKiVXYfy+7MCt
	 Ycoj/br6U5EySdnhDBA4ZVbIk4mmBiyisg0u17CZ+1+pDWrIBHGBoYBQXL1V1tencC
	 uHTpImYSYpP/ifUZ+9rUfDQNBWw3zvOUo/QZWyTdNoKuzeosBk6D3sIcTQNZobh3zm
	 Z5ZxEGXpYMQx8vWLte8JBUeiAxvx6YJ6NuSG13qZpW3VJBzPffv8i2d7h65ijii+AN
	 MzwuYAtO2tKNS8QgLEnvpqp4oWPnwJVumCvpcZLE9JlbJAHdYtIDAwDB2Cl4aU01TX
	 cTbOgCVJnyvbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F523CAC5B5;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 25 Sep 2025 11:12:48 +0200
Subject: [PATCH 2/8] dt-bindings: display: panel-simple-dsi: Remove Samsung
 S6E3FC2 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
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
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xZd51QEp65zXenV7/weNa8nwNn4FJHjaNfLFDRzKpTY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo1QeRn2Lir6+rXOxzR2h4llPHCW6H4qaP3XqUZ
 03vof9rvSOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNUHkQAKCRBgAj/E00kg
 csBiD/0cD2A2cgc0/Vq86T5j/9JT7LnDZfIHiTGmn+y8m8oaCgWh/cu6KdzinjZcaXrMnmnezKv
 IaMzyqCyUWCmQEewkF2L8vSqDCqBvdExJA4r+xuqqLCT0NG/eBzvIcgilITFwIIa/M+g3AewC8K
 lKTkkVPt2OPEYYIhMOIfxykHrpcD65yFOZ2lcVJIRGbvFPZqdt2ZneEjJXC9p/c+Fn01XcVwwZF
 vb7LmbPzXLFH3BgUVhxwbevU7EjIYikIvb4hRrQM5dAALjEVBtTwy4HzEaqOdnS2QRHKBZe/cF7
 F/RMWTNnnpSrXcBZgJPIK7aUG6/Yj3mtBLikddBSnNVknAakALmlXv0EteNDCPGDMBi3JegQZEk
 qdFHmQ0NJCmazumLoG6ovGC5g1VdPZx7eN4CmilhMbkKZrQOR/RnYBFs1HmG6DawjzFB/Tjw0ST
 mPTZQsJjATqVwPvQ0nWOofDcLdp6iTvQb5xwO6OAshYVQfSmc423gCtIUnbI2ZFk5pueYuua+Rh
 xKmaAl/CsdstBnR8P27ZPsa0erdIjCZO/jwSfn7s1WU8B9X+phKwb2PWyotAo4/XuAmwLmdrYAg
 37EnsB1CIQvAt0wVJNjPJd/fG4bV+WoPQrLPHYcUIjYMVfhdquLofFyeWdoOEzp8RcsKj9PJTIY
 2pSXJX9MVisD6yQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Follow up commit introduce the proper device tree definition for the DDIC.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791ccf99061ab7a1e01937bb832a96fe6..6c1249a224c8a170b33fd3f331f985f16914cb2c 100644
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

-- 
2.51.0



