Return-Path: <linux-arm-msm+bounces-53445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33123A7EA54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 20:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BCB21679AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 18:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D5D25E81E;
	Mon,  7 Apr 2025 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGbks3J8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2401F25E817;
	Mon,  7 Apr 2025 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049609; cv=none; b=BjadJF7uOLkOPOSJ1oOSpP76k8D/gIKbRCoKZsK/XfB+6GZeJixj4gMMGorfOEqnIM/S4lr6XlW8Xb9+9OwLiDUrgoVeHRH4oG9a1SEi4I9GZVqTwcgYQQZcTdZ7U0rn0ZrCUAooEwOS8abBFGDCZylSE/w0E7BKZJogUDsaaoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049609; c=relaxed/simple;
	bh=o66Zs7GApMNs4fUuUIl+NpS0WXNlG3jWsczt+JCtzj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DKoa35Jjz9iq7kyZ/zpaPH6k44BtZcuNMPb769V7wjtrWUOiPn/Bv9ddnC20OL5Nc4NWr33GOdOKzntwHWyJdyBG5uEirsKnU5U3Ps+z4mde/LsNFbWKZwZoYhqioS3u70x9YH/Mzysy68d945ZvsunhL5mNC7Oyxk3b1Y7ZLRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGbks3J8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBAAC4CEDD;
	Mon,  7 Apr 2025 18:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049608;
	bh=o66Zs7GApMNs4fUuUIl+NpS0WXNlG3jWsczt+JCtzj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGbks3J88Fd1sikC3KRpvovq8IIMaiwxMJea5XGxRduAoA96FPr1Bm4ACXACuF8zr
	 1w/Jn3T+1hn0thB2iXuU0m+5nJfem1k5LWRhn0epcSywb69Da1njbGF7GgAJWbo0Id
	 1tGsENnSAmOZsvbSNrrAgf/6KcRcsSN5rdQhdB5R/qqir3ppBu/94MZWGy2acObZrl
	 bx3gLmaXeC5R5lNauXsa4lwkKSkfn37Y3oEFs8bKdhXyfWGsebVFY0ZbtiTxMgyU1l
	 8Yzn7h1pLGwJVEkyrOjY/YB3DGDnZpMdehbgh0mPJ8lfiJjYC4a0+AaVk3gdPzRip0
	 vGzhRo81XC2Wg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.13 26/28] objtool, ASoC: codecs: wcd934x: Remove potential undefined behavior in wcd934x_slim_irq_handler()
Date: Mon,  7 Apr 2025 14:12:16 -0400
Message-Id: <20250407181224.3180941-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181224.3180941-1-sashal@kernel.org>
References: <20250407181224.3180941-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.10
Content-Transfer-Encoding: 8bit

From: Josh Poimboeuf <jpoimboe@kernel.org>

[ Upstream commit 060aed9c0093b341480770457093449771cf1496 ]

If 'port_id' is negative, the shift counts in wcd934x_slim_irq_handler()
also become negative, resulting in undefined behavior due to shift out
of bounds.

If I'm reading the code correctly, that appears to be not possible, but
with KCOV enabled, Clang's range analysis isn't always able to determine
that and generates undefined behavior.

As a result the code generation isn't optimal, and undefined behavior
should be avoided regardless.  Improve code generation and remove the
undefined behavior by converting the signed variables to unsigned.

Fixes the following warning with UBSAN:

  sound/soc/codecs/snd-soc-wcd934x.o: warning: objtool: .text.wcd934x_slim_irq_handler: unexpected end of section

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/7e863839ec7301bf9c0f429a03873d44e484c31c.1742852847.git.jpoimboe@kernel.org
Closes: https://lore.kernel.org/oe-kbuild-all/202503180044.oH9gyPeg-lkp@intel.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 910852eb9698c..c7f1b28f3b230 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2273,7 +2273,7 @@ static irqreturn_t wcd934x_slim_irq_handler(int irq, void *data)
 {
 	struct wcd934x_codec *wcd = data;
 	unsigned long status = 0;
-	int i, j, port_id;
+	unsigned int i, j, port_id;
 	unsigned int val, int_val = 0;
 	irqreturn_t ret = IRQ_NONE;
 	bool tx;
-- 
2.39.5


