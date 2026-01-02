Return-Path: <linux-arm-msm+bounces-87212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D738FCEE4D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54BC23016CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D4C2E8B74;
	Fri,  2 Jan 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqazDRPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D7285CBA;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352625; cv=none; b=UCupfxydU01+rfwJc1qD1uyD1y8dTXQhnBPSfxDyioAEKykFCkVmyI9gJrpSNHwzMu/r/Frjo98xM9g4Dr6Ks0sQwI1iMZSAz/+ETSSh0M0sZjVq3haG1NCpFrDc8Bhx+24jRY3Hxj3q8cb5Gjn14cHxoNm7sEe5sAsozKhoc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352625; c=relaxed/simple;
	bh=LkyXlikqJ4zX4OMQnM6hSqcg84kjMZQKiZgJpBP1y64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rl1Hm6T6dEGGQjv1pCYIQULqt5Kf7cQ1zMMty7WQlWLqJ070UuNTCgo+kR5jlVBsplHYJBy/BTB6lg+sa6mA9SZDUxBDB1mbFVHPc85tTn/t5Hl9vj2FLwfLSM0n+6MbeMq6sUwjugx0PQC8jlHRYB+1TZKUxXhjA4PzLA1TN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqazDRPl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E1FC19423;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767352625;
	bh=LkyXlikqJ4zX4OMQnM6hSqcg84kjMZQKiZgJpBP1y64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bqazDRPlHO1aRXTyjYtJpxwl8o4uthbwbDKVWE2cWZPXKysc3sLaxZrEtWvphbMzN
	 JxKgAA/GfPOVBuSkSwQAVcEBc26Ktl+A6z2pAXYja2bmconDD9aLh9yj8G/fBQoMhB
	 IHmWe/QzAqmQtV3l/bSWX4jKRurT2vW6ucR0eb7Tw79mQaImIHVYe2irvoK/GR+UVr
	 kdGMUiw3rH7NZTvTwI2CMSR4PwsNMV+akDWxGLpyfmVZJUf7PvOCuO6Vz3FctvhYQn
	 xorl93HUjwcyPqRlvxGv82U41ig7zh32G8WgvJPysum5BDQvlbNfag5KebO8X5UwkX
	 w3OsqI+4jfg/w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbd9I-00000000450-3oz0;
	Fri, 02 Jan 2026 12:16:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] ASoC: codecs: wsa883x: fix unnecessary initialisation
Date: Fri,  2 Jan 2026 12:14:10 +0100
Message-ID: <20260102111413.9605-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260102111413.9605-1-johan@kernel.org>
References: <20260102111413.9605-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The soundwire update_status() callback may be called multiple times with
the same ATTACHED status but initialisation should only be done when
transitioning from UNATTACHED to ATTACHED.

This avoids repeated initialisation of the codecs during boot of
machines like the Lenovo ThinkPad X13s:

[   11.614523] wsa883x-codec sdw:1:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.618022] wsa883x-codec sdw:1:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.621377] wsa883x-codec sdw:1:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.624065] wsa883x-codec sdw:1:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.631382] wsa883x-codec sdw:1:0:0217:0202:00:2: WSA883X Version 1_1, Variant: WSA8835_V2
[   11.634424] wsa883x-codec sdw:1:0:0217:0202:00:2: WSA883X Version 1_1, Variant: WSA8835_V2

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Cc: stable@vger.kernel.org	# 6.0
Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index c3046e260cb9..3ffea56aeb0f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -475,6 +475,7 @@ struct wsa883x_priv {
 	int active_ports;
 	int dev_mode;
 	int comp_offset;
+	bool hw_init;
 	/*
 	 * Protects temperature reading code (related to speaker protection) and
 	 * fields: temperature and pa_on.
@@ -1043,6 +1044,9 @@ static int wsa883x_init(struct wsa883x_priv *wsa883x)
 	struct regmap *regmap = wsa883x->regmap;
 	int variant, version, ret;
 
+	if (wsa883x->hw_init)
+		return 0;
+
 	ret = regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
 	if (ret)
 		return ret;
@@ -1085,6 +1089,8 @@ static int wsa883x_init(struct wsa883x_priv *wsa883x)
 				   wsa883x->comp_offset);
 	}
 
+	wsa883x->hw_init = true;
+
 	return 0;
 }
 
@@ -1093,6 +1099,9 @@ static int wsa883x_update_status(struct sdw_slave *slave,
 {
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
 
+	if (status == SDW_SLAVE_UNATTACHED)
+		wsa883x->hw_init = false;
+
 	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
 		return wsa883x_init(wsa883x);
 
-- 
2.51.2


