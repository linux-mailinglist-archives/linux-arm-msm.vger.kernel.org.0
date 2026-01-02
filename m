Return-Path: <linux-arm-msm+bounces-87213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1683CEE4D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35227301A1EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF2E2EB847;
	Fri,  2 Jan 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czRc/2FO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE582E2DEF;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352626; cv=none; b=ilEZWUneKtd506t50wtTk8HARfn0iko4yghai73iH47fz+Tplq8pkWiQeXdJCCMFGPsVD6eZc2+bCV9Cfm3/95ZlqaNw664nB9XcBIPu1iOGWYOMWGbTxdNaRATvvE12HAtQI9TGE5Czs0TAOi00nmkFQHecJU75ibSz3h5XwV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352626; c=relaxed/simple;
	bh=rk+cbJM2wJVxZ4T/W4bzG9bPA0LS3+V03lvoHPlAkJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8b5qRUBDfML4q+rJfRR+2AhaPB7FZkLzh4vKb3qo0QOxZ3CSmEAUrQaMebO9eL6ZgeC2k/Ut+oIKMJfUUkP7Pq1HgKPUAK6Yerrjywli5t/PbdAtc6vy+fT+MNMSJ9vmsr9fDVT+vTA9epyLEDkbnGD/2qTG+ptkH9dHaksrQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czRc/2FO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8359BC19424;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767352625;
	bh=rk+cbJM2wJVxZ4T/W4bzG9bPA0LS3+V03lvoHPlAkJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czRc/2FOyiMyaNEVpvk+bPGhwKREEYslOKIpuglmCIMUehSA+GKPklsY0/nq0NmqN
	 +RiD0VEALUDJNfZ1uRA54z2NBo93dy93sVYt97Gi5HWrJoa54Q8E51CMBV/PAqdFq+
	 /iQyDtNXg2Qw4jKtVYwwyM0x4ZyzqOhRlMZWxbqxALgtOl/FsaMivNd2vXKaBe+PUC
	 0Xn+eXYsda6U0kYFRB6yTwx6Ki6I7cZXnc4cJVJnGuHxeOUkw6jrtwAb41Y2OWFdJG
	 eX50ziWOEVYorhMZS0dhs6fzS564CJezC/98mNLz2jjbjKHlmb578Pa+mvykUAvcX5
	 31/qobGj07tOg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbd9J-00000000455-0HEK;
	Fri, 02 Jan 2026 12:16:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/4] ASoC: codecs: wsa884x: fix codec initialisation
Date: Fri,  2 Jan 2026 12:14:12 +0100
Message-ID: <20260102111413.9605-4-johan@kernel.org>
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

Fix the inverted hw_init flag which was set to false instead of true
after initialisation which defeats its purpose and may result in
repeated unnecessary initialisation.

Similarly, the initial state of the flag was also inverted so that the
codec would only be initialised and brought out of regmap cache only
mode if its status first transitions to UNATTACHED.

Fixes: aa21a7d4f68a ("ASoC: codecs: wsa884x: Add WSA884x family of speakers")
Cc: stable@vger.kernel.org	# 6.5
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wsa884x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 887edd2be705..6c6b497657d0 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1534,7 +1534,7 @@ static void wsa884x_init(struct wsa884x_priv *wsa884x)
 
 	wsa884x_set_gain_parameters(wsa884x);
 
-	wsa884x->hw_init = false;
+	wsa884x->hw_init = true;
 }
 
 static int wsa884x_update_status(struct sdw_slave *slave,
@@ -2109,7 +2109,6 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 
 	/* Start in cache-only until device is enumerated */
 	regcache_cache_only(wsa884x->regmap, true);
-	wsa884x->hw_init = true;
 
 	if (IS_REACHABLE(CONFIG_HWMON)) {
 		struct device *hwmon;
-- 
2.51.2


