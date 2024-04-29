Return-Path: <linux-arm-msm+bounces-18827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E378B5CB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 17:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FCBB284889
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 15:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD319129A9E;
	Mon, 29 Apr 2024 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZaIJ/gNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C5128399
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403105; cv=none; b=E0dutInWo+VUv7LOFw0Ujopm/dtbeexorPvqwVetO9u6S2/k28fFL3wItqttSzOkTXSSM1oJAxI5EvyyVhKvyWtRe/cRz2ubJLLidETiHHz5LqP0o4M9ZKFT//3fgBKpBPNnae0F382E3N3xoCvjAPtjL3nmwS7COB06v/dOGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403105; c=relaxed/simple;
	bh=/GjVSD6SioMDjZElg1Hs94tKxcIDWbAsQoWFdXy84sY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ1iKaD+rWC/AgUrioGc/caLUfgpQK4k423cjsMBDYQlwU9TnnwNrl0uO/YiyZilWlvbuvI2iZVklYm2jpVYzMYvh5oyquAZ9+GjWsw4qwCr90N4xWzIJIQ5gHRLtxymzRw+LBrDoBHO1oxQSfxFa2ISNWBBb2Q+17bScsz5CSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZaIJ/gNO; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-790605809cbso420848885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403101; x=1715007901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=ZaIJ/gNOzKFqiF0n5UFOa/VFCoysPJi6lHKbehpjrCiDXmQKZINZehyS2m71yQHbZB
         5imLWJPyt1YHDT3/u4mXkr6mOcfJEcDXXu1YPDHcW6ZeUL8iJgnSNV+gxK64QomWeaC+
         F+ZEzQXxmND+qkNUjVwMYrIWHVnKrojt1/oFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403101; x=1715007901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=plvP6tqU3/Tnc5tIH7znT3jLXP1QfOVSiN6mWvQHlo0dlqlKAlLBZxA86MMU6vzs02
         F5TIuD+0cgt+ga8sAc4J+N+DfiqEfDRZhqg4eG9Z2FlyNMnxQSwm6/PVy2q5CaQy3+Y6
         RVBbB9p7OTTrpg04X7spae88E1gCNUYgVnZfDUdWX90trKGUqLqWYfQVcKHK2KK1Ho78
         QlyxYQHb8WUAQ0v3C1JF7ADB7g7MJ7SW8+4tRVyTx144XbprXyIB5xQ11OqjwTOkB6yB
         NVG3rKx0nyjbqIf3mmfGL6/Zwh4BJGtIXTRH7ey73vwTfFDrtDAtgNjR/WOVPysTowQT
         Td5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl+yonnad3YN+46cuEM27EPVnEdb8VlqFxM5VMyo1/LQ/AcBjj6LVpfYMXZxghFGfaGcWtjK8G6UTeTsLUHKYnlsT9+58bOqvGwYBVvA==
X-Gm-Message-State: AOJu0Yy1gOQSQCyaxvG/WoMWnjPRjv2CzEiRCz50k0O93F42byU/ye5K
	RwoOQ+gzrGHv5NX+HZ2zG1xhvvkVY0wnkj4AzaCAG2/B64FWgr+WOg651f15/w==
X-Google-Smtp-Source: AGHT+IHEbQ6k/spB/F4rjxeKOljXK5qMBOo6nR8m19hLRAfwF8PZ7AqOGD/HUUCFVnU+KrmkTId48g==
X-Received: by 2002:a05:620a:28c5:b0:790:ed33:5b91 with SMTP id l5-20020a05620a28c500b00790ed335b91mr5568169qkp.56.1714403100578;
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:56 +0000
Subject: [PATCH v3 17/26] media: flexcop-usb: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-17-3c4865f5a4b0@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 43dd3c932a85..90f1aea99dac 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.769.g3c40516874-goog


