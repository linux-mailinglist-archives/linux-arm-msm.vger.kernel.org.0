Return-Path: <linux-arm-msm+bounces-32474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD069859F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 14:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B382C1F24CBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3AF1B1D6B;
	Wed, 25 Sep 2024 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLdgPZQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB371B1D66;
	Wed, 25 Sep 2024 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264482; cv=none; b=oM117l23kr4he+6oNGN7gmCATsAyttQP9waneYHSDH9iyi2P+/aYRcMoMxkK+saPXLcrXgNLvDR1ZKMzuUlaP5LJIBAhtt/wUc/HCpFF/9qhZS46r1NF5HajIvNVWnxkTgKHF7SL1DSMUBnl6o4XMygVe47BhZ7fqFO7E5QKyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264482; c=relaxed/simple;
	bh=3EBHgI5jWIASh0jFC87Ehq5VX3rMzlLur/2SNTpmArE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmDp+EukT4EWoqQzTmuyzWjPtu/vxo90ENL0EKHv7sIpA0lt9eIuPnfRQbbT6aNFEHwvr6fQx1FQ2ZK3tvUokhzf89AAzh8qj6ekFAFVbA/A+U7K0dm+as6fiavlsJHVbeml+78nDPeAHzTFIsIo6cZbxWxG2CItxaRXv5ngP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLdgPZQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B03C4CEC7;
	Wed, 25 Sep 2024 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264482;
	bh=3EBHgI5jWIASh0jFC87Ehq5VX3rMzlLur/2SNTpmArE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MLdgPZQpXDggwSxPt0CnPSuJovxP2A8DpJBL4hWWO/HhzGaLRrySafbJAeUjbJGwr
	 tMwQlMdgF92rrS6ky/Cicg8/61jkpkXmcHh9RRC4Usb/N6NeVlsQbihMJGi0DnTmmY
	 OtFYpUD9FkSPVlU/fiDKPzFhLM7OxqbDHD+UmHA9u6mz/rFASbFElOG0m2sX4OORLH
	 52IQVPw7PXFA+I06ZBYwpnNEyqtHSLcV2530WABsOEWotv4QmL40W8mI7mlIRgm45J
	 y0o+awoLneVUNYxYf8xap/QMO61xbK3zNM+uR37CGlsF+kgWOYEIEZo/JwHbUuvU/q
	 +yktBPvmfLSZA==
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
Subject: [PATCH AUTOSEL 6.11 098/244] ASoC: codecs: wsa883x: Handle reading version failure
Date: Wed, 25 Sep 2024 07:25:19 -0400
Message-ID: <20240925113641.1297102-98-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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
index 3e4fdaa3f44fb..53f6de4340548 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -997,15 +997,19 @@ static const struct reg_sequence reg_init[] = {
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
@@ -1040,6 +1044,8 @@ static void wsa883x_init(struct wsa883x_priv *wsa883x)
 				   WSA883X_DRE_OFFSET_MASK,
 				   wsa883x->comp_offset);
 	}
+
+	return 0;
 }
 
 static int wsa883x_update_status(struct sdw_slave *slave,
@@ -1048,7 +1054,7 @@ static int wsa883x_update_status(struct sdw_slave *slave,
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
 
 	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
-		wsa883x_init(wsa883x);
+		return wsa883x_init(wsa883x);
 
 	return 0;
 }
-- 
2.43.0


