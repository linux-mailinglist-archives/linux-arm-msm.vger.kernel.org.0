Return-Path: <linux-arm-msm+bounces-8508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1583E687
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 00:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666E81C22ACA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD02604B6;
	Fri, 26 Jan 2024 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fiGiKXw8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C69E5B5D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310973; cv=none; b=uBvFyzwXx9MzN5S3yDSVLZwKNsr1UplAEOmhcOS/yJBP9kGRfb0VA2PW2FQWlSOTTLXyRMAIHc67XOGZT50NzFYamSZn1667wWQJbm89tJPVVh+x/OOxSwTpcaSugkk+Z5VzLBYO0z9MZEiK65Ho2IuIvVQ82BJHnt0j4c2HJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310973; c=relaxed/simple;
	bh=hr4nOBWgTYWfAz3nDinorGAmbEpHqgT37FFxq902g4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNeGJCHHk7gambuVPLId0ZtADUlkIAi8YWwVjkD7I5trslJgQd+oXsIbKtagDjBrMtYzX848+VhDI+k/hkczNAanmQObp1TyyeKLCpH6RM3Mtna9+JVZNeraoPD+EC3bvlBpe+huhpm05Gkmw23tRAlR4uPq8AAS+1/g/vUamkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fiGiKXw8; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-781753f52afso64700585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 15:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310970; x=1706915770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJ0m3P4movTLz/Nvfo+j871i2YxzmvzYNu3X7u/7SQ8=;
        b=fiGiKXw85GcJfODCS3rqqFmxeJHozVJjTD+dUpX/6E4whOb6N1Opi/fF9c4Kpxevn3
         ERoIOY/PBDzDrcbrc1YuoX4b5rRK/c+R9XAo1ZzpuR6Cdkdw4jA+bFay/PC+oLkwnUXO
         08P99AYN3EJsW5wEdHbCec3U5ad7qd2XTRzS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310970; x=1706915770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJ0m3P4movTLz/Nvfo+j871i2YxzmvzYNu3X7u/7SQ8=;
        b=jabwiKSgp8L2oifW4sPJc862dQIAZGy2r41pO6J9x1Ic0tzytkDogSwrzpXdQBIaMK
         sGZvX2e558Nn+v25fy4y/91RBVx/m8XL22wIZ1Z/j2FlMQJUN2Omzag10JvhQKSxcpWP
         9CUc9VPake0fyUE2iYu9v66UXO0rAzXd0UdY70E4yizr0mSJjv61Pi4LGofBGOLYgE7V
         ct6swCQ2ISlwocqL5tXS32yT/ZB/Qs8mXZVepdkE1mEuIBohLizwc73KYN7lpvPFhnpJ
         S/PhpQOyzSop/CworGtljQIgGynoev+qofmPX++gyNx0MQVNfuW7mEYidIWcTjnWJyE8
         fHBQ==
X-Gm-Message-State: AOJu0Yy2yR01ZWP/VicvMFwzNRSJ83oqO8XVVktLIIZb/BZdgmJNAa4f
	hrcnlvONC0mL8egiaVCHttW6W0uL4tLyKGavd3ZEYXKgH/6nfIS1z/fzzDImsw==
X-Google-Smtp-Source: AGHT+IHAmNfItdlyJWsZ1GtS50XKPZcd4sgiZnzEdRhsQ66Nd+BshXmAy/d7aAGqJVN+Us+VU1C3UA==
X-Received: by 2002:a05:620a:148c:b0:783:89f2:d9f5 with SMTP id w12-20020a05620a148c00b0078389f2d9f5mr495965qkj.104.1706310970554;
        Fri, 26 Jan 2024 15:16:10 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:04 +0000
Subject: [PATCH 05/17] media: pci: dt315.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-5-eed7865fce18@chromium.org>
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

The field is gone, remove it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/dt3155/dt3155.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/dt3155/dt3155.h b/drivers/media/pci/dt3155/dt3155.h
index c9ce79cb5566..ce1835d9691e 100644
--- a/drivers/media/pci/dt3155/dt3155.h
+++ b/drivers/media/pci/dt3155/dt3155.h
@@ -162,7 +162,6 @@
  * @height:		frame height
  * @input:		current input
  * @sequence:		frame counter
- * @stats:		statistics structure
  * @regs:		local copy of mmio base register
  * @csr2:		local copy of csr2 register
  * @config:		local copy of config register

-- 
2.43.0.429.g432eaa2c6b-goog


