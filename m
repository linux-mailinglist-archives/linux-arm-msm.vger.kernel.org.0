Return-Path: <linux-arm-msm+bounces-32946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C698DE9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 17:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34FEE282DF0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 15:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2885E1D097D;
	Wed,  2 Oct 2024 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1XuMtHo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34B1D07BF;
	Wed,  2 Oct 2024 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882083; cv=none; b=X2zuDnFatncqyZgR+Oy3eesiQMDzR1w8zgfiat86RgB2tJUaSzx79T3RBC0KaqDxfsY5xsodsss4qxkpOsgO2R/wEbozFMqiHNOyyavkBc6I1RkqEtVO657lX6FUR09UV0biJu9URJcHZ7qnHWGg08J2ZS96NJ5yLWI6UMr6rHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882083; c=relaxed/simple;
	bh=2UMd8GmskoKqy4N/TkOwVnnjCGhVBuWUY7EHrHnC5UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3MQi8rEf2ssZvvJFnm/VtW19ZTbLXB06yE8oNvAJeh+oX5HDNWN4IVn9l+nt+OM6RZ64v/yScrp7ovRXSwDD0OB9l5qbYBLp6rv3a7R2TkXHZFv99iZZ4lleBCPQ517lHrLCud+lsTgFDG+GZeEl9tm3SWXQxz837uvCgYpPYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1XuMtHo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30BEC4CEC2;
	Wed,  2 Oct 2024 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727882082;
	bh=2UMd8GmskoKqy4N/TkOwVnnjCGhVBuWUY7EHrHnC5UM=;
	h=From:To:Cc:Subject:Date:From;
	b=J1XuMtHoVpDXWG+dyY0I5crIMd79WXCziK1/hmmg4BJWOpM4fJYDVIUDL/Y5ZaZxn
	 3c3s3KqyYm5eKwaMIApqllmhUjJR8t5r9pQxIiaiWN9aeZyaZCIKjYf73PokmtaQqj
	 GGp0Yqg36aPVKfbZOI5WSL4/6pJQMg4WRrUzwbGmGiW5zmVl2q6VvZFyW3zNejY3Yc
	 QdIcCvRwYLVqt8o+SF5/veOUD1xAL20IgGytq3g1zJAsPbrQaNFZHfZ0CBMCGFyHpl
	 19CzOgyM7R/H/YTKaHzQlJ0n8ui92GjSSNerqRpkFlr5watB9KgF1XprF7+x04YfzC
	 8dsHdG5b4mJ0Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] ASoC: codecs: wcd9335: remove unnecessary MODULE_ALIAS()
Date: Thu,  3 Oct 2024 00:14:34 +0900
Message-ID: <20241002151436.43684-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit b4b818305578 ("slimbus: generate MODULE_ALIAS() from
MODULE_DEVICE_TABLE()"), modpost automatically generates MODULE_ALIAS()
from MODULE_DEVICE_TABLE(slim, ).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 sound/soc/codecs/wcd9335.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 373a31ddccb2..a2521e16c099 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5177,4 +5177,3 @@ static struct slim_driver wcd9335_slim_driver = {
 module_slim_driver(wcd9335_slim_driver);
 MODULE_DESCRIPTION("WCD9335 slim driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("slim:217:1a0:*");
-- 
2.43.0


