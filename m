Return-Path: <linux-arm-msm+bounces-56828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E675BAA9F7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 00:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 006051A82506
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 22:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DEC283FE2;
	Mon,  5 May 2025 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRa1b4v2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76392283FD8;
	Mon,  5 May 2025 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483330; cv=none; b=X03222DyvRLw0PWhNC6SuabVCWCGEwg/2fIqyYz46cqBrIXFITGiBdozqrKo+7GI+dDG47sWp9P0F0/pr0H3Zbai7bFkSiWvraKxECxwUvCpRgGLNA1adGfQObZSV5OyoAD+PSyVyWhAMbYdCLqS+R084QH5PtA/LJ6sEB5/WbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483330; c=relaxed/simple;
	bh=vV4zjyq9Dk1uzswhKnxyXq2mIXutnRHBqEUZbqX6iRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L1SdSz623knfHhTM1sQtFpIgkCBaRXITbyhpPadj3o9ls+e+VRdXB4jxrgZfSPuygrHrS0wcue31e30b0op4rr58z/I7upT1TC+7ksd+TWtvFAt/yU4Z3cdWNdGKLkUexm4DhQsU0HzKxQs0i85h/svNm7hOd39fzLSJEeUZTLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRa1b4v2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCE1C4CEED;
	Mon,  5 May 2025 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483330;
	bh=vV4zjyq9Dk1uzswhKnxyXq2mIXutnRHBqEUZbqX6iRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRa1b4v2vwMeYEBqYEINuqagjd1FqOnb3rkCpXhijjs+8zMNiiA5QXNyQevgrz3nh
	 9PaSqDNadfwdH/hQH/HSfEniEo7iPEIAgp+tPNqEXuB+pzXfc1pwxs+OdTcLbH6scP
	 8anFm93cRXuV7VfozIPmujrIDiy9m977RigFbk3lwS/FF8+8JgWaq/xjOWg3LWonsM
	 q47dKFpZvadXw5uy5X4L2ivs8ytuapSuF7b7n9+KMLylXeZy7cWza+UHAc3T8eqDds
	 fo5hPYBl2BEvw7RdU3HdhVc7gB5QfTr7VMMYaVOKxCB25BnAl5yWGZ5kriw9bNt9wu
	 I/3lm7vfIfPTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 037/642] ASoC: codecs: wsa883x: Correct VI sense channel mask
Date: Mon,  5 May 2025 18:04:13 -0400
Message-Id: <20250505221419.2672473-37-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit ed3b274abc4008efffebf1997968a3f2720a86d3 ]

VI sense port on WSA883x speaker takes only one channel, so use 0x1 as
channel mask.  This fixes garbage being recorded by the speaker when
testing the VI sense feedback path.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://patch.msgid.link/20250312-asoc-wsa88xx-visense-v1-1-9ca705881122@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 47da5674d7c92..e31b7fb104e6c 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -529,7 +529,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	},
 	[WSA883X_PORT_VISENSE] = {
 		.num = WSA883X_PORT_VISENSE + 1,
-		.ch_mask = 0x3,
+		.ch_mask = 0x1,
 	},
 };
 
-- 
2.39.5


