Return-Path: <linux-arm-msm+bounces-32478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1519985D3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 15:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEEA5B29D9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 13:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A76D1DA317;
	Wed, 25 Sep 2024 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQa7ZvGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA381DA312;
	Wed, 25 Sep 2024 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727265741; cv=none; b=Ao4s9BoR1OQmUdZlc11eGEVt4R+a6IJDlHalWB0ti4wyIA9trPoKPJ7u1317qzGsjeXs4YnOcjgEyEwv6ja0/ciHUNg1UpOeu6zUzP1Hj63q6lmXWGCpEdkFZii53RHaRAp6VUSZfIWCwUNYcvkFIOmCbnFJ9qENWqhvw4VKwR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727265741; c=relaxed/simple;
	bh=lkXxB/YjIjrqCNz9gdjyXC7KTuV69ONi+VaZy64n8X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvIPCeOzdYLnBwe/4KhAZT2+OZQuE88oJOtD+oa5hV6y/k5qWTbCrl3KeuEEOf4bIR6HX/wMNlsNyrGWMwtTG+gbMlvwTSFHKWIMcer0YCc7/jr0rEpvhhfy91zBcI95OyJwrAvezYwq9wBKlgO146KYRiNKKpzbiesTNTPcJRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQa7ZvGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF7CC4CEC7;
	Wed, 25 Sep 2024 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265741;
	bh=lkXxB/YjIjrqCNz9gdjyXC7KTuV69ONi+VaZy64n8X0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQa7ZvGbudG8VOzDytwkW+T+NyRkjnDjd7UjbETfJhgl8AWuDN78woxFpW00U9lfR
	 g0yCIAylKKYNKiK4rz9kG8edy21pZ//VFMS4/X3arTZ4ViArGeTPEKhBySZz1zyDsJ
	 4b7vUCr2GBA6Bu00Prj/0SiL9H3WcLEJhZJT1J7Kn4ugI6OUZvc0Lx26qgcbvpvuKO
	 4E75fQq+8/k/ATgUKDhCBIZRoMRbLIl0JSaFIPrCHDgfQFu3t8UWAvihalKLYKlh8O
	 +j/Wu9L14vzn3GfQHa+PJCVLjKjYaGcSok8urAQVUp2STEyL8EwwQdFSfGGGM9miK9
	 AbVg8qr+06hww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 082/197] ASoC: codecs: wsa883x: Handle reading version failure
Date: Wed, 25 Sep 2024 07:51:41 -0400
Message-ID: <20240925115823.1303019-82-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 2fbf16992e5aa14acf0441320033a01a32309ded ]

If reading version and variant from registers fails (which is unlikely
but possible, because it is a read over bus), the driver will proceed
and perform device configuration based on uninitialized stack variables.
Handle it a bit better - bail out without doing any init and failing the
update status Soundwire callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://patch.msgid.link/20240710-asoc-wsa88xx-version-v1-2-f1c54966ccde@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 2169d93989841..1831d4487ba9d 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -998,15 +998,19 @@ static const struct reg_sequence reg_init[] = {
 	{WSA883X_GMAMP_SUP1, 0xE2},
 };
 
-static void wsa883x_init(struct wsa883x_priv *wsa883x)
+static int wsa883x_init(struct wsa883x_priv *wsa883x)
 {
 	struct regmap *regmap = wsa883x->regmap;
-	int variant, version;
+	int variant, version, ret;
 
-	regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	ret = regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	if (ret)
+		return ret;
 	wsa883x->variant = variant & WSA883X_ID_MASK;
 
-	regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	ret = regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	if (ret)
+		return ret;
 	wsa883x->version = version;
 
 	switch (wsa883x->variant) {
@@ -1041,6 +1045,8 @@ static void wsa883x_init(struct wsa883x_priv *wsa883x)
 				   WSA883X_DRE_OFFSET_MASK,
 				   wsa883x->comp_offset);
 	}
+
+	return 0;
 }
 
 static int wsa883x_update_status(struct sdw_slave *slave,
@@ -1049,7 +1055,7 @@ static int wsa883x_update_status(struct sdw_slave *slave,
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
 
 	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
-		wsa883x_init(wsa883x);
+		return wsa883x_init(wsa883x);
 
 	return 0;
 }
-- 
2.43.0


