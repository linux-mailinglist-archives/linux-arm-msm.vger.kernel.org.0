Return-Path: <linux-arm-msm+bounces-83937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA955C965D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 10:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4EC493419AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 09:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6297C2FD7DA;
	Mon,  1 Dec 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi6QqSfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A7D2F7AA8;
	Mon,  1 Dec 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581020; cv=none; b=IIz9ccqMOcZkWbtlUWCDdP3Hg8SObRMMuV0BB71k1m/Sf2P2/Ql//+Lzcfv7vgw5q+JMMpzkhC6YbZ/LaUTwsGIQ2fBnQYMoCDj4BZt8iMftffi+cXKhrRyiR1kdIZY/FuMFUj+WTgKH8zFCXzcx0tucDsQlWY4Zvr1r4vh86rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581020; c=relaxed/simple;
	bh=B57TeBQR82nNUbn/hl+HNkTw/w+l4dC1L/z6qT1VWVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftjrTJ9Ke3Rg/AHxIs/AFUtqSKDVU3rums0p7PTeeiPwDyQxsytK6SPXIOVXXqwGa66hi8RAKawqIPDGmhdU3lNsfvr1aJQ+MnlyZGxlf+J1njgHxKGFRafGEcSeWJWUaQBmqytQya01NwqkQZ3pLiG0Jw3eMURpR/qP+s0secU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi6QqSfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0853CC4CEF1;
	Mon,  1 Dec 2025 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581020;
	bh=B57TeBQR82nNUbn/hl+HNkTw/w+l4dC1L/z6qT1VWVY=;
	h=From:To:Cc:Subject:Date:From;
	b=Wi6QqSfDg/qixe7WPtZU3pfLiGous3RVFIEB4xaBuz0UMcATKbUWWGErj5U8Isni+
	 n2dPwcm/wwhKS62dxa8+Xmg01LThTcs3I1mJzBoo2ikcgrNEX38RZlvPSHaUEeH7I3
	 qri0rwQ4aOp7jgT2fxmay0Hu10oeeGpfAfajysvg1ylX6PlpZTi8zr0mACS0GfDgF1
	 yCWbQ5NZL0zsFI3Czzp+pv179f7I1kwtTRyBHzoodaYDAB3/iIc5xL454ulswoix5t
	 A8NunuhYJidnp6qjy+A0Jb+qE0w+Q5RTnlMtoWNkgVsDkGYFGxZ40oTRc4HVX213JH
	 jJJisYkcMPkjA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ08G-0000000034c-0buq;
	Mon, 01 Dec 2025 10:23:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] ASoC: codecs: wcd939x-sdw: use devres for regmap allocation
Date: Mon,  1 Dec 2025 10:22:59 +0100
Message-ID: <20251201092259.11761-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Components are bound inside a new devres group so that any resources
allocated can be released on bind failure and on unbind without
affecting anything else.

Switch to using device managed regmap allocation for consistency while
dropping the misleading comment claiming that devres cannot be used.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wcd939x-sdw.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index da342a0c95a5..399dfba79aa2 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1384,12 +1384,7 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 	}
 
 	if (wcd->is_tx) {
-		/*
-		 * Do not use devres here since devres_release_group() could
-		 * be called by component_unbind() id the aggregate device
-		 * fails to bind.
-		 */
-		wcd->regmap = regmap_init_sdw(pdev, &wcd939x_regmap_config);
+		wcd->regmap = devm_regmap_init_sdw(pdev, &wcd939x_regmap_config);
 		if (IS_ERR(wcd->regmap))
 			return dev_err_probe(dev, PTR_ERR(wcd->regmap),
 					     "Regmap init failed\n");
@@ -1400,30 +1395,20 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 
 	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
-		goto err_free_regmap;
+		return ret;
 
 	/* Set suspended until aggregate device is bind */
 	pm_runtime_set_suspended(dev);
 
 	return 0;
-
-err_free_regmap:
-	if (wcd->regmap)
-		regmap_exit(wcd->regmap);
-
-	return ret;
 }
 
 static int wcd9390_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
 
 	component_del(dev, &wcd_sdw_component_ops);
 
-	if (wcd->regmap)
-		regmap_exit(wcd->regmap);
-
 	return 0;
 }
 
-- 
2.51.2


