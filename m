Return-Path: <linux-arm-msm+bounces-17922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CE8AABF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 11:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 932941C210F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 09:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285ED7BB07;
	Fri, 19 Apr 2024 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JRKywdq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395DF7FBC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520170; cv=none; b=LLQkLsV2t9b55NFrBGgCT15SAsbTJRm+MsvjZnSG415z81yK+Skw4/pimlCSlC8KTfozGJUPgNDx4Gerpeo77NaPNrO0VqaVh0PJVsBx3F9GLkWjcJ3kr5ll/r5titiuHqLbFN7NGmJaOqAyBBOyf1FD0PimPg/7pwtQI3G7KZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520170; c=relaxed/simple;
	bh=RuxkwHpE4T4+RDbLbxVJFmdg2Ym7s4wlcnprbuxc08U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lb58XvJqERDSRTV7/odhYwEd4qVGeist4thHiCG9AgTuV/DvMit3BeKqA7omrnG431D0q55yGn2OTAeuajD26RgKWg2f34/tQX91LtAXVopTLSaouNEis/u5JM8l2+R+uOExMWQ5SMHsiJRTUZFwEjns2rJjHlglLCpK3YwrTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JRKywdq7; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78f02298dc6so151328785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520167; x=1714124967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=JRKywdq7DzysSXFI7V2I7JJrLuiZesSiHSA3gjLktvZIiKo42ctcyf4xq+6s7JDwKP
         buvUd6z7FBGsRGgmIG4h0LJlukks1duyv+EeCZXErvV/ygzkxyznu9edQFMSZpyY5dhz
         uJmtRb1BQihl89Vct1lKVeoOmnotilqpT9GNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520167; x=1714124967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=ftDYEO5rM7RzXmQzpDry1d+nrS36LB/nKqCF7HGkn7S5RgXqWwSK3/hip0Ookyffzm
         AYu1kuQdGOpkDWJ6T0retDwhT3rKpbzHbYINbJrD2IuOjIn1vjGtNB8AD4nvthhajl+Z
         U16RfqXu8d4rgx4jNcD+GrVV/AcSIhOt0Hi/V5NR0uc7GeGn0DmMm7yNnvEANYwIDpj0
         atLEWt3JVDwvJPalIO7BtvwKQuC176cCNo63n+Zyes7wGL4pnsDT91QhB2e79Uo5H62g
         UKWh03Y86PqTLHSRp4vUrzHq6qZ1telQHH/S0HwLGom37CJMzpzBBJHlLeDjyIr5dcAi
         KACQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpqYZTba17+cbAJJFSk4Wo0GNUxpnpSz2cpT+wh80h75uFnUZp4JwiIL56vWWCf/6RNxb0k3UI1JI/VUrAI2bXAccllqoX+NGj3BJ72Q==
X-Gm-Message-State: AOJu0Yzi+MMkVNUyX4/1urOcOFhflsqiIFzB0A0HOgSZeetn0NFiZ7kZ
	y9l79KOLDNa/bkmAV9fJ6BfbbM4dT+tirjZeheDj1ritPEqtspIA/EQLhe5Ulw==
X-Google-Smtp-Source: AGHT+IHJxWxlXkvVgayg/8KmEPlEYrjGm6s2oAW8VlNrxH8CHO+X8RZjNxTD6ZWD86mZ22X+MElfTw==
X-Received: by 2002:a37:de0e:0:b0:78e:eb64:d91 with SMTP id h14-20020a37de0e000000b0078eeb640d91mr2763665qkj.1.1713520167230;
        Fri, 19 Apr 2024 02:49:27 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:52 +0000
Subject: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
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

platform_get_irq() already prints an error message.

Found by cocci:
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index bce821eb71ce..4acc3b90d03a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get irq\n");
-		return irq ? irq : -ENXIO;
-	}
+	if (irq < 0)
+		return irq;
 
 	dcmipp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(dcmipp->regs)) {

-- 
2.44.0.769.g3c40516874-goog


