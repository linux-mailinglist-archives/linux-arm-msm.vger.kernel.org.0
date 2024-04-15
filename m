Return-Path: <linux-arm-msm+bounces-17483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB38A5B01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED2A1C20B13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1B715F41F;
	Mon, 15 Apr 2024 19:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bm+x/cvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F5715F30E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209693; cv=none; b=lTBKE1qjC3cR7Sbe5vfsJr8POu8zCRCXdXx/FxEZZehcIyxCBEXCjMA0qM1lkPA01UZXce9UlKLLF+4cYi2dy5QVgIizSjsxPra+rueLj48vRhN9Cz2t7pD7XjviFULfKp/EshUD95yqIT2t3ySyp0e21FC4I74XcakdpMrcWPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209693; c=relaxed/simple;
	bh=uneKQTx7g7YpgV1qfns0GCADDeBeNkX9SjOTc7QrTqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gmla+xL+qhNhZ7rjHWo/sTt4RTNhLwg87xqM/bhtK9sErHGWHrP2FhbK1zsKfgJ889+Cr765iUlcPCUOC9u9ouKwmKb/bWlUPiUf8PTLvQTQQ+pkzwlMC51w3MTO6pYzfqg9kZ/sDXG3VSL+CDtfMeBQtpvg302vHLdYHNctPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bm+x/cvY; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78d543db3a4so272580685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209690; x=1713814490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=;
        b=Bm+x/cvYDDS35S+SV5eBbryfuSZp1I06tJ0xORnrS0HU7AASYib40HiF0xymOtavtD
         mJsqVTdjeYfTb0YncAMLOHRE9APXiCNeZl60oECKbgCjFouzYNB4e39qb0ryFG2VZx1v
         MLMlscL8vIsHRblFexsICkstJd0UkJkp5Bj08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209690; x=1713814490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=;
        b=hcTVCMQlKFghcoAt90VgRvOlYjHWzinBKWFYNjWkCFjSjH8s/mns7q8hQdLJ4BAiS5
         XK5zyPcMcPaTghVmAll0j1WEFT6zoQcgsb4I7Vy1Poy5RBHbeAPLwE1x6yeszK7ESAhn
         NEyZu0lVDvdD2s0N2uN8murTy2oLjWNihi9XV8LGgdqnDHhwctoDcuAGOVTBeBIEH0ty
         A+UjyS4HA/67qxIwKz9su35dsWaheucWy6+NohOdABtOdJkUineJgIUY/JvD7xvqoVEH
         9edrvkBWA/UKMRX2YEGPocgGbgJ3mjJY3yZCuOl3Kkhdw53CZ29dA/uUfOa4HyzliwUf
         Ccdg==
X-Forwarded-Encrypted: i=1; AJvYcCWQPdXQYg6T+iNyr22YsWvOEnTAVKhKLYPjDVO6Ue2ILPAJ3VApAvjv4lA9VtxHWbkjQbe9I86CKVA6r0y6/O8CX+ACGKREsV9k+DRzMw==
X-Gm-Message-State: AOJu0YzG1w0Ew80tATwR7JkZPWzwQPq6kErQfm0P7BNA6kcIxjV+WDh+
	VS+o+XkEgZEKRu4FPEj5ZAn9qBgxG9JVBmNseY76HdhIUK5H8M6RO67GJpqQnw==
X-Google-Smtp-Source: AGHT+IEuVGO99fF8WY6cFUn2TeptksBJEwdpaYOr7CSPDLRmva6Ltt+et0Zcs6jy4zj82KXO8YnR2A==
X-Received: by 2002:a05:620a:4486:b0:78d:65e0:3100 with SMTP id x6-20020a05620a448600b0078d65e03100mr15166755qkp.60.1713209690125;
        Mon, 15 Apr 2024 12:34:50 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:36 +0000
Subject: [PATCH 19/35] media: stk1160: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Simplifies the code.

Found by cocci:
drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 366f0e4a5dc0..0ba0f41fe3f4 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -130,10 +130,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	dst += linesdone * bytesperline * 2 + lineoff;
 
 	/* Copy the remaining of current line */
-	if (remain < (bytesperline - lineoff))
-		lencopy = remain;
-	else
-		lencopy = bytesperline - lineoff;
+	lencopy = min(remain, bytesperline - lineoff);
 
 	/*
 	 * Check if we have enough space left in the buffer.
@@ -173,10 +170,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		src += lencopy;
 
 		/* Copy one line at a time */
-		if (remain < bytesperline)
-			lencopy = remain;
-		else
-			lencopy = bytesperline;
+		lencopy = min(remain, bytesperline);
 
 		/*
 		 * Check if we have enough space left in the buffer.

-- 
2.44.0.683.g7961c838ac-goog


