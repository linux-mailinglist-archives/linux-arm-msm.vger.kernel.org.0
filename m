Return-Path: <linux-arm-msm+bounces-8507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318A83E682
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 00:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237F01F213F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2425BACB;
	Fri, 26 Jan 2024 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PzOVBiA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668A5B217
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310972; cv=none; b=BE1biECxrkWsnG4TdjVDlXHvfX2sn1xqZeUvaXDgFYjYivkyx0N0VfOjz64I/U7vBaBG/TQVne5WyTSOKi7+ZBjwO7zIFyZsPV5R2tYXoMArUhaQKv5HGVaIlOiFy2DZPs45BybAMTUWSct7fws/wtyilselnevQlfW19Ak/KDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310972; c=relaxed/simple;
	bh=EP0SiOYhVfFPOJvzK23HYaQLWx/3epVW9BeNm+8xVNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tihDwhj1VjJHr+zqjsrY0ig8r28eFEGy3FMY6pr2dxGWub6X+wOOGB32Gwu0HRKkyaFNsyNWfcfwR5xcoSlZB+GOGOCy+AJNjMSBzLTAzhkAS19aRiQPrtFfOKiSJKzuOaf5fy6Tbun93DA/HUqw6CSvORu8btWzbklCnelYwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PzOVBiA5; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-783cd288ac5so85473585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310969; x=1706915769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8jNV9DHXsOFSE/nzIDQ0aFfd3NfLzQF84gBDTm9ggE=;
        b=PzOVBiA5d0ucwiOX/m3P3yrqDLdlDLueuF2aSHjbVTyi05Zx9SRNqa1njfGGfkF4ZP
         RonMbFPdhQ9NlF3LAdwZaBEsPT6TlgoYVSfpET0Y3YGfLKTvbBWX5VYAahfcRChLSgov
         PvDCx5NGYjtBfeYzsVco6q2MB6ktViByV4twQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310969; x=1706915769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8jNV9DHXsOFSE/nzIDQ0aFfd3NfLzQF84gBDTm9ggE=;
        b=nBsWV9JNFZ6eI6TnpNcWDhxelDjmIB0BgHuaOsUn57xlp3MDkeyrHk+fgx6CKM2YeD
         yC3PbfTzRxPEglK20x48Bhq4Y7ymgAfWlnkqb4wAVQelnDIi0Vbo6o5oKA64ZWzck9lM
         +iz5YtY2DN2ufCXA7NabCTvJ0obQGN2/L2hwPr2HtK4rL6MaTk7m637X87FcZAts/BWf
         iXaO81z9VLG4wqeNveOPyCGIcZNN3BrcM3QvpAsL1J3WDmEVO5dAfyEZuxo/gJWIv0a3
         gikE8djGEgn+GfhlkmT5M6eL/sANY9f2V6qBDIFz+8OSvC9i3cJUyClGe623nig9sP9Y
         kdMg==
X-Gm-Message-State: AOJu0Yyh6Q0j3j2gtzANYKd81ZN9pIAr9Jb1JYaleTLlm19VhR/S9BK3
	Vt/3U+i5zjlmouoUhm+M8NyfH2b5665VYOFmpaeHRtIB360UqGzJGqC17U4DsA==
X-Google-Smtp-Source: AGHT+IHzyRuPGLIU9IzlEEdTKBGXo6/9Uou4vY0QASKHiYYbaa5Xmk9tSWpjCG3cIXB1RJj/V/BCqQ==
X-Received: by 2002:a05:620a:28c8:b0:783:8d63:f3b2 with SMTP id l8-20020a05620a28c800b007838d63f3b2mr1010002qkp.54.1706310969221;
        Fri, 26 Jan 2024 15:16:09 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:08 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:03 +0000
Subject: [PATCH 04/17] media: cec.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-4-eed7865fce18@chromium.org>
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

The fields are gone, remove their documentation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/cec.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/media/cec.h b/include/media/cec.h
index d77982685116..10c9cf6058b7 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -224,8 +224,6 @@ struct cec_adap_ops {
  * @notifier:		CEC notifier
  * @pin:		CEC pin status struct
  * @cec_dir:		debugfs cec directory
- * @status_file:	debugfs cec status file
- * @error_inj_file:	debugfs cec error injection file
  * @sequence:		transmit sequence counter
  * @input_phys:		remote control input_phys name
  *

-- 
2.43.0.429.g432eaa2c6b-goog


