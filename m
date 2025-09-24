Return-Path: <linux-arm-msm+bounces-74605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04366B9A6AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D4D1720FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DD031B108;
	Wed, 24 Sep 2025 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F1uZ4dEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92A331A804
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725531; cv=none; b=dfVNc8VRgkTnvzd8n7sf61Wn9hUISKSIlxgPCqa+Dq4cc6WNJiDk2KU/1KU/vakhrCEJsz8LuHACwjQkNKZLPEZaTnFOlBwDuX/Z+x0+sTSfKBBTX6+2O6siqX39juMnOwu5oH1G1g9zpMYXS6B16zom1ZlXz27MFkpsNF4RWoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725531; c=relaxed/simple;
	bh=qcX1d63axfEm3RBwV296f+6+sRglnyR7jSQ67K8y59Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3kgjqJwbDtkjznrqElgnAq4kLZakR6H5zkAwrupr68OotDILQT8HuxvwtfUPyVUuF1k3C5F5eLC7bcDHl9u6S9EIBYOo4xvVZuVXk83fnXcxmfdpAyoUVf7g68BK/9Xa2gF+dfYurpF+QjYJormxOhCbDt69ywlDUmPHX377Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F1uZ4dEJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45f2cf99bbbso33370605e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725528; x=1759330328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=F1uZ4dEJwYU/q/uT5cIg2WhczgG4i3NNjrikY2TSzz8YgnQk/Zot9R2fFx6KFk64nB
         GHkJBI/T7m91xemjea8GOyyyIPUG+4OullhJQKrLZqY4Dz5MdmCAVv4qdLnJzHExWXx+
         6TjO2IBPQkBkW7/XdnRxCDkjfhwg5afy8OLpEDnotXhluGtTt/qbQPLycfham+idZ1Vo
         bktbhRi2k/yMC9F/9x9yN8u0Qo40lwB/vFZxIFJBansI0kRznZ3iXeCrJ1v+usZVjxG9
         JKdtRVz8SgKjKlR9NpEIEFNr2HjLtZoPnmqVCPOUYAR05dxMH9B48EZw4YvVbWWbXJ4O
         tqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725528; x=1759330328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=ngQrxT3FxgOD+Q3Imj2KR7wz+7uBVqWcvz3AGagJW6bohtVQYBY+OaV+T8IeI1r8mc
         KcqbmFb5p3NNGDedrFDAUD2YQ5/vlfhvirn6Wn9LI5xdVvSkBfkOVnWVjwZyJv5ip/Zf
         +aUJ4BxOvZ3RaG8GTxgV4bdPpevZexGF0ZZv+DasdsUgiMQ3pRW12yWDzvOSFgdu8FKP
         vFjNO0NM8aRf4tLHuARD6sHzPIgQLZnn+5+kg0/vxvTKRDFLLtZATmqDUNaEJnB6jupP
         NsrI3IahWGBOd7O2uejBupS4+5f7ksvB+Q0suojQ42pXn2IPi6bDietxXlfwTPhwGbir
         /3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUIQDYoC79RQ3a/9nF3CvmbzUyQtyfDcbZixFP3nM1MPrLnl5gpgx5yhFSZf/y0z5iCp2siJb5f0mewQ/1+@vger.kernel.org
X-Gm-Message-State: AOJu0YzM7Ao7E8bk7GDBLZzhCh86iCcA3injxCN0TvXpK/OeStFTdMOK
	HRnUlakCEQtjHDD2nJZ1/+9UHC4wisTnjeaVSbn56SGbm/Ex+5O7Ttnxtp17bZbzM2k=
X-Gm-Gg: ASbGncumYwBlQ4Yk21nnUQgV65HGfmeHO9J4/fIovLiiGROzoas7R8wGrxFSM905ID+
	fwVZsolxSHC0jcTqOq5IE4LmwS0Nxw4igJ12rzbVRleURxWRnA0be8P63bNGJxoKSaDZj4C0TM8
	FlkQPhmboVgUkzgyiJLaCyHhv30WRmns/SbblsvwYVq0Zy3i7C+hztz85/ox2G+CCccz9qQHSqp
	M9/oojkhpt9vvkXZZQTay/AkZIrRkdMS6qD+sya0K0to/UozM23p3ekerL8MEtxDzF1kO0UGZPH
	dnLjt4Tcmu2X1awwxyxNUEzCq32nnHGpxxFVBK0OWvr9mmfVGVqTHgEYRsRElMXEXwtzcHGjUWK
	QcOrHrf+mmR2D+kt4ww==
X-Google-Smtp-Source: AGHT+IH2UM0b2DoB2jVzXodkJqn7cNt+S1+id56qPKU1HujmDmjEKCztQlK5G0qjmChMEW9QPceS2w==
X-Received: by 2002:a05:600c:4b19:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-46e32a23f8dmr637135e9.32.1758725527921;
        Wed, 24 Sep 2025 07:52:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:35 +0200
Subject: [PATCH RFC 7/9] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-7-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LQ6GmHpD/iWFySPYiWNs4nA4WFevXV0FDAv5KxrY5e0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGfry/qkeWFwp5USy/SVwuycKAk3dAKJzbt
 0gOWPScWyyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 cqo4D/0R7BakY98Bieuwd9AXA5Zz3ZPzUXUHxuC407kcVrlX4alt2GtuQcMPCAS4/e6+vlNQRNO
 gDZhb71YkyFGZxgwFPPt1MxOMN/buFbmL3CTvTWwOOPx8TaKDO/whWvLq8R+u16ltl2k4g2zBzP
 gfrA9rXzjl/jkf4hjCnRDeXFDTKKg7X4eKOOX/UTX8mTSKBwbCRXQMza5ygAvvl0YGoFM2ZgE4l
 J/cWLJSWqJU/9P12SYQPt+bsmOhXSvp5FYJ6QBv8+6fdDWD54kBEktJRBdShjrK1pVoiiCRd01F
 2S2IRfykO5jZiju4Bvo37TSestnnupumzoC3I+FzdsoSC9qpOprXBct1IPk7kJk+ndtID3zOioY
 sFR2bORVE+q0qo4jHu9ETc1ffR0uGNl0hFjEoClR2HwlLr3YIaLbHR5FtLXB3erXC5GyPr7JfTN
 dusEehQcGYYM4r37bWusqOhdg+aqvCdwn+i9UXVYwnXKR2mE1+VeRB74CDxm7MqqU5VO8AJxMoQ
 jFIen2jZnt4Ch30oPMyaSA/TcR659d9+U9+0c6GzqkiGwufduZoayKA9Odsny/iIfr/bzGYLrJb
 l0hjNAXa8pv4FcvrvTkFXt9nGiemMn/I6g9khHxqM7bvzGsmU+v3ojYDcKsNw21/T0dEgFXkSUF
 OM8RQivtzHHfEkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some qualcomm platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -316,6 +316,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

-- 
2.48.1


