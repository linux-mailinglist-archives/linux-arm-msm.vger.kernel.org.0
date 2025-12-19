Return-Path: <linux-arm-msm+bounces-85904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D5CD0420
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED54F303EF9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD2732AAA9;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAvnL9Kk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55A329E75;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154477; cv=none; b=M+ifDtqLsvckDt6xKPWDHuEhBmfstkzgdlauCSWNNKidDKHJbxmZNgzgzGQOqh95yXriss93hDEQZe8iEbq8Tgp8b+w8t7nJmj/9A3P3h6I5iGGFwwjX2taL5RtR8MK6XAQHtfP5JKCfs4sBxIYm0sXYZiF/zoMWrzynDoqrGAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154477; c=relaxed/simple;
	bh=eDtGYGTH17764v29Lss/qoa/UMzlKT7EjxFZXo4HF3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3asH0eqrnSBQW4d/ViSMba+zwOBnfnGongTEQGbRW3gHAknkFlCTDCiXKIxX8xgmFj9go0KOB2k+7E5V4SQUi30Rf9+TKASTODMT5x9pNLyHnM1j7IEWIyU31xLcQvATJLO5Q/mcQiHP5fisC1kPc9Mqe8Ns91FiPDzSDkCKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAvnL9Kk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493B9C116D0;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766154477;
	bh=eDtGYGTH17764v29Lss/qoa/UMzlKT7EjxFZXo4HF3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NAvnL9KkbaGEKDTWlsu32uqsds/vMsqmoKLkv/XJeNJePN63Q698MRPG273vy508h
	 BM+7ay527lfzaTZyYMF3nY6a7IcFX7x1bua1wE9JRTXATLWYg5bNTdwLGPdyKPgmTq
	 B/9DL5oKhHOPwzcXfYOdHMz5EszLdcp8EOhERetcud9INoOlbPWYCGgqfyrGMcFe+K
	 WP85G0yn5qiOjj5FoFSA1SMshX2eEggg4geR1NuGvNGp9wXZcKJ6EA89NcyU8Mepbe
	 6cWn8vvsowYFNQ5/bcAx4U0p+UIhI81drwJxnOVFfZoqMai98AXZtLbSARGDTkIA0p
	 mv2EWy+s5PwgQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWbSW-0000000051X-1TMm;
	Fri, 19 Dec 2025 15:27:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 1/3] ASoC: codecs: pm4125: drop bogus container_of() error handling
Date: Fri, 19 Dec 2025 15:27:13 +0100
Message-ID: <20251219142715.19254-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219142715.19254-1-johan@kernel.org>
References: <20251219142715.19254-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_to_sdw_dev() helper uses container_of() to return the containing
soundwire device structure of its pointer argument and will never return
NULL.

Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
Cc: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/pm4125.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 43dcafff6c77..1f0a3f5389f1 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -1533,13 +1533,7 @@ static int pm4125_bind(struct device *dev)
 
 	pm4125->sdw_priv[AIF1_CAP] = dev_get_drvdata(pm4125->txdev);
 	pm4125->sdw_priv[AIF1_CAP]->pm4125 = pm4125;
-
 	pm4125->tx_sdw_dev = dev_to_sdw_dev(pm4125->txdev);
-	if (!pm4125->tx_sdw_dev) {
-		dev_err(dev, "could not get txslave with matching of dev\n");
-		ret = -EINVAL;
-		goto error_put_tx;
-	}
 
 	/*
 	 * As TX is the main CSR reg interface, which should not be suspended first.
-- 
2.51.2


