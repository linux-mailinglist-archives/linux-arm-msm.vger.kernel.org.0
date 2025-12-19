Return-Path: <linux-arm-msm+bounces-85901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6293ACD03F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB30300DC96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7192727E0;
	Fri, 19 Dec 2025 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0Rm5C40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB046246BD5;
	Fri, 19 Dec 2025 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154266; cv=none; b=n3tO/ZgwwMqbqfYo6Hw6g2zYNgT8aId1ixN+mQvEsFIYlA7HlvgwV6usV7HWLstWMzbCWn+LeX1/4K9c0Qd6eDiQyUpZk6JQ2d+cjgh2ZfpWv5FLRKtWdttfxNe5HYT6KlEh8HtCuE7TDiVU9pkixseahw8q67AT7J/rPGW0wfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154266; c=relaxed/simple;
	bh=FK6J5Y6NhuZq3oBB3Vfh2GPqKVSjbMb/FlvZjJU/avU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOaYr8WPX0Ark4OQ9XvslcBLWv1zhJQXwImDfzrRIBYD2m2KIMpBDpiQIjnkCB+I746lhCck81VmN3RYVaEEWIVDxhk6NdBa5wxfHwISnFBZQrX6DAljhE6zqKsc6EMTQcpaAXykjfnZaecUjCEk2qpVhiI0bJVESJ22WeUniYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0Rm5C40; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82F0C4CEF1;
	Fri, 19 Dec 2025 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766154265;
	bh=FK6J5Y6NhuZq3oBB3Vfh2GPqKVSjbMb/FlvZjJU/avU=;
	h=From:To:Cc:Subject:Date:From;
	b=L0Rm5C40E4eXMmiSLIibK02jBPnfIlHHbmhqJmVZwA9TbGOSmjTzOXHeqh37aUWxr
	 ZH3negNOsMSKPhEc/x7Zuu7nwiE9kV7jHKtXXYXjXJf3qRi4PVSZjqEBB+GKb+tF4G
	 ChAFWPqIkfg7lTyJKLnjrfhtyVHNfHlkKZGj19ZINnPvjyMf6UI6SFnYVdrwIpIape
	 sal4czAsDzXhY16YOIUglYC9cfOIRwsr92Ap3Mlh2amnpqP0mxLei3zUrOeejMSs4U
	 HDkGl4gdBHyoQU6abWNCvMYqVuTOIB7dbCcP+jYJlfcuRoeHW/UhAYR79gEu/Qghx3
	 PRudBsDFG/f8Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWbP6-000000004xS-0IPd;
	Fri, 19 Dec 2025 15:24:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: pm4125: clean up bind() device reference handling
Date: Fri, 19 Dec 2025 15:24:12 +0100
Message-ID: <20251219142412.19043-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change fixed a couple of device leaks on component bind failure
and on unbind but did so in a confusing way by adding misleading
initialisations at bind() and bogus NULL checks at unbind().

Cc: Ma Ke <make24@iscas.ac.cn>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/pm4125.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 8bc3b9994019..43dcafff6c77 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -1505,10 +1505,6 @@ static int pm4125_bind(struct device *dev)
 	struct device_link *devlink;
 	int ret;
 
-	/* Initialize device pointers to NULL for safe cleanup */
-	pm4125->rxdev = NULL;
-	pm4125->txdev = NULL;
-
 	/* Give the soundwire subdevices some more time to settle */
 	usleep_range(15000, 15010);
 
@@ -1624,11 +1620,8 @@ static void pm4125_unbind(struct device *dev)
 	device_link_remove(dev, pm4125->rxdev);
 	device_link_remove(pm4125->rxdev, pm4125->txdev);
 
-	/* Release device references acquired in bind */
-	if (pm4125->txdev)
-		put_device(pm4125->txdev);
-	if (pm4125->rxdev)
-		put_device(pm4125->rxdev);
+	put_device(pm4125->txdev);
+	put_device(pm4125->rxdev);
 
 	component_unbind_all(dev, pm4125);
 }
-- 
2.51.2


