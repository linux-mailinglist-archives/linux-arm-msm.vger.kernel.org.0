Return-Path: <linux-arm-msm+bounces-8514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB583E6A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 00:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A44CC1F27C81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20682612E0;
	Fri, 26 Jan 2024 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vpm0Alqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3060DC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310981; cv=none; b=kwbvwn+HDpPaeLzxQch/DCx0FiqrASAFHkzCjU/RwhhP7/2XThntEKdcrgipTcfrnejkOjedqu1jig7A8xtmJuq3l/8b8PxJfTpoY1ovlDC18cRhWNAPHuVa7JnKPZoL4oSl3YAWlbHYYJn0qIMEIjMP8zgDiwlAffm1i0qje5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310981; c=relaxed/simple;
	bh=v/x46NG9ZtIytS9oM1clKOYXlZ53ICZmAoZoIkhTFns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoGKfdYVFMOahLPzzEApHCYa3EY79ymsaB4pXguGBJ27b9V15457FloS3brGm6QnbG+q+68XmAEbkXU+sJsPDx6Hv2Fb0My4+UXdPmfD6O9apL6D+61whGbX5u0nvtqWGNk0H3/XuXb1rB6r5HL7T0l7lp5EZNGpYiKF6pzxqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vpm0Alqe; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-783d4b3ad96so78742285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 15:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310977; x=1706915777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ2hVP5YSWUaFh2DmjHhBwG+r6f86O5FO2Ifv95SzW4=;
        b=Vpm0Alqepbm36hTtHDgkkwNTDh6NWwz6+6fiuYEgdQt95tbDbx7oHZrR1rJ4tJNBVe
         0uzH9p2RxdxJBdOI3YzouriamdWl9xmjdp9jX0JKkRAhqdQM+R0y6+guUwtFYR6vbSNr
         E/7SviodFMDrj/IVT6/3lY7fiGbDwRPxN4L3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310977; x=1706915777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ2hVP5YSWUaFh2DmjHhBwG+r6f86O5FO2Ifv95SzW4=;
        b=jDbQ2CbXtMDkw7ulmdTDa/LCeU26gT+xklVEY/1SRiLakykanq6ahRSFIERfzp0+mN
         W+aSs60IYvzVOFjK+wuGm4le4oPDfP+5TAawctFjh9bofgGeBbsBoqSu9GGqYKmOkrkH
         ZSE2ZrwswpAtRSAQ0WzcRswRyVbCauQ9Unyil6hMgPNCU4HB1Ry/Gh0C8F/ESvTM9M2L
         +f/nl7x6DYAnFa3ib37C45T2lCiXWQXF6P1/3ZrMCNl3I922pBW0/Nw+NRcT+Y/N8vCD
         aqDnYtSESftEqvfK0xqHOrygZYhK/yx/JSQ/eOdGgXbUTMTpVf7NcaWxHF6J+ZJbq6k9
         3QTg==
X-Gm-Message-State: AOJu0YxTC/6xxJDgWvKznCuxyertpYBcMcL5bSEqeYXZGCnTkpREv4di
	W8v9OwdnosN+dMA48iG5CbhkH6vUrd34erKR1tPL7XBJPTN6OkXFZRJcDAXAmg==
X-Google-Smtp-Source: AGHT+IHtaIwGnlHCGr2gV5vTdHthY/KJARNYO6pIlwA2CpmdH7LMlVQFPCHc4W3qOep8rQ/bvmYRGg==
X-Received: by 2002:a05:620a:12d9:b0:783:25ba:6c70 with SMTP id e25-20020a05620a12d900b0078325ba6c70mr576836qkl.129.1706310977198;
        Fri, 26 Jan 2024 15:16:17 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:10 +0000
Subject: [PATCH 11/17] media: qcom: venus: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-11-eed7865fce18@chromium.org>
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

Remove doc for missing field.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 4a633261ece4..a39986ce79f1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -428,7 +428,6 @@ enum venus_inst_modes {
  * @error:	an error returned during last HFI sync operation
  * @session_error:	a flag rised by HFI interface in case of session error
  * @ops:		HFI operations
- * @priv:	a private for HFI operations callbacks
  * @session_type:	the type of the session (decoder or encoder)
  * @hprop:	a union used as a holder by get property
  * @core_acquired:	the Core has been acquired

-- 
2.43.0.429.g432eaa2c6b-goog


