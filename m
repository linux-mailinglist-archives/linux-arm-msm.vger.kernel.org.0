Return-Path: <linux-arm-msm+bounces-62118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7274AE57E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 01:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68F53BC4DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 23:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCB222CBC6;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nu9Gii6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BA522A807;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720817; cv=none; b=AxO6FPTh6NtBKc2g+NLbhyibahTQq32fHaFXu+j8ZxOceXN6BtYRgwjpACzHdrn4KzDjzDjQr/KElUHaskU7PalVfCNVG9PFBNj7QmHnQnhMGGM1zPoJiydtL2rHpTNR+ZiVWRFTCykrJoYUXc8HtRg+oKZl8dJJK98K+zUmXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720817; c=relaxed/simple;
	bh=YVKGAGVsACWbyrmdgWnP+9izAWOhuOpM0wHyxpQHWY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ro1IUrE58Sa7DYcCnJhbTPYYTAaGAFZfrevhx4RcO0H1nH+Fpz835wYekqwb45lNUrbFKs8oPrvxTC9E2RR7cQP8gqn87xxxAva8PaVCuGYbsoTXIu2CCICDPy23U+hFUA8aIxsS5TbTRj4SSwKe53QGxA/kyADyXvoH1GFM5WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nu9Gii6S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C4A0C4CEED;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750720817;
	bh=YVKGAGVsACWbyrmdgWnP+9izAWOhuOpM0wHyxpQHWY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nu9Gii6SOrszt0PPp9ijtPnMAzAGMdz4xMPTPGHsUNDXC9qpMCZt3AmFCSgZS7icr
	 EX9GvVitkU4gSq4YfGwxa3NjiPoVCgay1sRGgxlA36/rcYSvkmsiSBLTluZ8Ez+fxa
	 grwnZaKSDfNVPV0Is2IVLaWX6KyWuLP6wq7Q3pvkbJeXme3LI3IAx9tj18i0r3AZoQ
	 b5MBoiKRIrVjmNEZ4hTNIAjNPOv8A4+J91oASQOcOg6lTKdV/7KOXIlicjVG3hlQSX
	 uVfq4YL+wIND5lY0+7KD3yY/bBLSl5uwewEykfIkcby9VBsLzv114ACg7NPO+cIHEm
	 Yi3nEMjRSZRBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB2CC77B7C;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Tue, 24 Jun 2025 03:20:05 +0200
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Flipkart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-rimob-initial-devicetree-v2-1-34f6045ebc30@protonmail.com>
References: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
In-Reply-To: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750728014; l=842;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=J+VRXXOlyvkdHa/6myly6nwuZ1NEFMyiM9bj1pJ3sO4=;
 b=hENxemDPTl2N1ECPxg1Coo0elWXvnOa4n2b1AJC+Db2kN2w8TVvrQfWhgwQXT+3yO/KndYCvP
 wPXavjJORefCM/ar7ojsyrtPteTr3pGCE4m5n5I5y2BXLvE2+w/G/w7
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



