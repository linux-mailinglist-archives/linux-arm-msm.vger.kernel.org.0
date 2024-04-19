Return-Path: <linux-arm-msm+bounces-17933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E978AAC1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 11:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697CB282887
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F8612B14F;
	Fri, 19 Apr 2024 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j+kwBRlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557E12D776
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520182; cv=none; b=OzmomhPML7ps+YReoSJFbGRyC1E5OCLoxHShNnKp7k99Yuot1eRcfj63zWfjQjPNLJfwk1eO07x3zU/0pUub5qndQ+RgUYxDqxcHX6eauss0BGYiCxvgeLjFbmOOrGd+j8K+JZt/hdQaj9r7XIRbvn7kJBpIaM3grsQjGF9/5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520182; c=relaxed/simple;
	bh=eTdkYl0bkVdX9TmC/TdAsDLTwgelc7ol4/8WiAm6VoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZtY2YwmzMfjZK6Vo+IWuos/HDuGhtFtR4GOgLG+hTl25LpPD9ahGpfDOAVO021/JTsEtGgL4DbDizAjU+YM5vxIZktdSL/HXF4MxxZUu2P05KUIUVx9FXydM9rSt55QGA6iCe8OMm6PkbjAeQbDVVO9tKN/G3yObzarb41a0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j+kwBRlZ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78efd0fcec4so114633485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520179; x=1714124979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=;
        b=j+kwBRlZb+eJY/EuKZi2TV8X/8NGiGj4nfykSzjOe9h5gS903Rg6RzlVJ/h8esAs2P
         Aja9shrY2os1M3dHCea/LBVl8ClpvLtetwc4eRhIyDspod6RhaI+hs0Xv8qoCWXCaUWJ
         7uJGIvzlHY5pWmfYpgClWYom9+uMZcg5+r/0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520179; x=1714124979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejR4SFor1DGbZO07N+L+RxXvAXTkN+sOOOYtcWWVXb0=;
        b=R2cO3qrk+eQiwU4bQGgnnqF8jTFarRr8fJ4s3ytliAfhfxkwSGYly2VZxwNreC53jW
         YOL1NIMjwz+Yw/gnOFT5YCrqcqZ9ZT9ADqKvFaKlMC+UhlH/W5SfxkEZwKrl8V7KY2ty
         x3Rc8FH9WvoLBEv8SJogEejVSAcIFosk/+ErFX566i9p7kMid2s1ckbfp8jyWmS9Ygdn
         eaWie0Rl2ork7qungbXmuNHp4TQdOSaJgpEqoNGSIorclRBCgMwG56sSTeW2WlTIDWa2
         AucN5p11jm2Ry3/kk1hj04hJxfb/06nIguOVagjVtnwjdObdMZ02xzODryE0YO0+ac1X
         qA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU07wUZ++Tt7bDn2T6tI6MWidYLlkMHrthDgnXoqa6wkDuNF/gsf7LQwiCnRVUegNZBIs8ENIBP8QHxzJxRFjzVeiSHXgZM98iM4uIU6A==
X-Gm-Message-State: AOJu0YyuUmbKmFOZuv4cIOF5haI6pD/qgELG5lElhLWiIAutABZTTTci
	K+X7nlLpSfrOnuNNdLDheRaM2hf9OoS9qz/P2KuoT79BJwqfIpvZO7ftwGqMcw==
X-Google-Smtp-Source: AGHT+IGpZ3ldVVwdiWjuIy5SwcAIMUaAxjtBaGve9bP2/gGFY6jCFymehsQebGC3Yx4JbEu/ovs54w==
X-Received: by 2002:a05:620a:d94:b0:78e:fe1b:a601 with SMTP id q20-20020a05620a0d9400b0078efe1ba601mr2205140qkl.0.1713520179012;
        Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:03 +0000
Subject: [PATCH v2 17/26] media: flexcop-usb: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-17-2119e692309c@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 790787f0eba8..3ba6a5ed7167 100644
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


