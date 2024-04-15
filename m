Return-Path: <linux-arm-msm+bounces-17496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E2F8A5B34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56C62B24B01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53854168B1D;
	Mon, 15 Apr 2024 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="izsYgQ3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF27E165FA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209707; cv=none; b=bbLctwJTARBXlk/zJtHvUnCZnrp2EEk3gt4Ppcbd6YpXskj9Bssi4MuJ9wFwKf29iGQJKsR2xhATfnWHA6o5jZu23dx3Y475o2+0+JtDibjqXbdTNqlWlJjFd9R1fxUyHs5k3sHftVQdQlc7+49wWApsVx5d39kiXl7kYdXCX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209707; c=relaxed/simple;
	bh=qwJnKU3Adz8cA71PPhU/Bxyy2mqr5yPU03Dfu92Wqso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qt/68CXnesBRdSqKyL7Sw4J9sDkVgnRtJdh22WsCBUz5RegaNMwMFlxFsYQjapZX6M0OPSQ9NzpqugXZZuwb6aIZgh3y+gCJKUGyYaolIxYEEfOSSDU6JHZOYKQ9YgC9aTaM4dTS+i5XL4UK7SUjiMjfEDG368XgErMCqGJKsSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=izsYgQ3C; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ea26393116so2998829a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209702; x=1713814502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
        b=izsYgQ3CFljk3LL8vR/moStVqPeTNK3vXgul6siNJHAZlZ+rXZt/pWby8RR93x25UA
         Us0H0crIu2ZmJ9COJR12a6L+1bvwLMj8shIm6f7cx8iTP+p6XzeXjobfYBLJ5Hh3NEZy
         V2pIqr8Bm6I7642EH7W9GlUUctvow0XE8Yn/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209702; x=1713814502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HU2Q8r5u9tJlP6QMXdfGI/fLu0DCpsTU5mW0ctKluKw=;
        b=aBGiw6Xr1FiAM0aWyGEwqVosNtDECfpYuaE2t5opH0rWA97u8hRwm83bqDtPJ+b59k
         d2gsJHKz7QETloz/LYKI2NO4NZtdEdGWCoG+FAX1KLe68l6mhXyQJGFBZ96luGn8jBbi
         tGWR2STSwtL6mE1uLnmQg5XDOF+urKjrqJkIgkbBI3lEh7bFkNM7OqK8haTY7PvR0fhJ
         ElOMoeduQwa2FmvSW75qKCFXSmmbA9OXxqjDYmy8Qa7j8iAT18wph4D55k2ZfdZCX5ZL
         9oM5Cl6dKMhdy+R1oXkvg5Fi/BbE4zULXSn/Eo2ZTyCS8mnY/vTB1QJglLl6jCXmY4l0
         tdFA==
X-Forwarded-Encrypted: i=1; AJvYcCVhQn8UJ42iioiByGpWVP4N7P1ayYIXLbLZKB6+5LhrR1TJekcK6hLKB1040LfMazwo+QUDFAbh+wbLPTMo69udfy6ur/H62jyYOKQb6Q==
X-Gm-Message-State: AOJu0Yy1U7NgosACyM1VW5BZM6Li8Unlbn39IKiQiZXSTyj3DfXBGe9Z
	FXBgnC5I7+9yZ9/np2q1xEV36V6UW7xAsepmD0KpfKJzuMlKmixogd8OIyp+XQ==
X-Google-Smtp-Source: AGHT+IFpNLbWkYy4T2kNtWWO3Krrkln4WZhxhxOvSx17rkc4ihK9bZ3DdjfUrMbHC9Tqsq3KJ+SA1g==
X-Received: by 2002:a9d:6a15:0:b0:6eb:7c52:ed04 with SMTP id g21-20020a9d6a15000000b006eb7c52ed04mr5573331otn.5.1713209702690;
        Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:48 +0000
Subject: [PATCH 31/35] media: cx231xx: Refator return path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-31-477afb23728b@chromium.org>
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

drivers/media/usb/cx231xx/cx231xx-i2c.c:353:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:262:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:326:15-16: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-i2c.c:176:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index c6659253c6fb..28de72856c90 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -173,7 +173,9 @@ static int cx231xx_i2c_send_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -259,7 +261,9 @@ static int cx231xx_i2c_recv_bytes(struct i2c_adapter *i2c_adap,
 		status = dev->cx231xx_send_usb_command(bus, &req_data);
 	}
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -323,7 +327,9 @@ static int cx231xx_i2c_recv_bytes_with_saddr(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*
@@ -350,7 +356,9 @@ static int cx231xx_i2c_check_for_device(struct i2c_adapter *i2c_adap,
 	/* usb send command */
 	status = dev->cx231xx_send_usb_command(bus, &req_data);
 
-	return status < 0 ? status : 0;
+	if (status < 0)
+		return status;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog


