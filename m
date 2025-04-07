Return-Path: <linux-arm-msm+bounces-53450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E6A7EB25
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 20:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D236B17096F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 18:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AE426B2AC;
	Mon,  7 Apr 2025 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3p+gBZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339826B2A7;
	Mon,  7 Apr 2025 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049748; cv=none; b=rMjtrf14mk0kLOWCqrw5MyLTamWTzWvpNrwhjTCs+qML86CW6H52SB02KZ0wgWwVgLLL5Cofa1QzYHLGKzhB6r6Idx/36KnQcPKOQC4Knw6g5K8bpmL6TqIFP+m6Tr/RYebdwCUWwC5/hpOjFqg6tKIUDwbsN8YyRWft6zTgEd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049748; c=relaxed/simple;
	bh=KvsblyEdz/xv8NtFgoINqBC7vkrPSEfGskC7X0xnG48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ytwrr55rydl8D+w6JSRGv+O0f1+V+7F9ojRyLEGf8Hnk/CY58JFWcPN1yd1azIuMHqzEuT/jzHizrz05XahwDQ+fYP7FrJxy59vWH/XC4vLI2KCkHZMVB0pXhIZBuvBE7zt+V09PxZDSPMZfTvYJJCcFmsYy93S7uV/t/VG6rpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3p+gBZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DCFC4CEE9;
	Mon,  7 Apr 2025 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049747;
	bh=KvsblyEdz/xv8NtFgoINqBC7vkrPSEfGskC7X0xnG48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3p+gBZlcxl/OIXSo1+Vn3TDZ7X8mtXP3fAzBINmWCGvHj07Zt8Tnv8iyFU8m1pLM
	 pL8QHF7jA5Qc2R4GZJ9IsBkiz3rtD9PST5q3Yk/87akOhPEUKa2spNMvobPRg1aHCx
	 zhUwL7ORxUu1gqJNS3lKwT/7wXQJzK0jAbCrGGborQvwSMACwnLdu/VayeD2lIQXzz
	 PlvE1S5qgPt509Z3bV90Ik3lXxdT4aB2WoT3trlKCxDBSPCCoDq/oqK+2+ecpRgj1w
	 hcZoFSJAXXrpoDLWrgqkvTTufhVALZxB9DRJIFuvClZPKcasNAi8foCsQ3rJadjoww
	 GtRJesPubtV9Q==
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
Subject: [PATCH AUTOSEL 5.10 4/4] objtool, ASoC: codecs: wcd934x: Remove potential undefined behavior in wcd934x_slim_irq_handler()
Date: Mon,  7 Apr 2025 14:15:34 -0400
Message-Id: <20250407181536.3183979-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181536.3183979-1-sashal@kernel.org>
References: <20250407181536.3183979-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.235
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
index 104751ac6cd14..8580f5e95ccf6 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2188,7 +2188,7 @@ static irqreturn_t wcd934x_slim_irq_handler(int irq, void *data)
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


