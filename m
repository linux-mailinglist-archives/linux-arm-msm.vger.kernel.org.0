Return-Path: <linux-arm-msm+bounces-56844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D975AAA88D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 02:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF513188C782
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 00:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367A335016F;
	Mon,  5 May 2025 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuggbdQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058F835016C;
	Mon,  5 May 2025 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484826; cv=none; b=cgBQPlHDdXQWN5fSawgocC4tHWcbd4IU7yrRRtv/w9W02Cq/+z3L3Eq6EcdGQz7W8IBQsnXbir2QCPUuCEnX3jrGGyokErQw+eGXtNjJs6KpvNVPzfB1XEZ5DEEpaJ/a/D4u87FfhetvWvWq/mpaoZclhSK3teITA+yxqrlkVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484826; c=relaxed/simple;
	bh=vV4zjyq9Dk1uzswhKnxyXq2mIXutnRHBqEUZbqX6iRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ekeejfjQPe62VXBP3gjd4wdLSeP3gl+FHKJhLjHw4dzSNy3CXgzcC4a20aUtazpqlCo+AJ9A531jkapT9jpYurHpuxX0NkD3eoSqHcC2YBXV2v4I8bbNjUT1RigaCjeOYDZG4bC6QqCTlAiFcIHZ1maKBQy3d0GAwmnr/Nu54jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuggbdQ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2A2C4CEED;
	Mon,  5 May 2025 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484825;
	bh=vV4zjyq9Dk1uzswhKnxyXq2mIXutnRHBqEUZbqX6iRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fuggbdQ/0qCWehKzAf/3mlQKgodUar5wARFX+hBuX0hpE/ByLIrLhKgkDZLeh0/jb
	 2ls99QFwCx03VReeot5alsmgkr+UtvCpXxNPg2v13gLhcX2wSV3bEZmziJYnen33AP
	 okZU+OcSDxXfBSqU45Y2dFbHSeE4FWKuQxmH1v8sZd/U6PSTH1s6U6JTrIP6Li+9qx
	 so3LgVBRjYNAPnJFII8LQWzJObWmTIxiCq95BOsJyLTHHYT2nMtBUhb6HuIiaIELd6
	 qaylXUcudOUPAmGlw/43dtHmFUETMaxplx4Kznj3UZnW36bd7tSCJAEwJ2/Tf4NIYd
	 iAzRMQUnmjZWQ==
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
Subject: [PATCH AUTOSEL 6.12 033/486] ASoC: codecs: wsa883x: Correct VI sense channel mask
Date: Mon,  5 May 2025 18:31:49 -0400
Message-Id: <20250505223922.2682012-33-sashal@kernel.org>
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


