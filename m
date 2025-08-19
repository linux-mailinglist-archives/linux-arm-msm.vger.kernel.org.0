Return-Path: <linux-arm-msm+bounces-69794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A19B2CABC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 19:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEB31BA5579
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 17:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E075E30C348;
	Tue, 19 Aug 2025 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDs+vgN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20AB30BF6A;
	Tue, 19 Aug 2025 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755624932; cv=none; b=pQ8ix6g2A6++M5ekedhvLAPl3fYDTlbIvzdqZdkGDR4gv0qfHYxWcdxXEmMjtVyMP2rJns0p//+8xE+c4CyMgqx6pJpMcbwnHUYJZKQwr/QQBFgI3MHcxeRRm/Feq7pms8eQXOiq7eLtD1O+DdWoEsJkPKZ/MTuLZ9rR7t4Bc/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755624932; c=relaxed/simple;
	bh=NbJZ1PvyWaHWtXxZjX7+dIVe0weMcIVtJxAnEiw0eQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izKfH75lG9YqV07SpC10ZIBb7PT+ukfETbKeacM+aUe0kepH2GWSSvJUm3fY+RKPrmxhGW0C7MAinqxQoKi/berRgDaLnBvU3bMve4+c6EgyNYbXqAsL3E3iQm+FO25G9OV+u+T8XQIgyP1DePZ+j1na2fmN1MF5R2vcNTmYFhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDs+vgN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9141C19422;
	Tue, 19 Aug 2025 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755624932;
	bh=NbJZ1PvyWaHWtXxZjX7+dIVe0weMcIVtJxAnEiw0eQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IDs+vgN4izGEjgQOiuDeqdNaz2bBUAmFln7Tbw+xBg2qDicXWHOJbiXu3dgkTbYAk
	 EKkJfLIAOPp37ocJb+TMccctAojEmd6DutTYkiY1K22Lij/MtEQlewNUxpHxj7Vq0z
	 4uQepQeApIZ14GNThUn71aLsjNBBwyuAdhFGkL/qNjtSRzi/ItNC8g7AHYOvE3jB4q
	 iB3LGdkHI7BRkrjS+OZrT0Ly1zbpDGWOYks0S7GrvY/z4bE6BkmwD/qVw2fSTHpxst
	 XD85JBnRHerVgkJ46eIpEeBmY5NQFjFVuyss2LCb163kScM8xMjStVNyxpxFQGfTYr
	 u/KQOEufMzVOw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.15] ASoC: codecs: tx-macro: correct tx_macro_component_drv name
Date: Tue, 19 Aug 2025 13:35:19 -0400
Message-ID: <20250819173521.1079913-9-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819173521.1079913-1-sashal@kernel.org>
References: <20250819173521.1079913-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.1
Content-Transfer-Encoding: 8bit

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit 43e0da37d5cfb23eec6aeee9422f84d86621ce2b ]

We already have a component driver named "RX-MACRO", which is
lpass-rx-macro.c. The tx macro component driver's name should
be "TX-MACRO" accordingly. Fix it.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patch.msgid.link/20250806140030.691477-1-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Backport Status: **YES**

## Extensive Explanation:

This commit should be backported to stable kernel trees for the
following reasons:

### 1. **Clear Bug Fix with User-Visible Impact**
The commit fixes a copy-paste error where the TX macro codec driver
incorrectly identified itself as "RX-MACRO" instead of "TX-MACRO". This
bug has been present since the driver was initially introduced in commit
c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx
macro"). The incorrect component name causes:
- **Debugfs confusion**: The component appears under
  `/sys/kernel/debug/asoc/` with the wrong name "RX-MACRO", making it
  indistinguishable from the actual RX macro driver
- **Potential userspace issues**: Any userspace tools or scripts that
  rely on component names for identification would be confused
- **Developer confusion**: When debugging audio issues, having two
  different components with the same name makes troubleshooting
  difficult

### 2. **Minimal and Contained Change**
The fix is a simple one-line change that only modifies a string constant
from "RX-MACRO" to "TX-MACRO" in the component driver structure. This is
about as minimal as a fix can get:
```c
- .name = "RX-MACRO",
+ .name = "TX-MACRO",
```

### 3. **No Risk of Regression**
- The change only affects the component's identification string
- It doesn't modify any functional behavior, audio paths, or driver
  logic
- The correct name "TX-MACRO" is consistent with the driver's actual
  purpose (TX = transmit path)
- Other similar macro drivers (WSA-MACRO, VA-MACRO) already use their
  correct respective names

### 4. **Long-Standing Issue**
This bug has existed since the driver was first merged, meaning all
kernel versions with this driver have the incorrect name. Backporting
ensures consistency across all maintained kernel versions.

### 5. **Follows Stable Tree Rules**
- **Important bug fix**: Yes - fixes component identification issue
- **Minimal risk**: Yes - single string change with no functional impact
- **Not a new feature**: Correct - purely a bug fix
- **No architectural changes**: Correct - only changes a name string
- **Clear and obvious fix**: Yes - the TX macro driver should be named
  "TX-MACRO", not "RX-MACRO"

### 6. **No Compatibility Concerns**
While changing a component name could theoretically break userspace that
depends on the incorrect name, this is unlikely because:
- Having two components with identical names ("RX-MACRO") is already
  broken behavior
- Any userspace relying on this would already be confused between the
  two components
- The fix brings the driver in line with its intended design

The commit message clearly indicates this is a straightforward naming
correction, and the code change confirms it's a minimal, safe fix
suitable for stable backporting.

 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 27bae58f4072..fe000ff522d2 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2230,7 +2230,7 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 }
 
 static const struct snd_soc_component_driver tx_macro_component_drv = {
-	.name = "RX-MACRO",
+	.name = "TX-MACRO",
 	.probe = tx_macro_component_probe,
 	.controls = tx_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(tx_macro_snd_controls),
-- 
2.50.1


