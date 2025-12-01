Return-Path: <linux-arm-msm+bounces-83940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC1FC9665A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 10:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B0CB4E2693
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0DC301037;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITJUoiqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477CA2FF143;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581680; cv=none; b=aA/otmm05flXOGMilnHoRkS5rNxX8V6ILFmfMro6GHHYfIfIU9x6mRHckx2DWGZorVvUq1YoQAiJdLb9oRrpPxnRKsyer2LkTguaWTQLA4tRC1/LWvUkgGTeZp7sjj9RtR9z/aiyZIB4DNC4gvobDwJBD+WQqydk5uTDpXZI3Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581680; c=relaxed/simple;
	bh=Y401cRXetgMj8bk9FRO3LZNgQTatnuh7HEXVtI0iY/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOOnzYlDF3YCmv5ummyy6FgOEH3aMwMiWjfTuozWhSNw0HSrCXUBUUemmmdNF1c/k6wc1RoM7v/tb4fo55vSfCWAYIMnoMEOTg4BCCSk+dPbu5hUstzRHyMSTx/nvmQKj3VniskZdJupVHboftUuLQ7l7StGygD5C8EsGEmUZXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITJUoiqP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211B6C19422;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581680;
	bh=Y401cRXetgMj8bk9FRO3LZNgQTatnuh7HEXVtI0iY/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ITJUoiqPHSPVyHuGKY6yW2LFMwuOHj2pKvnkV9CVtupvSx+1NukwPnZT0H1jmS7/Y
	 Yv1vRG7WZDIQNA7CqUV6IWzgG8ItgyBWYXWSJH+4NDTnv567Bsbw3RA9a1gg6yx3jO
	 XLF+DnqOux1Ty+8mNpPnbH27inJ07EwHaKMAvZNtm+QESV7S8j/87I45Of1Q176F7S
	 2AI8LiVgIiYQIt1VrNe/rrQiY830hDWgPRrRbSAdmfYp5VYkH1NwQOXqUd8kCbyPBA
	 WV7nXYctTKk7EXEl1fubGpHrosrdZx9YsF3gC1ZP+XeBkzGdcCYJd2DfOYNDDJ1NVT
	 zAkTxbjGQfJiw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ0Iu-000000006NS-2ocT;
	Mon, 01 Dec 2025 10:34:44 +0100
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
Subject: [PATCH 3/3] ASoC: codecs: wcd939x: fix OF node leaks on probe failure
Date: Mon,  1 Dec 2025 10:34:19 +0100
Message-ID: <20251201093419.24474-4-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251201093419.24474-1-johan@kernel.org>
References: <20251201093419.24474-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The component match entry release function will drop the references
taken while looking up the soundwire OF nodes when the platform device
is unbound.

Drop the additional references taken to avoid leaking them on probe
failure (e.g. probe deferral) and on driver unbind.

Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wcd939x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index e74e6f013131..4f3be55370e2 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3526,7 +3526,6 @@ static int wcd939x_add_slave_components(struct wcd939x_priv *wcd939x,
 		return -ENODEV;
 	}
 
-	of_node_get(wcd939x->rxnode);
 	component_match_add_release(dev, matchptr, component_release_of,
 				    component_compare_of, wcd939x->rxnode);
 
@@ -3535,7 +3534,7 @@ static int wcd939x_add_slave_components(struct wcd939x_priv *wcd939x,
 		dev_err(dev, "%s: Tx-device node not defined\n", __func__);
 		return -ENODEV;
 	}
-	of_node_get(wcd939x->txnode);
+
 	component_match_add_release(dev, matchptr, component_release_of,
 				    component_compare_of, wcd939x->txnode);
 	return 0;
-- 
2.51.2


