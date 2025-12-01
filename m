Return-Path: <linux-arm-msm+bounces-83938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C62C96633
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 10:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 46D8F34023A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EDF301025;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr6eHPh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D1E2FE063;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581680; cv=none; b=t8SiJIr3ns8IUdyq4FpoqrsswDrG/MYwxwpB198SSPIVdBKTcz+iR/uo3NwTN8ikEiETDmEYzqYuhCPmOGLMX5dKONY7pYiSUb05m4c3xvbBEwl0iXM/7C/7nkBXNB/9KHmkXDY2EZFOrnQo6eCbscCBG3rWvZ94qjwD6N6xnhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581680; c=relaxed/simple;
	bh=VIhyPXab8dDqL9Up88ILFvU9JOBm8uUfxAoUsAZP8fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yjuzm6PdCpV+LjssSovR1DmqVefXLOq/YDITFE19ZvGkS+CdlJgFGpLKPAkrF+qF/X8EOu8yJHNE/V+v/GfMAP0KyOX3PJ3AOE1/BuVodKqRzGxFuJQQ3Pzh52/F6VSdHgVHyget0jEBHjNWLPbfW11hGHjBzl+juAeFJTy5UNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sr6eHPh9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7927C116D0;
	Mon,  1 Dec 2025 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581679;
	bh=VIhyPXab8dDqL9Up88ILFvU9JOBm8uUfxAoUsAZP8fI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sr6eHPh9Lh3CIxmIdaZ3rKfRGG2G9HZPJ7/EdxqOO/A/B+Wawv1/2E8P17tvKNSci
	 luv/k/9txS3Kr/ET+ezhpOI7qOe4hmG/JdW5otDRTHThJD6QL3Fx8dPRfLHHpf+VTW
	 m9OczwNVnwsqp5b55hf4ZOWGOxol/+pKIE+Cjah+mVQigN/zQJj614uFve3Ut7Mlwb
	 NV6Q5GHqHVHe3gepw4CyuHcT04yNxvqiPCqGVmozaXsdfp5xqufooX3z6aAq1+oh18
	 jBHyPzMrzXGNKVY3D3O793g8ZUzWO11ngblN9tml1QKGhODcEGfgtvh4zfVkYh1jEp
	 g6Quvuj6myi8w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ0Iu-000000006NQ-2Uab;
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
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/3] ASoC: codecs: wcd938x: fix OF node leaks on probe failure
Date: Mon,  1 Dec 2025 10:34:18 +0100
Message-ID: <20251201093419.24474-3-johan@kernel.org>
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

Fixes: 8d78602aa87a ("ASoC: codecs: wcd938x: add basic driver")
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e1a4783b984c..8357f9f1ad72 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3465,7 +3465,6 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 		return -ENODEV;
 	}
 
-	of_node_get(wcd938x->rxnode);
 	component_match_add_release(dev, matchptr, component_release_of,
 				    component_compare_of, wcd938x->rxnode);
 
@@ -3474,7 +3473,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 		dev_err(dev, "%s: Tx-device node not defined\n", __func__);
 		return -ENODEV;
 	}
-	of_node_get(wcd938x->txnode);
+
 	component_match_add_release(dev, matchptr, component_release_of,
 				    component_compare_of, wcd938x->txnode);
 	return 0;
-- 
2.51.2


