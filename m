Return-Path: <linux-arm-msm+bounces-17482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE378A5B00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51E42B237C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F113B15F415;
	Mon, 15 Apr 2024 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VlK4eAu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31E15ECD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209692; cv=none; b=dDSPeG8dmq/BjcAiQ4+zdI3a9lNOfFvX1k6/3a4bP4dUV3YP4gTKJLa46ZT25D1cEmJuY3hl9n8h8t/zUbfmCOszzhE3HpwZUUBShBtAOt7XY8pgUnbteE3xMmGEI5V8MUPNSY0SKhPytpW4IlFRBMWUlXM8ioS12Z5Luy1PFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209692; c=relaxed/simple;
	bh=5czmFQc+cySSmdxDIBdAfSO4i/5SM7lXKFqgjNNlUHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CV2EPyFtRF7erPjoog+brM7NsETH2Sk/zgkZ1vGOQVmXQ9PbFY+6rm8AR0HAsdPHE463bR0uOjpXa9+1qj6Ih95x5Ape5T3xeMzhUy8ryvQav+QOr9q4RJXFn2ot/WWBwfNEduowbiclN1TjURIfV/hTf6oK4xtO3mJXFQX/qa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VlK4eAu1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78d555254b7so293845585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209689; x=1713814489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ysx9uvN3ilBy5tFwit8pBZpHwFo890jKkO1ecScbT94=;
        b=VlK4eAu1xaAleMT9II1HWWvXSgPJzwK+IEdWiFxUSYyZ944gN+oW4nNkSIeCH9jGaK
         xYMfTNibu9o2aQBGrHSCEQEbkc9EOSaGPI0/fReGB5q2Om0bIN+Ij2R4TIhvmacCYU82
         7ZgugIkr1CbM7m1XA+0al7/zv1TEwQakBIJQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209689; x=1713814489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ysx9uvN3ilBy5tFwit8pBZpHwFo890jKkO1ecScbT94=;
        b=tiLLnFMC3xrMXheuBz3fF1F7UD/RaYa0cN4imVN+r/asffc1goOMAewlTSIpnzQlts
         V05fs2SikknulqxaxvM2n8EewQdxH72f7cRS28gX/fhxeaP8VJaQEQyjEggSKR+yA7wM
         exZjOX3F6VV+qW8A5e1GgO5foYR5ekp+iAZZFAQkViJQOrvDXSPit+aft135340VEw/j
         Kzpmpk7mgyW/HIqaoPTq96E1N5Y7JySvzbe8kwKgFxj884EKSCOjp9UJrF7JkVJB2XGB
         yTXdDGU3XHlF/BJSyPn9eXROmcqZvWyZ/l2avzq3tdTgoLFaBhf1SLAE0oNgrb/uMVy3
         om0w==
X-Forwarded-Encrypted: i=1; AJvYcCWV9oJvKVYhfZHM4vgzVKcN96vkJDw7762WDI2vg5BdTtVIoEcidiUXv4B9U0ScWPyz120gGy7ONRHCg4LlBcloWsj0+5pZ9ahuhqnu6g==
X-Gm-Message-State: AOJu0YxZ7Z7xD5tvxXb7j0X3BFxp7Ai89aMm2JRCi1qVAHZW8igk6uKu
	d/qQAEUXTy/4KtlQSMTi6LRzSe2pJlLeaOWmUhmRdiGgG55czFElrn2PJFxMtA==
X-Google-Smtp-Source: AGHT+IHQyP/6IMh0FCNlSBAUIYfTzsci3IX6XU70Oi2xtR2oFiLVlI4GVoQeVlX1sWvOJp1rCpFZ7g==
X-Received: by 2002:a37:c244:0:b0:78e:f0d6:3ac0 with SMTP id j4-20020a37c244000000b0078ef0d63ac0mr1060376qkm.31.1713209688866;
        Mon, 15 Apr 2024 12:34:48 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:35 +0000
Subject: [PATCH 18/35] media: gspca: cpia1: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-18-477afb23728b@chromium.org>
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
drivers/media/usb/gspca/cpia1.c:607:30-31: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/gspca/cpia1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 5f5fa851ca64..14aaf36cde6e 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -604,10 +604,8 @@ static int find_over_exposure(int brightness)
 	MaxAllowableOverExposure = FLICKER_MAX_EXPOSURE - brightness -
 				   FLICKER_BRIGHTNESS_CONSTANT;
 
-	if (MaxAllowableOverExposure < FLICKER_ALLOWABLE_OVER_EXPOSURE)
-		OverExposure = MaxAllowableOverExposure;
-	else
-		OverExposure = FLICKER_ALLOWABLE_OVER_EXPOSURE;
+	OverExposure = min(MaxAllowableOverExposure,
+			   FLICKER_ALLOWABLE_OVER_EXPOSURE);
 
 	return OverExposure;
 }

-- 
2.44.0.683.g7961c838ac-goog


