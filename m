Return-Path: <linux-arm-msm+bounces-17479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B6A8A5AF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B1E1C20F4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16E915E5AF;
	Mon, 15 Apr 2024 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gtAXBN29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206BF15E1F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209687; cv=none; b=Zopms/H3tRD6Q2wAUKPjs9YDbmuvZjtFoFqJtkZdQ2Z5MT/uXmlav3Z9e5YU5Asf1ANO1boXHfQdzsIAyaHdzs5hg3j6ZybHv/bm3pQI1be2WoSb4ntlOyE5MigkePpW1kqjTTxDJIOoW7aLu1MWk1xpyMgOyTCdgbphftQ+frc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209687; c=relaxed/simple;
	bh=MUqVtQZnq5YrPZr6pNTFJQr9fKe11JNLTSYR8M7S0M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UijsZvzFNLH/cYuM7Z4g2YIcPYsWSgNc0uU7nnxeOOJgBjn+L7X9f6YhRiJCzYrErwsei9FtBR6w/PguehMblqsUNggi4QDytpZub3A6V+GdbQTaPwQctsh8+DLAypbV9pFMzLf2LafgP3olT/wUbPiNGR+43RpxrLLC3CfumJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gtAXBN29; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6eb55324879so685990a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209685; x=1713814485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DQ62C5vkEz8a1t/8x1ghE+E9JYa6TkiF3DSBiMd/dY=;
        b=gtAXBN299AOxQv4Ao9JEm1WX/KzKvP0EdCg041KDQu4xJxItcdHCWtt4XPPhaSR0iq
         wNe8Xzz12jv01p/IiJxzzmbECfk2rPK1Ds+QEotxLbT0rPe6OXxb2b9aN6zokvxG4dtP
         NEwAiBraf9xeCFASUHI6VjTxM9k1z8OHceBqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209685; x=1713814485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DQ62C5vkEz8a1t/8x1ghE+E9JYa6TkiF3DSBiMd/dY=;
        b=lEJoINc5DTnTUWQcrQm7kWjUvT5MovdjEbmjs1RCHbQcfsZse3CB6telB2i1pGX73l
         m8jBJmdaixbjhVzvcP3djJabjH1l4A5pM7xTu99P033jLB20zVbypqv4BbW5tLH6eY4m
         SkBdo+2t55aOx6C6jPh1WNBjHEBMgt/z/X1BI9v1NHgSOV6XFGYHKicAU5VJDxkz+iLr
         14RPaG1LZV0bL7V/T3oQVwFrPrBy/XVFo7AbCxK3FIQ7RBfvPCyFXnhUNwAnyhZYtZIp
         8X+rNzNICHJGiF6QONaxEB/lEY7krWcwAgBtmeLu0LrRe1v9wc/NKeDvV4KYKrw7QRC1
         NNOA==
X-Forwarded-Encrypted: i=1; AJvYcCU2q3+0F22GYxIP5/VrXPcLNKXk8UXOFGAnf92Pb0S34OJJCt0sBvxkddi+SpuJy30/7esZZdNIBOTxmroXl7Dvhvq5su95R0YkzmG2xA==
X-Gm-Message-State: AOJu0YyxA4PBHV4vD69QtVmtFN2UEQUC3UzJgBrkY03PuhbHZaSuRfbs
	4hhVeo/PU3VjVkaQBdvallCWxKR3Zrtei9aQv0ScF2q30/ETdA33B1N9jAPOLw==
X-Google-Smtp-Source: AGHT+IEAF9806y97qmHJ2SnDYiOLkOnVwPWcqFC1NWaJsEOh0gdLwpHuhOdGRcF5Wy59Aixlf/05/w==
X-Received: by 2002:a05:6830:100f:b0:6ea:ab3:5c1e with SMTP id a15-20020a056830100f00b006ea0ab35c1emr12447905otp.29.1713209685165;
        Mon, 15 Apr 2024 12:34:45 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:32 +0000
Subject: [PATCH 15/35] media: netup_unidvb: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-15-477afb23728b@chromium.org>
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
2.44.0.683.g7961c838ac-goog


