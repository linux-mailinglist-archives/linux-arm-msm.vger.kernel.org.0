Return-Path: <linux-arm-msm+bounces-17494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2968A5B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F20C1C20BAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3C21635AA;
	Mon, 15 Apr 2024 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LfHIP3YS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94171635C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209704; cv=none; b=Oxq1Gp4IW8bCBOfJlt3TbBcKY7rhtEPAMZd0dIksV5Z1LQfOLIg3DmDqBuyA53IDa6q9/H1FMxAySZYPfzFSZx2AVZ1ajQGpCNhHhLVxoZYB/h2pTx8ub35rHJAwd8Tab7JLgJy4Po97pLKTGcdjaLzQQ6/qRRa+yUnLe/pIXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209704; c=relaxed/simple;
	bh=VhbJFqc8QmLlbHWJnEENrvmuq+ozcGe5o6fFyH1YYQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+9azni65bE75OEEPdXMFeNANs6q9g5tXwHecbKFEbVoBD/lyxFYBbU+ezgvakwQ88B2ir3jNmH7lB9+IitiLjqPxremBMN2GJAsG7AwcmlkLJVDUO9t5kBtoG+BSHCA0r23pEZIQzo1XxAm4IHVTmss0Dn9//h5f2F2uNQP39k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LfHIP3YS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78d543db3a4so272591285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209700; x=1713814500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhmQYYxWMuudLBjdJjOGHKHYUzO1QQEhFUDY1X02X9Q=;
        b=LfHIP3YS/F+mTAzygDVHslx5fAuRJQnA2sSJ5ftryYm2qeaCsuA7qFlI+6p9qUxdkL
         GuJ9mP67JlIOKKIPlIcpEvUvKrahgJfXZ2/yGY/pppGNfmjI/IW5WlCChJSzsdgMAgwb
         oMUzsZcPcHH5obx5uHQ2Eq2tJlkHdq4Lai9No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209700; x=1713814500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhmQYYxWMuudLBjdJjOGHKHYUzO1QQEhFUDY1X02X9Q=;
        b=J9fXt/yu+d8rU24VmcSEfW6K0Ex4mmECR5C0sDU4F0ied0UMJU+KJUjT926hf5WBJY
         2tig7XE8swNTqG0/3njGW7FLNUgvUdEaLi5MjRn+y115xjMcXqFKbqViQKAZ/Lwa9+CL
         Wc7KS5f+ACbCPJFI2T4GXLx8N7Ydts7B579ElG4oOzQ+rdQ4KncwixbHjYqru1NqNa4a
         Pl0FZTbzOoj7KZvA+Jr+M5M0IRXxWsXc4yvsNKsUoVXyYyG8Qu0Kk0JNOjjZbb/HIC9p
         lpbFasFZI+kYqXC7Qh1CtTfNQkfwVeUXaYpRgW9lacvVmPjp2gC8MfmrHL4CO8Pw4KKI
         f0wg==
X-Forwarded-Encrypted: i=1; AJvYcCVboaxSOwJzytJKIMPdOI2YMS7FC90OKsIa+Cdi6vqBa0mHC90FoO5DRVuCKgtySVMUZEqV68RzVrTg4zt4vF+4Xe4FhhPUhQDPj7ZUyQ==
X-Gm-Message-State: AOJu0YzS8Pj0CRm4mE4kC2AU7A5Y5oxnWTZ/6Bx5k8EtV21hon94L2NJ
	ZabFpGgddZj4rG/xbda57ux8fR1J503qBipfhxw0U+gYxcYhdHS6O7FvNWG7lA==
X-Google-Smtp-Source: AGHT+IExc3kiGm+hEFRw+kQDfViul4woHzF6WRs96subTZ4c8qoJuWqvczLaOhJGq/Hyw06BNYyVfg==
X-Received: by 2002:a05:620a:3182:b0:78e:dcc4:339e with SMTP id bi2-20020a05620a318200b0078edcc4339emr7592795qkb.11.1713209700585;
        Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:46 +0000
Subject: [PATCH 29/35] media: i2c: rdacm20: Refator return path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-29-477afb23728b@chromium.org>
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

drivers/media/i2c/rdacm20.c:363:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/rdacm20.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index b4647bda8c21..b40d40b0cdd4 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -360,7 +360,10 @@ static int __ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)
 	dev_dbg(dev->dev, "%s(0x%04x, 0x%02x)\n", __func__, reg, val);
 
 	ret = i2c_master_send(dev->sensor, buf, 3);
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)

-- 
2.44.0.683.g7961c838ac-goog


