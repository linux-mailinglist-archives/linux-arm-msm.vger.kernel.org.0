Return-Path: <linux-arm-msm+bounces-17921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5018AABF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 11:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1CB1B2200C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 09:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1C37F471;
	Fri, 19 Apr 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UXRHmwDi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4CE7F7CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520168; cv=none; b=Sh3NVd9eBdkCUvSYQWPxxT1MwRlt4JmQrORSvuGI6R18MSCD6NlCSM5jLVKmCULyYAtPEg93EutaG/bkoVPMUmYDq5kehZSgdX3bdAOhqCzhU7Au45/a0SuOX2Ek1pyTsCZhpeYA44IqGo1DDUdOFSERD9cuKYmlVr1ZRV8ANFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520168; c=relaxed/simple;
	bh=8VkIhJC4qRo1P5qjabF5E6wLqOZFDXI1jx3/GEL4npI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S++5+r705tgJBK2aYBv01IpkZEQlZeD937zrUCf1nVfseKUOvq879ddiqf1lGlKG+j1I3TgCrzBw28MczAusuPAG1fW9PEdVat/coWPMbymSSufBUe4LEwBG0cYx4VGNz4fXnseKTXIoUYJXgt/QRf9NxvO/dApAW/OTwEMmTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UXRHmwDi; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f05aec21cso124223085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520166; x=1714124966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6LFW19gEC+T0JWPpzdeGsrE8gqRTr2t8fOHXzLwHuc=;
        b=UXRHmwDiZgg4fnOed5vajwDM+aHJfhFByRO/x+hO/xOFotApiMrRqtor6H3d9jqYDU
         65ZB9+Z+b95gK7NLjhiDJOt5ATcvHJxFUA91gJNARKpglhCkgxj2u4c8KrTLu8e3H3uT
         3+UMJyhlriT96lByrdPSHqYOk9ikT2Nyi/QxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520166; x=1714124966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6LFW19gEC+T0JWPpzdeGsrE8gqRTr2t8fOHXzLwHuc=;
        b=ZzoVX993VplPKD0QZUGA8FXhim+cYWxXaw5Yh1UfYCRVijQqpBCCq5qhZZCoWwgX/D
         7REdQbDMIHcq3GG5fBC0aRjFhdpEKh9QZZFd3Kp68mNf95LMmqOzwhKATWnjKfYksZbY
         cQ9DYFPuI2lSGGpQqo6uBZHp/sFZaX+WKAdjyvGJj2NLdiSMdF3Hvkg9iLP0ISyJdcjt
         ZdeCwilrojh58ft8qAx1+TsAennuA2nEJVWip2h6KGRixy91zCtFd30Pe+QfcpaHbv7u
         xKUaTKf4cQiPFB+XFJ/J+o2K0g8AQFP6kSRnC6T2MwT9iHD2NUqWBEnm7S5SD5s2J0dt
         xrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaWUbBPBTDbh0+jx9o6m+0RaE1DiBiWQrhg53IOmdh/rlFB/yCoPdK43ED95JbKoM4Lh6402YOkKZz+NRAjUqY3Gu43nlhhtVx54PlgA==
X-Gm-Message-State: AOJu0YxlR/+/xja0259fEbtEmz4QnqRqVFR36dq7W1TUQNVrVw5tC0oY
	u3ad3o9OOwRhM4HY+1uwunm4fhX1jTO2G2t50qgbsSm7Us5ZsNiBM9xBvzN8dg==
X-Google-Smtp-Source: AGHT+IHUtLmGGbi8XMjkj1WeDSrpOuo1PYSYaSFswG+8Ppa9nSbCTEFJOTOGzt08rmRjKE1fcvdYDA==
X-Received: by 2002:a05:620a:4586:b0:78d:70c7:af with SMTP id bp6-20020a05620a458600b0078d70c700afmr2461486qkb.13.1713520166155;
        Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:51 +0000
Subject: [PATCH v2 05/26] media: go7007: Use min and max macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-5-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

It makes the code simpler and cocci happier:

drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/go7007/go7007-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
index 018019ba47d4..86ce593e0c54 100644
--- a/drivers/media/usb/go7007/go7007-fw.c
+++ b/drivers/media/usb/go7007/go7007-fw.c
@@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
 		0xbf99,		(u16)((-adjratio) >> 16),
 		0xbf92,		0,
 		0xbf93,		0,
-		0xbff4,		f1 > f2 ? f1 : f2,
-		0xbff5,		f1 < f2 ? f1 : f2,
+		0xbff4,		max(f1, f2),
+		0xbff5,		min(f1, f2),
 		0xbff6,		f1 < f2 ? ratio : ratio + 1,
 		0xbff7,		f1 > f2 ? ratio : ratio + 1,
 		0xbff8,		0,

-- 
2.44.0.769.g3c40516874-goog


