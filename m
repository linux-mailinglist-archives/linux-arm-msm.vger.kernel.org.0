Return-Path: <linux-arm-msm+bounces-8506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C633583E67D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 00:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D41728BBF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CFE5B5BD;
	Fri, 26 Jan 2024 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E0PImluj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A55A79E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310970; cv=none; b=S3wBQK7JRp4awGN1ACwcEyg4O+0aSoTFig0uiVZrTnpleMmOem1X2SebTnyxDBpXoKxrw9nMiSdh2fCmBV/4aSQk5ZTH0Es+CgWyINRwpDLg6fp6UYbGZmZF/YjI2kq8r4EMUtSp5fLC2upJT0ZcqFT/hzuyVGv0xqw57TCzV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310970; c=relaxed/simple;
	bh=l9cPmoT/bWbvsJfq8x1RTaIe5o9qG8C0R9ya897fz3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=op/K4IAdO5k6g4MuU7q5e+JpYByx1kpGlshH8zb7ZeiwOrSF2n6UnQgWzbs2gLC5FVke74xL5xT/OZEeQ7FdMnMy56Q+4K79awGz8K5LY+hSjVm8yO/echlECAjyUvxNAGM9nuRhO62AilI/8JabDUzQg7oUWWA+Bq3LcK/nFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E0PImluj; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-783cbc38a78so62462885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 15:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310968; x=1706915768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQhDPXykohcFJW0qtm5EHtuEzwLA0yzgLshaZoliDrY=;
        b=E0PImlujKieADqQR6p2TtSt8HXExhPEc7NuUnPza2sZo1Wecc0QMNXlgGFVVFS4/Rs
         CCRRhhK+eNUHJuEYmHjdUWQGlPdDC64dV5iUZfi5edeSjaY6qAP8bPACB62JYQe0h7/e
         lJ2LMRa++Lwtk+PngbSGeJlFdL2geGh09b56U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310968; x=1706915768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQhDPXykohcFJW0qtm5EHtuEzwLA0yzgLshaZoliDrY=;
        b=P4DFJthK3MV6pasEc6HaFOLeE5BEYLPqtEZjXD4Ta0FOfjCHf52TEJkvkfhV+b5T/0
         82Oa3NNoTJVOU6B8xYD9xhg/zdXc2j6Ps2YRUvhWJLWJ77t5HDR+QD3ehw49yP38Ofro
         DDru6s8USfw5lv+iWrWyn/kkUDy19pYHREWmV12MLbl7+quyV7FnQaH3X/WE++HOhZ0t
         qP7HlBsJK1eOg7s8hl+rT+TRzB1Y8zPE3XauIVvkjBVmv6vMFpmb4l9KnK7PLvhAjvkj
         XTZZXFQs8TzOHvbkmgmdKWiN1RLFvvd9OF89hRygscF3mWEVvCDJZYExY5FopwFV3ScM
         kkvA==
X-Gm-Message-State: AOJu0Yys+hXZ2FzWx9iNDk+EHohmU0Ot6WCaP2TTnDxOGWe4WiCOXgpl
	uwbp4UjHTOvj+pnlYauzdm0CD2gxE369xXIMfpW8rhfstsj56Cx7ORDNkIF30A==
X-Google-Smtp-Source: AGHT+IEYax7waeMsYzBi1V5anUAE9029IxFY99+NqU01WUd1yOqmYKRjKVGaw0nUqApkIUGiDbz6Vw==
X-Received: by 2002:a05:620a:19aa:b0:783:e3be:9bb5 with SMTP id bm42-20020a05620a19aa00b00783e3be9bb5mr52250qkb.21.1706310968110;
        Fri, 26 Jan 2024 15:16:08 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:07 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:02 +0000
Subject: [PATCH 03/17] media: media-entity.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-3-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

The fields seems to be documented twice.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/media-entity.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 2b6cd343ee9e..c79176ed6299 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -337,10 +337,6 @@ enum media_entity_type {
  * @info.dev:	Contains device major and minor info.
  * @info.dev.major: device node major, if the device is a devnode.
  * @info.dev.minor: device node minor, if the device is a devnode.
- * @major:	Devnode major number (zero if not applicable). Kept just
- *		for backward compatibility.
- * @minor:	Devnode minor number (zero if not applicable). Kept just
- *		for backward compatibility.
  *
  * .. note::
  *

-- 
2.43.0.429.g432eaa2c6b-goog


