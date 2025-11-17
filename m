Return-Path: <linux-arm-msm+bounces-82033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D3C62631
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE0373B5B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EF3317715;
	Mon, 17 Nov 2025 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="XeLZBXZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F55B314D2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356645; cv=none; b=A4qOrvRU+7iWNnGjK8fY7TBSQ7H39y0dgauY35IS9Jcsk3Sbp6Erpc7LfGdsioUr+f+Lp4TocCVLATJFgMtyOkh1x4ZJ3N4sOoWBU8rxqtRhnu4ZpaeKqg5nvrnYdplv6qEMQabVfbKPjY0hOVzJ3t2Ni+Y1XOKWBYUy6CVhLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356645; c=relaxed/simple;
	bh=gINThNOrGLTjijqQqroDaSh2hFeE+34Wi4lNap0BlmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6yGwqqtYyE8vRoEUhE6kZKy8Jrc0UOrHEiOEzezcn0xwMDOJhAXhgAVOztESKhIqAB6ivKIFKGh51JmNJJLt9kDxpBAk8waLLrY+BwGnd9H05VW8+VZ1AW737TAO0MhM81ECVq7i8BmuWNX03atr96mYs/YWLvUnpjn5NsB2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=XeLZBXZN; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b29ff9d18cso410857085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356641; x=1763961441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxTOaSRWk1Y8Lv8b37kvOyS3gwv5qYDX15lhyQsDmUs=;
        b=XeLZBXZNU1UVIGzM7q1IjKiYQzMHrj8XQG4XSUCX7YBkg7IDvsRCJDX3FM58NwJml+
         9Atd2Kp3JXWQGuRCQV2SCo8rxiFqE0R7QKksE9zc6KatEq/tmsE/PDUjpP1zIKBwUDzf
         wY3eCe1hW5uM0XRtbCcVXQTV59dETiUlFtGWtAFcCguf4p5FrnYNRddOYdxjEqcd2sZk
         4qf9rEKKJHCjzRz/l7dMd4W927E4jfL2RhawRV7ynUZ2d+c2NjjIvH0Y9syS20QsuamF
         6rnTAwfI3ctQYlyfEC7C05z3JGzr/EMmGjplD0evcQek0vnpXv4WZw7j6ZoCxW8eVz1f
         tTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356641; x=1763961441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxTOaSRWk1Y8Lv8b37kvOyS3gwv5qYDX15lhyQsDmUs=;
        b=thp8aDBtnLPxsUewrwwuexuMN1H3nVjpZvu1YLVr/Y31l6pkg4Zv1YSTYGabIFVfsv
         AEbMqnPJ/LxdOOGf48WFdCzYWuG06MuQQ0y+AgRKJ4vS0mpU+FyiDAtuaBi7HqPT1Yg2
         5jU/TDPBgN0btYB9u3ynwf5wmoPrJfdTd/6WVBvzzp/gh6fm5hOQWTkR8wqw9R6gFawR
         kb+IHc6MKdxsQ9A/tMU4KBz92cDZbjnyFBMrn2RzlnLeCmlfALwHeCjwQ+pUrwZgjkoj
         HFIdhWa7Xf6eV1hnkzC/r+3SkoWvakpTA4nEOM4EjlQkk0X5Y0Rc8JSVvHAJpduOzc+W
         1HtA==
X-Gm-Message-State: AOJu0YyFR+N11j9yjWLZ+boSJ1bcOGptcGtq0AshfDrvHt1LcbpYS4OO
	HUtMP3fBY63hlsC+w8j9SM/310GG/sNskIx5AMToOBWBnYj9TR6Nk9+hFU8zNGrsQ6GNT8gyrId
	nvUx1
X-Gm-Gg: ASbGncsoHu2s5hPWhjuObDuyAJWU7d8kNXcK2VatjL1qeEqxJSLPoYajN2B54wNcVsB
	xQxmgd1PHWJ+o7nRWO1xIGrdq5czpYsKBju0GjujbnhXkX4qB+YCICIdvBqPLekRvxYRi11PIGr
	jR/Ry7p2JaMocBjLioCx7nPkCT+Vc0AqVAPyv/vhDugSkNCs0kxH969BwxuiW/bkET0me4k9e/X
	fSjqqk6H4VK5ja52ydtsMl3O0JN6bOsUoCV/V38dFns9P/Z3Va1JdKSn1GxZkW17/64+82mUsR1
	uNLgKFwzhNgstjxRRL/uR8f1BSilFz4zizQPoysYULohTCunlt8Y/J1YNnq7KqOkhYqCGcJc6mg
	JqFRj3Uhu9iLTAS6GVH/jHlOxRXMhfHJM4h+RyX2dTCwhMSb69NfGLW6X6ML3wMAUG8rvhvD/zd
	jQdB92atPBoUpDRTe+IPpxXWYhZYjeRKr1VVJUvCxqKgEr72D4EP9Zpf39E+8oKjLHZg==
X-Google-Smtp-Source: AGHT+IEHbZL8UncU8JrDK72OvvsWmuYibVs1BeBP7ngCOvXwZMa/qwBfe1aUda5Ed6xs2gFJfjtLTw==
X-Received: by 2002:a05:620a:25ce:b0:8b2:71bb:2b85 with SMTP id af79cd13be357-8b2c3144b35mr1316180785a.4.1763356641023;
        Sun, 16 Nov 2025 21:17:21 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:20 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 8/9] ASoC: codecs: lpass-wsa-macro: remove unused WSA_MACRO_RX_MIX enum
Date: Mon, 17 Nov 2025 00:15:20 -0500
Message-ID: <20251117051523.16462-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor cleanup.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f02153108c275..694ee3ceda986 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -297,8 +297,7 @@ enum {
 enum {
 	WSA_MACRO_RX0 = 0,
 	WSA_MACRO_RX1,
-	WSA_MACRO_RX_MIX,
-	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
+	WSA_MACRO_RX_MIX0,
 	WSA_MACRO_RX_MIX1,
 	WSA_MACRO_RX4,
 	WSA_MACRO_RX5,
-- 
2.51.0


