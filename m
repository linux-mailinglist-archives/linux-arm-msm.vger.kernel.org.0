Return-Path: <linux-arm-msm+bounces-61909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E1AE22FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 21:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1097189D0F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 19:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5230D227EBB;
	Fri, 20 Jun 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/tNtOu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F65EC8FE;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449091; cv=none; b=Wzm9bW7Pm9W06iRC+oT6EgdJWHsnfoUNAlSq1EGnJpCQ5P4AqjN2JW/ouXpPmzyU3gTMNyoqD91RbJ+2fZyPd0fXOeC3hMhK5AQBzvwvRX4ekuzrGqyePSpM+vONNgidY0wYL44VQc+IfkXp2NDMOzv4hwWDValUHSrHqx0tTRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449091; c=relaxed/simple;
	bh=YVKGAGVsACWbyrmdgWnP+9izAWOhuOpM0wHyxpQHWY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFWTAazfeDa/HhC6sOT5qDeRVw7DwT2Ri0pe8ej0/Sycu8PrOzI1Nis5caXH8AGqUcQ1JW9O6gEzPP1Z87zwVZG4V5cehMTOImx6b856ifCuWD8zcG/BFaeYpQlZfkXOI9SeYCnuoW2iLq1QBPP8fCKOYXQV+9hcJTPJ58puYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/tNtOu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C88A9C4CEF0;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750449090;
	bh=YVKGAGVsACWbyrmdgWnP+9izAWOhuOpM0wHyxpQHWY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g/tNtOu4jvCs0MMvgflBUsQi1wdAj5ix5PlXgUep2H6rn0RDLl7QCVZiWtfKjshBG
	 8ixBmri15gvUsJwHyaGwnpjuhalvYrVSWCoKNhG8cPOF9jZdij5xZO0PZL00jvE+zF
	 m8uQuvEOi+8citt6XgirZjO4z9yffdLXjcVSzNS3WNF/K2Di6JZry1goYm0IorRTdw
	 tU4UPlVFCbhrrvNrVlINlemAWIsWNovGNqWOUxDcQvLVPKohYLbTqV8PBq2ua7/mi+
	 +/NdhK4Q3+x1CMu6BtzOSBW1i6qAufdV4a/4C46dL3FOCq6i/HlOfT9AVG5FAdcuIf
	 QEXzkY724f4pQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE28C7115C;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Fri, 20 Jun 2025 23:51:39 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Flipkart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-rimob-initial-devicetree-v1-1-8e667ea21f82@protonmail.com>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
In-Reply-To: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750456316; l=842;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=J+VRXXOlyvkdHa/6myly6nwuZ1NEFMyiM9bj1pJ3sO4=;
 b=qSGMlsCFJq9sLApq9yM4TwWq4CU49dBEZRH7UlJyRkXhbBEgy1iOEGwi4A7Ag2ZZiFmG1SrtY
 9VlSPJKMWL6Af6yzMW0JW75uy6qSE2fPMSPAytwyTgMMsy+rUjoBBaY
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add Flipkart to the vendor prefixes.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae217643bf7a63a471f74819d18238..1516d670e3ac81e3e00fb687cda64d50eb3e2049 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -535,6 +535,8 @@ patternProperties:
     description: Foxconn Industrial Internet
   "^firefly,.*":
     description: Firefly
+  "^flipkart,.*":
+    description: Flipkart Inc.
   "^focaltech,.*":
     description: FocalTech Systems Co.,Ltd
   "^forlinx,.*":

-- 
2.49.0



