Return-Path: <linux-arm-msm+bounces-82066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DEC63229
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 10:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFC073ADC6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904FD326D4F;
	Mon, 17 Nov 2025 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uEUc2rlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C3531A07B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371211; cv=none; b=RPo43bhrWIH+G7sOmI1/H3KmAsxQLJgpS959B7mvrHV6BIUq4ja+32gK7Y4fiSRaK5wHxpDRKVn6ocJOfsC0BXL/+hswAMzDu72QaHs0jwZBKxC6X5+f1m66Hq5lXPnsCfeqrftO4guIFI5BVAiPMpgwuvG8tZNQLBW/om5Vc+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371211; c=relaxed/simple;
	bh=UK93JtZbd3Yrxl2pJfccXW8yYKcU+p5a1QXvaIrxJ9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7zDUrhib8JniPh5X3SBjbpkTQpcl6RPtsfyDlUMyBwxj954tKEcs/jGO/AWo2ciG2U0IOuCFlz2z5IiDY3ot+XomgkujYQqk82JlyB91W1xAn4uV0B6jTOBJJJwsggyShd+VwuPCVRhCmJOpmbOGlLozIKe6cM//dD8wuSvrnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uEUc2rlT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso33055125e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763371206; x=1763976006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4iUdlkRYd5RVsH+I3fj6Ee7IjYrOIYZyxbLWxbpMgs=;
        b=uEUc2rlT7AFWGdof00IjB3mtm5G26x5kZtxjkhP7iryUMKlgVqnikzKPXeqL6/i+PO
         6hIbAhoV3q94ULjkHNNp04w7zUc0UNvCfLpiPYamb4zjLwJC+7XRf4gBxS4YkW2SqSsR
         1pvShqh1O5iSKirwZ2u3CR44vH2gqfo3QZKgV8/g47KkvMCEJd7kT+cF55rs7TvWvIuT
         kLsaJsDzeCGWkaIQH3DnJvkv+B0gxMfbLBkzZXTBWzCDSWJSvhUbtWhGrMt5CSVam2tZ
         NTJ22gMAqg6jAXBSkxPlAlNnAJtCE2xFWPD+3z/ql741m9gN+uDVL/QuS7mRt133yGgq
         OVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371206; x=1763976006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4iUdlkRYd5RVsH+I3fj6Ee7IjYrOIYZyxbLWxbpMgs=;
        b=HtLApA09R97W0yt9k9vBI/doL0gCiTuPJryZEvuoZCgxXn89uaQVLe8zfQFxVHw4GT
         X0eRIYMF31YZLmZMxdrUFujqcusdBicPcK0dRMMhtp1DJtaYB/xQ7bZHPA1DN6Lfah/N
         7ahuO2Mwij5BF0HnDZRSoUo0vQfwdnayyMUrhQUHBg6uJa09sLuOPOhOcJAzmmUC3t3g
         azzmpcGutBlu06BpKhVvlCrgFx5zrgSH5ZHVbRpdYSaCZiW6gM45HEZRinHz6gfTgRxd
         TdAGXjDBIm9947CLMSfC46a6QfLmRGSJusJT4zV4MQwmuTc/2UuPB08X3FzJzX+LwlrI
         Ryfw==
X-Forwarded-Encrypted: i=1; AJvYcCVMNoJMHnZkTs88Bq1V4ZxokJBUGCax9Rf6gzFHnOpCcTIvvnSW5Qo9NSjDeOJb+5RaP00mEjtKW69qf2YC@vger.kernel.org
X-Gm-Message-State: AOJu0YzWw8DesAAY7nOvYDMddE87ZsZzUodT8Nl179INe1XPFNFn+RCW
	f5P1IR2456/q19kYGyKgf4UtqR4Orn/JDcBQHB2UIlpZnJb+69fMHxpJ3hp1TxF2r4s=
X-Gm-Gg: ASbGncsvnb7JGodAugpkgrCjEYNjXonu3XHrljOFGSDiGL/wIIvGlSUk3ri9+Vao6SH
	oaePFz0JfYNCY0TS5LYyTktUUTrvlrgAu7kFgFPHfwvyBEMGsMR6EWQLuTSRAujMI5ohUhqFP2Y
	3DEmEFboQFsqHNUfDc6rRpORHmqhd6TIPw8NSbwr8PrbJcH25uplcSt4JstZ8jJo7yUz09b8dN/
	4h3HsQ6ubGStHZe8U9j0ZC17hgDcOrVp1LLI0rjCL9kHqo+ry2bNceB7fSlP48pBQmXs+kCHeLS
	evF6bYdxYSiuk0HJNyPkQzuQfMNQgzNRPxIp87ItQbQQVQnUTxiHsdTO0HhrWJ9gqwTWWw2F7hp
	7hm/omPRYfIx234dnXKJeE2gwaPsYOAnzBNU7i4evmPaFmFltZ2f1P9sPKS/vwlvhy0X8qcSSRs
	insnYkXtffQmqypqJg
X-Google-Smtp-Source: AGHT+IFM+sFTyB1K8S2Q7ocXsR+3CIJ4k6ZJKu+eA5woiTh9UsabhucUQnbw+fnLYaZmdpx0QUK3GA==
X-Received: by 2002:a05:600c:190e:b0:471:665:e688 with SMTP id 5b1f17b1804b1-4778fdc3175mr126088235e9.17.1763371204858;
        Mon, 17 Nov 2025 01:20:04 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm25365943f8f.10.2025.11.17.01.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:20:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/10] gpio: improve support for shared GPIOs
Date: Mon, 17 Nov 2025 10:20:02 +0100
Message-ID: <176337119246.32319.3276431687296122830.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Nov 2025 14:55:29 +0100, Bartosz Golaszewski wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
> 
> [...]

Applied, thanks!

[01/10] string: provide strends()
        https://git.kernel.org/brgl/linux/c/197b3f3c70d61ff1c7ca24f66d567e06fe8ed3d9
[02/10] gpiolib: define GPIOD_FLAG_SHARED
        https://git.kernel.org/brgl/linux/c/d4340ff75eaa083f261e16d49f13191236bfad06
[03/10] gpiolib: implement low-level, shared GPIO support
        https://git.kernel.org/brgl/linux/c/a060b8c511abb0997381b397e52149a5e3e5259a
[04/10] gpio: shared-proxy: implement the shared GPIO proxy driver
        https://git.kernel.org/brgl/linux/c/e992d54c6f970b382ffeacd7c88f68b94a3c6caf
[05/10] gpiolib: support shared GPIOs in core subsystem code
        https://git.kernel.org/brgl/linux/c/1e4f6db614a310cc34d07ffbf031c76ea9581bcf
[06/10] gpio: provide gpiod_is_shared()
        https://git.kernel.org/brgl/linux/c/eb374f764a7012eda28019266a6d9191670c4fa5
[07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
        https://git.kernel.org/brgl/linux/c/e511d484cbe44fe48a1b9f621f6a947c72503f9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

