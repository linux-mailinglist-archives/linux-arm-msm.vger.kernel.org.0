Return-Path: <linux-arm-msm+bounces-62559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D126AE8F20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 22:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6991D5A121A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E612C2ACE;
	Wed, 25 Jun 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWN0eDHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9C2206F27;
	Wed, 25 Jun 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881878; cv=none; b=fwpsm+CKpT6+Pj2vg5K1GFRMMelzJNoa6kdWqHvdNx3h3JzXsvpFYsc/I8AwYoupY5VETOwpgrkf8uaBdc9R1ElYT+u0bwsZa3KmbkEB11SYZf6i8xO0N5owLO/U/vPvMV2tETUYQcplrC/HthbowI1UnZVthuKNntT2iKMnnmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881878; c=relaxed/simple;
	bh=YVKGAGVsACWbyrmdgWnP+9izAWOhuOpM0wHyxpQHWY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9yikmEYqtr7m2A9lZpAVE3YpRUjKpXYhpaqO7W8R7SIaxE1YMlzz8+aO+vmebPxXqKkffUYa0X/yGLLajr1OEiMoqGtbAoxihp0sc5ZE3eHSrFGDmTfkAnUp3eMQ18WxnZNFT7WEP24BaceL8jGThek5J8nQsUiXbQTLKOyB8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWN0eDHG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAA7EC4CEF0;
	Wed, 25 Jun 2025 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881878;
	bh=YVKGAGVsACWbyrmdgWnP+9izAWOhuOpM0wHyxpQHWY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NWN0eDHGRzmAf7Je1WsuK7anb/EDylngylWMJqIlkkMfAr0ZVBmZFg5VAVDuq4iGB
	 96vk7pCIeGEJSBBnudZ40ScIRpA5n19VanZ5Pwhz62zzrGmFLEJUW2ENunwkNs4LYn
	 Nf0hNpn9Bzw3BnSXLDTW/0YhWYGoxQ17uHNa+i1dVHhWNfnW3L4tOwIHuJh52vnsjg
	 PdA2v3wqv0w6CQRM5MeTgT9OYP430RrrTwMvZmdc+wbWqqzrOtNV53zJomnu63xseD
	 Z5ZqkAdj0RyJz+uybifPIapy+9oB0qFgx7MZwet3TpKQtetYlJxo9g/3CtCf98Fvq8
	 Ifma5kkQP0KVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F02C77B7C;
	Wed, 25 Jun 2025 20:04:37 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Thu, 26 Jun 2025 00:04:26 +0200
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Flipkart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-rimob-initial-devicetree-v3-1-4017ac9fd93d@protonmail.com>
References: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
In-Reply-To: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750889075; l=842;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=J+VRXXOlyvkdHa/6myly6nwuZ1NEFMyiM9bj1pJ3sO4=;
 b=in5Ga6yKXLSHm6A0EsHFeUzK+jJ3dZEuUPa8Fh2QNSW/pZUG4xBvtn2RzrSqQdAsnq+7OZ6Jp
 A1rrMlYkcLuC/QVhlJtrmYN+lmcRnJSUkXMdO6o+L00YkBCeXbYvFw1
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



