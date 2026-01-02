Return-Path: <linux-arm-msm+bounces-87214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D62BCCEE4D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2218301C3EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316822EBB89;
	Fri,  2 Jan 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXsHVxtP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487B2E7631;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352626; cv=none; b=hWIbNRZwFpemeQdHLLcqC6VRl9gAdZWe3v+a0z7o+dJwnGWuCZ6fAnh4RRzyDwM2noIa3ch36pQ+3IoxsVu6xpXSOF5VM9RZ0NnKwe/VZfQQfCEXrtqyKQPHm0nf6vjQ2mKbq1KSzdDWV8tUhYe5wYltt2EjhAwCPM1HE7tno4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352626; c=relaxed/simple;
	bh=c52ToyZxPNlAtJN0TxL3rQ5RMuuxuHDx8yn1dQa3AEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uz+NWtRl6meLmuODV1dI7Q6Hi1sh+f+A+U/Fm+98FuyY3ERtO+h2b74nuQBmyoh0Nx64g75BVPyRXxR74zz29hMGcaZiLGJjhpa6cR0jBYJeZswktyxFWDAU9JMt8hr5hK+JWAFyzOcDe0MwM8P0VYTB7ArtkRBfuABA+uDSPJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXsHVxtP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81A4C16AAE;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767352625;
	bh=c52ToyZxPNlAtJN0TxL3rQ5RMuuxuHDx8yn1dQa3AEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jXsHVxtP+bBOxlbbrvfdMvwLxG5gFnTZ8epUPGkLcat5Es05GQgT8rYThgk99w/zn
	 UKF+6Bqsm80mfVI6Ig+s+kEJ7xJ5U77M7FmAkyDVejJhalbDfAvlCzYS2r+8iWGeWd
	 +uAGo47lrJsOIT+3/YRgYhw73FAkUN1nPBpfS0OTCCxItRD3Yush4EzOY9qhwHX/o1
	 1ymAZ+aWQOyXPC9u5eEYOBDYCveUp7XOmWtvc2T5uAA925XlXn5SfHjU4BCZVNi+/P
	 JfJJG6OQ0E2YUrsjKgpkJ9OYfRftKbOQNF17UDdrs6uTOq389wEafF2QFCQPMs7h2f
	 rPV7AKlTtM5vQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbd9J-00000000458-0Ylq;
	Fri, 02 Jan 2026 12:16:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] ASoC: codecs: wsa883x: suppress variant printk
Date: Fri,  2 Jan 2026 12:14:13 +0100
Message-ID: <20260102111413.9605-5-johan@kernel.org>
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

Drivers should generally be silent on successful probe.

Demote the codec variant printk to debug level and instead add a warning
in case an unknown variant is ever encountered.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 3ffea56aeb0f..468d2b38a22a 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1058,22 +1058,23 @@ static int wsa883x_init(struct wsa883x_priv *wsa883x)
 
 	switch (variant) {
 	case WSA8830:
-		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8830\n",
-			 version);
+		dev_dbg(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8830\n",
+			version);
 		break;
 	case WSA8835:
-		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835\n",
-			 version);
+		dev_dbg(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835\n",
+			version);
 		break;
 	case WSA8832:
-		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8832\n",
-			 version);
+		dev_dbg(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8832\n",
+			version);
 		break;
 	case WSA8835_V2:
-		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835_V2\n",
-			 version);
+		dev_dbg(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835_V2\n",
+			version);
 		break;
 	default:
+		dev_warn(wsa883x->dev, "unknown variant: %d\n", variant);
 		break;
 	}
 
-- 
2.51.2


