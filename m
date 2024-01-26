Return-Path: <linux-arm-msm+bounces-8517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA183E6B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 00:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8C3A1C22D58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3735E5F84E;
	Fri, 26 Jan 2024 23:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e68H7sS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8166167A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310985; cv=none; b=LJFXFfHs/LG3zVM0vegnnSVNpUDaA3fT7dX7j645CIFcfsbP4Gh3zJu8kTlsvuWI84KCT4VIa5zylxBEPtHcWcxC90g6wGaH/J/G4JFTA61ouxu7ekS7J9Xc5ENJ950wKloZY0XM6ri6VRWALf1SmNzeL5FjsJHlSFLDTXx4KK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310985; c=relaxed/simple;
	bh=s7ygjNtkxqQxfIpVyrNczCyGDbA4gmJZOw/Jn1FAax0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cumdb/NvAnLrVB8PzsMRPxYPB1eisO6kpf2t7qog+IrYGlTqMVLRnuEFSgEshUmmLQ4wGkj4NcBizsQB27t6sxCV9iE9uqFyVE1hqBgVV2ph0MN1qV2WYVBjTKLyyJG5OiF3CfTZuAMQ6ttEP9vUiz3lh0CYLlZf3SEpkZdr7lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e68H7sS3; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-783dc658b59so61106585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310980; x=1706915780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/RRjO2OK0qr00/hywXC/yqqnZfLNxXiiMwDlCkck/8=;
        b=e68H7sS3fwT77UHO/O6KjoMqjRQIdT+Zl9srCpCOs8ks1l9iMAAJf3bAJJcXh9GRjF
         8Iuqp2rIYJR44MVhKCcM0KbAwhSql188EQNiBQepS2Y9xwHIVqtjxGCIKxiLAycwAa62
         1ElAmf4U70wvJZrY32zt/YhImL/pJ8g4DmJQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310980; x=1706915780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/RRjO2OK0qr00/hywXC/yqqnZfLNxXiiMwDlCkck/8=;
        b=iyrCOolt7ndifRNciVc6IWVii6r+wg28TKydCKnVc5xi+1ZnAlgctZdGouYJJuzVux
         77CHAvW6vCnEw94J/+zwibWkljjIMi3XlWWC0L8t2dqgT+aWF1gaD7eud1mlVB57p3bL
         xbra5VtF4ToS+MpioHpj0V9ISGpJmap7A+J9zTJFWAteq/6pVdowAFnPjoNXa20Qduqu
         YEGpNm+sUaWMU3nRncXmNgYBZSOVYyrGs2vRwvoNCEWPERbyQdkbxhO9y7Y4sy2E2/MH
         mcnDQ7kQGD/INekz4xy+qiWNpPTORNb8KsOF3Pelke0CUoXM8M/1EqUm6NFX6zfX89px
         UyJw==
X-Gm-Message-State: AOJu0YxpaC6WNE4FSQN6SB2hJXbaO+wcFbynltDo64VM8wxa3ZFne2Rj
	YKD0w/kNBCJG3z1AhFL4KaXrLIw5DoUH/bgPFrJ78IvUhx0mAIi7Xcc9BuZV4A==
X-Google-Smtp-Source: AGHT+IHKRlOu9LCpALD6RY5rOpayWfV+md9Ii2K85hj6JHlytziq3n5aAFRxrPIkRTY/lkweMMhnsA==
X-Received: by 2002:ae9:e716:0:b0:783:4e2:de7f with SMTP id m22-20020ae9e716000000b0078304e2de7fmr555937qka.113.1706310980532;
        Fri, 26 Jan 2024 15:16:20 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:13 +0000
Subject: [PATCH 14/17] media: dvb-usb: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-14-eed7865fce18@chromium.org>
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

Remove kerneldoc from missing fields.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/dvb-usb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 0990aa4a17bb..cbb0541d4dc1 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -126,8 +126,6 @@ struct usb_data_stream_properties {
  * @caps: capabilities of the DVB USB device.
  * @pid_filter_count: number of PID filter position in the optional hardware
  *  PID-filter.
- * @num_frontends: number of frontends of the DVB USB adapter.
- * @frontend_ctrl: called to power on/off active frontend.
  * @streaming_ctrl: called to start and stop the MPEG2-TS streaming of the
  *  device (not URB submitting/killing).
  *  This callback will be called without data URBs being active - data URBs

-- 
2.43.0.429.g432eaa2c6b-goog


