Return-Path: <linux-arm-msm+bounces-18825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7948B5CA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 17:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26ADB28146C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 15:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406CC1292CF;
	Mon, 29 Apr 2024 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXukkAfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81101127E17
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403103; cv=none; b=gHD8bMjKbAF11PWW+YcO8l9EnoMj+7wUtvvcSLIlZzSEhPoayOOM1YdEY9nDIn6lKEEXaF4epq9kCDb4w8cbvfGYEwa2zqakRbQVubTWlimGo/WEGZJxy3fpKLnZClsT3387Z8xfP6J24e2dMD56otT6EPClz2F5OWHKpj/gw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403103; c=relaxed/simple;
	bh=HnkZzu3hOGP6WP/z/J628OEomq/9kbGj6cjO+bxIfdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGHFeF5JTrVjCePfNmtrmVBI6SSMClJaH7DpKOMpYMqcZMfpD4XFnrhr2aHRZdaQe1T7cCS3w8Ug5IozktWd+Q9ToHCFUcBUpzLNXS0OFT0/UV8o8fe+5Or0Vee8ObRmengQavxRDSndas2R85jz5UvIvMe9Fp9kCtUEZIXbDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lXukkAfz; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78f04924a96so385483285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403099; x=1715007899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=lXukkAfziG1WhBen2kYadAkV8g+azOcxaGabqcT7pdCwccZDcTPK3u+hoJInK57RB4
         QPZLOr3f6DQEkqRGdtl/Tnfi9haih8b/MhpQmyXyg/GIQDWydqdUB3NJdmJXRX8rP080
         RRt6Qeo6Olwuz3Xhhd4J7v2ArakNyxpM0gDz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403099; x=1715007899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=JtTRs/wXPJuFLgTMPFyoM+yrrxIzwgO0NvjcdJ4ufytJVUuPlBszYwwt8MdwYl/dql
         /FCzjhkdVe9eZr1lAZwChMflY8f+J+PC5BKwEqfsY7mreTF8SND8uG+kWoUDgFkKXPma
         W3uSOZ+3zcdiDqA8omT3fBV6SLmHjJR1tSbN9CzXNjTC/5SwW9x7eJl2d52VjkAxFAmg
         mkaQrcgqXHj4YdxzRIGhRkFS6fE2EufNtvw2uR/VmL8cOTPBi5pHVECZ3dx1nerfANtJ
         LWPXAie7MUebHvl0ovDei1icK/MVvb7DgJ+dFpnD8uvyuJLu7rZM6H0my2W/i1InCs9k
         2mNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXalhnfSODt7MAI4S1vnGgLsS+99zRFRdaECs7aU6z6S6PHVKWuT8Yo42Mhke4vttg+BNF4UpNKJc4QbnUp08iwoVo1OgG6Xv+VWKFzow==
X-Gm-Message-State: AOJu0Yx68mg5S34Cct7yV+P8kUm3PAlx/EARgbQYOU6pNEFv7OLqukqv
	pg20pUbJ9PTid1gP3AVoTbML9WYIMfNi2dYaf+rSt12GDjlVSKmOA6WO9J1JRw==
X-Google-Smtp-Source: AGHT+IFJT4Q2Syc1PBrJKVClvA35sFEGet4fgiHKy6TprlGgcTs6U4UnMxlpWR+ax38rGRoBMytLog==
X-Received: by 2002:a05:620a:410c:b0:790:ef3e:24fc with SMTP id j12-20020a05620a410c00b00790ef3e24fcmr5535437qko.16.1714403098672;
        Mon, 29 Apr 2024 08:04:58 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:54 +0000
Subject: [PATCH v3 15/26] media: netup_unidvb: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-15-3c4865f5a4b0@chromium.org>
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

Simplify the code.

Found by cocci:
drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c:138:26-27: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
index 46676f2c89c7..1c885d620b75 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
@@ -135,7 +135,7 @@ static void netup_i2c_fifo_tx(struct netup_i2c *i2c)
 		(readw(&i2c->regs->tx_fifo.stat_ctrl) & 0x3f);
 	u32 msg_length = i2c->msg->len - i2c->xmit_size;
 
-	msg_length = (msg_length < fifo_space ? msg_length : fifo_space);
+	msg_length = min(msg_length, fifo_space);
 	while (msg_length--) {
 		data = i2c->msg->buf[i2c->xmit_size++];
 		writeb(data, &i2c->regs->tx_fifo.data8);

-- 
2.44.0.769.g3c40516874-goog


