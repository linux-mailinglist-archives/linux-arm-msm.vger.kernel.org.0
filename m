Return-Path: <linux-arm-msm+bounces-56843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F845AAA883
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 02:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899B016B38F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 00:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9C9350155;
	Mon,  5 May 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1V38LQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF8B35014D;
	Mon,  5 May 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484824; cv=none; b=nJ8899Ibb09TPVa5UhzLSM6yxXrFWWQAFZ2z7V8vjCQu/Wra8PorORIYHLnxEyd2K/z2QTvbTyU+fkJOFSlmWqq+DNzZh4USuvuYkcwApgZXUz2yfdMV2qqdDfzzjfNWWjaHkD82hEDPa4ePmqu8xn/F521PAIzKeXB75RphCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484824; c=relaxed/simple;
	bh=hbBPPF/t8qD5NAM+L3aWD5RMjQP1XWlyvcE97YNQk/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=op0CNA/p+fRT2gjWk3WDCY9K8pRg33H+4fPGzt0Wt4rMqUvAm7CZM3x2XxjI2we+Rk/O71lZVLqSnt+8KSqgfiN/vwOh6yMfd7z++gemXftZy/qnZ2Op/zyr49WSApAyPlNdQqyYAJA7V6yIPViba7QsNmYO2T0jIKeJCiCgFnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1V38LQC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24B3C4CEE4;
	Mon,  5 May 2025 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484824;
	bh=hbBPPF/t8qD5NAM+L3aWD5RMjQP1XWlyvcE97YNQk/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h1V38LQCyj7nEJ7KxWN7PwU+g+cr1jxQaV1rOuAMpVDLw+0f21wgaENQQMX6pzZuI
	 TwWJg7tm7QMiNfB3o+YmczAZDCstLP4/VpMjjSQR3R8/+P+0fVo+y9kiUY2kTO9N5i
	 /OJb2XcGOXuSdkCvecVle7xoX87+5vU7avAiE03DOXtmJIWHE/3ItD+uAllXaZHlAz
	 A+KnEIGLQblXhw/zEvT91sjPTLt5g72ppc6O7MuYGiA1hcwFwoG4pOycohr5Uu1AFf
	 RtlwFgESs22azLUPqZ831g7AeSfWNBKVNYe59tKThiwN3IyIJ60Q0qE/U5rhjRPcQc
	 FVE85NfTMbbEQ==
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
Subject: [PATCH AUTOSEL 6.12 032/486] ASoC: codecs: wsa884x: Correct VI sense channel mask
Date: Mon,  5 May 2025 18:31:48 -0400
Message-Id: <20250505223922.2682012-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 060fac202eb8e5c83961f0e0bf6dad8ab6e46643 ]

VI sense port on WSA883x speaker takes only one channel, so use 0x1 as
channel mask.  This fixes garbage being recorded by the speaker when
testing the VI sense feedback path.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://patch.msgid.link/20250312-asoc-wsa88xx-visense-v1-2-9ca705881122@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wsa884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 560a2c04b6955..18b0ee8f15a55 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -891,7 +891,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
-		.ch_mask = 0x3,
+		.ch_mask = 0x1,
 	},
 	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
-- 
2.39.5


