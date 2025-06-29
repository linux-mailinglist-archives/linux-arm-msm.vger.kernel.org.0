Return-Path: <linux-arm-msm+bounces-62927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13093AECB43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 06:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22E0C174E61
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 04:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554241D516F;
	Sun, 29 Jun 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0yZqIY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D181AC88B;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751172311; cv=none; b=oInPw7YRWxrdgUF9EDAmehqcgz8pWi8kqZTGu/DzeTUupozvU2Z11i7rUtW/3JZsR+VBA5P/6iQ1ckB6rBjjjpxEJns3VyZlqetygc5+1/070b0MzaqbLkLU6WclR2Gq3jC8uHBgYt2WDmn4vuufycMISngFA9R++qUFzdkWmbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751172311; c=relaxed/simple;
	bh=LcI2jfjGdk5IleXMM7jD1iyUKv647Lsd22B9OeWuP0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpJxgS63j9FCa36Z6mE20f8coLCvK5yyxgIIXPstsmGII2wGIWVqUz1xZuwYxUQzTpdDs2pav85BD/H7YHx84i/8Lwm2aLNNec+VCM4BB78osECBC9lM0eAi7uQpIHpgjRsE7uDW9l4EcpZ8uSH3SnN2zNkUe0alfN9P9G5B0Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0yZqIY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E2F8C4CEEE;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751172310;
	bh=LcI2jfjGdk5IleXMM7jD1iyUKv647Lsd22B9OeWuP0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i0yZqIY31UCro/n79j5JyGqOMPJvmle6R4MmfX8bTmnNjAa6EIETscq+Q94+oMFZG
	 8jnTORddK2gLUndDEgMR0WLSV2K6TxMl9kPzZK8/OxLxZiLF0DOc4/bVpioLsd6B6Y
	 vJmIs1q4VVxUxThtTx9RcKCSaWvLn5OHkB1ELX/9zcgawjRkvnxvjNmX9eLTb9RqyF
	 uFUgSuO0ZKbP4f7uUi2LKNlLV4bfhiReISv/FiFiScRv58Z+w/Zha7LTevQwhJXbmK
	 PR8/ZhthhfiKHlRWy1QDmUOej/hhspUBaaXG6YrQpoOdyKiZQST3Jembp9TPdNtETF
	 MmewmZ3UUVxbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A7BC7EE30;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sun, 29 Jun 2025 08:44:37 +0200
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Flipkart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-rimob-initial-devicetree-v4-1-7cf84fa142af@protonmail.com>
References: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
In-Reply-To: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751179514; l=889;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=NN+SDIpuztIl0NyV+Li5xu7CWgRGKBLRb7AQfoefYEM=;
 b=cF1k7jNSZLp5og655bQHn1jeqyMl8q/Tr/hmovKgM3jgO3MTjEuxkn3Kh76/SGPWLfG7TWDw8
 y66ORkGnVCYA+/IWH3yWMH6oUpYHkpvMQVsrGc2qTgCu1+ZiSXN+PXO
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



