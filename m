Return-Path: <linux-arm-msm+bounces-17498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A873E8A5B3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EAA31F21407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D469E161308;
	Mon, 15 Apr 2024 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AJo8qQjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE81635C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209710; cv=none; b=trxJPxFtmNHzuGkrTeG9EfVnN/wikFrORcIq81uJegCH00UU9Tzd62aIo48DJaAOhIsMHqxlhZqtgFFLYPZm6LseiuQDL1otzDlDpavCgyU6+uqoDE7Qmbq79m4JOJCRyoOFy72IiuDj8S1NFWvBP07LWfcYi4NXqJwhu64ptXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209710; c=relaxed/simple;
	bh=lxhOF+1XoX0GvbMqRieQPI9daN592yHX/FeyNVCIGVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lD/pC8sTVPZxnZYfIEJHOqzJxWRLPCfuJraI8zMZkNVAvqKdeYTJ6oRe1w0m7FDMmMimaWnl06aewshAN0U5j9e1G0IpQ5Oa4kKD7GYpz0epZDw8zE/P6w6L/OXYeD4+rCh8Sk6C19c4uz2ZLdUB4lFRhRF727RUfmFVd1uYTVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AJo8qQjj; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61ae4743d36so7757427b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209705; x=1713814505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
        b=AJo8qQjjfguUFvvacjBw5Si3hpvd/MAJ0Ykksf4vUYBVCYtWLgTD1xHtE3EQQUxsBi
         v4N6WkBGrjQaKZ+I/ZWCeBdflJGsxgC5ahcTZCrJdcmKPhTSmlaps+elHMTrZgd5Wvyl
         zsReaSaLxvkBuG/AxU3fQ2pG9w6FJZ2C0C7rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209705; x=1713814505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
        b=EYRodftF8FG1N7aSDaBmpLoLhN34cYbmtbV2mPlAfNZ+hpzq9feYwbzNzm69pqXrvQ
         ohclrTp8Opa7aqfeCr3qDBrdY6WeBxPCh8JIDJMjoQlDDiBP6xYEMci+LRFeQOfH1uUn
         3v3NYhUTDOnlje6R3clNMHjdKfr8Ws5suKpHbG9jfFcw50M55SHSv75RU4At9ISonUHK
         jbWr/T+H274h1a5YWetOJLIjLxH0VLuJgMUsSHENknZSW7LFk2SOKcJhkfWBrV3fYOBz
         Mk0r6kjTyKEniPzoaG/DB/IwWClZVqEIEtLBEBoZG2lpstILGMfh98gdrcUxaWUXN/Vj
         dWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkVhR7/U8Q8NVWEn1OdU3DqqqxR6c4rUhFLKYytD+9swAPkeRqeM7b4BAyAPxyAPP/Ll55dprRXfsYLDSmkGATXPUx1qnQo8tDWW1SIw==
X-Gm-Message-State: AOJu0Yy5cW4aTt/epzo3U225ptQ6K8rIb0qpY8a1mhIaOVxsugRwNr6r
	8tPFddsOWv8Dhku50wWQINZ3bou82lou16+dd/ERTGQPfUoBqMpd7wE9ut5uEA==
X-Google-Smtp-Source: AGHT+IFGGKloXi4LQc1kB9HoB/VhdVmfNZmSGv5YL+7VwXl3CHp5amZHgBcaP1BDvt5Qqswtqu1lLA==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id p1-20020a0dcd01000000b00618875e2bc1mr8807707ywd.21.1713209704967;
        Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:50 +0000
Subject: [PATCH 33/35] media: ttpci: Refator return path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-33-477afb23728b@chromium.org>
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/pci/ttpci/budget-core.c:280:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ttpci/budget-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index 25f44c3eebf3..2d85ae1ef50b 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -277,7 +277,10 @@ static int ttpci_budget_debiwrite_nolock(struct budget *budget, u32 config,
 	saa7146_write(saa, MC2, (2 << 16) | 2);
 
 	result = saa7146_wait_for_debi_done(saa, nobusyloop);
-	return result < 0 ? result : 0;
+
+	if (result < 0)
+		return result;
+	return 0;
 }
 
 int ttpci_budget_debiwrite(struct budget *budget, u32 config, int addr,

-- 
2.44.0.683.g7961c838ac-goog


