Return-Path: <linux-arm-msm+bounces-49385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6FA44E97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB18E3A6FDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 21:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0903021322E;
	Tue, 25 Feb 2025 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="pbtrWwkA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0FE20F070;
	Tue, 25 Feb 2025 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518102; cv=none; b=VrULTA2yeD1hq1oPkR6Skxo8o2AelDTEKXJET8guob/GAqlIm7DDPScjYgBhn9N1RoafKHaPv+sRNyTi4jjWX+R0T+LIp+d0OwkWT0no8lCu8aVlNad4+qCDFadrbeqDrAC/0+3sRqsVfzF0duTELt5Urmb6KQeBtF5znfe+ZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518102; c=relaxed/simple;
	bh=g08GjdWndeD+8Od5WoeqAJLhdg02LWDKIbkAtiqenRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SshGGTYrXwEXx3V8lzBshnx4ghtV8wR/VmBPS5+vPN+9xYcK89LRCeJRbK+Rr2eDHfL4ndeJOhzbjxJ/wjiJFuogzJUE00qAnIyWJx61I9/1fwO0hHGIRm4mcxqj1sVVYIxyvDcvmJUVJbPhAi2ykynN7qckWCYMpLK0YZIoZjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=pbtrWwkA; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740518093; bh=g08GjdWndeD+8Od5WoeqAJLhdg02LWDKIbkAtiqenRA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=pbtrWwkAFE299XF+2DMLKMDhQgp95omo/FkdqCLBfA6bl4WbePmzuCl7oxVyPcDVL
	 zrv77ZaXN1cCDgkFWD0N7oY1hQPk2miGASM9AcWQ6GueSE4o082gP9qZlX/Qw7nnQT
	 bOun2M0bFDCzutf7mn4cpKVP4L4uH6TAQMa7I694=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 25 Feb 2025 22:14:29 +0100
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-fp3-display-v2-1-0b1f05915fae@lucaweiss.eu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
In-Reply-To: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=g08GjdWndeD+8Od5WoeqAJLhdg02LWDKIbkAtiqenRA=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnvjLI6Mh3e/cZZMMQq3hcbldXzG82qfhZqWPEV
 3wFJf6S7BCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ74yyAAKCRBy2EO4nU3X
 Vl3sD/wMTs6+IB3h9qvB3lAEBCrXn5gxbD+9pLzy13c4dbL7YGYLn71qXbvXD4e6L9eLzNdNEyq
 io+rOEuhhXnWD1S2SRQ+QSI/WQp6c+YWBmJ0BCkYzY9vQa9XzmlETHXr2dEzJpE97czJbNIYpRd
 bgcknY598W6aeQ7EtQnfmzgVT6Fv980+ubfXan+vS+oQaRt+SJbetm8b2OgpUMgI6ftivIChaS1
 w79SLMrr1d0oqhCz0IK3PpVZeGqH2w1ujVr6DaXCG2PFiwQQFJg4cAXQJyfH+XptWGToWQCH9Dc
 0nfHV5z8NA7f6U916gHj9TEbv0zu6gEUzrJ56C1JmsIxo7SauryPEFKnxw/HDtMHoihZiKw/Bxm
 W71v++jGgQU9IIjjgwWHY1nS4kS9r+TIE9MT9X51Jwm2hHyj65gQE7mr6R4nq5dxWe+33u2Ff1A
 KVsZM77UKE/9QvEYSu3ETH1/hmZU9dYHINVkkc30YomIkntqy3+2TL8x47Wl5NqHADqiiWKxUrv
 kH7hRVK4XgxaIR8egi5jq8FpBHXpR44ZC3tvHEI5/1mDMCa3G4in2lfRTDdLMcgfgLymRK+KY09
 GG9WKk0TWOuYdZVmLIpxKGAOfBmtckxLZQX0zftUNbGhuvoxtGJuJiw/RiYNzImt5PlrgOaEyNV
 G6D1PvZFnh2OPTA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the vendor prefix for DJN (http://en.djnlcd.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..ee2dca4f372263c7a79ea17f4a9411939bd0531a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -390,6 +390,8 @@ patternProperties:
     description: Diodes, Inc.
   "^dioo,.*":
     description: Dioo Microcircuit Co., Ltd
+  "^djn,.*":
+    description: Shenzhen DJN Optronics Technology Co., Ltd
   "^dlc,.*":
     description: DLC Display Co., Ltd.
   "^dlg,.*":

-- 
2.48.1


