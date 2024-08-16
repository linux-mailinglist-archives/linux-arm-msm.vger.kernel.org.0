Return-Path: <linux-arm-msm+bounces-28782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AD954535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 11:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FFD01C21575
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 09:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AD113C667;
	Fri, 16 Aug 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCf26TwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAA13A250
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723799544; cv=none; b=O/G4w8NWb6z4pCMwfIY2W87r+qtFRkXP3k36I0vNgU7kZ6BYosrTc+PJLgPD9wo73JNcAOKGxbm79dqy/MUlM0shR0uPiOm92eROt2B5+SHTvniz1x4/yxJ+FG54HAcqeKuwToLokalXaS61nOYQle6F7HZCaWWKiNCFTLm+cbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723799544; c=relaxed/simple;
	bh=uvPfs/sxceMFOcpt6ca5ZNnxd1WJmw0aOuCls/fF4tk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NGZo1+niTrurVNWzSnfo/cW69REQf2lUpzuivdgbKM14VkF7LlFLNVlnCNh9h82dd+gxBFGQx3HfPy5xvwL3zSga8iQ/1IJFnrAihY+mSSDvEmtX7VvTjUlb9yezcX1xc2hu0WNIYp0zqBElH/P7gpjFsDuTLuzyw9bgX/XjFT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCf26TwE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428e0d18666so12092245e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723799541; x=1724404341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WllYCtmCZzHsMxTLdu431wvQusgsnPG7xw41l1l/SJI=;
        b=YCf26TwEuMvUmoJU8bY5TfLXC3LSgXyVlzoa5ZaJ8xIqGiLWgOYEEoYVok+Db4v6I1
         yCmA/i6aqwVwqje5Tg3fxFFN5wNVHDD01txonwCZVGmIeai/CnN+aGzLuILcgil6OnLI
         AcncqUtEH65inDJsyCUmaJ67qcFszXMoCpdTfh7WxEpls/tHBd4ToeG0ltBraQ7FJJ7T
         5dcTa2PF6ElTgXcIAac2ez+Cvh1pQEYqFG/ceDADw+ZnjEUbb7i2Wxu6tpHJr3CQcoF+
         xpPwuvV50Srn6+eorocKfDxwzNUODFE7U290WIbP/+ouxDnlu7HScPma2Prd6vg5/Lhn
         MklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723799541; x=1724404341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WllYCtmCZzHsMxTLdu431wvQusgsnPG7xw41l1l/SJI=;
        b=eIDjtSPblaIMCfFffEPbSrBvemKfRYxFn1qUm1hvarD9fcBKCWAzJAube1xV0r0MID
         Jl9NwCCAo1zWmKGvAi+By0Xo8FZtGOf5eSfjtyupXLmGMsUn8SWzpNaNf2dWRXxSoWdV
         R4G6k3h4jbM14K+zrx4l/0qpBuW+CjDDPW5eoF5RHgjT9C+TY+9pXtiBclUt01rwgBxP
         0KgRz4UbW9yJLY2/e9lmiOy7sfMyLVSYlWf7eK1v/NnKYRq+IArC9Bfr6UUK5iZesB8C
         UsaK4gztHnWK/c77eggCuPRXIN73hrFocdVzYgFOTi7d9PSkfubRBVw/Rq5Fy5tPJDyf
         vcLw==
X-Forwarded-Encrypted: i=1; AJvYcCV11SpUJ4ic44GlW4u5O0BNYJdY+pLvMsANFUAIPzIRWSoOMpA/qu+hyz+YTvnUv5Bi9A7yzXXzmVnWcENRjiBekHGXT/jTHzOchvASng==
X-Gm-Message-State: AOJu0Yw3l90vBj2hZkSXgvn6thm1LjDfkYn+nBg6rfCE6lHYBV8xCwlO
	q5qSaT92u5Ba0vQElAA/XZySZfI5fQ/BnY17mWREDdDnWs75aFuicNVslI+9gclfiyGxAmHbqRB
	q
X-Google-Smtp-Source: AGHT+IGvQ9bU4HwT1y0LssYKgZiF6iaa0214ap/5xVyvjFPYigK5l5fFUuG/x6CX2HWGTdPrbEznbA==
X-Received: by 2002:a05:600c:3550:b0:428:fb96:e94a with SMTP id 5b1f17b1804b1-429ed788f3amr15403345e9.9.1723799540837;
        Fri, 16 Aug 2024 02:12:20 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed6507c4sm17525635e9.15.2024.08.16.02.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:12:20 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec version for sm8250
Date: Fri, 16 Aug 2024 10:12:10 +0100
Message-Id: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

sm8250 and sc7280 have lpass codec version 1.0, as these are very old
platforms, they do not have a reliable way to get the codec version
from core_id registers.

On codec versions below 2.0, even though the core_id registers are
available to read, the values of these registers are not unique to be
able to determine the version of the codec dynamically.

Add the version info into of_data, so that driver does not need to use
core_id registers to get version number for such situations.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- updated commit text to add more details

 sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8454193ed22a..e95d1f29ef18 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -228,11 +228,13 @@ struct va_macro {
 struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
+	int version;
 };
 
 static const struct va_macro_data sm8250_va_data = {
 	.has_swr_master = false,
 	.has_npl_clk = false,
+	.version = LPASS_CODEC_VERSION_1_0,
 };
 
 static const struct va_macro_data sm8450_va_data = {
@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
-	va_macro_set_lpass_codec_version(va);
+	/**
+	 * old version of codecs do not have a reliable way to determine the
+	 * version from registers, get them from soc specific data
+	 */
+	if (data->version)
+		lpass_macro_set_codec_version(data->version);
+	else /* read version from register */
+		va_macro_set_lpass_codec_version(va);
 
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
-- 
2.25.1


