Return-Path: <linux-arm-msm+bounces-68567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8230B2151A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E321892D34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269642E0B5A;
	Mon, 11 Aug 2025 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ST7gLqzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACC26CE2A;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754939251; cv=none; b=LUfDIK89sLxPQWYwlfJwnNTtAAv4lLWIL+S5Gj9jBFyrBwaAxUGCf2fJEYsMsk/erw+9btSNf3EYbHrq41Jb4kHSUHj6t2RM2y8JEjsqiO7dFUqLAV2INhIOGtrZqlkcmicqqS16bsoKV6Eb3ZEIxK+J9TdYutEfJGK/TQR3rc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754939251; c=relaxed/simple;
	bh=LcI2jfjGdk5IleXMM7jD1iyUKv647Lsd22B9OeWuP0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAosph8DZwRR1CuRNM+XkcC3dk2Rsuss6As7hqTdJdQaREScPFjRibX/06gy6iTNfiksrcH6gs4f0NKhgugN58BT+KTbaTX6ibE+Zx9Kv8JSICPJakRDgjHBA45Se2SS/1MMaZl6R0+9MHtKv78Hx5JqHfQeXBuVB/HMrFjKxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ST7gLqzW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DB11C4CEF1;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754939250;
	bh=LcI2jfjGdk5IleXMM7jD1iyUKv647Lsd22B9OeWuP0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ST7gLqzWzAP1xqHXlzFOz7XINORAYGndknJTFPjGmWPsAko5ewH3svKsZ+AAPZFpC
	 k62lcQwdztvYIO15E9t6J6auOxU3aq+F5gvdMorp3h6kQJtvjtblPoW5micZi1wQ8V
	 JoFse86HToXNBqMzgT9jBRfOAm0PObOwWbOm5VI+8N6pIHyQa+c5BWmYPFAxoFSkw2
	 8fuP07+6yy3HgtReSdBfATyOgUzIy07bK2mZBlGTaRs7M1v/y6ingc3FQnAT9PJ2jS
	 FvHj1OH8TH86+4gV6bpBo8iY0YmJxteWljcEmGIkOn2fpDIiKL/INVPWItsYTAY3l6
	 KbncY7KgChkmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82277CA0ED1;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Mon, 11 Aug 2025 23:08:09 +0200
Subject: [PATCH RESEND v4 1/3] dt-bindings: vendor-prefixes: Add Flipkart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-rimob-initial-devicetree-v4-1-b3194f14aa33@protonmail.com>
References: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
In-Reply-To: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754946504; l=889;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=NN+SDIpuztIl0NyV+Li5xu7CWgRGKBLRb7AQfoefYEM=;
 b=ykUjlB7ydjVyud77lj3K4T2/v5tArwW8k57CBUEaubnMcC4kQPHnU1zThb2g89JtdyqJjT8jE
 L5s4j0dpLmtA7fNwzKCDxRZgNaRKvkHC0PWcvEmdTJpHt8jX3JWOjX6
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add Flipkart to the vendor prefixes.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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



