Return-Path: <linux-arm-msm+bounces-27266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41C93F682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 15:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A39A228503E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27681487C6;
	Mon, 29 Jul 2024 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bclbK1iY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4A145B3E;
	Mon, 29 Jul 2024 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722258848; cv=none; b=i5mJ9zI1TeszZBQmz5kRW9qA4hu0UA0hxMOgSz0M69b35IyvPvRMrRvaa2AhGMroUDbiErJnw75JNpRH1pMoDYDG6ExsLHKbCtatL9pVg3YTdBDGyL1nTx87B4vut2+c0T8PMu8FleuxqoyAs1FreVbJgS+KeiJ7Udxm410B/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722258848; c=relaxed/simple;
	bh=2/YZLHYwe6VeiM3pUFkU5Uwf+RFlzvvWMDWutDwHs1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2BubfQAfdYgymnwz0RN4mq4mAxsL/3CqB62x3wAHZrJ3qG7cx/6NMUclLmiWgpkIVp/UDNSMt9feDYa0Io0yoZ8cTEqfbXUunwFTBu8Eb4dIPuN79dsZ5Liixyqwn0AWIpe34/fco2s9wH8bAJuFbUxTufLdliFOwmx1Koyj7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bclbK1iY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A48C32786;
	Mon, 29 Jul 2024 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722258848;
	bh=2/YZLHYwe6VeiM3pUFkU5Uwf+RFlzvvWMDWutDwHs1Q=;
	h=From:To:Cc:Subject:Date:From;
	b=bclbK1iYJNgcrsT5kdKuydrNKIIhB9Xkxuu1vbCk/IdIchAHY6fpEbFbDii9Glg8A
	 0/Qbp/aoa7Axdt7t/0BEA4CsN1wHaj7u5GNvphqVma1VRiAhZs649aYytLB3nM0oml
	 0/6VaNQmEls7l/T0BYUAVW5rJL/5DUL7F4xgS980I3Kahyo+Nek+D/G3/hVJwdbRLx
	 YqmlZRo0FlELbCfH7iCamL0xvOhnpQX2TjiPtqu1cDrL3J6jUVl/R6TVgMkwyaPzqK
	 xV/8LfAblWT7U5DkEL/SqAvZJJrQXP4CwZdKpxwlZzofWC/fr0PMh9rJU6AO0g1N2O
	 JH9JhCwmkpcGw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sYQCa-000000007G9-1tX1;
	Mon, 29 Jul 2024 15:14:13 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	regressions@lists.linux.dev
Subject: [PATCH] ASoC: codecs: lpass-macro: fix missing codec version
Date: Mon, 29 Jul 2024 15:13:51 +0200
Message-ID: <20240729131351.27886-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes that started checking the codec version broke audio on
the Lenovo ThinkPad X13s:

	wsa_macro 3240000.codec: Unsupported Codec version (0)
	wsa_macro 3240000.codec: probe with driver wsa_macro failed with error -22
	rx_macro 3200000.rxmacro: Unsupported Codec version (0)
	rx_macro 3200000.rxmacro: probe with driver rx_macro failed with error -22

Add the missing codec version to the lookup table so that the codec
drivers probe successfully.

Note that I'm just assuming that this is a 2.0 codec based on the fact
that this device uses the older register layout.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
Cc: regressions@lists.linux.dev
#regzbot introduced: 378918d59181


 sound/soc/codecs/lpass-va-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index b852cc7ffad9..a62ccd09bacd 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1472,6 +1472,8 @@ static void va_macro_set_lpass_codec_version(struct va_macro *va)
 
 	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
 		version = LPASS_CODEC_VERSION_2_0;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && core_id_2 == 0x01)
+		version = LPASS_CODEC_VERSION_2_0;
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
 		version = LPASS_CODEC_VERSION_2_1;
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
-- 
2.44.2


