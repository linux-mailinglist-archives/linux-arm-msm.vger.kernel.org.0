Return-Path: <linux-arm-msm+bounces-34067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A360599A094
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 11:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C8021F25B0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D2C20FAA1;
	Fri, 11 Oct 2024 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLi/WQ0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBED20C496;
	Fri, 11 Oct 2024 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728640648; cv=none; b=RVlTQ1DUz9GkXiMMT3SEY4jv2DDGxvOFy4el9XNENQrwd1RwLp8j6WsxIoBjzi8XqKRdZ4v6+ttdmhPOTjij7aTJQOYA5bN2lrJsWmsgTQNmgWeoSFmy/czkvZUr6F4Opo76Dtw2K0ilg7M9j1w30ZtYsNIiY3PvBzZJpfL5x/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728640648; c=relaxed/simple;
	bh=hsOb7L5eWKwXJPJsWh5XXOI6Us1bIOBJXOrfGRTSao0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZaQiGBzr4vbI7DQVGXIggbkEs/BAqNx589OKG+JIP2bYQXhOr9Ssa8JGNccMXUMzwo99H9dpYf/AZi2SeWMqnfSyJjgnMm+we90xROG+g+wBBy97/jqJWuQnEFbJNyfBu3AVT/FNwD/9W412uGeQTCgTDVGkWqPO4EwbIY9GrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLi/WQ0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575F4C4CEC3;
	Fri, 11 Oct 2024 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728640647;
	bh=hsOb7L5eWKwXJPJsWh5XXOI6Us1bIOBJXOrfGRTSao0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pLi/WQ0vGwyDb2dzl9+Fq4w/QFVDnyZE6c/iZvu8EV7OHL8g/K/HqY5N0QnCuobzj
	 2XljCRFYb6J2i9a+IPgFu9vfq6lIWXrxPoYbrzW3LEyHzcJ3rlxoqGV89G+68RGGcw
	 xXxFfef56sNMj9AlbSN4d83ubSkb6oWg5cdXl6qdB/B92cDbfeMMDLXofG3YUEuIcC
	 gEw/pxKNGT3ManoSs/S7/JXjyHatU40L45dwZV7oVUtc4EwtiCaPnxFh29grf0qJyM
	 rDN6V0+atZpvZPLhTAMbyn43fRod2bs+sHBnSSK7JvlyEUKN8BPyTkdIps3q0C3fIs
	 V0IDwhUR/KxsQ==
From: Simon Horman <horms@kernel.org>
Date: Fri, 11 Oct 2024 10:57:11 +0100
Subject: [PATCH net-next 2/3] net: txgbe: Pass string literal as format
 argument of alloc_workqueue()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-string-thing-v1-2-acc506568033@kernel.org>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
In-Reply-To: <20241011-string-thing-v1-0-acc506568033@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, 
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, llvm@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.0

Recently I noticed that both gcc-14 and clang-18 report that passing
a non-string literal as the format argument of clkdev_create()
is potentially insecure.

E.g. clang-18 says:

.../txgbe_phy.c:582:35: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
  581 |         clock = clkdev_create(clk, NULL, clk_name);
      |                                          ^~~~~~~~
.../txgbe_phy.c:582:35: note: treat the string as an argument to avoid this
  581 |         clock = clkdev_create(clk, NULL, clk_name);
      |                                          ^
      |                                          "%s",

It is always the case where the contents of clk_name is safe to pass as the
format argument. That is, in my understanding, it never contains any
format escape sequences.

However, it seems better to be safe than sorry. And, as a bonus, compiler
output becomes less verbose by addressing this issue as suggested by
clang-18.

Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 3dd89dafe7c7..a0e4920b4761 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -578,7 +578,7 @@ static int txgbe_clock_register(struct txgbe *txgbe)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	clock = clkdev_create(clk, NULL, clk_name);
+	clock = clkdev_create(clk, NULL, "%s", clk_name);
 	if (!clock) {
 		clk_unregister(clk);
 		return -ENOMEM;

-- 
2.45.2


