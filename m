Return-Path: <linux-arm-msm+bounces-17932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB968AAC1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 11:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16D35B22014
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 09:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEDE12DDBA;
	Fri, 19 Apr 2024 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HumgXV+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D112C80F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520181; cv=none; b=XQZRSkyR/qppGjpIADikxm4zVXuje0R3SjpvfnGCEwlaD1HFuK1A5S14iH/ZC/pHd5cZIPFc8fzrHLfOzDsCH4ZUtfae19XmIr/9B2W2eoH4CjvFqpbMEVq4nYZqEliRc74pSFtGkMwXSnUZuIX42VcuSuQSjkaQmvCoJpPH9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520181; c=relaxed/simple;
	bh=A6XSSayOn3r1ipxe/l3oVKgkfleRFTrQcYLCuzASKa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0HXGORa5Dx4DvRObqBaqTLu1m1IQan9RW+AFLB8nxNL3QjwkXEysv9K38XX2nbcgeC+dCe+YY7AeGj6U86pEomAeRbA/aVLObfNLf/nUikoiBSgssNDfF+K32SgGzMFATrHRsif+Dm7IHntevE6Tb4KGKiiRGxTiUgzIS9p2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HumgXV+E; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78edc3ad5fdso150410785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520178; x=1714124978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=HumgXV+ErFIGnDnogPmlpKN32KbuQGE9FuDytc1rldliZGDvuyW2I3lfPtyz0oQUqX
         xqt47BhZaBp5aXQ0wGqG7cidr6nnhm2+gqpW6YtPENKGreCl/2t+aNnwBkfLRVA5JOm1
         Xi3HJFhkhwKOmKSy28w3w4jE0sSaPyJImlAn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520178; x=1714124978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=miv6QwCo6xqZ6lOBa+8iHzMxRhXYjsVAJQcniRqS0K2WWnX2YeslJINzVrqN42ufNe
         h5xWOMI70cj7JMJEv+UYkmcd95II4brQb8/XDF/dvbm7bvyxDfUHY6xkMaIIBiCo6abF
         NmHfJ7+hquiTBwbuxZS2QeQgBZTBBSWvacEczUq21AFUgPMh3ebSzok+hejPBd9jUWHq
         y1dlRo7LPSaMdUTLg8MHndLuATssbhW5+MQutAI9e+uDNipyZnfEIbRRKjcJrdDpvBSH
         c3FOtagBBpdhOrNdr4SFsIRmpXl672UOVZQfA1yfbOUMZiOlkcxTmi/VRc3PrvsIs2iv
         staA==
X-Forwarded-Encrypted: i=1; AJvYcCV6MRpcYFsuZaJsNw93OtrmKbYtSsYGIxCyQMNAiRgY88keDEjUgtgtSpo2t4b1FUNt8+30tS8dNqIdZfLMsD41GSoHr6xtuNhp/n5bvg==
X-Gm-Message-State: AOJu0YxpnEYjX9MmgtSVOGPAZ1mebU7bh7HT5EDnr1CdA6MixabglTca
	4PILOnBvusz8Uns3eGalPIDCuwcfCeHbcR0H3UaqDLly9YABVs49l8EJ9Va53g==
X-Google-Smtp-Source: AGHT+IECi6Jyi4V4xEUSov8CqJCQ4or6T8Il7gtYs1qBNIhEZ0wlq/VmHa5Y/Lm3RCi/7xPm+Pq8wA==
X-Received: by 2002:a05:620a:45a7:b0:78d:5d86:ee3a with SMTP id bp39-20020a05620a45a700b0078d5d86ee3amr2694110qkb.27.1713520178140;
        Fri, 19 Apr 2024 02:49:38 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:02 +0000
Subject: [PATCH v2 16/26] media: au0828: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-16-2119e692309c@chromium.org>
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
drivers/media/usb/au0828/au0828-video.c:605:11-12: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/au0828/au0828-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fd9fc43d47e0..2ec49ea479d5 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -602,10 +602,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
-			if (len < remain)
-				lencopy = len;
-			else
-				lencopy = remain;
+			lencopy = umin(len, remain);
 
 			if (vbi_buf != NULL)
 				au0828_copy_vbi(dev, vbi_dma_q, vbi_buf, p,

-- 
2.44.0.769.g3c40516874-goog


