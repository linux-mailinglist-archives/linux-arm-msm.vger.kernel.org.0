Return-Path: <linux-arm-msm+bounces-87211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C8CEE4C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49D1F300C6C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D206C2DF12E;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FM+FNuB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45952749C7;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352625; cv=none; b=oIDCX+/ycMcpvt1RpsjFLN/FiAg8RhNdilaB6tB4Zxf8VUn/+/eE82gjRyWsXM7RWHrDozfYtFMkYOznDoeU8zru7t9UwP9EULe4K19+gyHnNDFNJ3I2mvXJLafUSaFX9L750/AZleSNGVqQCNnZZYALesmhL5iVlRuu6EpPQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352625; c=relaxed/simple;
	bh=IFoXMfoprHJcdPGJphjp51fna5ofwkM47nNwJSe0jY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t24AMjVuMbyZj3GwuVCa2JdgIfxcXYXpmU9gRPXv7HMUFEBIrsRNiopvATiKseVuZSVgIyE1or5JfZdd3dEhx0YcQjCv34l3smNnJwtX+MQwuyNk3FTAhRFsoGcMb2jxyFF2usG446BTIrAtzLy92BSqDyRcZISxvt8SY/tiO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FM+FNuB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487F9C116B1;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767352625;
	bh=IFoXMfoprHJcdPGJphjp51fna5ofwkM47nNwJSe0jY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FM+FNuB7vPVnwKoCbhzpNea/MI7eAf1KOwWsWBMgnJsSLSKV9vW6QH1AU8rQtXqim
	 tks2S/R9QZ8/c+rBFdEw9i17qYVG3Tmtvz0fZFLGzOlodv8RwNOtkhtMycbeMXUIHU
	 +5Ea6y5NNkTck0AbNSwYww9W8aONjCq5khAH6of9COAD/Q3CUgbLxlZtCQg05uLrrX
	 Rjf6nZBaBkCWu3awiOvwIseOJqs0Negr2CaVBs+XNFwMYwFEJMZlsqxXNpO0C4gs2c
	 QdZvCtahtALs3Vi03OoBCrUu8lPTiUsJigcsnFmMYF0AxfcE8Vbu3CL00ekUzb/8oh
	 8QnZnJKbwd86Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbd9I-00000000452-49Pz;
	Fri, 02 Jan 2026 12:16:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] ASoC: codecs: wsa881x: fix unnecessary initialisation
Date: Fri,  2 Jan 2026 12:14:11 +0100
Message-ID: <20260102111413.9605-3-johan@kernel.org>
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

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Cc: stable@vger.kernel.org	# 5.6
Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wsa881x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index d7aca6567c2d..2fc234adca5f 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -678,6 +678,7 @@ struct wsa881x_priv {
 	 */
 	unsigned int sd_n_val;
 	int active_ports;
+	bool hw_init;
 	bool port_prepared[WSA881X_MAX_SWR_PORTS];
 	bool port_enable[WSA881X_MAX_SWR_PORTS];
 };
@@ -687,6 +688,9 @@ static void wsa881x_init(struct wsa881x_priv *wsa881x)
 	struct regmap *rm = wsa881x->regmap;
 	unsigned int val = 0;
 
+	if (wsa881x->hw_init)
+		return;
+
 	regmap_register_patch(wsa881x->regmap, wsa881x_rev_2_0,
 			      ARRAY_SIZE(wsa881x_rev_2_0));
 
@@ -724,6 +728,8 @@ static void wsa881x_init(struct wsa881x_priv *wsa881x)
 	regmap_update_bits(rm, WSA881X_OTP_REG_28, 0x3F, 0x3A);
 	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG1, 0xFF, 0xB2);
 	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG2, 0xFF, 0x05);
+
+	wsa881x->hw_init = true;
 }
 
 static int wsa881x_component_probe(struct snd_soc_component *comp)
@@ -1067,6 +1073,9 @@ static int wsa881x_update_status(struct sdw_slave *slave,
 {
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(&slave->dev);
 
+	if (status == SDW_SLAVE_UNATTACHED)
+		wsa881x->hw_init = false;
+
 	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
 		wsa881x_init(wsa881x);
 
-- 
2.51.2


