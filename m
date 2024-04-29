Return-Path: <linux-arm-msm+bounces-18832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0B8B5CC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 17:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 239432817E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 15:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8F01292F3;
	Mon, 29 Apr 2024 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NnBwWPhn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5F712880A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403114; cv=none; b=dtBi27bZGqjaVmXVMuu1Y07MHaGHlnoB1TCNtg3Su7MMaSSsUC7QrPf8oMIr/btMTP+le3T+ozeAC8vw4qmtcow3zCBzLMKI8kRxB5USKxSN4KXzHqQd1B7YhTc6G51OuTLB0csJYOaM7Ci3ffRX8q5UUmVcR0J1Me1nB/MIGm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403114; c=relaxed/simple;
	bh=A2Ua3QkuJFffFg1BMdgqwGEYAvUbwmxlzRDyBr/ON+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUuMbDfMLKAa47JpkDi358kUvGF8CRp2rV4xhH+JhVbog+gxMvMl+QFUNUqLHM2CnVEXqK3RPEbZAdatArRLFch1yCQyDJsryBiB4AAQQ+/6Gvw/R6I7kALYcJd1LecK3Fzy1BN1Sx/cTSf2p9f01Tfze7ToX6KMp32F1aqcp3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NnBwWPhn; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78f02c96c52so339122185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403106; x=1715007906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=NnBwWPhnDPlXn/K1WZixKEy0quXxOUtNmvo6ldziFdsnve3fpTeshXWBDx4Z1FM7fh
         ebMk9p6iZYfiY8oW8nawpshyR4wv7l6PAnXJq6x9fNOylg+3oxu+MMddTGjw3AG3hiqd
         yhcIrxAT1IqVLvrOaSlwKbu5DO8k9+n1ZJEYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403106; x=1715007906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=wSFbG4CNVv3t61rpVwQz4eLRn/i7Qa4H8NByvqhjykKZOqE5LmhjOCNFUMZq30E1Um
         skrtwPfFcZLGR17PYbRT0E8Q0Mafvv4Q7GUfc1HVUB6NE8swFxXBqxTLasNabUy3+blR
         4/ogzWzsyhhO5hEYYe1udYB5uTUtVk5CPmVgIQYV8xOix8wHIPlbGeeETsFJxwE24mg8
         JZl+lk5/vPy7qZS5KX44YAq42hjW4OPnYaDFXcdbA1js4WEjKzIWG+kuDI1LWcQWhEf1
         jcJoZzxOU9KkFwVw9TVa6FrRhKnmXASVH9HwoKEVvrlvf95KpAIkHqLoMltq4K4R4/bA
         CpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4OE+JhkqSZfhyNHfBfA7JAMtldGtZRcvJi9btR1SIsaZvnStT5o/UF6iSekahN3PQuvIXuAmt4N/6khm9Ml2KWCM1giIEefoODD74Lg==
X-Gm-Message-State: AOJu0YxHGy7UP9b670trxKN4yO6UIHt4rUCAxeSl9EFZ2bX+qZ+oSuoa
	sp9Q5sieT7BEjCzv+Q6q16WcrKaVNiiAEwkcBfSVipRnhRySWSaBewLqM6j9Yg==
X-Google-Smtp-Source: AGHT+IE1jrRBd5HK/tPuhHP5Hku+rmhJzqzd24VfyQoPlWIHBef+7Xc9RHcUZ/XfTRZVrVfoGNJ+0A==
X-Received: by 2002:a05:620a:57d6:b0:790:b2a3:f86c with SMTP id wl22-20020a05620a57d600b00790b2a3f86cmr8844059qkn.34.1714403106175;
        Mon, 29 Apr 2024 08:05:06 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:01 +0000
Subject: [PATCH v3 22/26] media: tc358746: Use the correct div_ function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-22-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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

fin does not fit in 32 bits in some arches.

Found by cocci:
drivers/media/i2c/tc358746.c:847:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index d676adc4401b..edf79107adc5 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -844,8 +844,7 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 			continue;
 
 		tmp = fout * postdiv;
-		do_div(tmp, fin);
-		mul = tmp;
+		mul = div64_ul(tmp, fin);
 		if (mul > 511)
 			continue;
 

-- 
2.44.0.769.g3c40516874-goog


